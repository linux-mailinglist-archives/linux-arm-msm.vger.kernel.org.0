Return-Path: <linux-arm-msm+bounces-36806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE189B9BCB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 02:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A028C1C20CA3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 01:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F95820311;
	Sat,  2 Nov 2024 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcztG1ET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801F18E2A
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 01:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509697; cv=none; b=J5zYi3bpDfHeFlaU9ox3068RnCbrZRQhku5z5z+UjFx5mGVfXTUyY88wsG1vlexj1wLOJH145NXdbN52znwCYH1zwyrzE9XQjz95mH15wpjAugjyymtaGc0cCNqL18ECR/w5qG4rONhrXDRtYF7+Rsav8FgMnXxoYPLefphHtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509697; c=relaxed/simple;
	bh=SM0OkiIvX9DV0zqzqtbOMacYN0x9bMHIMUlDZ4XBF7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2UxuF0NbQUDQ7E8H93J+z0xRsEHLSec++mCtO6nJrmmbYn4tICe/Bnup6wwL1hqmU+SddXdmaNHfHPwu9T+PGpVypQ2wOYq5TZCrVW9V5F8UViE+9Tp6CIzeUhTexUUxE3Jg6jHlCm69bvEGdKWrjXTznBNASx5ekCF3J7ImfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcztG1ET; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe76e802so3089845e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730509694; x=1731114494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNi7KL5oTvSaRVd2CVSk0POLJY7+DXarGDd2A7rzOBY=;
        b=BcztG1ET1VlV0KzWSvJHMnn/PblM0SFycdrm2qoGe5hRJE6qGNuy0eZXGJna2JOrqe
         3fZkxy6M4luZuMO+FWCFcX1U8DR25HQDcNc0/cGVhn7V5iFDV3L4UL6idKwRAOGtwNI/
         AwJL69P0mWAl9qgittgXOv7sqZZfjYOqtz7kd65oVAcyHU4XYFwJtx8+4ghIOqYc2SIS
         WI8WDod3/5nrluMB4SQwvbHcZKEMcfiAY9GbFN8S90T0WuFd4RGTaAOVbV5Z3s/dpPrU
         g587u2z4y9ovHXh8GMSObEh6QMbjj3fK1BMdtIev3eECIT/tipdDeub7+YN8OEX9c28v
         jqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509694; x=1731114494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNi7KL5oTvSaRVd2CVSk0POLJY7+DXarGDd2A7rzOBY=;
        b=sLrzS3FunFGMRqXBLDDjGTdc5k1tLB2Qf86ccVcXrh0vY/au3Lrpcs/hVtYfb1UoiK
         dnsY3oJos/wtl5ZDyrcj/y/glvEyH8rK8HiilOjiL5hv1DKLxpyglrSzn7QIpYO3c/8C
         qTVuG7yMd5eV2gD5s72ai/UEAYt2LNSlRc5GnH6D5i5LLdq+06dSgGSEpExN6QRNEXPD
         O9xpKdnSkQPnVOL1hDpNqn+xYSOthpqHTmiuhtTG8gvGMzoIJg+gzpgjV0miBBi0Zt8C
         NISLedtFGOF/g2Igfy6MFYH11TUJG98arSBsfOztxcqEejoHrQ8rWU7SX2+ciGzUMMhU
         u7sA==
X-Forwarded-Encrypted: i=1; AJvYcCXmpT0RSCRG/MPJnGgboSaLMvmIdTAJsAu+Z1lRV4ienO2mshw4rKyck11KsVBsE4R7atQkWOe3KlHR9LVL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NbIVClTsW5K0irGLnogVuyYSfVuJ6qfOKpwmn0umZE/UR13Z
	ZjwbBnybfmht7hmrkvL9KKOsXeVOnnwPINK4wR5tUNxmfUzVsrsJSwAKLJmHuDw=
X-Google-Smtp-Source: AGHT+IHM740K9855r2HwwbYCwldEiJj9hjIN3g4eSOoQ52s3xQKsJW/CUnRxXysFTMeDEvNAcLKIsg==
X-Received: by 2002:a05:6512:b98:b0:533:43e2:6ac4 with SMTP id 2adb3069b0e04-53d65e1730cmr2518003e87.49.1730509693778;
        Fri, 01 Nov 2024 18:08:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce6b5sm718678e87.122.2024.11.01.18.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:08:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/msm/mdss: rework UBWC registers programming
Date: Sat,  2 Nov 2024 03:08:09 +0200
Message-Id: <173050960724.2285086.13238539859529430953.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Sep 2024 11:17:28 +0300, Dmitry Baryshkov wrote:
> Current way of programming of the UBWC-related registers has been
> inherited from vendor's drivers. The ubwc_static was supposed to contain
> raw data to be programmed to the hardware, but was later repurposed to
> define of the bits. As it can be seen by the commit 3e30296b374a
> ("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
> gets out of sync.
> 
> [...]

Applied, thanks!

[1/4] drm/msm: move MDSS registers to separate header file
      https://gitlab.freedesktop.org/lumag/msm/-/commit/92de8137d619
[2/4] drm/msm/mdss: use register definitions instead of hand-coding them
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d742f7e06840

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

