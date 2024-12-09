Return-Path: <linux-arm-msm+bounces-41035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38D9E92DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA09C283FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059EB2236F7;
	Mon,  9 Dec 2024 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVDatnvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B9221DB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745181; cv=none; b=kFzQ0enLphIUtH323XvEp744BCC/4Rnqd568UbAT0tToLxWJ1i45VWqhcHjzzZ2MgMwbv0sVp4pbJqYYYmPHhNccmWNJ7jk/6cQWTrh5EPx18dCZqDE+gyAusL/y4/vtFnFK0LiKTT9WTtgPRtZTFryiKQP1Ubvp37xumToOgBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745181; c=relaxed/simple;
	bh=pf4aKmzgi3RBLEJZUi/1R8tLQs1HmFlgFYPDOVq6wOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pznHxMJY7v9ndQ2dKEbLNO5rgsgazvlIqyseXHwoIWHnaMLB020UYAKXYJlrVtVt7kCzymxEZMzXHGZsxxpoLMgLaMtIGoiIrsB1xoPQ57yEh9NbXftLIVqHW1cBlzcFBFMgXNsdYw+Y00pMeZlG368TsHtSeueL26Hq8OPUBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVDatnvf; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa67333f7d2so198028166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745178; x=1734349978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ss0In4eAnB21GaaJYNQJneoRBodNwxSKbh+KMZRPV4=;
        b=XVDatnvfBMdi6nK2Qd2P2XUS32nDIY1UW428Tp+9D4Yemxeoci7tcxsoQITJcQigJ2
         XhLsB/HIMnz4dh54jyBfhJgUS++iKg3yY8CUa2RCuDRhLOy3tpOU6sHgUpLax3qiY5aO
         jXVJh4muVWEVAbgkzg0dZt2qIDt00OE61qjwqpb+9xiGHiXEUnMkT8RG+UfTShtFKRkx
         eZzQ4UMsDPxi+1v75+OHRnOoBxG4LH5Xd0aWXlvYBJ37dLg8mFi+YAiUkPsIpmmL/gcv
         NQvdLGzSHsF0vG2G6yza2NITpRg1Z22Vyd9ZfCFMZFLfK6yF2Zf+We7GEwhpSlynyk9Z
         lgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745178; x=1734349978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ss0In4eAnB21GaaJYNQJneoRBodNwxSKbh+KMZRPV4=;
        b=oZjjcro3msv4I/VuUBJi5ytV9iAk77aBJWVQAvAsbV4CC0js6cgjx5BCIb83XArOWY
         bS/+gtlkqbiig75/tC/kvRBbs039AVNsyyz0G91w0OR52CZt2HAsN4NpUHwj1MStqv2Q
         hFL4CIG1OIUqo2kkb6yUi0GwONe9EdfJ7E7POaxXnRBnpUYgRsqhH1FwQ38fIjUWFXDG
         Z3oOVV7eVBQWZd5uL/Qpa1ETTVBG3EBb2bMYTgQxmyc3NFPG69eiHqfAm8xMJrktat8O
         x2ozhHNtsZG37vsVtm0tAt2zm/LZRs6BkU5RQHP16TnZjOPtrqAa7wTTw+s0jg41wMXh
         PSjw==
X-Forwarded-Encrypted: i=1; AJvYcCXcq7Q2Des73G7sQ5z7TcXR06A2FLwf5EONhxCi5E7GqWQpYp1pJ6b7OTzrmfzO7St+r6dOCvtKOKXgguRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz816chvYb7/IJRHlb7ruMPsMuPO4/xDfM4TkuEonwJek8UPmkS
	zlkgHXn8hQWMe3r+NTP0Bz2HtgMRFrLx7MbYw/m9EJhZ1OSXD23l0q4K8WH5a64ZttxoELJSvYB
	o
X-Gm-Gg: ASbGnct8XrQHkS9+ZIQWxNBszoVJKugPbabE3zJZL5Csz8gxcluV3G5mZzVFXmQGwrl
	ty515av9TK2/Ps/cJOr1ftVTcWbv2B4XBD4uXOh5BpRB4JfZ5jyUbWN/t+/98gDCrrrG87/qJzL
	aWSdQbEJItwbFupF/PxTQ42GrHPU2SJrTjfZxyNoO/9uhHz3DCVt+m6ocq57Dxxf6XnAhOze+au
	MBM0v5sOzcdoZ9Ju1g+a1+Z2Mhsy0yvo7juENkWilzulgEgurSZ3DXGz4g=
X-Google-Smtp-Source: AGHT+IHnAeVlLcy4h5Agfr3CS9r8pCDCnLWpdgEYvJe/AP2380juCNdkfMUgMdq1nq6aK1DAonfJOQ==
X-Received: by 2002:a17:906:3291:b0:aa6:98b4:ba50 with SMTP id a640c23a62f3a-aa69ce22164mr1753266b.40.1733745177943;
        Mon, 09 Dec 2024 03:52:57 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa677968cdbsm247614266b.125.2024.12.09.03.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:52:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 09 Dec 2024 11:52:54 +0000
Subject: [PATCH v5 2/3] media: venus: Populate video encoder/decoder
 nodename entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Populate encoder and decoder node-name entries for the upstream parts. Once
done the compat="video-encoder" and compat="video-decoder" in the dtsi can
be dropped though the venus driver will continue to favour DT declared
video-encoder/video-decoder declarations over static declarations for
compatibility.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 88dfa9f240dc6d18a7f58dc06b1bf10274b7121e..deef391d78770b8ae0f486dd3a3ab44c4ea6a581 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -674,6 +674,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -883,6 +885,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -931,6 +935,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -986,6 +992,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1048,6 +1056,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.1


