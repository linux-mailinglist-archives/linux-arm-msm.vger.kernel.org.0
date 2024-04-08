Return-Path: <linux-arm-msm+bounces-16734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602089B600
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 04:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B931C210B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 02:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03892BE6F;
	Mon,  8 Apr 2024 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8cwFbQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C663CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 02:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712543651; cv=none; b=UjgEf0yQehxRuxMi6Z5bTxzupaWpH5GlcZ01ShZhq5dYz1MsNUuAQ6lePiqfRSgf+Bzu/hQ5ayQVC6vdPGrkCmEzvJVGyX1mc4N2vC2jWPMvel7m11+vGV8ng8nDHNqfbqlSqGr8VFt9otABbEsby/wnSaUNaOE+olOEdVCovyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712543651; c=relaxed/simple;
	bh=Ert28OT3aAf58lII8YJfBxuxx9CsXW8kB9StD1Pp5Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaSm0pzVgA5fZZz5VDwBPadxTt6Fj/Vkg9GBOvIgY7qUEmV42+UiypB3nTAyXTrn84sC0GdAvUvNmUcm2lcCPN6lFq2vHiyN3mZZHhk4KPMX2p2rA/nhrOIBhlxRHZX0+q+z06Ue+qaJxPxFEicNywu1H0puK4IFavaMFoSwvh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8cwFbQJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d2600569so3855289e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712543647; x=1713148447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwnaaipznVoDEcKs4Me335T76hxHxjEZxfF+WyLdSeU=;
        b=t8cwFbQJ544Fsi2oGZipUGNqeymB/NPZXrcOUPTizqizUvVF2KJTDIVH4kgDlMB5Cm
         nJo4OqMhUbwcuyVBBVlkWhZ2egLtUQDwb2EQZFHYHSi0zJdKy6SRYC4Y5N3sCne6so1S
         VRkaHSJZx2lqfwZBIpvj5AuVkjljOZP4rrl7OszLXtGPbbLRmrjy9CUfbVkZF9NbJ6qL
         a8qSlkRCL7fZ4FmXR2gkmg0ezIU9fy1jLjrJqfbLnwOJkezgJrIUDvv9mTh5GezgsIaD
         bCJHkIqgQRS1Ew55TIXpRkMk2bFhweak46Q4yvU18OT/TV0WLs1gYdlIVd6mn/7e895C
         gY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712543647; x=1713148447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwnaaipznVoDEcKs4Me335T76hxHxjEZxfF+WyLdSeU=;
        b=W0uo8+Fg6GijIQ0ccmj/BzdKqlRk3Ix0iiRtwkT96F5OFeZ6/xXCFqenWGE4iFSi8A
         +QbVogmry0Lq13mTZQCfqWF1JKZm2ERLT47f6nExBkfnIrDWIhVADXprX8JDIXB6KxZL
         BNuhWW2vpn/1RLYcyRYff+oxpz2qM81tL2stTQ5XirmxWoqKKZ6vn5SRnOR8EOj4H0EZ
         Xw5pIWWgBDrLwFNLvCgOD0SqZkag2WuSLsjab54aSSrycjn2TBggRIb6+ocTvvuuo843
         Ve4tbjgkfDWh1vyVlht0aR1MsQLBZUIjHbM7mmdI4YP1ope5O8wEB1WndWLw+Xq/dTBI
         rlVw==
X-Gm-Message-State: AOJu0YyEZzlDctl5xE6OAHAQjPQU5Cgrs/gS9gCkPsUlr8oFuyHVfTaa
	n854eIpFYmgdzK+jmIJu/gERr0CvCkTW50TYJU3XDnWCuJ0u5IDffel476PDFsM6op0cilRugAT
	8
X-Google-Smtp-Source: AGHT+IHnQahXi6fn/dWCWEsFmmujv+vqjDRzrZt0hhNSMaMYnAedMmwHKgISIjUXd9/xS6ky7Ms0xg==
X-Received: by 2002:a05:6512:545:b0:516:cc06:fa03 with SMTP id h5-20020a056512054500b00516cc06fa03mr5078541lfl.56.1712543647279;
        Sun, 07 Apr 2024 19:34:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h5-20020a0565123c8500b00516d58590e1sm943673lfv.250.2024.04.07.19.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 19:34:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 05:34:02 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C
 orientation GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-hdk-orientation-gpios-v1-4-8064ba43e52a@linaro.org>
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
In-Reply-To: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ert28OT3aAf58lII8YJfBxuxx9CsXW8kB9StD1Pp5Qs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE1ebY0lkp98CGbN9OzyJqxqO+bLlcmEkXRGC1
 nGcd0grDQ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNXmwAKCRCLPIo+Aiko
 1bRFB/4sVdv5bvMgsO7e1xKi3duio7Heu9/JygamxO3NYnLAEoPUl9KfaX54V5RHmCC7r5sgz50
 up+vpdtJtf+y9+Nx3hS1s8vs4OA3uGwcZ/uYXrx4ahWOQMn72nS/VqBuHIu337UYtNFPkjyE1nP
 j0Ml8o4s25/nfiHVJYYXM2xd8wyUUhXyuc43docVTCw8OXbFfl1KiNrnj3uXrzcuIZfpHhxIwkJ
 hpb5AwNcIjkN6wjuuPkgALGoIB0KDcKgM7lFMXRmFQgkyI5SbL8KQIbK1XU+EJ1Rm6Tlf74IKJR
 8gErMQaxV6CZG3v3HBZ0pd4e2KHQFK0G0q7dcK0QnfYgo4p5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define the USB-C orientation GPIOs so that the USB-C ports orientation
is known without having to resort to the altmode notifications.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 6f2e1c732ed3..6af99116c715 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -51,6 +51,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 58 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.39.2


