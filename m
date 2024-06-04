Return-Path: <linux-arm-msm+bounces-21651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BED138FB965
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3C31F25DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DD5149001;
	Tue,  4 Jun 2024 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="yl6mD+xV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126E1487FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519571; cv=none; b=EfPCrsF8GgFFZ+BeeX/6AOQ91CGkgv+/fApyDunLJe7E9xnhczfgokcttvMloyNzvm9Qq1cdnbsgabyc7P8wT1pXUJD04C2E6afDL5Q3vOsX6l1AbjNpL7beDUGkIh+wqauNupy2925aS16TZKoWOGXgBN7XZbFWJnmv4Daly90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519571; c=relaxed/simple;
	bh=PdXm6GeJL+T3+++g0lNjWIDmHt7wIOaJGPbPgDMH2V0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WRStdososRqn/8f6LPWUJWXZvCWP1gsPZx3a7hp1l0I2iXdYvTm8rJPtv9Ye9RitARRpB/LZ99JETvH7W264P0t/SPpDlibkjcX7FFbS43foZ36SQvf00lfkFZA0i6AO8jUg7CnMI7Yl2902JbjopgSyP7fSlAQ9V+1g0Us2hhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=yl6mD+xV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35e83828738so105049f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519568; x=1718124368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EprwjT9zeYKxx2x+GSdgGwrPW0I9xgtlt7hKg5xoeWk=;
        b=yl6mD+xV+KO4dFl43bc1rsKBXkGDlfUgFjfpde1YHISn31PJMLICj8NfO3p1gRStzJ
         OyxZ3ogCRBExlnoZIctjAPo2QNDkCUFoewwYutfetcDQJvUE60iZD3pQg+zc855681IS
         /zh+t9Nk9j5/xgzE7XCYxtgZ2IgW4UFs2TQ8tDscvXgLRABSbnhZk124485hB+WXfk05
         obffbiG4YKfdqOPdnWXwQB5vF0y8a6IKamvygEinatDmmjEKBGypw2/xFZiJ4rfOqvrp
         Ub0kevu+MVUqgb3xUQf/KTgNNAJgGrCRLGlSqiGWsLp5BccsSfCotjsIK0Pl03VoiGMj
         Tp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519568; x=1718124368;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EprwjT9zeYKxx2x+GSdgGwrPW0I9xgtlt7hKg5xoeWk=;
        b=Yjfbfjp1jIXlLxG88VT3ChtHDxiUR9C062tTPG6Z0oa7ogehPsq9FhxRL21hpQnrxN
         4pD+WcuUMdRqeMl4ftGQsxy6Ot77ak6hJfUlYSa0V/LCq1lMGtYrpsgeIhl/CeyQfvW/
         qegwXK8IdUmXW9V0np9OUxliK5b596cUY+NesJb9/kS40PawXmXB3JVKbfnIsQ8qIDXa
         cmcaIhZc4oUD3BSI1FiSNCd5y7WoVIkpe0ik0MrLY1f7P8SclZ9XkTU+iGSO3bGOX1Sb
         CGXifKOiuyL4r2EKJxR7GlVWoAaeEdICHRSaXDOaVo7OdrqK+1uRasRJpku35XSggJ73
         Wrkw==
X-Gm-Message-State: AOJu0Yw6BaulSPh79GRyxJGKmgC4MAOR3pmOVSv0EVdcRuamOapOkieH
	z6PJ0jS9dzBk9jhk/k6ISZyz3DrR9+aIeXFAtAE0/Inz/jTrBfCRNVJhBqF5xr0=
X-Google-Smtp-Source: AGHT+IHmeQd596hbam5FHaqaRKdOl2gWWsrwWd6gy09aCfkAuqe52QrfA9Oa55fhoiNHA6ZyxMpScQ==
X-Received: by 2002:adf:f94d:0:b0:356:4c65:3a63 with SMTP id ffacd0b85a97d-35e0f32ceccmr8800084f8f.58.1717519567371;
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Message-ID: <eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr>
Date: Tue, 4 Jun 2024 18:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/3] media: venus: add msm8998 support
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add the missing bits for msm8998 support.

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53

qcom,load-freq-tbl =
	/* Encoders */
	<972000 465000000 0x55555555>, /* 4k UHD @ 30 */
	<489600 360000000 0x55555555>, /* 1080p @ 60 */
	<244800 186000000 0x55555555>, /* 1080p @ 30 */
	<108000 100000000 0x55555555>, /* 720p @ 30 */
	/* Decoders */
	<1944000 465000000 0xffffffff>, /* 4k UHD @ 60 */
	< 972000 360000000 0xffffffff>, /* 4k UHD @ 30 */
	< 489600 186000000 0xffffffff>, /* 1080p @ 60 */
	< 244800 100000000 0xffffffff>; /* 1080p @ 30 */

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..8b715cb7ab51a 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,44 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 465000000 },	/* 4k UHD @ 30 */
+	{  489600, 360000000 },	/* 1080p @ 60 */
+	{  244800, 186000000 },	/* 1080p @ 30 */
+	{  108000, 100000000 },	/* 720p @ 30 */
+};
+
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
@@ -893,6 +931,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1


