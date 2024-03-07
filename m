Return-Path: <linux-arm-msm+bounces-13631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C387584F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 21:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F3B1C22BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 20:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BE913A263;
	Thu,  7 Mar 2024 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7zKGP3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A9139571
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843202; cv=none; b=aeZ/gLL1RrQy0FZMkGs17QuUUg/W+At6Iqt7SFN6NcDaQ3tGziBpDuCqFhqI0JtP0lLSLoLL+CsLHTRbg8+EInxZiJRYRktOdDMKGfBEKt0x3x/I6kt9p9zgFbmQE6Ig88oKXgdjaYAM79b5Kk1jRx4QFBstaXDhjyCBZZe9+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843202; c=relaxed/simple;
	bh=X88G2FAej3PmBxt17XiJ31e6Y+NzBpD9H6c5ItuxDfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfZSNq4xI6bx5y6hwURyB5Zm2ttTWhGvN0+Ms1m4haqwW4Bo0D0ZioD27Xsg8COUUxf9CpOibfIgB9aAh6pZAz63PkBgDw2T/wpvEGWQYxgH/oK4WAIU9rsUfNbPkoj78CX+rkso+4txSWOtj3CSeM7TMKpFDx6ie5KCmoUSaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7zKGP3L; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512bde3d197so1329412e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 12:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709843198; x=1710447998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0TmD/+bSNy0i2UXEWLDDUBW107WaHdsG6ntcrYPB/o=;
        b=W7zKGP3LC9G69hKkd/7kuI6jz51k+/9db5BGRXp6Y+ypdQLjNeCzaN7HMr7trFMCon
         A7e2PyKsqCVoYN1iYlnAycKv+GWZ3cG/6nsEL3YHB6WBHUhDJW13jUZKDIIU1GfqUXCY
         SR+Til0b2L6jFHPlClTruir53KvpjTdM8lJh2YqVJ7hanDOcicoOZ79CwyCYD4XSbybd
         xDDFCzbVFYMYkN6P3o6KNxCF4hq3gxDuYGRsUm5N4zuWACV64yPL6Wc9S1HZaKxU51rA
         ifKRmMQpS6d6EPPKhZb+dxVWUwF2S7PTnbaUVg99OA5tH00cyT4xujDic0HWy0XHnJgD
         9x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843198; x=1710447998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0TmD/+bSNy0i2UXEWLDDUBW107WaHdsG6ntcrYPB/o=;
        b=SG2EB7fbmF1EEgAat6+HjoSLViNbyxOsxUpvrYQSQJbsmQSItfQdptpNLtKpgkm4+U
         +cjn40QtQ06x1dn6vqV6+/HF3a+bJ89sJzt9vPX7myD8bOFlfS3qnJgElIZDJQ68lWa8
         DkrHY933O6ZAHZfwcvCo5HwEsq7YWZEom+1FXOHsbsrhiJ1H5bakOyyivlEw6OoGWBMI
         E7Ii7N/rUyvRpWrKnNez+pNVazH/Y9ITc1azBmERiFT4rsjgBE+4QUl0r7FHvAy+cv2/
         SYND+RId1/wYXEd8MhazldDVmlJX7f4KQ1uHe3lopferSInPE9m9F9blN82JET6wbSkw
         EC9g==
X-Gm-Message-State: AOJu0Yy6rD4Ui/qG7Csl7X0oVe8fSnEGBkoZrmKSZKb7swuRg54jClY6
	xkdZ9jA89SFufYX8Co+1ZSGX3YNUiqUUwqcejeVWjFftzu+Zr61CwxRHm2bFuM8=
X-Google-Smtp-Source: AGHT+IFINYOtVbitN2J3giG8Mx1gVJS/NaU4sqF7A7hzGW4ucQRrUCd9XIEIiyCE+MA0IkaSmGz/PA==
X-Received: by 2002:a19:8c08:0:b0:512:dfa1:6a1c with SMTP id o8-20020a198c08000000b00512dfa16a1cmr2167169lfd.10.1709843198424;
        Thu, 07 Mar 2024 12:26:38 -0800 (PST)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id dw20-20020a0565122c9400b005132bf9f8dcsm2957606lfb.303.2024.03.07.12.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:26:37 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 07 Mar 2024 21:25:56 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add PS_HOLD restart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-topic-8280_nodes-v1-3-4eba20e08902@linaro.org>
References: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
In-Reply-To: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

Killing the platform with a single write and no firmware involvement is
pretty cool, add support for it.

Note that due to restart notifier priority settings, PSCI reset will
be used instead, unless:

a) PSCI is not exposed by the firmware (e.g. because the fw was replaced)
or
b) PSCI restart fails for some reason

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a3725d917bef..44c8d543eb67 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4460,6 +4460,11 @@ tsens0: thermal-sensor@c263000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		restart@c264000 {
+			compatible = "qcom,pshold";
+			reg = <0 0x0c264000 0 0x4>;
+		};
+
 		tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */

-- 
2.40.1


