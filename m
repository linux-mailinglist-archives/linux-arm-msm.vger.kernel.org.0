Return-Path: <linux-arm-msm+bounces-20630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAC8D04CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 16:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F881C212DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AB51607B8;
	Mon, 27 May 2024 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITL8eiBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED26161319
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819827; cv=none; b=VVgsqkJf9STQtwUIFpJp3wobwZazg0pvY4b11PJpqhc6lfloLE02dGdsaZyElQfB3L9k62FxnqU77B0VmmPzu90Zk7InqLH7IAnGex8iqxzvxGqgLKKSKze0SBE2XWoe3KZMkA69U/tdXgzsU+ufigCKb/EcaOavpDX+NoghYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819827; c=relaxed/simple;
	bh=puwV6VMl3Gje+6cIe4adoHwyL8CXWB3PvIs7MINp1lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGRhbjUk32/rnaWmC0HW0CMDP4UwJLB0VUcHWm7t+3dKEnnHFujGd24M76UcO0ZI6693yOldshkpUpT9yqs9CaBeF7/y904/ZZLZdazcbuhtUMb/uCMGwy5rBn6dSBsdkOu8t/0g/Uu5biuY9UpRa+m3ZWeAeGhs/1KXqr0knpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITL8eiBl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f8ecafd28cso2629593b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716819825; x=1717424625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
        b=ITL8eiBlZbFXSrNKy7PvsQzawBX0cEqhk2kSk0RSQjGEaTcfXre2xxoKi5VRj18jWR
         M048OKP7cJuKfnH8sFZy2TND2i02wqV1MnPFdvDI/iSN872OV5Q0UHiGiFzH4pQoCOKT
         0CF+yukHAVZs1sF8s0aFhFKhDzI+wA+fzT0schUH7Bm3Q2iRtWvS1GJbuQsob5PD1ZP9
         J9J+Q23GYlyW2CvNXoqz5aleY6YgRtAWKE8LL/5+e8+pgAVSX8rvqZEzo0WxY0MbO9Gw
         jLP16wF0o3yhU2dEN3R4ZicuIs+MYbvLiAoX4nyQvEZ1BEOq+NgyzvZHR0lNyXe7Lsqi
         qYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819825; x=1717424625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
        b=VE1Gk2vUpzhEXyeuNARvEuv96EwOEt/unGRwhJza/xbTMpHIx7KCQ83cXIgZq1oipn
         QKZ0/LM9jq4CTwPj2O6vb7O+1sHtVPOv5ASHSXhOEMeQi7zbOXAlrDIEdoD9ma1jLovA
         kZpmd/jNtCThk5HbUj1Rl5bSS71FoV/AOSCqiVXXRVB+HlNmA+QTGxzu+k6IJ/7Mx1lI
         4ECxtqEp3YdMhh8/WotPyt0eIg0LbGUyCizqQ+Um0YWdpwEwAcToc9Vmq+x4iH/8liIo
         Me/uTwWAqDrW0ZPQeoneE5/bVN4lXnWR5KQ1B9enQpsHKGN95pf62MJmDG3bbW0ttpuD
         Vo4A==
X-Gm-Message-State: AOJu0YzyPpSix4SRFfQUZf2vbj2RrIVXd0L3Qct2b0GJEoYsJft3uOCk
	VrF9egJdATBdUZYFc+s1JPi0p8LA4P4Zcf3CwQ2rXVk1zuwFWwx3WUx0LyZbrNE=
X-Google-Smtp-Source: AGHT+IFNKaRSlZszopjikYU0pMskYc/ekBfYriMXVMO/i95lcWdRC6YJKq+hsm5J3tzzdDaM/zWi/Q==
X-Received: by 2002:a05:6a20:72a6:b0:1af:a45a:a8de with SMTP id adf61e73a8af0-1b212d5aa97mr11310422637.5.1716819824793;
        Mon, 27 May 2024 07:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:23:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:49 +0800
Subject: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=886;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=puwV6VMl3Gje+6cIe4adoHwyL8CXWB3PvIs7MINp1lg=;
 b=ZogImoZXzCH580LPFWHl29ocg7xqFmLTY0xbQUs0QVH/Rf4R1calGI+KqzyIgCRbmiPD8fn9V
 6qwpylPoVrBBEX6cdG8aua9l2xblGmOgNFwbUeRWLLOM6Wl0yuwy7Ny
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Enable compression bit in cfg2 register for DSC in the DSI case

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index f97221423249..34bfcfba3df2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -177,6 +177,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	if (p->wide_bus_en && !dp_intf)
 		data_width = p->width >> 1;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1


