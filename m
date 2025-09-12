Return-Path: <linux-arm-msm+bounces-73235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181DB54470
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64EC01C84239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731EE2D5436;
	Fri, 12 Sep 2025 08:04:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04982D4816;
	Fri, 12 Sep 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664278; cv=none; b=P7PCSMirqpRHBvnHxs4E/ph/yQVXYnDm4xuzXBP4b+LwjjRym4n93RGnn9yY0K5kp+0SuNNNdSuwqBO5BIiXDKQ8bSUOaizcUfT059+5ew57BbgUi+5iuLRTlY8rkvifAGPlCH7/cyPQdtqMTiIfL71Jn4aUAoq8mxeKVLeXabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664278; c=relaxed/simple;
	bh=gKHmOFdjteVQekqifxHYJRIaWWSXQL0vXGjMWK55q9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jfLxO7BOH2Gm6eVBwAaTSszEbVaewztPH9fUIgwn5BTGoHsTqvwQCSIzhQB3LoQtFm7Rie12cECP7n1EbNQP/+3td2CJ+UDHY52fFzsQ8Kr09O3o+D5qtExfSYrSIzfKCZVfxouyAyBxpFtZaEqXgfSv5vm4golz81C4b7OAANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757664229tfcf1c9f8
X-QQ-Originating-IP: MOVI41uRyW5p5cEv7SezyJeQOa4kceDau5hySL1MHYQ=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Sep 2025 16:03:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9888739823542151369
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Date: Fri, 12 Sep 2025 16:03:28 +0800
Message-Id: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDTw2gC/23Q30rDMBQG8FcpuTYl/9MOkYHgA3grQ05zTraga
 7emm5OxdzfdVBC8Cl/C9zucnFmmMVFmi+rMRjqmnIa+BHlXsbCBfk08YclMCWVFKxUfAU/AcYT
 10PO9A06EAQmiJudYqe1Giul0JV/Y89MjW90uR9ofCj99v2wpZ7jyi+r+pgslnWmFqMvZWC55K
 YTXET/SkTAt55T6UIdh+zAP+keQUhitrKu1VVpYX4xjeqO+RsCyTfqE5ZBzvT/Ae1G2v9QOprC
 5QqADWOygQYrWuzbGznStxahapxGcAK9dbN3flgkiUoPOe/QaIMrOdo1RJLxSxmFjvGpRBjO3O
 sjE5+lpWlQ9nSb+87dsdbl8AWIuIX2RAQAA
X-Change-ID: 20250912-radxa-dragon-q6a-eedcdeaf3e66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757664226; l=3260;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=gKHmOFdjteVQekqifxHYJRIaWWSXQL0vXGjMWK55q9w=;
 b=CvTQMWVHz7kIwgpbp6habsPrzjCjPBZUDfuKuoNsSVkv8TYXKlPNmdVEKDkxiQDqhVbT5mE1Y
 VsGkzNUvbqIDxDfXSMZ9VCzn1x46/SoMQYrdH4B+zuZ3v07e25zeHA/
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: ODcDgdcDagQKlwOBbCUbkvgXqPT2NjbXmXF+0hZXoTzv51XOElcsRywO
	Anpo1Vh2AutDVTyEqLJ1Pl9yfpTz3NBZhHwWgw27oBFPczsTWVb9kCNnbvj9Z6bSAwNpz2G
	+/WFrYjQrnvLLqqci8xOrKjvQSn0q9ea3lT6ldsQ65vUzDIKYWziOMbfc34Qu/EmvhjfkBt
	d2Br759ChXWzRX3hqcUDxOliC8bACmTKw8ODFI7RZQFe2c0zfVoscQcQfpvr8pnF0LTgyUV
	0tELI7Y6YOoyACVjhB+M4e+nGEF5MKgRGdcHdWlwmSd+sIwPv5qTisLpvlXoKVMadMn26WR
	DKq9pTvpYmQsu1lWRUsc+U4XCSfnJLvidDWxANu56RsDyyEVf84fKGyOOZ3Hj/I7bVfLn2Q
	kTt/5Dfolv8EHhdSSPdJ57qeCrE4I5mTbOowtVna408R2LY2YYM60DQQzDZxW1cuJT7H/3y
	U4ig068s0EJQt/wmEmQuwzonGLa1NSOE7P4WVGMvviA39eOmg2OOVuHwUEGowwATFwOGrPD
	C7HGhzDVkvJKXP8gAF/5261T2sKsi/DZrhzcFrNziDbKNPNuc+96twPiVP9hZrTs0b7yQ3s
	jawwTswCMh8xl02sRF4awY6jNe8WRGmWIwK2p1AaCmVA551JcGl/0lyIudnlnzQlgLFHoZR
	/7QHwqFa4jUeobqcvA72W/j/Sv+3ZJiUMEFOMUdCTDcdNbNpWrbx6KfmujywbKEudJfQuSH
	FNmBA7jFtaooJQBb7BdLGJE7+az4Ffjd1dni00m1xCaWf34CoKxOm/INrhbUv5L62UBacHW
	cdb7LaAKY73EoLqRm8cW8Trs+IiwyzN5CEnNnHlzzKjd1lY7aVs0pn4oRaEHeU/hmLbXG8e
	XYQTG7n6Nmsx4mwS2C/p1Q7+Hf8jSAs3FyT5ATDrcEOdbw6wkzz2LuJmNap9nCWSDD8WwU8
	QQfjjiuaYEJabbXgqpTjCjAdzkaT5QDOv/+twa/R7PoG2ZDCM7r9Ft3VGjr4Qna981WIIuT
	1N+dTm4EbxewOQ1fDx
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
computer, based on the Qualcomm QCS6490 platform.

The board ships with a modified version of the Qualcomm Linux boot
firmware, which is stored on the onboard SPI NOR flash. This allows
booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
supports replaceable UFS 3.1/eMMC modules for easy user upgrades.

The board schematic is available at [1].

Features enabled and working:

- USB-A 3.0 port (depends on [2])
- Three USB-A 2.0 ports
- RTL8111K Ethernet connected to PCIe0
- UFS 3.1 module (depends on [3])
- eMMC module
- SD card
- M.2 M-Key 2230 PCIe 3.0 x2
- HDMI 2.0 port including audio (depends on [2])
- Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
- Headphone jack
- Onboard thermal sensors
- QSPI controller for updating boot firmware
- ADSP remoteproc (Type-C and charging features disabled in firmware)
- CDSP remoteproc (for AI applications using QNN)
- Venus video encode and decode accelerator

Features available with additional DT overlays:
- CSI cameras
- DSI display

ALSA UCM and Audioreach topology patches are available at [5] and [6].

This series is posted as an RFC because it depends on several other patch series.

[1]: https://docs.radxa.com/en/dragon/q6a/download
[2]: https://lore.kernel.org/all/20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org/
[3]: https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
[4]: https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/601
[6]: https://github.com/linux-msm/audioreach-topology/pull/24

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (2):
      dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1208 ++++++++++++++++++++
 3 files changed, 1210 insertions(+)
---
base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66
prerequisite-message-id: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
prerequisite-patch-id: 257564b609217fda19c9f3424fcd9f6e2ce3ef3c
prerequisite-patch-id: a8f21781f3bff140260100b74041752000c06000
prerequisite-patch-id: b46127e2433ede17cc5e1a012f58041c6ef97b13
prerequisite-patch-id: e8978c5a30373c3ff312b2c8720f586c389f18f8
prerequisite-message-id: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
prerequisite-patch-id: c7a057030b78afbbb231280de3765294c006c6f8
prerequisite-patch-id: 56011305aa35e4c64fc7d63950764807cb81cc4d
prerequisite-patch-id: c3d3b313ac6abe4ec10fd820b6a9bbc63fdbdb82
prerequisite-patch-id: 63ee94d0ccd40f60a98b0004d627ad2e7b440d25
prerequisite-patch-id: 392e8f1902571e5035d5af72e40dc474b5f1b274
prerequisite-patch-id: e38fba722bdabc02ba09d2dc51df7010dbe28168
prerequisite-patch-id: a3ca5dba8def5769ffb4b95df2963da60a736f96
prerequisite-patch-id: 4c0fe8d677d73aaf1b5b842e072246d84729d1c4

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


