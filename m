Return-Path: <linux-arm-msm+bounces-15043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11A88A840
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B9C11C395BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850C2130E46;
	Mon, 25 Mar 2024 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWrJzki3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D5131721
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374474; cv=none; b=qx3lD9lOkkANMXpBSwKooN9ymC4V/TK5B0Y5MpXbAh5dx/EPQYvpqkfDzi+6uLNmTKbfRmVjwK73ocGT8ylrWVL8ArWsRsP5hyJyDQ+mD66dotNPxua681wnCrGbuNBDKCHc4xMbchzx7hV2CX7V6hk2B0UV6GAbNa+HktVUfP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374474; c=relaxed/simple;
	bh=nMf1WG+zD/X74g08b7umYWJmp6JqbGTrUZ6iLiTrD9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ap79RY9SA0swBT5q7F3ErjY5Q7sbvKgrBiGd/9PLaHYIMgoidsuSErGCxDO9y/1WB5naPHpIB72uOlkYWtgpY+oxtFMH4np3p1PDc770b4rA5Ed1Zbk48M31itN9DRkJz/DF4vLLkr7Ql3drPN5+oV4n+gHT2GAFPoy++SJ3YGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWrJzki3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso51981601fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711374471; x=1711979271; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eTxGOGhr0BwiGOYsGylgWeWRP59BGZREX+842aBrQI=;
        b=nWrJzki3PpjzV2XMqOM1/iLjBeo404ltQ5TRONm7OweDuTthCh4H/n/MswRB4SPzRD
         rci9mCBTKFle13nwyNqQka4oEZrAg4tyUwVa0pjDes1HesUghFLfEB64VemtAb+9IyRf
         +/newokc81kJ0rLocVZ5ZM23u6zRDc+4BcwDKNTIjlnbpRSrEbQDchcL7rpO6XLS6GCW
         mU6WEVt1M5mNpq5kGrIFTToGFyiBZIO7bO10ioGoxxEyFhme9xWAtdH2+b0VlCCFRsF8
         s4kQxE/WeHcBiYpZqvHjcMOAaszGnCzrT/E3DzYCX+PLYLsYVTwnOeZEOPQ3LbOgnksc
         I06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711374471; x=1711979271;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eTxGOGhr0BwiGOYsGylgWeWRP59BGZREX+842aBrQI=;
        b=hbED0ZZJjnLKnimJPk8S0yBgAVUDH3b24qMaDDG/nIYzf3r8u7UV4hIjNCDD02RIxn
         zRK8SWlFXz1HLGLS/7ZxQObmqNqSmi0TE0y8RmQDXfTK41t1EcridLbIeN3OGtVrT+EG
         /Ei/tii46ZhxKut61uuTyXHBcjAduu5ZAIkS95H464oYxs7ZKO8CrPRVQHiHWjMIjryr
         jRQIf0eSvMh1Nj/oo0kEkytpW/BE6UWBUw6Yw1+MgT23tNHAK66bxGvIX7HDo7GekE7g
         xpDtqa9876okNtlCrmi/L+oKtvcpvn3op+un30kFqMKJJnKDQqcHpHcuKboh5VYHRFuj
         Gv1Q==
X-Gm-Message-State: AOJu0YxK5OL0oRa0TM4ySHgIXDAX/he5gdEqg3CNmBVmbsJC4+YXfo/j
	TYGi3j7vXG4b0DjrpcojiZnAbJnHLSP/tJmSUDfzOnbylFOBn49zGUO8UQ3An7o=
X-Google-Smtp-Source: AGHT+IEjpCeqjy8Ax2vgLqRidCnvcSUNUBRVQXWSbQ+VZmOCXPqkhCRVZmJuq0F+SPXH99Pwwo4nEA==
X-Received: by 2002:a2e:9a90:0:b0:2d4:1700:34a2 with SMTP id p16-20020a2e9a90000000b002d4170034a2mr4915678lji.33.1711374470954;
        Mon, 25 Mar 2024 06:47:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x1-20020a2e8381000000b002d2697570fcsm1453340ljg.93.2024.03.25.06.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:47:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 15:46:52 +0200
Subject: [PATCH] arm64: configs: enable REGULATOR_QCOM_USB_VBUS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-arm64-config-usb-vbus-v1-1-d14601f81d08@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEuAAWYC/x3MMQ6AIAxA0auYzjZBBAavYhwUC3YQDY3GhHh3i
 eMb/i8glJkEhqZAppuFj1TRtQ34bU6RkNdq0Eob1WuLc96dQX+kwBEvWfBeLkGvSFlr1tCRg9q
 emQI//3ec3vcDxqP3vGcAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nMf1WG+zD/X74g08b7umYWJmp6JqbGTrUZ6iLiTrD9U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAYCGwlQyHmR1G36XbSiu1u78FxQKD2Xza8LEh
 clmh8fI7QGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgGAhgAKCRCLPIo+Aiko
 1aCXCACpcfddrwnCyW2l1Qv6Yg0wybUus9mtQFofCGUpEbce1TyN01D4OsSr3TE39g+q/bJ+Qs9
 ODy+Q/37E/WZFd+PmYCrSDTi+K5k6DIIMPLJsC97q8ysP27CSoj7wspIVFjvP5bkJ5z/Cp9/8oR
 Vhmz1doHOv/+egVcw4ZGT0I2ObjOW4hvSOc0yFdQclLTJXIb+ULEtui3TvEmCs4uw52ZoB1d0Ya
 yd3NrHqUGe/LHa8CefNKU5x1AD5eBD+lhYf7wmJYNp3dkv18gzaEZULPbs31IptUOCz+tX/DkuR
 nNjiGhI2kxR44CJ4eT+sK3UlTtpHOd0vuyAm5S4yJ4wuxZua
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the VBUS regulator used on Qualcomm platforms (RB1, RB2, RB5) to
supply VBUS voltage to the USB-C connector.

Reported-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6c45a465a071..a86e94aea63e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -772,6 +772,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_QCOM_RPMH=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
+CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y

---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240325-arm64-config-usb-vbus-c0e0554df1e6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


