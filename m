Return-Path: <linux-arm-msm+bounces-56276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D5CAA4CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2D19E169D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4CF264F9B;
	Wed, 30 Apr 2025 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCMNAmkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B63264F96
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018090; cv=none; b=TuUOUD/OJsCCGbfH+rhvuURZAzLv7RFumPWWAOiC+CNYG4cfe5B5Ko0f+TKHFdcj+Rou1vqs63qjL0yoZEpuL5ZQpy52prbxrcHXGDVX9+r9blhz0tuPt3xNGtK2xxgPGEghojQiVn0xnLXZo9U83974pyFntp3ZP9Ee0+jvKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018090; c=relaxed/simple;
	bh=G8kmX8Y5U2x/n9a8DLdAhPn2jAzN7EAn1Qe34LI7dH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCIMfcSzSB86i5Wj5c7W/4RBVDdM8RuUZip4WEOMCwHqBX/8dyH3XwsbE9Rlmj62W0AcNk+OZZCjWpb5QZs6r7Ljd9zQ+bVy98pazNDkQBy5szJEZz1HIW/+qj/gfy9LW+S8b1EVzyiS1qimwivLQpM95W/xhaQv/uRtFXtgPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCMNAmkZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cee550af2so5072965e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018087; x=1746622887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
        b=zCMNAmkZNgrSGgD24SOFGoq8HicBwh6dNleHRBEZ2eJ27oh7rSyBTqoeeZp9ICybn/
         jpAPsr6VFFBUbrarfZ3411E5eh2AvcDmGyk2wBtDtAbYq4fmZOu0+J46GSdLs3AUs/mC
         ZSHwni5vBi0jMMcKf5x+x/ZBSBTw9xqYSnWT2ojbRKwFWH6arSpx9wr+mnhH0AW6/Bax
         62VWB/O6lEkPbucBbajPoJgPaeLJdv2kcljmwSfvZMvbd0f4w6e0s2ZhSgaHDwpgP5up
         TySn1jkkAvkY1I1PirnISXr7tzX8FVc3CL62Ka2AOF6auZ7/qnJg8TGR4jJaZnzbHkBf
         5lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018087; x=1746622887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
        b=V4TcEbEMKDiFefXyK51seiWJGLLugYNslrdYYAii8qGZ9QLUgWSuQtf/NQl9/QUdfX
         afzW/e3nkwyo6b96XJz31dtb8nOaNuePhjUb0ED+vsB6XdsLoVnSuUBAuu7jzp7Rutmg
         EGM3jgOYaHVcDny73JlkTIsZpcOg4fC4KoCIVonDjfZ0MYf1/9qA+t01pBUvHgbjawwM
         UgGmFIViZfRcuUsUF+kvYTUdFFETNu2Wbt+pz8uO4BvwGgd2gGuMGn+AM1CANwOPm3VD
         xKm98HQei3kYaBAVLh+HCNXE684oMbpiI6jWwBZyZu6J8BSTHJZE4OTb16/npE2OawFJ
         B77w==
X-Gm-Message-State: AOJu0YzsyucGy5KnNltJFNp1JASEw/+lsiCJvXV4NRog9F359uRTcWn8
	175EHFuY3k01I5jL+VkJkyK+nCbjyOYWeK/o4/taQwy/NA/ScOaFjQj7tiIYpWQ=
X-Gm-Gg: ASbGncu17kb5B3uIRad1UcV3IeeFcteSh6xELmS9OKvOXuxYHvWNCx2qridPH5tt1hx
	YmciPcCix8gXgTscbnkgP4jEhhrGWm3xZsCI75l7JjLdrwSHWD4NwRkhXS+/tgR50gmzq9XUSne
	+fGuY1ajlCEqih82y01n0RvBsSuCVPUnaBRNQ72dXtZm+yp+TruU8gim1Bg7UY/7U+MGKG08WBs
	LQT4CRu1GUjlcG3jOQRENCaj904A5hrlvmPvcwLSwVGqIcHS2TYM9BCwHIPJ2RppeveLq2ePCHc
	FXLx8qVcrUiiBA7N2PcjpPyNa7tySOEcygi1sSeP1/+D+NsW8KGxXiCtYIg=
X-Google-Smtp-Source: AGHT+IFPVxwiNivZ++TjpjGT/qAxP8FXep/7/i0J8h9qywNJGxNKdY1zAQHo3HdDyksPAyOWHH3yvA==
X-Received: by 2002:a05:600c:c13:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-441b2dfb921mr8737165e9.8.1746018086893;
        Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:39 +0200
Subject: [PATCH v5 09/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-9-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G8kmX8Y5U2x/n9a8DLdAhPn2jAzN7EAn1Qe34LI7dH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh792Pz0KYs8YKt7eNeX9TYrgL/EYhGrTrub+
 fTICCKbYKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/QAKCRDBN2bmhouD
 15LbD/9Y8AOMIcZjZBqfuPxEhFacejPrHDDKuGuPISxVw+vzdzTLLAsrUqWP8kK55wYBJSssS7D
 4nM+atPnpj1bfCPwkQUfWH8U+Ymng8bArXT6NYxHHbiW3h7aOX8FB9BvOnzUloULBfvVHgMqxr8
 V23OHZE/6cmctYtCaASrioHqKAg6Gf/4QxTsWJ2JQx9HWIVJp99FeUdUpv8hvD2+YXCGGceFALI
 ABGlmc0CbViyM+Ce/d5qUkEcyOcnT+UD1QWRCOvlXPsa+XNNxfSsI8/z/+uJM9RE5k0wjGLfm7y
 /JYuIiiSf0N9lw+p/Yf36psCUEcG0dzM/tXvELj85XmxUJv2Dx3DA4hqRf2lcN+hTmag6wfsqVh
 E4pR90DsRfPzVfmkIyDWQiKGkkFcyIFkOlwMRrNn+qpOh44eT3TIvucC7HMtzGaQoY7A6Ok7gaZ
 0hRiQRCtKoQnT2P0vddJ9dIvPoyZhQUNr1qfTrCdEz9IDo1Jub3PWXvGMmq9mxpc7D76JJb+VKC
 Y9OOKxiAaMqppw4qaFl92Qn7TicvFA4RJws2csx0KbEFWdkGIn5jK8ECY/6Rkd0l3ciWTu7zYt8
 HpUolzVlchWGRLQT3v7e+8uFviK/0phNgQeA4R/bYuNEygiBs/oXCuHJO8isv6o2rouptS0tOHW
 cLMU7b5tUW64IBg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.45.2


