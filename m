Return-Path: <linux-arm-msm+bounces-27244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5C893F393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91C511C21F07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D68145B3F;
	Mon, 29 Jul 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBVcEecN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC9145330
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251097; cv=none; b=ZQM7ncYcZU8PaiBQzz4rqX776ahT+CNZ2eQZaFZGncl2mRVoSxdK9LPHvV2MefTnvNABwZw+aaqrCihymmPnbTsarHgt1XWrPN9v8VywlY1lBHl0SOkx6s6jC9RX0ASYt4oRof8nFJtz5tayJhTS32/f1a1oAFRKdgfZI62HbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251097; c=relaxed/simple;
	bh=gg7IKG25BZAMNpPzAY8WH9TOWG+NP6kO1qp5pVJCOIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVd0PMN0qEQxJYChYzVqgdMRoUJWbJGBYH6kxwJPbmLkJKmMxyHFWaBbMk/jyWlNvax90MswM2Ysft37QpykDG2MLMmD4ei9Oc12vKogUByYFcjVwW6l2yTLQwlBueacRoK094X8b7hHQjPTra2wOIN+i4r9OHgjhGeehRIgRR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBVcEecN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52fc4388a64so5521812e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722251094; x=1722855894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UzxH9S8qQnJj9mJpJ4e8fb+n/tEIztFsCIwFa+yuLs=;
        b=JBVcEecNT+p7tTZP3ejcnKGiJIzu6hl1ClK4iKjQtP8v2FHTtsyCWBiteILVyRnQcg
         Hc/2SaNThhqYMqPCJttSoZCGP93AMaGo3UekyE5WGkaE5xLm3x07Zg3FjfZzEXsT4Fpm
         TycVmGYS004d91eqcD4wfaTMPgJ594cyXaPz9N36LA/FHEqllDWzx6yK+ufQUE+ub2ib
         X7txubewgvEPtd2x1+23UlLDdktFMWQ3QZ0ShbnkknlBSgYAm3dM5S7mj/jf+jKc/d03
         3fuHZoB/1pdsx8ySLt9OBvyMut8WQr7EsWc5tOARkn118GmVUuvrqxBHSKwtW55eWgVw
         5G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251094; x=1722855894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UzxH9S8qQnJj9mJpJ4e8fb+n/tEIztFsCIwFa+yuLs=;
        b=IN9M1met75FDPj8P6nzLG6tELUR9ZOQ2412rp2HtWCjBwm3DS0CtZPFHAKGjJQP478
         H1sJ4jcKp1gj7UQt4Uy+ZRFyOfqlKNdS6PLP9LkMzEqYzczdN1e5g3CpM7X3oTkdhMDO
         0Sr6sw1mtMP6J4vxLUJId9BV9MFeHlDDWtw+FgruV+jU2TbmLxvIaNmKLJGAtB4sOtHL
         MhoTDimiXhgwfiHxpDrct7GIwPaycJMGV+oXdSe6STJB1tBWYgLi5vXIAzzv9uxjzyl/
         J29J6kt71EJgWsEXv4HzSJlBS+NVNBfmxhc+gjq0MzncbJOXUSqV4KdmkJlX0OjOIKA6
         NjLw==
X-Gm-Message-State: AOJu0Yz2rsYg4AxtXbJ5B1InnmULFeB1UWtABF/hi+xx/gb/jlkx70sb
	uVJPtWQ4vQ7OUDxwNAVNoFU5aMyXLISujDSEaExtamYLQua9TssYkRtovKT/dco=
X-Google-Smtp-Source: AGHT+IHrgD0tf+OCVfxDS9u2wm+12oF4or21qG5RQlhkQjUga5ofLIxAwm/viNGBe7sF9e8FdhXoIA==
X-Received: by 2002:a05:6512:3990:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-5309b27a19dmr4905647e87.17.1722251093886;
        Mon, 29 Jul 2024 04:04:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09093sm1457806e87.172.2024.07.29.04.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:04:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 14:04:47 +0300
Subject: [PATCH 3/4] ARM: dts: qcom: add generic compat string to RPM glink
 channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v1-3-99a96133cc65@linaro.org>
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gg7IKG25BZAMNpPzAY8WH9TOWG+NP6kO1qp5pVJCOIc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp3dSyj0THD9PCMe12eIKVK0caExaiGUOAPIR6
 NLb6xr3VniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqd3UgAKCRCLPIo+Aiko
 1W0oB/9iqzt3QpKZ24QcsmvkWqxVN3Fp9PptKMrXqMnLjXFDb7h3HgTg0z9iAm9a0RXH6jAj9+W
 lArEieyIP6O9Irt4A4Ye7RrIbY6z9X4m04NMFDtnMI/AExMcgZrjICOJelojgqb1SUcu1MYzHwe
 AGf4wopzya4ttntZ1hKv1MQoH+vZspziaGWeJMNM4IgGiUvmK7Su2GYIMDCVjkEMO/+knUyiOGe
 RCMeKnT6dj0FUzN5uiHj2WOUqBFGYAfxRmPXpovSHT+ENAcpXbraTKDyftm3eRHsQv5m2K8WIBX
 2z8dOG4vo8C5Fq33bl7TJZZuijMW5NYjjhLMNrAJdg4NzIsx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm compatible to RPM nodes to follow the
schema (and to allow automatic driver loading in a sane way).

Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b52e5d5eb51..014e6c5ee889 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -792,7 +792,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm-requests {
-				compatible = "qcom,rpm-apq8084";
+				compatible = "qcom,rpm-apq8084", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				regulators-0 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index b2f92ad6499a..2ea3b4a94d50 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -125,7 +125,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8226";
+				compatible = "qcom,rpm-msm8226", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 15568579459a..4a694bfa4732 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -136,7 +136,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8974";
+				compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {

-- 
2.39.2


