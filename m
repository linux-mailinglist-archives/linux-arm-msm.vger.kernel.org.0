Return-Path: <linux-arm-msm+bounces-20764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0286E8D1C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8618C1F24D57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1A1DFEA;
	Tue, 28 May 2024 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rl5kBtq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E052F16415
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901943; cv=none; b=Ky2RUrt0yBk1uTcbxEjcthPzNP3K0w2tXCEcXbeL/yMU6Oq7NbKe6ypb62P2izdd0Mrm/kkxj75qn4D0zxNjNYNgESWw5DcRl3qGnzxk2wGIoNMelNiEXLJsZyc9UXSsHERcsgFYyp55aTtbU3wPDGYbY7Sq2q3+BXgO/wdvg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901943; c=relaxed/simple;
	bh=iaHSfVk3cYotj/lpjrNnV72ctCzwvrJC062eqOjiZ64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+1BHJ8cvu890tVBes3onozNmCQQeDdHHhXcVTVmVQBAwk2ANUVAU24lRUPIA6uH2oE3m/8an91GuFNpTQUos+uV6tpPff0hZ1dhrR+OwBp2ih+zyZMCn2AGbs9bbUgXtiHG3eh2prhof/HZ0+N/RG42vGQeCChlyqTczK+2M0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rl5kBtq1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-529614b8c29so1356557e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901940; x=1717506740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VeSY2ceVXmdz5zqyxr0C6Kr9UZqmvZCx0+drlbb4RkY=;
        b=Rl5kBtq1cbzmSgYiWxECD6OpsjiHBs93onbqxBIa04gETjs4w4a5Mg1SmH1uZL8532
         i3Lpi3GB9Td+Z8m7HIhKbHoBXAyOFKWzc3KweEFwK5xZhn/vaokGUIyBZtWQ8q3gg4Ak
         QO7fZ5LrwALvOMMuMArbu0KaDPTC06rbvlncJHb+gzqKKa2KHAp8i3FVIoR5GTVe30ia
         5wg60Zv64OCkTzKppQas+/TkVYT70cN3yFqK+/zQ4updmPPICUttnwwMRE2uRD81qiDy
         PbNuwkXrL8XJ+/fLivuFqcDZFHgyaF7PAIk/3dMgw+CzJ2UB2Zw4vF1JehRSHvZ4t3Vf
         KRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901940; x=1717506740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeSY2ceVXmdz5zqyxr0C6Kr9UZqmvZCx0+drlbb4RkY=;
        b=UTZreUJSUffmbxY59FyLW/qdmiuL7Zy6b5nbLrDgh8VZ65v463wi4zBDcSbcWLCZ0J
         8WvGoP6GAHBAxTZ61y8pwNESwisUV1UW2jXTfJONyeQT1kO7ogbV0s0GkX+d9FISLcwj
         yEZCgtc2FsWD3QUI4S1ws826+mPYfz+81wddbsAcbXF3MSd9Z16jOaXiOvcjeFsCiZNi
         /HMG9Im/a/rMfN5HvGCgiLNv7i2DFyxm5EMsENzZ0CdtyLCp1H5q0w2UMvb4nEr3YoaT
         nq53+jSP87JQcjufprNLdmRslY5EUrOpjZoEiJQq53AtudEvn8Ltg5/H9861E5vBJdK7
         tEnw==
X-Forwarded-Encrypted: i=1; AJvYcCXq297hZWceJ3GmCmCOZQG3rXHMyX87g41+mdmR8F0a7u4gXx6syNhBA8a/Bagy4J3SbEMEGmGpKccpy9tfvq5P+FAsMYBV9RLtdciFQw==
X-Gm-Message-State: AOJu0Yyal4yHQDcLUVoqgSb3mOLqj6MLKjicRwHe/bPmXnWlg+sS9z/B
	q3Xf8oirOHumiHmrmIHAZnurUY8RXfYGw8KZaaniuV9z4+Frs+6GGR89rcZXtXMV4AM/+TqoyV5
	a
X-Google-Smtp-Source: AGHT+IEQsnfewAV9/ZWWR29dWl1FWNwoP9P5zP+0yccPOd0kgBwvS7Qmct6DbXrltf+MWC5dAYOZPA==
X-Received: by 2002:a05:6512:3ba6:b0:523:78de:11a3 with SMTP id 2adb3069b0e04-52965290530mr14260463e87.2.1716901939904;
        Tue, 28 May 2024 06:12:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296f410fc1sm939673e87.117.2024.05.28.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:12:19 -0700 (PDT)
Date: Tue, 28 May 2024 16:12:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 8/8] misc: fastrpc: Add system unsigned PD support
Message-ID: <zwlzdhb5zn2wx6bew437hzj7l6nsj2ccekkkabatykmtzihotr@5ocy5wqxtoah>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-9-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-9-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:54PM +0530, Ekansh Gupta wrote:
> Trusted CPU applications currently offload to signed PDs on CDSP to
> gain some additional services provided by root PD. Unsigned PDs have
> access to limited root PD services that may not be sufficient for
> all use-cases. Signed PDs have a higher dynamic loading latency
> which impacts the performance of applications. Limited root PD
> services could be opened up for unsigned PDs but that should be
> restricted for untrusted processes. For this requirement, System
> unsigned PD is introduced which will be same as Unsigned PD for
> most part but will have access to more root PD services. Add
> changes to offload trusted applications to System unsigned PD
> when unsigned offload is requested.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 9 +++++++++
>  include/uapi/misc/fastrpc.h | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7f81a18b8aea..ebe20915392f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -122,6 +122,7 @@
>  enum fastrpc_userpd_type {
>  	SIGNED_PD			= 1,
>  	UNSIGNED_PD			= 2,
> +	SYSTEM_UNSIGNED_PD	= 3,

Any reason why this is not indented properly? Maybe you have
non-standard tab width?

Also the usage of non-bool type makes sense here, not in the 'unisgned
PD' patch. Please use bool beforehand and switch to an enum here.

>  };
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> @@ -1552,12 +1553,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
>  		fl->userpd_type = UNSIGNED_PD;
>  
> +	/* Disregard any system unsigned PD attribute from userspace */
> +	init.attrs &= (~FASTRPC_MODE_SYSTEM_UNSIGNED_PD);
>  
>  	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {
>  		err = -EACCES;
>  		goto err;
>  	}
>  
> +	/* Trusted apps will be launched as system unsigned PDs */
> +	if (!fl->untrusted_process && (fl->userpd_type != SIGNED_PD)) {
> +		fl->userpd_type = SYSTEM_UNSIGNED_PD;
> +		init.attrs |= FASTRPC_MODE_SYSTEM_UNSIGNED_PD;
> +	}
> +
>  	if (init.filelen > INIT_FILELEN_MAX) {
>  		err = -EINVAL;
>  		goto err;
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..3b3279bb2cf9 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -62,6 +62,8 @@ enum fastrpc_proc_attr {
>  	FASTRPC_MODE_SYSTEM_PROCESS	= (1 << 5),
>  	/* Macro for Prvileged Process */
>  	FASTRPC_MODE_PRIVILEGED		= (1 << 6),
> +	/* Macro for system unsigned PD */
> +	FASTRPC_MODE_SYSTEM_UNSIGNED_PD	= (1 << 17),
>  };
>  
>  /* Fastrpc attribute for memory protection of buffers */
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

