Return-Path: <linux-arm-msm+bounces-651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D47EBA09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A85A1F253B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DFF26AD1;
	Tue, 14 Nov 2023 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ZtISVJTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749AC26AFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:34 +0000 (UTC)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19688E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:33 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-66d1a05b816so36655716d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002832; x=1700607632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GFqO4G/MklaH9jw4JV/Pzz1KPVstRySwUanh5xWC0=;
        b=ZtISVJTJCYZ6elDfWkkj9pMRaQj8ZioTh87/QBFBA+Gyzikb7AWrcgrEPKvpJakv21
         HQK0j9aczdpBOXBCRFxn1gPW7nGRAhKjZbWMyNjT2CcWtKmIDL5/itoVUTuuAy8BDK88
         SqYlIjZdbXtcucm7TAC/zS9HwXeydJyAkRO5DVD6F5AUaNB91sXw6mFCPKv6RIBIFTjY
         YFQy6irU8RPj+CtG0Wp49yeq3BPVyzzACOgcvWq9UZE/SC2n0OUkwvF5tnx0w5e32yhZ
         2Gk/vH2NnslvKMNc7csFCI+xx5eTafoIIFL0eoavaqlapmAUauVy+WlopKNKINBmaAdp
         /UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002832; x=1700607632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/GFqO4G/MklaH9jw4JV/Pzz1KPVstRySwUanh5xWC0=;
        b=wXcrKH9RDRuifBCUZw0p6SRF28zsmAENG1Wn/EbzLe94J2vRpq6N47D+067ykiynZg
         sSopUmtGK8/+vrD7KGJOfdsWsObsE2rsZbrNgK9cvmL9ifBRa2uYHBRAlOd3zwJRSLLR
         ZkyVjWoBAJBzpg9Xl6a0SAp68HAC9mb7fnAOIu6HjtkHgBT4DhAqQBz+FPJilF8iu/qp
         8FVys8OMLu+IBJj8SVNWwZNzFf9gPzx94foYukKZDMugccglhH3jjh5rFhyNauYfRi0M
         0mbB35E36BNOB/NYkv78QcC0q/6SCMZV/vxVLt2aDv2+Po81nR0Cn1KM+hDY5hdeLYp9
         xJHg==
X-Gm-Message-State: AOJu0YzTv8amiH6ALIFcfBtqZkKPRQiKLzMv1pKspS4ddlJm17c6gPwx
	ns8R/bY7CyIMho4+T8y0Kgm7rw==
X-Google-Smtp-Source: AGHT+IGs8pOHCMY63Ix8FFyLk36FFEv+XiIXC0agrgFQ+oxUKW/tRhs6EBRxYa3gRpVrFgUGoNzaIw==
X-Received: by 2002:ad4:5987:0:b0:677:a0a5:c226 with SMTP id ek7-20020ad45987000000b00677a0a5c226mr3522207qvb.19.1700002832113;
        Tue, 14 Nov 2023 15:00:32 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:31 -0800 (PST)
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
Subject: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
Date: Tue, 14 Nov 2023 17:58:30 -0500
Message-Id: <20231114225857.19702-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 2a7d980e12c3..f0b3cdc020a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
 #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
 #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
 #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
+#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
 #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
 
 #define REG_DSI_VID_CFG1					0x0000001c
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..f2c1cbd08d4d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -745,6 +745,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
-- 
2.26.1


