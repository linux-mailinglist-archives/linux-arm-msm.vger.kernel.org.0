Return-Path: <linux-arm-msm+bounces-98575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NJSKp9ju2lujQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:46:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8F2C518D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B878301E7C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5241DD889;
	Thu, 19 Mar 2026 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOfdO9+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBE3405F7;
	Thu, 19 Mar 2026 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888413; cv=none; b=k5QLh6MKUUu+6/eFIjYgWpWGmp+7Ih37MqoG2eG/kygSJugocbQULUxJCT/SQOMiuLG3gGIVPP3Ofuq+OVOhu95SSZa4fuJdSUxHOE00uPN/pY70sNVr1KnMd5F6ofPAeAXIQnRqoS9gmfSD4wZ06YbA0Dy4KGWX3lznkyxMga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888413; c=relaxed/simple;
	bh=cSRznnxl3PGDYh3FNx4h+d1Bo5840jW01Bbk/TaLyWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPH52fTKL9KLyE38flLus4zxoV1LvDTZiy39EuRX+EsG+12TE9mwqQz44Y0+BSvgKj1ynYBSaCqGoTQobqmiZEnfFAKiuNmjFKJry02g5N1QTkNCLdZZAjm9/e9MJDjl3slIJebV2Eea6IFcV5H0xSYNKzkmw3HHg036XOVecfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOfdO9+p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22F9C19421;
	Thu, 19 Mar 2026 02:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888412;
	bh=cSRznnxl3PGDYh3FNx4h+d1Bo5840jW01Bbk/TaLyWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WOfdO9+pg7msJlFQ6zR2xCOcYaeoslX4tPhZQAMzsZE4jbvE93WGERpFNhMnUwaL5
	 cZbAbPaEsxv/IIeL4G+E1jwGB0Ne6HCetsAXE1sod16S75MWHB/78l9AOEVBlVvUZe
	 E4ciiCI2m84nOpsoCwCKAUzBq7Kf8aIpdRTTxeUUM3lUa7mipTTf9AggtaitxsCLey
	 NehxfKSUBx3siJbHFdj9c7FssrGBxNeCFC1T05SmXwoIavhK4U63CzDJ1pvYUV4kdY
	 k82m+cK8N91ZLINzIHOVdK5dm5lekM4/qDNnV1TdPQykr/VI8n2C4luqL5xC8OWeD8
	 2KgquKztIsiZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: socinfo: Add PM7550BA PMIC
Date: Wed, 18 Mar 2026 21:46:40 -0500
Message-ID: <177388840376.11529.5729147505712785971.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-qcom-socinfo-add-pm8550ba-v2-1-2f9171af0465@oss.qualcomm.com>
References: <20260318-qcom-socinfo-add-pm8550ba-v2-1-2f9171af0465@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 44E8F2C518D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 19:25:06 +0200, Abel Vesa wrote:
> Add the PM7550BA to the pmic_models array.
> It is one of the PMICs used by the Eliza MTP platform.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add PM7550BA PMIC
      commit: 47b8c61eab8f25b16b5aae90f3991abc6d56d712

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

