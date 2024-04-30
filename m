Return-Path: <linux-arm-msm+bounces-18971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71418B7BE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 17:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B19D3B25F0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 15:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F90174EC8;
	Tue, 30 Apr 2024 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="yVChQl8k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD413D26D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491318; cv=none; b=pZ/i5F5FL60cWX9j+Xg5Ri+SOwx0HWgUucv+D1K0LYNF15UMfXVjSaQA61aLFl55l+30buAKEfKg8jwJhArBH/Y+ndXS3549xxGs9D7qapcf8MHuSR+fSt8NiqQqkRv5RXNR4UPDTxH1XtqCGpvW4E4J2nKW5sOyQRydPjgtAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491318; c=relaxed/simple;
	bh=Oo58CEMdtjetSnRagHS5J1GNGo1JKVIA0feYLcxotvM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iJOEHUalBVGck/WecrMcE1VWnYorpwNlc5d1kfmcfLGMFaeqbM6b3iQkvYQiDYNRGwFY4tYSUUdaEO8OTvny1U1EN4vHIwD/++7uZ8vleXev6HCA6OiilSqvu/sY620QNkgvx5e+QYlb1uGTgKTQf6WL3MSCs/9jHtbzs275q/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=yVChQl8k; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso29083695e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714491314; x=1715096114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPqZJAxEGjY0ShetcfKjBOSOoETPGEikwkHIAxvShII=;
        b=yVChQl8kQX5YhdbCbz58y4fql36/fZIZg3th4jhtmO3hCMW/IPT5qHHa+wyiXonvNT
         HPYvdK+pR4BhfGeH84iLQ6Yp/QgKJgFZTCHae1An0Bsf99M+LfeWOqv5DEj4s0OFnHWL
         7X13bj6giaY1E7T/3PN/3egy6ZobpmR7jqyOGGCof25HqumyhaHvwOpq+MHQZcxO9aiE
         MjEixO/2QrpXracxuSPAdS3WBlp72nrulg2JY1C1dfk/QIels8NV4QhmbVX9d0m08kKJ
         ufOX1E6F+U31imputM+B7gAfA8cZjeEc4CpevyDEaAjsEOBc7tLfYJHeJMCpMbg5REn4
         e0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491314; x=1715096114;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPqZJAxEGjY0ShetcfKjBOSOoETPGEikwkHIAxvShII=;
        b=ZEzc/3gnogDntf1t8pWxpVVkqaspoG+66nIgkfXqClEIkSWcjJ3nBHnSgAWWndnI6T
         NtQpPxaQ/2N7Ee0txVxsxPzJlpJ3w6gfdv/1gCzWMrAv6w0Sj3k0H6v23jlGfXBFp7wp
         CKc+GfZmHodvJKtDQGCkZT7kLoFHmF3Z7N+agge+6PLwIExQ98DFKqkAQc0DaRkdnydb
         1wa7sOlYeVAHkjJTtRkOFGA8YQisB1fWtKWUXThqyRZLYe2yzCewCtVjHq99ZEUK8a4z
         eviWrXaxZr8Op/gg3KU7nqBJvpbCoxja0s0sCHpW28YlxiTz1ANUN55TSs/T2/NYeaKL
         irzQ==
X-Gm-Message-State: AOJu0YwbyYIBzTQyxcBCCP7DWkN+INOpvSi5Jb4RPPLhJnEePL1iswTe
	xnHi4DajFPNYmMC9eIr7dRSHoofhKVBhAh+U6XY2v+38tezfld3Eau4bcMMemkg=
X-Google-Smtp-Source: AGHT+IEdaQNPB55tn+0T4Z0bhsq7wMMGI/91idvS14Pc55qu5JeJj2jVjNfX8746ehWLCdzdHLUxaQ==
X-Received: by 2002:a05:600c:35c4:b0:418:f5a9:b91c with SMTP id r4-20020a05600c35c400b00418f5a9b91cmr9667253wmq.33.1714491314716;
        Tue, 30 Apr 2024 08:35:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm27045674wmo.12.2024.04.30.08.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:35:14 -0700 (PDT)
Message-ID: <9844c940-21b1-42af-9448-62a2d5ffadb7@freebox.fr>
Date: Tue, 30 Apr 2024 17:34:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] media: venus: add msm8998 support
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Language: en-US
In-Reply-To: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add the missing bits for msm8998 support.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

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


