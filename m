Return-Path: <linux-arm-msm+bounces-97782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8GOERlt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:04:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D0293C6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A820301913B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D481130BF4F;
	Mon, 16 Mar 2026 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mouoewnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22830B52A;
	Mon, 16 Mar 2026 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626569; cv=none; b=bamygLyKx4QXwfGMVsDaMX27a7iSel0bUL5qRLE8oHhHMwRtd7HnxfK4qFvg+VifcCW9218dpKRmNPTUz2+VcNvAKgRV2g6W27YI9j7wwkTDqsW6+h5dGTX9QoVksBnO09nnqDA+ebQhWTJ2Ryj2pA0L+hAdD34a5Ujq8IPFnI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626569; c=relaxed/simple;
	bh=+ya9fc7fV3pYjKPzTNY13bKkeFyfp82SAFepA+p4P9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQjcW/ZExIgMMIHvj2t4PFUiyNqFOiKalkZcrXg2X4FrSuHjR13Kcf8wcID+6C09hu5JBHfdttei1KTSqRjLCRQelMNPLn8QoKEH9WJXdG5JusvBx+8ELfHXeHzYWg11Tngbf414uhxB2isJwh1RaFa1bxiNHwRl0FhBvkJFoss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mouoewnc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8DDC4CEF7;
	Mon, 16 Mar 2026 02:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626569;
	bh=+ya9fc7fV3pYjKPzTNY13bKkeFyfp82SAFepA+p4P9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MouoewncGtTMcbRbcFEZwYSdXdhWN928vLEon/ta9Y8e+XXTzBc4S15QkMVo/AxC2
	 DZLhGoxYEurhMjfFMfK4N+iGF8FxUl48T7qDTmUswcBl/yAIH3RATweUvcTBiKBZrl
	 JI751t2eFMBZ+NCmDp99+VLDBujPdEh732X8Mg2VZAl8ZESiyWyTUfV+1LOWns+sqm
	 lEAnbIcXMOtVLiR6llmzZGUgcxdn/Ky8stb2bKpRaFijEDu2yhDLTMNLHy5Shp5DgJ
	 M3FX17EnEf1Ztg9MxfHpWveMNh4sjWc5DoVjr/mvdw82Zfe/IdDvVCOa506Jt4a9mK
	 oYtxu/xor+sdw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] soc: qcom: qmi: Print error codes in failure paths
Date: Sun, 15 Mar 2026 21:02:32 -0500
Message-ID: <177362655075.7429.15785965469343423785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97782-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 806D0293C6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 29 Jan 2026 20:53:19 +0530, Mukesh Ojha wrote:
> Few error paths in the qmi_interface module log a failure message but
> do not include the actual error code. Include the error value in the log
> so debugging failures becomes easier.
> 
> 

Applied, thanks!

[2/2] soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
      commit: 641f6fda143b879da1515f821ee475073678cf2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

