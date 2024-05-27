Return-Path: <linux-arm-msm+bounces-20632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB708D04D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 16:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C867B1F2179E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A12016F852;
	Mon, 27 May 2024 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOAskF9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB516F84C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819841; cv=none; b=FlIyqki46d/mvXxQSkmbbOqevPN7FxBMxhIVF8RhqfaVRlNv/Lmgl+w9cnYpvt83QItJqrp5b7fooNwNjtWTWr4YiczqptyMjCZPLUg6GqTOhxYpaWidj40EHDzg+9i1km/sBfZpJNjbNqD1OpF69qLJDXT7aMs3b0Fxa1Dj9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819841; c=relaxed/simple;
	bh=edX0EVhDlR3P74S/rdsu2HwqaRU9x7uNrFINA9VNrxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZZb/B/MEnrqytY0ckOrHO2XB0UoOJBooKI3udw9z7Gqgxm2AZSjGnUpsakge+FNeJKrDSwCHmvspkn1/DgLSrPMCn9gXKxRhR2JBxXd6ZFgBSTXM6TioTXB9ms3myFnAeCZdQJJkurVhELS1RltTX4a3x7kh5K5g3qsQYF6p0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOAskF9p; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso3987024b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716819839; x=1717424639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
        b=nOAskF9p4zBfw6Uwh6EaRIG+hX4R/xd95HCNFNHQWGkIqxMY2dPovOSGuzI5flMpUS
         l1NkAhX3Y+WL7wQOz6iOUww6Hm4Wi91c4hE19TEVfgFfNfUsfkb016YS4VGdKqvwRdeL
         fuQc0c5ZCe3SPJg5dke93+3fwVTFiihNaiFo47CIYhL/DlOz6C4FoMkTC2jPTwn/vnC1
         6iu39Jm+6rpI9XUnqRffq0b0NDoz/qvpccsE3thWMtCHFuLX/6Hs9PM46YpLJXikavGn
         IP6MaKl8AZ55jip2YAD/zoa/lkgOMUcxx7caZvP42Xejdv/bd4SXXvkhUVbOaBPKKqg+
         LWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819839; x=1717424639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
        b=XvgKm3D7od9u7vW/hAW5zqcqFM+XDtPdq5cTP7pQuvmtWg+gG13RIlf6jOMo/faREi
         WGr4yHjz+GJ4E5Kb0WG7Yt2CUsDI27RZ/GESNCxipWvUjq8ova7MAgru2NUC/xgTygh8
         rc0TAubN07x6t7SMsCwrCzUyx6LADrAGAsXAFqE4gxvhUy+ZtKtQ2rwLXpstkxU7UWY9
         +HNyl5VI84mFN6+MBQYehvnwR/t29GyzRKRr6TR4SJ2cI2Mv3e7AdXXWrjz2MU14lXbZ
         I6wctDlyZk1TtOI3DQ4RanfcN5m2lRCBL3E87zvjynwtHZg6nYnnqkk62Bp1lp9G+Rx8
         o0Ng==
X-Gm-Message-State: AOJu0YwZXuom6rYEcouzVaJ9o/Qu3jhUepppfURKK3bk6Vo++UP9Byhx
	HF8by9FjS+lH5hX/aoeoH4OpjWPZhV+T64TsFQnHpsZ6f9XyOaigAF6j240QPAI=
X-Google-Smtp-Source: AGHT+IGZUeImmFZRD7CnLeMPw/skw95bTK15ZusEaOjy940fGLqfHaFZVT0WKxGpOOOhS9SBld6T5w==
X-Received: by 2002:a05:6a00:2c94:b0:6f8:c94f:578a with SMTP id d2e1a72fcca58-6f8e9fc10d2mr14002563b3a.12.1716819839415;
        Mon, 27 May 2024 07:23:59 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:23:58 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:51 +0800
Subject: [PATCH v5 5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-5-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1725;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kdfjO+qJ+tyWY/8kntVCewHf4UP39s93vNEdOjHmAf8=;
 b=WZK+fi9R1wzG9SG7mvTJ8kFWQ2CEBx+pPrg/R5DlNh/d01o6/7FKCZ/kIxSBneAYyg24Svub0
 MwG+ROnBoCtCqjgeMdjLNXvNtdxbpy3X3umPH1oZ8zS7n1OuVD9mief
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


