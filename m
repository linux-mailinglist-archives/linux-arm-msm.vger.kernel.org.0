Return-Path: <linux-arm-msm+bounces-106819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNP6MrZ7AGrJJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E860503F7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FC0730523E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDCA382F3A;
	Sun, 10 May 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPDU2O41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD6367F22;
	Sun, 10 May 2026 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416326; cv=none; b=Tq/5OPJrn99laUcVn2KJjTYCk28Z3aQ+sR7FFBC4avr+yzLdvkZfr1666W8xfUe4FVZHcC+of9806xkOicIusCmjzA93768NQaVIpKcPkuHJ8u2o5vgP6iyHtjZI1tTSbfAOzD7ETElG35XPJgE/Xy0pChKNgP4aUp9VcZbOZzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416326; c=relaxed/simple;
	bh=2xrDAErknkgfrPVt6hn+P0yKo3wEo3JqNnPOb5FLuI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F6Kbw/Qo5L5ljBCGfLp5C1UOk2tuOIVQ95SxFo6Lb3ZgvmzPJRidbH2BtLGX6otGdDwfg2dkjynV5Y38BUxR5RdsGSZfkQJCTJE4AbE7SiQ+5y4i2xyA2ZNRh8FEzbTYzajteKfxr/ENakOSAZRgSyFUFbsi71opjbv/oHgsxpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPDU2O41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B458C2BCB8;
	Sun, 10 May 2026 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416325;
	bh=2xrDAErknkgfrPVt6hn+P0yKo3wEo3JqNnPOb5FLuI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EPDU2O41RsVtenbBzaM8WOVXvnx6YWUzpN5RNBUE//RkgGZYCAz2hxxFh5+9SbG/1
	 CRT0SRKO+7JdiW3F3itYspDNwG5P4ob3JC5VJT5mQEma3p/yKT0rxPvTqk9QoJbA1b
	 DMD+vavSVilmgoaDdNZPsGiqSVwqaw9Q5weNhw+p1kjz9nNP6lEoEhPNlw2rKP0Hqe
	 3QgluwzN/AB5LqOj4qDASxf3ztTHz+cPGhVEUcormBjShleu/la3AlXLE4BrdBFt7G
	 0vCJeEetUMRPubPonfNZD2ZxI/Rg6s8BT6MkCQhtBDFhld2JF17jVrljwm/xVknMzy
	 3A/AzHjKts9DA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
References: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qcom: m31-eusb2: Make USB repeater optional
Message-Id: <177841632265.434434.2740659280870105510.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 3E860503F7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106819-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 02 Mar 2026 10:34:46 +0200, Abel Vesa wrote:
> A repeater is not required for the PHY to function. On systems with
> multiple PHY instances connected to a multi-port controller, some PHYs
> may be unconnected. All PHYs must still probe successfully even without
> attached repeaters, otherwise the controller probe fails.
> 
> So make it optional.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: Make USB repeater optional
      commit: a62bfbcf2db4ae6eb7a544a40b1075a81784ea41

Best regards,
-- 
~Vinod



