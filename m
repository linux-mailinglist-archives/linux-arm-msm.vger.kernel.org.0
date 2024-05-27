Return-Path: <linux-arm-msm+bounces-20633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDB8D04D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 16:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FDB1C21187
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B8D16F8F6;
	Mon, 27 May 2024 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="geZBSPNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FCB16F8F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819848; cv=none; b=OlcUMFOygMw7108jjlE+odIm1OthvEjJ1/yFfigiH1YtL+QWf5XktOVwGqiIBSesF0o3wYWV6w8hE9pLC9nqu3xusRMeEtTUFc+HKtE0sBY9JW9cGXndSYNB3T1UzyZFPF5LiMAp/vBEAORzaBTtuT290Z+3Vn9qfclwHyDfpdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819848; c=relaxed/simple;
	bh=OWccy+nICEZUKQPwByjtML13iQY9e7N6XueMvybRfeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6B0MVOsrRYytI1q3WYUQ5cnzmQJgXwANZzMw5Mq5n5p8l0wYWa2BgMb1pmtktXTKsxMhgyY+GEkPOvNrboqNxueE+MfX7i1MvUUusdk2gOL3HsITkXqrEdzKbEeLsmW+QGVqi7DXhTPQqNeufkOkKgc1A0guqVAv22OPQfFlkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=geZBSPNM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f966840af7so2594142b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716819846; x=1717424646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
        b=geZBSPNM0L7z+LF+w4vMu3B3WY7AF2PO+By/1Ifp0qgg5iN1245+kM7nXmhoFleiKm
         Vpz8hEfwz4jho/HtEwTstgSK9WIPsZGUI1Tg1xYdKh23/zThArvtorBrWBgrp5DfizE/
         s/O6Fv263DlWJgmyiQvlSfAWiGs4DUsV5c9WMYmeUgABxabXobrfVER4lw7CMcuj5POc
         rPGcwoJNC/T5ZSxQLIG8W7d0zmU5DdNxbA4HiDdwJ+bqX9M3JbMbefitjNtbR44WuLYP
         x+6DMVu/TTt7tgAkovfXB7lLJx2jCklNtC2o9sS0wRM0z1oVgSfL0YHWUxWFpr0ZRgYu
         E0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819846; x=1717424646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7t4uYmRqlJLrpJDiHKBdOulRnB5HHZ6HHejKDBAJ1A=;
        b=NpmibkpRdBc9WSf17VNrDb/vcoTPyWu5957k/GSBO9UDo3UU8aUcObqENkH8jbSmDF
         mIh8y5iSVu0lYhFSEzBQi2T/sJ3up6xVtu2+BGQI2nI56RABvlszWLqgabpW0a/ooHZH
         2+KVcC/h1GgF7DTdBD/VSQSMUrAJoUahTkCT8b1AmC1fX4Qy/XkdCVRtCRa/MXY/+iqa
         at3HgwJq1gAZILmeVY+zecxvgD/kqk+plS9R/2wZZL7nC2064Txzh8rOs9Ed6QHLOP+e
         BnOIRBq8ldmVB2CeEcTVG0g4GcCRKR96qfalYmnOe/w1Ayo36AQ8gWinrTFP+ubap/Bj
         c+zg==
X-Gm-Message-State: AOJu0YynqSzpZgtkb5hKEMcVdIGCeaVS66UB35jFH+18u1XRk8tKo59N
	/dsROm4+8GyCGhA/SzTkVlw11bVHJp+duBUGw+9wDXg/vSmuVWZPE6qgtrmlf+8=
X-Google-Smtp-Source: AGHT+IHJ7Gus1KojOvbGG4MRVvDnQ0USYq7JfPcmCETBzGI3IuW+o9e/WGNMRkZQQAcHSiH5qpRc+Q==
X-Received: by 2002:a05:6a20:5612:b0:1b0:24e7:5a35 with SMTP id adf61e73a8af0-1b212e5273emr8026076637.56.1716819846219;
        Mon, 27 May 2024 07:24:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:24:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:52 +0800
Subject: [PATCH v5 6/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-6-f797ffba4682@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1190;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hsA6cTh9A+abQ7dtFiITzQof1AHhT8P4eUkFfENrPaA=;
 b=DmbDrlVs3esyebwnhCPWbFsy+3uwdGxILFetgc/uTTqgEnXQ4scfPZdp9cpq2OPCVEMiCYALa
 kYkngMR3pH8CTp6Ev9lolCotIye0Vm+rDHwrPIy1FkaaCunqMdtsjC0
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
index 7252d36687e6..4768cff08381 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -885,7 +885,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
+	if (pkt_per_line > 4)
+		drm_warn_once(msm_host->dev, "pkt_per_line too big");
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;

-- 
2.34.1


