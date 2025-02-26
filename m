Return-Path: <linux-arm-msm+bounces-49533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC14A46314
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345E8170763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E3D22157A;
	Wed, 26 Feb 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="HOGU+wHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75821C9E7;
	Wed, 26 Feb 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580672; cv=none; b=orXW7ZFbK1vsrxK2rAODIOWio0mCBkX0vROJ5galhhiKMI+VEnE+lirI/HdXNC0g8RIm9YX1oOoGXyCR8fWRLd9duzXZ6933/zbA3s4LtkqgnxE3EwiftZNTWbocw6+TfSfYeuNCrW84tGy/w3Svrjeo1Lc6czMLZLr/vF7TjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580672; c=relaxed/simple;
	bh=K179TIMBNAwzzei+3sFPo1T4KrBk2+3+P31OITHT+To=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEYdCxmfy3/HQQYyflktWqyt8AUvvHqd/OYU2U0AGdffEziQMBKgP44LKI3e/kLiSKykvETg+2gxGLbNWP0ZzFCoS6LOiPPQG3Cm8XTzjwqjoRywv3xlWSwEC+epDS2lJSdVTdbCNi6Kf50RkmUVld6OZMRdlcyJSJun/6pE/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=HOGU+wHP; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740580228; bh=K179TIMBNAwzzei+3sFPo1T4KrBk2+3+P31OITHT+To=;
	h=From:Subject:Date:To:Cc:From;
	b=HOGU+wHPFLJESrVdUnB9KSg/csDyWbhEn+L+EyqF3BqTzLQxbcfsrQrWEyQ1Hhypy
	 CpOYxtfn8sWvFs4Ap9LrJ6/bqYvqqDOxLCt5+aSRZNruHdRD++JXFjgUgEBwQQoQAV
	 RMhKg2uxW93pe2Wb8uM76jZ3VoveNGOnU6YQB7E4HhPsrrXA1MQoxMziZMHG2EvMhN
	 3+GPVSV0IJLkIMx8npTJ9vo88CHUMz9V7QeAckB2aHryeXy7zJK6qgWeGl6kbyYNjF
	 CrLb5dJSWAj+bkQ+jTujuz4aknGpKeRMPHxADRV1cxorDHda9ZLVtXHOCDpxH0Q52Z
	 7OL9t2V5WOiDQ==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id CB6343305;
	Wed, 26 Feb 2025 19:30:27 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 0/2] {vision/navigation}-mezzanine: Fix overlay root node
Date: Wed, 26 Feb 2025 19:29:54 +0500
Message-Id: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIlv2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMz3cLk/FzdvPy8ovz8Et38stSinMTKYt2ktFQjwxRj46RUi2QloN6
 CotS0zAqwudGxtbUANK3d4WcAAAA=
X-Change-ID: 20250226-qcom-nonroot-overlays-bfe21d33be8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=K179TIMBNAwzzei+3sFPo1T4KrBk2+3+P31OITHT+To=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnvyWAvw50tbJuC6rZ+1/kX5iibwmoEN+6I3RK8
 4Glgqxn1/6JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ78lgAAKCRBDHOzuKBm/
 dfh7D/4wQom19dboxkdcU8S08u3yposYehNTu06mFooaWgW8QhMX0zypWiHDy/UUprnC4ULj9ZU
 jjCYER5e6rknq1Z9L3/PnNSrCwPQlq/8qNbFhku62ulXBJ5xo6383FiyO/YXPs9XpEYGAc9/bOL
 8lRTz/4lXht0BqjNb+OnfMot/WJJG45olteLQJDGg/M27g1yTILnAe3nE1zWwuva7+ZRv9Z4Zsw
 FaI0eXSQUYxD18PWM4Tz7tg+Iv2Lu+xenSGB/UGiX8HPuolYIBejJ5pi0+9/KpkwQoy47nYR8KI
 6/NX3u7I2Boew1DX+59qzswdZhvPtOpgdx2PW1EB8hpemOQVL3TSMMsO9iHA3ticIrTs5YSuspD
 97RYEByTLOKSnMH/PBXvfU4GIUSL+eU2jRE4m8MuF8yjk53d+yRB/XjPtSRXxeZxg/FQReaXH1/
 am0HsYen8CldcfUGPUsa8OuqP7lwiwC1Pa5OMiDoxK458GB/21jxP+26BGf+4HeIgnULULCBj93
 uzLCWE5bfjUqTmIyhMIW/mBbrf9aqt1lm1DooFJ3ddMSuVi3QEC/Pv0kxpNrPoPGytoo9TCncTx
 CbtlRlPQ8GR45m4LBP2bXNHKnSNulNayFBvXTSV7lU0m3KQumw7He2MpKsDaS7gmMSv6DtOWL4A
 xTksbKTKWid/Orw==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

While considering to propose WoA EL2 dt overlays upstream I was looking
at existing overlays and noticed that some of them are broken: they put
seemingly meaningful fixups into the overlay's "/" node, which places
them into the overlay "metadata" itself, not into a fixup fragment to be
applied to the actual dtb. This series fixes those two by changing to
full path "&{/}" which should work as it was initially intended.

See demonstration of the problem below:

$ cat base.dts
/dts-v1/;
/ {
	compatible = "fake,board";
	fake,value = <42>;
};

$ cat extra.dtso
/dts-v1/;
/plugin/;

/ {
	foo;
	bar { baz; };
};
&{/} { whatever-comes-next-after-baz; };

$ dtc base.dts -o base.dtb
$ dtc extra.dtso -o extra.dtbo
$ fdtoverlay -i base.dtb -o combine.dtb extra.dtbo
$ dtc base.dtb
/dts-v1/;

/ {
	compatible = "fake,board";
	fake,value = <0x2a>;
};

$ dtc extra.dtbo
/dts-v1/;

/ {
	foo;

	bar {
		baz;
	};

	fragment@0 {
		target-path = "/";

		__overlay__ {
			whatever-comes-next-after-baz;
		};
	};
};

$ dtc combine.dtb
/dts-v1/;

/ {
	whatever-comes-next-after-baz;
	compatible = "fake,board";
	fake,value = <0x2a>;
};

In the resulting dtb foo bar and baz are missing.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Nikita Travkin (2):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix broken overlay root
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Fix the overlay root

 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso       | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
change-id: 20250226-qcom-nonroot-overlays-bfe21d33be8c

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


