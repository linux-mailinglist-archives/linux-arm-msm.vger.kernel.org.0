Return-Path: <linux-arm-msm+bounces-19893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 824008C694C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 17:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18AAFB232BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 15:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AD85DF3B;
	Wed, 15 May 2024 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="yfULKCen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3515572C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715785748; cv=none; b=YeFoDsHUuClUfU087vJdxDG3u30PyKFSM7a3W7+Jcrh8g5JjYDMhBW0HnfW85o6qFXlWD1u1jrX3oqmKqemxzwsl3X3HffI09JSRejB3fIMAH+dPyi1MwR4Tiz3ixWW5iJvYh7jCgN3OVnJbh/YrHQDpv3/ElHdFLXuwonhM2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715785748; c=relaxed/simple;
	bh=pvdPZfrEgibRjfAqW+gowOMgQj6fcEJ3YCJpe5LN/t0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=FXkEI5nrREHoHNosU45J8kMtM40i3FhIpf3R+FAAWW7jANkLEmhKEFS9RfPVmuqFk4MfK7qiOpMse626fwKJF8WrGnnqRoiFJdvZ6NlVFv0FlFk1RO6rme5pCJGRILFkZI0COvhzYPg0DRKKDV726wiasmOaVziG5xoqALB0ma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=yfULKCen; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34de61b7ca4so4863619f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715785744; x=1716390544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flkhhsssIkeF8ctxoVaXxvbj2CjTJSXnEi2RVgoyGI8=;
        b=yfULKCenFsElHIBn57loeb1VDmj8EwzVBUf2CvXHKOOBYn8JuS3KCEW8r8t4PbGXOx
         v6mY7+LJoVX6B/jRlCn8gmJWwuIdYQHOIbcXV5LpgT4ZRe5mJGTIc0Cbys9MlmsU1oIN
         d90XrkbrJLOWJHJcoTB5cdB9jW3CNGZoToJ5qPZb4zd8jQAy8N9I+rhh2pTyvVwdWxVb
         Sc6JfeE718O0oJcB/5vnJdQkpAs0DFy7Y4AIw3cGO6kS55iONpw1zbrIOr5YewUh9MqC
         dYeRxWD0wK1i01cssgf2v5kfvxaJH+bh43pSMpnyBmplRYg/zxithLOyerVw34gE91u6
         tihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715785744; x=1716390544;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flkhhsssIkeF8ctxoVaXxvbj2CjTJSXnEi2RVgoyGI8=;
        b=wP7NBih1jTFfa+Wt1G73vDpC4h5UJ250hEeEB3BYQhRAslyEGmQFz4VhSJG6AqEnIv
         5V0m8I2KKp/0j3qyYh44ZxUTW3hkAJge7NoNccPjvqThrli+ZsrMKpxx5w7qaVwqoBHy
         VV1OgmQxgigUuT6je9eZRzUiG8prbhY+TnC0age1vACrc391w14CKT9SkSTSQLjRqqPL
         I6RWY7EFPyXYxD/2vLbx03slzXNpG8GQmUy29T/21Kr4k1TWupbGb5e8rkL2ImyMQH8Z
         o/Dw9pA9zffaRdKDysrrHTx5TPFvzY9fVbBT3pudjBx39TBo9CVvPOaVwCaT5RSymFqN
         fXcA==
X-Gm-Message-State: AOJu0Yz88pWy6xwLATbECjWX77DGrB2Yo22WXoC7FuX9pGp3+4ZarGm/
	EDS+QJBlG0Q0ke99L6WSp0OXfrfXQs7Ikr1fm+337yT9WCkidPOJAvDmMkfgVg0=
X-Google-Smtp-Source: AGHT+IEm3wINvRmGEYt2yq6uqsVqBP1IBFUf0xbpVPvkLnzsP5iGlYaRsLTFk8FiXtOME0dEy9OuDQ==
X-Received: by 2002:adf:eb87:0:b0:34c:94e7:73e3 with SMTP id ffacd0b85a97d-3504a9560ffmr17646508f8f.53.1715785743773;
        Wed, 15 May 2024 08:09:03 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d? ([2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351b4af0b0asm10146837f8f.100.2024.05.15.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 08:09:03 -0700 (PDT)
Message-ID: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
Date: Wed, 15 May 2024 17:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When create_address_space() fails (e.g. when smmu node is disabled)
msm_gpu_init() silently fails:

msm_dpu c901000.display-controller: failed to load adreno gpu
msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19

Log create_address_space() failure.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d5..f1e692866cc38 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
 	else if (IS_ERR(gpu->aspace)) {
 		ret = PTR_ERR(gpu->aspace);
+		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);
 		goto fail;
 	}
 
-- 
2.34.1


