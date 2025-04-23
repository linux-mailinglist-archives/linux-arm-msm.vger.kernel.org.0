Return-Path: <linux-arm-msm+bounces-55081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6CA98116
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0834E1B6343F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF0A274FDA;
	Wed, 23 Apr 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fC9DZgmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF7274667
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393444; cv=none; b=F8IrUM36lG9ru/ZpMekFDGl55Pz6QCB0UBebUEhbFbOasnrfvIxAKgcoU7bVfUGWT79VOUpy8AUZ8pDR9kixJESTlC2aTtimUjJ2oaZWTxij+JAVe6AD0VbNGMEcWXyDRpW1hyOHvlYo3zelU9YyYZyjFyNT3uRBQVGSNpcim7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393444; c=relaxed/simple;
	bh=mk/A8Bh9qTBLy1XZnf66VNgDUYP6yX/XX4i8sSGupyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmOe1a3DRBpfpcltPmwaskXl9W75q109eCdeP7nK0qRStOJMPE/7tVSAU+wPWdNsrSbLIwL4toX2edRyhp4Jd/StMFfglDiJdpSQ7WkEOpdF/+ZMjPCtBRbcAcFp4Vuqz8FLMA1kQ7F/N5qOpu9Bi7m2vU/lPVcn0K9Gc9mQHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fC9DZgmb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee623fe64so5256892f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393441; x=1745998241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+qLQE/G5JgFe5SKAZGwIGMQLlSZgurNA9t7PIViak0=;
        b=fC9DZgmb3wmcC+XBVMStOlPihV1+DwpaZOnfhbaMHkQc1deMxUdTxa54g0gdf054lD
         JXdix3ymf1hCJPbnmkXlXdoS+cnd4vRJk+MYGKbwAWbUnEJPWiaHI4HnkA0vdG3PhJ5A
         773Q11zB69R3/jNBmoVd+Z0RAPhmhzhsoCNW5siNtx7mjSHQJE3qv0ZsRISyz4qII+vp
         te59BnlgZLjwPHFoDMrlVGPh8oBZLCM0YlXLqwIgKch1SMBbOgDNtYML7TXmSR+IueIT
         OX5H8fx4eRXxJXhEUNDw3rsg6/YiQLW+9stwAAS3hnJMsOah2tyZXuD4GAYw+AQSbbZX
         EFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393441; x=1745998241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+qLQE/G5JgFe5SKAZGwIGMQLlSZgurNA9t7PIViak0=;
        b=Jf6sUEquqvsH9xvL3f2puisMEZ0q0KCbgNT19R08WawbTVj4W+R0hyqRQriJt2/H6A
         wf7fbUFUreKsGR/FnmfAsoYwCfBAxC8ErbbFtKBK+P/yqKueO4Fdcqu5vjxxVmj9V4vv
         61FnqlOMMk+Bt4BBGEDfdD4DORncPjelIrsLxdwJlNf4rbj4ofxxQhIFGYnig/2YrdWs
         ri0hwbryVmoICPR4kNAnZBQ6T27NfG6J8arx/MGjflhOaGgdBKfsnFSgqEk1l6eDwzMu
         1prtBbs9zKaazO82zArzXQo28tacZMn7W+Nz/zTyIo2J/rXVrjg7gUHPLMIjwejqeXUe
         Lxqg==
X-Forwarded-Encrypted: i=1; AJvYcCWG+3WRFLN8hl7VOGy3a8RMNM9L4l5GW4EHrYicMh08vlfj1lsy7pU+4uVC9KvrKU6DLh+H4j6C9EiWs6SE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf4MgRj63OCnjMdJ3wkbEdpa3B30J1Bc9z87tYlBHgkZV0GTml
	clotrZq5eOxKvyDHZ2ieq2dlXBWyIDr9ZqpeTw0TOwh0OX9PdpuYAOvScZpSDLA=
X-Gm-Gg: ASbGncsC5XTPT7IttQn2RQv7oxLTiyvp+07VERg5yFJDdj4O1vPZBGuuETquJjuvQGP
	kuJPKrwlg+RW9WlDqoqc9o5HKaL+le3D4b8LwftjpRmW3QqHYduRPGHGBP45vGc9nB6Uqx84zMs
	6cexioWJ+vJB+GYGA600FNNnI5QQf/7hhtLjtjrTHOxXDDDTJ2qLL8RGY0VU1v2eJmtyDV+5Dtc
	rpOi02eKPnS5XWlhRCli0ZSzq75jxGCNFEwW30QzWKlAziP+IbimYf61PauK/V1w4C1b3q4ZGaC
	I1AK/wjyjhNynwnfCd/QIPLoiN7N2kzwv1ijo9byo89EuHQ/tzCJI4/tC68CbqAjPQ==
X-Google-Smtp-Source: AGHT+IFFmBIBiMdI4ipN/PT3uCrXPyibIHVQMt4aTnQqtk0cM/d0KQT5NIHS2HcuMIYJAnnUAckFvA==
X-Received: by 2002:a05:6000:4287:b0:39c:13fa:3eb with SMTP id ffacd0b85a97d-39efbad2ccfmr14484726f8f.39.1745393440963;
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:11 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-5-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 445d97d67d325853b7dcd2060523e7469ed4e6ea..9fb306456e33a16db37522b3ce9099cfd58c14e2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -513,8 +513,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2


