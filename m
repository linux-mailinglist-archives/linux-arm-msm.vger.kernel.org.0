Return-Path: <linux-arm-msm+bounces-10381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AC84FE4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C0A1C210B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171E639FD1;
	Fri,  9 Feb 2024 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ei+0GVQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33B39AC7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512996; cv=none; b=YiWZbHXXFOSkplQKwLm9fUk5an/RVl/AmYX6Y8d4mMW2txsz05oRICgFv53MnUDFpsEsoQ97zZV/kSirZDmDoSxhkBuoac5whsyNdqkhr6uzbRi3+SAWCljtfuLc+TKR3qssrX+rsJ22NFcADYTdqv9gwkJB7H8oJDuTKSinISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512996; c=relaxed/simple;
	bh=qRFNx2a0sPyBufJHjBf1XzrjeKK7bQ1fasBPqhqnRAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhaS7CHmch+oIYugrTf4t/GPfNlJb+OU1nmDoo42PodQzIp5n7qgiDvi7JB/+gS4W3d4Voj3CLLP9pazxNDI9iiML/PSkkE4zCa+LB9KupaTq6jioZSg0kVcjpUUGaNCAwLiBUsHTLSsrApCYq2wPJ7kgxGf9L/fQYN7gXqZhgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ei+0GVQw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5610cc8cc1aso1542289a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512992; x=1708117792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P4+a9/cIAslmQuzQjL8EtOxDSeXqHOG2MyxLu4mmL8=;
        b=Ei+0GVQwmIii0J3Qk8pJRGPYG2qfgMy89wRlSYTxhLkhLl49HFl7eZpuMZ0yaRCogV
         wBKUcBBfLjnAcn5w0AOz1zewn5RSw6z5NMnolQuflrqduig80bAAgIdYxSAovEhyYaGg
         q/OyKywLSn7rSg0gT53fG7F4vgTYkVvS96GX2CwVroq0W7vHCsxVzYLDwPXRQiQvHhfK
         G9Hy3y+2i5Ni0KdYmVcbW4IXIJOJTK56pJXpftJ0JFQ7T8qFDBAIx3jugl9MOAwEYYO/
         fEAx7rsVtYAwkPLcNIhQ6Ki3pyLImRriRxagXwBEtJyz9hcQ0dLcDJjYO+gJ5NMwND+z
         brqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512992; x=1708117792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P4+a9/cIAslmQuzQjL8EtOxDSeXqHOG2MyxLu4mmL8=;
        b=I+zPdlnq6TtvXAnQN0Wbm8OzYTvGW9cT2yDx11CZe6xFbvIoZAqXOGxmw+s/O4QoNl
         snc6roC0iAKA9CN+0bbIEigeD5EyPUOgLd6HA5taf67veHP/VTaFDgd5+hc6nEjV6vJx
         vg1XiVQKFlQYKvOtlLJx0WbduWXI8UEyNiY3UOGprozNuq+w0gV2a4rZTp8PmlvuyjNV
         oeixyu23R/35w/urutprA5ruq8WjjW6C/NZSEMSmF7n4LFHDnV4fX4D49UI3SdqwV5BM
         QPaUD/4W3/IQC9A+YRZyliugAYTiSxlRmXh0Gfej9q8xVZoEkxVkkyQXoLW1ND8O2xr2
         oumg==
X-Gm-Message-State: AOJu0YyE8PmLlZfiKbK6rdQM74sAYDwot7sL249IAJtZEnG7JwJZe6iO
	gQd+te+b0HW+p5/ETJLAU1xVpt9m8APbF4Z+CRAjxSfFHoha/uYsSNIYjF+jUOM=
X-Google-Smtp-Source: AGHT+IFa0HMwlocBhyQVWEI4wW6URTgMPB8gNjtBmIuHK10dYYUj5mZIjH1dXsaiZkP9IrotHDsD7A==
X-Received: by 2002:a17:906:395a:b0:a37:bbe7:6002 with SMTP id g26-20020a170906395a00b00a37bbe76002mr155272eje.19.1707512992623;
        Fri, 09 Feb 2024 13:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN/6DcLKLHb6GpaRqOLsbKnEuKbZHWazCmSiIi/eBFKEIPXF8GGxewPt3LMu1/QmPuqGL1TiJn3S2+2Pnwv7+2+GAtdhKke2ScKRCZbkP7p4idBo/NO4Gb8tp3qxNOUfJPqq80cSgdwuOPYRRcyOHUz2/F1UTVD8yl7mwo5W1COK3w+X6jkjIUnMYSrDtD8sHj3jq+0cuJhWUPfIuM+dxs1TRpP1uKEajqm8hnuzR9x6Gd9iWUZwX+DwnBO6Fd0CQ0cFfY8e5jCM7+jjG7bJGtFq/4h02aYKmsq8giDJK7C4RVOEkIOi0Wxc6HTMv5300m3hs5jLM+LSgXxsiiQcHCQkjOUSMTmr/cQPDtW7Xl1p88eif6jhjQSpbLIp+sDeFFYw7X9j7BMn9O+y24AKmQqbPx3xhASLrICP8/lh324hdJkoQP+t7DF256Qr1iJkQIWKCtYRaC8kIIkncAZh7d6Q2rzUEMtpVRd1ayA6/Ccf2blDlOvgEZIblLSuEdjp5vkA==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:52 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:47 +0100
Subject: [PATCH v2 03/20] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-3-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512985; l=2105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qRFNx2a0sPyBufJHjBf1XzrjeKK7bQ1fasBPqhqnRAw=;
 b=8+L3XOpMWqZuFrz8AFmFy2qsmwKomGg/5nzZOYPH7CzOEOf+OTS6f8impKgr957vacUNlHiBq
 GN/FOhcaKgbAwFpT4jldS6XE7LvitjMa99xbc6Y0qCHGV6DWv5GxIHq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make it easier to understand the various clock requirements within
this driver, add kerneldoc to venus_clk_get() explaining the fluff.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ac7c83404c6e..ea0a7d4601e2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,6 +23,34 @@
 
 static bool legacy_binding;
 
+/**
+ * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
+ * @core: A pointer to the venus core resource
+ *
+ * The Venus block (depending on the generation) can be split into a couple
+ * of clock domains: one for "main logic" and one for each video core (0-2pcs).
+ *
+ * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
+ * domain, so this function is the only kind if clk_get necessary there.
+ *
+ * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
+ * statically proclaimed a decoder and core1 an encoder, with both having
+ * their own clock domains.
+ *
+ * SDM845 features two video cores, each one of which may or may not be
+ * subdivided into 2 enc/dec threads.
+ *
+ * Other SoCs either feature a single video core (with its own clock domain)
+ * or 1 video core and 1 CVP (Computer Vision Processor) core. In both cases
+ * we treat it the same (CVP only happens to live near-by Venus on the SoC).
+ *
+ * Due to unfortunate developments in the past, we have to support bindings
+ * (MSM8996, SDM660, SDM845) that require specifying the clocks and
+ * power-domains associated with a video core domain in a bogus subnode,
+ * which means that additional fluff is necessary..
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
 static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;

-- 
2.43.0


