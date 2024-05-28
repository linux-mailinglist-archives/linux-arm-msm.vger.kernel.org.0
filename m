Return-Path: <linux-arm-msm+bounces-20832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D18D2641
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11BA1C25D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D761802CF;
	Tue, 28 May 2024 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOV5GQeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9817966D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929026; cv=none; b=R7yZgL1sSO80zxjRVPe3ZjMKkC3x9ozpGyHh1XbTh3XzFp87pZu/iw7Y+yQUppIMmoWhZ+L7QrpDO+UsN9btUrNIg6vRrvqhBwnZh1qmbWXXefhEU7cyaVSxKGcDohCFjE93e9YXhqrhxUBtsijkc90MsPgLeO4YCaT8VVCe9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929026; c=relaxed/simple;
	bh=XSG2io/KT2M4j/vkBu34/bvT+NFOKJLYvm/1exVCbms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQiGmRI4Hf84DMbhFp9cay10BjAy38+K+dE6nPTdxX8rXsXtlxN6QnfS/pbmJgUKb1Dko803Ghv0oYtz1FZgZEnPRXzckR7o7V6aDGhL1K1U+Pq8h0CXIz5WMqOPgQ6WmMafZzG0Su3SUSD4AdXvPA8h4J5TiK1ycIH/mxqdjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOV5GQeQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-529597d77b4so1635203e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929022; x=1717533822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kvfgkm5LLEnmSpnWtVy++FJezRV6uw2fSY4Upd5a0NE=;
        b=MOV5GQeQMHMD57Qtn835QEGoFSrKxfjllWc84FnACvhKC5wfIFCXR2cm1sELvBts+Z
         dKSZ6L8L1KZNDebDAp6AOmCqSFxfu4nkAlCPfOtwRX64c5ri+4j69MBUL9nbGuruKTPf
         vVmOZw7/J+Cgfu6DdQmp/rQTtfVcSvxla51iRYX1tWgLFsfeHumLu992XvLYwfZT0zZH
         7d+KCwbAasTbeDwN9kAYjg3oM0QXgbHcTKj6nFsbEhNlOjCKczcoYiFzhu6mgJnLzVkF
         viJR1LlTSB96jQ/7pdp+DjL00baAtJsmhXCKB20yT/ZXgXGvVJ3fzERWBSn4bCoNSaAj
         g09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929022; x=1717533822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kvfgkm5LLEnmSpnWtVy++FJezRV6uw2fSY4Upd5a0NE=;
        b=ve3pVZeksJyfkVX56AOUvQ0UBT3/Y7kdJQ7f+4+vok24vTDWVbH2k0hOniBnC/wr3K
         0xHR7VYz2r5AQ7mZCGIWKz7+VrA9YhbdrjGlDDZ+ItCFmIo9i/HNdoUCJnultuixVbTO
         xpAmKplzHrIRK1BfWcUucIMd63qGOK5AR0I87gMW5UTlb4B8/qj4hf+iJmKgh7dHJWK6
         j3+6sX05HF6BNNvsK8090Evgvl7UBDDwpVs1DTGKqaf1Kj4NbezVH5G+61sNPShr3M0+
         8153A+OVxvftSFLcVbu4a7mjlAAwg1QHCbjQb2TdNbW5L8g0SvLHluWHoMzIe0VypyEs
         TCbw==
X-Gm-Message-State: AOJu0YzOzClJVxuHSCCnNTglUFsief20oazxsXQiqlnQociPwoePxFqP
	rC/k4bGxLr5L4/N15XKa1VF26slEX3odXIas2TcyIvtUKfkabkBLOJp6yYykxmw=
X-Google-Smtp-Source: AGHT+IETmTHBz8HtPYt/cOihJwSi8rcYOYxe1knVTXCnN1qASM/xTMpXkm7XVIZOYzunAg/bFmn8WQ==
X-Received: by 2002:a19:6912:0:b0:51d:998e:e0c1 with SMTP id 2adb3069b0e04-5296410ad52mr8992609e87.13.1716929022202;
        Tue, 28 May 2024 13:43:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:26 +0300
Subject: [PATCH 08/10] ARM: dts: qcom: msm8960: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-8-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=813;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XSG2io/KT2M4j/vkBu34/bvT+NFOKJLYvm/1exVCbms=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1XArvlpg4b/kJs9RG6pgSYkOJa4eqVmX2k
 4wGdJ8nOIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1VQxCACYFdpR2hQQY3OnHxc3pqyqcSGDjMzzArhx2Z+t2aG12ZM4wWlSn+RX/5a2zV+9LKWERey
 mbz5khKFKZwQNbL/pjxhv+22zQsT2gEGzho14Gh0jEFlxBDDRa47D8aNMoT1q+DXb5Etsh3Hsgf
 WVlT0BDj32Zn6Os+CVOPKV21hlt4qwoJ2yvf8mXXrJ6SknpapBYU5kMrEouRQsdDXP6+Kofoydp
 iA3KrzITYs53bDeWCYfv4OmNTqQlHOCKnexljjJy8TfmBFdPq3xjpfMQn5jSqUA128ky52JZYuD
 u9+K2yAMwmXMHhvnMYG8+u9JVaQBBlOJP2DttzZbonsqyg2i
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MSM8960 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 922f9e49468a..a9c6d2dbb460 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -129,7 +129,6 @@ msmgpio: pinctrl@800000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8960";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
 			clocks = <&cxo_board>,

-- 
2.39.2


