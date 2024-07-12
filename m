Return-Path: <linux-arm-msm+bounces-26037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B892FA63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 14:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC1282821AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0294616F271;
	Fri, 12 Jul 2024 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="D48QSqsy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WVYfUH4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47940282E1;
	Fri, 12 Jul 2024 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788020; cv=none; b=DK8vPHi3v4V44JWGu6X428hcmQKIC00dvyuMT80YBPtFIwRE5EVN3ObCKZ0jabJ+U4Iy+XLoZsQNnejyEDGcf8mZTqLhO5PTgsunHqLPPRIxb/C0g/WlG/jUCL9PGk+g7AUeB1umcSbGFmA3OMV9OgfFRB+1aB2GrXQroxfTu6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788020; c=relaxed/simple;
	bh=RTwsMTpv+39YHJSqgLNNKsZodrP4Xz+C10P6S5aw6AE=;
	h=MIME-Version:Message-Id:Date:From:To:Cc:Subject:Content-Type; b=bM806tVKgasfUdwRhSAPIYfNPsWQtOcFMPqp6zwVRNxF8zT/CbS0iJhY+NzrqsYez3Kki0aItVyIm6tsReAN9nly24Vv7c/N4xWAH8dsqxMrjd7gTjVPiNvRjTqiMUtsNnetK0ZyM9vk8jyv8msNlYTG6jkiCItcVx2XqiSphfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=D48QSqsy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WVYfUH4W; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6676F1144E7F;
	Fri, 12 Jul 2024 08:40:18 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 12 Jul 2024 08:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1720788018; x=1720874418; bh=SG04qtm94i28kaEQzES8ZmtebDGpYzFA
	d5D94g9Ipos=; b=D48QSqsym+ZR5bjQG3QlacRslej3NRJ4MXM1xZZxvOuOuduX
	CwDxcFADIcltavlPkBlgjtQ9i17isxpwOmlj90QK6Y0iwT02KCULS7V1KW9Ycmdm
	lcCIc+FGiqXJsYEunu9KEWQ/rw+mVcayHvz2D59dYC1BS+8KRnYwQcmrXPIyAgjU
	awrX/Vvo0xBYsg60tqF64Hc+VRSy8rJ0o7YGD2ExYzLMu3P53ugWrvh2bDwel3q5
	nDxG237IOAftOEN1VdUYDtP1DVhYGXiHkANimR2KCaAIZcCkpFP2w6DZl93pYPqN
	zbxgLdLRifhe4zMi/wO7Nm5U6Y7sNKWBmPi8ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1720788018; x=1720874418; bh=SG04qtm94i28kaEQzES8ZmtebDGpYzFAd5D
	94g9Ipos=; b=WVYfUH4WUg6bxse3YO0ZW/zcm+dpvNfLOSH2f3t2UoSKBUor136
	vY3IdYTAEGbAjLnqTeerMw4m+ARB8C5zIsOGxywdWtmsLB0EYR2zuzwil5fpTexx
	ajJAk89f5zwAKTAyDP4YCTG9mFr0R+N07PoG52Z9a21jO6QPxhJMaq6INZOW0QOe
	ermMYZHyHSKH+rt2r2G1OIXGmWAOChMnUSOqh0spSyxKFFQDG/xxsaxAHie+AKh3
	mxlqWDppRnkZ6/XWkhKDP1V5z8GBelCgjizKnNnt/fr6D5AzhkGRq1vt6pU1CScf
	bSNyeOgr2EEGi+vdNJWDLfUh2Tvnh/76kxg==
X-ME-Sender: <xms:MCSRZgzmoKHBxQQq92DMeMXSa_UeXM9lpICXTB7mSCyRplKazBu7Tw>
    <xme:MCSRZkTXNiMDaS6KNfQbRxUbnlUlLaL67OslZnhMJoGPeabODRJQAPTgA0LAFS6m7
    f6fri39L-J5QsMyBVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeigdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeffeeuhfekjeevtddvtdelledttddtjeegvdfhtdduvdfhueekudeihfejtefgieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:MCSRZiUY0aVC8y69nYfnKEmsfv3Ao6H0qDSIAUkzVip_WtFbKsUbWw>
    <xmx:MCSRZujxtxItYtzfBafhUAiszftc_mrZw-gctYj7kGFPwdaYOIl10A>
    <xmx:MCSRZiA0zKlIvIm6H1z5HRcmldiZ5G5eZyJ_hm8D4p7girCB1SZZiA>
    <xmx:MCSRZvKNLRGfRxzesQt3WZYmPTsMPLaC43MLyDQWn913r6B4ERotyw>
    <xmx:MiSRZk3mg7S_fZfLtoWfUKhrhaa164tDF6r7TulVhyJN44pqGE93MyNP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7C262B6008D; Fri, 12 Jul 2024 08:40:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <00d2b2e8-b352-4dd3-a4cf-47f0ebff5e3e@app.fastmail.com>
Date: Fri, 12 Jul 2024 14:39:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, linux-arm-msm@vger.kernel.org,
 "Chunyan Zhang" <zhangchunyan@iscas.ac.cn>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] ARM: SoC fixes for 6.10, part 3
Content-Type: text/plain

The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-3

for you to fetch changes up to 6fba5cbd323e013079b304489629a6b814110512:

  MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY (2024-07-12 13:16:09 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 6.10, part 3

Most of these changes are Qualcomm SoC specific and came in after
I sent out the last set of fixes. This includes two regression fixes
for SoC drivers, a defconfig change to ensure the Lenovo X13s is
usable and 11 changes to DT files to fix regressions and minor
platform specific issues.

Tony and Chunyan step back from their respective maintainership roles
on the omap and unisoc platforms, and Christophe in turn takes over
maintaining some of the Freescale SoC drivers that he has been taking
care of in practice already.

Lastly, there are two trivial fixes for the davinci and sunxi
platforms.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and add MHI

Andre Przywara (1):
      arm64: dts: allwinner: Fix PMIC interrupt number

Arnd Bergmann (4):
      Merge tag 'qcom-arm64-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-defconfig-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-drivers-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'sunxi-fixes-for-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

Bjorn Andersson (1):
      arm64: dts: qcom: sc8180x: Fix LLCC reg property again

Caleb Connolly (1):
      arm64: dts: qcom: sm6115: add iommu for sdhc_1

Chen Ni (1):
      ARM: davinci: Convert comma to semicolon

Christophe Leroy (1):
      MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY

Chunyan Zhang (1):
      MAINTAINERS: Move myself from SPRD Maintainer to Reviewer

Cong Zhang (1):
      arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer

Johan Hovold (4):
      arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
      arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
      arm64: defconfig: enable Elan i2c-hid driver
      soc: qcom: pmic_glink: disable UCSI on sc8280xp

Komal Bajaj (2):
      arm64: dts: qcom: qdu1000: Fix LLCC reg property
      Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries"

Konrad Dybcio (2):
      arm64: dts: qcom: x1e80100-*: Allocate some CMA buffers
      arm64: dts: qcom: sc8280xp: Set status = "reserved" on PSHOLD

Krzysztof Kozlowski (2):
      arm64: dts: qcom: x1e80100-crd: fix WCD audio codec TX port mapping
      arm64: dts: qcom: x1e80100-crd: fix DAI used for headset recording

Tony Lindgren (1):
      MAINTAINERS: Add more maintainers for omaps

 Documentation/devicetree/bindings/cache/qcom,llcc.yaml   |  2 +-
 MAINTAINERS                                              | 13 +++++++++----
 arch/arm/mach-davinci/pm.c                               |  2 +-
 .../boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts      |  2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                    | 16 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                    |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                    | 11 +++++++----
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                |  3 +--
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts      | 15 ++++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                   |  2 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi                     |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                | 13 +++++++++++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                |  9 +++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                   | 10 ++++++----
 arch/arm64/configs/defconfig                             |  1 +
 drivers/soc/qcom/pmic_glink.c                            |  4 ++++
 16 files changed, 78 insertions(+), 28 deletions(-)

