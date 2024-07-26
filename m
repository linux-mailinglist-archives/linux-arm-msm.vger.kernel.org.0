Return-Path: <linux-arm-msm+bounces-27077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C01393D209
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 13:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3128D1F231C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 11:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FC217B42B;
	Fri, 26 Jul 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOpzWCsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E417A5B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721992727; cv=none; b=TjJv6HcD2sqvU55us6J5HQow0T8e6vml3/LLH68vB5dvCj9V9Gg6DcPzchUa/+VekWPwsgn6bxhoV+Iz/C1JuYyYQehWqcLXNVh7XxJ9RPUb4bMlgfiwsEWpNiXL5Ugz4K+5IVUCAFFj59pk/SjQrHNO2yQpuTEhIrCW/xJYBQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721992727; c=relaxed/simple;
	bh=/dPro3zmVHXBKc6IoJRwERhe3BXDGxTNO7EBgEZy8h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNNXzhoAIV++91ifRl71hu9szXe3FaQyYyl8aLY0R174zuy4p/6RM/fygz0B2b+Psc4xmlDQV7Utr+zjWEKws9kFNzohlfv3iAxfkXIgSP1GsXKNxld3ay/9Cy5/JVY6gWoHPC7TgNzTC0b0culilidJIELngdBsDkbUZCw/Un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOpzWCsb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so198505066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721992723; x=1722597523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxGxU8SYIBjBWPzi4Sb41+wNLkpnb94P+sh7kj+6cNA=;
        b=MOpzWCsbzeg4cantUz4Y6bvtEe081OTTCjfOiAuOkxAeohDbl4fk0BPOlTUrwOCnPV
         PR+6Eo/TRNwfQ6U09iHAdx5JIUuC8KKI7bRZ9yyfCqdy2U2nimDvm/53aeCCfsdnJbPg
         DrRPEdpxp5L0G6/u9BeJ+0e4/pI1q9UOUcRLQvnkYjwb7U2/I0FtZO84NNUtnE30IY45
         vuh8ClpQeqUpR4FibhM5Olfmobc+eMlZV+hFSqupL18hwatDo4alYpMpHiUzcLiAPo6M
         VIorIaM3iYff6ShlMFwdd8qz6Z9FdFzJ9Ru1GZIJSHfqdHv5fqY250l9fbrtg2CdvOM+
         2Nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721992723; x=1722597523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxGxU8SYIBjBWPzi4Sb41+wNLkpnb94P+sh7kj+6cNA=;
        b=TtttbcKLii/Bd3bXTJFP/fjH2++TJLvXvidhAVHr6vEluFmLvAiVfcMKgM+o+IssPU
         sZpzbRWdYEsOqkhLC3jTf8rQ4UMbq3zsGFA8Ft2l/aZnuoQqsp/qdNsVNtuO6H/0F6pA
         6Op0S2uXgcLd5plCamc5PPfb2aJvHmkdi8JoAtxa9sLAbyCZNwYC0mchlSF+v+gQK08W
         byiY3Dwy0zBmu7t20EMdsl13Luiutan5PbIUWisb0igVVYTNWmsyuWfLRIhMQUInBPvj
         glMGcB7J55GYhQNgLCA+udeIH78hNa9kHpLjakdMLKC77NckH51Iw/Lut2WJFvBvCNOr
         alrw==
X-Forwarded-Encrypted: i=1; AJvYcCV3PR7ifuk7nOfbSBBGLJDCzIpWNwk5xzagvJVeIB0OYteAGZUW0plpuknBowI+0rm7KJFrLFmSCpwTJbGHoZ6xWjEZoiNGX9EMPDF/BA==
X-Gm-Message-State: AOJu0YxN/9WHR9RUz9/pBRVVaA1uvgPzGLToflDRXV7XBnyGDgKgvSej
	I9TNPvvqFOTrl/ZdzIeVf0BhGjZFDSRwWKu3e+lO+9kS97P1qgA9CT4gPFa1lqOZJLxk0PLKbxE
	z
X-Google-Smtp-Source: AGHT+IH+rwWCKvZykJlAAH6LNkpi65KtAACKb0MHHBRIglRLIVIJhjuI3O0okF7LvJcM+Fs+Wg3qfw==
X-Received: by 2002:a17:907:971d:b0:a7a:ac5f:bbfa with SMTP id a640c23a62f3a-a7acad1c3f2mr345732466b.0.1721992722770;
        Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:18:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Jul 2024 13:18:24 +0200
Subject: [PATCH 2/3] MAINTAINERS: Update Konrad Dybcio's email address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-topic-konrad_email-v1-2-f94665da2919@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=1340;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=/dPro3zmVHXBKc6IoJRwERhe3BXDGxTNO7EBgEZy8h0=;
 b=ju0yvv6H2nwlTdVb9cib/k9p3rqemfp5NXS7b/Y34MGtZuQUegciMPzF7tHC7+U6QA00B1Za2
 ECyneyJz3BfD/m8cFCsM6T6occxCyUbApmwMI8k8On8FV3B08w8yBoX
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Use my @kernel.org address everywhere.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9200d953868e..6c7d3951192f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,7 +2745,7 @@ F:	include/linux/soc/qcom/
 
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@ -7107,7 +7107,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robdclark@gmail.com>
 R:	Sean Paul <sean@poorly.run>
-R:	Konrad Dybcio <konrad.dybcio@linaro.org>
+R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
@@ -18765,7 +18765,7 @@ F:	include/uapi/drm/qaic_accel.h
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.45.2


