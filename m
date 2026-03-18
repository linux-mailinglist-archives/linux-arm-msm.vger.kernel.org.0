Return-Path: <linux-arm-msm+bounces-98512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G8fLc+5umk4bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04C2BD5F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64F63308DFDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1228E3DE435;
	Wed, 18 Mar 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCAMQEej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33033D3CEF;
	Wed, 18 Mar 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844481; cv=none; b=LHDmbX7MrTz6NI86PLKmvpoB7XI7qEvxSRuYjRAIHO8+gYcnqcJvdb/sWWMTyBZgV/nE90VPoGh2gl1r2AvcEFJTd+WMusKKt8zYQnf8bG2J6wIO4x6TB6vOa+1NSmTTS0HNkTwSg4r3bk88uvqWiQJ8XtZVDEt17yu+EGmGnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844481; c=relaxed/simple;
	bh=3k2X6BuKqqrZQlInoqY+h50Yhr0eTQtmJrF7/TGYTD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/c5PMZxYoAzKXjiKfjwG02FyhqVl4vKXPIZKSEHy28kkp6+2g0FfFcBjmzi0HlJlMcNO5nVi+Wh/tOUV5sWlkYcQr2Qu3f/alM0z9FYHzSxQqpnDcf/m+JouKAG1HIKSo4gbfi9J/t9c+mc/ER0KgcH3csiVL107h2nynF7mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCAMQEej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC78FC19421;
	Wed, 18 Mar 2026 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844480;
	bh=3k2X6BuKqqrZQlInoqY+h50Yhr0eTQtmJrF7/TGYTD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fCAMQEejvppfFK4CqgUduEh5Ay4oc+vyDEkS9lOELbvWDwbsx4JklZDHXKgoWp8b5
	 eBij33JyM/+/OdPQsUzAFA/5rFnFF8FsM+5V3mbbypOpeBHGeXMlnMZnO1U+qHFKYh
	 Mi8OBScdTVJ2wVqnk5fuI5QRfESXUDOprC1cVDkz3RvW57m2x4Lcuq06iJacM6PzXG
	 bn73QLyi+5aAqFLVWLc2OUPGN06V3NL4JoW5sX42+2mT7VCzKbIVib+X7q6nCIPEAw
	 zdArUuVZUM0g+aQ6PEg+IHVB5wPHvSCPqSjENZj0R8QcnYtjEC/y3O5UWNjIaAQxjt
	 y/6yyNrvXPp3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk board
Date: Wed, 18 Mar 2026 09:34:30 -0500
Message-ID: <177384446637.22424.15413895491372940105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227040201.3700324-1-sarthak.garg@oss.qualcomm.com>
References: <20260227040201.3700324-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98512-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E04C2BD5F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Feb 2026 09:32:01 +0530, Sarthak Garg wrote:
> Enable SD Card host controller for hamoa iot evk board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk board
      commit: 45551bbbafac6a078f771d6da953e09bd18c3dff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

