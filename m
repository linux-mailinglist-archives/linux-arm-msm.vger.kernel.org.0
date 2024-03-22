Return-Path: <linux-arm-msm+bounces-14911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A338887518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9F0F281838
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D0282C6B;
	Fri, 22 Mar 2024 22:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJHiMIIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126C82C63
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148235; cv=none; b=NaIXcPDbzyzpuloPYEYOEQCG4pLN9vvKx/zqvklSOYqX5q7yDc06vZ/ifu1slQdX3kdx3qh/Uu7IeZezKxau8T2ow+NCItp5ZQUJashLDoncLuqjh28IMTB87CmhOaE7M0zAQflG/6lXbcZ8lRuJ5qgxjgLLJIteYxCrvtWb67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148235; c=relaxed/simple;
	bh=FYZbyf2yPOkvF378S3z4qZEOEYCqy8VOkvcoGdKklqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9/Rjk1uIUMR+bo6KlRjzEHEBS67Nm2Nf2i5a3mCf7HsvjQmBXjmRz1Hpbz7fc3ZwVBwVpXN9IKrXd6BNhemcfbF8aNz28JcPJwlH+hOKl76WhJhrnD0cft/apP34gHtNlsUjTMLW5nFfx6SoS9nbrr++6DjaP1zIt1dvcapnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJHiMIIv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d24a727f78so31569911fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148223; x=1711753023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8de8313JVFAws55JUxyaSNXAKfjVdaIVQ0uDArMBZQ=;
        b=GJHiMIIvZLpgkdXnHnqLl4t+HCHnys0r5L5tXYECsBL6mV9O2ICOHwtX8w76zVatqL
         1jKpfvPGcfbT5lXef9xkXYGVHnz0pHPTfOEQbveiXIp5vC6bGPpo9SloTu4DH6OTG5Kj
         +p/0BXGxhmyb3fTffbtkboPgLidaCPLp3nbqgGJTeI7pUEHmmEsNeoR46pt+AfJYGKql
         jnldqtnLL3XwFPymDiJOHWoKyz6KpY6KhG+f4wWqGzixFsT+MlF3phdMenfmyFmHxfKs
         eMnRX1O2j7qLylD3nRKqO0FDUPTqVsjNpFWgrk3tW5p+cVubeHSmuty+25dTeO7FIjCv
         OiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148223; x=1711753023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8de8313JVFAws55JUxyaSNXAKfjVdaIVQ0uDArMBZQ=;
        b=JNykTuaOw574b8e2OaTd0yoNOpUn1gFo8VIW/8rHy01/pskbbMhPCfhAARlzGYp4ms
         THbAI1dRO+jZeh3qx9QcM3MVWCdssoO7Mp8EA/mGhO3ZSh+rztBB+OhIl+n6wUQGKi9M
         uizrx7c+6i58zX6apAcH/cR3+Ov3dQHidhK8IZ2+SH7MNwtz8CQYijrVkLzmjo71ZwRC
         Gm9yVGTmVVC99OPlriKiKOewLLQHSbYgGiuW8CbE07SlbsMFx26eJfV1NohEtFfG+Bel
         jfNrfBD32MGHS0rHi9aDnjWK/ByztIrLP47EsRuMJjME8kt+i+xDyDnhEPsh/KtrFRZT
         wOqg==
X-Forwarded-Encrypted: i=1; AJvYcCVrisGyzuD2Yr4IJ05Mx6MVJTmRf5Bnt/mt6fi86we77bNDrosu/fJgX7IQFcaKEi4MFy5smJ2tz7DknWguUrN/ZevEmgOWeU36sdVSmg==
X-Gm-Message-State: AOJu0YyhqTyLz9hcI9MKNz+2aVtifoLSokj+ScbWL2yR+E3WrDah1aGq
	5Szo1slcKGim5nKaCYInVJxNc9cFN9NrHkrCo2MPs4imdXlVoa8l5fZBd1elRvA=
X-Google-Smtp-Source: AGHT+IEcav5FSwkPoW/L3AiJ1v4Lo6/T8GwItSyp67SVBA4vPS8nZtlNDQxzLVda1AHL8OavffhBNw==
X-Received: by 2002:ac2:4988:0:b0:513:eac3:9f7d with SMTP id f8-20020ac24988000000b00513eac39f7dmr477148lfl.65.1711148222726;
        Fri, 22 Mar 2024 15:57:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:57:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:57 +0200
Subject: [PATCH v4 05/16] drm/msm: import XML display registers database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-5-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=202752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FYZbyf2yPOkvF378S3z4qZEOEYCqy8VOkvcoGdKklqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy2uHSmPrdTfSzKCJUpqnP1D/MBGVHpI5Dfj
 4YvcmlRP02JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtgAKCRCLPIo+Aiko
 1VbLCACqBKT+/6erhxew+mGqyi6+dDenmCVvi51P/G3bTgX0uYQ5mNWfF1Fvqql2DRfKrZNWDuT
 0u/9dj+kfnKs9lYjn9Httj3rW7khYQe5v+UUJJOQvWc4lvKcDiT5Dc5Mu1t8S7Np3fS3EItHdlF
 XFtHnVFN5AS01g6cRRboE2sjA4ABvVAnMprIDaVnGwz0na3bjFenLLfbyHmRcrDwq9LQgzj/9Vp
 6E2u4x6wfGqJA/kS8VP20UxdDEG+VBS4Ye2SugmaOZK9Ow1iQGprfucIJvd7N5l/EhPN02qeO2u
 MwvcNb1kW+NOJjT5oi7DEC7xmGpsvz38Xhh9ka7sR+Bok+VG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Import display-related registers database from the Mesa, commit
639488f924d9 ("freedreno/registers: limit the rules schema").

The msm.xml and mdp_common.xml files were adjusted to drop subdirectory paths.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/.gitignore           |    4 +
 drivers/gpu/drm/msm/registers/display/dsi.xml      |  390 ++++++++
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |  102 ++
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |  135 +++
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |  100 ++
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |  180 ++++
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |  134 +++
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  230 +++++
 drivers/gpu/drm/msm/registers/display/edp.xml      |  239 +++++
 drivers/gpu/drm/msm/registers/display/hdmi.xml     | 1015 ++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |  504 ++++++++++
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |  806 ++++++++++++++++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |   90 ++
 drivers/gpu/drm/msm/registers/display/msm.xml      |   32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |   17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |   40 +
 drivers/gpu/drm/msm/registers/rules-fd.xsd         |  404 ++++++++
 17 files changed, 4422 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/.gitignore b/drivers/gpu/drm/msm/registers/.gitignore
new file mode 100644
index 000000000000..848e0e3efbcb
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/.gitignore
@@ -0,0 +1,4 @@
+# ignore XML files present at Mesa but not used by the kernel
+adreno/adreno_control_regs.xml
+adreno/adreno_pipe_regs.xml
+adreno/ocmem.xml
diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
new file mode 100644
index 000000000000..501ffc585a9f
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
@@ -0,0 +1,390 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI" width="32">
+	<enum name="dsi_traffic_mode">
+		<value name="NON_BURST_SYNCH_PULSE" value="0"/>
+		<value name="NON_BURST_SYNCH_EVENT" value="1"/>
+		<value name="BURST_MODE" value="2"/>
+	</enum>
+	<enum name="dsi_vid_dst_format">
+		<value name="VID_DST_FORMAT_RGB565" value="0"/>
+		<value name="VID_DST_FORMAT_RGB666" value="1"/>
+		<value name="VID_DST_FORMAT_RGB666_LOOSE" value="2"/>
+		<value name="VID_DST_FORMAT_RGB888" value="3"/>
+	</enum>
+	<enum name="dsi_rgb_swap">
+		<value name="SWAP_RGB" value="0"/>
+		<value name="SWAP_RBG" value="1"/>
+		<value name="SWAP_BGR" value="2"/>
+		<value name="SWAP_BRG" value="3"/>
+		<value name="SWAP_GRB" value="4"/>
+		<value name="SWAP_GBR" value="5"/>
+	</enum>
+	<enum name="dsi_cmd_trigger">
+		<value name="TRIGGER_NONE" value="0"/>
+		<value name="TRIGGER_SEOF" value="1"/>
+		<value name="TRIGGER_TE" value="2"/>
+		<value name="TRIGGER_SW" value="4"/>
+		<value name="TRIGGER_SW_SEOF" value="5"/>
+		<value name="TRIGGER_SW_TE" value="6"/>
+	</enum>
+	<enum name="dsi_cmd_dst_format">
+		<value name="CMD_DST_FORMAT_RGB111" value="0"/>
+		<value name="CMD_DST_FORMAT_RGB332" value="3"/>
+		<value name="CMD_DST_FORMAT_RGB444" value="4"/>
+		<value name="CMD_DST_FORMAT_RGB565" value="6"/>
+		<value name="CMD_DST_FORMAT_RGB666" value="7"/>
+		<value name="CMD_DST_FORMAT_RGB888" value="8"/>
+	</enum>
+	<enum name="dsi_lane_swap">
+		<value name="LANE_SWAP_0123" value="0"/>
+		<value name="LANE_SWAP_3012" value="1"/>
+		<value name="LANE_SWAP_2301" value="2"/>
+		<value name="LANE_SWAP_1230" value="3"/>
+		<value name="LANE_SWAP_0321" value="4"/>
+		<value name="LANE_SWAP_1032" value="5"/>
+		<value name="LANE_SWAP_2103" value="6"/>
+		<value name="LANE_SWAP_3210" value="7"/>
+	</enum>
+		<enum name="video_config_bpp">
+		<value name="VIDEO_CONFIG_18BPP" value="0"/>
+		<value name="VIDEO_CONFIG_24BPP" value="1"/>
+	</enum>
+	<enum name="video_pattern_sel">
+		<value name="VID_PRBS" value="0"/>
+		<value name="VID_INCREMENTAL" value="1"/>
+		<value name="VID_FIXED" value="2"/>
+		<value name="VID_MDSS_GENERAL_PATTERN" value="3"/>
+	</enum>
+	<enum name="cmd_mdp_stream0_pattern_sel">
+		<value name="CMD_MDP_PRBS" value="0"/>
+		<value name="CMD_MDP_INCREMENTAL" value="1"/>
+		<value name="CMD_MDP_FIXED" value="2"/>
+		<value name="CMD_MDP_MDSS_GENERAL_PATTERN" value="3"/>
+	</enum>
+	<enum name="cmd_dma_pattern_sel">
+		<value name="CMD_DMA_PRBS" value="0"/>
+		<value name="CMD_DMA_INCREMENTAL" value="1"/>
+		<value name="CMD_DMA_FIXED" value="2"/>
+		<value name="CMD_DMA_CUSTOM_PATTERN_DMA_FIFO" value="3"/>
+	</enum>
+	<bitset name="DSI_IRQ">
+		<bitfield name="CMD_DMA_DONE" pos="0" type="boolean"/>
+		<bitfield name="MASK_CMD_DMA_DONE" pos="1" type="boolean"/>
+		<bitfield name="CMD_MDP_DONE" pos="8" type="boolean"/>
+		<bitfield name="MASK_CMD_MDP_DONE" pos="9" type="boolean"/>
+		<bitfield name="VIDEO_DONE" pos="16" type="boolean"/>
+		<bitfield name="MASK_VIDEO_DONE" pos="17" type="boolean"/>
+		<bitfield name="BTA_DONE" pos="20" type="boolean"/>
+		<bitfield name="MASK_BTA_DONE" pos="21" type="boolean"/>
+		<bitfield name="ERROR" pos="24" type="boolean"/>
+		<bitfield name="MASK_ERROR" pos="25" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x00000" name="6G_HW_VERSION">
+		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
+		<bitfield name="MINOR" low="16" high="27" type="uint"/>
+		<bitfield name="STEP" low="0" high="15" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00000" name="CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="VID_MODE_EN" pos="1" type="boolean"/>
+		<bitfield name="CMD_MODE_EN" pos="2" type="boolean"/>
+		<bitfield name="LANE0" pos="4" type="boolean"/>
+		<bitfield name="LANE1" pos="5" type="boolean"/>
+		<bitfield name="LANE2" pos="6" type="boolean"/>
+		<bitfield name="LANE3" pos="7" type="boolean"/>
+		<bitfield name="CLK_EN" pos="8" type="boolean"/>
+		<bitfield name="ECC_CHECK" pos="20" type="boolean"/>
+		<bitfield name="CRC_CHECK" pos="24" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x00004" name="STATUS0">
+		<bitfield name="CMD_MODE_ENGINE_BUSY" pos="0" type="boolean"/>
+		<bitfield name="CMD_MODE_DMA_BUSY" pos="1" type="boolean"/>
+		<bitfield name="CMD_MODE_MDP_BUSY" pos="2" type="boolean"/>
+		<bitfield name="VIDEO_MODE_ENGINE_BUSY" pos="3" type="boolean"/>
+		<bitfield name="DSI_BUSY" pos="4" type="boolean"/>  <!-- see mipi_dsi_cmd_bta_sw_trigger() -->
+		<bitfield name="INTERLEAVE_OP_CONTENTION" pos="31" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x00008" name="FIFO_STATUS">
+		<bitfield name="VIDEO_MDP_FIFO_OVERFLOW" pos="0" type="boolean"/>
+		<bitfield name="VIDEO_MDP_FIFO_UNDERFLOW" pos="3" type="boolean"/>
+		<bitfield name="CMD_MDP_FIFO_UNDERFLOW" pos="7" type="boolean"/>
+		<bitfield name="CMD_DMA_FIFO_RD_WATERMARK_REACH" pos="8" type="boolean"/>
+		<bitfield name="CMD_DMA_FIFO_WR_WATERMARK_REACH" pos="9" type="boolean"/>
+		<bitfield name="CMD_DMA_FIFO_UNDERFLOW" pos="10" type="boolean"/>
+		<bitfield name="DLN0_LP_FIFO_EMPTY"     pos="12" type="boolean"/>
+		<bitfield name="DLN0_LP_FIFO_FULL"      pos="13" type="boolean"/>
+		<bitfield name="DLN0_LP_FIFO_OVERFLOW"  pos="14" type="boolean"/>
+		<bitfield name="DLN0_HS_FIFO_EMPTY"     pos="16" type="boolean"/>
+		<bitfield name="DLN0_HS_FIFO_FULL"      pos="17" type="boolean"/>
+		<bitfield name="DLN0_HS_FIFO_OVERFLOW"  pos="18" type="boolean"/>
+		<bitfield name="DLN0_HS_FIFO_UNDERFLOW" pos="19" type="boolean"/>
+		<bitfield name="DLN1_HS_FIFO_EMPTY"     pos="20" type="boolean"/>
+		<bitfield name="DLN1_HS_FIFO_FULL"      pos="21" type="boolean"/>
+		<bitfield name="DLN1_HS_FIFO_OVERFLOW"  pos="22" type="boolean"/>
+		<bitfield name="DLN1_HS_FIFO_UNDERFLOW" pos="23" type="boolean"/>
+		<bitfield name="DLN2_HS_FIFO_EMPTY"     pos="24" type="boolean"/>
+		<bitfield name="DLN2_HS_FIFO_FULL"      pos="25" type="boolean"/>
+		<bitfield name="DLN2_HS_FIFO_OVERFLOW"  pos="26" type="boolean"/>
+		<bitfield name="DLN2_HS_FIFO_UNDERFLOW" pos="27" type="boolean"/>
+		<bitfield name="DLN3_HS_FIFO_EMPTY"     pos="28" type="boolean"/>
+		<bitfield name="DLN3_HS_FIFO_FULL"      pos="29" type="boolean"/>
+		<bitfield name="DLN3_HS_FIFO_OVERFLOW"  pos="30" type="boolean"/>
+		<bitfield name="DLN3_HS_FIFO_UNDERFLOW" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0000c" name="VID_CFG0">
+		<bitfield name="VIRT_CHANNEL" low="0" high="1" type="uint"/>  <!-- always zero? -->
+		<bitfield name="DST_FORMAT" low="4" high="5" type="dsi_vid_dst_format"/>
+		<bitfield name="TRAFFIC_MODE" low="8" high="9" type="dsi_traffic_mode"/>
+		<bitfield name="BLLP_POWER_STOP" pos="12" type="boolean"/>
+		<bitfield name="EOF_BLLP_POWER_STOP" pos="15" type="boolean"/>
+		<bitfield name="HSA_POWER_STOP" pos="16" type="boolean"/>
+		<bitfield name="HBP_POWER_STOP" pos="20" type="boolean"/>
+		<bitfield name="HFP_POWER_STOP" pos="24" type="boolean"/>
+		<bitfield name="DATABUS_WIDEN" pos="25" type="boolean"/>
+		<bitfield name="PULSE_MODE_HSA_HE" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0001c" name="VID_CFG1">
+		<bitfield name="R_SEL" pos="0" type="boolean"/>
+		<bitfield name="G_SEL" pos="4" type="boolean"/>
+		<bitfield name="B_SEL" pos="8" type="boolean"/>
+		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
+	</reg32>
+	<reg32 offset="0x00020" name="ACTIVE_H">
+		<bitfield name="START" low="0" high="11" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00024" name="ACTIVE_V">
+		<bitfield name="START" low="0" high="11" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00028" name="TOTAL">
+		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
+		<bitfield name="START" low="0" high="11" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
+		<bitfield name="START" low="0" high="11" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">
+		<bitfield name="START" low="0" high="11" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00038" name="CMD_DMA_CTRL">
+		<bitfield name="BROADCAST_EN" pos="31" type="boolean"/>
+		<bitfield name="FROM_FRAME_BUFFER" pos="28" type="boolean"/>
+		<bitfield name="LOW_POWER" pos="26" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0003c" name="CMD_CFG0">
+		<bitfield name="DST_FORMAT" low="0" high="3" type="dsi_cmd_dst_format"/>
+		<bitfield name="R_SEL" pos="4" type="boolean"/>
+		<bitfield name="G_SEL" pos="8" type="boolean"/>
+		<bitfield name="B_SEL" pos="12" type="boolean"/>
+		<bitfield name="INTERLEAVE_MAX" low="20" high="23" type="uint"/>
+		<bitfield name="RGB_SWAP" low="16" high="18" type="dsi_rgb_swap"/>
+	</reg32>
+	<reg32 offset="0x00040" name="CMD_CFG1">
+		<bitfield name="WR_MEM_START" low="0" high="7" type="uint"/>
+		<bitfield name="WR_MEM_CONTINUE" low="8" high="15" type="uint"/>
+		<bitfield name="INSERT_DCS_COMMAND" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00044" name="DMA_BASE"/>
+	<reg32 offset="0x00048" name="DMA_LEN"/>
+	<reg32 offset="0x00054" name="CMD_MDP_STREAM0_CTRL">
+		<bitfield name="DATA_TYPE" low="0" high="5" type="uint"/>
+		<bitfield name="VIRTUAL_CHANNEL" low="8" high="9" type="uint"/>
+		<bitfield name="WORD_COUNT" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00058" name="CMD_MDP_STREAM0_TOTAL">
+		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0005c" name="CMD_MDP_STREAM1_CTRL">
+		<bitfield name="DATA_TYPE" low="0" high="5" type="uint"/>
+		<bitfield name="VIRTUAL_CHANNEL" low="8" high="9" type="uint"/>
+		<bitfield name="WORD_COUNT" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00060" name="CMD_MDP_STREAM1_TOTAL">
+		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00064" name="ACK_ERR_STATUS"/>
+	<array offset="0x00068" name="RDBK" length="4" stride="4">
+		<reg32 offset="0x0" name="DATA"/>
+	</array>
+	<reg32 offset="0x00080" name="TRIG_CTRL">
+		<bitfield name="DMA_TRIGGER" low="0" high="2" type="dsi_cmd_trigger"/>
+		<bitfield name="MDP_TRIGGER" low="4" high="6" type="dsi_cmd_trigger"/>
+		<bitfield name="STREAM" low="8" high="9" type="uint"/>
+		<bitfield name="BLOCK_DMA_WITHIN_FRAME" pos="12" type="boolean"/>
+		<bitfield name="TE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0008c" name="TRIG_DMA"/>
+	<reg32 offset="0x000b0" name="DLN0_PHY_ERR">
+		<bitfield name="DLN0_ERR_ESC" pos="0" type="boolean"/>
+		<bitfield name="DLN0_ERR_SYNC_ESC" pos="4" type="boolean"/>
+		<bitfield name="DLN0_ERR_CONTROL" pos="8" type="boolean"/>
+		<bitfield name="DLN0_ERR_CONTENTION_LP0" pos="12" type="boolean"/>
+		<bitfield name="DLN0_ERR_CONTENTION_LP1" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000b4" name="LP_TIMER_CTRL">
+		<bitfield name="LP_RX_TO" low="0" high="15" type="uint"/>
+		<bitfield name="BTA_TO" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x000b8" name="HS_TIMER_CTRL">
+		<bitfield name="HS_TX_TO" low="0" high="15" type="uint"/>
+		<bitfield name="TIMER_RESOLUTION" low="16" high="19" type="uint"/>
+		<bitfield name="HS_TX_TO_STOP_EN" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000bc" name="TIMEOUT_STATUS"/>
+	<reg32 offset="0x000c0" name="CLKOUT_TIMING_CTRL">
+		<bitfield name="T_CLK_PRE" low="0" high="5" type="uint"/>
+		<bitfield name="T_CLK_POST" low="8" high="13" type="uint"/>
+	</reg32>
+	<reg32 offset="0x000c8" name="EOT_PACKET_CTRL">
+		<bitfield name="TX_EOT_APPEND" pos="0" type="boolean"/>
+		<bitfield name="RX_EOT_IGNORE" pos="4" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000a4" name="LANE_STATUS">
+		<bitfield name="DLN0_STOPSTATE" pos="0" type="boolean"/>
+		<bitfield name="DLN1_STOPSTATE" pos="1" type="boolean"/>
+		<bitfield name="DLN2_STOPSTATE" pos="2" type="boolean"/>
+		<bitfield name="DLN3_STOPSTATE" pos="3" type="boolean"/>
+		<bitfield name="CLKLN_STOPSTATE" pos="4" type="boolean"/>
+		<bitfield name="DLN0_ULPS_ACTIVE_NOT" pos="8" type="boolean"/>
+		<bitfield name="DLN1_ULPS_ACTIVE_NOT" pos="9" type="boolean"/>
+		<bitfield name="DLN2_ULPS_ACTIVE_NOT" pos="10" type="boolean"/>
+		<bitfield name="DLN3_ULPS_ACTIVE_NOT" pos="11" type="boolean"/>
+		<bitfield name="CLKLN_ULPS_ACTIVE_NOT" pos="12" type="boolean"/>
+		<bitfield name="DLN0_DIRECTION" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000a8" name="LANE_CTRL">
+		<bitfield name="HS_REQ_SEL_PHY" pos="24" type="boolean"/>
+		<bitfield name="CLKLN_HS_FORCE_REQUEST" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000ac" name="LANE_SWAP_CTRL">
+		<bitfield name="DLN_SWAP_SEL" low="0" high="2" type="dsi_lane_swap"/>
+	</reg32>
+	<reg32 offset="0x00108" name="ERR_INT_MASK0"/>
+	<reg32 offset="0x0010c" name="INTR_CTRL" type="DSI_IRQ"/>
+	<reg32 offset="0x00114" name="RESET"/>
+	<reg32 offset="0x00118" name="CLK_CTRL">
+		<bitfield name="AHBS_HCLK_ON" pos="0" type="boolean"/>
+		<bitfield name="AHBM_SCLK_ON" pos="1" type="boolean"/>
+		<bitfield name="PCLK_ON" pos="2" type="boolean"/>
+		<bitfield name="DSICLK_ON" pos="3" type="boolean"/>
+		<bitfield name="BYTECLK_ON" pos="4" type="boolean"/>
+		<bitfield name="ESCCLK_ON" pos="5" type="boolean"/>
+		<bitfield name="FORCE_ON_DYN_AHBM_HCLK" pos="9" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0011c" name="CLK_STATUS">
+		<bitfield name="DSI_AON_AHBM_HCLK_ACTIVE" pos="0" type="boolean"/>
+		<bitfield name="DSI_DYN_AHBM_HCLK_ACTIVE" pos="1" type="boolean"/>
+		<bitfield name="DSI_AON_AHBS_HCLK_ACTIVE" pos="2" type="boolean"/>
+		<bitfield name="DSI_DYN_AHBS_HCLK_ACTIVE" pos="3" type="boolean"/>
+		<bitfield name="DSI_AON_DSICLK_ACTIVE" pos="4" type="boolean"/>
+		<bitfield name="DSI_DYN_DSICLK_ACTIVE" pos="5" type="boolean"/>
+		<bitfield name="DSI_AON_BYTECLK_ACTIVE" pos="6" type="boolean"/>
+		<bitfield name="DSI_DYN_BYTECLK_ACTIVE" pos="7" type="boolean"/>
+		<bitfield name="DSI_AON_ESCCLK_ACTIVE" pos="8" type="boolean"/>
+		<bitfield name="DSI_AON_PCLK_ACTIVE" pos="9" type="boolean"/>
+		<bitfield name="DSI_DYN_PCLK_ACTIVE" pos="10" type="boolean"/>
+		<bitfield name="DSI_DYN_CMD_PCLK_ACTIVE" pos="12" type="boolean"/>
+		<bitfield name="DSI_CMD_PCLK_ACTIVE" pos="13" type="boolean"/>
+		<bitfield name="DSI_VID_PCLK_ACTIVE" pos="14" type="boolean"/>
+		<bitfield name="DSI_CAM_BIST_PCLK_ACT" pos="15" type="boolean"/>
+		<bitfield name="PLL_UNLOCKED" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00128" name="PHY_RESET">
+		<bitfield name="RESET" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00160" name="TEST_PATTERN_GEN_VIDEO_INIT_VAL"/>
+	<reg32 offset="0x00198" name="TPG_MAIN_CONTROL">
+		<bitfield name="CHECKERED_RECTANGLE_PATTERN" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001a0" name="TPG_VIDEO_CONFIG">
+		<bitfield name="BPP" low="0" high="1" type="video_config_bpp"/>
+		<bitfield name="RGB" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00158" name="TEST_PATTERN_GEN_CTRL">
+		<bitfield name="CMD_DMA_PATTERN_SEL" low="16" high="17" type="cmd_dma_pattern_sel"/>
+		<bitfield name="CMD_MDP_STREAM0_PATTERN_SEL" low="8" high="9" type="cmd_mdp_stream0_pattern_sel"/>
+		<bitfield name="VIDEO_PATTERN_SEL" low="4" high="5" type="video_pattern_sel"/>
+		<bitfield name="TPG_DMA_FIFO_MODE" pos="2" type="boolean"/>
+		<bitfield name="CMD_DMA_TPG_EN" pos="1" type="boolean"/>
+		<bitfield name="EN" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00168" name="TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0"/>
+	<reg32 offset="0x00180" name="TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER">
+		<bitfield name="SW_TRIGGER" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0019c" name="TPG_MAIN_CONTROL2">
+		<bitfield name="CMD_MDP0_CHECKERED_RECTANGLE_PATTERN" pos="7" type="boolean"/>
+		<bitfield name="CMD_MDP1_CHECKERED_RECTANGLE_PATTERN" pos="16" type="boolean"/>
+		<bitfield name="CMD_MDP2_CHECKERED_RECTANGLE_PATTERN" pos="25" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0017c" name="T_CLK_PRE_EXTEND">
+		<bitfield name="INC_BY_2_BYTECLK" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001b4" name="CMD_MODE_MDP_CTRL2">
+		<bitfield name="DST_FORMAT2" low="0" high="3" type="dsi_cmd_dst_format"/>
+		<bitfield name="R_SEL" pos="4" type="boolean"/>
+		<bitfield name="G_SEL" pos="5" type="boolean"/>
+		<bitfield name="B_SEL" pos="6" type="boolean"/>
+		<bitfield name="BYTE_MSB_LSB_FLIP" pos="7" type="boolean"/>
+		<bitfield name="RGB_SWAP" low="8" high="10" type="dsi_rgb_swap"/>
+		<bitfield name="INPUT_RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
+		<bitfield name="BURST_MODE" pos="16" type="boolean"/>
+		<bitfield name="DATABUS_WIDEN" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001b8" name="CMD_MODE_MDP_STREAM2_CTRL">
+		<bitfield name="DATA_TYPE" low="0" high="5" type="uint"/>
+		<bitfield name="VIRTUAL_CHANNEL" low="8" high="9" type="uint"/>
+		<bitfield name="WORD_COUNT" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x001d0" name="RDBK_DATA_CTRL">
+		<bitfield name="COUNT" low="16" high="23" type="uint"/>
+		<bitfield name="CLR" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001f0" name="VERSION">
+		<bitfield name="MAJOR" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002d4" name="CPHY_MODE_CTRL"/>
+	<reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
+		<bitfield name="WC" low="16" high="31" type="uint"/>
+		<bitfield name="DATATYPE" low="8" high="13" type="uint"/>
+		<bitfield name="PKT_PER_LINE" low="6" high="7" type="uint"/>
+		<bitfield name="EOL_BYTE_NUM" low="4" high="5" type="uint"/>
+		<bitfield name="EN" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002a4" name="COMMAND_COMPRESSION_MODE_CTRL">
+		<bitfield name="STREAM1_DATATYPE" low="24" high="29" type="uint"/>
+		<bitfield name="STREAM1_PKT_PER_LINE" low="22" high="23" type="uint"/>
+		<bitfield name="STREAM1_EOL_BYTE_NUM" low="20" high="21" type="uint"/>
+		<bitfield name="STREAM1_EN" pos="16" type="boolean"/>
+		<bitfield name="STREAM0_DATATYPE" low="8" high="13" type="uint"/>
+		<bitfield name="STREAM0_PKT_PER_LINE" low="6" high="7" type="uint"/>
+		<bitfield name="STREAM0_EOL_BYTE_NUM" low="4" high="5" type="uint"/>
+		<bitfield name="STREAM0_EN" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002a8" name="COMMAND_COMPRESSION_MODE_CTRL2">
+		<bitfield name="STREAM1_SLICE_WIDTH" low="16" high="31" type="uint"/>
+		<bitfield name="STREAM0_SLICE_WIDTH" low="0" high="15" type="uint"/>
+	</reg32>
+
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_10nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_10nm.xml
new file mode 100644
index 000000000000..874c3db3e126
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_10nm.xml
@@ -0,0 +1,102 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_10nm_PHY_CMN" width="32">
+	<reg32 offset="0x00000" name="REVISION_ID0"/>
+	<reg32 offset="0x00004" name="REVISION_ID1"/>
+	<reg32 offset="0x00008" name="REVISION_ID2"/>
+	<reg32 offset="0x0000c" name="REVISION_ID3"/>
+	<reg32 offset="0x00010" name="CLK_CFG0"/>
+	<reg32 offset="0x00014" name="CLK_CFG1"/>
+	<reg32 offset="0x00018" name="GLBL_CTRL"/>
+	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
+	<reg32 offset="0x00020" name="VREG_CTRL"/>
+	<reg32 offset="0x00024" name="CTRL_0"/>
+	<reg32 offset="0x00028" name="CTRL_1"/>
+	<reg32 offset="0x0002c" name="CTRL_2"/>
+	<reg32 offset="0x00030" name="LANE_CFG0"/>
+	<reg32 offset="0x00034" name="LANE_CFG1"/>
+	<reg32 offset="0x00038" name="PLL_CNTRL"/>
+	<reg32 offset="0x00098" name="LANE_CTRL0"/>
+	<reg32 offset="0x0009c" name="LANE_CTRL1"/>
+	<reg32 offset="0x000a0" name="LANE_CTRL2"/>
+	<reg32 offset="0x000a4" name="LANE_CTRL3"/>
+	<reg32 offset="0x000a8" name="LANE_CTRL4"/>
+	<reg32 offset="0x000ac" name="TIMING_CTRL_0"/>
+	<reg32 offset="0x000b0" name="TIMING_CTRL_1"/>
+	<reg32 offset="0x000b4" name="TIMING_CTRL_2"/>
+	<reg32 offset="0x000b8" name="TIMING_CTRL_3"/>
+	<reg32 offset="0x000bc" name="TIMING_CTRL_4"/>
+	<reg32 offset="0x000c0" name="TIMING_CTRL_5"/>
+	<reg32 offset="0x000c4" name="TIMING_CTRL_6"/>
+	<reg32 offset="0x000c8" name="TIMING_CTRL_7"/>
+	<reg32 offset="0x000cc" name="TIMING_CTRL_8"/>
+	<reg32 offset="0x000d0" name="TIMING_CTRL_9"/>
+	<reg32 offset="0x000d4" name="TIMING_CTRL_10"/>
+	<reg32 offset="0x000d8" name="TIMING_CTRL_11"/>
+	<reg32 offset="0x000ec" name="PHY_STATUS"/>
+	<reg32 offset="0x000f4" name="LANE_STATUS0"/>
+	<reg32 offset="0x000f8" name="LANE_STATUS1"/>
+</domain>
+
+<domain name="DSI_10nm_PHY" width="32">
+	<array offset="0x00000" name="LN" length="5" stride="0x80">
+		<reg32 offset="0x00" name="CFG0"/>
+		<reg32 offset="0x04" name="CFG1"/>
+		<reg32 offset="0x08" name="CFG2"/>
+		<reg32 offset="0x0c" name="CFG3"/>
+		<reg32 offset="0x10" name="TEST_DATAPATH"/>
+		<reg32 offset="0x14" name="PIN_SWAP"/>
+		<reg32 offset="0x18" name="HSTX_STR_CTRL"/>
+		<reg32 offset="0x1c" name="OFFSET_TOP_CTRL"/>
+		<reg32 offset="0x20" name="OFFSET_BOT_CTRL"/>
+		<reg32 offset="0x24" name="LPTX_STR_CTRL"/>
+		<reg32 offset="0x28" name="LPRX_CTRL"/>
+		<reg32 offset="0x2c" name="TX_DCTRL"/>
+	</array>
+</domain>
+
+<domain name="DSI_10nm_PHY_PLL" width="32">
+	<reg32 offset="0x0000" name="ANALOG_CONTROLS_ONE"/>
+	<reg32 offset="0x0004" name="ANALOG_CONTROLS_TWO"/>
+	<reg32 offset="0x0010" name="ANALOG_CONTROLS_THREE"/>
+	<reg32 offset="0x001c" name="DSM_DIVIDER"/>
+	<reg32 offset="0x0020" name="FEEDBACK_DIVIDER"/>
+	<reg32 offset="0x0024" name="SYSTEM_MUXES"/>
+	<reg32 offset="0x002c" name="CMODE"/>
+	<reg32 offset="0x0030" name="CALIBRATION_SETTINGS"/>
+	<reg32 offset="0x0054" name="BAND_SEL_CAL_SETTINGS_THREE"/>
+	<reg32 offset="0x0064" name="FREQ_DETECT_SETTINGS_ONE"/>
+	<reg32 offset="0x007c" name="PFILT"/>
+	<reg32 offset="0x0080" name="IFILT"/>
+	<reg32 offset="0x0094" name="OUTDIV"/>
+	<reg32 offset="0x00a4" name="CORE_OVERRIDE"/>
+	<reg32 offset="0x00a8" name="CORE_INPUT_OVERRIDE"/>
+	<reg32 offset="0x00b4" name="PLL_DIGITAL_TIMERS_TWO"/>
+	<reg32 offset="0x00cc" name="DECIMAL_DIV_START_1"/>
+	<reg32 offset="0x00d0" name="FRAC_DIV_START_LOW_1"/>
+	<reg32 offset="0x00d4" name="FRAC_DIV_START_MID_1"/>
+	<reg32 offset="0x00d8" name="FRAC_DIV_START_HIGH_1"/>
+	<reg32 offset="0x010c" name="SSC_STEPSIZE_LOW_1"/>
+	<reg32 offset="0x0110" name="SSC_STEPSIZE_HIGH_1"/>
+	<reg32 offset="0x0114" name="SSC_DIV_PER_LOW_1"/>
+	<reg32 offset="0x0118" name="SSC_DIV_PER_HIGH_1"/>
+	<reg32 offset="0x011c" name="SSC_DIV_ADJPER_LOW_1"/>
+	<reg32 offset="0x0120" name="SSC_DIV_ADJPER_HIGH_1"/>
+	<reg32 offset="0x013c" name="SSC_CONTROL"/>
+	<reg32 offset="0x0140" name="PLL_OUTDIV_RATE"/>
+	<reg32 offset="0x0144" name="PLL_LOCKDET_RATE_1"/>
+	<reg32 offset="0x014c" name="PLL_PROP_GAIN_RATE_1"/>
+	<reg32 offset="0x0154" name="PLL_BAND_SET_RATE_1"/>
+	<reg32 offset="0x015c" name="PLL_INT_GAIN_IFILT_BAND_1"/>
+	<reg32 offset="0x0164" name="PLL_FL_INT_GAIN_PFILT_BAND_1"/>
+	<reg32 offset="0x0180" name="PLL_LOCK_OVERRIDE"/>
+	<reg32 offset="0x0184" name="PLL_LOCK_DELAY"/>
+	<reg32 offset="0x018c" name="CLOCK_INVERTERS"/>
+	<reg32 offset="0x01a0" name="COMMON_STATUS_ONE"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_14nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_14nm.xml
new file mode 100644
index 000000000000..314b74489d49
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_14nm.xml
@@ -0,0 +1,135 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_14nm_PHY_CMN" width="32">
+	<reg32 offset="0x00000" name="REVISION_ID0"/>
+	<reg32 offset="0x00004" name="REVISION_ID1"/>
+	<reg32 offset="0x00008" name="REVISION_ID2"/>
+	<reg32 offset="0x0000c" name="REVISION_ID3"/>
+	<reg32 offset="0x00010" name="CLK_CFG0">
+		<bitfield name="DIV_CTRL_3_0" low="4" high="7" type="uint"/>
+		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00014" name="CLK_CFG1">
+		<bitfield name="DSICLK_SEL" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00018" name="GLBL_TEST_CTRL">
+		<bitfield name="BITCLK_HS_SEL" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0001C" name="CTRL_0"/>
+	<reg32 offset="0x00020" name="CTRL_1">
+	</reg32>
+	<reg32 offset="0x00024" name="HW_TRIGGER"/>
+	<reg32 offset="0x00028" name="SW_CFG0"/>
+	<reg32 offset="0x0002C" name="SW_CFG1"/>
+	<reg32 offset="0x00030" name="SW_CFG2"/>
+	<reg32 offset="0x00034" name="HW_CFG0"/>
+	<reg32 offset="0x00038" name="HW_CFG1"/>
+	<reg32 offset="0x0003C" name="HW_CFG2"/>
+	<reg32 offset="0x00040" name="HW_CFG3"/>
+	<reg32 offset="0x00044" name="HW_CFG4"/>
+	<reg32 offset="0x00048" name="PLL_CNTRL">
+		<bitfield name="PLL_START" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0004C" name="LDO_CNTRL">
+		<bitfield name="VREG_CTRL" low="0" high="5" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="DSI_14nm_PHY" width="32">
+	<array offset="0x00000" name="LN" length="5" stride="0x80">
+		<reg32 offset="0x00" name="CFG0">
+			<bitfield name="PREPARE_DLY" low="6" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x04" name="CFG1">
+			<bitfield name="HALFBYTECLK_EN" pos="0" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x08" name="CFG2"/>
+		<reg32 offset="0x0c" name="CFG3"/>
+		<reg32 offset="0x10" name="TEST_DATAPATH"/>
+		<reg32 offset="0x14" name="TEST_STR"/>
+		<reg32 offset="0x18" name="TIMING_CTRL_4">
+			<bitfield name="HS_EXIT" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x1c" name="TIMING_CTRL_5">
+			<bitfield name="HS_ZERO" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x20" name="TIMING_CTRL_6">
+			<bitfield name="HS_PREPARE" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x24" name="TIMING_CTRL_7">
+			<bitfield name="HS_TRAIL" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x28" name="TIMING_CTRL_8">
+			<bitfield name="HS_RQST" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x2c" name="TIMING_CTRL_9">
+			<bitfield name="TA_GO" low="0" high="2" type="uint"/>
+			<bitfield name="TA_SURE" low="4" high="6" type="uint"/>
+		</reg32>
+		<reg32 offset="0x30" name="TIMING_CTRL_10">
+			<bitfield name="TA_GET" low="0" high="2" type="uint"/>
+		</reg32>
+		<reg32 offset="0x34" name="TIMING_CTRL_11">
+			<bitfield name="TRIG3_CMD" low="0" high="7" type="uint"/>
+		</reg32>
+		<reg32 offset="0x38" name="STRENGTH_CTRL_0"/>
+		<reg32 offset="0x3c" name="STRENGTH_CTRL_1"/>
+		<reg32 offset="0x64" name="VREG_CNTRL"/>
+	</array>
+</domain>
+
+<domain name="DSI_14nm_PHY_PLL" width="32">
+	<reg32 offset="0x000" name="IE_TRIM"/>
+	<reg32 offset="0x004" name="IP_TRIM"/>
+	<reg32 offset="0x010" name="IPTAT_TRIM"/>
+	<reg32 offset="0x01c" name="CLKBUFLR_EN"/>
+	<reg32 offset="0x028" name="SYSCLK_EN_RESET"/>
+	<reg32 offset="0x02c" name="RESETSM_CNTRL"/>
+	<reg32 offset="0x030" name="RESETSM_CNTRL2"/>
+	<reg32 offset="0x034" name="RESETSM_CNTRL3"/>
+	<reg32 offset="0x038" name="RESETSM_CNTRL4"/>
+	<reg32 offset="0x03c" name="RESETSM_CNTRL5"/>
+	<reg32 offset="0x040" name="KVCO_DIV_REF1"/>
+	<reg32 offset="0x044" name="KVCO_DIV_REF2"/>
+	<reg32 offset="0x048" name="KVCO_COUNT1"/>
+	<reg32 offset="0x04c" name="KVCO_COUNT2"/>
+	<reg32 offset="0x05c" name="VREF_CFG1"/>
+	<reg32 offset="0x058" name="KVCO_CODE"/>
+	<reg32 offset="0x06c" name="VCO_DIV_REF1"/>
+	<reg32 offset="0x070" name="VCO_DIV_REF2"/>
+	<reg32 offset="0x074" name="VCO_COUNT1"/>
+	<reg32 offset="0x078" name="VCO_COUNT2"/>
+	<reg32 offset="0x07c" name="PLLLOCK_CMP1"/>
+	<reg32 offset="0x080" name="PLLLOCK_CMP2"/>
+	<reg32 offset="0x084" name="PLLLOCK_CMP3"/>
+	<reg32 offset="0x088" name="PLLLOCK_CMP_EN"/>
+	<reg32 offset="0x08c" name="PLL_VCO_TUNE"/>
+	<reg32 offset="0x090" name="DEC_START"/>
+	<reg32 offset="0x094" name="SSC_EN_CENTER"/>
+	<reg32 offset="0x098" name="SSC_ADJ_PER1"/>
+	<reg32 offset="0x09c" name="SSC_ADJ_PER2"/>
+	<reg32 offset="0x0a0" name="SSC_PER1"/>
+	<reg32 offset="0x0a4" name="SSC_PER2"/>
+	<reg32 offset="0x0a8" name="SSC_STEP_SIZE1"/>
+	<reg32 offset="0x0ac" name="SSC_STEP_SIZE2"/>
+	<reg32 offset="0x0b4" name="DIV_FRAC_START1"/>
+	<reg32 offset="0x0b8" name="DIV_FRAC_START2"/>
+	<reg32 offset="0x0bc" name="DIV_FRAC_START3"/>
+	<reg32 offset="0x0c0" name="TXCLK_EN"/>
+	<reg32 offset="0x0c4" name="PLL_CRCTRL"/>
+	<reg32 offset="0x0cc" name="RESET_SM_READY_STATUS"/>
+	<reg32 offset="0x0e8" name="PLL_MISC1"/>
+	<reg32 offset="0x0f0" name="CP_SET_CUR"/>
+	<reg32 offset="0x0f4" name="PLL_ICPMSET"/>
+	<reg32 offset="0x0f8" name="PLL_ICPCSET"/>
+	<reg32 offset="0x0fc" name="PLL_ICP_SET"/>
+	<reg32 offset="0x100" name="PLL_LPF1"/>
+	<reg32 offset="0x104" name="PLL_LPF2_POSTDIV"/>
+	<reg32 offset="0x108" name="PLL_BANDGAP"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_20nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_20nm.xml
new file mode 100644
index 000000000000..99e9deb361b6
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_20nm.xml
@@ -0,0 +1,100 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_20nm_PHY" width="32">
+	<array offset="0x00000" name="LN" length="4" stride="0x40">
+		<reg32 offset="0x00" name="CFG_0"/>
+		<reg32 offset="0x04" name="CFG_1"/>
+		<reg32 offset="0x08" name="CFG_2"/>
+		<reg32 offset="0x0c" name="CFG_3"/>
+		<reg32 offset="0x10" name="CFG_4"/>
+		<reg32 offset="0x14" name="TEST_DATAPATH"/>
+		<reg32 offset="0x18" name="DEBUG_SEL"/>
+		<reg32 offset="0x1c" name="TEST_STR_0"/>
+		<reg32 offset="0x20" name="TEST_STR_1"/>
+	</array>
+
+	<reg32 offset="0x00100" name="LNCK_CFG_0"/>
+	<reg32 offset="0x00104" name="LNCK_CFG_1"/>
+	<reg32 offset="0x00108" name="LNCK_CFG_2"/>
+	<reg32 offset="0x0010c" name="LNCK_CFG_3"/>
+	<reg32 offset="0x00110" name="LNCK_CFG_4"/>
+	<reg32 offset="0x00114" name="LNCK_TEST_DATAPATH"/>
+	<reg32 offset="0x00118" name="LNCK_DEBUG_SEL"/>
+	<reg32 offset="0x0011c" name="LNCK_TEST_STR0"/>
+	<reg32 offset="0x00120" name="LNCK_TEST_STR1"/>
+
+	<reg32 offset="0x00140" name="TIMING_CTRL_0">
+		<bitfield name="CLK_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00144" name="TIMING_CTRL_1">
+		<bitfield name="CLK_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00148" name="TIMING_CTRL_2">
+		<bitfield name="CLK_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0014c" name="TIMING_CTRL_3">
+		<bitfield name="CLK_ZERO_8" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00150" name="TIMING_CTRL_4">
+		<bitfield name="HS_EXIT" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00154" name="TIMING_CTRL_5">
+		<bitfield name="HS_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00158" name="TIMING_CTRL_6">
+		<bitfield name="HS_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0015c" name="TIMING_CTRL_7">
+		<bitfield name="HS_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00160" name="TIMING_CTRL_8">
+		<bitfield name="HS_RQST" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00164" name="TIMING_CTRL_9">
+		<bitfield name="TA_GO" low="0" high="2" type="uint"/>
+		<bitfield name="TA_SURE" low="4" high="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00168" name="TIMING_CTRL_10">
+		<bitfield name="TA_GET" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0016c" name="TIMING_CTRL_11">
+		<bitfield name="TRIG3_CMD" low="0" high="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00170" name="CTRL_0"/>
+	<reg32 offset="0x00174" name="CTRL_1"/>
+	<reg32 offset="0x00178" name="CTRL_2"/>
+	<reg32 offset="0x0017c" name="CTRL_3"/>
+	<reg32 offset="0x00180" name="CTRL_4"/>
+
+	<reg32 offset="0x00184" name="STRENGTH_0"/>
+	<reg32 offset="0x00188" name="STRENGTH_1"/>
+
+	<reg32 offset="0x001b4" name="BIST_CTRL_0"/>
+	<reg32 offset="0x001b8" name="BIST_CTRL_1"/>
+	<reg32 offset="0x001bc" name="BIST_CTRL_2"/>
+	<reg32 offset="0x001c0" name="BIST_CTRL_3"/>
+	<reg32 offset="0x001c4" name="BIST_CTRL_4"/>
+	<reg32 offset="0x001c8" name="BIST_CTRL_5"/>
+
+	<reg32 offset="0x001d4" name="GLBL_TEST_CTRL">
+		<bitfield name="BITCLK_HS_SEL" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001dc" name="LDO_CNTRL"/>
+</domain>
+
+<domain name="DSI_20nm_PHY_REGULATOR" width="32">
+	<reg32 offset="0x00000" name="CTRL_0"/>
+	<reg32 offset="0x00004" name="CTRL_1"/>
+	<reg32 offset="0x00008" name="CTRL_2"/>
+	<reg32 offset="0x0000c" name="CTRL_3"/>
+	<reg32 offset="0x00010" name="CTRL_4"/>
+	<reg32 offset="0x00014" name="CTRL_5"/>
+	<reg32 offset="0x00018" name="CAL_PWR_CFG"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm.xml
new file mode 100644
index 000000000000..81d5b96f18c4
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm.xml
@@ -0,0 +1,180 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_28nm_PHY" width="32">
+	<array offset="0x00000" name="LN" length="4" stride="0x40">
+		<reg32 offset="0x00" name="CFG_0"/>
+		<reg32 offset="0x04" name="CFG_1"/>
+		<reg32 offset="0x08" name="CFG_2"/>
+		<reg32 offset="0x0c" name="CFG_3"/>
+		<reg32 offset="0x10" name="CFG_4"/>
+		<reg32 offset="0x14" name="TEST_DATAPATH"/>
+		<reg32 offset="0x18" name="DEBUG_SEL"/>
+		<reg32 offset="0x1c" name="TEST_STR_0"/>
+		<reg32 offset="0x20" name="TEST_STR_1"/>
+	</array>
+
+	<reg32 offset="0x00100" name="LNCK_CFG_0"/>
+	<reg32 offset="0x00104" name="LNCK_CFG_1"/>
+	<reg32 offset="0x00108" name="LNCK_CFG_2"/>
+	<reg32 offset="0x0010c" name="LNCK_CFG_3"/>
+	<reg32 offset="0x00110" name="LNCK_CFG_4"/>
+	<reg32 offset="0x00114" name="LNCK_TEST_DATAPATH"/>
+	<reg32 offset="0x00118" name="LNCK_DEBUG_SEL"/>
+	<reg32 offset="0x0011c" name="LNCK_TEST_STR0"/>
+	<reg32 offset="0x00120" name="LNCK_TEST_STR1"/>
+
+	<reg32 offset="0x00140" name="TIMING_CTRL_0">
+		<bitfield name="CLK_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00144" name="TIMING_CTRL_1">
+		<bitfield name="CLK_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00148" name="TIMING_CTRL_2">
+		<bitfield name="CLK_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0014c" name="TIMING_CTRL_3">
+		<bitfield name="CLK_ZERO_8" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00150" name="TIMING_CTRL_4">
+		<bitfield name="HS_EXIT" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00154" name="TIMING_CTRL_5">
+		<bitfield name="HS_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00158" name="TIMING_CTRL_6">
+		<bitfield name="HS_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0015c" name="TIMING_CTRL_7">
+		<bitfield name="HS_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00160" name="TIMING_CTRL_8">
+		<bitfield name="HS_RQST" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00164" name="TIMING_CTRL_9">
+		<bitfield name="TA_GO" low="0" high="2" type="uint"/>
+		<bitfield name="TA_SURE" low="4" high="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00168" name="TIMING_CTRL_10">
+		<bitfield name="TA_GET" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0016c" name="TIMING_CTRL_11">
+		<bitfield name="TRIG3_CMD" low="0" high="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00170" name="CTRL_0"/>
+	<reg32 offset="0x00174" name="CTRL_1"/>
+	<reg32 offset="0x00178" name="CTRL_2"/>
+	<reg32 offset="0x0017c" name="CTRL_3"/>
+	<reg32 offset="0x00180" name="CTRL_4"/>
+
+	<reg32 offset="0x00184" name="STRENGTH_0"/>
+	<reg32 offset="0x00188" name="STRENGTH_1"/>
+
+	<reg32 offset="0x001b4" name="BIST_CTRL_0"/>
+	<reg32 offset="0x001b8" name="BIST_CTRL_1"/>
+	<reg32 offset="0x001bc" name="BIST_CTRL_2"/>
+	<reg32 offset="0x001c0" name="BIST_CTRL_3"/>
+	<reg32 offset="0x001c4" name="BIST_CTRL_4"/>
+	<reg32 offset="0x001c8" name="BIST_CTRL_5"/>
+
+	<reg32 offset="0x001d4" name="GLBL_TEST_CTRL">
+		<bitfield name="BITCLK_HS_SEL" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001dc" name="LDO_CNTRL"/>
+</domain>
+
+<domain name="DSI_28nm_PHY_REGULATOR" width="32">
+	<reg32 offset="0x00000" name="CTRL_0"/>
+	<reg32 offset="0x00004" name="CTRL_1"/>
+	<reg32 offset="0x00008" name="CTRL_2"/>
+	<reg32 offset="0x0000c" name="CTRL_3"/>
+	<reg32 offset="0x00010" name="CTRL_4"/>
+	<reg32 offset="0x00014" name="CTRL_5"/>
+	<reg32 offset="0x00018" name="CAL_PWR_CFG"/>
+</domain>
+
+<domain name="DSI_28nm_PHY_PLL" width="32">
+	<reg32 offset="0x00000" name="REFCLK_CFG">
+		<bitfield name="DBLR" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00004" name="POSTDIV1_CFG"/>
+	<reg32 offset="0x00008" name="CHGPUMP_CFG"/>
+	<reg32 offset="0x0000C" name="VCOLPF_CFG"/>
+	<reg32 offset="0x00010" name="VREG_CFG">
+		<bitfield name="POSTDIV1_BYPASS_B" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00014" name="PWRGEN_CFG"/>
+	<reg32 offset="0x00018" name="DMUX_CFG"/>
+	<reg32 offset="0x0001C" name="AMUX_CFG"/>
+	<reg32 offset="0x00020" name="GLB_CFG">
+		<bitfield name="PLL_PWRDN_B" pos="0" type="boolean"/>
+		<bitfield name="PLL_LDO_PWRDN_B" pos="1" type="boolean"/>
+		<bitfield name="PLL_PWRGEN_PWRDN_B" pos="2" type="boolean"/>
+		<bitfield name="PLL_ENABLE" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00024" name="POSTDIV2_CFG"/>
+	<reg32 offset="0x00028" name="POSTDIV3_CFG"/>
+	<reg32 offset="0x0002C" name="LPFR_CFG"/>
+	<reg32 offset="0x00030" name="LPFC1_CFG"/>
+	<reg32 offset="0x00034" name="LPFC2_CFG"/>
+	<reg32 offset="0x00038" name="SDM_CFG0">
+		<bitfield name="BYP_DIV" low="0" high="5" type="uint"/>
+		<bitfield name="BYP" pos="6" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0003C" name="SDM_CFG1">
+		<bitfield name="DC_OFFSET" low="0" high="5" type="uint"/>
+		<bitfield name="DITHER_EN" pos="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00040" name="SDM_CFG2">
+		<bitfield name="FREQ_SEED_7_0" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00044" name="SDM_CFG3">
+		<bitfield name="FREQ_SEED_15_8" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00048" name="SDM_CFG4"/>
+	<reg32 offset="0x0004C" name="SSC_CFG0"/>
+	<reg32 offset="0x00050" name="SSC_CFG1"/>
+	<reg32 offset="0x00054" name="SSC_CFG2"/>
+	<reg32 offset="0x00058" name="SSC_CFG3"/>
+	<reg32 offset="0x0005C" name="LKDET_CFG0"/>
+	<reg32 offset="0x00060" name="LKDET_CFG1"/>
+	<reg32 offset="0x00064" name="LKDET_CFG2"/>
+	<reg32 offset="0x00068" name="TEST_CFG">
+		<bitfield name="PLL_SW_RESET" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0006C" name="CAL_CFG0"/>
+	<reg32 offset="0x00070" name="CAL_CFG1"/>
+	<reg32 offset="0x00074" name="CAL_CFG2"/>
+	<reg32 offset="0x00078" name="CAL_CFG3"/>
+	<reg32 offset="0x0007C" name="CAL_CFG4"/>
+	<reg32 offset="0x00080" name="CAL_CFG5"/>
+	<reg32 offset="0x00084" name="CAL_CFG6"/>
+	<reg32 offset="0x00088" name="CAL_CFG7"/>
+	<reg32 offset="0x0008C" name="CAL_CFG8"/>
+	<reg32 offset="0x00090" name="CAL_CFG9"/>
+	<reg32 offset="0x00094" name="CAL_CFG10"/>
+	<reg32 offset="0x00098" name="CAL_CFG11"/>
+	<reg32 offset="0x0009C" name="EFUSE_CFG"/>
+	<reg32 offset="0x000A0" name="DEBUG_BUS_SEL"/>
+	<reg32 offset="0x000A4" name="CTRL_42"/>
+	<reg32 offset="0x000A8" name="CTRL_43"/>
+	<reg32 offset="0x000AC" name="CTRL_44"/>
+	<reg32 offset="0x000B0" name="CTRL_45"/>
+	<reg32 offset="0x000B4" name="CTRL_46"/>
+	<reg32 offset="0x000B8" name="CTRL_47"/>
+	<reg32 offset="0x000BC" name="CTRL_48"/>
+	<reg32 offset="0x000C0" name="STATUS">
+		<bitfield name="PLL_RDY" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x000C4" name="DEBUG_BUS0"/>
+	<reg32 offset="0x000C8" name="DEBUG_BUS1"/>
+	<reg32 offset="0x000CC" name="DEBUG_BUS2"/>
+	<reg32 offset="0x000D0" name="DEBUG_BUS3"/>
+	<reg32 offset="0x000D4" name="CTRL_54"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm_8960.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm_8960.xml
new file mode 100644
index 000000000000..4c4de4dda640
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_28nm_8960.xml
@@ -0,0 +1,134 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_28nm_8960_PHY" width="32">
+
+	<array offset="0x00000" name="LN" length="4" stride="0x40">
+		<reg32 offset="0x00" name="CFG_0"/>
+		<reg32 offset="0x04" name="CFG_1"/>
+		<reg32 offset="0x08" name="CFG_2"/>
+		<reg32 offset="0x0c" name="TEST_DATAPATH"/>
+		<reg32 offset="0x14" name="TEST_STR_0"/>
+		<reg32 offset="0x18" name="TEST_STR_1"/>
+	</array>
+
+	<reg32 offset="0x00100" name="LNCK_CFG_0"/>
+	<reg32 offset="0x00104" name="LNCK_CFG_1"/>
+	<reg32 offset="0x00108" name="LNCK_CFG_2"/>
+
+	<reg32 offset="0x0010c" name="LNCK_TEST_DATAPATH"/>
+	<reg32 offset="0x00114" name="LNCK_TEST_STR0"/>
+	<reg32 offset="0x00118" name="LNCK_TEST_STR1"/>
+
+	<reg32 offset="0x00140" name="TIMING_CTRL_0">
+		<bitfield name="CLK_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00144" name="TIMING_CTRL_1">
+		<bitfield name="CLK_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00148" name="TIMING_CTRL_2">
+		<bitfield name="CLK_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0014c" name="TIMING_CTRL_3"/>
+
+	<reg32 offset="0x00150" name="TIMING_CTRL_4">
+		<bitfield name="HS_EXIT" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00154" name="TIMING_CTRL_5">
+		<bitfield name="HS_ZERO" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00158" name="TIMING_CTRL_6">
+		<bitfield name="HS_PREPARE" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0015c" name="TIMING_CTRL_7">
+		<bitfield name="HS_TRAIL" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00160" name="TIMING_CTRL_8">
+		<bitfield name="HS_RQST" low="0" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00164" name="TIMING_CTRL_9">
+		<bitfield name="TA_GO" low="0" high="2" type="uint"/>
+		<bitfield name="TA_SURE" low="4" high="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00168" name="TIMING_CTRL_10">
+		<bitfield name="TA_GET" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0016c" name="TIMING_CTRL_11">
+		<bitfield name="TRIG3_CMD" low="0" high="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00170" name="CTRL_0"/>
+	<reg32 offset="0x00174" name="CTRL_1"/>
+	<reg32 offset="0x00178" name="CTRL_2"/>
+	<reg32 offset="0x0017c" name="CTRL_3"/>
+
+	<reg32 offset="0x00180" name="STRENGTH_0"/>
+	<reg32 offset="0x00184" name="STRENGTH_1"/>
+	<reg32 offset="0x00188" name="STRENGTH_2"/>
+
+	<reg32 offset="0x0018c" name="BIST_CTRL_0"/>
+	<reg32 offset="0x00190" name="BIST_CTRL_1"/>
+	<reg32 offset="0x00194" name="BIST_CTRL_2"/>
+	<reg32 offset="0x00198" name="BIST_CTRL_3"/>
+	<reg32 offset="0x0019c" name="BIST_CTRL_4"/>
+
+	<reg32 offset="0x001b0" name="LDO_CTRL"/>
+</domain>
+
+<domain name="DSI_28nm_8960_PHY_MISC" width="32">
+	<reg32 offset="0x00000" name="REGULATOR_CTRL_0"/>
+	<reg32 offset="0x00004" name="REGULATOR_CTRL_1"/>
+	<reg32 offset="0x00008" name="REGULATOR_CTRL_2"/>
+	<reg32 offset="0x0000c" name="REGULATOR_CTRL_3"/>
+	<reg32 offset="0x00010" name="REGULATOR_CTRL_4"/>
+	<reg32 offset="0x00014" name="REGULATOR_CTRL_5"/>
+	<reg32 offset="0x00018" name="REGULATOR_CAL_PWR_CFG"/>
+	<reg32 offset="0x00028" name="CAL_HW_TRIGGER"/>
+	<reg32 offset="0x0002c" name="CAL_SW_CFG_0"/>
+	<reg32 offset="0x00030" name="CAL_SW_CFG_1"/>
+	<reg32 offset="0x00034" name="CAL_SW_CFG_2"/>
+	<reg32 offset="0x00038" name="CAL_HW_CFG_0"/>
+	<reg32 offset="0x0003c" name="CAL_HW_CFG_1"/>
+	<reg32 offset="0x00040" name="CAL_HW_CFG_2"/>
+	<reg32 offset="0x00044" name="CAL_HW_CFG_3"/>
+	<reg32 offset="0x00048" name="CAL_HW_CFG_4"/>
+	<reg32 offset="0x00050" name="CAL_STATUS">
+		<bitfield name="CAL_BUSY" pos="4" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="DSI_28nm_8960_PHY_PLL" width="32">
+	<reg32 offset="0x00000" name="CTRL_0">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00004" name="CTRL_1"/>
+	<reg32 offset="0x00008" name="CTRL_2"/>
+	<reg32 offset="0x0000c" name="CTRL_3"/>
+	<reg32 offset="0x00010" name="CTRL_4"/>
+	<reg32 offset="0x00014" name="CTRL_5"/>
+	<reg32 offset="0x00018" name="CTRL_6"/>
+	<reg32 offset="0x0001c" name="CTRL_7"/>
+	<reg32 offset="0x00020" name="CTRL_8"/>
+	<reg32 offset="0x00024" name="CTRL_9"/>
+	<reg32 offset="0x00028" name="CTRL_10"/>
+	<reg32 offset="0x0002c" name="CTRL_11"/>
+	<reg32 offset="0x00030" name="CTRL_12"/>
+	<reg32 offset="0x00034" name="CTRL_13"/>
+	<reg32 offset="0x00038" name="CTRL_14"/>
+	<reg32 offset="0x0003c" name="CTRL_15"/>
+	<reg32 offset="0x00040" name="CTRL_16"/>
+	<reg32 offset="0x00044" name="CTRL_17"/>
+	<reg32 offset="0x00048" name="CTRL_18"/>
+	<reg32 offset="0x0004c" name="CTRL_19"/>
+	<reg32 offset="0x00050" name="CTRL_20"/>
+
+	<reg32 offset="0x00080" name="RDY">
+		<bitfield name="PLL_RDY" pos="0" type="boolean"/>
+	</reg32>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
new file mode 100644
index 000000000000..d54b72f92449
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -0,0 +1,230 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="DSI_7nm_PHY_CMN" width="32">
+	<reg32 offset="0x00000" name="REVISION_ID0"/>
+	<reg32 offset="0x00004" name="REVISION_ID1"/>
+	<reg32 offset="0x00008" name="REVISION_ID2"/>
+	<reg32 offset="0x0000c" name="REVISION_ID3"/>
+	<reg32 offset="0x00010" name="CLK_CFG0"/>
+	<reg32 offset="0x00014" name="CLK_CFG1"/>
+	<reg32 offset="0x00018" name="GLBL_CTRL"/>
+	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
+	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
+	<reg32 offset="0x00024" name="CTRL_0"/>
+	<reg32 offset="0x00028" name="CTRL_1"/>
+	<reg32 offset="0x0002c" name="CTRL_2"/>
+	<reg32 offset="0x00030" name="CTRL_3"/>
+	<reg32 offset="0x00034" name="LANE_CFG0"/>
+	<reg32 offset="0x00038" name="LANE_CFG1"/>
+	<reg32 offset="0x0003c" name="PLL_CNTRL"/>
+	<reg32 offset="0x00040" name="DPHY_SOT"/>
+	<reg32 offset="0x000a0" name="LANE_CTRL0"/>
+	<reg32 offset="0x000a4" name="LANE_CTRL1"/>
+	<reg32 offset="0x000a8" name="LANE_CTRL2"/>
+	<reg32 offset="0x000ac" name="LANE_CTRL3"/>
+	<reg32 offset="0x000b0" name="LANE_CTRL4"/>
+	<reg32 offset="0x000b4" name="TIMING_CTRL_0"/>
+	<reg32 offset="0x000b8" name="TIMING_CTRL_1"/>
+	<reg32 offset="0x000bc" name="TIMING_CTRL_2"/>
+	<reg32 offset="0x000c0" name="TIMING_CTRL_3"/>
+	<reg32 offset="0x000c4" name="TIMING_CTRL_4"/>
+	<reg32 offset="0x000c8" name="TIMING_CTRL_5"/>
+	<reg32 offset="0x000cc" name="TIMING_CTRL_6"/>
+	<reg32 offset="0x000d0" name="TIMING_CTRL_7"/>
+	<reg32 offset="0x000d4" name="TIMING_CTRL_8"/>
+	<reg32 offset="0x000d8" name="TIMING_CTRL_9"/>
+	<reg32 offset="0x000dc" name="TIMING_CTRL_10"/>
+	<reg32 offset="0x000e0" name="TIMING_CTRL_11"/>
+	<reg32 offset="0x000e4" name="TIMING_CTRL_12"/>
+	<reg32 offset="0x000e8" name="TIMING_CTRL_13"/>
+	<reg32 offset="0x000ec" name="GLBL_HSTX_STR_CTRL_0"/>
+	<reg32 offset="0x000f0" name="GLBL_HSTX_STR_CTRL_1"/>
+	<reg32 offset="0x000f4" name="GLBL_RESCODE_OFFSET_TOP_CTRL"/>
+	<reg32 offset="0x000f8" name="GLBL_RESCODE_OFFSET_BOT_CTRL"/>
+	<reg32 offset="0x000fc" name="GLBL_RESCODE_OFFSET_MID_CTRL"/>
+	<reg32 offset="0x00100" name="GLBL_LPTX_STR_CTRL"/>
+	<reg32 offset="0x00104" name="GLBL_PEMPH_CTRL_0"/>
+	<reg32 offset="0x00108" name="GLBL_PEMPH_CTRL_1"/>
+	<reg32 offset="0x0010c" name="GLBL_STR_SWI_CAL_SEL_CTRL"/>
+	<reg32 offset="0x00110" name="VREG_CTRL_1"/>
+	<reg32 offset="0x00114" name="CTRL_4"/>
+	<reg32 offset="0x00128" name="GLBL_DIGTOP_SPARE4"/>
+	<reg32 offset="0x00140" name="PHY_STATUS"/>
+	<reg32 offset="0x00148" name="LANE_STATUS0"/>
+	<reg32 offset="0x0014c" name="LANE_STATUS1"/>
+	<reg32 offset="0x001ac" name="GLBL_DIGTOP_SPARE10"/>
+</domain>
+
+<domain name="DSI_7nm_PHY" width="32">
+	<array offset="0x00000" name="LN" length="5" stride="0x80">
+		<reg32 offset="0x00" name="CFG0"/>
+		<reg32 offset="0x04" name="CFG1"/>
+		<reg32 offset="0x08" name="CFG2"/>
+		<reg32 offset="0x0c" name="TEST_DATAPATH"/>
+		<reg32 offset="0x10" name="PIN_SWAP"/>
+		<reg32 offset="0x14" name="LPRX_CTRL"/>
+		<reg32 offset="0x18" name="TX_DCTRL"/>
+	</array>
+</domain>
+
+<domain name="DSI_7nm_PHY_PLL" width="32">
+	<reg32 offset="0x0000" name="ANALOG_CONTROLS_ONE"/>
+	<reg32 offset="0x0004" name="ANALOG_CONTROLS_TWO"/>
+	<reg32 offset="0x0008" name="INT_LOOP_SETTINGS"/>
+	<reg32 offset="0x000c" name="INT_LOOP_SETTINGS_TWO"/>
+	<reg32 offset="0x0010" name="ANALOG_CONTROLS_THREE"/>
+	<reg32 offset="0x0014" name="ANALOG_CONTROLS_FOUR"/>
+	<reg32 offset="0x0018" name="ANALOG_CONTROLS_FIVE"/>
+	<reg32 offset="0x001c" name="INT_LOOP_CONTROLS"/>
+	<reg32 offset="0x0020" name="DSM_DIVIDER"/>
+	<reg32 offset="0x0024" name="FEEDBACK_DIVIDER"/>
+	<reg32 offset="0x0028" name="SYSTEM_MUXES"/>
+	<reg32 offset="0x002c" name="FREQ_UPDATE_CONTROL_OVERRIDES"/>
+	<reg32 offset="0x0030" name="CMODE"/>
+	<reg32 offset="0x0034" name="PSM_CTRL"/>
+	<reg32 offset="0x0038" name="RSM_CTRL"/>
+	<reg32 offset="0x003c" name="VCO_TUNE_MAP"/>
+	<reg32 offset="0x0040" name="PLL_CNTRL"/>
+	<reg32 offset="0x0044" name="CALIBRATION_SETTINGS"/>
+	<reg32 offset="0x0048" name="BAND_SEL_CAL_TIMER_LOW"/>
+	<reg32 offset="0x004c" name="BAND_SEL_CAL_TIMER_HIGH"/>
+	<reg32 offset="0x0050" name="BAND_SEL_CAL_SETTINGS"/>
+	<reg32 offset="0x0054" name="BAND_SEL_MIN"/>
+	<reg32 offset="0x0058" name="BAND_SEL_MAX"/>
+	<reg32 offset="0x005c" name="BAND_SEL_PFILT"/>
+	<reg32 offset="0x0060" name="BAND_SEL_IFILT"/>
+	<reg32 offset="0x0064" name="BAND_SEL_CAL_SETTINGS_TWO"/>
+	<reg32 offset="0x0068" name="BAND_SEL_CAL_SETTINGS_THREE"/>
+	<reg32 offset="0x006c" name="BAND_SEL_CAL_SETTINGS_FOUR"/>
+	<reg32 offset="0x0070" name="BAND_SEL_ICODE_HIGH"/>
+	<reg32 offset="0x0074" name="BAND_SEL_ICODE_LOW"/>
+	<reg32 offset="0x0078" name="FREQ_DETECT_SETTINGS_ONE"/>
+	<reg32 offset="0x007c" name="FREQ_DETECT_THRESH"/>
+	<reg32 offset="0x0080" name="FREQ_DET_REFCLK_HIGH"/>
+	<reg32 offset="0x0084" name="FREQ_DET_REFCLK_LOW"/>
+	<reg32 offset="0x0088" name="FREQ_DET_PLLCLK_HIGH"/>
+	<reg32 offset="0x008c" name="FREQ_DET_PLLCLK_LOW"/>
+	<reg32 offset="0x0090" name="PFILT"/>
+	<reg32 offset="0x0094" name="IFILT"/>
+	<reg32 offset="0x0098" name="PLL_GAIN"/>
+	<reg32 offset="0x009c" name="ICODE_LOW"/>
+	<reg32 offset="0x00a0" name="ICODE_HIGH"/>
+	<reg32 offset="0x00a4" name="LOCKDET"/>
+	<reg32 offset="0x00a8" name="OUTDIV"/>
+	<reg32 offset="0x00ac" name="FASTLOCK_CONTROL"/>
+	<reg32 offset="0x00b0" name="PASS_OUT_OVERRIDE_ONE"/>
+	<reg32 offset="0x00b4" name="PASS_OUT_OVERRIDE_TWO"/>
+	<reg32 offset="0x00b8" name="CORE_OVERRIDE"/>
+	<reg32 offset="0x00bc" name="CORE_INPUT_OVERRIDE"/>
+	<reg32 offset="0x00c0" name="RATE_CHANGE"/>
+	<reg32 offset="0x00c4" name="PLL_DIGITAL_TIMERS"/>
+	<reg32 offset="0x00c8" name="PLL_DIGITAL_TIMERS_TWO"/>
+	<reg32 offset="0x00cc" name="DECIMAL_DIV_START"/>
+	<reg32 offset="0x00d0" name="FRAC_DIV_START_LOW"/>
+	<reg32 offset="0x00d4" name="FRAC_DIV_START_MID"/>
+	<reg32 offset="0x00d8" name="FRAC_DIV_START_HIGH"/>
+	<reg32 offset="0x00dc" name="DEC_FRAC_MUXES"/>
+	<reg32 offset="0x00e0" name="DECIMAL_DIV_START_1"/>
+	<reg32 offset="0x00e4" name="FRAC_DIV_START_LOW_1"/>
+	<reg32 offset="0x00e8" name="FRAC_DIV_START_MID_1"/>
+	<reg32 offset="0x00ec" name="FRAC_DIV_START_HIGH_1"/>
+	<reg32 offset="0x00f0" name="DECIMAL_DIV_START_2"/>
+	<reg32 offset="0x00f4" name="FRAC_DIV_START_LOW_2"/>
+	<reg32 offset="0x00f8" name="FRAC_DIV_START_MID_2"/>
+	<reg32 offset="0x00fc" name="FRAC_DIV_START_HIGH_2"/>
+	<reg32 offset="0x0100" name="MASH_CONTROL"/>
+	<reg32 offset="0x0104" name="SSC_STEPSIZE_LOW"/>
+	<reg32 offset="0x0108" name="SSC_STEPSIZE_HIGH"/>
+	<reg32 offset="0x010c" name="SSC_DIV_PER_LOW"/>
+	<reg32 offset="0x0110" name="SSC_DIV_PER_HIGH"/>
+	<reg32 offset="0x0114" name="SSC_ADJPER_LOW"/>
+	<reg32 offset="0x0118" name="SSC_ADJPER_HIGH"/>
+	<reg32 offset="0x011c" name="SSC_MUX_CONTROL"/>
+	<reg32 offset="0x0120" name="SSC_STEPSIZE_LOW_1"/>
+	<reg32 offset="0x0124" name="SSC_STEPSIZE_HIGH_1"/>
+	<reg32 offset="0x0128" name="SSC_DIV_PER_LOW_1"/>
+	<reg32 offset="0x012c" name="SSC_DIV_PER_HIGH_1"/>
+	<reg32 offset="0x0130" name="SSC_ADJPER_LOW_1"/>
+	<reg32 offset="0x0134" name="SSC_ADJPER_HIGH_1"/>
+	<reg32 offset="0x0138" name="SSC_STEPSIZE_LOW_2"/>
+	<reg32 offset="0x013c" name="SSC_STEPSIZE_HIGH_2"/>
+	<reg32 offset="0x0140" name="SSC_DIV_PER_LOW_2"/>
+	<reg32 offset="0x0144" name="SSC_DIV_PER_HIGH_2"/>
+	<reg32 offset="0x0148" name="SSC_ADJPER_LOW_2"/>
+	<reg32 offset="0x014c" name="SSC_ADJPER_HIGH_2"/>
+	<reg32 offset="0x0150" name="SSC_CONTROL"/>
+	<reg32 offset="0x0154" name="PLL_OUTDIV_RATE"/>
+	<reg32 offset="0x0158" name="PLL_LOCKDET_RATE_1"/>
+	<reg32 offset="0x015c" name="PLL_LOCKDET_RATE_2"/>
+	<reg32 offset="0x0160" name="PLL_PROP_GAIN_RATE_1"/>
+	<reg32 offset="0x0164" name="PLL_PROP_GAIN_RATE_2"/>
+	<reg32 offset="0x0168" name="PLL_BAND_SEL_RATE_1"/>
+	<reg32 offset="0x016c" name="PLL_BAND_SEL_RATE_2"/>
+	<reg32 offset="0x0170" name="PLL_INT_GAIN_IFILT_BAND_1"/>
+	<reg32 offset="0x0174" name="PLL_INT_GAIN_IFILT_BAND_2"/>
+	<reg32 offset="0x0178" name="PLL_FL_INT_GAIN_PFILT_BAND_1"/>
+	<reg32 offset="0x017c" name="PLL_FL_INT_GAIN_PFILT_BAND_2"/>
+	<reg32 offset="0x0180" name="PLL_FASTLOCK_EN_BAND"/>
+	<reg32 offset="0x0184" name="FREQ_TUNE_ACCUM_INIT_MID"/>
+	<reg32 offset="0x0188" name="FREQ_TUNE_ACCUM_INIT_HIGH"/>
+	<reg32 offset="0x018c" name="FREQ_TUNE_ACCUM_INIT_MUX"/>
+	<reg32 offset="0x0190" name="PLL_LOCK_OVERRIDE"/>
+	<reg32 offset="0x0194" name="PLL_LOCK_DELAY"/>
+	<reg32 offset="0x0198" name="PLL_LOCK_MIN_DELAY"/>
+	<reg32 offset="0x019c" name="CLOCK_INVERTERS"/>
+	<reg32 offset="0x01a0" name="SPARE_AND_JPC_OVERRIDES"/>
+	<reg32 offset="0x01a4" name="BIAS_CONTROL_1"/>
+	<reg32 offset="0x01a8" name="BIAS_CONTROL_2"/>
+	<reg32 offset="0x01ac" name="ALOG_OBSV_BUS_CTRL_1"/>
+	<reg32 offset="0x01b0" name="COMMON_STATUS_ONE"/>
+	<reg32 offset="0x01b4" name="COMMON_STATUS_TWO"/>
+	<reg32 offset="0x01b8" name="BAND_SEL_CAL"/>
+	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
+	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
+	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
+	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
+	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
+	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
+	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
+	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>
+	<reg32 offset="0x01dc" name="FLL_CODE0"/>
+	<reg32 offset="0x01e0" name="FLL_CODE1"/>
+	<reg32 offset="0x01e4" name="FLL_GAIN0"/>
+	<reg32 offset="0x01e8" name="FLL_GAIN1"/>
+	<reg32 offset="0x01ec" name="SW_RESET"/>
+	<reg32 offset="0x01f0" name="FAST_PWRUP"/>
+	<reg32 offset="0x01f4" name="LOCKTIME0"/>
+	<reg32 offset="0x01f8" name="LOCKTIME1"/>
+	<reg32 offset="0x01fc" name="DEBUG_BUS_SEL"/>
+	<reg32 offset="0x0200" name="DEBUG_BUS0"/>
+	<reg32 offset="0x0204" name="DEBUG_BUS1"/>
+	<reg32 offset="0x0208" name="DEBUG_BUS2"/>
+	<reg32 offset="0x020c" name="DEBUG_BUS3"/>
+	<reg32 offset="0x0210" name="ANALOG_FLL_CONTROL_OVERRIDES"/>
+	<reg32 offset="0x0214" name="VCO_CONFIG"/>
+	<reg32 offset="0x0218" name="VCO_CAL_CODE1_MODE0_STATUS"/>
+	<reg32 offset="0x021c" name="VCO_CAL_CODE1_MODE1_STATUS"/>
+	<reg32 offset="0x0220" name="RESET_SM_STATUS"/>
+	<reg32 offset="0x0224" name="TDC_OFFSET"/>
+	<reg32 offset="0x0228" name="PS3_PWRDOWN_CONTROLS"/>
+	<reg32 offset="0x022c" name="PS4_PWRDOWN_CONTROLS"/>
+	<reg32 offset="0x0230" name="PLL_RST_CONTROLS"/>
+	<reg32 offset="0x0234" name="GEAR_BAND_SELECT_CONTROLS"/>
+	<reg32 offset="0x0238" name="PSM_CLK_CONTROLS"/>
+	<reg32 offset="0x023c" name="SYSTEM_MUXES_2"/>
+	<reg32 offset="0x0240" name="VCO_CONFIG_1"/>
+	<reg32 offset="0x0244" name="VCO_CONFIG_2"/>
+	<reg32 offset="0x0248" name="CLOCK_INVERTERS_1"/>
+	<reg32 offset="0x024c" name="CLOCK_INVERTERS_2"/>
+	<reg32 offset="0x0250" name="CMODE_1"/>
+	<reg32 offset="0x0254" name="CMODE_2"/>
+	<reg32 offset="0x0258" name="ANALOG_CONTROLS_FIVE_1"/>
+	<reg32 offset="0x025c" name="ANALOG_CONTROLS_FIVE_2"/>
+	<reg32 offset="0x0260" name="PERF_OPTIMIZE"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/edp.xml b/drivers/gpu/drm/msm/registers/display/edp.xml
new file mode 100644
index 000000000000..354f90eb6de5
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/edp.xml
@@ -0,0 +1,239 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="EDP" width="32">
+	<enum name="edp_color_depth">
+		<value name="EDP_6BIT"  value="0"/>
+		<value name="EDP_8BIT"  value="1"/>
+		<value name="EDP_10BIT" value="2"/>
+		<value name="EDP_12BIT" value="3"/>
+		<value name="EDP_16BIT" value="4"/>
+	</enum>
+
+	<enum name="edp_component_format">
+		<value name="EDP_RGB" value="0"/>
+		<value name="EDP_YUV422" value="1"/>
+		<value name="EDP_YUV444" value="2"/>
+	</enum>
+
+	<reg32 offset="0x0004" name="MAINLINK_CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="RESET"  pos="1" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0008" name="STATE_CTRL">
+		<bitfield name="TRAIN_PATTERN_1"       pos="0" type="boolean"/>
+		<bitfield name="TRAIN_PATTERN_2"       pos="1" type="boolean"/>
+		<bitfield name="TRAIN_PATTERN_3"       pos="2" type="boolean"/>
+		<bitfield name="SYMBOL_ERR_RATE_MEAS"  pos="3" type="boolean"/>
+		<bitfield name="PRBS7"                 pos="4" type="boolean"/>
+		<bitfield name="CUSTOM_80_BIT_PATTERN" pos="5" type="boolean"/>
+		<bitfield name="SEND_VIDEO"            pos="6" type="boolean"/>
+		<bitfield name="PUSH_IDLE"             pos="7" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x000c" name="CONFIGURATION_CTRL">
+		<!-- next two may be swapped? -->
+		<bitfield name="SYNC_CLK" pos="0" type="boolean"/>
+		<bitfield name="STATIC_MVID" pos="1" type="boolean"/>
+		<bitfield name="PROGRESSIVE" pos="2" type="boolean"/>
+		<!-- # of lanes minus one: -->
+		<bitfield name="LANES" low="4" high="5" type="uint"/>
+		<bitfield name="ENHANCED_FRAMING" pos="6" type="boolean"/>
+		<!--
+		   NOTE: only 6bit and 8bit valid
+		 -->
+		<bitfield name="COLOR" pos="8" type="edp_color_depth"/>
+	</reg32>
+
+	<reg32 offset="0x0014" name="SOFTWARE_MVID" type="uint"/>
+	<reg32 offset="0x0018" name="SOFTWARE_NVID" type="uint"/>
+
+	<reg32 offset="0x001c" name="TOTAL_HOR_VER">
+		<bitfield name="HORIZ" low="0" high="15" type="uint"/>
+		<bitfield name="VERT"  low="16" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0020" name="START_HOR_VER_FROM_SYNC">
+		<bitfield name="HORIZ" low="0" high="15" type="uint"/>
+		<bitfield name="VERT"  low="16" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0024" name="HSYNC_VSYNC_WIDTH_POLARITY">
+		<bitfield name="HORIZ"  low="0" high="14" type="uint"/>
+		<bitfield name="NHSYNC" pos="15" type="boolean"/>
+		<bitfield name="VERT"   low="16" high="30" type="uint"/>
+		<bitfield name="NVSYNC" pos="31" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0028" name="ACTIVE_HOR_VER">
+		<bitfield name="HORIZ" low="0" high="15" type="uint"/>
+		<bitfield name="VERT"  low="16" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x002c" name="MISC1_MISC0">
+		<!-- MISC0 from DisplayPort v1.2 spec: -->
+		<bitfield name="MISC0" low="0" high="7"/>
+		<!-- aliased MISC0 bitfields: -->
+		<bitfield name="SYNC" pos="0" type="boolean"/>
+		<bitfield name="COMPONENT_FORMAT" low="1" high="2" type="edp_component_format"/>
+		<!-- CEA (vs VESA) color range: -->
+		<bitfield name="CEA" pos="3" type="boolean"/>
+		<!-- YCbCr Colorimetry ITU-R BT709-5 (vs ITU-R BT601-5): -->
+		<bitfield name="BT709_5" pos="4" type="boolean"/>
+		<bitfield name="COLOR" low="5" high="7" type="edp_color_depth"/>
+
+		<!-- MISC1 from DisplayPort v1.2 spec: -->
+		<bitfield name="MISC1" low="8" high="15"/>
+		<!-- aliased MISC1 bitfields: -->
+		<bitfield name="INTERLACED_ODD" pos="8" type="boolean"/>
+		<bitfield name="STEREO" low="9" high="10" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0074" name="PHY_CTRL">
+		<bitfield name="SW_RESET_PLL" pos="0" type="boolean"/>
+		<bitfield name="SW_RESET" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0084" name="MAINLINK_READY">
+		<bitfield name="TRAIN_PATTERN_1_READY" pos="3" type="boolean"/>
+		<bitfield name="TRAIN_PATTERN_2_READY" pos="4" type="boolean"/>
+		<bitfield name="TRAIN_PATTERN_3_READY" pos="5" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0300" name="AUX_CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="RESET"  pos="1" type="boolean"/>
+	</reg32>
+
+	<!-- interrupt registers come in sets of 3 bits, status/ack/en -->
+	<reg32 offset="0x0308" name="INTERRUPT_REG_1">
+		<bitfield name="HPD"                    pos="0"  type="boolean"/>
+		<bitfield name="HPD_ACK"                pos="1"  type="boolean"/>
+		<bitfield name="HPD_EN"                 pos="2"  type="boolean"/>
+		<bitfield name="AUX_I2C_DONE"           pos="3"  type="boolean"/>
+		<bitfield name="AUX_I2C_DONE_ACK"       pos="4"  type="boolean"/>
+		<bitfield name="AUX_I2C_DONE_EN"        pos="5"  type="boolean"/>
+		<bitfield name="WRONG_ADDR"             pos="6"  type="boolean"/>
+		<bitfield name="WRONG_ADDR_ACK"         pos="7"  type="boolean"/>
+		<bitfield name="WRONG_ADDR_EN"          pos="8"  type="boolean"/>
+		<bitfield name="TIMEOUT"                pos="9"  type="boolean"/>
+		<bitfield name="TIMEOUT_ACK"            pos="10" type="boolean"/>
+		<bitfield name="TIMEOUT_EN"             pos="11" type="boolean"/>
+		<bitfield name="NACK_DEFER"             pos="12" type="boolean"/>
+		<bitfield name="NACK_DEFER_ACK"         pos="13" type="boolean"/>
+		<bitfield name="NACK_DEFER_EN"          pos="14" type="boolean"/>
+		<bitfield name="WRONG_DATA_CNT"         pos="15" type="boolean"/>
+		<bitfield name="WRONG_DATA_CNT_ACK"     pos="16" type="boolean"/>
+		<bitfield name="WRONG_DATA_CNT_EN"      pos="17" type="boolean"/>
+		<bitfield name="I2C_NACK"               pos="18" type="boolean"/>
+		<bitfield name="I2C_NACK_ACK"           pos="19" type="boolean"/>
+		<bitfield name="I2C_NACK_EN"            pos="20" type="boolean"/>
+		<bitfield name="I2C_DEFER"              pos="21" type="boolean"/>
+		<bitfield name="I2C_DEFER_ACK"          pos="22" type="boolean"/>
+		<bitfield name="I2C_DEFER_EN"           pos="23" type="boolean"/>
+		<bitfield name="PLL_UNLOCK"             pos="24" type="boolean"/>
+		<bitfield name="PLL_UNLOCK_ACK"         pos="25" type="boolean"/>
+		<bitfield name="PLL_UNLOCK_EN"          pos="26" type="boolean"/>
+		<bitfield name="AUX_ERROR"              pos="27" type="boolean"/>
+		<bitfield name="AUX_ERROR_ACK"          pos="28" type="boolean"/>
+		<bitfield name="AUX_ERROR_EN"           pos="29" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x030c" name="INTERRUPT_REG_2">
+		<bitfield name="READY_FOR_VIDEO"        pos="0"  type="boolean"/>
+		<bitfield name="READY_FOR_VIDEO_ACK"    pos="1"  type="boolean"/>
+		<bitfield name="READY_FOR_VIDEO_EN"     pos="2"  type="boolean"/>
+		<bitfield name="IDLE_PATTERNs_SENT"     pos="3"  type="boolean"/>
+		<bitfield name="IDLE_PATTERNs_SENT_ACK" pos="4"  type="boolean"/>
+		<bitfield name="IDLE_PATTERNs_SENT_EN"  pos="5"  type="boolean"/>
+		<bitfield name="FRAME_END"              pos="9"  type="boolean"/>
+		<bitfield name="FRAME_END_ACK"          pos="7"  type="boolean"/>
+		<bitfield name="FRAME_END_EN"           pos="8"  type="boolean"/>
+		<bitfield name="CRC_UPDATED"            pos="9"  type="boolean"/>
+		<bitfield name="CRC_UPDATED_ACK"        pos="10" type="boolean"/>
+		<bitfield name="CRC_UPDATED_EN"         pos="11" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0310" name="INTERRUPT_TRANS_NUM"/>
+	<reg32 offset="0x0314" name="AUX_DATA">
+		<bitfield name="READ" pos="0" type="boolean"/>
+		<bitfield name="DATA" low="8" high="15"/>
+		<bitfield name="INDEX" low="16" high="23"/>
+		<bitfield name="INDEX_WRITE" pos="31" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0318" name="AUX_TRANS_CTRL">
+		<bitfield name="I2C" pos="8" type="boolean"/>
+		<bitfield name="GO"  pos="9" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0324" name="AUX_STATUS"/>
+</domain>
+
+<domain name="EDP_PHY" width="32">
+	<array offset="0x0400" name="LN" length="4" stride="0x40">
+		<reg32 offset="0x04" name="PD_CTL"/>
+	</array>
+	<reg32 offset="0x0510" name="GLB_VM_CFG0"/>
+	<reg32 offset="0x0514" name="GLB_VM_CFG1"/>
+	<reg32 offset="0x0518" name="GLB_MISC9"/>
+	<reg32 offset="0x0528" name="GLB_CFG"/>
+	<reg32 offset="0x052c" name="GLB_PD_CTL"/>
+	<reg32 offset="0x0598" name="GLB_PHY_STATUS"/>
+</domain>
+
+<domain name="EDP_28nm_PHY_PLL" width="32">
+	<reg32 offset="0x00000" name="REFCLK_CFG"/>
+	<reg32 offset="0x00004" name="POSTDIV1_CFG"/>
+	<reg32 offset="0x00008" name="CHGPUMP_CFG"/>
+	<reg32 offset="0x0000C" name="VCOLPF_CFG"/>
+	<reg32 offset="0x00010" name="VREG_CFG"/>
+	<reg32 offset="0x00014" name="PWRGEN_CFG"/>
+	<reg32 offset="0x00018" name="DMUX_CFG"/>
+	<reg32 offset="0x0001C" name="AMUX_CFG"/>
+	<reg32 offset="0x00020" name="GLB_CFG">
+		<bitfield name="PLL_PWRDN_B" pos="0" type="boolean"/>
+		<bitfield name="PLL_LDO_PWRDN_B" pos="1" type="boolean"/>
+		<bitfield name="PLL_PWRGEN_PWRDN_B" pos="2" type="boolean"/>
+		<bitfield name="PLL_ENABLE" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00024" name="POSTDIV2_CFG"/>
+	<reg32 offset="0x00028" name="POSTDIV3_CFG"/>
+	<reg32 offset="0x0002C" name="LPFR_CFG"/>
+	<reg32 offset="0x00030" name="LPFC1_CFG"/>
+	<reg32 offset="0x00034" name="LPFC2_CFG"/>
+	<reg32 offset="0x00038" name="SDM_CFG0"/>
+	<reg32 offset="0x0003C" name="SDM_CFG1"/>
+	<reg32 offset="0x00040" name="SDM_CFG2"/>
+	<reg32 offset="0x00044" name="SDM_CFG3"/>
+	<reg32 offset="0x00048" name="SDM_CFG4"/>
+	<reg32 offset="0x0004C" name="SSC_CFG0"/>
+	<reg32 offset="0x00050" name="SSC_CFG1"/>
+	<reg32 offset="0x00054" name="SSC_CFG2"/>
+	<reg32 offset="0x00058" name="SSC_CFG3"/>
+	<reg32 offset="0x0005C" name="LKDET_CFG0"/>
+	<reg32 offset="0x00060" name="LKDET_CFG1"/>
+	<reg32 offset="0x00064" name="LKDET_CFG2"/>
+	<reg32 offset="0x00068" name="TEST_CFG">
+		<bitfield name="PLL_SW_RESET" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0006C" name="CAL_CFG0"/>
+	<reg32 offset="0x00070" name="CAL_CFG1"/>
+	<reg32 offset="0x00074" name="CAL_CFG2"/>
+	<reg32 offset="0x00078" name="CAL_CFG3"/>
+	<reg32 offset="0x0007C" name="CAL_CFG4"/>
+	<reg32 offset="0x00080" name="CAL_CFG5"/>
+	<reg32 offset="0x00084" name="CAL_CFG6"/>
+	<reg32 offset="0x00088" name="CAL_CFG7"/>
+	<reg32 offset="0x0008C" name="CAL_CFG8"/>
+	<reg32 offset="0x00090" name="CAL_CFG9"/>
+	<reg32 offset="0x00094" name="CAL_CFG10"/>
+	<reg32 offset="0x00098" name="CAL_CFG11"/>
+	<reg32 offset="0x0009C" name="EFUSE_CFG"/>
+	<reg32 offset="0x000A0" name="DEBUG_BUS_SEL"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
new file mode 100644
index 000000000000..6c81581016c7
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -0,0 +1,1015 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<!--
+	NOTE: also see mdss_hdmi_util.h.. newer devices using MDSS appear
+	to have the same HDMI block (or maybe a newer version?) but for
+	some reason duplicate the code under drivers/video/msm/mdss
+ -->
+
+<domain name="HDMI" width="32">
+	<enum name="hdmi_hdcp_key_state">
+		<value name="HDCP_KEYS_STATE_NO_KEYS" value="0"/>
+		<value name="HDCP_KEYS_STATE_NOT_CHECKED" value="1"/>
+		<value name="HDCP_KEYS_STATE_CHECKING" value="2"/>
+		<value name="HDCP_KEYS_STATE_VALID" value="3"/>
+		<value name="HDCP_KEYS_STATE_AKSV_NOT_VALID" value="4"/>
+		<value name="HDCP_KEYS_STATE_CHKSUM_MISMATCH" value="5"/>
+		<value name="HDCP_KEYS_STATE_PROD_AKSV" value="6"/>
+		<value name="HDCP_KEYS_STATE_RESERVED" value="7"/>
+	</enum>
+	<enum name="hdmi_ddc_read_write">
+		<value name="DDC_WRITE" value="0"/>
+		<value name="DDC_READ" value="1"/>
+	</enum>
+	<enum name="hdmi_acr_cts">
+		<value name="ACR_NONE" value="0"/>
+		<value name="ACR_32" value="1"/>
+		<value name="ACR_44" value="2"/>
+		<value name="ACR_48" value="3"/>
+	</enum>
+
+	<enum name="hdmi_cec_tx_status">
+		<value name="CEC_TX_OK" value="0"/>
+		<value name="CEC_TX_NACK" value="1"/>
+		<value name="CEC_TX_ARB_LOSS" value="2"/>
+		<value name="CEC_TX_MAX_RETRIES" value="3"/>
+	</enum>
+
+	<reg32 offset="0x00000" name="CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="HDMI" pos="1" type="boolean"/>
+		<bitfield name="ENCRYPTED" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00020" name="AUDIO_PKT_CTRL1">
+		<bitfield name="AUDIO_SAMPLE_SEND" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00024" name="ACR_PKT_CTRL">
+		<!--
+			Guessing on order of bitfields from these comments:
+				/* AUDIO_PRIORITY | SOURCE */
+				acr_pck_ctrl_reg |= 0x80000100;
+				/* N_MULTIPLE(multiplier) */
+				acr_pck_ctrl_reg |= (multiplier & 7) << 16;
+				/* SEND | CONT */
+				acr_pck_ctrl_reg |= 0x00000003;
+		 -->
+		<bitfield name="CONT" pos="0" type="boolean"/>
+		<bitfield name="SEND" pos="1" type="boolean"/>
+		<bitfield name="SELECT" low="4" high="5" type="hdmi_acr_cts"/>
+		<bitfield name="SOURCE" pos="8" type="boolean"/>
+		<bitfield name="N_MULTIPLIER" low="16" high="18" type="uint"/>
+		<bitfield name="AUDIO_PRIORITY" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0028" name="VBI_PKT_CTRL">
+		<!--
+			Guessing on the order of bits from:
+				/* GC packet enable (every frame) */
+				/* HDMI_VBI_PKT_CTRL[0x0028] */
+				hdmi_msm_rmw32or(0x0028, 3 << 4);
+				/* HDMI_VBI_PKT_CTRL[0x0028] */
+				/* ISRC Send + Continuous */
+				hdmi_msm_rmw32or(0x0028, 3 << 8);
+				/* HDMI_VBI_PKT_CTRL[0x0028] */
+				/* ACP send, s/w source */
+				hdmi_msm_rmw32or(0x0028, 3 << 12);
+		 -->
+		<bitfield name="GC_ENABLE" pos="4" type="boolean"/>
+		<bitfield name="GC_EVERY_FRAME" pos="5" type="boolean"/>
+		<bitfield name="ISRC_SEND" pos="8" type="boolean"/>
+		<bitfield name="ISRC_CONTINUOUS" pos="9" type="boolean"/>
+		<bitfield name="ACP_SEND" pos="12" type="boolean"/>
+		<bitfield name="ACP_SRC_SW" pos="13" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0002c" name="INFOFRAME_CTRL0">
+		<!--
+			Guessing on the order of these flags, from this comment:
+				/* Set these flags */
+				/* AUDIO_INFO_UPDATE | AUDIO_INFO_SOURCE | AUDIO_INFO_CONT
+				 | AUDIO_INFO_SEND */
+				audio_info_ctrl_reg |= 0x000000F0;
+				/* 0x3 for AVI InfFrame enable (every frame) */
+				HDMI_OUTP(0x002C, HDMI_INP(0x002C) | 0x00000003L);
+		 -->
+		<bitfield name="AVI_SEND" pos="0" type="boolean"/>
+		<bitfield name="AVI_CONT" pos="1" type="boolean"/>           <!-- every frame -->
+		<bitfield name="AUDIO_INFO_SEND" pos="4" type="boolean"/>
+		<bitfield name="AUDIO_INFO_CONT" pos="5" type="boolean"/>    <!-- every frame -->
+		<bitfield name="AUDIO_INFO_SOURCE" pos="6" type="boolean"/>
+		<bitfield name="AUDIO_INFO_UPDATE" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00030" name="INFOFRAME_CTRL1">
+		<bitfield name="AVI_INFO_LINE" low="0" high="5" type="uint"/>
+		<bitfield name="AUDIO_INFO_LINE" low="8" high="13" type="uint"/>
+		<bitfield name="MPEG_INFO_LINE" low="16" high="21" type="uint"/>
+		<bitfield name="VENSPEC_INFO_LINE" low="24" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00034" name="GEN_PKT_CTRL">
+		<!--
+			0x0034 GEN_PKT_CTRL
+			  GENERIC0_SEND   0      0 = Disable Generic0 Packet Transmission
+			                         1 = Enable Generic0 Packet Transmission
+			  GENERIC0_CONT   1      0 = Send Generic0 Packet on next frame only
+			                         1 = Send Generic0 Packet on every frame
+			  GENERIC0_UPDATE 2      NUM
+			  GENERIC1_SEND   4      0 = Disable Generic1 Packet Transmission
+			                         1 = Enable Generic1 Packet Transmission
+			  GENERIC1_CONT   5      0 = Send Generic1 Packet on next frame only
+			                         1 = Send Generic1 Packet on every frame
+			  GENERIC0_LINE   21:16  NUM
+			  GENERIC1_LINE   29:24  NUM
+			
+			GENERIC0_LINE | GENERIC0_UPDATE | GENERIC0_CONT | GENERIC0_SEND
+			Setup HDMI TX generic packet control
+			Enable this packet to transmit every frame
+			Enable this packet to transmit every frame
+			Enable HDMI TX engine to transmit Generic packet 0
+			  HDMI_OUTP(0x0034, (1 << 16) | (1 << 2) | BIT(1) | BIT(0));
+		 -->
+		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
+		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
+		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
+		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
+		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>
+		<bitfield name="GENERIC1_LINE" low="24" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00040" name="GC">
+		<bitfield name="MUTE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00044" name="AUDIO_PKT_CTRL2">
+		<bitfield name="OVERRIDE" pos="0" type="boolean"/>
+		<bitfield name="LAYOUT" pos="1" type="boolean"/> <!-- 1 for >2 channels -->
+	</reg32>
+
+	<!--
+		AVI_INFO appears to be the infoframe in a slightly weird order..
+		starts with PB0 (checksum), and ends with version..
+	-->
+	<reg32 offset="0x0006c" name="AVI_INFO" stride="4" length="4"/>
+
+	<reg32 offset="0x00084" name="GENERIC0_HDR"/>
+	<reg32 offset="0x00088" name="GENERIC0" stride="4" length="7"/>
+
+	<reg32 offset="0x000a4" name="GENERIC1_HDR"/>
+	<reg32 offset="0x000a8" name="GENERIC1" stride="4" length="7"/>
+
+	<!--
+		TODO add a way to show symbolic offsets into array: hdmi_acr_cts-1
+	 -->
+	<array offset="0x00c4" name="ACR" length="3" stride="8" index="hdmi_acr_cts">
+		<reg32 offset="0" name="0">
+			<bitfield name="CTS" low="12" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="4" name="1">
+			<!-- not sure the actual # of bits.. -->
+			<bitfield name="N" low="0" high="31" type="uint"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0x000e4" name="AUDIO_INFO0">
+		<bitfield name="CHECKSUM" low="0" high="7"/>
+		<bitfield name="CC" low="8" high="10" type="uint"/> <!-- channel count -->
+	</reg32>
+	<reg32 offset="0x000e8" name="AUDIO_INFO1">
+		<bitfield name="CA" low="0" high="7"/>        <!-- Channel Allocation -->
+		<bitfield name="LSV" low="11" high="14"/>     <!-- Level Shift -->
+		<bitfield name="DM_INH" pos="15" type="boolean"/>  <!-- down-mix inhibit flag -->
+	</reg32>
+	<reg32 offset="0x00110" name="HDCP_CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="ENCRYPTION_ENABLE" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00114" name="HDCP_DEBUG_CTRL">
+		<bitfield name="RNG_CIPHER" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00118" name="HDCP_INT_CTRL">
+		<bitfield name="AUTH_SUCCESS_INT" pos="0" type="boolean"/>
+		<bitfield name="AUTH_SUCCESS_ACK" pos="1" type="boolean"/>
+		<bitfield name="AUTH_SUCCESS_MASK" pos="2" type="boolean"/>
+		<bitfield name="AUTH_FAIL_INT" pos="4" type="boolean"/>
+		<bitfield name="AUTH_FAIL_ACK" pos="5" type="boolean"/>
+		<bitfield name="AUTH_FAIL_MASK" pos="6" type="boolean"/>
+		<bitfield name="AUTH_FAIL_INFO_ACK" pos="7" type="boolean"/>
+		<bitfield name="AUTH_XFER_REQ_INT" pos="8" type="boolean"/>
+		<bitfield name="AUTH_XFER_REQ_ACK" pos="9" type="boolean"/>
+		<bitfield name="AUTH_XFER_REQ_MASK" pos="10" type="boolean"/>
+		<bitfield name="AUTH_XFER_DONE_INT" pos="12" type="boolean"/>
+		<bitfield name="AUTH_XFER_DONE_ACK" pos="13" type="boolean"/>
+		<bitfield name="AUTH_XFER_DONE_MASK" pos="14" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0011c" name="HDCP_LINK0_STATUS">
+		<bitfield name="AN_0_READY" pos="8" type="boolean"/>
+		<bitfield name="AN_1_READY" pos="9" type="boolean"/>
+		<bitfield name="RI_MATCHES" pos="12" type="boolean"/>
+		<bitfield name="V_MATCHES" pos="20" type="boolean"/>
+		<bitfield name="KEY_STATE" low="28" high="30" type="hdmi_hdcp_key_state"/>
+	</reg32>
+	<reg32 offset="0x00120" name="HDCP_DDC_CTRL_0">
+		<bitfield name="DISABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00124" name="HDCP_DDC_CTRL_1">
+		<bitfield name="FAILED_ACK" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00128" name="HDCP_DDC_STATUS">
+		<bitfield name="XFER_REQ" pos="4" type="boolean"/>
+		<bitfield name="XFER_DONE" pos="10" type="boolean"/>
+		<bitfield name="ABORTED" pos="12" type="boolean"/>
+		<bitfield name="TIMEOUT" pos="13" type="boolean"/>
+		<bitfield name="NACK0" pos="14" type="boolean"/>
+		<bitfield name="NACK1" pos="15" type="boolean"/>
+		<bitfield name="FAILED" pos="16" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0012c" name="HDCP_ENTROPY_CTRL0"/>
+	<reg32 offset="0x0025c" name="HDCP_ENTROPY_CTRL1"/>
+
+	<reg32 offset="0x00130" name="HDCP_RESET">
+		<bitfield name="LINK0_DEAUTHENTICATE" pos="0" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x00134" name="HDCP_RCVPORT_DATA0"/>
+	<reg32 offset="0x00138" name="HDCP_RCVPORT_DATA1"/>
+	<reg32 offset="0x0013C" name="HDCP_RCVPORT_DATA2_0"/>
+	<reg32 offset="0x00140" name="HDCP_RCVPORT_DATA2_1"/>
+	<reg32 offset="0x00144" name="HDCP_RCVPORT_DATA3"/>
+	<reg32 offset="0x00148" name="HDCP_RCVPORT_DATA4"/>
+	<reg32 offset="0x0014c" name="HDCP_RCVPORT_DATA5"/>
+	<reg32 offset="0x00150" name="HDCP_RCVPORT_DATA6"/>
+	<reg32 offset="0x00154" name="HDCP_RCVPORT_DATA7"/>
+	<reg32 offset="0x00158" name="HDCP_RCVPORT_DATA8"/>
+	<reg32 offset="0x0015c" name="HDCP_RCVPORT_DATA9"/>
+	<reg32 offset="0x00160" name="HDCP_RCVPORT_DATA10"/>
+	<reg32 offset="0x00164" name="HDCP_RCVPORT_DATA11"/>
+	<reg32 offset="0x00168" name="HDCP_RCVPORT_DATA12"/>
+
+	<reg32 offset="0x0016c" name="VENSPEC_INFO0"/>
+	<reg32 offset="0x00170" name="VENSPEC_INFO1"/>
+	<reg32 offset="0x00174" name="VENSPEC_INFO2"/>
+	<reg32 offset="0x00178" name="VENSPEC_INFO3"/>
+	<reg32 offset="0x0017c" name="VENSPEC_INFO4"/>
+	<reg32 offset="0x00180" name="VENSPEC_INFO5"/>
+	<reg32 offset="0x00184" name="VENSPEC_INFO6"/>
+
+	<reg32 offset="0x001d0" name="AUDIO_CFG">
+		<bitfield name="ENGINE_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="FIFO_WATERMARK" low="4" high="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00208" name="USEC_REFTIMER"/>
+	<reg32 offset="0x0020c" name="DDC_CTRL">
+		<!--
+			 0x020C HDMI_DDC_CTRL
+			[21:20] TRANSACTION_CNT
+				Number of transactions to be done in current transfer.
+				* 0x0: transaction0 only
+				* 0x1: transaction0, transaction1
+				* 0x2: transaction0, transaction1, transaction2
+				* 0x3: transaction0, transaction1, transaction2, transaction3
+			[3] SW_STATUS_RESET
+				Write 1 to reset HDMI_DDC_SW_STATUS flags, will reset SW_DONE,
+				ABORTED, TIMEOUT, SW_INTERRUPTED, BUFFER_OVERFLOW,
+				STOPPED_ON_NACK, NACK0, NACK1, NACK2, NACK3
+			[2] SEND_RESET Set to 1 to send reset sequence (9 clocks with no
+				data) at start of transfer.  This sequence is sent after GO is
+				written to 1, before the first transaction only.
+			[1] SOFT_RESET Write 1 to reset DDC controller
+			[0] GO WRITE ONLY. Write 1 to start DDC transfer.
+		 -->
+		<bitfield name="GO" pos="0" type="boolean"/>
+		<bitfield name="SOFT_RESET" pos="1" type="boolean"/>
+		<bitfield name="SEND_RESET" pos="2" type="boolean"/>
+		<bitfield name="SW_STATUS_RESET" pos="3" type="boolean"/>
+		<bitfield name="TRANSACTION_CNT" low="20" high="21" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00210" name="DDC_ARBITRATION">
+		<bitfield name="HW_ARBITRATION" pos="4" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00214" name="DDC_INT_CTRL">
+		<!--
+			HDMI_DDC_INT_CTRL[0x0214]
+			   [2] SW_DONE_MK Mask bit for SW_DONE_INT. Set to 1 to enable
+			       interrupt.
+			   [1] SW_DONE_ACK WRITE ONLY. Acknowledge bit for SW_DONE_INT.
+			       Write 1 to clear interrupt.
+			   [0] SW_DONE_INT READ ONLY. SW_DONE interrupt status */
+		 -->
+		<bitfield name="SW_DONE_INT" pos="0" type="boolean"/>
+		<bitfield name="SW_DONE_ACK" pos="1" type="boolean"/>
+		<bitfield name="SW_DONE_MASK" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00218" name="DDC_SW_STATUS">
+		<bitfield name="NACK0" pos="12" type="boolean"/>
+		<bitfield name="NACK1" pos="13" type="boolean"/>
+		<bitfield name="NACK2" pos="14" type="boolean"/>
+		<bitfield name="NACK3" pos="15" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0021c" name="DDC_HW_STATUS">
+		<bitfield name="DONE" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00220" name="DDC_SPEED">
+		<!--
+		   0x0220 HDMI_DDC_SPEED
+		   [31:16] PRESCALE prescale = (m * xtal_frequency) /
+			(desired_i2c_speed), where m is multiply
+			factor, default: m = 1
+		   [1:0]   THRESHOLD Select threshold to use to determine whether value
+			sampled on SDA is a 1 or 0. Specified in terms of the ratio
+			between the number of sampled ones and the total number of times
+			SDA is sampled.
+			* 0x0: >0
+			* 0x1: 1/4 of total samples
+			* 0x2: 1/2 of total samples
+			* 0x3: 3/4 of total samples */
+		 -->
+		<bitfield name="THRESHOLD" low="0" high="1" type="uint"/>
+		<bitfield name="PRESCALE" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00224" name="DDC_SETUP">
+		<!--
+			 * 0x0224 HDMI_DDC_SETUP
+			 * Setting 31:24 bits : Time units to wait before timeout
+			 * when clock is being stalled by external sink device
+		 -->
+		<bitfield name="TIMEOUT" low="24" high="31" type="uint"/>
+	</reg32>
+	<!-- Guessing length is 4, as elsewhere the are references to trans0 thru trans3 -->
+	<array offset="0x00228" name="I2C_TRANSACTION" length="4" stride="4">
+		<reg32 offset="0" name="REG">
+			<!--
+				0x0228 HDMI_DDC_TRANS0
+				[23:16] CNT0 Byte count for first transaction (excluding the first
+					byte, which is usually the address).
+				[13] STOP0 Determines whether a stop bit will be sent after the first
+					transaction
+					* 0: NO STOP
+					* 1: STOP
+				[12] START0 Determines whether a start bit will be sent before the
+					first transaction
+					* 0: NO START
+					* 1: START
+				[8] STOP_ON_NACK0 Determines whether the current transfer will stop
+					if a NACK is received during the first transaction (current
+					transaction always stops).
+					* 0: STOP CURRENT TRANSACTION, GO TO NEXT TRANSACTION
+					* 1: STOP ALL TRANSACTIONS, SEND STOP BIT
+				[0] RW0 Read/write indicator for first transaction - set to 0 for
+					write, 1 for read. This bit only controls HDMI_DDC behaviour -
+					the R/W bit in the transaction is programmed into the DDC buffer
+					as the LSB of the address byte.
+					* 0: WRITE
+					* 1: READ
+			 -->
+			<bitfield name="RW" pos="0" type="hdmi_ddc_read_write"/>
+			<bitfield name="STOP_ON_NACK" pos="8" type="boolean"/>
+			<bitfield name="START" pos="12" type="boolean"/>
+			<bitfield name="STOP" pos="13" type="boolean"/>
+			<bitfield name="CNT" low="16" high="23" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x00238" name="DDC_DATA">
+		<!--
+			0x0238 HDMI_DDC_DATA
+			[31] INDEX_WRITE WRITE ONLY. To write index field, set this bit to
+				1 while writing HDMI_DDC_DATA.
+			[23:16] INDEX Use to set index into DDC buffer for next read or
+				current write, or to read index of current read or next write.
+				Writable only when INDEX_WRITE=1.
+			[15:8] DATA Use to fill or read the DDC buffer
+			[0] DATA_RW Select whether buffer access will be a read or write.
+				For writes, address auto-increments on write to HDMI_DDC_DATA.
+				For reads, address autoincrements on reads to HDMI_DDC_DATA.
+				* 0: Write
+				* 1: Read
+		 -->
+		<bitfield name="DATA_RW" pos="0" type="hdmi_ddc_read_write"/>
+		<bitfield name="DATA" low="8" high="15" type="uint"/>
+		<bitfield name="INDEX" low="16" high="23" type="uint"/>
+		<bitfield name="INDEX_WRITE" pos="31" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x0023c" name="HDCP_SHA_CTRL"/>
+	<reg32 offset="0x00240" name="HDCP_SHA_STATUS">
+		<bitfield name="BLOCK_DONE" pos="0" type="boolean"/>
+		<bitfield name="COMP_DONE" pos="4" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00244" name="HDCP_SHA_DATA">
+		<bitfield name="DONE" pos="0" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x00250" name="HPD_INT_STATUS">
+		<bitfield name="INT" pos="0" type="boolean"/>  <!-- an irq has occurred -->
+		<bitfield name="CABLE_DETECTED" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00254" name="HPD_INT_CTRL">
+		<!-- (this useful comment was removed in df6b645.. git archaeology is fun)
+			HPD_INT_CTRL[0x0254]
+			31:10 Reserved
+			9     RCV_PLUGIN_DET_MASK  receiver plug in interrupt mask.
+			                           When programmed to 1,
+			                           RCV_PLUGIN_DET_INT will toggle
+			                           the interrupt line
+			8:6   Reserved
+			5     RX_INT_EN            Panel RX interrupt enable
+			      0: Disable
+			      1: Enable
+			4     RX_INT_ACK           WRITE ONLY. Panel RX interrupt
+			                           ack
+			3     Reserved
+			2     INT_EN               Panel interrupt control
+			      0: Disable
+			      1: Enable
+			1     INT_POLARITY         Panel interrupt polarity
+			      0: generate interrupt on disconnect
+			      1: generate interrupt on connect
+			0     INT_ACK              WRITE ONLY. Panel interrupt ack
+		 -->
+		<bitfield name="INT_ACK" pos="0" type="boolean"/>
+		<bitfield name="INT_CONNECT" pos="1" type="boolean"/>
+		<bitfield name="INT_EN" pos="2" type="boolean"/>
+		<bitfield name="RX_INT_ACK" pos="4" type="boolean"/>
+		<bitfield name="RX_INT_EN" pos="5" type="boolean"/>
+		<bitfield name="RCV_PLUGIN_DET_MASK" pos="9" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00258" name="HPD_CTRL">
+		<bitfield name="TIMEOUT" low="0" high="12" type="uint"/>
+		<bitfield name="ENABLE" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0027c" name="DDC_REF">
+		<!--
+			0x027C HDMI_DDC_REF
+			[16] REFTIMER_ENABLE	Enable the timer
+				* 0: Disable
+				* 1: Enable
+			[15:0] REFTIMER	Value to set the register in order to generate
+				DDC strobe. This register counts on HDCP application clock
+
+			/* Enable reference timer
+			 * 27 micro-seconds */
+			HDMI_OUTP_ND(0x027C, (1 << 16) | (27 << 0));
+		 -->
+		<bitfield name="REFTIMER_ENABLE" pos="16" type="boolean"/>
+		<bitfield name="REFTIMER" low="0" high="15" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00284" name="HDCP_SW_UPPER_AKSV"/>
+	<reg32 offset="0x00288" name="HDCP_SW_LOWER_AKSV"/>
+
+	<reg32 offset="0x0028c" name="CEC_CTRL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="SEND_TRIGGER" pos="1" type="boolean"/>
+		<bitfield name="FRAME_SIZE" low="4" high="8" type="uint"/>
+		<bitfield name="LINE_OE" pos="9" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00290" name="CEC_WR_DATA">
+		<bitfield name="BROADCAST" pos="0" type="boolean"/>
+		<bitfield name="DATA" low="8" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00294" name="CEC_RETRANSMIT">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="COUNT" low="1" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00298" name="CEC_STATUS">
+		<bitfield name="BUSY" pos="0" type="boolean"/>
+		<bitfield name="TX_FRAME_DONE" pos="3" type="boolean"/>
+		<bitfield name="TX_STATUS" low="4" high="7" type="hdmi_cec_tx_status"/>
+	</reg32>
+	<reg32 offset="0x0029c" name="CEC_INT">
+		<bitfield name="TX_DONE" pos="0" type="boolean"/>
+		<bitfield name="TX_DONE_MASK" pos="1" type="boolean"/>
+		<bitfield name="TX_ERROR" pos="2" type="boolean"/>
+		<bitfield name="TX_ERROR_MASK" pos="3" type="boolean"/>
+		<bitfield name="MONITOR" pos="4" type="boolean"/>
+		<bitfield name="MONITOR_MASK" pos="5" type="boolean"/>
+		<bitfield name="RX_DONE" pos="6" type="boolean"/>
+		<bitfield name="RX_DONE_MASK" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002a0" name="CEC_ADDR"/>
+	<reg32 offset="0x002a4" name="CEC_TIME">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="SIGNAL_FREE_TIME" low="7" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002a8" name="CEC_REFTIMER">
+		<bitfield name="REFTIMER" low="0" high="15" type="uint"/>
+		<bitfield name="ENABLE" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002ac" name="CEC_RD_DATA">
+		<bitfield name="DATA" low="0" high="7" type="uint"/>
+		<bitfield name="SIZE" low="8" high="12" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002b0" name="CEC_RD_FILTER"/>
+
+	<reg32 offset="0x002b4" name="ACTIVE_HSYNC">
+		<bitfield name="START" low="0" high="12" type="uint"/>
+		<bitfield name="END" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002b8" name="ACTIVE_VSYNC">
+		<bitfield name="START" low="0" high="12" type="uint"/>
+		<bitfield name="END" low="16" high="28" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002bc" name="VSYNC_ACTIVE_F2">
+		<!-- interlaced, frame 2 -->
+		<bitfield name="START" low="0" high="12" type="uint"/>
+		<bitfield name="END" low="16" high="28" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002c0" name="TOTAL">
+		<bitfield name="H_TOTAL" low="0" high="12" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="28" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002c4" name="VSYNC_TOTAL_F2">
+		<!-- interlaced, frame 2 -->
+		<bitfield name="V_TOTAL" low="0" high="12" type="uint"/>
+	</reg32>
+	<reg32 offset="0x002c8" name="FRAME_CTRL">
+		<bitfield name="RGB_MUX_SEL_BGR" pos="12" type="boolean"/>
+		<bitfield name="VSYNC_LOW" pos="28" type="boolean"/>
+		<bitfield name="HSYNC_LOW" pos="29" type="boolean"/>
+		<bitfield name="INTERLACED_EN" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002cc" name="AUD_INT">
+		<!--
+			HDMI_AUD_INT[0x02CC]
+			[3] AUD_SAM_DROP_MASK [R/W]
+			[2] AUD_SAM_DROP_ACK [W], AUD_SAM_DROP_INT [R]
+			[1] AUD_FIFO_URUN_MASK [R/W]
+			[0] AUD_FIFO_URUN_ACK [W], AUD_FIFO_URUN_INT [R]
+		 -->
+		<bitfield name="AUD_FIFO_URUN_INT" pos="0" type="boolean"/>  <!-- write to ack irq -->
+		<bitfield name="AUD_FIFO_URAN_MASK" pos="1" type="boolean"/> <!-- r/w, enables irq -->
+		<bitfield name="AUD_SAM_DROP_INT" pos="2" type="boolean"/>   <!-- write to ack irq -->
+		<bitfield name="AUD_SAM_DROP_MASK" pos="3" type="boolean"/>  <!-- r/w, enables irq -->
+	</reg32>
+	<reg32 offset="0x002d4" name="PHY_CTRL">
+		<!--
+			in hdmi_phy_reset() it appears to be toggling SW_RESET/
+			SW_RESET_PLL based on the value of the bit above, so
+			I'm guessing the bit above is a polarit bit
+		 -->
+		<bitfield name="SW_RESET_PLL" pos="0" type="boolean"/>
+		<bitfield name="SW_RESET_PLL_LOW" pos="1" type="boolean"/>
+		<bitfield name="SW_RESET" pos="2" type="boolean"/>
+		<bitfield name="SW_RESET_LOW" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x002dc" name="CEC_WR_RANGE"/>
+	<reg32 offset="0x002e0" name="CEC_RD_RANGE"/>
+	<reg32 offset="0x002e4" name="VERSION"/>
+	<reg32 offset="0x00360" name="CEC_COMPL_CTL"/>
+	<reg32 offset="0x00364" name="CEC_RD_START_RANGE"/>
+	<reg32 offset="0x00368" name="CEC_RD_TOTAL_RANGE"/>
+	<reg32 offset="0x0036c" name="CEC_RD_ERR_RESP_LO"/>
+	<reg32 offset="0x00370" name="CEC_WR_CHECK_CONFIG"/>
+
+</domain>
+
+<domain name="HDMI_8x60" width="32">
+	<reg32 offset="0x00000" name="PHY_REG0">
+		<bitfield name="DESER_DEL_CTRL" low="2" high="4" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00004" name="PHY_REG1">
+		<bitfield name="DTEST_MUX_SEL" low="4" high="7" type="uint"/>
+		<bitfield name="OUTVOL_SWING_CTRL" low="0" high="3" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00008" name="PHY_REG2">
+		<bitfield name="PD_DESER" pos="0" type="boolean"/>
+		<bitfield name="PD_DRIVE_1" pos="1" type="boolean"/>
+		<bitfield name="PD_DRIVE_2" pos="2" type="boolean"/>
+		<bitfield name="PD_DRIVE_3" pos="3" type="boolean"/>
+		<bitfield name="PD_DRIVE_4" pos="4" type="boolean"/>
+		<bitfield name="PD_PLL" pos="5" type="boolean"/>
+		<bitfield name="PD_PWRGEN" pos="6" type="boolean"/>
+		<bitfield name="RCV_SENSE_EN" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0000c" name="PHY_REG3">
+		<bitfield name="PLL_ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00010" name="PHY_REG4"/>
+	<reg32 offset="0x00014" name="PHY_REG5"/>
+	<reg32 offset="0x00018" name="PHY_REG6"/>
+	<reg32 offset="0x0001c" name="PHY_REG7"/>
+	<reg32 offset="0x00020" name="PHY_REG8"/>
+	<reg32 offset="0x00024" name="PHY_REG9"/>
+	<reg32 offset="0x00028" name="PHY_REG10"/>
+	<reg32 offset="0x0002c" name="PHY_REG11"/>
+	<reg32 offset="0x00030" name="PHY_REG12">
+		<bitfield name="RETIMING_EN" pos="0" type="boolean"/>
+		<bitfield name="PLL_LOCK_DETECT_EN" pos="1" type="boolean"/>
+		<bitfield name="FORCE_LOCK" pos="4" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="HDMI_8960" width="32">
+	<!--
+		some of the bitfields may be same as 8x60.. but no helpful comments
+		in msm_dss_io_8960.c
+	 -->
+	<reg32 offset="0x00000" name="PHY_REG0"/>
+	<reg32 offset="0x00004" name="PHY_REG1"/>
+	<reg32 offset="0x00008" name="PHY_REG2"/>
+	<reg32 offset="0x0000c" name="PHY_REG3"/>
+	<reg32 offset="0x00010" name="PHY_REG4"/>
+	<reg32 offset="0x00014" name="PHY_REG5"/>
+	<reg32 offset="0x00018" name="PHY_REG6"/>
+	<reg32 offset="0x0001c" name="PHY_REG7"/>
+	<reg32 offset="0x00020" name="PHY_REG8"/>
+	<reg32 offset="0x00024" name="PHY_REG9"/>
+	<reg32 offset="0x00028" name="PHY_REG10"/>
+	<reg32 offset="0x0002c" name="PHY_REG11"/>
+	<reg32 offset="0x00030" name="PHY_REG12">
+		<bitfield name="SW_RESET" pos="5" type="boolean"/>
+		<bitfield name="PWRDN_B" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00034" name="PHY_REG_BIST_CFG"/>
+	<reg32 offset="0x00038" name="PHY_DEBUG_BUS_SEL"/>
+	<reg32 offset="0x0003c" name="PHY_REG_MISC0"/>
+	<reg32 offset="0x00040" name="PHY_REG13"/>
+	<reg32 offset="0x00044" name="PHY_REG14"/>
+	<reg32 offset="0x00048" name="PHY_REG15"/>
+</domain>
+
+<domain name="HDMI_8960_PHY_PLL" width="32">
+	<reg32 offset="0x00000" name="REFCLK_CFG"/>
+	<reg32 offset="0x00004" name="CHRG_PUMP_CFG"/>
+	<reg32 offset="0x00008" name="LOOP_FLT_CFG0"/>
+	<reg32 offset="0x0000c" name="LOOP_FLT_CFG1"/>
+	<reg32 offset="0x00010" name="IDAC_ADJ_CFG"/>
+	<reg32 offset="0x00014" name="I_VI_KVCO_CFG"/>
+	<reg32 offset="0x00018" name="PWRDN_B">
+		<bitfield name="PD_PLL" pos="1" type="boolean"/>
+		<bitfield name="PLL_PWRDN_B" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0001c" name="SDM_CFG0"/>
+	<reg32 offset="0x00020" name="SDM_CFG1"/>
+	<reg32 offset="0x00024" name="SDM_CFG2"/>
+	<reg32 offset="0x00028" name="SDM_CFG3"/>
+	<reg32 offset="0x0002c" name="SDM_CFG4"/>
+	<reg32 offset="0x00030" name="SSC_CFG0"/>
+	<reg32 offset="0x00034" name="SSC_CFG1"/>
+	<reg32 offset="0x00038" name="SSC_CFG2"/>
+	<reg32 offset="0x0003c" name="SSC_CFG3"/>
+	<reg32 offset="0x00040" name="LOCKDET_CFG0"/>
+	<reg32 offset="0x00044" name="LOCKDET_CFG1"/>
+	<reg32 offset="0x00048" name="LOCKDET_CFG2"/>
+	<reg32 offset="0x0004c" name="VCOCAL_CFG0"/>
+	<reg32 offset="0x00050" name="VCOCAL_CFG1"/>
+	<reg32 offset="0x00054" name="VCOCAL_CFG2"/>
+	<reg32 offset="0x00058" name="VCOCAL_CFG3"/>
+	<reg32 offset="0x0005c" name="VCOCAL_CFG4"/>
+	<reg32 offset="0x00060" name="VCOCAL_CFG5"/>
+	<reg32 offset="0x00064" name="VCOCAL_CFG6"/>
+	<reg32 offset="0x00068" name="VCOCAL_CFG7"/>
+	<reg32 offset="0x0006c" name="DEBUG_SEL"/>
+	<reg32 offset="0x00070" name="MISC0"/>
+	<reg32 offset="0x00074" name="MISC1"/>
+	<reg32 offset="0x00078" name="MISC2"/>
+	<reg32 offset="0x0007c" name="MISC3"/>
+	<reg32 offset="0x00080" name="MISC4"/>
+	<reg32 offset="0x00084" name="MISC5"/>
+	<reg32 offset="0x00088" name="MISC6"/>
+	<reg32 offset="0x0008c" name="DEBUG_BUS0"/>
+	<reg32 offset="0x00090" name="DEBUG_BUS1"/>
+	<reg32 offset="0x00094" name="DEBUG_BUS2"/>
+	<reg32 offset="0x00098" name="STATUS0">
+		<bitfield name="PLL_LOCK" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0009c" name="STATUS1"/>
+</domain>
+
+<domain name="HDMI_8x74" width="32">
+	<!--
+		seems to be all mdp5+ have same?
+	 -->
+	<reg32 offset="0x00000" name="ANA_CFG0"/>
+	<reg32 offset="0x00004" name="ANA_CFG1"/>
+	<reg32 offset="0x00008" name="ANA_CFG2"/>
+	<reg32 offset="0x0000c" name="ANA_CFG3"/>
+	<reg32 offset="0x00010" name="PD_CTRL0"/>
+	<reg32 offset="0x00014" name="PD_CTRL1"/>
+	<reg32 offset="0x00018" name="GLB_CFG"/>
+	<reg32 offset="0x0001c" name="DCC_CFG0"/>
+	<reg32 offset="0x00020" name="DCC_CFG1"/>
+	<reg32 offset="0x00024" name="TXCAL_CFG0"/>
+	<reg32 offset="0x00028" name="TXCAL_CFG1"/>
+	<reg32 offset="0x0002c" name="TXCAL_CFG2"/>
+	<reg32 offset="0x00030" name="TXCAL_CFG3"/>
+	<reg32 offset="0x00034" name="BIST_CFG0"/>
+	<reg32 offset="0x0003c" name="BIST_PATN0"/>
+	<reg32 offset="0x00040" name="BIST_PATN1"/>
+	<reg32 offset="0x00044" name="BIST_PATN2"/>
+	<reg32 offset="0x00048" name="BIST_PATN3"/>
+	<reg32 offset="0x0005c" name="STATUS"/>
+</domain>
+
+<domain name="HDMI_28nm_PHY_PLL" width="32">
+	<reg32 offset="0x00000" name="REFCLK_CFG"/>
+	<reg32 offset="0x00004" name="POSTDIV1_CFG"/>
+	<reg32 offset="0x00008" name="CHGPUMP_CFG"/>
+	<reg32 offset="0x0000C" name="VCOLPF_CFG"/>
+	<reg32 offset="0x00010" name="VREG_CFG"/>
+	<reg32 offset="0x00014" name="PWRGEN_CFG"/>
+	<reg32 offset="0x00018" name="DMUX_CFG"/>
+	<reg32 offset="0x0001C" name="AMUX_CFG"/>
+	<reg32 offset="0x00020" name="GLB_CFG">
+		<bitfield name="PLL_PWRDN_B" pos="0" type="boolean"/>
+		<bitfield name="PLL_LDO_PWRDN_B" pos="1" type="boolean"/>
+		<bitfield name="PLL_PWRGEN_PWRDN_B" pos="2" type="boolean"/>
+		<bitfield name="PLL_ENABLE" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00024" name="POSTDIV2_CFG"/>
+	<reg32 offset="0x00028" name="POSTDIV3_CFG"/>
+	<reg32 offset="0x0002C" name="LPFR_CFG"/>
+	<reg32 offset="0x00030" name="LPFC1_CFG"/>
+	<reg32 offset="0x00034" name="LPFC2_CFG"/>
+	<reg32 offset="0x00038" name="SDM_CFG0"/>
+	<reg32 offset="0x0003C" name="SDM_CFG1"/>
+	<reg32 offset="0x00040" name="SDM_CFG2"/>
+	<reg32 offset="0x00044" name="SDM_CFG3"/>
+	<reg32 offset="0x00048" name="SDM_CFG4"/>
+	<reg32 offset="0x0004C" name="SSC_CFG0"/>
+	<reg32 offset="0x00050" name="SSC_CFG1"/>
+	<reg32 offset="0x00054" name="SSC_CFG2"/>
+	<reg32 offset="0x00058" name="SSC_CFG3"/>
+	<reg32 offset="0x0005C" name="LKDET_CFG0"/>
+	<reg32 offset="0x00060" name="LKDET_CFG1"/>
+	<reg32 offset="0x00064" name="LKDET_CFG2"/>
+	<reg32 offset="0x00068" name="TEST_CFG">
+		<bitfield name="PLL_SW_RESET" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0006C" name="CAL_CFG0"/>
+	<reg32 offset="0x00070" name="CAL_CFG1"/>
+	<reg32 offset="0x00074" name="CAL_CFG2"/>
+	<reg32 offset="0x00078" name="CAL_CFG3"/>
+	<reg32 offset="0x0007C" name="CAL_CFG4"/>
+	<reg32 offset="0x00080" name="CAL_CFG5"/>
+	<reg32 offset="0x00084" name="CAL_CFG6"/>
+	<reg32 offset="0x00088" name="CAL_CFG7"/>
+	<reg32 offset="0x0008C" name="CAL_CFG8"/>
+	<reg32 offset="0x00090" name="CAL_CFG9"/>
+	<reg32 offset="0x00094" name="CAL_CFG10"/>
+	<reg32 offset="0x00098" name="CAL_CFG11"/>
+	<reg32 offset="0x0009C" name="EFUSE_CFG"/>
+	<reg32 offset="0x000A0" name="DEBUG_BUS_SEL"/>
+	<reg32 offset="0x000C0" name="STATUS"/>
+</domain>
+
+<domain name="HDMI_8996_PHY" width="32">
+	<reg32 offset="0x00000" name="CFG"/>
+	<reg32 offset="0x00004" name="PD_CTL"/>
+	<reg32 offset="0x00008" name="MODE"/>
+	<reg32 offset="0x0000C" name="MISR_CLEAR"/>
+	<reg32 offset="0x00010" name="TX0_TX1_BIST_CFG0"/>
+	<reg32 offset="0x00014" name="TX0_TX1_BIST_CFG1"/>
+	<reg32 offset="0x00018" name="TX0_TX1_PRBS_SEED_BYTE0"/>
+	<reg32 offset="0x0001C" name="TX0_TX1_PRBS_SEED_BYTE1"/>
+	<reg32 offset="0x00020" name="TX0_TX1_BIST_PATTERN0"/>
+	<reg32 offset="0x00024" name="TX0_TX1_BIST_PATTERN1"/>
+	<reg32 offset="0x00028" name="TX2_TX3_BIST_CFG0"/>
+	<reg32 offset="0x0002C" name="TX2_TX3_BIST_CFG1"/>
+	<reg32 offset="0x00030" name="TX2_TX3_PRBS_SEED_BYTE0"/>
+	<reg32 offset="0x00034" name="TX2_TX3_PRBS_SEED_BYTE1"/>
+	<reg32 offset="0x00038" name="TX2_TX3_BIST_PATTERN0"/>
+	<reg32 offset="0x0003C" name="TX2_TX3_BIST_PATTERN1"/>
+	<reg32 offset="0x00040" name="DEBUG_BUS_SEL"/>
+	<reg32 offset="0x00044" name="TXCAL_CFG0"/>
+	<reg32 offset="0x00048" name="TXCAL_CFG1"/>
+	<reg32 offset="0x0004C" name="TX0_TX1_LANE_CTL"/>
+	<reg32 offset="0x00050" name="TX2_TX3_LANE_CTL"/>
+	<reg32 offset="0x00054" name="LANE_BIST_CONFIG"/>
+	<reg32 offset="0x00058" name="CLOCK"/>
+	<reg32 offset="0x0005C" name="MISC1"/>
+	<reg32 offset="0x00060" name="MISC2"/>
+	<reg32 offset="0x00064" name="TX0_TX1_BIST_STATUS0"/>
+	<reg32 offset="0x00068" name="TX0_TX1_BIST_STATUS1"/>
+	<reg32 offset="0x0006C" name="TX0_TX1_BIST_STATUS2"/>
+	<reg32 offset="0x00070" name="TX2_TX3_BIST_STATUS0"/>
+	<reg32 offset="0x00074" name="TX2_TX3_BIST_STATUS1"/>
+	<reg32 offset="0x00078" name="TX2_TX3_BIST_STATUS2"/>
+	<reg32 offset="0x0007C" name="PRE_MISR_STATUS0"/>
+	<reg32 offset="0x00080" name="PRE_MISR_STATUS1"/>
+	<reg32 offset="0x00084" name="PRE_MISR_STATUS2"/>
+	<reg32 offset="0x00088" name="PRE_MISR_STATUS3"/>
+	<reg32 offset="0x0008C" name="POST_MISR_STATUS0"/>
+	<reg32 offset="0x00090" name="POST_MISR_STATUS1"/>
+	<reg32 offset="0x00094" name="POST_MISR_STATUS2"/>
+	<reg32 offset="0x00098" name="POST_MISR_STATUS3"/>
+	<reg32 offset="0x0009C" name="STATUS"/>
+	<reg32 offset="0x000A0" name="MISC3_STATUS"/>
+	<reg32 offset="0x000A4" name="MISC4_STATUS"/>
+	<reg32 offset="0x000A8" name="DEBUG_BUS0"/>
+	<reg32 offset="0x000AC" name="DEBUG_BUS1"/>
+	<reg32 offset="0x000B0" name="DEBUG_BUS2"/>
+	<reg32 offset="0x000B4" name="DEBUG_BUS3"/>
+	<reg32 offset="0x000B8" name="PHY_REVISION_ID0"/>
+	<reg32 offset="0x000BC" name="PHY_REVISION_ID1"/>
+	<reg32 offset="0x000C0" name="PHY_REVISION_ID2"/>
+	<reg32 offset="0x000C4" name="PHY_REVISION_ID3"/>
+</domain>
+
+<domain name="HDMI_PHY_QSERDES_COM" width="32">
+	<reg32 offset="0x00000" name="ATB_SEL1"/>
+	<reg32 offset="0x00004" name="ATB_SEL2"/>
+	<reg32 offset="0x00008" name="FREQ_UPDATE"/>
+	<reg32 offset="0x0000C" name="BG_TIMER"/>
+	<reg32 offset="0x00010" name="SSC_EN_CENTER"/>
+	<reg32 offset="0x00014" name="SSC_ADJ_PER1"/>
+	<reg32 offset="0x00018" name="SSC_ADJ_PER2"/>
+	<reg32 offset="0x0001C" name="SSC_PER1"/>
+	<reg32 offset="0x00020" name="SSC_PER2"/>
+	<reg32 offset="0x00024" name="SSC_STEP_SIZE1"/>
+	<reg32 offset="0x00028" name="SSC_STEP_SIZE2"/>
+	<reg32 offset="0x0002C" name="POST_DIV"/>
+	<reg32 offset="0x00030" name="POST_DIV_MUX"/>
+	<reg32 offset="0x00034" name="BIAS_EN_CLKBUFLR_EN"/>
+	<reg32 offset="0x00038" name="CLK_ENABLE1"/>
+	<reg32 offset="0x0003C" name="SYS_CLK_CTRL"/>
+	<reg32 offset="0x00040" name="SYSCLK_BUF_ENABLE"/>
+	<reg32 offset="0x00044" name="PLL_EN"/>
+	<reg32 offset="0x00048" name="PLL_IVCO"/>
+	<reg32 offset="0x0004C" name="LOCK_CMP1_MODE0"/>
+	<reg32 offset="0x00050" name="LOCK_CMP2_MODE0"/>
+	<reg32 offset="0x00054" name="LOCK_CMP3_MODE0"/>
+	<reg32 offset="0x00058" name="LOCK_CMP1_MODE1"/>
+	<reg32 offset="0x0005C" name="LOCK_CMP2_MODE1"/>
+	<reg32 offset="0x00060" name="LOCK_CMP3_MODE1"/>
+	<reg32 offset="0x00064" name="LOCK_CMP1_MODE2"/>
+	<reg32 offset="0x00064" name="CMN_RSVD0"/>
+	<reg32 offset="0x00068" name="LOCK_CMP2_MODE2"/>
+	<reg32 offset="0x00068" name="EP_CLOCK_DETECT_CTRL"/>
+	<reg32 offset="0x0006C" name="LOCK_CMP3_MODE2"/>
+	<reg32 offset="0x0006C" name="SYSCLK_DET_COMP_STATUS"/>
+	<reg32 offset="0x00070" name="BG_TRIM"/>
+	<reg32 offset="0x00074" name="CLK_EP_DIV"/>
+	<reg32 offset="0x00078" name="CP_CTRL_MODE0"/>
+	<reg32 offset="0x0007C" name="CP_CTRL_MODE1"/>
+	<reg32 offset="0x00080" name="CP_CTRL_MODE2"/>
+	<reg32 offset="0x00080" name="CMN_RSVD1"/>
+	<reg32 offset="0x00084" name="PLL_RCTRL_MODE0"/>
+	<reg32 offset="0x00088" name="PLL_RCTRL_MODE1"/>
+	<reg32 offset="0x0008C" name="PLL_RCTRL_MODE2"/>
+	<reg32 offset="0x0008C" name="CMN_RSVD2"/>
+	<reg32 offset="0x00090" name="PLL_CCTRL_MODE0"/>
+	<reg32 offset="0x00094" name="PLL_CCTRL_MODE1"/>
+	<reg32 offset="0x00098" name="PLL_CCTRL_MODE2"/>
+	<reg32 offset="0x00098" name="CMN_RSVD3"/>
+	<reg32 offset="0x0009C" name="PLL_CNTRL"/>
+	<reg32 offset="0x000A0" name="PHASE_SEL_CTRL"/>
+	<reg32 offset="0x000A4" name="PHASE_SEL_DC"/>
+	<reg32 offset="0x000A8" name="CORE_CLK_IN_SYNC_SEL"/>
+	<reg32 offset="0x000A8" name="BIAS_EN_CTRL_BY_PSM"/>
+	<reg32 offset="0x000AC" name="SYSCLK_EN_SEL"/>
+	<reg32 offset="0x000B0" name="CML_SYSCLK_SEL"/>
+	<reg32 offset="0x000B4" name="RESETSM_CNTRL"/>
+	<reg32 offset="0x000B8" name="RESETSM_CNTRL2"/>
+	<reg32 offset="0x000BC" name="RESTRIM_CTRL"/>
+	<reg32 offset="0x000C0" name="RESTRIM_CTRL2"/>
+	<reg32 offset="0x000C4" name="RESCODE_DIV_NUM"/>
+	<reg32 offset="0x000C8" name="LOCK_CMP_EN"/>
+	<reg32 offset="0x000CC" name="LOCK_CMP_CFG"/>
+	<reg32 offset="0x000D0" name="DEC_START_MODE0"/>
+	<reg32 offset="0x000D4" name="DEC_START_MODE1"/>
+	<reg32 offset="0x000D8" name="DEC_START_MODE2"/>
+	<reg32 offset="0x000D8" name="VCOCAL_DEADMAN_CTRL"/>
+	<reg32 offset="0x000DC" name="DIV_FRAC_START1_MODE0"/>
+	<reg32 offset="0x000E0" name="DIV_FRAC_START2_MODE0"/>
+	<reg32 offset="0x000E4" name="DIV_FRAC_START3_MODE0"/>
+	<reg32 offset="0x000E8" name="DIV_FRAC_START1_MODE1"/>
+	<reg32 offset="0x000EC" name="DIV_FRAC_START2_MODE1"/>
+	<reg32 offset="0x000F0" name="DIV_FRAC_START3_MODE1"/>
+	<reg32 offset="0x000F4" name="DIV_FRAC_START1_MODE2"/>
+	<reg32 offset="0x000F4" name="VCO_TUNE_MINVAL1"/>
+	<reg32 offset="0x000F8" name="DIV_FRAC_START2_MODE2"/>
+	<reg32 offset="0x000F8" name="VCO_TUNE_MINVAL2"/>
+	<reg32 offset="0x000FC" name="DIV_FRAC_START3_MODE2"/>
+	<reg32 offset="0x000FC" name="CMN_RSVD4"/>
+	<reg32 offset="0x00100" name="INTEGLOOP_INITVAL"/>
+	<reg32 offset="0x00104" name="INTEGLOOP_EN"/>
+	<reg32 offset="0x00108" name="INTEGLOOP_GAIN0_MODE0"/>
+	<reg32 offset="0x0010C" name="INTEGLOOP_GAIN1_MODE0"/>
+	<reg32 offset="0x00110" name="INTEGLOOP_GAIN0_MODE1"/>
+	<reg32 offset="0x00114" name="INTEGLOOP_GAIN1_MODE1"/>
+	<reg32 offset="0x00118" name="INTEGLOOP_GAIN0_MODE2"/>
+	<reg32 offset="0x00118" name="VCO_TUNE_MAXVAL1"/>
+	<reg32 offset="0x0011C" name="INTEGLOOP_GAIN1_MODE2"/>
+	<reg32 offset="0x0011C" name="VCO_TUNE_MAXVAL2"/>
+	<reg32 offset="0x00120" name="RES_TRIM_CONTROL2"/>
+	<reg32 offset="0x00124" name="VCO_TUNE_CTRL"/>
+	<reg32 offset="0x00128" name="VCO_TUNE_MAP"/>
+	<reg32 offset="0x0012C" name="VCO_TUNE1_MODE0"/>
+	<reg32 offset="0x00130" name="VCO_TUNE2_MODE0"/>
+	<reg32 offset="0x00134" name="VCO_TUNE1_MODE1"/>
+	<reg32 offset="0x00138" name="VCO_TUNE2_MODE1"/>
+	<reg32 offset="0x0013C" name="VCO_TUNE1_MODE2"/>
+	<reg32 offset="0x0013C" name="VCO_TUNE_INITVAL1"/>
+	<reg32 offset="0x00140" name="VCO_TUNE2_MODE2"/>
+	<reg32 offset="0x00140" name="VCO_TUNE_INITVAL2"/>
+	<reg32 offset="0x00144" name="VCO_TUNE_TIMER1"/>
+	<reg32 offset="0x00148" name="VCO_TUNE_TIMER2"/>
+	<reg32 offset="0x0014C" name="SAR"/>
+	<reg32 offset="0x00150" name="SAR_CLK"/>
+	<reg32 offset="0x00154" name="SAR_CODE_OUT_STATUS"/>
+	<reg32 offset="0x00158" name="SAR_CODE_READY_STATUS"/>
+	<reg32 offset="0x0015C" name="CMN_STATUS"/>
+	<reg32 offset="0x00160" name="RESET_SM_STATUS"/>
+	<reg32 offset="0x00164" name="RESTRIM_CODE_STATUS"/>
+	<reg32 offset="0x00168" name="PLLCAL_CODE1_STATUS"/>
+	<reg32 offset="0x0016C" name="PLLCAL_CODE2_STATUS"/>
+	<reg32 offset="0x00170" name="BG_CTRL"/>
+	<reg32 offset="0x00174" name="CLK_SELECT"/>
+	<reg32 offset="0x00178" name="HSCLK_SEL"/>
+	<reg32 offset="0x0017C" name="INTEGLOOP_BINCODE_STATUS"/>
+	<reg32 offset="0x00180" name="PLL_ANALOG"/>
+	<reg32 offset="0x00184" name="CORECLK_DIV"/>
+	<reg32 offset="0x00188" name="SW_RESET"/>
+	<reg32 offset="0x0018C" name="CORE_CLK_EN"/>
+	<reg32 offset="0x00190" name="C_READY_STATUS"/>
+	<reg32 offset="0x00194" name="CMN_CONFIG"/>
+	<reg32 offset="0x00198" name="CMN_RATE_OVERRIDE"/>
+	<reg32 offset="0x0019C" name="SVS_MODE_CLK_SEL"/>
+	<reg32 offset="0x001A0" name="DEBUG_BUS0"/>
+	<reg32 offset="0x001A4" name="DEBUG_BUS1"/>
+	<reg32 offset="0x001A8" name="DEBUG_BUS2"/>
+	<reg32 offset="0x001AC" name="DEBUG_BUS3"/>
+	<reg32 offset="0x001B0" name="DEBUG_BUS_SEL"/>
+	<reg32 offset="0x001B4" name="CMN_MISC1"/>
+	<reg32 offset="0x001B8" name="CMN_MISC2"/>
+	<reg32 offset="0x001BC" name="CORECLK_DIV_MODE1"/>
+	<reg32 offset="0x001C0" name="CORECLK_DIV_MODE2"/>
+	<reg32 offset="0x001C4" name="CMN_RSVD5"/>
+</domain>
+
+
+<domain name="HDMI_PHY_QSERDES_TX_LX" width="32">
+		<reg32 offset="0x00000" name="BIST_MODE_LANENO"/>
+		<reg32 offset="0x00004" name="BIST_INVERT"/>
+		<reg32 offset="0x00008" name="CLKBUF_ENABLE"/>
+		<reg32 offset="0x0000C" name="CMN_CONTROL_ONE"/>
+		<reg32 offset="0x00010" name="CMN_CONTROL_TWO"/>
+		<reg32 offset="0x00014" name="CMN_CONTROL_THREE"/>
+		<reg32 offset="0x00018" name="TX_EMP_POST1_LVL"/>
+		<reg32 offset="0x0001C" name="TX_POST2_EMPH"/>
+		<reg32 offset="0x00020" name="TX_BOOST_LVL_UP_DN"/>
+		<reg32 offset="0x00024" name="HP_PD_ENABLES"/>
+		<reg32 offset="0x00028" name="TX_IDLE_LVL_LARGE_AMP"/>
+		<reg32 offset="0x0002C" name="TX_DRV_LVL"/>
+		<reg32 offset="0x00030" name="TX_DRV_LVL_OFFSET"/>
+		<reg32 offset="0x00034" name="RESET_TSYNC_EN"/>
+		<reg32 offset="0x00038" name="PRE_STALL_LDO_BOOST_EN"/>
+		<reg32 offset="0x0003C" name="TX_BAND"/>
+		<reg32 offset="0x00040" name="SLEW_CNTL"/>
+		<reg32 offset="0x00044" name="INTERFACE_SELECT"/>
+		<reg32 offset="0x00048" name="LPB_EN"/>
+		<reg32 offset="0x0004C" name="RES_CODE_LANE_TX"/>
+		<reg32 offset="0x00050" name="RES_CODE_LANE_RX"/>
+		<reg32 offset="0x00054" name="RES_CODE_LANE_OFFSET"/>
+		<reg32 offset="0x00058" name="PERL_LENGTH1"/>
+		<reg32 offset="0x0005C" name="PERL_LENGTH2"/>
+		<reg32 offset="0x00060" name="SERDES_BYP_EN_OUT"/>
+		<reg32 offset="0x00064" name="DEBUG_BUS_SEL"/>
+		<reg32 offset="0x00068" name="HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN"/>
+		<reg32 offset="0x0006C" name="TX_POL_INV"/>
+		<reg32 offset="0x00070" name="PARRATE_REC_DETECT_IDLE_EN"/>
+		<reg32 offset="0x00074" name="BIST_PATTERN1"/>
+		<reg32 offset="0x00078" name="BIST_PATTERN2"/>
+		<reg32 offset="0x0007C" name="BIST_PATTERN3"/>
+		<reg32 offset="0x00080" name="BIST_PATTERN4"/>
+		<reg32 offset="0x00084" name="BIST_PATTERN5"/>
+		<reg32 offset="0x00088" name="BIST_PATTERN6"/>
+		<reg32 offset="0x0008C" name="BIST_PATTERN7"/>
+		<reg32 offset="0x00090" name="BIST_PATTERN8"/>
+		<reg32 offset="0x00094" name="LANE_MODE"/>
+		<reg32 offset="0x00098" name="IDAC_CAL_LANE_MODE"/>
+		<reg32 offset="0x0009C" name="IDAC_CAL_LANE_MODE_CONFIGURATION"/>
+		<reg32 offset="0x000A0" name="ATB_SEL1"/>
+		<reg32 offset="0x000A4" name="ATB_SEL2"/>
+		<reg32 offset="0x000A8" name="RCV_DETECT_LVL"/>
+		<reg32 offset="0x000AC" name="RCV_DETECT_LVL_2"/>
+		<reg32 offset="0x000B0" name="PRBS_SEED1"/>
+		<reg32 offset="0x000B4" name="PRBS_SEED2"/>
+		<reg32 offset="0x000B8" name="PRBS_SEED3"/>
+		<reg32 offset="0x000BC" name="PRBS_SEED4"/>
+		<reg32 offset="0x000C0" name="RESET_GEN"/>
+		<reg32 offset="0x000C4" name="RESET_GEN_MUXES"/>
+		<reg32 offset="0x000C8" name="TRAN_DRVR_EMP_EN"/>
+		<reg32 offset="0x000CC" name="TX_INTERFACE_MODE"/>
+		<reg32 offset="0x000D0" name="PWM_CTRL"/>
+		<reg32 offset="0x000D4" name="PWM_ENCODED_OR_DATA"/>
+		<reg32 offset="0x000D8" name="PWM_GEAR_1_DIVIDER_BAND2"/>
+		<reg32 offset="0x000DC" name="PWM_GEAR_2_DIVIDER_BAND2"/>
+		<reg32 offset="0x000E0" name="PWM_GEAR_3_DIVIDER_BAND2"/>
+		<reg32 offset="0x000E4" name="PWM_GEAR_4_DIVIDER_BAND2"/>
+		<reg32 offset="0x000E8" name="PWM_GEAR_1_DIVIDER_BAND0_1"/>
+		<reg32 offset="0x000EC" name="PWM_GEAR_2_DIVIDER_BAND0_1"/>
+		<reg32 offset="0x000F0" name="PWM_GEAR_3_DIVIDER_BAND0_1"/>
+		<reg32 offset="0x000F4" name="PWM_GEAR_4_DIVIDER_BAND0_1"/>
+		<reg32 offset="0x000F8" name="VMODE_CTRL1"/>
+		<reg32 offset="0x000FC" name="VMODE_CTRL2"/>
+		<reg32 offset="0x00100" name="TX_ALOG_INTF_OBSV_CNTL"/>
+		<reg32 offset="0x00104" name="BIST_STATUS"/>
+		<reg32 offset="0x00108" name="BIST_ERROR_COUNT1"/>
+		<reg32 offset="0x0010C" name="BIST_ERROR_COUNT2"/>
+		<reg32 offset="0x00110" name="TX_ALOG_INTF_OBSV"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/mdp4.xml b/drivers/gpu/drm/msm/registers/display/mdp4.xml
new file mode 100644
index 000000000000..6abb4a3c04da
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/mdp4.xml
@@ -0,0 +1,504 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="display/mdp_common.xml"/>
+
+<domain name="MDP4" width="32">
+	<enum name="mdp4_pipe">
+		<brief>pipe names, index into PIPE[]</brief>
+		<value name="VG1" value="0"/>
+		<value name="VG2" value="1"/>
+		<value name="RGB1" value="2"/>
+		<value name="RGB2" value="3"/>
+		<value name="RGB3" value="4"/>
+		<value name="VG3" value="5"/>
+		<value name="VG4" value="6"/>
+	</enum>
+
+	<enum name="mdp4_mixer">
+		<value name="MIXER0" value="0"/>
+		<value name="MIXER1" value="1"/>
+		<value name="MIXER2" value="2"/>
+	</enum>
+
+	<enum name="mdp4_intf">
+		<!--
+			A bit confusing the enums for interface selection:
+				enum {
+					LCDC_RGB_INTF,			/* 0 */
+					DTV_INTF = LCDC_RGB_INTF,	/* 0 */
+					MDDI_LCDC_INTF,			/* 1 */
+					MDDI_INTF,			/* 2 */
+					EBI2_INTF,			/* 3 */
+					TV_INTF = EBI2_INTF,		/* 3 */
+					DSI_VIDEO_INTF,
+					DSI_CMD_INTF
+				};
+			there is some overlap, and not all the values end up getting
+			written to hw (mdp4_display_intf_sel() remaps the last two
+			values to MDDI_LCDC_INTF/MDDI_INTF with extra bits set).. so
+			taking some liberties in guessing the actual meanings/names:
+		 -->
+		<value name="INTF_LCDC_DTV" value="0"/>  <!-- LCDC RGB or DTV (external) -->
+		<value name="INTF_DSI_VIDEO" value="1"/>
+		<value name="INTF_DSI_CMD" value="2"/>
+		<value name="INTF_EBI2_TV" value="3"/>   <!-- EBI2 or TV (external) -->
+	</enum>
+	<enum name="mdp4_cursor_format">
+		<value name="CURSOR_ARGB" value="1"/>
+		<value name="CURSOR_XRGB" value="2"/>
+	</enum>
+	<enum name="mdp4_frame_format">
+		<value name="FRAME_LINEAR" value="0"/>
+		<value name="FRAME_TILE_ARGB_4X4" value="1"/>
+		<value name="FRAME_TILE_YCBCR_420" value="2"/>
+	</enum>
+	<enum name="mdp4_scale_unit">
+		<value name="SCALE_FIR" value="0"/>
+		<value name="SCALE_MN_PHASE" value="1"/>
+		<value name="SCALE_PIXEL_RPT" value="2"/>
+	</enum>
+
+	<bitset name="mdp4_layermixer_in_cfg" inline="yes">
+		<brief>appears to map pipe to mixer stage</brief>
+		<bitfield name="PIPE0" low="0"  high="2"  type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE0_MIXER1" pos="3" type="boolean"/>
+		<bitfield name="PIPE1" low="4"  high="6"  type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE1_MIXER1" pos="7" type="boolean"/>
+		<bitfield name="PIPE2" low="8"  high="10" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE2_MIXER1" pos="11" type="boolean"/>
+		<bitfield name="PIPE3" low="12" high="14" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE3_MIXER1" pos="15" type="boolean"/>
+		<bitfield name="PIPE4" low="16" high="18" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE4_MIXER1" pos="19" type="boolean"/>
+		<bitfield name="PIPE5" low="20" high="22" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE5_MIXER1" pos="23" type="boolean"/>
+		<bitfield name="PIPE6" low="24" high="26" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE6_MIXER1" pos="27" type="boolean"/>
+		<bitfield name="PIPE7" low="28" high="30" type="mdp_mixer_stage_id"/>
+		<bitfield name="PIPE7_MIXER1" pos="31" type="boolean"/>
+	</bitset>
+
+	<bitset name="MDP4_IRQ">
+		<bitfield name="OVERLAY0_DONE" pos="0" type="boolean"/>
+		<bitfield name="OVERLAY1_DONE" pos="1" type="boolean"/>
+		<bitfield name="DMA_S_DONE" pos="2" type="boolean"/>
+		<bitfield name="DMA_E_DONE" pos="3" type="boolean"/>
+		<bitfield name="DMA_P_DONE" pos="4" type="boolean"/>
+		<bitfield name="VG1_HISTOGRAM" pos="5" type="boolean"/>
+		<bitfield name="VG2_HISTOGRAM" pos="6" type="boolean"/>
+		<bitfield name="PRIMARY_VSYNC" pos="7" type="boolean"/>
+		<bitfield name="PRIMARY_INTF_UDERRUN" pos="8" type="boolean"/>
+		<bitfield name="EXTERNAL_VSYNC" pos="9" type="boolean"/>
+		<bitfield name="EXTERNAL_INTF_UDERRUN" pos="10" type="boolean"/>
+		<bitfield name="PRIMARY_RDPTR" pos="11" type="boolean"/>  <!-- read pointer -->
+		<bitfield name="DMA_P_HISTOGRAM" pos="17" type="boolean"/>
+		<bitfield name="DMA_S_HISTOGRAM" pos="26" type="boolean"/>
+		<bitfield name="OVERLAY2_DONE" pos="30" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x00000" name="VERSION">
+		<!--
+			from mdp_probe() we can see minor rev starts at 16.. assume
+			major is above that.. not sure the rest of bits but doesn't
+			really seem to matter
+		 -->
+		<bitfield name="MINOR" low="16" high="23" type="uint"/>
+		<bitfield name="MAJOR" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00004" name="OVLP0_KICK"/>
+	<reg32 offset="0x00008" name="OVLP1_KICK"/>
+	<reg32 offset="0x000d0" name="OVLP2_KICK"/>
+	<reg32 offset="0x0000c" name="DMA_P_KICK"/>
+	<reg32 offset="0x00010" name="DMA_S_KICK"/>
+	<reg32 offset="0x00014" name="DMA_E_KICK"/>
+	<reg32 offset="0x00018" name="DISP_STATUS"/>
+
+	<reg32 offset="0x00038" name="DISP_INTF_SEL">
+		<bitfield name="PRIM" low="0" high="1" type="mdp4_intf"/>
+		<bitfield name="SEC" low="2" high="3" type="mdp4_intf"/>
+		<bitfield name="EXT" low="4" high="5" type="mdp4_intf"/>
+		<bitfield name="DSI_VIDEO" pos="6" type="boolean"/>
+		<bitfield name="DSI_CMD" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0003c" name="RESET_STATUS"/>  <!-- only mdp4 >v2.1 -->
+	<reg32 offset="0x0004c" name="READ_CNFG"/>  <!-- something about # of pending requests.. -->
+	<reg32 offset="0x00050" name="INTR_ENABLE" type="MDP4_IRQ"/>
+	<reg32 offset="0x00054" name="INTR_STATUS" type="MDP4_IRQ"/>
+	<reg32 offset="0x00058" name="INTR_CLEAR" type="MDP4_IRQ"/>
+	<reg32 offset="0x00060" name="EBI2_LCD0"/>
+	<reg32 offset="0x00064" name="EBI2_LCD1"/>
+	<reg32 offset="0x00070" name="PORTMAP_MODE"/>
+
+	<!-- mdp chip-select controller: -->
+	<reg32 offset="0x000c0" name="CS_CONTROLLER0"/>
+	<reg32 offset="0x000c4" name="CS_CONTROLLER1"/>
+
+	<reg32 offset="0x100f0" name="LAYERMIXER2_IN_CFG" type="mdp4_layermixer_in_cfg"/>
+	<reg32 offset="0x100fc" name="LAYERMIXER_IN_CFG_UPDATE_METHOD"/>
+	<reg32 offset="0x10100" name="LAYERMIXER_IN_CFG" type="mdp4_layermixer_in_cfg"/>
+
+	<reg32 offset="0x30050" name="VG2_SRC_FORMAT"/>
+	<reg32 offset="0x31008" name="VG2_CONST_COLOR"/>
+
+	<reg32 offset="0x18000" name="OVERLAY_FLUSH">
+		<bitfield name="OVLP0" pos="0" type="boolean"/>
+		<bitfield name="OVLP1" pos="1" type="boolean"/>
+		<bitfield name="VG1" pos="2" type="boolean"/>
+		<bitfield name="VG2" pos="3" type="boolean"/>
+		<bitfield name="RGB1" pos="4" type="boolean"/>
+		<bitfield name="RGB2" pos="5" type="boolean"/>
+	</reg32>
+
+	<array offsets="0x10000,0x18000,0x88000" name="OVLP" length="3" stride="0x8000">
+		<reg32 offset="0x0004" name="CFG"/>
+		<reg32 offset="0x0008" name="SIZE" type="reg_wh"/>
+		<reg32 offset="0x000c" name="BASE"/>
+		<reg32 offset="0x0010" name="STRIDE" type="uint"/>
+		<reg32 offset="0x0014" name="OPMODE"/>
+
+		<array offsets="0x0104,0x0124,0x0144,0x0160" name="STAGE" length="4" stride="0x1c">
+			<reg32 offset="0x00" name="OP">
+				<bitfield name="FG_ALPHA" low="0" high="1" type="mdp_alpha_type"/>
+				<bitfield name="FG_INV_ALPHA" pos="2" type="boolean"/>
+				<bitfield name="FG_MOD_ALPHA" pos="3" type="boolean"/>
+				<bitfield name="BG_ALPHA" low="4" high="5" type="mdp_alpha_type"/>
+				<bitfield name="BG_INV_ALPHA" pos="6" type="boolean"/>
+				<bitfield name="BG_MOD_ALPHA" pos="7" type="boolean"/>
+				<bitfield name="FG_TRANSP" pos="8" type="boolean"/>
+				<bitfield name="BG_TRANSP" pos="9" type="boolean"/>
+			</reg32>
+			<reg32 offset="0x04" name="FG_ALPHA"/>
+			<reg32 offset="0x08" name="BG_ALPHA"/>
+			<reg32 offset="0x0c" name="TRANSP_LOW0"/>
+			<reg32 offset="0x10" name="TRANSP_LOW1"/>
+			<reg32 offset="0x14" name="TRANSP_HIGH0"/>
+			<reg32 offset="0x18" name="TRANSP_HIGH1"/>
+		</array>
+
+		<array offsets="0x1004,0x1404,0x1804,0x1b84" name="STAGE_CO3" length="4" stride="4">
+			<reg32 offset="0" name="SEL">
+				<bitfield name="FG_ALPHA" pos="0" type="boolean"/> <!-- otherwise bg alpha -->
+			</reg32>
+		</array>
+
+		<reg32 offset="0x0180" name="TRANSP_LOW0"/>
+		<reg32 offset="0x0184" name="TRANSP_LOW1"/>
+		<reg32 offset="0x0188" name="TRANSP_HIGH0"/>
+		<reg32 offset="0x018c" name="TRANSP_HIGH1"/>
+
+		<reg32 offset="0x0200" name="CSC_CONFIG"/>
+
+		<array offset="0x2000" name="CSC" length="1" stride="0x700">
+			<array offset="0x400" name="MV" length="9" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x500" name="PRE_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x580" name="POST_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x600" name="PRE_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x680" name="POST_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+		</array>
+	</array>
+
+	<enum name="mdp4_dma">
+		<value name="DMA_P" value="0"/>
+		<value name="DMA_S" value="1"/>
+		<value name="DMA_E" value="2"/>
+	</enum>
+	<reg32 offset="0x90070" name="DMA_P_OP_MODE"/>
+	<array offset="0x94800" name="LUTN" length="2" stride="0x400">
+		<array offset="0" name="LUT" length="0x100" stride="4">
+			<reg32 offset="0" name="VAL"/>
+		</array>
+	</array>
+	<reg32 offset="0xa0028" name="DMA_S_OP_MODE"/>
+	<!-- I guess if DMA_S has an OP_MODE, it must have a LUT too.. -->
+	<reg32 offset="0xb0070" name="DMA_E_QUANT" length="3" stride="4"/>
+	<array offsets="0x90000,0xa0000,0xb0000" name="DMA" length="3" stride="0x10000" index="mdp4_dma">
+		<reg32 offset="0x0000" name="CONFIG">
+			<bitfield name="G_BPC" low="0" high="1" type="mdp_bpc"/>
+			<bitfield name="B_BPC" low="2" high="3" type="mdp_bpc"/>
+			<bitfield name="R_BPC" low="4" high="5" type="mdp_bpc"/>
+			<bitfield name="PACK_ALIGN_MSB" pos="7" type="boolean"/>
+			<bitfield name="PACK" low="8" high="15"/>
+			<!-- bit 24 is DITHER_EN on DMA_P, DEFLKR_EN on DMA_E -->
+			<bitfield name="DEFLKR_EN" pos="24" type="boolean"/>
+			<bitfield name="DITHER_EN" pos="24" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x0004" name="SRC_SIZE" type="reg_wh"/>
+		<reg32 offset="0x0008" name="SRC_BASE"/>
+		<reg32 offset="0x000c" name="SRC_STRIDE" type="uint"/>
+		<reg32 offset="0x0010" name="DST_SIZE" type="reg_wh"/>
+
+		<reg32 offset="0x0044" name="CURSOR_SIZE">
+			<!-- seems the limit is 64x64: -->
+			<bitfield name="WIDTH" low="0" high="6" type="uint"/>
+			<bitfield name="HEIGHT" low="16" high="22" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0048" name="CURSOR_BASE"/>
+		<reg32 offset="0x004c" name="CURSOR_POS">
+			<bitfield name="X" low="0" high="15" type="uint"/>
+			<bitfield name="Y" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0060" name="CURSOR_BLEND_CONFIG">
+			<bitfield name="CURSOR_EN" pos="0" type="boolean"/>
+			<bitfield name="FORMAT" low="1" high="2" type="mdp4_cursor_format"/>
+			<bitfield name="TRANSP_EN" pos="3" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x0064" name="CURSOR_BLEND_PARAM"/>
+		<reg32 offset="0x0068" name="BLEND_TRANS_LOW"/>
+		<reg32 offset="0x006c" name="BLEND_TRANS_HIGH"/>
+
+		<reg32 offset="0x1004" name="FETCH_CONFIG"/>
+		<array offset="0x3000" name="CSC" length="1" stride="0x700">
+			<array offset="0x400" name="MV" length="9" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x500" name="PRE_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x580" name="POST_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x600" name="PRE_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x680" name="POST_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+		</array>
+	</array>
+
+	<!--
+		TODO length should be 7, but that would collide w/ OVLP2..!?!
+		this register map is a bit strange..
+	 -->
+	<array offset="0x20000" name="PIPE" length="6" stride="0x10000" index="mdp4_pipe">
+		<reg32 offset="0x0000" name="SRC_SIZE" type="reg_wh"/>
+		<reg32 offset="0x0004" name="SRC_XY" type="reg_xy"/>
+		<reg32 offset="0x0008" name="DST_SIZE" type="reg_wh"/>
+		<reg32 offset="0x000c" name="DST_XY" type="reg_xy"/>
+		<reg32 offset="0x0010" name="SRCP0_BASE"/>
+		<reg32 offset="0x0014" name="SRCP1_BASE"/>
+		<reg32 offset="0x0018" name="SRCP2_BASE"/>
+		<reg32 offset="0x001c" name="SRCP3_BASE"/>
+		<reg32 offset="0x0040" name="SRC_STRIDE_A">
+			<bitfield name="P0" low="0" high="15" type="uint"/>
+			<bitfield name="P1" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0044" name="SRC_STRIDE_B">
+			<bitfield name="P2" low="0" high="15" type="uint"/>
+			<bitfield name="P3" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0048" name="SSTILE_FRAME_SIZE" type="reg_wh"/>
+		<reg32 offset="0x0050" name="SRC_FORMAT">
+			<bitfield name="G_BPC" low="0" high="1" type="mdp_bpc"/>
+			<bitfield name="B_BPC" low="2" high="3" type="mdp_bpc"/>
+			<bitfield name="R_BPC" low="4" high="5" type="mdp_bpc"/>
+			<bitfield name="A_BPC" low="6" high="7" type="mdp_bpc_alpha"/>
+			<bitfield name="ALPHA_ENABLE" pos="8" type="boolean"/>
+			<bitfield name="CPP" low="9" high="10" type="uint">
+				<brief>8bit characters per pixel minus 1</brief>
+			</bitfield>
+			<bitfield name="ROTATED_90" pos="12" type="boolean"/>
+			<bitfield name="UNPACK_COUNT" low="13" high="14" type="uint"/>
+			<bitfield name="UNPACK_TIGHT" pos="17" type="boolean"/>
+			<bitfield name="UNPACK_ALIGN_MSB" pos="18" type="boolean"/>
+			<bitfield name="FETCH_PLANES" low="19" high="20" type="uint"/>
+			<bitfield name="SOLID_FILL" pos="22" type="boolean"/>
+			<bitfield name="CHROMA_SAMP" low="26" high="27" type="mdp_chroma_samp_type"/>
+			<bitfield name="FRAME_FORMAT" low="29" high="30" type="mdp4_frame_format"/>
+		</reg32>
+		<reg32 offset="0x0054" name="SRC_UNPACK" type="mdp_unpack_pattern"/>
+		<reg32 offset="0x0058" name="OP_MODE">
+			<bitfield name="SCALEX_EN" pos="0" type="boolean"/>
+			<bitfield name="SCALEY_EN" pos="1" type="boolean"/>
+			<bitfield name="SCALEX_UNIT_SEL" low="2" high="3" type="mdp4_scale_unit"/>
+			<bitfield name="SCALEY_UNIT_SEL" low="4" high="5" type="mdp4_scale_unit"/>
+			<bitfield name="SRC_YCBCR" pos="9" type="boolean"/>
+			<bitfield name="DST_YCBCR" pos="10" type="boolean"/>
+			<bitfield name="CSC_EN" pos="11" type="boolean"/>
+			<bitfield name="FLIP_LR" pos="13" type="boolean"/>
+			<bitfield name="FLIP_UD" pos="14" type="boolean"/>
+			<bitfield name="DITHER_EN" pos="15" type="boolean"/>
+			<bitfield name="IGC_LUT_EN" pos="16" type="boolean"/>
+			<bitfield name="DEINT_EN" pos="18" type="boolean"/>
+			<bitfield name="DEINT_ODD_REF" pos="19" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x005c" name="PHASEX_STEP"/>
+		<reg32 offset="0x0060" name="PHASEY_STEP"/>
+		<reg32 offset="0x1004" name="FETCH_CONFIG"/>
+		<reg32 offset="0x1008" name="SOLID_COLOR"/>
+
+		<array offset="0x4000" name="CSC" length="1" stride="0x700">
+			<array offset="0x400" name="MV" length="9" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x500" name="PRE_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x580" name="POST_BV" length="3" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x600" name="PRE_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+			<array offset="0x680" name="POST_LV" length="6" stride="4">
+				<reg32 offset="0" name="VAL"/>
+			</array>
+		</array>
+	</array>
+
+	<!--
+		ENCODERS
+			LCDC and DSI seem the same, DTV is just slightly different..
+	 -->
+
+	<bitset name="mdp4_ctrl_polarity" inline="yes">
+		<!-- not entirely sure if these bits mean hi or low.. -->
+		<bitfield name="HSYNC_LOW" pos="0" type="boolean"/>
+		<bitfield name="VSYNC_LOW" pos="1" type="boolean"/>
+		<bitfield name="DATA_EN_LOW" pos="2" type="boolean"/>
+	</bitset>
+
+	<bitset name="mdp4_active_hctl" inline="yes">
+		<bitfield name="START" low="0" high="14" type="uint"/>
+		<bitfield name="END" low="16" high="30" type="uint"/>
+		<bitfield name="ACTIVE_START_X" pos="31" type="boolean"/>
+	</bitset>
+
+	<bitset name="mdp4_display_hctl" inline="yes">
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
+	</bitset>
+
+	<bitset name="mdp4_hsync_ctrl" inline="yes">
+		<bitfield name="PULSEW" low="0" high="15" type="uint"/>
+		<bitfield name="PERIOD" low="16" high="31" type="uint"/>
+	</bitset>
+
+	<bitset name="mdp4_underflow_clr" inline="yes">
+		<bitfield name="COLOR" low="0" high="23"/>
+		<bitfield name="ENABLE_RECOVERY" pos="31" type="boolean"/>
+	</bitset>
+
+	<!-- offset is 0xe0000 on !mdp4.. -->
+	<array offset="0xc0000" name="LCDC" length="1" stride="0x1000">
+		<reg32 offset="0x0000" name="ENABLE"/>
+		<reg32 offset="0x0004" name="HSYNC_CTRL" type="mdp4_hsync_ctrl"/>
+		<reg32 offset="0x0008" name="VSYNC_PERIOD" type="uint"/>
+		<reg32 offset="0x000c" name="VSYNC_LEN" type="uint"/>
+		<reg32 offset="0x0010" name="DISPLAY_HCTRL" type="mdp4_display_hctl"/>
+		<reg32 offset="0x0014" name="DISPLAY_VSTART" type="uint"/>
+		<reg32 offset="0x0018" name="DISPLAY_VEND" type="uint"/>
+		<reg32 offset="0x001c" name="ACTIVE_HCTL" type="mdp4_active_hctl"/>
+		<reg32 offset="0x0020" name="ACTIVE_VSTART" type="uint"/>
+		<reg32 offset="0x0024" name="ACTIVE_VEND" type="uint"/>
+		<reg32 offset="0x0028" name="BORDER_CLR"/>
+		<reg32 offset="0x002c" name="UNDERFLOW_CLR" type="mdp4_underflow_clr"/>
+		<reg32 offset="0x0030" name="HSYNC_SKEW"/>
+		<reg32 offset="0x0034" name="TEST_CNTL"/>
+		<reg32 offset="0x0038" name="CTRL_POLARITY" type="mdp4_ctrl_polarity"/>
+	</array>
+
+	<reg32 offset="0xc2000" name="LCDC_LVDS_INTF_CTL">
+		<bitfield name="MODE_SEL"           pos="2"  type="boolean"/>
+		<bitfield name="RGB_OUT"            pos="3"  type="boolean"/>
+		<bitfield name="CH_SWAP"            pos="4"  type="boolean"/>
+		<bitfield name="CH1_RES_BIT"        pos="5"  type="boolean"/>
+		<bitfield name="CH2_RES_BIT"        pos="6"  type="boolean"/>
+		<bitfield name="ENABLE"             pos="7"  type="boolean"/>
+		<bitfield name="CH1_DATA_LANE0_EN"  pos="8"  type="boolean"/>
+		<bitfield name="CH1_DATA_LANE1_EN"  pos="9"  type="boolean"/>
+		<bitfield name="CH1_DATA_LANE2_EN"  pos="10" type="boolean"/>
+		<bitfield name="CH1_DATA_LANE3_EN"  pos="11" type="boolean"/>
+		<bitfield name="CH2_DATA_LANE0_EN"  pos="12" type="boolean"/>
+		<bitfield name="CH2_DATA_LANE1_EN"  pos="13" type="boolean"/>
+		<bitfield name="CH2_DATA_LANE2_EN"  pos="14" type="boolean"/>
+		<bitfield name="CH2_DATA_LANE3_EN"  pos="15" type="boolean"/>
+		<bitfield name="CH1_CLK_LANE_EN"    pos="16" type="boolean"/>
+		<bitfield name="CH2_CLK_LANE_EN"    pos="17" type="boolean"/>
+	</reg32>
+
+	<array offset="0xc2014" name="LCDC_LVDS_MUX_CTL" length="4" stride="0x8">
+		<reg32 offset="0x0" name="3_TO_0">
+			<bitfield name="BIT0" low="0"  high="7"/>
+			<bitfield name="BIT1" low="8"  high="15"/>
+			<bitfield name="BIT2" low="16" high="23"/>
+			<bitfield name="BIT3" low="24" high="31"/>
+		</reg32>
+		<reg32 offset="0x4" name="6_TO_4">
+			<bitfield name="BIT4" low="0"  high="7"/>
+			<bitfield name="BIT5" low="8"  high="15"/>
+			<bitfield name="BIT6" low="16" high="23"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0xc2034" name="LCDC_LVDS_PHY_RESET"/>
+
+	<reg32 offset="0xc3000" name="LVDS_PHY_PLL_CTRL_0"/>
+	<reg32 offset="0xc3004" name="LVDS_PHY_PLL_CTRL_1"/>
+	<reg32 offset="0xc3008" name="LVDS_PHY_PLL_CTRL_2"/>
+	<reg32 offset="0xc300c" name="LVDS_PHY_PLL_CTRL_3"/>
+	<reg32 offset="0xc3014" name="LVDS_PHY_PLL_CTRL_5"/>
+	<reg32 offset="0xc3018" name="LVDS_PHY_PLL_CTRL_6"/>
+	<reg32 offset="0xc301c" name="LVDS_PHY_PLL_CTRL_7"/>
+	<reg32 offset="0xc3020" name="LVDS_PHY_PLL_CTRL_8"/>
+	<reg32 offset="0xc3024" name="LVDS_PHY_PLL_CTRL_9"/>
+	<reg32 offset="0xc3080" name="LVDS_PHY_PLL_LOCKED"/>
+	<reg32 offset="0xc3108" name="LVDS_PHY_CFG2"/>
+
+	<reg32 offset="0xc3100" name="LVDS_PHY_CFG0">
+		<bitfield name="SERIALIZATION_ENBLE" pos="4" type="boolean"/>
+		<bitfield name="CHANNEL0" pos="6" type="boolean"/>
+		<bitfield name="CHANNEL1" pos="7" type="boolean"/>
+	</reg32>
+
+	<array offset="0xd0000" name="DTV" length="1" stride="0x1000">
+		<reg32 offset="0x0000" name="ENABLE"/>
+		<reg32 offset="0x0004" name="HSYNC_CTRL" type="mdp4_hsync_ctrl"/>
+		<reg32 offset="0x0008" name="VSYNC_PERIOD" type="uint"/>
+		<reg32 offset="0x000c" name="VSYNC_LEN" type="uint"/>
+		<reg32 offset="0x0018" name="DISPLAY_HCTRL" type="mdp4_display_hctl"/>
+		<reg32 offset="0x001c" name="DISPLAY_VSTART" type="uint"/>
+		<reg32 offset="0x0020" name="DISPLAY_VEND" type="uint"/>
+		<reg32 offset="0x002c" name="ACTIVE_HCTL" type="mdp4_active_hctl"/>
+		<reg32 offset="0x0030" name="ACTIVE_VSTART" type="uint"/>
+		<reg32 offset="0x0038" name="ACTIVE_VEND" type="uint"/>
+		<reg32 offset="0x0040" name="BORDER_CLR"/>
+		<reg32 offset="0x0044" name="UNDERFLOW_CLR" type="mdp4_underflow_clr"/>
+		<reg32 offset="0x0048" name="HSYNC_SKEW"/>
+		<reg32 offset="0x004c" name="TEST_CNTL"/>
+		<reg32 offset="0x0050" name="CTRL_POLARITY" type="mdp4_ctrl_polarity"/>
+	</array>
+
+	<array offset="0xe0000" name="DSI" length="1" stride="0x1000">
+		<reg32 offset="0x0000" name="ENABLE"/>
+		<reg32 offset="0x0004" name="HSYNC_CTRL" type="mdp4_hsync_ctrl"/>
+		<reg32 offset="0x0008" name="VSYNC_PERIOD" type="uint"/>
+		<reg32 offset="0x000c" name="VSYNC_LEN" type="uint"/>
+		<reg32 offset="0x0010" name="DISPLAY_HCTRL" type="mdp4_display_hctl"/>
+		<reg32 offset="0x0014" name="DISPLAY_VSTART" type="uint"/>
+		<reg32 offset="0x0018" name="DISPLAY_VEND" type="uint"/>
+		<reg32 offset="0x001c" name="ACTIVE_HCTL" type="mdp4_active_hctl"/>
+		<reg32 offset="0x0020" name="ACTIVE_VSTART" type="uint"/>
+		<reg32 offset="0x0024" name="ACTIVE_VEND" type="uint"/>
+		<reg32 offset="0x0028" name="BORDER_CLR"/>
+		<reg32 offset="0x002c" name="UNDERFLOW_CLR" type="mdp4_underflow_clr"/>
+		<reg32 offset="0x0030" name="HSYNC_SKEW"/>
+		<reg32 offset="0x0034" name="TEST_CNTL"/>
+		<reg32 offset="0x0038" name="CTRL_POLARITY" type="mdp4_ctrl_polarity"/>
+	</array>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/mdp5.xml b/drivers/gpu/drm/msm/registers/display/mdp5.xml
new file mode 100644
index 000000000000..92f3263af170
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/mdp5.xml
@@ -0,0 +1,806 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="display/mdp_common.xml"/>
+
+<!-- where does this belong? -->
+<domain name="VBIF" width="32">
+</domain>
+
+<domain name="MDSS" width="32">
+	<reg32 offset="0x00000" name="HW_VERSION">
+		<bitfield name="STEP" low="0" high="15" type="uint"/>
+		<bitfield name="MINOR" low="16" high="27" type="uint"/>
+		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00010" name="HW_INTR_STATUS">
+		<bitfield name="INTR_MDP"  pos="0"  type="boolean"/>
+		<bitfield name="INTR_DSI0" pos="4"  type="boolean"/>
+		<bitfield name="INTR_DSI1" pos="5"  type="boolean"/>
+		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
+		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="MDP5" width="32">
+
+	<enum name="mdp5_intf_type">
+		<value name="INTF_DISABLED" value="0x0"/>
+		<value name="INTF_DSI"  value="0x1"/>
+		<value name="INTF_HDMI" value="0x3"/>
+		<value name="INTF_LCDC" value="0x5"/>
+		<value name="INTF_eDP"  value="0x9"/>
+		<value name="INTF_VIRTUAL"  value="0x64"/>
+		<!-- non-display interfaces are listed below: -->
+		<value name="INTF_WB"  value="0x65"/>
+	</enum>
+
+	<enum name="mdp5_intfnum">
+		<value name="NO_INTF" value="0"/>
+		<value name="INTF0"   value="1"/>
+		<value name="INTF1"   value="2"/>
+		<value name="INTF2"   value="3"/>
+		<value name="INTF3"   value="4"/>
+	</enum>
+
+	<enum name="mdp5_pipe">
+		<value name="SSPP_NONE" value="0"/>
+		<value name="SSPP_VIG0" value="1"/>
+		<value name="SSPP_VIG1" value="2"/>
+		<value name="SSPP_VIG2" value="3"/>
+		<value name="SSPP_RGB0" value="4"/>
+		<value name="SSPP_RGB1" value="5"/>
+		<value name="SSPP_RGB2" value="6"/>
+		<value name="SSPP_DMA0" value="7"/>
+		<value name="SSPP_DMA1" value="8"/>
+		<value name="SSPP_VIG3" value="9"/>
+		<value name="SSPP_RGB3" value="10"/>
+		<value name="SSPP_CURSOR0" value="11"/>
+		<value name="SSPP_CURSOR1" value="12"/>
+	</enum>
+
+	<enum name="mdp5_format">
+		<!-- TODO -->
+		<value name="DUMMY" value="0"/>
+	</enum>
+
+	<enum name="mdp5_ctl_mode">
+		<value name="MODE_NONE" value="0"/>
+		<value name="MODE_WB_0_BLOCK" value="1"/>
+		<value name="MODE_WB_1_BLOCK" value="2"/>
+		<value name="MODE_WB_0_LINE" value="3"/>
+		<value name="MODE_WB_1_LINE" value="4"/>
+		<value name="MODE_WB_2_LINE" value="5"/>
+	</enum>
+
+	<enum name="mdp5_pack_3d">
+		<value name="PACK_3D_FRAME_INT" value="0"/>
+		<value name="PACK_3D_H_ROW_INT" value="1"/>
+		<value name="PACK_3D_V_ROW_INT" value="2"/>
+		<value name="PACK_3D_COL_INT"   value="3"/>
+	</enum>
+
+	<enum name="mdp5_scale_filter">
+		<value name="SCALE_FILTER_NEAREST" value="0"/>
+		<value name="SCALE_FILTER_BIL" value="1"/>
+		<value name="SCALE_FILTER_PCMN" value="2"/>
+		<value name="SCALE_FILTER_CA" value="3"/>
+	</enum>
+
+	<enum name="mdp5_pipe_bwc">
+		<value name="BWC_LOSSLESS" value="0"/>
+		<value name="BWC_Q_HIGH"   value="1"/>
+		<value name="BWC_Q_MED"    value="2"/>
+	</enum>
+
+	<enum name="mdp5_cursor_format">
+		<value name="CURSOR_FMT_ARGB8888" value="0"/>
+		<value name="CURSOR_FMT_ARGB1555" value="2"/>
+		<value name="CURSOR_FMT_ARGB4444" value="4"/>
+	</enum>
+
+	<enum name="mdp5_cursor_alpha">
+		<value name="CURSOR_ALPHA_CONST" value="0"/>
+		<value name="CURSOR_ALPHA_PER_PIXEL" value="2"/>
+	</enum>
+
+	<bitset name="MDP5_IRQ">
+		<bitfield name="WB_0_DONE"                pos="0"  type="boolean"/>
+		<bitfield name="WB_1_DONE"                pos="1"  type="boolean"/>
+		<bitfield name="WB_2_DONE"                pos="4"  type="boolean"/>
+		<bitfield name="PING_PONG_0_DONE"         pos="8"  type="boolean"/>
+		<bitfield name="PING_PONG_1_DONE"         pos="9"  type="boolean"/>
+		<bitfield name="PING_PONG_2_DONE"         pos="10" type="boolean"/>
+		<bitfield name="PING_PONG_3_DONE"         pos="11" type="boolean"/>
+		<bitfield name="PING_PONG_0_RD_PTR"       pos="12" type="boolean"/>
+		<bitfield name="PING_PONG_1_RD_PTR"       pos="13" type="boolean"/>
+		<bitfield name="PING_PONG_2_RD_PTR"       pos="14" type="boolean"/>
+		<bitfield name="PING_PONG_3_RD_PTR"       pos="15" type="boolean"/>
+		<bitfield name="PING_PONG_0_WR_PTR"       pos="16" type="boolean"/>
+		<bitfield name="PING_PONG_1_WR_PTR"       pos="17" type="boolean"/>
+		<bitfield name="PING_PONG_2_WR_PTR"       pos="18" type="boolean"/>
+		<bitfield name="PING_PONG_3_WR_PTR"       pos="19" type="boolean"/>
+		<bitfield name="PING_PONG_0_AUTO_REF"     pos="20" type="boolean"/>
+		<bitfield name="PING_PONG_1_AUTO_REF"     pos="21" type="boolean"/>
+		<bitfield name="PING_PONG_2_AUTO_REF"     pos="22" type="boolean"/>
+		<bitfield name="PING_PONG_3_AUTO_REF"     pos="23" type="boolean"/>
+		<bitfield name="INTF0_UNDER_RUN"          pos="24" type="boolean"/>
+		<bitfield name="INTF0_VSYNC"              pos="25" type="boolean"/>
+		<bitfield name="INTF1_UNDER_RUN"          pos="26" type="boolean"/>
+		<bitfield name="INTF1_VSYNC"              pos="27" type="boolean"/>
+		<bitfield name="INTF2_UNDER_RUN"          pos="28" type="boolean"/>
+		<bitfield name="INTF2_VSYNC"              pos="29" type="boolean"/>
+		<bitfield name="INTF3_UNDER_RUN"          pos="30" type="boolean"/>
+		<bitfield name="INTF3_VSYNC"              pos="31" type="boolean"/>
+	</bitset>
+
+	<bitset name="mdp5_smp_alloc" inline="yes">
+        <!-- Use "mdp5_cfg->mdp.smp.clients[enum mdp5_pipe]" instead -->
+		<bitfield name="CLIENT0" low="0"  high="7"  type="uint"/>
+		<bitfield name="CLIENT1" low="8"  high="15" type="uint"/>
+		<bitfield name="CLIENT2" low="16" high="23" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x00000" name="HW_VERSION">
+		<bitfield name="STEP" low="0" high="15" type="uint"/>
+		<bitfield name="MINOR" low="16" high="27" type="uint"/>
+		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00004" name="DISP_INTF_SEL">
+		<bitfield name="INTF0" low="0"  high="7"  type="mdp5_intf_type"/>
+		<bitfield name="INTF1" low="8"  high="15" type="mdp5_intf_type"/>
+		<bitfield name="INTF2" low="16" high="23" type="mdp5_intf_type"/>
+		<bitfield name="INTF3" low="24" high="31" type="mdp5_intf_type"/>
+	</reg32>
+	<reg32 offset="0x00010" name="INTR_EN" type="MDP5_IRQ"/>
+	<reg32 offset="0x00014" name="INTR_STATUS" type="MDP5_IRQ"/>
+	<reg32 offset="0x00018" name="INTR_CLEAR" type="MDP5_IRQ"/>
+	<reg32 offset="0x0001C" name="HIST_INTR_EN"/>
+	<reg32 offset="0x00020" name="HIST_INTR_STATUS"/>
+	<reg32 offset="0x00024" name="HIST_INTR_CLEAR"/>
+	<reg32 offset="0x00028" name="SPARE_0">
+		<bitfield name="SPLIT_DPL_SINGLE_FLUSH_EN" pos="0"/>
+	</reg32>
+
+	<array offset="0x00080" name="SMP_ALLOC_W" length="8" stride="4">
+		<reg32 offset="0" name="REG" type="mdp5_smp_alloc"/>
+	</array>
+	<array offset="0x00130" name="SMP_ALLOC_R" length="8" stride="4">
+		<reg32 offset="0" name="REG" type="mdp5_smp_alloc"/>
+	</array>
+
+	<enum name="mdp5_igc_type">
+		<value name="IGC_VIG" value="0"/>		<!-- 0x200 -->
+		<value name="IGC_RGB" value="1"/>		<!-- 0x210 -->
+		<value name="IGC_DMA" value="2"/>		<!-- 0x220 -->
+		<value name="IGC_DSPP" value="3"/>		<!-- 0x300 -->
+	</enum>
+	<array offsets="0x00200,0x00210,0x00220,0x00300" name="IGC" length="3" stride="0x10" index="mdp5_igc_type">
+		<array offset="0x00" name="LUT" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VAL" low="0" high="11"/>
+				<bitfield name="INDEX_UPDATE" pos="25" type="boolean"/>
+				<!--
+					not sure about these:
+						/* INDEX_UPDATE */
+						data = (1 << 25) | (((~(1 << blk_idx)) & 0x7) << 28);
+						MDSS_MDP_REG_WRITE(offset, (cfg->c0_c1_data[0] & 0xFFF) | data);
+				-->
+				<bitfield name="DISABLE_PIPE_0" pos="28" type="boolean"/>
+				<bitfield name="DISABLE_PIPE_1" pos="29" type="boolean"/>
+				<bitfield name="DISABLE_PIPE_2" pos="30" type="boolean"/>
+			</reg32>
+		</array>
+	</array>
+	<reg32 offset="0x002f4" name="SPLIT_DPL_EN"/>
+	<reg32 offset="0x002f8" name="SPLIT_DPL_UPPER">
+		<bitfield name="SMART_PANEL" pos="1" type="boolean"/>
+		<bitfield name="SMART_PANEL_FREE_RUN" pos="2" type="boolean"/>
+		<bitfield name="INTF1_SW_TRG_MUX" pos="4" type="boolean"/>
+		<bitfield name="INTF2_SW_TRG_MUX" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x003f0" name="SPLIT_DPL_LOWER">
+		<bitfield name="SMART_PANEL" pos="1" type="boolean"/>
+		<bitfield name="SMART_PANEL_FREE_RUN" pos="2" type="boolean"/>
+		<bitfield name="INTF1_TG_SYNC" pos="4" type="boolean"/>
+		<bitfield name="INTF2_TG_SYNC" pos="8" type="boolean"/>
+	</reg32>
+
+<!-- check length/index.. -->
+	<array doffsets="mdp5_cfg->ctl.base[0],mdp5_cfg->ctl.base[1],mdp5_cfg->ctl.base[2],mdp5_cfg->ctl.base[3],mdp5_cfg->ctl.base[4]" name="CTL" length="5" stride="0x400">
+		<array offsets="0x000,0x004,0x008,0x00C,0x010,0x024" name="LAYER" length="6" stride="4">
+			<!--
+			NOTE: for backwards compat (from when there were fewer stages),
+			this register has the low three bits of mdp_mixer_stage_id, with
+			the high bit coming from LAYER_EXT
+			 -->
+			<reg32 offset="0" name="REG">
+				<bitfield name="VIG0"  low="0"  high="2"  type="uint"/>
+				<bitfield name="VIG1"  low="3"  high="5"  type="uint"/>
+				<bitfield name="VIG2"  low="6"  high="8"  type="uint"/>
+				<bitfield name="RGB0"  low="9"  high="11" type="uint"/>
+				<bitfield name="RGB1"  low="12" high="14" type="uint"/>
+				<bitfield name="RGB2"  low="15" high="17" type="uint"/>
+				<bitfield name="DMA0"  low="18" high="20" type="uint"/>
+				<bitfield name="DMA1"  low="21" high="23" type="uint"/>
+				<bitfield name="BORDER_COLOR" pos="24" type="boolean"/>
+				<bitfield name="CURSOR_OUT"   pos="25" type="boolean"/>
+				<bitfield name="VIG3"  low="26"  high="28"  type="uint"/>
+				<bitfield name="RGB3"  low="29" high="31" type="uint"/>
+			</reg32>
+		</array>
+		<reg32 offset="0x014" name="OP">
+			<bitfield name="MODE" low="0" high="3" type="mdp5_ctl_mode"/>
+			<bitfield name="INTF_NUM" low="4" high="6" type="mdp5_intfnum"/>
+			<bitfield name="CMD_MODE" pos="17" type="boolean"/>
+			<bitfield name="PACK_3D_ENABLE" pos="19" type="boolean"/>
+			<bitfield name="PACK_3D" low="20" high="21" type="mdp5_pack_3d"/>
+		</reg32>
+		<reg32 offset="0x018" name="FLUSH">
+			<bitfield name="VIG0" pos="0"  type="boolean"/>
+			<bitfield name="VIG1" pos="1"  type="boolean"/>
+			<bitfield name="VIG2" pos="2"  type="boolean"/>
+			<bitfield name="RGB0" pos="3"  type="boolean"/>
+			<bitfield name="RGB1" pos="4"  type="boolean"/>
+			<bitfield name="RGB2" pos="5"  type="boolean"/>
+			<bitfield name="LM0"  pos="6"  type="boolean"/>
+			<bitfield name="LM1"  pos="7"  type="boolean"/>
+			<bitfield name="LM2"  pos="8"  type="boolean"/>
+			<bitfield name="LM3"  pos="9"  type="boolean"/>
+			<bitfield name="LM4"  pos="10"  type="boolean"/>
+			<bitfield name="DMA0" pos="11" type="boolean"/>
+			<bitfield name="DMA1" pos="12" type="boolean"/>
+			<bitfield name="DSPP0" pos="13" type="boolean"/>
+			<bitfield name="DSPP1" pos="14" type="boolean"/>
+			<bitfield name="DSPP2" pos="15" type="boolean"/>
+			<bitfield name="WB"   pos="16" type="boolean"/>
+			<bitfield name="CTL"   pos="17" type="boolean"/>
+			<bitfield name="VIG3" pos="18"  type="boolean"/>
+			<bitfield name="RGB3" pos="19"  type="boolean"/>
+			<bitfield name="LM5"  pos="20"  type="boolean"/>
+			<bitfield name="DSPP3" pos="21" type="boolean"/>
+			<bitfield name="CURSOR_0" pos="22" type="boolean"/>
+			<bitfield name="CURSOR_1" pos="23" type="boolean"/>
+			<bitfield name="CHROMADOWN_0" pos="26" type="boolean"/>
+			<bitfield name="TIMING_3" pos="28" type="boolean"/>
+			<bitfield name="TIMING_2" pos="29" type="boolean"/>
+			<bitfield name="TIMING_1" pos="30" type="boolean"/>
+			<bitfield name="TIMING_0" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x01C" name="START"/>
+		<reg32 offset="0x020" name="PACK_3D"/>
+		<array offsets="0x040,0x044,0x048,0x04C,0x050,0x054" name="LAYER_EXT" length="6" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VIG0_BIT3"  pos="0"  type="boolean"/>
+				<bitfield name="VIG1_BIT3"  pos="2"  type="boolean"/>
+				<bitfield name="VIG2_BIT3"  pos="4"  type="boolean"/>
+				<bitfield name="VIG3_BIT3"  pos="6"  type="boolean"/>
+				<bitfield name="RGB0_BIT3"  pos="8"  type="boolean"/>
+				<bitfield name="RGB1_BIT3"  pos="10"  type="boolean"/>
+				<bitfield name="RGB2_BIT3"  pos="12"  type="boolean"/>
+				<bitfield name="RGB3_BIT3"  pos="14"  type="boolean"/>
+				<bitfield name="DMA0_BIT3"  pos="16"  type="boolean"/>
+				<bitfield name="DMA1_BIT3"  pos="18"  type="boolean"/>
+				<bitfield name="CURSOR0" low="20"  high="23"  type="mdp_mixer_stage_id"/>
+				<bitfield name="CURSOR1" low="26"  high="29"  type="mdp_mixer_stage_id"/>
+			</reg32>
+		</array>
+	</array>
+
+	<enum name="mdp5_data_format">
+		<value name="DATA_FORMAT_RGB" value="0"/>
+		<value name="DATA_FORMAT_YUV" value="1"/>
+	</enum>
+
+	<array doffsets="INVALID_IDX(idx),mdp5_cfg->pipe_vig.base[0],mdp5_cfg->pipe_vig.base[1],mdp5_cfg->pipe_vig.base[2],mdp5_cfg->pipe_rgb.base[0],mdp5_cfg->pipe_rgb.base[1],mdp5_cfg->pipe_rgb.base[2],mdp5_cfg->pipe_dma.base[0],mdp5_cfg->pipe_dma.base[1],mdp5_cfg->pipe_vig.base[3],mdp5_cfg->pipe_rgb.base[3],mdp5_cfg->pipe_cursor.base[0],mdp5_cfg->pipe_cursor.base[1]" name="PIPE" length="10" stride="0x400" index="mdp5_pipe">
+		<reg32 offset="0x200" name="OP_MODE">
+			<bitfield name="CSC_DST_DATA_FORMAT" pos="19" type="mdp5_data_format"/>
+			<bitfield name="CSC_SRC_DATA_FORMAT" pos="18" type="mdp5_data_format"/>
+			<bitfield name="CSC_1_EN" pos="17" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x2C4" name="HIST_CTL_BASE"/>
+		<reg32 offset="0x2F0" name="HIST_LUT_BASE"/>
+		<reg32 offset="0x300" name="HIST_LUT_SWAP"/>
+		<reg32 offset="0x320" name="CSC_1_MATRIX_COEFF_0">
+			<bitfield name="COEFF_11" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_12" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x324" name="CSC_1_MATRIX_COEFF_1">
+			<bitfield name="COEFF_13" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_21" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x328" name="CSC_1_MATRIX_COEFF_2">
+			<bitfield name="COEFF_22" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_23" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x32c" name="CSC_1_MATRIX_COEFF_3">
+			<bitfield name="COEFF_31" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_32" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x330" name="CSC_1_MATRIX_COEFF_4">
+			<bitfield name="COEFF_33" low="0" high="12" type="uint"/>
+		</reg32>
+		<array offset="0x334" name="CSC_1_PRE_CLAMP" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="HIGH"  low="0"  high="7"  type="uint"/>
+				<bitfield name="LOW"  low="8"  high="15"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x340" name="CSC_1_POST_CLAMP" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="HIGH"  low="0"  high="7"  type="uint"/>
+				<bitfield name="LOW"  low="8"  high="15"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x34c" name="CSC_1_PRE_BIAS" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VALUE"  low="0"  high="8"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x358" name="CSC_1_POST_BIAS" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VALUE"  low="0"  high="8"  type="uint"/>
+			</reg32>
+		</array>
+		<!-- SSPP: -->
+		<reg32 offset="0x000" name="SRC_SIZE" type="reg_wh"/>
+		<reg32 offset="0x004" name="SRC_IMG_SIZE" type="reg_wh"/>
+		<reg32 offset="0x008" name="SRC_XY" type="reg_xy"/>
+		<reg32 offset="0x00C" name="OUT_SIZE" type="reg_wh"/>
+		<reg32 offset="0x010" name="OUT_XY" type="reg_xy"/>
+		<reg32 offset="0x014" name="SRC0_ADDR"/>
+		<reg32 offset="0x018" name="SRC1_ADDR"/>
+		<reg32 offset="0x01C" name="SRC2_ADDR"/>
+		<reg32 offset="0x020" name="SRC3_ADDR"/>
+		<reg32 offset="0x024" name="SRC_STRIDE_A">
+			<bitfield name="P0" low="0" high="15" type="uint"/>
+			<bitfield name="P1" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x028" name="SRC_STRIDE_B">
+			<bitfield name="P2" low="0" high="15" type="uint"/>
+			<bitfield name="P3" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x02C" name="STILE_FRAME_SIZE"/>
+		<reg32 offset="0x030" name="SRC_FORMAT">
+			<bitfield name="G_BPC" low="0" high="1" type="mdp_bpc"/>
+			<bitfield name="B_BPC" low="2" high="3" type="mdp_bpc"/>
+			<bitfield name="R_BPC" low="4" high="5" type="mdp_bpc"/>
+			<bitfield name="A_BPC" low="6" high="7" type="mdp_bpc_alpha"/>
+			<bitfield name="ALPHA_ENABLE" pos="8" type="boolean"/>
+			<bitfield name="CPP" low="9" high="10" type="uint">
+				<brief>8bit characters per pixel minus 1</brief>
+			</bitfield>
+			<bitfield name="ROT90" pos="11" type="boolean"/>
+			<bitfield name="UNPACK_COUNT" low="12" high="13" type="uint"/>
+			<bitfield name="UNPACK_TIGHT" pos="17" type="boolean"/>
+			<bitfield name="UNPACK_ALIGN_MSB" pos="18" type="boolean"/>
+			<bitfield name="FETCH_TYPE" low="19" high="20" type="mdp_fetch_type"/>
+			<bitfield name="CHROMA_SAMP" low="23" high="24" type="mdp_chroma_samp_type"/>
+		</reg32>
+		<reg32 offset="0x034" name="SRC_UNPACK" type="mdp_unpack_pattern"/>
+		<reg32 offset="0x038" name="SRC_OP_MODE">
+			<bitfield name="BWC_EN" pos="0" type="boolean"/>
+			<bitfield name="BWC" low="1" high="2" type="mdp5_pipe_bwc"/>
+			<bitfield name="FLIP_LR" pos="13" type="boolean"/>
+			<bitfield name="FLIP_UD" pos="14" type="boolean"/>
+			<bitfield name="IGC_EN" pos="16" type="boolean"/>
+			<bitfield name="IGC_ROM_0" pos="17" type="boolean"/>
+			<bitfield name="IGC_ROM_1" pos="18" type="boolean"/>
+			<bitfield name="DEINTERLACE" pos="22" type="boolean"/>
+			<bitfield name="DEINTERLACE_ODD" pos="23" type="boolean"/>
+			<bitfield name="SW_PIX_EXT_OVERRIDE" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x03c" name="SRC_CONSTANT_COLOR"/>
+		<reg32 offset="0x048" name="FETCH_CONFIG"/>
+		<reg32 offset="0x04c" name="VC1_RANGE"/>
+		<reg32 offset="0x050" name="REQPRIO_FIFO_WM_0"/>
+		<reg32 offset="0x054" name="REQPRIO_FIFO_WM_1"/>
+		<reg32 offset="0x058" name="REQPRIO_FIFO_WM_2"/>
+		<reg32 offset="0x070" name="SRC_ADDR_SW_STATUS"/>
+		<reg32 offset="0x0a4" name="CURRENT_SRC0_ADDR"/>
+		<reg32 offset="0x0a8" name="CURRENT_SRC1_ADDR"/>
+		<reg32 offset="0x0ac" name="CURRENT_SRC2_ADDR"/>
+		<reg32 offset="0x0b0" name="CURRENT_SRC3_ADDR"/>
+		<reg32 offset="0x0b4" name="DECIMATION">
+			<bitfield name="VERT" low="0" high="7" type="uint"/>
+			<bitfield name="HORZ" low="8" high="15" type="uint"/>
+		</reg32>
+		<array offsets="0x100,0x110,0x120" name="SW_PIX_EXT" length="3" stride="0x10" index="mdp_component_type">
+			<!--
+				Notes:
+				o These value only take effect if SW_PIX_EXT_OVERRIDE is set in SRC_OP_MODE register
+				o For signed values (int): + indicates overfetch, - indicates line drop
+			-->
+                        <reg32 offset="0x00" name="LR">
+				<bitfield name="LEFT_RPT" low="0" high="7" type="uint"/>
+				<bitfield name="LEFT_OVF" low="8" high="15" type="int"/>
+				<bitfield name="RIGHT_RPT" low="16" high="23" type="uint"/>
+				<bitfield name="RIGHT_OVF" low="24" high="31" type="int"/>
+			</reg32>
+			<reg32 offset="0x04" name="TB">
+				<bitfield name="TOP_RPT" low="0" high="7" type="uint"/>
+				<bitfield name="TOP_OVF" low="8" high="15" type="int"/>
+				<bitfield name="BOTTOM_RPT" low="16" high="23" type="uint"/>
+				<bitfield name="BOTTOM_OVF" low="24" high="31" type="int"/>
+			</reg32>
+			<reg32 offset="0x08" name="REQ_PIXELS">
+				<bitfield name="LEFT_RIGHT" low="0" high="15" type="uint"/>
+				<bitfield name="TOP_BOTTOM" low="16" high="31" type="uint"/>
+			</reg32>
+		</array>
+		<reg32 offset="0x204" name="SCALE_CONFIG">
+			<bitfield name="SCALEX_EN" pos="0" type="boolean"/>
+			<bitfield name="SCALEY_EN" pos="1" type="boolean"/>
+			<bitfield name="SCALEX_FILTER_COMP_0" low="8"  high="9"  type="mdp5_scale_filter"/>
+			<bitfield name="SCALEY_FILTER_COMP_0" low="10" high="11" type="mdp5_scale_filter"/>
+			<bitfield name="SCALEX_FILTER_COMP_1_2"  low="12" high="13" type="mdp5_scale_filter"/>
+			<bitfield name="SCALEY_FILTER_COMP_1_2"  low="14" high="15" type="mdp5_scale_filter"/>
+			<bitfield name="SCALEX_FILTER_COMP_3" low="16" high="17" type="mdp5_scale_filter"/>
+			<bitfield name="SCALEY_FILTER_COMP_3" low="18" high="19" type="mdp5_scale_filter"/>
+		</reg32>
+		<reg32 offset="0x210" name="SCALE_PHASE_STEP_X"/>
+		<reg32 offset="0x214" name="SCALE_PHASE_STEP_Y"/>
+		<reg32 offset="0x218" name="SCALE_CR_PHASE_STEP_X"/>
+		<reg32 offset="0x21c" name="SCALE_CR_PHASE_STEP_Y"/>
+		<reg32 offset="0x220" name="SCALE_INIT_PHASE_X"/>
+		<reg32 offset="0x224" name="SCALE_INIT_PHASE_Y"/>
+	</array>
+
+	<array doffsets="mdp5_cfg->lm.base[0],mdp5_cfg->lm.base[1],mdp5_cfg->lm.base[2],mdp5_cfg->lm.base[3],mdp5_cfg->lm.base[4],mdp5_cfg->lm.base[5]" name="LM" length="6" stride="0x400">
+		<reg32 offset="0x000" name="BLEND_COLOR_OUT">
+			<bitfield name="STAGE0_FG_ALPHA" pos="1" type="boolean"/>
+			<bitfield name="STAGE1_FG_ALPHA" pos="2" type="boolean"/>
+			<bitfield name="STAGE2_FG_ALPHA" pos="3" type="boolean"/>
+			<bitfield name="STAGE3_FG_ALPHA" pos="4" type="boolean"/>
+			<bitfield name="STAGE4_FG_ALPHA" pos="5" type="boolean"/>
+			<bitfield name="STAGE5_FG_ALPHA" pos="6" type="boolean"/>
+			<bitfield name="STAGE6_FG_ALPHA" pos="7" type="boolean"/>
+			<bitfield name="SPLIT_LEFT_RIGHT" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x004" name="OUT_SIZE" type="reg_wh"/>
+		<reg32 offset="0x008" name="BORDER_COLOR_0"/>
+		<reg32 offset="0x010" name="BORDER_COLOR_1"/>
+		<array offsets="0x020,0x050,0x080,0x0B0,0x230,0x260,0x290" name="BLEND" length="7" stride="0x30">
+			<reg32 offset="0x00" name="OP_MODE">
+				<bitfield name="FG_ALPHA" low="0" high="1" type="mdp_alpha_type"/>
+				<bitfield name="FG_INV_ALPHA"     pos="2"  type="boolean"/>
+				<bitfield name="FG_MOD_ALPHA"     pos="3"  type="boolean"/>
+				<bitfield name="FG_INV_MOD_ALPHA" pos="4"  type="boolean"/>
+				<bitfield name="FG_TRANSP_EN"     pos="5"  type="boolean"/>
+				<bitfield name="BG_ALPHA" low="8" high="9" type="mdp_alpha_type"/>
+				<bitfield name="BG_INV_ALPHA"     pos="10" type="boolean"/>
+				<bitfield name="BG_MOD_ALPHA"     pos="11" type="boolean"/>
+				<bitfield name="BG_INV_MOD_ALPHA" pos="12" type="boolean"/>
+				<bitfield name="BG_TRANSP_EN"     pos="13" type="boolean"/>
+			</reg32>
+			<reg32 offset="0x04" name="FG_ALPHA"/>
+			<reg32 offset="0x08" name="BG_ALPHA"/>
+			<reg32 offset="0x0c" name="FG_TRANSP_LOW0"/>
+			<reg32 offset="0x10" name="FG_TRANSP_LOW1"/>
+			<reg32 offset="0x14" name="FG_TRANSP_HIGH0"/>
+			<reg32 offset="0x18" name="FG_TRANSP_HIGH1"/>
+			<reg32 offset="0x1c" name="BG_TRANSP_LOW0"/>
+			<reg32 offset="0x20" name="BG_TRANSP_LOW1"/>
+			<reg32 offset="0x24" name="BG_TRANSP_HIGH0"/>
+			<reg32 offset="0x28" name="BG_TRANSP_HIGH1"/>
+		</array>
+		<reg32 offset="0x0e0" name="CURSOR_IMG_SIZE">
+			<bitfield name="SRC_W" low="0" high="15" type="uint"/>
+			<bitfield name="SRC_H" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0e4" name="CURSOR_SIZE">
+			<bitfield name="ROI_W" low="0" high="15" type="uint"/>
+			<bitfield name="ROI_H" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0e8" name="CURSOR_XY">
+			<bitfield name="SRC_X" low="0" high="15" type="uint"/>
+			<bitfield name="SRC_Y" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0dc" name="CURSOR_STRIDE">
+			<bitfield name="STRIDE" low="0"  high="15"  type="uint"/>
+		</reg32>
+		<reg32 offset="0x0ec" name="CURSOR_FORMAT">
+			<bitfield name="FORMAT" low="0"  high="2"  type="mdp5_cursor_format"/>
+		</reg32>
+		<reg32 offset="0x0f0" name="CURSOR_BASE_ADDR"/>
+		<reg32 offset="0x0f4" name="CURSOR_START_XY">
+			<bitfield name="X_START" low="0" high="15" type="uint"/>
+			<bitfield name="Y_START" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x0f8" name="CURSOR_BLEND_CONFIG">
+			<bitfield name="BLEND_EN" pos="0" type="boolean"/>
+			<bitfield name="BLEND_ALPHA_SEL" low="1"  high="2"  type="mdp5_cursor_alpha"/>
+			<bitfield name="BLEND_TRANSP_EN" pos="3" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x0fc" name="CURSOR_BLEND_PARAM"/>
+		<reg32 offset="0x100" name="CURSOR_BLEND_TRANSP_LOW0"/>
+		<reg32 offset="0x104" name="CURSOR_BLEND_TRANSP_LOW1"/>
+		<reg32 offset="0x108" name="CURSOR_BLEND_TRANSP_HIGH0"/>
+		<reg32 offset="0x10c" name="CURSOR_BLEND_TRANSP_HIGH1"/>
+		<reg32 offset="0x110" name="GC_LUT_BASE"/>
+	</array>
+
+	<array doffsets="mdp5_cfg->dspp.base[0],mdp5_cfg->dspp.base[1],mdp5_cfg->dspp.base[2],mdp5_cfg->dspp.base[3]" name="DSPP" length="4" stride="0x400">
+		<reg32 offset="0x000" name="OP_MODE">
+			<bitfield name="IGC_LUT_EN" pos="0" type="boolean"/>
+			<bitfield name="IGC_TBL_IDX" low="1" high="3" type="uint"/>
+			<bitfield name="PCC_EN" pos="4" type="boolean"/>
+			<bitfield name="DITHER_EN" pos="8" type="boolean"/>
+			<bitfield name="HIST_EN" pos="16" type="boolean"/>
+			<bitfield name="AUTO_CLEAR" pos="17" type="boolean"/>
+			<bitfield name="HIST_LUT_EN" pos="19" type="boolean"/>
+			<bitfield name="PA_EN" pos="20" type="boolean"/>
+			<bitfield name="GAMUT_EN" pos="23" type="boolean"/>
+			<bitfield name="GAMUT_ORDER" pos="24" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x030" name="PCC_BASE"/>
+		<reg32 offset="0x150" name="DITHER_DEPTH"/>
+		<reg32 offset="0x210" name="HIST_CTL_BASE"/>
+		<reg32 offset="0x230" name="HIST_LUT_BASE"/>
+		<reg32 offset="0x234" name="HIST_LUT_SWAP"/>
+		<reg32 offset="0x238" name="PA_BASE"/>
+		<reg32 offset="0x2dc" name="GAMUT_BASE"/>
+		<reg32 offset="0x2b0" name="GC_BASE"/>
+	</array>
+
+	<array doffsets="mdp5_cfg->pp.base[0],mdp5_cfg->pp.base[1],mdp5_cfg->pp.base[2],mdp5_cfg->pp.base[3]" name="PP" length="4" stride="0x100">
+		<reg32 offset="0x000" name="TEAR_CHECK_EN"/>
+		<reg32 offset="0x004" name="SYNC_CONFIG_VSYNC">
+			<bitfield name="COUNT" low="0" high="18" type="uint"/>
+			<bitfield name="COUNTER_EN" pos="19" type="boolean"/>
+			<bitfield name="IN_EN" pos="20" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x008" name="SYNC_CONFIG_HEIGHT"/>
+		<reg32 offset="0x00c" name="SYNC_WRCOUNT">
+			<bitfield name="LINE_COUNT" low="0" high="15" type="uint"/>
+			<bitfield name="FRAME_COUNT" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x010" name="VSYNC_INIT_VAL"/>
+		<reg32 offset="0x014" name="INT_COUNT_VAL">
+			<bitfield name="LINE_COUNT" low="0" high="15" type="uint"/>
+			<bitfield name="FRAME_COUNT" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x018" name="SYNC_THRESH">
+			<bitfield name="START" low="0" high="15" type="uint"/>
+			<bitfield name="CONTINUE" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x01c" name="START_POS"/>
+		<reg32 offset="0x020" name="RD_PTR_IRQ"/>
+		<reg32 offset="0x024" name="WR_PTR_IRQ"/>
+		<reg32 offset="0x028" name="OUT_LINE_COUNT"/>
+		<reg32 offset="0x02c" name="PP_LINE_COUNT"/>
+		<reg32 offset="0x030" name="AUTOREFRESH_CONFIG"/>
+		<reg32 offset="0x034" name="FBC_MODE"/>
+		<reg32 offset="0x038" name="FBC_BUDGET_CTL"/>
+		<reg32 offset="0x03c" name="FBC_LOSSY_MODE"/>
+	</array>
+
+	<enum name="mdp5_block_size">
+		<value name="BLOCK_SIZE_64" value="0"/>
+		<value name="BLOCK_SIZE_128" value="1"/>
+	</enum>
+
+	<enum name="mdp5_rotate_mode">
+		<value name="ROTATE_0" value="0"/>
+		<value name="ROTATE_90" value="1"/>
+	</enum>
+
+	<enum name="mdp5_chroma_downsample_method">
+		<value name="DS_MTHD_NO_PIXEL_DROP" value="0"/>
+		<value name="DS_MTHD_PIXEL_DROP" value="1"/>
+	</enum>
+
+	<array doffsets="mdp5_cfg->wb.base[0],mdp5_cfg->wb.base[1],mdp5_cfg->wb.base[2],mdp5_cfg->wb.base[3],mdp5_cfg->wb.base[4]" name="WB" length="5" stride="0x400">
+		<reg32 offset="0x000" name="DST_FORMAT">
+			<bitfield name="DSTC0_OUT" low="0" high="1" type="uint"/>
+			<bitfield name="DSTC1_OUT" low="2" high="3" type="uint"/>
+			<bitfield name="DSTC2_OUT" low="4" high="5" type="uint"/>
+			<bitfield name="DSTC3_OUT" low="6" high="7" type="uint"/>
+			<bitfield name="DSTC3_EN" pos="8" type="boolean"/>
+			<bitfield name="DST_BPP" low="9" high="10" type="uint"/>
+			<bitfield name="PACK_COUNT" low="12" high="13" type="uint"/>
+			<bitfield name="DST_ALPHA_X" pos="14" type="boolean"/>
+			<bitfield name="PACK_TIGHT" pos="17" type="boolean"/>
+			<bitfield name="PACK_ALIGN_MSB" pos="18" type="boolean"/>
+			<bitfield name="WRITE_PLANES" low="19" high="20" type="uint"/>
+			<bitfield name="DST_DITHER_EN" pos="22" type="boolean"/>
+			<bitfield name="DST_CHROMA_SAMP" low="23" high="25" type="uint"/>
+			<bitfield name="DST_CHROMA_SITE" low="26" high="29" type="uint"/>
+			<bitfield name="FRAME_FORMAT" low="30" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x004" name="DST_OP_MODE">
+			<bitfield name="BWC_ENC_EN" pos="0" type="boolean"/>
+			<bitfield name="BWC_ENC_OP" low="1" high="2" type="uint"/>
+			<bitfield name="BLOCK_SIZE" low="4" high="4" type="uint"/>
+			<bitfield name="ROT_MODE" low="5" high="5" type="uint"/>
+			<bitfield name="ROT_EN" pos="6" type="boolean"/>
+			<bitfield name="CSC_EN" pos="8" type="boolean"/>
+			<bitfield name="CSC_SRC_DATA_FORMAT" low="9" high="9" type="uint"/>
+			<bitfield name="CSC_DST_DATA_FORMAT" low="10" high="10" type="uint"/>
+			<bitfield name="CHROMA_DWN_SAMPLE_EN" pos="11" type="boolean"/>
+			<bitfield name="CHROMA_DWN_SAMPLE_FORMAT" low="12" high="12" type="uint"/>
+			<bitfield name="CHROMA_DWN_SAMPLE_H_MTHD" low="13" high="13" type="uint"/>
+			<bitfield name="CHROMA_DWN_SAMPLE_V_MTHD" low="14" high="14" type="uint"/>
+		</reg32>
+		<reg32 offset="0x008" name="DST_PACK_PATTERN">
+			<bitfield name="ELEMENT0" low="0" high="1" type="uint"/>
+			<bitfield name="ELEMENT1" low="8" high="9" type="uint"/>
+			<bitfield name="ELEMENT2" low="16" high="17" type="uint"/>
+			<bitfield name="ELEMENT3" low="24" high="25" type="uint"/>
+		</reg32>
+		<reg32 offset="0x00c" name="DST0_ADDR"/>
+		<reg32 offset="0x010" name="DST1_ADDR"/>
+		<reg32 offset="0x014" name="DST2_ADDR"/>
+		<reg32 offset="0x018" name="DST3_ADDR"/>
+		<reg32 offset="0x01c" name="DST_YSTRIDE0">
+			<bitfield name="DST0_YSTRIDE" low="0" high="15" type="uint"/>
+			<bitfield name="DST1_YSTRIDE" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x020" name="DST_YSTRIDE1">
+			<bitfield name="DST2_YSTRIDE" low="0" high="15" type="uint"/>
+			<bitfield name="DST3_YSTRIDE" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x024" name="DST_DITHER_BITDEPTH"/>
+		<reg32 offset="0x030" name="DITHER_MATRIX_ROW0"/>
+		<reg32 offset="0x034" name="DITHER_MATRIX_ROW1"/>
+		<reg32 offset="0x038" name="DITHER_MATRIX_ROW2"/>
+		<reg32 offset="0x03c" name="DITHER_MATRIX_ROW3"/>
+		<reg32 offset="0x048" name="DST_WRITE_CONFIG"/>
+		<reg32 offset="0x050" name="ROTATION_DNSCALER"/>
+		<reg32 offset="0x060" name="N16_INIT_PHASE_X_0_3"/>
+		<reg32 offset="0x064" name="N16_INIT_PHASE_X_1_2"/>
+		<reg32 offset="0x068" name="N16_INIT_PHASE_Y_0_3"/>
+		<reg32 offset="0x06c" name="N16_INIT_PHASE_Y_1_2"/>
+		<reg32 offset="0x074" name="OUT_SIZE">
+			<bitfield name="DST_W" low="0" high="15" type="uint"/>
+			<bitfield name="DST_H" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x078" name="ALPHA_X_VALUE"/>
+		<reg32 offset="0x260" name="CSC_MATRIX_COEFF_0">
+			<bitfield name="COEFF_11" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_12" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x264" name="CSC_MATRIX_COEFF_1">
+			<bitfield name="COEFF_13" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_21" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x268" name="CSC_MATRIX_COEFF_2">
+			<bitfield name="COEFF_22" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_23" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x26c" name="CSC_MATRIX_COEFF_3">
+			<bitfield name="COEFF_31" low="0" high="12" type="uint"/>
+			<bitfield name="COEFF_32" low="16" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="0x270" name="CSC_MATRIX_COEFF_4">
+			<bitfield name="COEFF_33" low="0" high="12" type="uint"/>
+		</reg32>
+		<array offset="0x274" name="CSC_COMP_PRECLAMP" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="HIGH"  low="0"  high="7"  type="uint"/>
+				<bitfield name="LOW"  low="8"  high="15"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x280" name="CSC_COMP_POSTCLAMP" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="HIGH"  low="0"  high="7"  type="uint"/>
+				<bitfield name="LOW"  low="8"  high="15"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x28c" name="CSC_COMP_PREBIAS" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VALUE"  low="0"  high="8"  type="uint"/>
+			</reg32>
+		</array>
+		<array offset="0x298" name="CSC_COMP_POSTBIAS" length="3" stride="4">
+			<reg32 offset="0" name="REG">
+				<bitfield name="VALUE"  low="0"  high="8"  type="uint"/>
+			</reg32>
+		</array>
+	</array>
+
+	<array doffsets="mdp5_cfg->intf.base[0],mdp5_cfg->intf.base[1],mdp5_cfg->intf.base[2],mdp5_cfg->intf.base[3],mdp5_cfg->intf.base[4]" name="INTF" length="5" stride="0x200">
+		<reg32 offset="0x000" name="TIMING_ENGINE_EN"/>
+		<reg32 offset="0x004" name="CONFIG"/>
+		<reg32 offset="0x008" name="HSYNC_CTL">
+			<bitfield name="PULSEW" low="0" high="15" type="uint"/>
+			<bitfield name="PERIOD" low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x00c" name="VSYNC_PERIOD_F0" type="uint"/>
+		<reg32 offset="0x010" name="VSYNC_PERIOD_F1" type="uint"/>
+		<reg32 offset="0x014" name="VSYNC_LEN_F0" type="uint"/>
+		<reg32 offset="0x018" name="VSYNC_LEN_F1" type="uint"/>
+		<reg32 offset="0x01c" name="DISPLAY_VSTART_F0" type="uint"/>
+		<reg32 offset="0x020" name="DISPLAY_VSTART_F1" type="uint"/>
+		<reg32 offset="0x024" name="DISPLAY_VEND_F0" type="uint"/>
+		<reg32 offset="0x028" name="DISPLAY_VEND_F1" type="uint"/>
+		<reg32 offset="0x02c" name="ACTIVE_VSTART_F0">
+			<bitfield name="VAL" low="0" high="30" type="uint"/>
+			<bitfield name="ACTIVE_V_ENABLE" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x030" name="ACTIVE_VSTART_F1">
+			<bitfield name="VAL" low="0" high="30" type="uint"/>
+		</reg32>
+		<reg32 offset="0x034" name="ACTIVE_VEND_F0" type="uint"/>
+		<reg32 offset="0x038" name="ACTIVE_VEND_F1" type="uint"/>
+		<reg32 offset="0x03c" name="DISPLAY_HCTL">
+			<bitfield name="START" low="0"  high="15" type="uint"/>
+			<bitfield name="END"   low="16" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x040" name="ACTIVE_HCTL">
+			<bitfield name="START" low="0"  high="14" type="uint"/>
+			<bitfield name="END"   low="16" high="30" type="uint"/>
+			<bitfield name="ACTIVE_H_ENABLE" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x044" name="BORDER_COLOR"/>
+		<reg32 offset="0x048" name="UNDERFLOW_COLOR"/>
+		<reg32 offset="0x04c" name="HSYNC_SKEW"/>
+		<reg32 offset="0x050" name="POLARITY_CTL">
+			<bitfield name="HSYNC_LOW" pos="0" type="boolean"/>
+			<bitfield name="VSYNC_LOW" pos="1" type="boolean"/>
+			<bitfield name="DATA_EN_LOW" pos="2" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x054" name="TEST_CTL"/>
+		<reg32 offset="0x058" name="TP_COLOR0"/>
+		<reg32 offset="0x05c" name="TP_COLOR1"/>
+		<reg32 offset="0x084" name="DSI_CMD_MODE_TRIGGER_EN"/>
+		<reg32 offset="0x090" name="PANEL_FORMAT" type="mdp5_format"/>
+		<reg32 offset="0x0a8" name="FRAME_LINE_COUNT_EN"/>
+		<reg32 offset="0x0ac" name="FRAME_COUNT"/>
+		<reg32 offset="0x0b0" name="LINE_COUNT"/>
+		<reg32 offset="0x0f0" name="DEFLICKER_CONFIG"/>
+		<reg32 offset="0x0f4" name="DEFLICKER_STRNG_COEFF"/>
+		<reg32 offset="0x0f8" name="DEFLICKER_WEAK_COEFF"/>
+		<reg32 offset="0x100" name="TPG_ENABLE"/>
+		<reg32 offset="0x104" name="TPG_MAIN_CONTROL"/>
+		<reg32 offset="0x108" name="TPG_VIDEO_CONFIG"/>
+		<reg32 offset="0x10c" name="TPG_COMPONENT_LIMITS"/>
+		<reg32 offset="0x110" name="TPG_RECTANGLE"/>
+		<reg32 offset="0x114" name="TPG_INITIAL_VALUE"/>
+		<reg32 offset="0x118" name="TPG_BLK_WHITE_PATTERN_FRAME"/>
+		<reg32 offset="0x11c" name="TPG_RGB_MAPPING"/>
+	</array>
+
+	<array doffsets="mdp5_cfg->ad.base[0],mdp5_cfg->ad.base[1]" name="AD" length="2" stride="0x200">
+		<reg32 offset="0x000" name="BYPASS"/>
+		<reg32 offset="0x004" name="CTRL_0"/>
+		<reg32 offset="0x008" name="CTRL_1"/>
+		<reg32 offset="0x00c" name="FRAME_SIZE"/>
+		<reg32 offset="0x010" name="CON_CTRL_0"/>
+		<reg32 offset="0x014" name="CON_CTRL_1"/>
+		<reg32 offset="0x018" name="STR_MAN"/>
+		<reg32 offset="0x01c" name="VAR"/>
+		<reg32 offset="0x020" name="DITH"/>
+		<reg32 offset="0x024" name="DITH_CTRL"/>
+		<reg32 offset="0x028" name="AMP_LIM"/>
+		<reg32 offset="0x02c" name="SLOPE"/>
+		<reg32 offset="0x030" name="BW_LVL"/>
+		<reg32 offset="0x034" name="LOGO_POS"/>
+		<reg32 offset="0x038" name="LUT_FI"/>
+		<reg32 offset="0x07c" name="LUT_CC"/>
+		<reg32 offset="0x0c8" name="STR_LIM"/>
+		<reg32 offset="0x0cc" name="CALIB_AB"/>
+		<reg32 offset="0x0d0" name="CALIB_CD"/>
+		<reg32 offset="0x0d4" name="MODE_SEL"/>
+		<reg32 offset="0x0d8" name="TFILT_CTRL"/>
+		<reg32 offset="0x0dc" name="BL_MINMAX"/>
+		<reg32 offset="0x0e0" name="BL"/>
+		<reg32 offset="0x0e8" name="BL_MAX"/>
+		<reg32 offset="0x0ec" name="AL"/>
+		<reg32 offset="0x0f0" name="AL_MIN"/>
+		<reg32 offset="0x0f4" name="AL_FILT"/>
+		<reg32 offset="0x0f8" name="CFG_BUF"/>
+		<reg32 offset="0x100" name="LUT_AL"/>
+		<reg32 offset="0x144" name="TARG_STR"/>
+		<reg32 offset="0x148" name="START_CALC"/>
+		<reg32 offset="0x14c" name="STR_OUT"/>
+		<reg32 offset="0x154" name="BL_OUT"/>
+		<reg32 offset="0x158" name="CALC_DONE"/>
+	</array>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/mdp_common.xml b/drivers/gpu/drm/msm/registers/display/mdp_common.xml
new file mode 100644
index 000000000000..f1b6345c1323
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/mdp_common.xml
@@ -0,0 +1,90 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+
+<!-- random bits that seem same between mdp4 and mdp5 (ie. not much) -->
+
+<enum name="mdp_chroma_samp_type">
+    <value name="CHROMA_FULL"  value="0"/>
+    <value name="CHROMA_H2V1" value="1"/>
+    <value name="CHROMA_H1V2" value="2"/>
+    <value name="CHROMA_420"  value="3"/>
+</enum>
+
+<enum name="mdp_fetch_type">
+    <value name="MDP_PLANE_INTERLEAVED"   value="0"/>
+    <value name="MDP_PLANE_PLANAR"        value="1"/>
+    <value name="MDP_PLANE_PSEUDO_PLANAR" value="2"/>
+</enum>
+
+<enum name="mdp_mixer_stage_id">
+	<value name="STAGE_UNUSED" value="0"/>
+	<value name="STAGE_BASE" value="1"/>
+	<value name="STAGE0" value="2"/>   <!-- zorder 0 -->
+	<value name="STAGE1" value="3"/>   <!-- zorder 1 -->
+	<value name="STAGE2" value="4"/>   <!-- zorder 2 -->
+	<value name="STAGE3" value="5"/>   <!-- zorder 3 -->
+	<value name="STAGE4" value="6"/>   <!-- zorder 4 -->
+	<value name="STAGE5" value="7"/>   <!-- zorder 5 -->
+	<value name="STAGE6" value="8"/>   <!-- zorder 6 -->
+	<value name="STAGE_MAX" value="8"/> <!-- maximum zorder -->
+</enum>
+
+<enum name="mdp_alpha_type">
+	<value name="FG_CONST" value="0"/>
+	<value name="BG_CONST" value="1"/>
+	<value name="FG_PIXEL" value="2"/>
+	<value name="BG_PIXEL" value="3"/>
+</enum>
+
+<enum name="mdp_component_type">
+        <value name="COMP_0" value="0"/>	<!-- Y component -->
+        <value name="COMP_1_2" value="1"/>	<!-- Cb/Cr comp. -->
+        <value name="COMP_3" value="2"/>	<!-- Trans comp. -->
+        <value name="COMP_MAX" value="3"/>
+</enum>
+
+<enum name="mdp_bpc">
+	<brief>bits per component (non-alpha channel)</brief>
+	<value name="BPC4" value="0"/> <!-- 4 bits -->
+	<value name="BPC5" value="1"/> <!-- 5 bits -->
+	<value name="BPC6" value="2"/> <!-- 6 bits -->
+	<value name="BPC8" value="3"/> <!-- 8 bits -->
+</enum>
+
+<enum name="mdp_bpc_alpha">
+	<brief>bits per component (alpha channel)</brief>
+	<value name="BPC1A" value="0"/> <!-- 1 bit -->
+	<value name="BPC4A" value="1"/> <!-- 4 bits -->
+	<value name="BPC6A" value="2"/> <!-- 6 bits -->
+	<value name="BPC8A" value="3"/> <!-- 8 bits -->
+</enum>
+
+<enum name="mdp_fetch_mode">
+	<value name="MDP_FETCH_LINEAR" value="0"/>
+	<value name="MDP_FETCH_TILE" value="1"/>
+	<value name="MDP_FETCH_UBWC" value="2"/>
+</enum>
+
+<bitset name="reg_wh" inline="yes">
+    <bitfield name="HEIGHT" low="16" high="31" type="uint"/>
+    <bitfield name="WIDTH" low="0" high="15" type="uint"/>
+</bitset>
+
+<bitset name="reg_xy" inline="yes">
+    <bitfield name="Y" low="16" high="31" type="uint"/>
+    <bitfield name="X" low="0" high="15" type="uint"/>
+</bitset>
+
+<bitset name="mdp_unpack_pattern" inline="yes">
+	<bitfield name="ELEM0" low="0"  high="7"/>
+	<bitfield name="ELEM1" low="8"  high="15"/>
+	<bitfield name="ELEM2" low="16" high="23"/>
+	<bitfield name="ELEM3" low="24" high="31"/>
+</bitset>
+
+</database>
+
diff --git a/drivers/gpu/drm/msm/registers/display/msm.xml b/drivers/gpu/drm/msm/registers/display/msm.xml
new file mode 100644
index 000000000000..429c35b73bad
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/msm.xml
@@ -0,0 +1,32 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<doc>
+	Register definitions for the display related hw blocks on
+	msm/snapdragon
+</doc>
+
+<!--
+<enum name="chipset">
+	<value name="MDP40"/>
+	<value name="MDP50"/>
+</enum>
+-->
+
+<import file="mdp4.xml"/>
+<import file="mdp5.xml"/>
+<import file="dsi.xml"/>
+<import file="dsi_phy_28nm_8960.xml"/>
+<import file="dsi_phy_28nm.xml"/>
+<import file="dsi_phy_20nm.xml"/>
+<import file="dsi_phy_14nm.xml"/>
+<import file="dsi_phy_10nm.xml"/>
+<import file="dsi_phy_7nm.xml"/>
+<import file="sfpb.xml"/>
+<import file="hdmi.xml"/>
+<import file="edp.xml"/>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/display/sfpb.xml b/drivers/gpu/drm/msm/registers/display/sfpb.xml
new file mode 100644
index 000000000000..de1cf43c131f
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/sfpb.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="SFPB" width="32">
+	<enum name="sfpb_ahb_arb_master_port_en">
+		<value name="SFPB_MASTER_PORT_ENABLE" value="3"/>
+		<value name="SFPB_MASTER_PORT_DISABLE" value="0"/>
+	</enum>
+	<reg32 offset="0x0058" name="GPREG">
+		<bitfield name="MASTER_PORT_EN" low="11" high="12" type="sfpb_ahb_arb_master_port_en"/>
+	</reg32>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/freedreno_copyright.xml b/drivers/gpu/drm/msm/registers/freedreno_copyright.xml
new file mode 100644
index 000000000000..854efdd2e5fc
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/freedreno_copyright.xml
@@ -0,0 +1,40 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+
+<copyright year="2013">
+
+<author name="Rob Clark" email="robdclark@gmail.com"><nick name="robclark"/>
+Initial Author.
+</author>
+
+<author name="Ilia Mirkin" email="imirkin@alum.mit.edu"><nick name="imirkin"/>
+many a3xx/a4xx contributions
+</author>
+
+<license>
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice (including the
+next paragraph) shall be included in all copies or substantial
+portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+</license>
+
+</copyright>
+</database>
+
diff --git a/drivers/gpu/drm/msm/registers/rules-fd.xsd b/drivers/gpu/drm/msm/registers/rules-fd.xsd
new file mode 100644
index 000000000000..2eedb099a4eb
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/rules-fd.xsd
@@ -0,0 +1,404 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<schema xmlns="http://www.w3.org/2001/XMLSchema"
+	targetNamespace="http://nouveau.freedesktop.org/"
+	xmlns:rng="http://nouveau.freedesktop.org/"
+	elementFormDefault="qualified">
+
+	<annotation>
+		<documentation>
+			An updated version of the old rules.xml file from the
+			RivaTV project. Specifications by Pekka Paalanen,
+			preliminary attempt by KoalaBR,
+			first working version by Jakob Bornecrantz.
+			For specifications, see the file rules-ng-format.txt
+			in Nouveau CVS module 'rules-ng'.
+		</documentation>
+		<documentation>Version 0.1</documentation>
+	</annotation>
+
+
+	<!-- Elements -->
+
+	<element name="database"       type="rng:databaseType" />
+	<element name="import"         type="rng:importType" />
+	<element name="copyright"      type="rng:copyrightType" />
+	<element name="domain"         type="rng:domainType" />
+	<element name="array"          type="rng:arrayType" />
+	<element name="stripe"         type="rng:stripeType" />
+	<element name="reg64"          type="rng:registerType" />
+	<element name="reg32"          type="rng:registerType" />
+	<element name="bitset"         type="rng:bitsetType" />
+	<element name="bitfield"       type="rng:bitfieldType" />
+	<element name="enum"           type="rng:enumType" />
+	<element name="value"          type="rng:valueType" />
+
+	<!-- Copyright elements -->
+	<element name="author"         type="rng:authorType" />
+	<element name="nick"           type="rng:nickType" />
+	<element name="license"        type="rng:docType" />
+
+	<!-- Documentation elements -->
+	
+	<!-- FIXME: allowed only one  per parent element -->
+	<element name="brief" type="rng:briefType" />
+	
+	<element name="doc"  type="rng:docType" />
+	<element name="b"    type="rng:textformatType" />
+	<element name="i"    type="rng:textformatType" />
+	<element name="u"    type="rng:textformatType" />
+	<element name="code" type="rng:textcodeType" />
+	<element name="ul"   type="rng:listType" />
+	<element name="ol"   type="rng:listType" />
+	<element name="li"   type="rng:listitemType" />
+
+	<!-- Copyright element types -->
+
+	<complexType name="authorType" mixed="true">
+		<annotation>
+			<documentation>
+				register database author
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<element ref="rng:nick" />
+		</choice>
+		<attribute name="name" type="string" use="required" />
+		<attribute name="email" type="string" use="required" />
+	</complexType>
+
+	<complexType name="nickType">
+		<annotation>
+			<documentation>nickType</documentation>
+		</annotation>
+		<attribute name="name" type="string" use="required" />
+	</complexType>
+
+	<!-- Database element types -->
+
+	<complexType name="databaseType">
+		<annotation>
+			<documentation>databaseType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+		</choice>
+	</complexType>
+
+	<complexType name="importType">
+		<annotation>
+			<documentation>importType</documentation>
+		</annotation>
+		<attribute name="file" type="string" use="required" />
+	</complexType>
+
+	<complexType name="copyrightType">
+		<annotation>
+			<documentation>copyrightType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+			<element ref="rng:author" />
+			<element ref="rng:license" />
+		</choice>
+		<attribute name="year" type="nonNegativeInteger" use="optional" />
+	</complexType>
+
+	<complexType name="domainType">
+		<annotation>
+			<documentation>domainType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+			<group ref="rng:regarrayGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="prefix" type="NMTOKENS" use="optional" />
+		<attribute name="width" type="rng:DomainWidth" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+	</complexType>
+
+	<complexType name="arrayType">
+		<annotation>
+			<documentation>arrayType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+			<group ref="rng:regarrayGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="optional" />
+		<attribute name="offset" type="rng:HexOrNumber" use="optional" />
+		<attribute name="offsets" type="string" use="optional"/>
+		<attribute name="doffsets" type="string" use="optional"/>
+		<attribute name="index" type="NMTOKENS" use="optional"/>
+		<attribute name="stride" type="rng:HexOrNumber" use="required" />
+		<attribute name="length" type="rng:HexOrNumber" use="required" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+		<attribute name="usage" type="string" use="optional" />
+	</complexType>
+
+	<complexType name="stripeType">
+		<annotation>
+			<documentation>stripeType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+			<group ref="rng:regarrayGroup" minOccurs="0" />
+		</choice>
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+		<attribute name="prefix" type="NMTOKENS" use="optional" />
+	</complexType>
+
+	<complexType name="registerType">
+		<annotation>
+			<documentation>
+				registerType used by reg32, reg64
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+			<element ref="rng:value" />
+			<element ref="rng:bitfield" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="offset" type="rng:HexOrNumber" use="required" />
+		<attribute name="type" type="NMTOKENS" use="optional" />
+		<attribute name="shr" type="nonNegativeInteger" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+		<attribute name="stride" type="rng:HexOrNumber" use="optional" />
+		<attribute name="length" type="rng:HexOrNumber" use="optional" />
+		<attribute name="high" type="nonNegativeInteger" use="optional" />
+		<attribute name="low" type="nonNegativeInteger" use="optional" />
+		<attribute name="pos" type="nonNegativeInteger" use="optional" />
+		<attribute name="align" type="nonNegativeInteger" use="optional" />
+		<attribute name="radix" type="nonNegativeInteger" use="optional" />
+		<attribute name="usage" type="string" use="optional" />
+	</complexType>
+
+	<complexType name="bitsetType">
+		<annotation>
+			<documentation>bitsetType</documentation>
+		</annotation>
+		<choice maxOccurs="unbounded">
+			<element ref="rng:bitfield" />
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="inline" type="rng:Boolean" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+	</complexType>
+
+	<complexType name="bitfieldType">
+		<annotation>
+			<documentation>bitfieldType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<element ref="rng:value" maxOccurs="unbounded" />
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="high" type="nonNegativeInteger" use="optional" />
+		<attribute name="low" type="nonNegativeInteger" use="optional" />
+		<attribute name="pos" type="nonNegativeInteger" use="optional" />
+		<attribute name="radix" type="nonNegativeInteger" use="optional" />
+		<attribute name="type" type="NMTOKENS" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+		<attribute name="addvariant" type="rng:Boolean" use="optional" />
+		<attribute name="shr" type="nonNegativeInteger" use="optional" />
+	</complexType>
+
+	<complexType name="enumType">
+		<annotation>
+			<documentation>enumType</documentation>
+		</annotation>
+		<choice maxOccurs="unbounded">
+			<element ref="rng:value" />
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="bare" type="rng:Boolean" use="optional" />
+		<attribute name="prefix" type="NMTOKENS" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+	</complexType>
+
+	<complexType name="valueType">
+		<annotation>
+			<documentation>valueType</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:docGroup" />
+			<group ref="rng:topGroup" />
+		</choice>
+		<attribute name="name" type="NMTOKEN" use="required" />
+		<attribute name="value" type="string" use="optional" />
+		<attribute name="varset" type="NMTOKEN" use="optional" />
+		<attribute name="variants" type="string" use="optional" />
+	</complexType>
+
+	<!-- Documentation element types -->
+
+	<complexType name="briefType">
+		<annotation>
+			<documentation>
+				brief documentation, no markup
+			</documentation>
+		</annotation>
+		<simpleContent>
+			<extension base="string" />
+		</simpleContent>
+	</complexType>
+	
+	<complexType name="docType" mixed="true">
+		<annotation>
+			<documentation>
+				root element of documentation sub-tree
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:textformatGroup" />
+			<group ref="rng:listGroup" />
+			<element ref="rng:code" />
+		</choice>
+	</complexType>
+	
+	<complexType name="textformatType" mixed="true">
+		<annotation>
+			<documentation>
+				for bold, underline, italics
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:textformatGroup" />
+		</choice>
+	</complexType>
+	
+	<complexType name="textcodeType">
+		<simpleContent>
+			<extension base="string">
+				<attribute name="title" type="string" />
+			</extension>
+		</simpleContent>
+	</complexType>
+	
+	<complexType name="listType">
+		<annotation>
+			<documentation>
+				definition of a list, ordered or unordered
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<element ref="rng:li" />
+		</choice>
+	</complexType>
+	
+	<complexType name="listitemType" mixed="true">
+		<annotation>
+			<documentation>
+				items of a list
+			</documentation>
+		</annotation>
+		<choice minOccurs="0" maxOccurs="unbounded">
+			<group ref="rng:textformatGroup" />
+			<group ref="rng:listGroup" />
+			<element ref="rng:code" />
+		</choice>
+	</complexType>
+
+
+
+	<!-- Attribute value types -->
+
+	<simpleType name="Hexadecimal">
+		<restriction base="string">
+			<pattern value="0x[0-9a-f]+" />
+			<pattern value="0x[0-9A-F]+" />
+			<pattern value="[0-9]" />
+		</restriction>
+	</simpleType>
+
+	<simpleType name="HexOrNumber">
+		<annotation>
+			<documentation>HexOrNumber</documentation>
+		</annotation>
+		<union memberTypes="rng:Hexadecimal nonNegativeInteger" />
+	</simpleType>
+
+	<simpleType name="Boolean">
+		<restriction base="string">
+			<enumeration value="true" />
+			<enumeration value="1" />
+			<enumeration value="yes" />
+			<enumeration value="false" />
+			<enumeration value="0" />
+			<enumeration value="no" />
+		</restriction>
+	</simpleType>
+
+	<simpleType name="DomainWidth">
+		<annotation>
+			<documentation>DomainWidth</documentation>
+		</annotation>
+		<restriction base="string">
+			<enumeration value="32" />
+		</restriction>
+	</simpleType>
+
+
+
+	<!-- Element groups -->
+
+	<group name="topGroup">
+		<choice>
+			<element ref="rng:copyright" />
+			<element ref="rng:domain" />
+			<element ref="rng:enum" />
+			<element ref="rng:bitset" />
+			<element ref="rng:import" />
+		</choice>
+	</group>
+	
+	<group name="regarrayGroup">
+		<choice>
+			<element ref="rng:reg64" />
+			<element ref="rng:reg32" />
+			<element ref="rng:array" />
+			<element ref="rng:stripe" />
+		</choice>
+	</group>
+	
+	<group name="docGroup">
+		<choice>
+			<element ref="rng:brief" />
+			<element ref="rng:doc" />
+		</choice>
+	</group>
+	
+	<group name="textformatGroup">
+		<choice>
+			<element ref="rng:b" />
+			<element ref="rng:i" />
+			<element ref="rng:u" />
+		</choice>
+	</group>
+	
+	<group name="listGroup">
+		<choice>
+			<element ref="rng:ul" />
+			<element ref="rng:ol" />
+		</choice>
+	</group>
+
+</schema>

-- 
2.39.2


