Return-Path: <linux-arm-msm+bounces-642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83747EB5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 18:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590E41F22A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 17:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6392C1A2;
	Tue, 14 Nov 2023 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="FXQ7dxcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B22C1A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 17:44:03 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A40694
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:02 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-778927f2dd3so303723885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1699983841; x=1700588641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thGoIvnqITUJB7IQaQsWGdMjOXMrq/akRqtI22GpJyQ=;
        b=FXQ7dxcxpBSE5zZsFlJRwBYnmmsznxRjIhYT40fqR7x6Yoo/1VV595U4yzi4D9idAt
         NTZMv5sQPmmA9CWcuAVmjsg6J60Nbjm5mWpmVlsqM8tkOZi60OQypnH4bi6bL7VcvmaL
         /jGRMbxx8RvMlI/Jo42qIhE0uNlPupx5UxjSlbn5yqr4cfLB5ojoy37+operULioqgWZ
         ImZIwpjncnWPbjq/QAVrCutJOuk7dSNLzgBL3Kx73PfyaVkod1IO8StGr5YxFrNnL/bl
         kQ6ZzqHYCBehXckAg+MlHbUmBjnaq1KKqjlsoubk5FCKlz9gjxK6K4OOnG9Orctrc3k7
         8MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699983841; x=1700588641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thGoIvnqITUJB7IQaQsWGdMjOXMrq/akRqtI22GpJyQ=;
        b=Y5cnSbcOULnehsXRmrEUgS9XSgfQ8Z4ft61NiOQjd0/Esfrsp59J9mvSKrIYJCkh79
         yGxDtQo5QWGrrEBIr0Dpc3Wgj9yrXHeD5T3WnCKVNbWh5o8lhyZYeglRXtUJj9aVf4+O
         bbE1YZjGEtvoGf0EXJjVRDbnrXIV0x85zAhr7YfynT3NJPWfgy5eiGCyeq8vvGtgSUht
         Zkr4ZWIps+vS2GKGy9SlL92UaN6aURuSlBmq3mY+beShvtkm3AG8SB6NrTUXhlu0iMBa
         s32vWBbKR4HlCb7r83qIIMyibCcGyvdq2+saAUJKTodIGEmlr+XRJ3Q4btKrEoHfuMmZ
         SFXw==
X-Gm-Message-State: AOJu0YygqakgCvRIqh+LkcqnD7T58Jxs0exqzxeQC4fHt7SISztHIlmL
	jqymWr1d1Oz/6KZvQykVLg8gBQ==
X-Google-Smtp-Source: AGHT+IHcVT+p/7lEFZr3H2gf88K+Xif9L02wc8rJZEdi8qlawjVvm/vlqEVvJKZyXLD4cXnfklItEg==
X-Received: by 2002:a05:620a:8c0c:b0:775:7e16:2cdf with SMTP id qz12-20020a05620a8c0c00b007757e162cdfmr2232672qkn.39.1699983841236;
        Tue, 14 Nov 2023 09:44:01 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 09:44:00 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
Date: Tue, 14 Nov 2023 12:42:13 -0500
Message-Id: <20231114174218.19765-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3 ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9d355cdc3ec1..bddc57726fb9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -847,6 +847,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -854,6 +855,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -891,6 +893,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }
-- 
2.26.1


