Return-Path: <linux-arm-msm+bounces-49627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42629A474CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3AB16F761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB032309B6;
	Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFZgYNSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96522FF24
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631086; cv=none; b=qHJ+flHEJS2wwxki9U+utIgjefgZh35fDT0fhWKKrsy3jy/uXNeZtVGXaRSEMiZGhX2tzYG9+PGwh/idWQnJlNWunj7vdKl7SrwslkzALRxLuDPVKVF/CPdqvhmEMf4Ri9iIXFZhg8Y2p6z7cvBrrM79+J+rYl5gHtgBclCDWsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631086; c=relaxed/simple;
	bh=YXqmUW/0eh8jEOcE7CvrKP8PjkOyelgn6yR8rLddqH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uykUJpHXvvCebWjirqui/ps90S139XsNK7fgJAqjf3JJSgw3ajkvyraX1+EKT4DQjGqFbJYOGLtFt62gGf8eQ+gu3Pi2KwOWrbUxgYzzGzYmtNBdp0TnX0hW+Pq7AfJPou7AfBV6PvcXcNEI8Pdumg8uSJcHrrzCAFBTOA4WR3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFZgYNSD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54843052bcdso419393e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631083; x=1741235883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mpbDw0Fet6YkuQYRz4hIjFDxEEh0ZsoMbrqLONn3kY=;
        b=UFZgYNSDBliPgZdMXKOosm2gUhY9ItPevMX0rTLqJvHymcWAPCJt358hc6G5x2b7vc
         57y1BSsrfNLkGbY/IUhd8E0Qnc2O5c9CLC7WzxSe+q4DlOD3fwcL74Cj7Y2w+OtWGHHH
         C7q9esHTgVONxV5vTJWGTZac5FIUMRbAV9vXMSk2vxbmBEsbwUCiNHdqzEPL92YqrZ0V
         5kdT9gg+0/wJdBit21PHpZvIZJMr8yHc/TMqkbTKB1dBq2WiM1JPec9ds45X3D+MbiZY
         /hkFA40KFiX1z6v84ZXV5m2sa0BOtLeTsp4XLRXR897zhpHl4h0RA3XRA+soeQ16y7c5
         6ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631083; x=1741235883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mpbDw0Fet6YkuQYRz4hIjFDxEEh0ZsoMbrqLONn3kY=;
        b=ALDvQwhkIbpT4JhGVvZAWVUnkJk9szPinOOF6MV3NoGbfjA3oierye6J77S+5wbPry
         scjxyKR8yzlers1HmfVJQVNlF1gsj892dnZ5xY8RSqfzIRTyMYiZ6QKxWrEA9J4sfMI2
         M1ngc1HkhZ0zuCvJS/EJ0YogsdsTpFQQg3m1x0KVlRToGr+9ighVN3kLsVnu1psOoVID
         oRaucXC6rxEezDFuORI+Ijg/mkapdu5nNiSny1fC4Iw+sNwcluOLIE7Y9tbKBxpMBXXR
         Jw2suGPRlQKDYclyPSGJg9pCH+7baz9xWEgauO4HDq58AUKNU3WwiKA/Bl3Hbc40qfT3
         YtEw==
X-Gm-Message-State: AOJu0YzUGm45oP11GLyF53jUNXA3VQXgGbQ5Le+JlaqfqM/8HferpgX6
	wM6k+iqfTLjx9PEhFDjTrXaC2WkBbh8/OmmEvJvRb+TsAFh58dRizL5wnpdwdbc=
X-Gm-Gg: ASbGncsv71bYQMJfMwCm1qNv7OWlpcEQYoP6DPstD144wTFSdcPDoc+Q8YIS12jlHBV
	TFaEpuv6gYA8Do+RhR7rKdxnPIKgu8qQITVOpdDHbWucYk+pVxnKJZiR8zD7llkFt/FPlhHcNvk
	iXuVxM2flRwoF+UULEFXeZhWzQOYnBJ0MuOWoopnmP6x9jwlgvqffM7jnef9cSXJJeA8HNTiXBj
	bl3UTWmUqNd95fGCZ2Q+xi30+lTyEc8EXJaxzDCDVDrkRd2glCOvz31V7zy8wyNinPTInkwE90H
	p8Y89U4GE+wGuM810iCSoUCjeXLBiNZl7AL9pSvHjw==
X-Google-Smtp-Source: AGHT+IFgxjAKrvkpIGrRkJYBcLkZa/TaKD/dJweGI7YYBbQ4EzNsK1UsZ/cS/Ce561pRPgFymoguLw==
X-Received: by 2002:a05:6512:3ca9:b0:546:2ff9:1539 with SMTP id 2adb3069b0e04-54851109cfcmr5718647e87.52.1740631082596;
        Wed, 26 Feb 2025 20:38:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:38:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Archit Taneja <architt@codeaurora.org>,
	Hai Li <hali@codeaurora.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Botka <martin.botka@somainline.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 0/3] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Thu, 27 Feb 2025 06:37:32 +0200
Message-Id: <174063096231.3733075.12359628764026922067.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
References: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Feb 2025 12:17:40 +0100, Marijn Suijten wrote:
> This series covers a step-up towards supporting the DUALPIPE DSC
> topology, also known as 2:2:2 topology (on active-CTL hardware).  It
> involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
> (on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
> panels at 120Hz) require two interfaces to transmit pixel data.
> 
> Enabling this topology will be hard(er) than downstream as hacking a
> layout type in DTS won't be describing the hardware, but "dynamically"
> determining it at runtime may pose some of a challenge that is left to a
> future series.  Such changes will also involve the 1:1:1 topology needed
> for constrained hardware like the Fairphone 5 on SC7280 with access to
> only one DSC encoder and thus ruled out of the current 2:2:1 topology.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dsi: Use existing per-interface slice count in DSC timing
      https://gitlab.freedesktop.org/lumag/msm/-/commit/14ad809ceb66
[2/3] drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      https://gitlab.freedesktop.org/lumag/msm/-/commit/660c396c98c0
[3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d245ce568929

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

