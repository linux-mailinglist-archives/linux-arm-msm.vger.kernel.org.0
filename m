Return-Path: <linux-arm-msm+bounces-22066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BB9003F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1240C284415
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044601946D8;
	Fri,  7 Jun 2024 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGmTJiTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475671847
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764141; cv=none; b=pbHLHkRdVUKK3uiYc+LjBt8a+3xLhJRZaKIH6n302DtUilM/0xAkjREaufZP8Ju4No5tryEAOkYlbpgR3VdVPBEGCGmQssAWHb3ozZyjJWJIXnexBqxm8ymnhu1f5Cu04VXpLiyfWyPT38qqAozJ5JK/IUtLIlc7MLqNZHLnwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764141; c=relaxed/simple;
	bh=a5796ySW3YMSWtbXww5SPASPZ3Nh/h6vftisfvSJZQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s699gFnUJI4t5JfYJRjgQKy0ZGM4cTV0CNeteJ8XTDtxBYz39IjZLwvwvuEvdLJLWrb74R4iyBqLZb5QQrt+T/YNYOJp5MnsAEvRXlYJf8jKJUzjLuK9w7HBs+Jmu914STzJoq8Dxq44i3SURQFUvlUQUgx94Ep/WbnUWvp8lmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGmTJiTS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c61165af6so189452a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717764139; x=1718368939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=763OORXE2U3LdBi+kBiAJ1rdKK00vtJI0371975xlvU=;
        b=AGmTJiTSrAOJe2jMpVDsTowCq0Ycp5iZCjYBntwS284jI2+LDeU3ikRo5wmWL8rgsg
         zH+9qvqDY98u+qlPi/xSp3fMXv8KdOcwubNsw8d7ZWpSMqjhRBdmTSYcGfHjAsR65sFf
         YtwTdNQISnNxIzYElJvu3PA3WCa6jCu7DRXeLh/BJDbmiKsUAUkq3gPXFOGFKnW6ol0f
         ACYOA2hHDxEPckDjprEm4NJ+rMEH9+6bA+YmYEXRVfAHgBTDawkZCGV84N4nG8OfpzDl
         Un5MII4zCpqg+5X57mMoBiS6dCL7RnPNenBZ2B2vU7OVH5YgKB/zbT1+gnskFA0rCiwa
         3lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717764139; x=1718368939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=763OORXE2U3LdBi+kBiAJ1rdKK00vtJI0371975xlvU=;
        b=iYgKVXIncaFMb4QWxzHQ7s02AcS8nC18PZ+ZM8bv93ykidh4d2EqJoRRGtg68vuRlO
         fTfwdX2E8eF0o+Te0EdCiY539D26fP4P5/Zps8Pmkj/w3VStysH5aWvvbh2HZ4IQ9hk5
         NQYMpEofvMN3qzXiOa54WyGQQIHg8/Z5YPvi4Xjf7EJKIJPXEbFWeNkGCCvcEY7hI/4B
         CdbSoeJ2X64Osck2h6TBbDQG4f2ziKP6qKvi3eT/8moAOUvJQnM3MY/qSWK6LeGAfcV1
         rDXU5ygZNuHxr4rJ1ZmjMUXMkvnc3gHXoi5F50iF1qxOFB0gg8FSB1ks/17u6gmFn9ek
         eAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFLj5uF5qavMvOzWPA+6h+9X159J0GzC1CqwkeWEafzWxg1MjKqtkp8flXeidYEKpNC+sVzvpGB5dxsyBmXkddbBh51bDP7PxeX5VoiA==
X-Gm-Message-State: AOJu0Yx3PQd1x+LflgsAJVMOdcoAIVuLq2cdESmPIXG3l90ScwaKQbm+
	evqEPYqCoBVn2r9FHuLCE/6SIqLzU1TZfMdmjohIpv0jM8S+H9DVKiOhMrFapi0=
X-Google-Smtp-Source: AGHT+IHGCU7SOofUC5q+FlTfu45pN2L6JEbAlbXDLfaXmvVdmuyPmPykEYwb8QcVU5NVMF6CUNC2eg==
X-Received: by 2002:a50:9509:0:b0:572:9962:7f0 with SMTP id 4fb4d7f45d1cf-57c509a841amr1347566a12.34.1717764138635;
        Fri, 07 Jun 2024 05:42:18 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae234204sm2680408a12.87.2024.06.07.05.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:42:18 -0700 (PDT)
Message-ID: <da6452eb-a419-4260-aeef-f092250430ba@linaro.org>
Date: Fri, 7 Jun 2024 14:42:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] misc: fastrpc: Copy the complete capability
 structure to user
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 stable <stable@kernel.org>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-4-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240606165939.12950-4-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2024 18:59, Ekansh Gupta wrote:
> User is passing capability ioctl structure(argp) to get DSP
> capabilities. This argp is copied to a local structure to get domain
> and attribute_id information. After getting the capability, only
> capability value is getting copied to user argp which will not be
> useful if the use is trying to get the capability by checking the
> capability member of fastrpc_ioctl_capability structure. Add changes
> to copy the complete capability structure so that user can get the
> capability value from the expected member of the structure.
> 
> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/misc/fastrpc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index abf7df7c0c85..f64781c3012f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1784,7 +1784,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>   	if (err)
>   		return err;
>   
> -	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
> +	if (copy_to_user(argp, &cap, sizeof(cap)))
>   		return -EFAULT;
>   
>   	return 0;

-- 
// Caleb (they/them)

