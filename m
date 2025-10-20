Return-Path: <linux-arm-msm+bounces-78019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F88BF1B27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D97D4002CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90B615A86D;
	Mon, 20 Oct 2025 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H81aqAeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED22A20296E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968958; cv=none; b=K67mxX0mrM3CBPdRA6wLgtw9aAcX0HwKwSkqSaomxEUeoDAwTynbndF+nlP1vo6Lz9XRbyQ5UInfeqpqwTMHlQTdx2Q6BOj02zn6m7xRyeh2wcK4ekvipUaYEZXtDb0PshGRNNQzUu1wn9pyDQHQiCB337tvLI2J4K532Uz9Gcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968958; c=relaxed/simple;
	bh=IYen4mKaE/kpKiZVRAkWmTZYn1urfQk7brDzCsv319k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgMVURQCHErer2hwqxcxjkNkFQTDS6cXY2DR+Hn7BloK9RY3Gr0ZnASmqhyWKEpx64unj6n808fSrrxz98oAner0lbBmQp95dqVdsAUrNP75AUI2WOH8T/9ON8IZZUsLhYCDdNIAKH2X6N+ULjKL1t8Ltu9E/3ZEyF+hzQocjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H81aqAeA; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3776999686dso6877481fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760968955; x=1761573755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJp2fBpcjCusutwlkqxT9oQcDrmYwLlKVvwo/QslnqE=;
        b=H81aqAeAfinwSthPoonv2Sh07WUvAm0Rxlfpzf8pKBiKjYEoQlRw8Hete9721uSY8I
         4T8QufPmQIeifh3YN7g7kmk+bd3ujHC2S8T0dOll42413B/qCChdiNEPJDqaQznmAA5Z
         TuU/tGo4Vv1i4DHYrXv9cqjgCX8ybx7ZBatE/59kDi4M4UwYU/VfwynWHvG0/OQQ9ii7
         UHDVQqO8QtuCXM+Y9H3KYf3HjPMXaZp7jATwPShOb/EvowowZq27r/by4MbeMzzf/nWh
         VtaoGEkBFOQwvWcK8hvVloV154Aa8Kyv/6+Dat7NURvizgEvpbFiCHOGpYgtsseNKl3k
         AU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968955; x=1761573755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJp2fBpcjCusutwlkqxT9oQcDrmYwLlKVvwo/QslnqE=;
        b=FC/7RO/QDygk4L1VXGTxNVULsK//WMhZ3LkSrGuA50xCSJgVHl+gQe8VL0Aws+YYrz
         d54dcLjTYg5HDO1K36eWLJ3v0inFcdxLDUC/t8e+GA6iiZdqYs7INy89sscsGag/lznX
         NvKbGpVOxEJS4fBUyOggZD7VlbuviF3Cjo43RM/AFdlkpFtbanYyL+j2znyceL3XuDs8
         91zo9UkcWy/Y2egk//DAGhAXnEiHNyX7N5x3efzRn8jN4qE3YimBOH0QkQPYUOQyCIPa
         gLGptb1kJVD37jkLh9qlP96kHW1ikVmeKdwsmM8/UIHlxQ2quK4QzjMIELAn/woYqCVn
         5nuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZZryPpPkQv6PMKjGag0t6JDBKFBnvTX5+aE6NhAByEkjRIWcIV3LoN9RXl0JrbvWJ5KZqufRTZI7j2Ru@vger.kernel.org
X-Gm-Message-State: AOJu0YyP73T35445zaOcSzfDle9QjXz2vMRerTmaszdZUK46Rdoses8b
	ZIO+Zcy8OvjJT6BfmnbXtwC4W0eQrUOm5yDiWSlPE+hs8SFuA5bzpR+g1Pm+uo5JhgA=
X-Gm-Gg: ASbGncsbK5tlA7+Vc5NF5scWq7oa/UCBPx9WrotfLrjvsStSujz5+jw0kBo86205fZT
	12aWVFvijg3SK3NO/o06MiPUXuMvxI8KftsUtI/YElo6aar7/AM06u8phCkiwDuYwJJAMRVhzYi
	kg0xHtMW7PCb+LEZAKr5pzlE2DBOHUUEQhNFNiaRHB2t613pJeOEEc7tdcO63JWGxzSdx2KV6zO
	HYByUOeTAH5fBHq/OQBcWrrjpsW97n1QFw4r3OfA+Y6T6hfsDs9PWMp+mre86liYMWP5Gb54FEd
	F6ZeeIvMAK5Y7Mpu8aHLcRBkhOgZnhCScb3RFbIJyD2871oVW7CmMBeNdGg3DjH66Y+P1+WxcFA
	7YeODJLaK7xUxxHbpIoJSpRYjfgDNLwM6ZF+L/7oHv/sFTtbiYjdLMTZJQINtzS7lBBC6Qwp1ZE
	rbD3yjdVTlCcI6/KfJIf4OCEqnZ/F3qcDL0U3hKSfn+r0=
X-Google-Smtp-Source: AGHT+IFjvGE/DY31KxTNTTPZ0VENUkE1XZO+/yrsdWZupnyulVF2s0a5bxHOzsTH96wXwt3npeo5Xw==
X-Received: by 2002:a2e:be83:0:b0:337:e43b:655b with SMTP id 38308e7fff4ca-37797767e73mr23794181fa.2.1760968954070;
        Mon, 20 Oct 2025 07:02:34 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9508d89sm22639131fa.37.2025.10.20.07.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:02:33 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE lite
Date: Mon, 20 Oct 2025 17:02:27 +0300
Message-ID: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock is needed to stream images over a full VFE IP on SM8550 CAMSS,
and it should not be enabled, when an image stream is routed over any of
two lite VFE IPs on the SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..fc838b3d2203 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2561,12 +2561,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE3 lite */
 	{
 		.regulators = {},
-		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
 			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
 		.clock_rate = {	{ 0 },
 				{ 80000000 },
 				{ 300000000, 400000000 },
-				{ 300000000, 400000000 },
 				{ 400000000, 480000000 },
 				{ 300000000, 400000000 },
 				{ 300000000, 400000000 } },
@@ -2583,12 +2582,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE4 lite */
 	{
 		.regulators = {},
-		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
 			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
 		.clock_rate = {	{ 0 },
 				{ 80000000 },
 				{ 300000000, 400000000 },
-				{ 300000000, 400000000 },
 				{ 400000000, 480000000 },
 				{ 300000000, 400000000 },
 				{ 300000000, 400000000 } },
-- 
2.49.0


