Return-Path: <linux-arm-msm+bounces-49789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CFA4902D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EB61892BD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C0C1BC09F;
	Fri, 28 Feb 2025 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRok49+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3471B041F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716065; cv=none; b=jBYD0Fuw41gbpgI5gQ+bKCQyEEk0pExwBpCbctFrQM2MA23bYIoeg1uQMHacZW63Mzv3sGiW9fSibXfcDXnjwulQDABXd+wS+O6KId6Q+RyVyQ6SmLb5GEZJ+GTuYG9vXq7JRSiEM46l4v/LCe/ocbmMYs1s8Gyd9Yoz0UF9gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716065; c=relaxed/simple;
	bh=GhhCZJjEajy0jFOjY9R54kVOCzIOaWWu2XrVcVmmfhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0HWgE4xCx6Vd1B5PbWT+CJ+fXI8rvI8NWNuiJegS7s5di8HYX00ioF+8BhfBXyyZQu3oVwT8a2yuM9X/ERb4+Vllt7OiTBSsor9bHbHZHWA7cYloLPOK8/1T0jufDrGjK2Op4uFS/gXl/uexp011GT47hAWA1KTP/XCJ8UVnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRok49+7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54943bb8006so1723655e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716060; x=1741320860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlvs3krFui5VM4RI+RTWfvb2I0najIuzQ1OGaYdSCdA=;
        b=pRok49+7H8OF5oxlOpXg2skncqCNCTPs2FpgMyCIP2zqOHoAwL90Le8rtAvV7n2Ru4
         Bxq36MtWC8Ei1F06OPVuRIPaub3tsufv4hRcZQ1tif0FvxnkOEZvpC9IRm5yX62ZZKDq
         bnSaOXZE2dD5wJ8qH6IXHWsYx7uWkTRFsfMKwgcut5TjmUbY++Imy0ZkUB3zWZN46qNX
         rvUBA3TX6/FDHY3rWiLr/qb34PGHd4LrDapLn1QEnm2A7/VhARdCujqfTKFhe7viNv8O
         6cqKHEMjWEQ/X11OSpWiR0wkOHzfwgjcNHtoh50kSg2Sx8JzA542yDyyUpItSv83OgTL
         nY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716060; x=1741320860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlvs3krFui5VM4RI+RTWfvb2I0najIuzQ1OGaYdSCdA=;
        b=sVpmM4WOeziNts+e9sLACn0608xJnuFWh99qDWlE9Sl0m6QYJFTZiuQbmcH91Nmpab
         NOrlACzYxVYH7Yu6kjmDc3Eky49+1kqoo8y/9+vBVLAqPUx9Gc2Ihp4ygtpqrmwY3N2c
         8MM7BeCf3+Mn/zYQrSUgMz4sfeZXao9pBoNIdk7mnCMijlwlU6gEMdu4WZk6SOhdfUjE
         yzeZng/0MmBnDHyuzekRbcejEqkgSKxrcHHj38ivbBo3Y5VUyDVVBHr8iQQTpaMfq87Q
         fjEF/0lbsSP2g3rr/Vv5iIm61zX/SiYJ/+7xlygzMwqCLlvCejzqCCAgLuhuqSygiU/9
         sFUA==
X-Gm-Message-State: AOJu0YwpB1EHqQix0WwGyM0vDTpdwkWOtzwXnJMH2WD/kgQJpJev8kgv
	S4zKWqsopLdIhN323p4e17EHqQxcaj5wp5sVaOxmg/zY76N1LgWlzCdwPVb+vjg=
X-Gm-Gg: ASbGncsZokMhWYx+4uURfyD/YRpim3dEOziECBTF9SsKdD29yO6Z/Es8DfOOODAdOoC
	R26JjrEXVoXOtfYsnTFqa5o/JmlWAmM8awIPzVsR3n81z6Z6N/Wa/EiuahqgIBtOn0bHIEf/nIi
	2+S+XWh/oRgFFpzPznk47E7GMttwJ36rHW4Am80qenUdtFyV7jS/hifuQB9zSuuFT/X7amJGGNv
	JKrtu2JlvrrvgdJzzHIimmSQH2nGSbb20Sz+lihCkKnBZmGXzZTa/+Rgudy6Y+AAyQMDZT6zxRM
	8qu22LU/7Ntpd+BPsrA2g/4jboioHm2kgg==
X-Google-Smtp-Source: AGHT+IGrnEWMPE2WkcbT7JIvexF88rB0I+CKgbkhNnFe45kc4J3u2IM/i+GrBzAjghv03i/XJfxOOA==
X-Received: by 2002:a05:6512:3d19:b0:544:e61:a1f1 with SMTP id 2adb3069b0e04-5494c11a280mr714153e87.14.1740716060111;
        Thu, 27 Feb 2025 20:14:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:08 +0200
Subject: [PATCH v2 4/8] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-4-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GhhCZJjEajy0jFOjY9R54kVOCzIOaWWu2XrVcVmmfhQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgO3RF6v4/ky5eEIRQSKeqiOSPOMFzE4bKwP
 7MT1jG0WbSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1T/vB/0Wymc/HhBvJljvIgyIsJdh3NY6aNpzKXKMO+cdPwVsVqJkFWOoTCpDCbEllSIJv/TrwyK
 WnWQr9oOj0lTApx3SG/Of/mzx9UBElIAhdwyjiY3oM/fkG94DGyrhD6xmyjbS4O2GOY+5QlJQkN
 vVTgDQGjqKD/L8hzGzztmeVG734r9jCkB9iFgm4vJ3ktwPNfuaUjrID44OT0gEyAcbrkgu+mgKO
 6Culz7HEx40OG9eOecbTfYuaAQh5QI8agbkpVzh5HLjJPVYH9sRGA4H5cghPbPnxNQFJe0tczyJ
 T5fIyQQiSunfcEflM1qHEgna8v1MdyyQHqUUMaCplzmV/w9Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On DPU >= 5.0 CTL blocks were reworked in order to support using a
single CTL for all outputs. In preparation of reworking the RM code to
return single CTL make sure that dpu_encoder can cope with that.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 32992e9525530ea4dec2f46643fc06d40d3bca7b..e7dad94d91a7b6e99adb9aadb48aa8cd164babfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1288,7 +1288,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		/* Use first (and only) CTL if active CTLs are supported */
+		if (num_ctl == 1)
+			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
+		else
+			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
 		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);

-- 
2.39.5


