Return-Path: <linux-arm-msm+bounces-49630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500EA474DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1238B7A6043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5513223534A;
	Thu, 27 Feb 2025 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7jIgTty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F223496F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631093; cv=none; b=Ga2Z8z8ggZdJi2q9hcI5RM7ZmZMNwKeM1nOkKFocXl5SMHBGoyE78hTa3QD9//p6xAjE3Is/FdeEeUUvWFACOa0qu4NZUZJThz0TBMSPtUPwzq3uZcL2wbcHXcDNe+JX+0BJUS8rCP84Nnzi7VTszGi8QRi7zt0Xw9o4XHm9D4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631093; c=relaxed/simple;
	bh=Ib6ZO2EH/a8o5tLg5RHSx5Zf6q2a30HCMjUDr/LDIww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJYN2oqFWPkGedzFt7OVeWWwzLX394NLJ6HIDFFg6DX8lSZU0M4IvY9bbZuAHHOOun9GwTVCqIWp3XAuSy6ed2np6yxJTMF4YBrrMCf9yvKoifGjRf/vAN5qouyNGQOhb4Wlr+O6lYP2BeQtHIGqjqgpZu9DWkrn6yG9JsnEpCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7jIgTty; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54529e15643so1500083e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631090; x=1741235890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
        b=j7jIgTty4Ge8fc6Y27G+qumfhEJ4L4gCov1cvPgHnFSv6xfh1oqodqNoBEBH4NzUh3
         Ojt247UR43MCnEaM613INiLXEsUcrGYSFY65JaocbLMKcDuFh1o9Wh2YwT9/sOnCgaYo
         SG1K4AZJ76bgjo5Jnf9nyFKu3zP3VJedcBR5+mMQUEjmQtcnJ1QeYwJ+y1rnA4n6z7pW
         NSdtiDoBc+8xethd3DVdvAlFxn7/rkL03K3xXoJQ0XzdBEuEPzdSIVmRHvzinH3jW9+J
         zR7d4WzHr/PaqBloK9BWv1+KYyTFZ1ge+9GlwK88cV4LbwcBKQEzCX0BYhcMNlZVCSI2
         BZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631090; x=1741235890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
        b=ECpemp+sZqTfAzPiR4Lofkh4pmEP+LVCvt25+woAu5s0qUHX5ei8USrwzo2ahgaZh7
         ndU1piCMBnQdQqimoSbjoP77hHy5sg3+mTu3GwQOwKOSqlzIf9VbC2vtOMFwBw6c5u/6
         KtyQKFVFyBNh5qk6KGCkGaP2xV+Rb1IGy+TS61e3bvgLt2ge8QwptuNZWZUgfPo1ysqT
         59Fs+77eR7tdZ+fv6goQBmwrP7aHkhgmdtgVeypsOT58famNwWv/uN7nyKAnuphw9VsC
         ExBLdsgZIRfNI7ntd1+XEYa/TPqjEAlHCJoraAQxtYO4fIPOCnqJ/JcMoa6LqMQvRMOy
         HuTA==
X-Forwarded-Encrypted: i=1; AJvYcCUCmdD5QQECtKE1mpw5tkHh3h4DwRXfjf23hROTYEmumvxPchmn/BMNPk+UnZ6vk4knd12XYNI6xnvQFlBd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3U/+9Wq0Ol7ICV7iAIYkEEz3AX/23HPYRYeMXWEd27zIvIr1G
	tzDkrv8NvBgkZ97HXLaisnfWW2zwuIUuMLKrmOVzAaJ8sTajwNXHL8HQ+Bp3oYM=
X-Gm-Gg: ASbGncsvOti7FILP35gxoRKG11rqvMj5dZIrZfyyThIKRC2dFxAnN5kbEyDT9d/ycI+
	7ihfaMtZBsRhf1nwwfqtdTTgMI0R3Oh7ZmY/YIVsA6NOdqfynBQV9yajA3RkbM2zz/IFdaVb4iT
	jkZ2UkMQCHqUeTH0NoiPoIpscN0EOVUaX7yjURBVESBjH2KSVy38H7geCqJ7Ih04AfwLCn/lrBb
	UOJ+vUJDD9Q2xw2u7KQxUFNxd2KLSwYQist01kkJJb9hBs8uILf2VwyyuKnU8rnKINX724sctqj
	vNtJSst82Q4qoG1DsJYOqnVPztZJUE3JakBMFfyFtA==
X-Google-Smtp-Source: AGHT+IG4FmEa2E6Vnd3n6pmL4LIRNjCw5Yr6bPCVueD2ge1UqqUmi9/g9dZciGxkaPkoSh2/W32iag==
X-Received: by 2002:a05:6512:31d0:b0:545:240:55ba with SMTP id 2adb3069b0e04-549433167b7mr678503e87.26.1740631089878;
        Wed, 26 Feb 2025 20:38:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:38:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] drm/msm: add a display mmu fault handler
Date: Thu, 27 Feb 2025 06:37:35 +0200
Message-Id: <174063096226.3733075.7759942352504243411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 11:49:16 -0800, Jessica Zhang wrote:
> To debug display mmu faults, this series introduces a display fault
> handler similar to the gpu one.
> 
> This series has been tested on sc7280 chromebook by using triggering
> a smmu fault by forcing an incorrect stride on the planes.
> 

Applied, thanks!

[1/5] drm/msm: register a fault handler for display mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eabba31a839a
[2/5] drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f66f3cf6bc42
[3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c37d9f0b1a18
[4/5] drm/msm: switch msm_kms to use msm_iommu_disp_new()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/85bdbd8306d8
[5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/89839e69f615

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

