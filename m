Return-Path: <linux-arm-msm+bounces-643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66C7EB5B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 18:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D4E1C20AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 17:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC502C1A5;
	Tue, 14 Nov 2023 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="OC5xPt1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AE2C1A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 17:44:06 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D662D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:05 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77891c236fcso378454985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1699983844; x=1700588644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
        b=OC5xPt1k3Xh2bhIYSKP0jgJJ2babStSoVDqbwb0oFKt9iN+m7MIjh4YwaXzI3BbOyb
         7rEhIXIBV7flKRnqq1K5m4NK57JiKZzbbvwZwQAZJ8/QWbekN+Rmn018z+j63UeDiVjT
         Own204oYyHBD4tpEg9lvKLhUlBr6uKHx3XtzwdUlMcwSZ/32BRhuyjgqPV2sNh+7WrSl
         Y82T7pT0vOgoehPmKyetF2Sfx//2I99CaCtoSilF/fFYkGqMdhQqNbiCP3rIg/Fn4FOH
         oWfWysShI1nUUhCqsaRLFoEVb8Hvvmd6D810VKgPqx4yx4ev4ntm/Uub5oooLmM0mSJX
         cJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699983844; x=1700588644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
        b=vd39fx07JycD2ndyj+8ZngK7CAlLEzRdIUdNizLQjeDDraebPcTwezMeu4H5oUFTNF
         eSk5kTT3HimFyo/mk2bJ7l69Mb/V2iqc6fD0lBksDORZ/5FYiKMV9/hT6Z/SE3mk63Xn
         1OYjGjey0MXfmyEbfQZOqEhA5gvQE547/BFVTBhPeD/+x0CoufbblohyW3Yjph7/7CZm
         he4eo+BnIW2p98d7ffspFu7oRdTdi8jPYqTdlUv1QsrDR8U6FjkUtVaoDHpuKUYilOd2
         jAZJHOvdwmX/FLqR++kTKN63uKFeewFgEj6gztK2pwNS5YGBk7psSj9BYwT8wO7SKrZH
         qF+Q==
X-Gm-Message-State: AOJu0YxGPDBIKQToLKtKdjQW0jxnFTu5mx+5SeqBzCUfemQKXf/O0Jtb
	pPE/il7kTWuEohweHOpmtwRu9A==
X-Google-Smtp-Source: AGHT+IEVo5nwOKH3fh3lUeHfJPuHsZveyp2ikuoOIr0IRzcdZCJpfEChO6qWMjdi051wikBpH2Rarg==
X-Received: by 2002:a05:620a:4627:b0:779:efb4:73bb with SMTP id br39-20020a05620a462700b00779efb473bbmr3357188qkb.41.1699983844031;
        Tue, 14 Nov 2023 09:44:04 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 09:44:03 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm/dsi: add a comment to explain pkt_per_line encoding
Date: Tue, 14 Nov 2023 12:42:14 -0500
Message-Id: <20231114174218.19765-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index bddc57726fb9..2ea2fc105fbf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -875,6 +875,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
-- 
2.26.1


