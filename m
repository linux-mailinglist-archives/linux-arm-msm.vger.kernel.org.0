Return-Path: <linux-arm-msm+bounces-16231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7975896A29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F1C28E414
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82D26FE0A;
	Wed,  3 Apr 2024 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckzVL5RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D171B48
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135498; cv=none; b=Uiu5uhTPdlGI/OyIcvuZP/d4ZNU7BR6lsLoFDsLiRT77bvwFyRQ3jfG7GGvPFiMXgM5Q0cZVoXG+iSyqrgZJ6pw6tOVO5Mq2Y+Sk4kjVtliZR2k71YeSuKkx6bK66FS/wrEdEWZozk9Peoh6cR1H0SjJKG+gyjaScVYV4oHPN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135498; c=relaxed/simple;
	bh=dA9w5cYqVEFj/cyAADWyuxfZfHcRIjXDTZ5b4w0V9fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTM000WaawvSSyatj/nxpQj1HF7cvODJBxRPVjKmC2anh2QZ7iDjdEmjF8sQLL4+N1wpnIojTNttRuMb4QLM8Qdd5roDTNLF+z2Wu9aN1jnpMVT6HJjWoG427LTSqFI1mzDLmAkAWMpULJ98Wn/mWqYTcbKZTUmajgdxLpYejTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckzVL5RH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e0d82d441bso55085935ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712135496; x=1712740296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hWxdEOmU4e6legIFUkyIF7zkRnOsSH8ACzlOjPdkh8=;
        b=ckzVL5RHpjOxGuQj1Ai93bcL7r6h+YFNegavq2gxk7p3i5qsenL64AqEC8F9ESD7ei
         3IvVJ7/Ik4mOwjrt/KTrL0ns2QWAJ2CWe2lC2I0EJID79MrOi+A/g0pSsXJZVq97CqLp
         50URucood7St101amjJe2LES2VlfPEUloNdswuTNY0BPbdaCY0zYM5S4dyELctQYSrip
         ubFoDQM/1XSSzx7QB0SnHuBPKTlH3yv21ktDz/QFruCPQs1qMV5h6shzPVvmzuU7W/UL
         HPx7TY4YfvDg91K1aV4zsjx45q7NBNnX2V1flf5dcWq60o5oCeQL2Ze7j5iHMyGSp2v6
         ryug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135496; x=1712740296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hWxdEOmU4e6legIFUkyIF7zkRnOsSH8ACzlOjPdkh8=;
        b=sS8ZXh0GXxRI19AKJyg6xfXM/ESsVFXhwXCuIwXcIpj4hj5N3AqtVnh2yEOeLh4tqs
         4KNjjEtVj/J0quhUpc6SvNw1btmLvRqSwasiQ7xQOOYaESIipdOwsggFiS2NfY7Kwlu4
         aE0yqyW0u94yflgLpjE7IwY+JB5i+n0aOFLeBQ/icD4YBXPjknuBIvpfFzxlEe7sYNpu
         cwXk+R2Mzoz0MbAWI0ocP+/8uQA8hO2n4mEcAyD5ODoCY/4nj+31v52JhHR3AdGytHe5
         nfceMJQThmk0lYWGloBtDAvbiHSiONTHByQGIlZmtr3G2WOteVL6p2FXH698BeF5INn8
         TTNw==
X-Gm-Message-State: AOJu0YwSVmwfRX97hyPhjbNagetHmH+eksTrpVHeo537IiAQo3mIWn1t
	pNXf6eh55tfo6m3SgeobpdaZrFSeSk6REoBAzq8mwelyCTWaRcPzpjZlucbQapA=
X-Google-Smtp-Source: AGHT+IEyWqFwLOjN3DoRlpo+4Cc/2ygcGvENqA9aW1FSgOsYovoVqqyZlsMxzOzAo8DY7Gr1mb6hXA==
X-Received: by 2002:a17:902:ba89:b0:1e0:1bb2:b38f with SMTP id k9-20020a170902ba8900b001e01bb2b38fmr1861834pls.59.1712135496335;
        Wed, 03 Apr 2024 02:11:36 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:11:35 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:00 +0800
Subject: [PATCH v3 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-4-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=1185;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Px8G3VT/pPMatEDJd8W5yLoDD+nxWLUBSZSRl+j+Bac=;
 b=GouXgYabwVWTVj3bHeksyAclYhr+CiBGfhejkhmQ72YqrJmdWZDRL9rczqXKkqVvK6U3n59oc
 Jop7S7F3ONhAPe9XAtU0TkJ5J1p3pJJ6BIpzfOAN3HGhKpSG0lzgNdq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 80ea4f1d8274..b0507a42ee6a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -886,7 +886,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
+	if (pkt_per_line > 4)
+		drm_warn(msm_host->dev, "pkt_per_line too big");
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;

-- 
2.34.1


