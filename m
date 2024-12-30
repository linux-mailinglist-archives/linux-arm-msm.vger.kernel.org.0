Return-Path: <linux-arm-msm+bounces-43676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734719FE948
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45F0B7A1901
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187DF1B0F2C;
	Mon, 30 Dec 2024 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aq6BaVge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6551B0409
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735578049; cv=none; b=garxq3HErUPYQGxzYZrVPtjrO4GRJw/2STFYZ0QaB7hS50OGCfbqVVBKjxvnDdlYmv4JP2EnOJ2ScZw2PEEqDZaFqN4o50YAzqO9fi1VDzJKcxWjR3KLSlhW8u1+TbQLUSWZe2sZjkf5adi2HVfVaB230xhk7n4pM8gLcJ1TrYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735578049; c=relaxed/simple;
	bh=sybGaLnj3ltEDFRmlBACceTqpOlLG+m+adlX7m6/aV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpAUaWKU1CR4BJs2FHKKKRC/APlyfM8RWNdfR44B2zX09K6KCsI7CxEpFzUuhAPtMiZy8KGckOL1CJbQycGnUSvb0ml+e57JOXTJmfXVky3a5jbLgfnZJNcznKpAVCMmeqStiNABAwTIvb0vOXrwAOkGl/TZ9jGKhGDwpXYvfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aq6BaVge; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43624b2d453so98126835e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735578045; x=1736182845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFMvmwBjOS8ynKh8e2OTYX9BXR1Oya1ErnlXSM9INko=;
        b=Aq6BaVgewS421/8i2GNmb3Bvo72qJBcgRK+u8S5Gu9GGDK9XrEzi6YCwhPjtxj/D6K
         6Lla2Q7fNKt2HxPZlbdVrJSG7JgLLFrGAzii02JC3EMJ9cYKGY/j86Xnp4QNvjsl7TYs
         iSxw5xhoC+u/XAIEKue51SBMqEu8n4WPOcO3LVTk83ydkErUK8Eq8SHc4f19r7W41NmK
         DYEbJcO34+ILZjiN0YGPQWnhtOLmcjuhbgQF1xx3pK5+3SCHzkgSCGxFlq0+EjIjv367
         j48EAhkerbxqma2rzKSCk11oQl2xIsr/FNkfezL3TCFgkb2UMlC0CBtXSJTePoVeQmWo
         7wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735578045; x=1736182845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFMvmwBjOS8ynKh8e2OTYX9BXR1Oya1ErnlXSM9INko=;
        b=YNh2tDEbeMBIn99ZXV+Lgn36yiUArjBRtwLfJMH9WW+6VTsE8vvVzTcHLkgoEUmbHU
         4gNR6TqjtfhjkLzMhs6Fkc9mdM1Z7a/59o3M0EAXWWqZzDNjUEUaw6WJ6azsoy1oo9rS
         6q5OjNlJh3XVXVdoibC+mkoI5Adf/whFoUhr4ODxD0NfaA6/dGb1EGl/k2bHXughAtj+
         ywpDTzefUBfp0rAG9LRyHEcF/CUPPnZucFIos7rJbCrepsdRsVBsOyO1LudtwW7kSsZM
         yCaug7idJCnFZWzLQTpP9dyknHhT75MkGmNSsCkOyTzMeJZpqVVDt1FCtZwY6iCmBo8j
         b01Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZsbtcJ/0VSsQEds0BqLdmtxVuCZuSSzTxDIJiOgODQBoCGOrxt3HJhyeADQV/LlHhMHqEVtqcb2CkKcJk@vger.kernel.org
X-Gm-Message-State: AOJu0YxCq2SmDQK8hFlRsQXPqdDAeXU9l3PxQAnc24a37cKFMoHkI90A
	abPUwTQeluBHJ8uRANDgImddTfAQ8qM3vOrm4FPJXTO9ntXosp9K+1Lf0UEIMjg=
X-Gm-Gg: ASbGncuZ70TW2unbjugVmYwtd9YJwr6bah9oMQ6PnmwF7kj8Q9mVhzRjAKVFy2NVlN/
	wI2rWuI2xFP4Q+j+VZm9Oumk5Mf3yGhFJX/OtCubjP80H9ihOWLVnqBmd0O2cvAcJourz8cvhqf
	clLSuAfoPsTtJu3dJmSi6eJ2QurF5BWS3JILJZEYH/gqeCdiBOPijiDUwZE2sVh85lir1Bb3+Ec
	CJyY+J1CxUmzlS5xyw8rygRACd/CSTgSuWsuGNr91eKt3ij8mp0I0itN4CHn+mxeA==
X-Google-Smtp-Source: AGHT+IH/DkrksxLg++wudOsym95SLZxga+heGUPIbkXH9u7A0BMDRm2vHcoMjTz9WgpvhPuFzjPnAg==
X-Received: by 2002:a05:600c:474d:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4366835c14fmr310233175e9.5.1735578044060;
        Mon, 30 Dec 2024 09:00:44 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm359757955e9.10.2024.12.30.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 09:00:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 17:00:34 +0000
Subject: [PATCH v6 2/3] media: venus: Populate video encoder/decoder
 nodename entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-2-a4d5070d3aaa@linaro.org>
References: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
In-Reply-To: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
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

Tested-by: Renjiang Han <quic_renjiang@quicinc.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index fe24bccff08aed1ebdfe00f75e1aa5b67ae7826e..56415d459c290fa029921da55bae54f752135f0f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -675,6 +675,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl msm8996_freq_table[] = {
@@ -884,6 +886,8 @@ static const struct venus_resources sdm845_res_v2 = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mbn",
+	.dec_nodename = "video-core0",
+	.enc_nodename = "video-core1",
 };
 
 static const struct freq_tbl sc7180_freq_table[] = {
@@ -932,6 +936,8 @@ static const struct venus_resources sc7180_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.4/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sm8250_freq_table[] = {
@@ -987,6 +993,8 @@ static const struct venus_resources sm8250_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct freq_tbl sc7280_freq_table[] = {
@@ -1049,6 +1057,8 @@ static const struct venus_resources sc7280_res = {
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
 };
 
 static const struct of_device_id venus_dt_match[] = {

-- 
2.47.1


