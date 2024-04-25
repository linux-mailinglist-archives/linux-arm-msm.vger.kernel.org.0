Return-Path: <linux-arm-msm+bounces-18589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5818B26DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 18:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1651B20629
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 16:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0796E14D2A6;
	Thu, 25 Apr 2024 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bdAp3dr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228BF513
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064003; cv=none; b=LMR36SLgdnBKXzeE/Dmf36QhR2xHsSeLZLhq27BbaPmTZ7fhjfhj9IdmQZMpTmCkUub3pYGhnc7cgmoAfGPa5N3uIPY893jiWxG37C0y3a9/wKtpMX6+9JhAi7bQkfQneiBu2cUP1LI5L3ak/cppj3mn+g/6u6M5I3O/4xnhnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064003; c=relaxed/simple;
	bh=noq65oY+jgHp4OvoERTRW6Qf1bTd9Kwjb2fKfvZQ0I0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uqEQPJqE6KQgDx4Gzjw4vme/zsdqdi46MH7gPSR7AZF4DH2djsA9qNoZ5DjivFLCg8SOl1YFG7QY3QBXbHyaneLUCEELe8DJ4u9o8VKm5gQdxNEvxaqQLNhCFopi4UzuEGp3AC4t0OYfVDRt0vDxf9BZSWxVY2MZCc5mCH16+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bdAp3dr+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41adf3580dbso7606645e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714064000; x=1714668800; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkubzpW42FZ3X0uIBR5n+FKyh0t+HmkdY9GkED2U35Q=;
        b=bdAp3dr+CNvZI+GA6PFcXflHnBDvNTr43yL/ycHQauw0ghu5gCTKnETKwyXaDt4oLf
         WszgIcnJXdevKAbOMRaW7233Jlj2Sx5o836YBc/zdbqjwUfcoyNrxC/7IQtIAzkMSNXS
         Xg3aTbg3XyqIZKov/FFNPkusQmlQrLYbMG6auwpNM7nkMVnOWewEfquZBCJRkawMmQ7K
         7pAwBOdC1PHAD7/sSzfVbXsaKIEwKhRXWPnIqMZ2VqeoASaezZK7PccmUUO5yPV0zQLB
         4nNTtWsAjFp90M5mEQZ4eCnvs/nPzpehlkvqX77Repka+lnGwQBLALn/f4tWI0V9j2Lh
         3z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714064000; x=1714668800;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kkubzpW42FZ3X0uIBR5n+FKyh0t+HmkdY9GkED2U35Q=;
        b=Ib/7SIwFvrnS0X4uKcekAJ9HMrYnIvXnXinfpaiAspMOGEjNlLdvl7yggeCL1Yx0FM
         F1nFw/uXOW41Y/szLAClM2rvSD23EFMd7Afo2LLfloD0LGLXr7DkWu24VbWUZxWVMAR0
         Wssqp2XxkJJgduubDkYAxPr1WVjT3pWjcZMmYdqC6IPDUIUdNi37Y9E++ZuEtzeNRlae
         pYVoScSLRv75bDC1z92KcVM1d6q7FdHTonaLxMe8Eotmn4+2lvIY9OCHYDM4Wu9J5NsE
         6GCIWj7MzqvfZuzFejRnl5Lb+dNblo72k9lW5lVPwW8qJtgSYlpfbuJK4aNwmlKWsikL
         1APw==
X-Gm-Message-State: AOJu0YyTSCvwTjyeV3G6lJrdh3sgmNBwEOgRH1gjuL0kd/0PDGEL4rc6
	Jd8tZN2cgzPw3JkWBJShkRrmUTvia6NS2PfeaeeGtk9y2AQoX0VC+yyQvo6OtCg=
X-Google-Smtp-Source: AGHT+IEV2lpAbZh/xzq1vceg1C+Iitsk8eQcbd4VvCzoDr2qfORG7PUveU0qztyTfsEtWV0jdryaOQ==
X-Received: by 2002:a05:600c:3b0c:b0:41b:4506:9fd with SMTP id m12-20020a05600c3b0c00b0041b450609fdmr325468wms.6.1714064000188;
        Thu, 25 Apr 2024 09:53:20 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j2-20020a05600c1c0200b0041ac3e13f1esm9751481wms.37.2024.04.25.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:53:19 -0700 (PDT)
Message-ID: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Date: Thu, 25 Apr 2024 18:53:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC PATCH v1] media: venus: add msm8998 support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Based on similar msm8996 code.

---
 arch/arm64/boot/dts/qcom/msm8998.dtsi    | 49 ++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 4dfe2d09ac285..67b8374ddf02f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3010,6 +3010,55 @@ mdss_dsi1_phy: phy@c996400 {
 			};
 		};
 
+		venus: video-codec@cc00000 {
+			compatible = "qcom,msm8998-venus";
+			reg = <0x0cc00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&mmss_smmu 0x400>,
+				 <&mmss_smmu 0x401>,
+				 <&mmss_smmu 0x40a>,
+				 <&mmss_smmu 0x407>,
+				 <&mmss_smmu 0x40e>,
+				 <&mmss_smmu 0x40f>,
+				 <&mmss_smmu 0x408>,
+				 <&mmss_smmu 0x409>,
+				 <&mmss_smmu 0x40b>,
+				 <&mmss_smmu 0x40c>,
+				 <&mmss_smmu 0x40d>,
+				 <&mmss_smmu 0x410>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x421>,
+				 <&mmss_smmu 0x428>,
+				 <&mmss_smmu 0x429>,
+				 <&mmss_smmu 0x42b>,
+				 <&mmss_smmu 0x42c>,
+				 <&mmss_smmu 0x42d>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x431>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..42e0c580e093d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 520000000 },	/* 4k UHD @ 30 */
+	{  489600, 346666667 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
+};
+
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
+ */
+static const struct reg_val msm8998_reg_preset[] = {
+	{ 0x80124, 0x00000003 },
+	{ 0x80550, 0x01111111 },
+	{ 0x80560, 0x01111111 },
+	{ 0x80568, 0x01111111 },
+	{ 0x80570, 0x01111111 },
+	{ 0x80580, 0x01111111 },
+	{ 0x80588, 0x01111111 },
+	{ 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = { "core", "iface", "bus", "mbus" },
+	.clks_num = 4,
+	.vcodec0_clks = { "core" },
+	.vcodec1_clks = { "core" },
+	.vcodec_clks_num = 1,
+	.max_load = 2563200,
+	.hfi_version = HFI_VERSION_3XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-4.4/venus.mbn",
+};
+
 static const struct freq_tbl sdm660_freq_table[] = {
 	{ 979200, 518400000 },
 	{ 489600, 441600000 },
@@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1

