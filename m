Return-Path: <linux-arm-msm+bounces-20523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54AF8CF83C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 06:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9168828099F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 04:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED801A2C06;
	Mon, 27 May 2024 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ycj0/Gq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100879E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716782477; cv=none; b=Tvj1RFaemI0S6CH1Ub7Pf+mj0TMK0jZjj4Ghqj8nySleHj7OWB1wWHw9wg5nX97f0jcQpeDJnwQrm+SFNS9JbQbV+vO5yxcnysCazsA4O/U/B5pY7xbA7kQ8hmZZSPabY6cbEVc8vA3daJKLNfU3YyiFNZTLuApzOu56nCN1lUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716782477; c=relaxed/simple;
	bh=JEmZ2ZNJgUk970OW5thFtZvmS2FUlgQSJCEho+rb7JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MIL8qH8vOUqedlKUTK2j13d1hLtvkqktFnnAagU63JAYXstJR5SlbZcyzGjqTekwxy1Rg3DLnN+hAJFu3PHylMosysHJ+sqleb1YtZbEj9eIm+U3iweAPviNC1RJ2jGSbG3Lrs6LASjedKzhei90MoCptKnk9+72Q7rwyNwibt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ycj0/Gq0; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so130359631fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2024 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716782474; x=1717387274; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5YuxOJdU9XB0S53SkjnfI1sZE6Vk9sFqwRQVMXQ1bQ=;
        b=Ycj0/Gq0J09s7tWz+BnzDab4GyH5Bbb8q1ji+2lV/9MtFgHNS1G7YDUfORULGPNSqr
         t4I1A/Nx8rGuQ2mKdRn07y3320IAGLZyEH7wOoJ69+sOjftL/Ybixid2TjhIm2dTUluy
         B2aw3oFHrYM41Ljq4f7+Rk10LOxdXKi/YW9ozGY8fDnEze+6+ALDA7RcvBcex0uxSRiW
         tQvFB+dNodyaLgt/1+TSlcYg+Zeuuos0QoreVuWKcz7HW+98naSvIImKeF1ACuhsPw34
         EKpa05MpoSm1WuaE84Txqf7RvcInN+kZ/pXST9qoHZLzBREfcB7A1yR6YiXeEpXMpSir
         kQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716782474; x=1717387274;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5YuxOJdU9XB0S53SkjnfI1sZE6Vk9sFqwRQVMXQ1bQ=;
        b=IGWi7PdOLU5BwYhl2vnbCGsyKLJP8SuJr2W/nHbkxSyuCqcoTtyjdG1c16WmD/WufZ
         9p//JLxo83eONXLhhwMAJxKAHfgMjjl0rOVdSfupa1L2rU1O9b8w5PKNly6+YOHHsce1
         XqUKKgoy3dmoc54aGX1t7RGd2ygZWrIWRimTkB4AMa1kPcgRdXghhKNca5Gp0om04a+2
         HBrCzewy/D3tI1uOfYiGZhb3XXliCNbS2nitK54rLkQqScA3vcH7qTm/AqYWDnQR6T44
         XL+toUkYiLvBx9pEWebMBJvuLCsb3vty0QcOgu1OCH0sG2Oqk/O86uENo1MVChQB+sX4
         /Kxw==
X-Gm-Message-State: AOJu0Yznx6JuDRl+TNGnBEjxZE1sN/8Q0GjvwDVUlw4sgPhfwJAxoTs9
	Yrqn9hMPrc4uTzkyn6nl69knETOWb5enkf0ePAu0ztviho8x75PWnm7Eem2o3gQZHc7j2VbTg2Y
	o
X-Google-Smtp-Source: AGHT+IG4aug5RPq90CPydL6j3kQeZiP8MsFOZIFTCpgaUm2yZDiAvuuVVMdgHT4gIaI+finP5qdUzg==
X-Received: by 2002:a2e:9b0a:0:b0:2e6:935f:b6d3 with SMTP id 38308e7fff4ca-2e95b096b74mr60317541fa.14.1716782474129;
        Sun, 26 May 2024 21:01:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcdb000sm17915321fa.47.2024.05.26.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 21:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 07:01:11 +0300
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add WiFi
 calibration variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-yoga-wifi-calib-v1-1-af9dc33880e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIYFVGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNz3cr89ETd8sy0TN3kxJzMJF1DMxNLi+SkRBPzlEQloK6CotS0zAq
 widGxtbUAomvuFmEAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JEmZ2ZNJgUk970OW5thFtZvmS2FUlgQSJCEho+rb7JI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVAWJzAFwkymeAxeLbiqXk0UiEdxqPqZXlPTnn
 kDiUyaGWvGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlQFiQAKCRCLPIo+Aiko
 1RLAB/4uAUE+3WQhZCRKNRg+lpWL3qVYzblwGJnLN4ougnP5ykM8XWe/IP7aXReNFEjV1tNopJa
 tKHkUT1WhnEp+/CzNK7qtQW1SViFIpKSKnxqn5FK27o9s6Mm6edoWZxo+lkfvQOZcwjjT0LtK9K
 nNbrPTh/meZnI1+41HXZCUJBX/oIEcCzB56oCsnuc9+rjk13doWgVwG47NzdjqfSuGF+UY9+bYA
 sD2iFPa+HgCZk+grX7DWxeqtOAxe736wnRszZkAoAUO7hHfjUBOHLNV9VTe87/1FdNS408j8SaZ
 24SQ4zQD15PMbSMaupAXtd7LAgmyHRmTr+0fzKrkXpgpHcad
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add calibration variant that is used by the board data for the laptop:

bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 47dc42f6e936..17773f9dba44 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -834,6 +834,7 @@ &wifi {
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
+	qcom,ath10k-calibration-variant = "Lenovo_C630";
 };
 
 &crypto {

---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240527-yoga-wifi-calib-16498cba47da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


