Return-Path: <linux-arm-msm+bounces-32380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A4984F0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9A6280E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01E21891B2;
	Tue, 24 Sep 2024 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbHLOuqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50A146D78
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727221415; cv=none; b=tEK+ne/qil6AuVf8H2z7Vyc1bxqARz+sHrBNla5UMuR2FSmkxj3gEcUteExuZ15+Z86JuvbeSqf8ea01p6Urd48eymhJJk2W6b9R4MVTxnS+xzIipfn4QRUC1nWZn/KstlNiAyHbKj/886v7kzbbt1AiBuoqDQygcqPMh0nKlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727221415; c=relaxed/simple;
	bh=wCY4lL+HUJZAjX1alFGOPiuA6ZGTGOj7gpmXEpAgBKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnPv9Ut2d01Y9707hJAORfrVW4VxbSMa2kaOVOoqDNX8e1wyoosk/QhGgf9euO2fUMjhT7jGuS5pCNP40CvVyWEv6E6MtRBqgVeczOVn2Hn+b8Yx/RFg6ldUKV/7OwADVmnVaApYp3mgnajq3Xs/yftHPy1qJWbqN2XQdSBFYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbHLOuqM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75de9a503so57197631fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727221412; x=1727826212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaB904nJswzSJ9sroCAmof81VYvbvVS4ZH/0WuYrOVM=;
        b=nbHLOuqM2uwVhiTPz+sPnLDcbZMvYuH2GfnvgkmyM1isDNCaZArr8pZEt43EUV54F4
         Kz/+EK5QLCxkqDw3jisj/Ji2ohgy6sSMwvyNYTppDesyTD2BexGsvuE4tafpiBgl9AXu
         Tahk0iYJ7rDVqBN3AJCP2uxQfVEFfB28dsoqsPUgN628UdUK+TpkoaqXbuFk04/pOTSK
         ffjNLysFi14NhBDrSFlOpcvPJtqFXUvz28IbzDFm6AFb1ErXT2k8lKttlxQmqudN3+3U
         YxG3cEzl3fVpe3owgZMIhnojTCx0NVIF4bxFGQDlVEKGfRn9c3pEnR1IvadO10RHW4Sc
         3T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727221412; x=1727826212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaB904nJswzSJ9sroCAmof81VYvbvVS4ZH/0WuYrOVM=;
        b=DeDr968wf3uihmiNGssjEyobp2PE7hwPY74ua1iJrnx98yJQTSEcN1wVc43qA+vGTV
         GCQOV6FWJNmnXYXAwhWmnygYA35jM+swdO8HT7NtggzbikqNmrtCNdzuVK4W2o5r+afx
         XBp+++/lTqPmdYu82g5Ia8lwU+wpZ5UOYgSjV49/3gbp2gp4FizAx39pd4Iibl1MocTm
         1gbNAvN4zLts6l4e5bJYvI3kV0zyW0trSSFnS/npxHxZ8/acbuvzIs0j/p272uOAH80S
         ynphIqHmEH6qhiPgR6gNjGWK3sKN115aoheoWeQqZ7SAoX5CAhWyUd6jbbTI21cl8t2Q
         +0uA==
X-Forwarded-Encrypted: i=1; AJvYcCVHrR6PcUx8xaRSbCMf4E4X/0m7EL6moVV53nPxtfdEMFGSISFZ6EIXsQmuuD+cRz1yKN+vLNFk1wSN/0qm@vger.kernel.org
X-Gm-Message-State: AOJu0YwNlRbS40/amEboSncqdAXFV2G5GpoQHpCH7dGy4UxmlCY/YjOK
	voUr8Mz4fHSMPsnYPv2dQ3Ypz7rWDHhkTrzV0vF4M1misFfbaHGolBImG2uj7Co=
X-Google-Smtp-Source: AGHT+IHJcmuOaUBwvlkEtZIKbGrA0Cs0d2P3fusjeaeBp5b7mIzG6VP9t/3bUVtxs0ZpUjKmoSc57g==
X-Received: by 2002:a2e:743:0:b0:2ef:2d3a:e70a with SMTP id 38308e7fff4ca-2f915ff4b51mr3422621fa.18.1727221411893;
        Tue, 24 Sep 2024 16:43:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d288e03fsm3521031fa.91.2024.09.24.16.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:43:30 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:43:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 20/22] drm/msm/dpu: Skip trigger flush and start for
 CWB
Message-ID: <tl4flcgmup2cdbbi4uiihkij4sqr7uscdfal6sw6443uixhhz5@z6jyokawiwh2>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:36PM GMT, Jessica Zhang wrote:
> For concurrent writeback, the real time encoder is responsible for
> trigger flush and trigger start. Return early for trigger start and
> trigger flush for the concurrent writeback encoders.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

