Return-Path: <linux-arm-msm+bounces-20401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE618CE60C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C98281BCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E4B1292E5;
	Fri, 24 May 2024 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgLxo3N0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7F1292E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556814; cv=none; b=JD/T3FtUOA8Yf5Km+Q+cYFG6QgMTNjJzoqx/8RlJg8mwqpobeMNBlvmwA7HvDGgZoc3jHqR9/Inx/WhvehDvI2K+TbsLYoeDYY60HLgx2gDwnbrtk3/yx+Bxkt9YpQ3bjHD4BmsBu9xo7oBzzBEOEK02y654CUbbWWb0Z66ktWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556814; c=relaxed/simple;
	bh=edX0EVhDlR3P74S/rdsu2HwqaRU9x7uNrFINA9VNrxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNyOoOyyJlzWe5kF1wbxUHFvo42gKiSmJpKmAAO+1b8BvGOw/IUDlrmUEMcCciv8Qr7vwrrzwD0SU6X8kezalpyYM7eKOY+K9lTn9O5Mn7ZreW+0MBEp2ieG44Cm9vZZkDnhk/KeqpOvgeBp3Bh0DSajZ5WYLhH8Lod4mWQAl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgLxo3N0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f966840af7so432269b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716556813; x=1717161613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
        b=HgLxo3N04x8/CylSMmmPE1nvyjRFrHzbqnMh1MOHnkLh8S/l6GGcTmQTQXm7732dpB
         I+8PJ4LhWXwTbnxfaD5dpkAUIYmTjSG9+hkASINimj0Qjj1t9Av7KzMruH1O1KpCJs9s
         AgDKlDtsLiqND6LejJTF4e2oY7P8oVYrM+q1WHKi8Nzm9J9X8MaoEgH2QO+AkLW3gNyN
         D2tuh7fEbSb4tkzpFVrEgPdfW8go7c25EVKY4s+5nqu7fBwoW6tnVFHpI+A7Ur/jtod3
         kJxx/JocMJIux9DjLKAB2X+3XQu+GJVkl9HWjJejOrRwQjfPcv6py1Ye7uU1gd0zojKA
         5Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556813; x=1717161613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
        b=njU1Jh5wyc2QMizJx9ySikaVNa4Q1LP1SaBzVUljkE7LQpgBVN+S6Gs6pqUnRPS1AZ
         30oWkA7Fw8HLtd4wRup3YEG6yZ1AJWsx0H3sQIPwN9uxSAA1gGr3QtxP/Wh05e6zRx++
         TR6u+ITDqHRj2Ge7tuMbAhLwxsRQJc/KGb3mKQNRNb//2TfLo6r2tlL7MF4Nh9BI5KtG
         XS0HOap6vJoIeg1tYBm417MmmzW/fpsoHwC4jbNaDBHG4/pVbpvX7qem3GqAO1pL5Tsv
         2MYlwlF0mX9nC8Dj+uNHvQX6ed69EalUVfel8WY2O0F0KxpvsHTRHIW/tZFggDuOZpxS
         af5g==
X-Gm-Message-State: AOJu0YzIbdd2R7bCIfamYLk5Kg6D8k3y0NTR/Z9FpUf6uEA7LGDOtQex
	Kh0CHG49j+xMdtuM0VgGe8eWm5P4ElTzrXRw5rAIvXruzjzLy7F14GIzttvo8QM=
X-Google-Smtp-Source: AGHT+IFTBEqgSXOTYEBmmTBP7ahN+ciJeUale1+9G3+OEB3mk4T0neDI0vGwWmLizhpygbPe4PvKvw==
X-Received: by 2002:a05:6a00:1f0f:b0:6ec:db05:36c3 with SMTP id d2e1a72fcca58-6f8f2c70be7mr2301910b3a.4.1716556812687;
        Fri, 24 May 2024 06:20:12 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 06:20:12 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:24 +0800
Subject: [PATCH v4 4/5] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-4-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1725;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kdfjO+qJ+tyWY/8kntVCewHf4UP39s93vNEdOjHmAf8=;
 b=cTGzbkJlwdCbXS+5swInq3OKf6W/F1COYuaXwxsygv8aAxqTpynn8511jyeBz+cpg7BXte/ZF
 /NCUw9kAXChB8P18ZcwmB+O4etXAmQbKOd17kMZjCuQ/I2vq8MUqG6D
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 47f5858334f6..7252d36687e6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -857,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -864,6 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -901,6 +903,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }

-- 
2.34.1


