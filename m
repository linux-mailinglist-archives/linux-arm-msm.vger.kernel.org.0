Return-Path: <linux-arm-msm+bounces-24376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929E9199F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23DA11F2277F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D867F1940A2;
	Wed, 26 Jun 2024 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYJDGFtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C4192B95
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438367; cv=none; b=tUnaV4FBFj6c/zPYl84qCUPsQ6hlAyU/sTQIf5FOpVmaCmMW5RGYGm3sh6uaHyUPceI8+C5V0aDuGEBYZW9GZv/CNla6FVRvw/kQW6vql+AycJh1+gYsMKakgp5jflOtsiUC6xieWH6Pit98oa6xhH3DBIVUhAa/3tgrxY4qzYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438367; c=relaxed/simple;
	bh=rd6rtVl+hHZCsxkoS1jttFBofdxxaB/6oGLBYhRLsTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQLlMwRDHrj6oGAtWhXDyFcwqFlqxpDx/QHYNRd5/lkpQUk9V02iiAHuFFVnuFwLSPzv9W0D4n0JeODFIyaf+67LKt9oeLBVGiI4HaEHwNb3wAy0zT6lOJNiI3c4D9URGiEqrg2AKAPfb3EwBsLZ3vlT0tRHfIK1ut4csQEGeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kYJDGFtN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so55173981fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438364; x=1720043164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MqPF1YSYteLhHR2KPh28cADPGHqnda+8urMjgusU7M=;
        b=kYJDGFtNassu83Hs7DO5qzSvVMz8KDFnogQbBANNVQ5CWz71aquWfrirh3Xb0RbelU
         ugomrG/kADUw0jZQxSUgdM6+8k0YoT549b+lqFSIO9RRvuEkzcjZhz69znuNe7DPDNX6
         6BbKH8IibJovUaluvDBywpyOo3OUWUBqxinInmTGTKt9U6iJlo7cgTewV6b9eqawVDC2
         XkigRISSTVCFchhrO81Shitcm5QpH37pCsTcW20DXwKqMzi7yvE1AUXoOGrZH6GpDh9V
         xRUGRP1OS0fBts6rlZrdiNYp8jLcw5trtR9B1jxe6AR1Sht5G7CKZ3i+MTdfFmz1IvB8
         pPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438364; x=1720043164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MqPF1YSYteLhHR2KPh28cADPGHqnda+8urMjgusU7M=;
        b=jDQW5JPIOa+LGm+88uU3wXR27afWITXCpTpPge4rQhG1tJUatfgadFArUiLNnYGWUG
         SkSPpkhpnxSRM7Ij/RF++8IIvLZOkc24LKECRrRvCq76qONEnBQ+e7tBNpH5S1bu9LgB
         mvjig1TkT4iwlKrulKuFmnO7rmVMgPnsloJZngPPrUztUaOwVJNKOsfH8RiWc/04sPkr
         GNusoaRYIUSuzh6vqYudl2oxiPGkHpdh6c241zpGGxg5otHH34x386cXaWffxDJYFYUd
         nwquIof1xABsA4kr/bjPjoiNtzab7PrLlU2xVADXzMk22M/PEU6Hi2v2E86K0TxDCwSZ
         RG/A==
X-Gm-Message-State: AOJu0YzRIOsPutqq7Y8cRMfA0Li633D4VRRX2JVOAbY3078gafNlDacK
	90E0txemE3oZUHBx2lDhOGP3KjW4FEL1+TrTNJi5r/KB02PcL56xzZ3nsSpZJdE=
X-Google-Smtp-Source: AGHT+IFsc91/IO/fTqSX4VLlvtW+q7dKonkLjP7GXmQRnt4prEY7s1ukZS6fCiYVXXTDyX87FfE93A==
X-Received: by 2002:a2e:8607:0:b0:2eb:f31e:9e7b with SMTP id 38308e7fff4ca-2ec5b27d17emr70321151fa.14.1719438364504;
        Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:56 +0300
Subject: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rd6rtVl+hHZCsxkoS1jttFBofdxxaB/6oGLBYhRLsTY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj8SOSVKXAq3ffSztvBme8eexqPZkbnHG4rcuDVuDl
 +8Kvm/RyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpHGx/2ZNFo6eJid61DLn
 vLbf80OujWHGeVLlPXLmbbz9r5y8G59z9Ila6r07YSNX9P6X4tMrRo+NJU1Ery7+sN9pmxV/y2e
 ju1K7ki+aHvoVGd1y/lRCam39ti9MX3e2LhbbZzf3UXiVlfzTJMXYzX2rGyruCAXU/p5wLkRy69
 9X1/+F/lPU2Hq+UE/I8u8qxfNdKqtmna176qP6btmJy03r1/2ZdOnY/E+3Q7TjPFV8uuYLrLfy/
 lRZuulJ2ozyT/y8Do5H5BqvuVqI/jExss3YppKz3apC5PH5WF25Vb3TFTc8WZHbWnUwa2pmFVOF
 VLajCfsuab/N65m8fzVoHuR1eenntLTp0Hup5cWVvuWzAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

YUV formats require only CSC to be enabled. Even decimated formats
should not require scaler. Relax the requirement and don't check for the
scaler block while checking if YUV format can be enabled.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..148bd79bdcef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (MSM_FORMAT_IS_YUV(fmt) &&
-	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
-	     !pipe->sspp->cap->sblk->csc_blk.len)) {
+	    !pipe->sspp->cap->sblk->csc_blk.len) {
 		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
+				"plane doesn't have csc for yuv\n");
 		return -EINVAL;
 	}
 

-- 
2.39.2


