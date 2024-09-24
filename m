Return-Path: <linux-arm-msm+bounces-32371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7D984ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16BC1C20E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D529183CB4;
	Tue, 24 Sep 2024 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3xJmfGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBB101DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219969; cv=none; b=uRKBqgf87vEJW/1EC/cAYS5jRZF9YeIDW8/E0UQ2nwHFC1Z6WtvamtJHEmPJyHSlrDNXSzBwsAqiNOpVX8zqdQfdIlPXIx4OqLD8AWA9ST7aXwjk9wA8qJdWsPNlhUNULWwmDA/zPVf8ph++Jk2/jLLAsgEI+DqCAizHIrDuk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219969; c=relaxed/simple;
	bh=vNlcHPiP4LaoqF4HPfhg89hpjHfzdn3g+qofGKGWCC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcgrWXDC2YXzPVrhlquFnvuxeZvQHY9f17p5n552SWsC7sOLG6XzXqF/oBSlVL6jbeXm8p8n8IfBdvjnOCn5GcaM8MZ7dWv/Qof7OQoErSeWK/ihclgC6OVhw6X5fpLwps3p/WjGFlbDNq10J8nq6UGEgeI8u9RcBK+5g+Wcr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3xJmfGA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f761461150so73586881fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727219965; x=1727824765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
        b=s3xJmfGAUP/MQvQSko+HANOLNiWK159QLZqX/sdo1+xoAXCIiZKsnSyoqOXOinAYhP
         a1DyFr8/01ZSnCfNk7qSxuvk7g8sktL90TYvjmFi682RXxZXt1jCFzaGDOhn9qmJtwDZ
         dG8cN1El65ZgAY7C8Y/nfKZZyHFR5IzWdLXPuuDDfmIpqHOqGfMuPshrHQkykNiHvgDn
         dEKz5AiuRe74QjIUBQYoal6QJyPTU7eiFLP2U6p5dPlJF0sDfeqPMY5SdpQQ8b+jOU4r
         EmWdQJW8erAyG4PIcjkIoKX/mxUEcowU8PgoQj1qMpNhg3DW/RijWGdaG/x8v5otW/bL
         Burg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219965; x=1727824765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
        b=XPGe+lmWxL2+93yx4cq09V+Qid2SQCuJFYjfcGFshbmuBAnk3tAIBAlvBlEzxiEY9P
         yoKQ+9lTjL2O+XMpqXE4UGJsPDbPNptga6CsufQpxIku5plvZJ+HKdc28qg1AuU9HR4U
         2Re4XOtlKsILrAE0Tx8SSqdMB2RI1KUCMAGlnRSNmuJBR1gwNUvubyxwJJQ3BXD5L99V
         LWGwDDbE5J68MzWccUlVkQNwK7QUVutPK6g/HwJXniMIiMa4A0/BJQtfpnVFfjaNJXAu
         FztKb30CmWHIBH506zseUH8wZSjWh7IJU3NHuKEKJCrk1DkhuFU+V8SpNfH7cagcrrzp
         G0lg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbE0X63E+kwakCXStI3mNALZutRazcklfPfwfEM/LHYciJkuya6iELMTf6Mml6irdTpW50MGx78GQjo/v@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxjgcR29N/Xnj1DNT2vrbGfR++bD6yISY/C9++fP++XGsWo4l
	cqswUHX22joKCg4knZNk0BaJO+0QhjS8ntt1bHuG5xvDJ00sf7iZ46w0ox1enC4=
X-Google-Smtp-Source: AGHT+IH0klG/CcfMRjXMdFbReF7bhlWRSCeWv4kqKqNH0sL3opOyR4yRKdhF285Ci/EQb6g7QrSjmQ==
X-Received: by 2002:a05:651c:1991:b0:2f7:562d:cb6c with SMTP id 38308e7fff4ca-2f915fc0a2dmr8141701fa.2.1727219964875;
        Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283b86fsm3519751fa.30.2024.09.24.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 10/22] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Message-ID: <sm7uvwkkir4oj3n3wdaadcfoufh3cktn7gvax6grqma2amhxxc@w3ahhlj3x3jt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:26PM GMT, Jessica Zhang wrote:
> The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
> abstraction to allow driver to configure the CWB mux.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
>  4 files changed, 148 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

