Return-Path: <linux-arm-msm+bounces-652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24207EBA0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C9AFB20AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E5F2AF13;
	Tue, 14 Nov 2023 23:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="R8MWxDcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594A2A1D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:37 +0000 (UTC)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234DEE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:35 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6705379b835so37069616d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002835; x=1700607635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bXNM4Q60WzU91mEPZf4VyqZpLI234VBPPnXZJAmol4=;
        b=R8MWxDcMWe1VEmAnOehN4DLkrTan11W0aUc3k7OwL8Cpdc46fN6MwRWzdT0eCHU2aZ
         ocpQtVtA02xwq1HVOmg/hYd0jg9lB7YCLzyyRkiLk9x74CJft+Drs7MnacJDDYD/QnX9
         oKC4S0ZWbgjIMj6bgS2O4ElFPDj8MpNuya+3OyaPJS+RR2CkCGnrgmjbgrdg+/1ZcyBl
         k95gy28+a0tBXq0tQKXzmrmy5vw+/a4EHLvqXhLF6bh2ArFvVvuM9CSXX0IS0SgEamBT
         jmFoQ2irlhQ+r+Y6RqlAg2kV570gNR/z3+3/gkOd49Uy9dvxXof5uJdzCYOUOIBPsLUt
         308g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002835; x=1700607635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bXNM4Q60WzU91mEPZf4VyqZpLI234VBPPnXZJAmol4=;
        b=OMRcM8cpyNqoZKWMUfoCaqyhIx6nOJQgZxqmS4Zl1CEyWtowMIp20uDvkDYiAweYKW
         Qr6IMv46F5fsF6o5n6sHFR5wZ60dfcU1soG9HCNp2OwcapfDj1HdQBtfaVkrSDijYmB2
         AFaW8Mm5P1+SDoyGtEu8nUK0MLoq6Rxhr+Vvw0NwN7mRdaP0oq12DpKEm1QGM1oeUTMJ
         1/8L5y3XkNchyml7TCCtaBrIyAIGuPdYc4vyRVCDWSzDInUIrLnk9Cfrg7f52oBFBKbr
         n68dz9S+0fCXtWkYpnENSRyOuqZKy3qttzhpfHbmnsZU8Xyu+CC1Zg+hll5u3mVDTJ4O
         NJDg==
X-Gm-Message-State: AOJu0YwD9bZGBaklE8Y42s8UGEr5LGcQCuUgJ0r1oWl4qKicbVHmIaJi
	YXL7ga7I75mbwtxI5q4P0ZVM2A==
X-Google-Smtp-Source: AGHT+IHCQG3eL93xOKOvyP2tHydGdXl7lNnMKJaAkchLjAmxahJp9qdvYkmh1PrCIEgA8PmuVIkUJA==
X-Received: by 2002:ad4:544b:0:b0:677:af51:da43 with SMTP id h11-20020ad4544b000000b00677af51da43mr3858770qvt.0.1700002834910;
        Tue, 14 Nov 2023 15:00:34 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:34 -0800 (PST)
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
Subject: [PATCH v2 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
Date: Tue, 14 Nov 2023 17:58:31 -0500
Message-Id: <20231114225857.19702-4-jonathan@marek.ca>
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

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3 ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index f2c1cbd08d4d..66f198e21a7e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -849,6 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -856,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -893,6 +895,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }
-- 
2.26.1


