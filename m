Return-Path: <linux-arm-msm+bounces-51792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63130A679CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9E03AA194
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7946210F49;
	Tue, 18 Mar 2025 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cm8wQ5cU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6620F070
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315719; cv=none; b=Ek3xHYLtjy5BLhMaIsgOwu/tvEsWCcThFpddC+9Gl+F9OljWJQCa9jF6qV+gWYLrAWszkCShZOzoVkv8Ua0r1CwoB2H2WxI9jylifDDu8gB6kMF7kagSfPkqIWft4+aEW/G0j8VcGgDlNIoossQhQsSOQoZqkeL4+iLMbPiZUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315719; c=relaxed/simple;
	bh=RzpJDmIRQrSO4tXR1VavJOgG0rc3UybN/ZHACr7xsrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZh3GecccfQSr0IC9wseAjELRpW2/hF9tQLh+8rX7kzdwDyHp6BhOCLrdVeRnb+WxXcrh5WxD3VCQ7YuklDfuLDR6iL/0XuBSDEvIqsHhJRnzvs25ifsYLqVrx8bayN89hRrlbIPE3mkCUYvXoWml2mn0ZS1mhxnYhVhAPXDD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cm8wQ5cU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IGHMFe004541
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S8PB0YodJg5Wli563O1SQMXwTT57T9BZM427fm0JCk=; b=Cm8wQ5cUSKHVmqPN
	KIzw/os6kT5H6GUA/4uYhMGTX8mhdipTjERm4idtdVmfZQf2Cz+daXh0mmncXpqn
	Ph+P4q+lN4rFgoWJNDqKJtgcv6pT95H3zWLeaE5K4Jz9tu3B94ByCNoBIAgkRJG+
	uYkVAAEXE8lpResBT9fy9ljEhB3NEB6l5+jvRY/20z3rmW4I41ZSzrvCMJ01yfwK
	7A917H7TS3YMtEDwATCZGv2Q2HtEGuSpl1JIRsH3oIpcp97XgA5c/D0x2OOeXE+6
	BVg3UeGC9nmaaQaJ1UvZmZgDIxwXOqIoa4vrqBHtcHdAVYHsFd1O6BhXrCmCPqvm
	27yKaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbu48b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:35:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-300fefb8e05so4326059a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315714; x=1742920514;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8S8PB0YodJg5Wli563O1SQMXwTT57T9BZM427fm0JCk=;
        b=TeCzJZoxlFnRX9x54X3dwBYqZtFRfRzn0/RQhtXusBWG9+HAgYDyt1yV+iNdSQ2Whc
         7uURkLWuVZw+oGuNts9UnzQz3qCipZZrzETafSr0pf7xL/3CxZ7tliQZ4q9dhYsX0U6L
         X8M/XEV9YLj6XganQvJdj5O2sZPNGZ4v95OKK15T0YpyBRw0nPJb05n4qutz93Jar1p1
         cMgP6HxRhJlUyV1ehVHes0TjBmtVbs3y5KemPJ6VZlEaAjkD+Kjs8GWx8SDVH6udTb/8
         SQ0csxDB+IiN6ZdBJHiOekoOO/PCzrWuCqczyqizbBY+s0e43WQPbxh0P+9ep6aFYP0G
         bSRg==
X-Forwarded-Encrypted: i=1; AJvYcCU89NOoMHJVCSE9AEJhqU+WCAV25DD6ZsGTRA6jzbADiovz9a22r61xNW8awRbAlPnKbEi9+L2rYLcgWLEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxuqWk7EalALwef+h/6WWDfzmun6OKVqCpX1tTv3owY77MDTies
	cwRmERin/KCBQPmosheJsrBVrHM2kV295lsR4CR7uPI3qmI5OrwTOVfXrx8see3JeimYbh6PG3k
	dNIrVIlL4srb2erqxKuwQVpze0Y/mJl19v5c4JnP/V+L9smW4z5NJYd4CbzU/mYGR
X-Gm-Gg: ASbGncsjLyZodnh07U5pOiw7/SHoNFz4QpscKbzZ9vBrIgbs3VqZpDzBB00YSYrPI5L
	BxKbgBhx8pZzDQsCFp10ve91J1AKtYuxXM0My5vSJfIq46yI17w9QLvdGgXWhTqUj/LNXeG/C67
	L12yNyumHXPhhI9AXaBen0bV6vK6Wtw8HoAi8zpYXkRHvtP0qjtuHyINZyF4O5hH6EuOP4kdOzR
	ycN60TZ2W6SgMQWVxXHsHPGJLFhqP4VTZSkCVlUkT6r8GIiBZckjgmw9Nsu13WcFfEwv8RAngtv
	9Iv+mWW7vS9fT56hOcfTyPyjM1ZP0IG+y3ZSjgx1ETlFKAPlsqJgLOkQXDQ156F1CjkH+Mg=
X-Received: by 2002:a17:90b:1d45:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-301a5b12641mr4557435a91.8.1742315714202;
        Tue, 18 Mar 2025 09:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNgty9LS3gmI4YtjORFBIqUOxTJsgXkfdaoeeC3oMmoDUzn0KGFmczchekklPmOqjoT0aY4A==
X-Received: by 2002:a17:90b:1d45:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-301a5b12641mr4557384a91.8.1742315713745;
        Tue, 18 Mar 2025 09:35:13 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f4bsm8443754a91.5.2025.03.18.09.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:35:13 -0700 (PDT)
Message-ID: <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 09:35:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ra4pAvflj5DYZOqklyrGS0HGgw17dJhX
X-Proofpoint-GUID: ra4pAvflj5DYZOqklyrGS0HGgw17dJhX
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9a0c3 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=QwuQnTktFLmdFS3CTrkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180122

On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
> the line:
> 	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> was incorrectly updated to:
> 	ab->single_chip_mlo_supp = false;
> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> 
> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> crashes on driver initialization with:
>  ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>  ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>  ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
>  ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
>  ath12k_pci 0000:01:00.0: failed to start core: -110
>  failed to send QMI message
>  ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
>  ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off
> 
> With ab->single_chip_mlo_supp set to True, firmware loads nominally.
> 
> Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Bisect log for reference:
> The bisect leaded to:
> git bisect start 'v6.14-rc4' 'v6.12'
> git bisect good 5757b31666277e2b177b406e48878dc48d587a46
> git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
> git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
> git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
> git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
> git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
> git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
> git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
> git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
> git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
> git bisect good 8c2143702d0719a0357600bca0236900781ffc78
> git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
> git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
> git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	ab->dev = dev;
>  	ab->hif.bus = bus;
>  	ab->qmi.num_radios = U8_MAX;
> -	ab->single_chip_mlo_supp = false;
> +	ab->single_chip_mlo_supp = true;
>  
>  	/* Device index used to identify the devices in a group.
>  	 *
> 
> ---
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
> 
> Best regards,

NAK since this will break QCN
There is a series under internal review to address MLO issues for WCN chipsets


