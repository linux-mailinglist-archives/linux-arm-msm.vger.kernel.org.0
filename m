Return-Path: <linux-arm-msm+bounces-20399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E48CE607
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1CE6281695
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DB5128376;
	Fri, 24 May 2024 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZonWxfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A4486AFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556800; cv=none; b=mGQb9xLQQNKy+Z5qSK6zFjBpBhWuULrta2vf8j5SuM5a6/TyY9dBhbq9UU9zWmPL4pERep1j2OzKrDxvg2uHTJ7KyG5p4Psvhg7X97pdmwPXNBFDAzf2RhsX3ydj0ROSavZiD3xW4e7W1eWRUd3XlDSRqZqwzVgW8f1dTQeQoPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556800; c=relaxed/simple;
	bh=SCnJNIycjKCOU6+DbbjFa7Anywkc1It7tnIXU4WQ6yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGoWWEt3HKWcBNxsv/X1R6clp40oNLdAnEuRGtfRLwN30b+4bKLGGW0UHx2pjBb72pmEtjqlxHzmqfIBPoKqausDkF0O60TCNFldpVpBo8Y2ly7dKdSagSTQMviNqUhz/x1BKICD6x4z3BO9jinhURlRaA4+BpvJT6kAd+wKyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZonWxfb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f693306b7cso3820480b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716556798; x=1717161598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhL1+y0kIDyt6L6HzzdKzEkTEMOaNifsp3D2+XHrbto=;
        b=wZonWxfbanUbP5R/j/A0E/+Szjpw8JjVCWYnROa703BLjkBzVng2Wjubq13ngD1Hwk
         Oy/qcoLpPKhxSODjORfPkVBKeZ55QnhN8YE/I+TNRDHXPZrfa+neJ3nqMlmKXK7kLz3H
         KIOE+OhhyNP+dnnElhel+gkdkKnFBNLWIlrOpo/hS0wW1ADjj2NeVEk0FAyLFC/9AjAp
         D3xkQNhOp4mrgTCuGs4d08jkLmDdtjR/6cZHmX6SPCC+Lzj0Eihrx4MNTSEZgGCkS1gd
         S7nWhkavXzjIc2Rqi0azMkbiyDEi8/ybE+VOouHfeFsFUNTCdxyBJinHIYWObyj1BNpD
         sSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556798; x=1717161598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhL1+y0kIDyt6L6HzzdKzEkTEMOaNifsp3D2+XHrbto=;
        b=ZFwPEtaOtbBOYX9vHoPaYRON529rrb3+76YBq2h8j7WCjSZpzIYjxoB6UKtVn86UN0
         SsbcFR2xZsPrFjj9DR9ZkSUUaS/OolfA5lxurKPj43faY2SPbMRR/kAi4cR1aRWD4GuZ
         RcNfipHQoNepLLqv6124DPEoKZ7xqYiLy+5OaHEWw4iRkd3luHJpZsjpdc2iJdiBqH3l
         nJv2crloBn0NOwEvp51fN5dmS4Pnp+3WEFzWNkWvyFAMETpKv5NRt4Kx0ZE/tmaMc78H
         2XmasiEUccemweY2pfqX1Z0fLpVBR8Uwkwl2V544WmWLkeST54+ABUGdY/DnUCvrwmXy
         ixKw==
X-Gm-Message-State: AOJu0Yy1VuftKN6VaHWOoh9A+IbEmRLR+BxnVxR/c0DzPczGHFDaEeZe
	7VBOzLia1u++tLJAOPOk79UCCQ7qZ3kbp+y1Rc9BJ7rOYdOwMrNrLlh0wEUZz54=
X-Google-Smtp-Source: AGHT+IGYLRLvRCV0D84/IopEephkJQILPn2RZgOVI7Q2aoXRtKdZHxZWVGFZ6JlmgNMpYIqoXVs6Og==
X-Received: by 2002:a05:6a00:1c83:b0:6f8:de0e:cdbb with SMTP id d2e1a72fcca58-6f8f33b05d3mr2189694b3a.13.1716556797922;
        Fri, 24 May 2024 06:19:57 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 06:19:57 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:22 +0800
Subject: [PATCH v4 2/5] drm: adjust data width for widen bus case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-2-e61c05b403df@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1081;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SCnJNIycjKCOU6+DbbjFa7Anywkc1It7tnIXU4WQ6yg=;
 b=sEk66AQRqgPYNGk32xeRrchV7uu3ZrAvWWbJGODk/QYBOrByjanPmW9jI9kFbdWwYSIY0ltA5
 ap1NVCxK4ZmC3cS20S2Fl9I7yKwSQ/K71lMWsa7FlqkOWVPHREINtdu
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

data is valid for only half the active window if widebus
is enabled

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 2cf1f8c116b5..3d1bc8fa4ca2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	/*
+	 * If widebus is enabled, data is valid for only half the active window
+	 * since the data rate is doubled in this mode. But for the compression
+	 * mode in DP case, the p->width is already adjusted in
+	 * drm_mode_to_intf_timing_params()
+	 */
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf)

-- 
2.34.1


