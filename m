Return-Path: <linux-arm-msm+bounces-27742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91993945356
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 21:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD1C1F23996
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3D114A4E0;
	Thu,  1 Aug 2024 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tl7ChjqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4513D8B2
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540317; cv=none; b=KF0WThLPu5naAlkNgDE4p1APm0hvavtUpd8UFYfJjJKbGvZSv/7GCtly5l9AchU4nQzo4Si4Eh2PlWvJLUemHK96YvSeVQrXe8u2gQiAWHNeP8/4QBTCE/x8e16lGUZDzA/qbGyEHDzd7IOah+yDz5kWXJO7AtEyDMsPdYVgt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540317; c=relaxed/simple;
	bh=TpCNPi6/NjMMws2DAkbtB0a6gtbkVNILNHKvFRfoKXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/uNs+nCX9RFpn7ZxPNKfevY+jSCg/reAeIjDcSg/TLCNvHsckhK8z7DKAwgBLgphUM5QKwxptVlKr6avdwcsb9knra0ByqBb/qbb86SPjkQklki/9KTcFepO5v/WgpQV0TrV1TS7QATZ2lpOhU/8MkdzcktNWqdO2AlS6n5WHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tl7ChjqZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f0277daa5so11510328e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722540312; x=1723145112; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
        b=tl7ChjqZuOTB2ycvv0GoQHGWLeJIjsCwXIbdZQQ0hjzYrqRQVWZUCy9mymX47CjuVh
         J1g8MbbLgup7zyI9Lsl5GfHyEXY+6WvbpUtCHoV7tBHe/aBofYvT1MYkRzN/qMSKTW/Z
         ReCP9CW/BPahshSoxhbTgpFB3SkMXBJsefdHRGxbzRfX3fXmYAQq5XNC4vyyOhAoAwhV
         3auwhecucSKFzKek2N4k0Z0JoykLCBG3koHkKHVZWW5FUL317rYTdd8ooLZo7mTcUr/I
         Nm7HYoCNaXzJojNv6kPVkoV8E4B1l0WrFYKSbbFbvJJmBC6xdC16L5D+S3FtfRo2LWqz
         LHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722540312; x=1723145112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
        b=wGExRvmH+Sfx98+eVg110cD1/f7Gh7Dpu7CM5DzXpPks523U3/2uvzjPo7bYhb4tN3
         EKxLEaW6oDy/eY+RbrKj87hMK1SCYNgJGvgGADuCpcknPl16KVvYMvj24NGfIYYRVAso
         J1zR8gYMKQmSVpTLhsbh0zp7a89V1gSwCUlerI3j4tpKsNNojLMk5ZVYa+hA1PKNTUJP
         0L9Y6nt4AmaGYkjghxOUVSpn1s/pdLJTqYQh2qD+p+XP8gTlVPXPrvCL5usvoAVvxwfl
         08yHD5T7U36ddDsPTmtzyA0Zw19xCU7smgOd4dMtFt4DlYVG8w7F8XYRaKMKwPKarXi8
         I3CA==
X-Forwarded-Encrypted: i=1; AJvYcCV11T/NVfNxxDN2i6N4Zvzw6czyud2Dwps4CikoBjg4JXzOw/gaeTYPeb4TtWqeJ7OBcjloec6paPaTgJacBt+dNtEmlnIHLBYrIeQACw==
X-Gm-Message-State: AOJu0YzRK82lpnYIUuhliX6/47CDPckNbc9hFKmFM9/bo23ivzBzDMXp
	3tNif8evfamIREt+3PA6T5Y+81hfK7Wpoy6mhfhhCWZLDcU/NQx2chd2AzABmTM=
X-Google-Smtp-Source: AGHT+IHyvHO6F0PypSn/UmfAHe+RChPC8zWKCvyEdtI5ipmD0BkNJ+h95UKmnYJ0E129Lj7ff5XZnA==
X-Received: by 2002:a05:6512:a96:b0:52c:8c4d:f8d6 with SMTP id 2adb3069b0e04-530bb39b0b0mr724584e87.45.1722540312231;
        Thu, 01 Aug 2024 12:25:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10fd9sm35859e87.99.2024.08.01.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:25:11 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Message-ID: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>

On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
> This patch series add dpu support for MSM8996/MSM8953 devices.
> 
> Note, by default these platforms are still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.

Could you please provide a summary of features actually tested with the
DPU driver? Have you tested YUV output? Have you tested RGB planes?
Which LMs have you tested?

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Dmitry Baryshkov (1):
>       drm/msm/dpu: add support for MSM8953
> 
> Konrad Dybcio (1):
>       drm/msm/dpu: Add MSM8996 support
> 
>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
>  6 files changed, 678 insertions(+)
> ---
> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

-- 
With best wishes
Dmitry

