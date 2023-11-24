Return-Path: <linux-arm-msm+bounces-1854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDA7F74E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 14:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A24228121C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF8428DBF;
	Fri, 24 Nov 2023 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVSHqaM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59805D71
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 05:26:35 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54a95657df3so2874744a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700832394; x=1701437194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XG6ADxvx2SdIyRMBAz8RKdfu+PYmXUoQcvqXhk8eodM=;
        b=hVSHqaM/h1lXrC/Kj3GqLMk7Cwztp7Xhf6hCkTtPhmRGeRCuatrV65yZMRcFYkFe2m
         cidyH4bEfcW+K2Vb/HTfbhzblY1XWapBI4XsTLVg7X+YGf9blYF0Zik9W2Bv2hjx/Q3N
         NRg1pwyFA+YntR2HZOCDMIBCsM2SUBwK+A7zAvK4cq0QDQWmq9uPI82gxt6YTIDcNJie
         sL7p92JL5MKVHgXuzZKA5potKJtAIWZjRZ83boPQgSWy24ebojvbQRPHIm7hMqxJ4TUc
         vWZTkk8I1x/XXCjQP+kWIKZpvXsUMeOAlwIhZYSviosiBYZONhbmSCNJT9d9UotF3JsD
         edlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700832394; x=1701437194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XG6ADxvx2SdIyRMBAz8RKdfu+PYmXUoQcvqXhk8eodM=;
        b=VXe7lWSg47nY0SWRUP670qkAoQAz4BTFA0RhlpKOCw/YDBAAmDZP8GmrMN8P0ob7sn
         D3476XOTkejLNymQv8n0W0ml8Q29aYhPxDJQx3rvFAVUsNk4rveLmVujAdstwyo3nfPm
         Qi60uIL07+4Cgz7rq6Kbz2wBf0ArAFOjnx7Lex5wHxLgaFUix5NLZH4f4SG6WcdZY3/h
         I5NFtG9SBtZPz6fnBrLZK/SnT+WHVmmHupilTOGzMrlklk0a/z3vgvxB3nWIRR6aOb0A
         tJBR9ldO840YHDKY27y/0HIiZmDQguZao28JEmFBL7Mi7+Se1Ts/A5ISU103+nX7Rh/q
         Sq1A==
X-Gm-Message-State: AOJu0YyhHnNkJFvEZG6Ksa2hahft7ycUMx0g59rgoh1yRBIrcWvOnV4Y
	ZOGJ+LHMpYBOq8PArW/DuvgiJg==
X-Google-Smtp-Source: AGHT+IGToWgMbWtNgAJ4UDGie72Pp8L21PKV0u4mYSlFioL3UdiJi/XQcPo7DTeHDymqZ1l/YeU9bA==
X-Received: by 2002:a50:ef11:0:b0:54b:f6:fb23 with SMTP id m17-20020a50ef11000000b0054b00f6fb23mr1174153eds.23.1700832393823;
        Fri, 24 Nov 2023 05:26:33 -0800 (PST)
Received: from [192.168.86.103] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id o26-20020a056402039a00b005487c48d9ebsm1793399edv.57.2023.11.24.05.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 05:26:32 -0800 (PST)
Message-ID: <b56f7a00-f5e0-4cc7-ad04-33b4981e14b7@linaro.org>
Date: Fri, 24 Nov 2023 13:26:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] misc: fastrpc: Add support to allocate shared
 context bank
Content-Language: en-US
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20231121094844.5764-1-quic_ekangupt@quicinc.com>
 <20231121094844.5764-6-quic_ekangupt@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231121094844.5764-6-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/11/2023 09:48, Ekansh Gupta wrote:
>   static int fastrpc_multimode_invoke(struct fastrpc_user *fl, char __user *argp)
>   {
>   	struct fastrpc_enhanced_invoke einv;
>   	struct fastrpc_invoke_args *args = NULL;
>   	struct fastrpc_ioctl_multimode_invoke invoke;
> +	struct fastrpc_internal_control cp = {0};
>   	u32 nscalars;
>   	u64 *perf_kernel;
>   	int err, i;
> @@ -1938,6 +1975,12 @@ static int fastrpc_multimode_invoke(struct fastrpc_user *fl, char __user *argp)
>   		err = fastrpc_internal_invoke(fl, false, &einv);
>   		kfree(args);
>   		break;
> +	case FASTRPC_INVOKE_CONTROL:
> +		if (copy_from_user(&cp, (void __user *)(uintptr_t)invoke.invparam, sizeof(cp)))
> +			return  -EFAULT;

wow, this struct is not even exposed in a uapi header, how come 
userspace knows about this struct?

Every struct that userspace fills in needs to be part of the UAPI headers.


--srini

> +
> +		err = fastrpc_internal_control(fl, &cp);
> +		break;
>   	default:
>   		err = -ENOTTY;
>   		break;
> @@ -2440,6 +2483,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>   	if (sessions > 0) {
>   		struct fastrpc_session_ctx *dup_sess;
>   
> +		sess->sharedcb = true;
>   		for (i = 1; i < sessions; i++) {

