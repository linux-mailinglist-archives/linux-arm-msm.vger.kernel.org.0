Return-Path: <linux-arm-msm+bounces-54796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C11A94276
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACAB179D7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1AB1A5B93;
	Sat, 19 Apr 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ihUo21S6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B955288CC;
	Sat, 19 Apr 2025 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053457; cv=none; b=W3vYV+qoTqShJrqGPr1/ngW3tdtX9/mO6/KKiKBYby49oMyWxUKXMVyeoYaFbRYY3sJrkOTCaGPnLEjXl8W21fb9eQWluqQwW44XAD52eDVMEeV6Es/4YWzlhJ4RnKvOnFz4VgEVVqkIA57IsMUTMlhdDmmiL4Oh7Bed6Us2ieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053457; c=relaxed/simple;
	bh=9gW27Mg4OPBbOiumefHzQ7YgVPPsOwNdF26JbOMLo7U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ALv9diBbDeKgsuIhtuo6Px25K9T8B9f1bpOMGFdPw9IN2xC7Z66pTv2AcYCWds9ih0z1N/v5svZTblZJn1N+NiamEY8ur+dhUnGg/rJcvrRoK6uX8UjODAi4bzQzC1BOwoBfacS+JbsFbX668dK/oZujOjYYifKXjxB4aDIJXIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ihUo21S6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053453; bh=9gW27Mg4OPBbOiumefHzQ7YgVPPsOwNdF26JbOMLo7U=;
	h=From:Subject:Date:To:Cc;
	b=ihUo21S6C6i4yBCQH2+N/zNcIIabuXXZQsUgBbab5oZOckCkv5scQJ7oYa2apsf2H
	 1XZFCCS0O/doFofGzpSFN3r1qYj8gIjIeeoGq6QkGrwKYFSekuuEF5+ARq8eJ1Xhcy
	 J9lKaZLcvzwa/eDni2G4d9W/266fLj6XCuSo15ls=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/3] Add devicetree aliases for mmc on multiple MSM8974
 devices
Date: Sat, 19 Apr 2025 11:03:56 +0200
Message-Id: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxmA2gC/x3MTQqAIBBA4avErBvQ/u0q0UJ0qoGscCAC6e5Jy
 2/xXgKhyCQwFgki3Sx8Hhm6LMBt9lgJ2WdDpapWNdpgkDCYvsEQHNqdreBgaq9N712nLeTuirT
 w8z+n+X0/CEmNdGMAAAA=
X-Change-ID: 20250419-msm8974-mmc-alias-893d197dc61a
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9gW27Mg4OPBbOiumefHzQ7YgVPPsOwNdF26JbOMLo7U=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2cG/T+Ct3LWPXz/ScsIOlK1aoryALvFEazYO
 LWW/2VS5JiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANnBgAKCRBy2EO4nU3X
 VhrzEACM0oi23UiC5eIiUH6p1Sp+cC1cDQzeD+2kwV2Rt+grU0XymvpA8aT/tTKYyZYSWEQcItS
 j2Nf98uoEPbSoHetAn7kO0xV2jXy7IGCl1WNAuB9y11EWvm8lwAWXbfVrCa+WQ0gKg/navsi6k8
 otLCIwdvQ7DpwHgmdouqH9BoY64at5ZBU80NQEzc6/PI2d74xMnFVC0oEgqtYGQCA+COE5OA2SA
 Yb8EIZXwwyZ38E2Kig2d8+diz2nN5ZZGdf498kHhrhK5vza1rCD3wINelD2ViZxpaN41NHhxz0+
 zOs14EatWthAHMObGZimbcsy/fp7pp5Kkl0fBhXrgOodam46+eEcf0J6hOXnM+bGDntAJlJkRVi
 b6ywbpD47k4aBVUBBDD/uh0aKWd92ePK1SGAIQ3c+pMQDC4HO2Ybe1UISm9OYJbgi5+tTGHdMJ8
 G1/qdtizhoJ2FKLzbWuhhEmDDwe23/K4ewCP7G+3V+hd9uwStxEvd1ZzipzJYMJa/C0UU8Y+j0X
 dE3GjP1SzoacluIBWAFGf9JWdrrLOXPZY8n7niz/Ix9qCLJ4Foc2Lyer3Dt6dzumOEsOxHjA3tV
 x4lMkrqyLD8o4vKSKH0AgJ/IDq/1rFfOdDBY+aS55z/7Y5dhKKnCA33UG1jTNfa+w7skrDWAr+r
 TFg/FgikeQNB6ow==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0 and
- where applicable - SD card becomes mmcblk1.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (3):
      ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for mmc0
      ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
      ARM: dts: qcom: sony-xperia-rhine: Add alias for mmc0 & mmc1

 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 2 ++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts      | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250419-msm8974-mmc-alias-893d197dc61a

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


