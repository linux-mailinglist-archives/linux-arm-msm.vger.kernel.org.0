Return-Path: <linux-arm-msm+bounces-47737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59FA323E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BEC3A72B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1B9209F43;
	Wed, 12 Feb 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nE8qgmOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9604209F22
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357476; cv=none; b=JIbTFL/bK1eamKqBxphbqtdy38QwQBOmDp7XmlI4uzz9S/OK8jJZQI7F3u/Ojen0TW6mWDYYBiTD3qlv7Ba9HVOp/Jn5zODp7VxwaBtSHK5ZpVr+3DlFpNlFhiOt5haJq5mEj3a/RAMbAUp6tV0FB3YQkbUGf/NO+1U+IFVAQ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357476; c=relaxed/simple;
	bh=icla1TpQOFmiFDBsQYkHvOp8ZGI082xL7fkqAzRQ030=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6tin1kTHPCQ1VwH6mkVK2IyoNRR3ypiv19myjJvCt1XgfE30NNZ/jaxCLodj0IkOYL17DNiXDYecd/Pk88R2h+6+aKfys50TMSqGrSmxZZoJ5yCnPVsZ35aTa+t2NsRvswPBlUgwqXQotlUGPyn/C+b7I6nMQXuhUHXJvkW2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nE8qgmOA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a6bso69755521fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739357473; x=1739962273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
        b=nE8qgmOAFXm+Ud60sknh92LhhiT4ndc9McaU/62bJiI7mRBZEk6nn4YBOcOumBXjke
         MUt6UCIFoLXjqbufYFxJdHUAcznjA+IdqZmUHMOYQhK5AYxfKAI2yZm+xA980s+O48G/
         /xywndHQQJyqMI1oT7Izx32SUJDqATLnnInVH7M5VOI0Rzw/Olq7/geZW1tsogAOlrkR
         UPyRlPpyn2slHHkgB4w8Xlp5KkYZSJWuKncLqQDA9g9sQ6jCFrmjI7johs12gxfRMSzQ
         Jxi+Qw/g3kSxV0FSTvwK6kv172ZMczPmhn02DXZLF2Cs6gVX8gWakzHsAh5KscZ2seX3
         b+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739357473; x=1739962273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
        b=dBz49Ran3WznXqDq1BoBiWTTUUnljGDykhhYWmbcLQwC/0xr1PJyM3I9vfgNiQEt39
         jr9fwKoRjf+F00OswadKnkeXjlvl+Riu1Hyyq567eR6FcjKOxnRCHcO7UAJTn17uUrz2
         Ff2jEXH6JeqhJoN77agI4tHrLUboZYlhEoY4wcT8RB5MIYUhe5pALM/muM6lxHIVPeSg
         Y1gPiqeNgVMa8Agbz8dJpn+TZdV0Jc+d0LO8oXxnqbbNdFAqv5AdRVyYr/T3dKix+DUD
         7xdYP+iv80dIQ1MuiKzBQwKEPoRfXYmi5eTjChmcg+rM1G03Fluy7H9d/np6sT6NMjih
         KRPg==
X-Forwarded-Encrypted: i=1; AJvYcCUNZbW8aG/fnBnxCx6vCkVpaRufEGWQFWTOZteJClBwrLcipsQU7rl7hVi4S6tz6xCF6znDLQtJ5z79EwrD@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWpSy3s+DMzUHCYA52SBEGrmgOYsx2ujBn211Nbm6mH0fcx9c
	t6SX/0wXiCSL23D5bKtbx5ZrGM94uRE/tlYFfpj1zJe50pTkkaKiiFHz1/c6Me4=
X-Gm-Gg: ASbGncth1GT2A/CCnz4N/kwAE2vlWk7ocMNBU9qzvEaAtMT385VWhxcIsqv6dxDGQDF
	gb+pIwtRRcqjOPBb6/1fcQY5FES6BiVRylIYfGewLaPjzKVmJfM876j1krq1ztJnH/KtqNDkuG0
	xHDAVfDGa8YSphrrsKh9pf9ThWEg4Mqv2g+19Ytz7P3ohkEh8XGpOrTuG8hWlNmpvd9OlV/ShiV
	6h/hVfkQNqKNCZDPSIZxY/Nnw6AdPjU1P2PQMWg6g4a1OGJKdnxcQYofNM3gxEfe7db7AGEYWaN
	4lubKCmQ7qD59F/GCAab9h78COgcOdwGMmIeTjbq1BhDh+g1z6TtUKBpYcFHExzY5yTwgtQ=
X-Google-Smtp-Source: AGHT+IEDzcPRrcce5UnawSDEarFr9+DzePDbU8ly6wk16sOl8kdhRUbYe8aGObQlOg8I3bS4B63NyQ==
X-Received: by 2002:a05:6512:3155:b0:545:10e1:b1c9 with SMTP id 2adb3069b0e04-545180ef774mr625448e87.20.1739357472850;
        Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545166da063sm353803e87.77.2025.02.12.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Date: Wed, 12 Feb 2025 12:51:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <iwr7hcavp43u2yoif5fefd7y3q3rlfx73gxdyfotfuz5s2jalo@kzyt4kotpawh>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>

On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
> This series of patches introduces how to enable MST functionality on
> the qcs8300 platform.

> The qcs8300 platform uses dpu_8_4 hardware, which
> is the same as the sa8775p, but it only has one DPU. So it only has one
> DP0 controller, supporting 4-stream MST.

This is irrelevant, unless you want to point out something else.

> This patch only enables 
> 2-stream MST, using intf0 and intf3. The first and second patches are
> modifications to the correspond dt-bindings, third patch is the dp 
> controller driver after not reuse sm8650, fourth patch is the qcs8300
> dts modification which add the clk support for stream 1.

This is obvious. Really. Instead you must explain why QCS8300 isn't
compatible with SM8650. How many streams are supported by the SM8650?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> 

Please don't patches against series which were requested to be changed
singificantly. Don't spam mailing lists just to be able to 'FROMLIST'
them. Instead work with Abhinav to get this patchset integrated into his
next iteration of the series.

> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>       dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>       drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>       arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
> 
>  .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>  4 files changed, 25 insertions(+), 14 deletions(-)
> ---
> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
> change-id: 20250211-mst_qcs8300-4c18a5179165
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry

