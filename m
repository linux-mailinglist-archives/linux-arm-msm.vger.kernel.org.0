Return-Path: <linux-arm-msm+bounces-50913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89938A5BAC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2763F3A578C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3561C22422E;
	Tue, 11 Mar 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sRPUNWMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524CC1C6F55
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741681464; cv=none; b=PAC8YRKRG1zGfQXKYAzQSWPa2w5ibRb2mRWSJzy2iRn/eCYJha5OJlKQniRLN258Xjguqy4gRB1dz2oJ8uoIIDpz54fC80TSg7+j2OT0wpWtFp+2TF67DQgBrUz066aQ/d9Zqnn7AwITfCeuQSb85cpC5ByGnw52cQcIgOMNOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741681464; c=relaxed/simple;
	bh=xu3zP1HoofD6juWhjBldyocKjaXNqT0I+Ivbyr36UBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PTjWZ1UebH6d7ccD9ZbvI3UYhVs327+PDMEhxVtVXrzZ0Uibe1WJSYZkbHZasFCtBVphxr+zlNduT4SVSYscKCh//kwW04aTk5J0wHUpiGBUHcyXuNQVJxcPsXbq94DqkFcO862tLNJqncS5X33jtTre3XVUGPUMOWGDUp9CJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sRPUNWMS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39127512371so2859153f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741681460; x=1742286260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkuwlZJMUyuJz7nY/CVS9mePyWOIvMtEr4YIIpcR7vI=;
        b=sRPUNWMSVCVA33WWr3T+aN6HEboHPmysl8eDIiLjY71lRrzl9PhVLh6+yEtIYeejjR
         nsSsuNDNFAiic1lg12XPDRxEzsjI79f0/Qjg8KdzFdTkWz1AdJ0Qs9pJbRQIIt37zYGP
         +ns/gnuwHufskOB+rINsa/DtIijImFioQubkppvCV7FvWwKdAE71YwzlJr8d9PRs3yMw
         I3IMrPrw/68wkDm1vNfBnlEAzsoizbePairK6aB8wxZcXXcI2D+UnZ9wQ4ks1k2qeWLP
         XOkOWreaBfvSu6ZH1BhzGQ/B45LXbhh7BqGDse8Oyc93qRHIAKFA2IukarzhsRSMip/9
         JnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741681460; x=1742286260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkuwlZJMUyuJz7nY/CVS9mePyWOIvMtEr4YIIpcR7vI=;
        b=cAdgL83iNSQBI0nZ3XQRqcPfMf1GAQSwoQmXGop5k8Xh+pEc0qF9KMiEVMuBGRjnk1
         4zuqwxHk41ek+OvJTRw27woSGuRiox/kbGKPdHBgvxhTRlUQ89jVEK9+tUEWYuE8FYvA
         0gv9HYt/9ELCdDmVDT4Uwy7DXJjp1ud72AyQWSDk2KRBrZg8PM0MPC2YRlDNXggWDfMd
         U+1Gv0r6FeNHLMFjW4oBbDiMl4eZ7M1dy1FMGeddBLcwU/tJnqfirMwuMpMpx4bRo4sC
         JZHTZO0aAQpfBCB8e0R/5mmSiteA1Vafu+AqW8o+zdR12qtWnWzy6+MR4yKpFlTmQEWp
         jZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY6dYYu+jWiby60GNKOrS3DZyYvPmPn+0Fpb2Tn3SQoRUQEGd2iAXGk1+QqMAdSzmZd9VrU9fU/kf2HBeI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Q2VNHgovLdaKN8R4tNXq8CHgkxfCp9+MeRPgvPlqx5g/BLJq
	HOW7kMbKeKv6mPyv2S7LdOIqXRtmNqDAZg1ThP8VYIQJDJLQOs9+oXI7LBI4ZOHDUPO/Z8v9QTC
	s
X-Gm-Gg: ASbGncsJt2+TgAEGIRn/X/SmAFyGhqcQsybvCLBa6et+vxypp28yd4OvDd2uHpw8dqq
	fu72I13Up6GaU7x5/4VhMjMc0Vban7IiXQwJxpduLubTU7hsoFutibKCvEfx/ifrZHcGj85hB9H
	nydS87FtwmlwQ+Rqo4QddHujgJ4Q/kJ7qpNptNoVbYvVdwVgvwv2GYlMDX3pfNJGboIglIOOEE4
	vpNnUbQe49ukkDZQ+jO9hpD5abEu8hxWIjBTkVATQQGNBnt3fc08ljVCvyrnw0X/R3eYrCdMLZQ
	kmQLTvCmIpeJTzza415uGhRCgsYNI/svfpaGizQkyIMlgWKMbFvETAVNUbjYUwq++nyLg0Zp1sB
	Nm1ncns51Aomqr3j+Qg==
X-Google-Smtp-Source: AGHT+IGcMWouoW5czhBbn4yWMxCe7rFrkdK1wII/1naqJaluMq6AQhQYDYrv/8Bujg++Ac3Li9uWDQ==
X-Received: by 2002:a05:6000:2a3:b0:390:efe7:20fa with SMTP id ffacd0b85a97d-3926c69b312mr3431264f8f.47.1741681460573;
        Tue, 11 Mar 2025 01:24:20 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb5995esm90826545e9.16.2025.03.11.01.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 01:24:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 11 Mar 2025 09:23:39 +0100
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-fp5-touchscreen-v1-1-4d80ad3e4dfc@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAvzz2cC/x3MQQqAIBBA0avErBNMK6irRAsbx5qNilYE4d2Tl
 m/x/wuZElOGuXkh0c2Zg6/o2gbwMH4nwbYalFSDVFILFwdxhguPjInIC8RxGmWne2s2qFVM5Pj
 5j8taygcnJb1iYQAAAA==
X-Change-ID: 20250203-fp5-touchscreen-cc6960134dab
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jens Reidel <adrian@mainlining.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the GT9897 touchscreen found on this smartphone connected
via SPI.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
The series adding support for this chip (incl. dt-bindings) has been
applied on 2025-03-10 to the input tree:
https://web.git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 356cee8aeba90e21c11f46df924ed180bfce3160..35ce9dfca6f092a88d8873673ff57b591e210b02 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1069,7 +1069,18 @@ &sdhc_2 {
 &spi13 {
 	status = "okay";
 
-	/* Goodix touchscreen @ 0 */
+	touchscreen@0 {
+		compatible = "goodix,gt9897";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <81 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l3c>;
+		vddio-supply = <&vreg_l2c>;
+		spi-max-frequency = <1000000>;
+		touchscreen-size-x = <1224>;
+		touchscreen-size-y = <2700>;
+	};
 };
 
 &tlmm {

---
base-commit: 93498f5ea4d0415cb5a95680224335651580cf08
change-id: 20250203-fp5-touchscreen-cc6960134dab

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


