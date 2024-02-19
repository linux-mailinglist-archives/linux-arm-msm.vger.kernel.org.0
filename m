Return-Path: <linux-arm-msm+bounces-11673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85985A362
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BEA428373C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AE52E3EB;
	Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIfEtvp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AFC33CE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345853; cv=none; b=gOQsXIxhjqdHPPgd/YqfV0bvpNw/jnXAbvCb7yJ/wlxXWbGgBFhA9EYmXpxRD9VkfyA84inGmAxsxTtXuJ076pXSRYcCAztiJmkWlNf4CaFpLIS3gr9p9IfAipXCJ3OfF2DIRZjidB6ilr9RSoW1EbMp+bcyAP41isijTIHaJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345853; c=relaxed/simple;
	bh=CuFe6KHINp/3CQNC3AbGfuJTX3xZIk/Zpb92XyxjVg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdDWTPpfALRpMFGuIemkgApZGdNdEKvWKddbGNKz/r1hLfm9PsoVzZuitiIaN4jM6boPByUUZ08FG7UcJYj5+M8DWKaE/fLfTfn17xF12N/8pI/nJVoE/cCLtQJau86Z+J9Ar3s0DFTYTQtXMYNlwHN+Y65XzoIRvc0GUicgll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIfEtvp0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5112bd13a4fso5678860e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345850; x=1708950650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
        b=iIfEtvp0Dph29A0f4KMU1rA3R2TEdyqp/JGE1HyIRnDHQ277z1JkmdbiVMigEc9Avz
         uuxCKNoDNSVRlwAPXlfqdlLhQO7XYBBzd1/lfG+J79ZuIqOiWAYpH5+x0/6JSwoAB5Fs
         OMVaMbVgayIdLIK5WmZ2cZdTOj++p1sfWO22DAtRcmbQ6lWWwCl2z8kl84ttS5P35Wd3
         DAwB/BXcLgDXcg/NU+nXArl3bZnLhzgFBQkE3OZ+ibmlQ+PlPc998jHmfTvUmgSr/O1c
         DFpP8frxvBpOuNFdq7Bu0lnU7w3/maBATmVDZe0MNjYf9Z07UANiAVJj0zh/5T1tefRR
         z1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345850; x=1708950650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
        b=ffEG4k6U6ER5jS2V40TOrJ/I6+X060DG9uoZo2M2E7Ca3Noti1JfHO/ZDcupmq8g0l
         SyirckVIvohYrNXZtVBcIawPcGd4aEaDYa1Lm5UlL798rCIgRk51vilaWSnhxJNgOVi4
         GuZaHOOy8rSKUNA8setJ6Rebrvi3nfQGEnuiKu3BT0KdXAsig1UnOB109oV0sIljqp+j
         OSTwSmHkIS/YNfAajJJSfwkP/TeZPpEgoOm2RyVLAX6huEzlvK1Nig3vdDfQf5kmPZK1
         DVvbFClqEpbYzwBmHyJGkUUq3UqgmM+XtqmaFcLOJRHpnx0msPCp+5LQ+TWCWPIMYU/z
         hrjQ==
X-Gm-Message-State: AOJu0YxVUalxMAsgu1OLD74tmrjH5M+P4VF18ASLTjdCjxTe0928/RXE
	Srjsg/8Swe28+8S3mNP6T8tt2AMFL/K4jZ1JTWabG6ovFKabCSgQDQTywtE9w70=
X-Google-Smtp-Source: AGHT+IG4n9z+P4jhtHzfI5X+mxNuENsOtOdDiJUHwHqh4kGT2UQhJzmzdXFxjOh2c+QYHhltd7P3mA==
X-Received: by 2002:a05:6512:ba5:b0:512:9b12:bc47 with SMTP id b37-20020a0565120ba500b005129b12bc47mr3143954lfv.10.1708345850152;
        Mon, 19 Feb 2024 04:30:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
Date: Mon, 19 Feb 2024 14:30:37 +0200
Message-Id: <170834569502.2610898.13932222713163869175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
References: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Feb 2024 17:23:08 +0200, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b56d27ba157

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

