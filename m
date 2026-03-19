Return-Path: <linux-arm-msm+bounces-98598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO9NIotuu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:33:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B419B2C588F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9AB33037FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817E1389460;
	Thu, 19 Mar 2026 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0tp6Cyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E483368962;
	Thu, 19 Mar 2026 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891108; cv=none; b=cgs6OoSdVUvExIcuu8HJ8Jnv5V/YZLepTXVYe2p5k+QLoNd8fhRSNPxtFyfIFovE4E7ZeYoRLlPoHTUSLeU7ZVV3qXc/y4NKEVOv0tlY67lXdBoHWmqbmt/KAY4g8wPt8nfd1E3ecETZBk/+vY1uBsEKryUafIxVFSEPTn1O8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891108; c=relaxed/simple;
	bh=GyApI7adkx9QEWsmVY5ZYKUDbWRo++YvHWqxhlLDThY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMbgRx4IlP9pMvCRDNZTPQrb8bZSdn0nirIbxn0GE6yvWzlmwzmSLFvKQ/xj81duRV33Hd1gFrEJacWSt2vuQ+C48aTejnH/4qW/xnd5hY9hdw3ZgFc4An0SIjGXK3PLdHbEXKblCixjgVJUyUpZvLI6fwnyM49DWfn7xSVGMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0tp6Cyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A88C19421;
	Thu, 19 Mar 2026 03:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891108;
	bh=GyApI7adkx9QEWsmVY5ZYKUDbWRo++YvHWqxhlLDThY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0tp6Cyvb1ZUD0frCATUnCl5bwE20FO+IbPWP2PNO0BxSVrUHhzZwM2jHEum8zrj8
	 9HWMCCrKlN6iYi9q1+iRBUPjrU6wIopeNFE5U6JOW2cExkvGTVOhIy5wFV3rV0/C/2
	 fEN1b0gBjjiqev2Wo7TtehFKWDQ5iqm5xjLnr2TCcoOOgOzWcq5eJbXqPlNKgB4FZg
	 iO3eYWLqhnf5J1ZN9RdcTDWuiTDUab4CQJd5ZcfXSh3qO1DrMd7t7xlKXyiaWNNEsf
	 G/To7PUwMwip4Q81wBulfOL2ebkJTJmefl7CPLR2rpptxt4eZ57GuALo0KztanBjEJ
	 EXXCHWTn5kPeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Wed, 18 Mar 2026 22:31:21 -0500
Message-ID: <177389107876.16612.12057285635588213890.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-98598-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B419B2C588F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 14 Mar 2026 04:37:09 +0200, Vladimir Zapolskiy wrote:
> The reported problem of some non-working UHS-I speed modes on SM8450
> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
> SDHCI SDR104/SDR50 on all boards").
> 
> The tests show that the rootcause of the problem was related to an
> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
      commit: 7f5542e0ad5396387604697f6d61b86b73e7ae01
[2/6] arm64: dts: qcom: sm8650: Fix xo clock supply of SD host controller
      commit: 75ac6441967e0898e1c6c1268ed5334e1422ed1f
[3/6] arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host controller
      commit: 771157329a63390748a43b91f467f29d3820f108
[4/6] arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
      commit: 77cd9162a37d57a7dcfe5a75296e85a93547b33a
[5/6] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
      commit: 100246cda7b85d2aec0ee2dc0d449397b87d8e1a
[6/6] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes
      commit: eebafbff4c9bcef1d59d892b21cd6573dc014181

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

