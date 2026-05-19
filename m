Return-Path: <linux-arm-msm+bounces-108447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKAfNGRCDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:58:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3269A57D060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA0231DFD9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5589632B11B;
	Tue, 19 May 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ud/kidhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323DC32B118;
	Tue, 19 May 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187419; cv=none; b=Us2CdtDwCJeTRLVOS8p8qgXEhXJkH3nRHw5QuPd8DYI2Fk0DCTxdNVdq2QZWRyXjHe4hcqXh6FDQYgeQkbFJa0Hd0c9/4SrKZYiQ4fx2bGjq3ETZgEcvCy2CyPwO4jLhRFhHhSqcrqcVnrARmePwkV9xWf+SWMxPjnme8x8AwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187419; c=relaxed/simple;
	bh=5Frg4kEBpL1XHsTK+mmKJI3l2jmo9pJ9ot0o29ZBy70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fuAs4ZP8DcQpu6HmamM7VIfiuu6TN3Fj0vsOxFnxPLXktizeBWcYiIexAg7ggj7XXdbTGil2k+TSp+CE4G8RoahCrSYZ6T8zJEj415A7fkb3zekIxU9inuqBHNIz+z4RUrALQp5ZH99z+k4Xks+M0ar4QGiMhUv84DWJ5ZVPiyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ud/kidhP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9744C2BCB3;
	Tue, 19 May 2026 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187418;
	bh=5Frg4kEBpL1XHsTK+mmKJI3l2jmo9pJ9ot0o29ZBy70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ud/kidhP6C5iAoIr81Sgpel3wMbbQXALsE5XL7+YU5/0YK6zaB8r0VsGM1PxVNwJX
	 mUXhx+hDZOMniwqa/g3TzdTvaRRi+uEaQUvgNFfqMxsg7fzSYQp9tSWgWT5wdww1QT
	 XFdACWGaMID4VkhwXto9Q1EwXbI1U/Le7y0tk/CLm3Y4hUIre0QnQz5JkNfwxkg2xq
	 oTzJR8cT7Ea6Cm1cKhAXCuFwJw29qhI61T+qIsP9lx1bNjq+y0joOnHpCf63voGbaD
	 1pYM3GwXQu4+dvdmEugC1RcwC3be8TGN8CdBYZSqtjTFYOKfxDNzrru9fUOLVh92TU
	 O9EJJofbjFLuQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 tingwei.zhang@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
References: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: qmp-usbc: Fix out-of-bounds array access in
 dp swing config
Message-Id: <177918741546.257287.197313135336339918.b4-ty@kernel.org>
Date: Tue, 19 May 2026 16:13:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108447-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3269A57D060
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Feb 2026 20:15:01 +0800, Xiangxu Yin wrote:
> swing_tbl and pre_emphasis_tbl are 4x4 arrays (valid indices 0-3), but
> the boundary check uses "> 4" instead of ">= 4", allowing index 4 to
> cause an out-of-bounds access.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-usbc: Fix out-of-bounds array access in dp swing config
      commit: ea17fc4d7dc2ba6459b1a318962960520201baf1

Best regards,
-- 
~Vinod



