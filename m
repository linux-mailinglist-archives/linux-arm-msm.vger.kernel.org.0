Return-Path: <linux-arm-msm+bounces-106813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKrmM+V4AGpZJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7703A503DD7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 647673003819
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7516036657B;
	Sun, 10 May 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJtMqde/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517FE1607A4;
	Sun, 10 May 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778415838; cv=none; b=BQ6/3r+qddPu8xgkN/6FdWBVjuMjtSSSgRzBH0o4OgHmmAJ65HziI7zWDCU6HRL4/kDYN30g1gWnurH07ELQufCcJc0kGOwXca9Rw3xPWLPiuLfwr02BcJoj0B80ql/u64WQFVTOSyjY7xNZFXZtF9d36Qcf2jwqMIejpBthPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778415838; c=relaxed/simple;
	bh=upo3UVXUcJgnSP3BnsJg9L8IBkk0vS9NZAg91cWPV28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s203yj4x7V6NhPR8h9A9/YaP2Vkr1G1dKtd0iH7SB58MQKfcvx56Z7WpQdaGO93RkEZ4hZSLq9yQ4RVU3TQBPH7A41fsu7flw4G8F35BH/vqRtMO0wbuDFxSLjCcc2GvdxCyGrKEx+eFbmczAkvTcLO0wji4YzBqffz2HNhHiWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJtMqde/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91947C2BCC9;
	Sun, 10 May 2026 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415838;
	bh=upo3UVXUcJgnSP3BnsJg9L8IBkk0vS9NZAg91cWPV28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FJtMqde/sV6yWDGAS7+EaLAEZQU8JewHzcIaq6i/uORT6VWsFOWG87CxEBLzcvwvR
	 Kn0uoI0oe1Jd9dkbnwzHIudtkBETLHN+ildvsXBKkPyx8sIxlUNuSByApIH8B4ILue
	 a7zLeF1+y8uV6tmFQJBRkp9h3mgvx+0VpZhjVsoPO0ZJMlH8znbD08NXo9a7kZBfwU
	 O7RhestpDXBN2djuH70TrpGEgji2ueIjKNgL81YTO5MxBk+GbUOZcU82GXymf2Gfkd
	 FbYgEEyDo6uf1KWYy0FQIjK2akZb41laK4T31F8d4r4QmsF+8EUZdMGcWBGA1m0mtM
	 NPZleg97UVmNA==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org, 
 abel.vesa@oss.qualcomm.com, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
References: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure
 after SM8650 G4 fix
Message-Id: <177841583418.420676.566324838504765872.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 7703A503DD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 15 Apr 2026 16:18:51 +0530, Nitin Rawat wrote:
> Commit 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> moved QPHY_V6_PCS_UFS_PLL_CNTL register configuration from the shared
> sm8650_ufsphy_g5_pcs table to the SM8650-specific sm8650_ufsphy_pcs base
> table to fix Gear 4 operation on SM8650.
> 
> However, this change inadvertently broke kaanapali and SM8750 SoCs
> which also rely on the shared sm8650_ufsphy_g5_pcs table for Gear 5
> configuration but use their own sm8750_ufsphy_pcs base table. After the
> change, kaanapali PHYs are left without the required PLL_CNTL = 0x33
> setting, causing the PHY PLL to remain at its hardware reset default
> value, preventing PLL lock and resulting in DME_LINKSTARTUP timeouts.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure after SM8650 G4 fix
      commit: 80305760d7a55b884fb9023c490b75568d1ea0b1

Best regards,
-- 
~Vinod



