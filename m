Return-Path: <linux-arm-msm+bounces-28641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD0953654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E090B2700B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1FB1684AC;
	Thu, 15 Aug 2024 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpVzKXMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FF1A00CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733706; cv=none; b=WU7zxkot+seGx83zquNJmgV0k0TkdK3a65H0wr/D55bhP4DxEVXaPTZxzllAsy9qLtz5DlXKMRTvpWH9Tv2pipPzVdfrs4BtLIZOxSDg5ZttIysYFtrakuL/i5DT/rHmf+7ib3Ml5u7TOMhb2ilZtF9bR0OzoGhln/9oDr+EV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733706; c=relaxed/simple;
	bh=jAkiIYHIsImSFQp06/C1NtzsJbNgH2RP8TgSM9DMihU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVCb7RkwcIwrfvOTFfAoYEH3mXZY05DcL3afL/adL83tGDXysTWgyHgp81FaenZpG/R6DPK/jIK6ZPlWw1kvTLu09rWGoWNWNzb5qMlmlQ/d7DdLc71IYeQy6/7KVsQ8g/mJJtBCu630rSfCndV+v1rIGFClX/aRw3hYV8GPWQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpVzKXMs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so126165566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723733703; x=1724338503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRsVMvhV1m4jnkyYapmQ2mhT4HUKsi82zyg3o1vJhj4=;
        b=bpVzKXMs/lur6/Pu2DpgvhvvrNYHYNNZLHowoP5K3khQqIzltWdXDufF36hSto1fsw
         gq3esG53+WimfOc4mLfJyzSodOS2bSPcl/LbspIsYB7H9xOIOPjA596hTg9X2IS243f5
         qCnoHSt/pbS/Id9zax9QiuiCRTDNm2f3rPK3nvV4yPKPgTdCGAiJQGF4S2kojTAkWIcw
         FoLFHbpxqZYeVaBPFxW2Xij6iopqmRHjoNrGpJs9YxLXaQnYpm8rbbbSQRDUgxD9eE9V
         hYrWp20PoPx7pNjs6V3TscWVQib7Roc50XrEnIrnJMet8wnIKU+2/7BNMfKPqauKpkYH
         jkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723733703; x=1724338503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRsVMvhV1m4jnkyYapmQ2mhT4HUKsi82zyg3o1vJhj4=;
        b=TLD5tj5QV4Mnj+tvLZlmkLYqPXR5wYRIiiBZGWsdoFRRXI74faEeX3Pw6xX2x/PoEB
         TemeA4viH9R7eN+woXmbA9z175v1BwHJUxwwudHno9QcNni2RZrAlgBiLBSJhjGDp/h4
         D3xpv9PJhGa1Jr/W4cCwmeoCssoVnxOPcsxJENlNdBEozxsxfUhAWTb4DlHTXPm/owWD
         kON+wW+wlEmZdu6BuWUDMlYY8e52YMd8QAlwbQBH3cABILJ6BW8iXXVVtkdZFnOWvlPW
         YM/xX5Px/+pmjbnC6Pn5XfgCFtCDVH/xfBDbzqY3vDL6ZyBLk9TnVYBpEOUmSB85KKta
         eg7g==
X-Gm-Message-State: AOJu0YyschATfpzAAAlZe8rI9WwGnxB1QjE4p8+ZwcRsHWS3AeHDp0sG
	pJjPfuqix7F1C9NCRdV/FYx9QZsrmjQZRZjgBD/Yahx5SiFHi8gOLrHud6C963A=
X-Google-Smtp-Source: AGHT+IGOnLR0ehKGNshAowR/t71XZukLfFAAiAx7KkDRy7tTRlkvpQgdTikiClXZ8+TFuO8RPTOe0w==
X-Received: by 2002:a17:907:e6e4:b0:a7a:bae8:f29e with SMTP id a640c23a62f3a-a8366d43f97mr425022066b.29.1723733703106;
        Thu, 15 Aug 2024 07:55:03 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8383935663sm113133966b.121.2024.08.15.07.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 07:55:02 -0700 (PDT)
Message-ID: <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>
Date: Thu, 15 Aug 2024 15:55:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "misc: fastrpc: Restrict untrusted app to attach
 to privileged PD"
To: Griffin Kroah-Hartman <griffin@kroah.com>, amahesh@qti.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable <stable@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20240815094920.8242-1-griffin@kroah.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240815094920.8242-1-griffin@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2024 10:49, Griffin Kroah-Hartman wrote:
> This reverts commit bab2f5e8fd5d2f759db26b78d9db57412888f187.
> 
> Joel reported that this commit breaks userspace and stops sensors in
> SDM845 from working. Also breaks other qcom SoC devices running postmarketOS.
> 
> Cc: stable <stable@kernel.org>
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Link: https://lore.kernel.org/r/9a9f5646-a554-4b65-8122-d212bb665c81@umsystem.edu
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---


Lets fix this properly by updating existing device tree entries and 
bindings to enforce misuse of "qcom,non-secure-domain" on all Qcom SoC's.

As this patch is only doing part of the job and breaking existing 
platforms,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini



--srini
>   drivers/misc/fastrpc.c      | 22 +++-------------------
>   include/uapi/misc/fastrpc.h |  3 ---
>   2 files changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..339d126414d4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2085,16 +2085,6 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>   	return err;
>   }
>   
> -static int is_attach_rejected(struct fastrpc_user *fl)
> -{
> -	/* Check if the device node is non-secure */
> -	if (!fl->is_secure_dev) {
> -		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
> -		return -EACCES;
> -	}
> -	return 0;
> -}
> -
>   static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>   				 unsigned long arg)
>   {
> @@ -2107,19 +2097,13 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>   		err = fastrpc_invoke(fl, argp);
>   		break;
>   	case FASTRPC_IOCTL_INIT_ATTACH:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_attach(fl, ROOT_PD);
> +		err = fastrpc_init_attach(fl, ROOT_PD);
>   		break;
>   	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_attach(fl, SENSORS_PD);
> +		err = fastrpc_init_attach(fl, SENSORS_PD);
>   		break;
>   	case FASTRPC_IOCTL_INIT_CREATE_STATIC:
> -		err = is_attach_rejected(fl);
> -		if (!err)
> -			err = fastrpc_init_create_static_process(fl, argp);
> +		err = fastrpc_init_create_static_process(fl, argp);
>   		break;
>   	case FASTRPC_IOCTL_INIT_CREATE:
>   		err = fastrpc_init_create_process(fl, argp);
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index 91583690bddc..f33d914d8f46 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -8,14 +8,11 @@
>   #define FASTRPC_IOCTL_ALLOC_DMA_BUFF	_IOWR('R', 1, struct fastrpc_alloc_dma_buf)
>   #define FASTRPC_IOCTL_FREE_DMA_BUFF	_IOWR('R', 2, __u32)
>   #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
>   #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
>   #define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
>   #define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
> -/* This ioctl is only supported with secure device nodes */
>   #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>   #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>   #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)

