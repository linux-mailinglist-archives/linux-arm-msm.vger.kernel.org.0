Return-Path: <linux-arm-msm+bounces-21812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2D8FD73B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DEE8283548
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613CB15884E;
	Wed,  5 Jun 2024 20:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KJuLXgkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445915D5C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618233; cv=none; b=occqNuGD7Cg94sBoC1PR9+YNNo2mqOXLOwfK4mv8feGpM+9ROrHVmXQE7I2opBvnkE/JeLb/jxdleb78b63x52KbnG6lzvQGBwOLCh2Qszj2ihMUPhKTHgJC7rSUAWXJ7sZfMB2uidU1pp9Qh9wfbxgs7ZsN3X2Tu9fuk6DasT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618233; c=relaxed/simple;
	bh=XvP/BSatzMPPQUrvM0ONiFzdTKIB5gWlXrgEDOGJq00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sw4pCDRi7tAyIEHoaQbI9Peku9VYgioIZdOXuVCPwtvnrToeQ3R1eHV3tBaPIAkdVCJNWDkIOJjaCimpJMFApzAaLp7VrlFK89yN4dRU1B7eS9hejukZML5BZK9PLDlpxwtiypfAQnwr8SbjPCt8veD+NwBRKXvaigk/rjOxMRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KJuLXgkC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso2765491fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717618229; x=1718223029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsxI5OJmE2RBtxZTRf/cc3jqaLSF49oqnXau0+l27fM=;
        b=KJuLXgkCD43NHL3OBkv375oEhKOlIT2afDkq3oQdis1ki/WbeUuD8PgBUO+tXEWGJt
         YCJN5SQVJnGW+b7zimg0epzMmyvo2KT0DrF5hg+MKOaEFClNlakvhNC8lh2Q4+8Nh086
         9ebON9WhazR/Ojk4CSgB14eYHf/yWVMbLgsshyRGEvgh1vmHEYHLnsA5KVVtrWretAFY
         SvjVWpP0OMj7Rn7mmqN+u08QzcltJ8eNLiXeJbjQ3EmjdV2+YRj37aowPvlch+0/6QwB
         P9syLN5XlTaiX4hIAvQld+W+3XuY8evkU2xQ41WlpvUACEmn/spslAZATmo+/otMvzx4
         QXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717618229; x=1718223029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsxI5OJmE2RBtxZTRf/cc3jqaLSF49oqnXau0+l27fM=;
        b=LX6oA2Gx4/3rysvVwwD+b6JYPV/vNFkHNG2C6b85d4TRgXITNXdCz1E3BwyNwQELEi
         M+lc2oiNS3AyD+ZyIK+kS2HELCeBXetG/3PRMDy3rRfBdMxjuKjgNBR2ehQEvOVj9AgV
         BVqgWO4Bk4P0pL9VKZ7jl/ryqdhON6Hx4FXVlX+uZWWcVZMnpzJp1S+0IKesI8eLYS40
         aP9gbtkWXDO3bZ/STYvJo1q9mJYSuykshWGbfGe6r/CNodGrftSW6u2iOBOXAi1MIQiy
         viT+FWJFJcCY9SZxlD58mqcyBUEYf/UFPs8wPd42T+lNFhRbfoNDP4TiPhYQr76WPBr3
         YK0w==
X-Gm-Message-State: AOJu0Yy0dapFEIckUMq7VDxhQ5DF1vG0n6lNIk37/wS/WQ1t4XnOYHKh
	TPXMXTVT9F/Li0V69WNytImdOYsaOiB+rWoD04amWmvhbr8Jtn1PE0tD0qPm7Sc=
X-Google-Smtp-Source: AGHT+IHZPDBP/2G+iM8crT7CqzDpqiOTqjkerYD9t+xoHL3b/RsYHVFEDdIehn61CCgVDhqj+ckVNw==
X-Received: by 2002:a05:651c:b2a:b0:2ea:d142:d2b2 with SMTP id 38308e7fff4ca-2ead142d3d6mr1982801fa.34.1717618229093;
        Wed, 05 Jun 2024 13:10:29 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:10:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:17 +0200
Subject: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Add speebin data for A740, as found on SM8550 and derivative SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 901ef767e491..e00eef8099ae 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -570,6 +570,10 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.43.0


