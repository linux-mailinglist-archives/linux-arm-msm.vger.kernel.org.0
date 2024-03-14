Return-Path: <linux-arm-msm+bounces-14067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A0587B603
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA012874C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0052B1113;
	Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avl1SMsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70474A15
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378648; cv=none; b=FDza6AOJqKDKB9toCKfvGmk7TOXTDvsGW62eo5GUAPYD7PrqikgmLTtwCJgEe2AgwPxL65t1KcwFxy1fFOzYKGTbtgBVTYrsowy6nWOE093LX1cMC7g/mAnj+WVE5eI0pyLGVas9P9AoZIpENHMyrryTM4sTt7/4C3NtkH5w64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378648; c=relaxed/simple;
	bh=mcoRDZpsdRWUc9CzNSaO1uzjelf+jpM6O+E6SIXUuPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GBRWUWRUzDvmqfFwIM1AcD97dwawf9G7ek376H7hWUI4bIIbaUdkGJSwuOov9w2JfOan37Ih1mAJ4Dyj0qGzRdhCyMmNYVix+I79mvz9burAglMZJ9HxE5RpWAmJ/zWDJ0F/X3PdUR6aNce1P9adtRSEgnBiGI8QiCbP9NOzm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avl1SMsx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d46c44dcc0so5139991fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378645; x=1710983445; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJyH63K/3kfz/t7TmUobgQSHCuwrTCRn+6jW9teKGDY=;
        b=avl1SMsxasmRooDRNUMA+iSoaDhj5XXaXJhiRpGO0bbFiu+uKWbQuGKLiFJpnnmdwV
         KMh7IpfcicTEkHbVvlRZeWa4ScXc1QPqFVV26MLWnmpTl/ZfA4f0YafZsmOjcNspYwjf
         qxoGlUMYcRoMuP/KpRG0KeIZF8p/SlZR3ZJcYNF114KPDzC0Z0qy8Vvbr66sRvZqawZb
         dfjBTfX6UuSA5IyXdDLyYO2dV1eVM7zt5YrmWH562fbYKojXvmhn4NKF9zb3mqzhivGE
         BDju8EuzORYanvzzD+Hkb5aSdaqy6DiS/GCzFoVxXZBM+mY7+9H1bzKTeN5oKlSyGZSP
         aagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378645; x=1710983445;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJyH63K/3kfz/t7TmUobgQSHCuwrTCRn+6jW9teKGDY=;
        b=eJSOF4q4ZlhThq7FGGdza0VpCwhkqwSPq/uw0x83G2f5XP93y7yDE1wlDKigum6rMh
         Doc1S6NTGfTtnYTZPrSZ/BjbACRQPhG2JxpAVTlXFaGDhauN/3k4L845wj/8P8VzoWoY
         B4ZPL7J/Xl0zwS8/MR15/Si98nexm8B+AHd2WYhpsg8GTrXxBhdYX+qWMpkt1BNbzzGz
         TYSnYdI5d6W49+aQz38v9h1I/Ymx4/RJaNsJJ9y7HhgvQujJ6fRIZD1wD9EWBvmEFtYY
         eLj3jwNQ7uhvHeMmzaibgDRRXLxBP2W2PmvDxmyST0N4W5BNNWkLYy9KSGtNYa4Sjby5
         W0Xw==
X-Gm-Message-State: AOJu0Yxk/M9a1NkQLORdGRDomqlvmMvpWcNOR062mZgRjvW4w9oUGOxB
	3iJEB738rhnPtkkeOM5jnubITO+ae6FlTlCgXoenPdlSseLnTXWPZE5RmtV3ecA=
X-Google-Smtp-Source: AGHT+IHNqyh4yHjx4f2lbz11ebvSoKS23d+YkWVSiV98SJzvaX38j7nrhbk5X0mfm3vdlYU9TCfASg==
X-Received: by 2002:a2e:a409:0:b0:2d2:3915:cfc4 with SMTP id p9-20020a2ea409000000b002d23915cfc4mr132809ljn.4.1710378644793;
        Wed, 13 Mar 2024 18:10:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/5] drm/msm/dpu: rework debugfs interface of
 dpu_core_perf
Date: Thu, 14 Mar 2024 03:10:40 +0200
Message-Id: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBO8mUC/x3MTQqAIBBA4avErBuolMKuEi2sxhoCk5F+QLp70
 vJbvJcgkjBF6IsEQhdHPnyGKguYN+tXQl6yoakaXala4xJODCQOhe5DdjSdm60xhibdQq6CkOP
 nPw7j+36H2rq9YQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mcoRDZpsdRWUc9CzNSaO1uzjelf+jpM6O+E6SIXUuPc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6S939S1AGBh+umrCI3yOyxFUeiuid7YfY9J
 eLvmg21yFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1WYIB/9eQm1HoYYH4yjNQBS3+epCQ27cMCuT+cnF/b3Ygyzw9AmJcywdSc6XIb0Ga/KCxabJ6i9
 lWxXehoAdlnOXS36njJa0QEMb+hlBWx/SX1MgVRJBmq9q923yNKX5QYDgHoSYk5KC3o0epp1nBs
 GuC3uDm5UZcFzxKuScDTSKS+zAYLowsch6Clj+2XXwiRyyHbw714/qO5LqdMIk6AP804rUVHFrr
 yg08sOItnWxqXfYXHR56uyb+zaKuh6trBbAnNQMbO9gzCh1muTENOtitnvv0BGWoOF1X1vH6oKd
 VXh/rvoTq6PbqUQjN0q0gK8baYFrGeki5oi9RKm9levz4zen
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (5):
      drm/msm/dpu: don't allow overriding data from catalog
      drm/msm/dpu: core_perf: extract bandwidth aggregation function
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      drm/msm/dpu: rework core_perf debugfs overrides
      drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 160 +++++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   2 -
 3 files changed, 44 insertions(+), 130 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


