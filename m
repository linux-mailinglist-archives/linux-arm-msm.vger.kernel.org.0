Return-Path: <linux-arm-msm+bounces-68651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C298B21DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61E9F4E06FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063D529BDA4;
	Tue, 12 Aug 2025 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hs0Z0FEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E1D2580CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978228; cv=none; b=hRRnBV8wTuyqrtQHzbEur834m7QhoaaxvSanG6GSmqcBN8xFdCBOWZQcbVjubIw2gOtX0fzGX3ZTFYx/2/UZJlR9llu3xHOilflCxF52lMHFse7IdhUfGearPB83klZt7WQFTYIwuvlAs/kLY021EEGc2A+1axhXCxlB/3IOIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978228; c=relaxed/simple;
	bh=tJOG9UGC1KS2vzDhLT4V/tFSo5qJ8SWB999TC4doV2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqi+dpYSRtChfWyZIjP5wCFiilAVyJR7eyYc2VoEVHZndVcuFAVwrDx8uxYkmp/10Y4DFUEX4PxaRjanmNCOjjJkM/H1Y5r6hP+v++cKHqNx71TYnkU/8UlGXqv1jSANyj0A376Jbc7A4Wk89hneQgD2SAmXo5sasUMm9+zsB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hs0Z0FEh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5nTpi023741
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEv5nCd5JEtL1flZjqEInCbJgZ550nvvo3TiB8HuuSY=; b=hs0Z0FEhvaOvvfTg
	NV0kSogdHRCrLxvFuNZaJ5QeOl/HDsOE4tFeC5N4lZI6AIQzHS4ISDd69sjoDuCH
	YqVJ5XD8A02rTJU0bFGdeH3o54BLSTUjbFHYsIrO9AvvnNFbFjtQv084D1VPWSHW
	NYg6ef+Hz1m1ZzTz5pHupxfRcAoGAaPKVtsnE8jasguIUEw0XyJYhlquiYEguz+F
	XgOw8Eeyq/cc90pQewknEB8HOiMzEEH0JdCHaornil0Ngm9x01gW/N06mgErmc0f
	vwFGrBgedkVIo9IwvDMPy2iCuy0QsXVTTqts+mrvLp6uPwi3AUsS4PcaS4kfQ8+w
	Z7RNiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4b035-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:57:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ffd934201so40766645ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978225; x=1755583025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEv5nCd5JEtL1flZjqEInCbJgZ550nvvo3TiB8HuuSY=;
        b=Nu8Res4oOnT5heTInVy2D1YhtlALgLSn8H8vHeFwM/Ww7/4ue+MdutwaZsCYGomBfa
         PthhErjDDrvINl89KIMrBAUfxsJmHDLfcBVqbOxDKeqyW7KxiAo39YL7KYlFzx2CBdBX
         l7hmCUQW8+WsI4uiVsyQx+qTXWoW4+wZ3zxymbFfVgymW3XtRC1dAifOqwOE57i2C3Ng
         Zu2V92BedOqSCRfuJkOjUbsFukILYMJ0RmROuvi/fgfLS6vGSMAGTEax/KAibXooJAPi
         vmYcJ6luA3vLhc22bHvq0PGfKkf770qnKM7IwuhGJwa56NCkICdnPdrXEKlDOmn5GAmc
         Vyiw==
X-Forwarded-Encrypted: i=1; AJvYcCUlX78u0vhz81voT6YV/Pi2WLrbke0ll27AWzysMw/rrfYY+iPr4Xja9Nt6jIEE0xbr6Z8JoMwRYQt5hh03@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPQB0Kv5+bZ8lKnI5UdF252QEMvUWqxi/0paR+s14qkmr0s8x
	HazZlh5ZF7ZonyfuCu/u3qDZMeshwUV1pR9g2ua/403rl8/XKSdoVE1Meqt3EhYmzXS2IkWvdLp
	wmEOPkVwdaaIslrUTx6miRGueztrSdCsHZeRcVnkDofolvLUphUVfE3ovRSxKYJh0qGHR
X-Gm-Gg: ASbGncti55fGboy08gx4zcSwiOLM/jQILGbllfG/5iMiet3fCEMvu1hLItqjea783Sc
	AfPrWn48uE1tFs4lFAKtDmeTosDU8GvFWoHHQVyQvUgAld1uDBFyut7oCMkQkGuDQejDJRhUaJ1
	lW/tkXN7m5P4Tx/mOGv1tcTi+QORO5pZh8WxYHm4t4YfWl5BtRYK6rjNBiooZPS1oMfChxNWkg3
	cNngN5lPfCD9RAr/7VFg9We+OSNVkvyP01QAEGNF04G9VujS6dsdJ82jVdv5RhgqvtVLjRcrhHL
	FwzjtzVDEtb5pZu8UZk0lkbfH7OJAmsql7dNeHx1Ihi6BU9yFyB0ObWEfPta1shPnSHGPEs=
X-Received: by 2002:a17:902:e545:b0:240:7fcf:ced7 with SMTP id d9443c01a7336-242c20596c4mr261796435ad.21.1754978225074;
        Mon, 11 Aug 2025 22:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERojaneRpqNViWbpvGH1a8gBIpXR0UabwcFfFfj0BA9yVPsYry01nCaz8ljkh4PoEkyna6A==
X-Received: by 2002:a17:902:e545:b0:240:7fcf:ced7 with SMTP id d9443c01a7336-242c20596c4mr261796045ad.21.1754978224580;
        Mon, 11 Aug 2025 22:57:04 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2426dec66desm207795295ad.54.2025.08.11.22.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:57:04 -0700 (PDT)
Message-ID: <78b335f9-7f6d-415b-bf56-5e9dc2c38f3d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:26:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K8qSJFHMcEPw7geN0rzj04WqekdMvFpK
X-Proofpoint-ORIG-GUID: K8qSJFHMcEPw7geN0rzj04WqekdMvFpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX4Gdr9oNGY+nZ
 moAuahHNrzy7qaS9fA9TN4pi0wmEgBlRJ76msogAOtu6n5sP6ZfAJNfzAXg59wVAp08gja2XXDa
 SP4iTa2C4TuDByptqse7CeW6vUXyWi+UI6CMPkAtjAHHfkLXB12vTiplsJmkN+VzxvPZ4/rPBYL
 o81gCWFkO4SXypr/TJWzU3c6axWIQRiA3HylP2OoKi/EVp0qRCgemFgxSKN4TRgyGsM9pJq7+iC
 TPZjM+Tw5cI+0g87Tj5FjjUApTsvMPVj3EUH/X84xXHUKjCFHe5mlfdcccyVy4zvNzaOLg4kvL9
 Y2EVMsz9hHUZSTWjoE7lr312Hi6Df5/eVEYpIxSxuuesgGj6FWgcI6VytRjr/EO9VP79pohoqYm
 XcuMFi6d
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689ad7b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_YpjYfwp_6jjpJQCciMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Domain ID in the uAPI is misleading. Remove checks and log messages
> related to 'domain' field in capability structure. Update UAPI to
> mark the field as unused.
>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 14 +-------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..495ac47e7f90 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1723,7 +1723,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	uint32_t attribute_id = cap->attribute_id;
>  	uint32_t *dsp_attributes;
>  	unsigned long flags;
> -	uint32_t domain = cap->domain;
>  	int err;
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -1741,7 +1740,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>  	if (err == DSP_UNSUPPORTED_API) {
>  		dev_info(&cctx->rpdev->dev,
> -			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
> +			 "Warning: DSP capabilities not supported\n");
>  		kfree(dsp_attributes);
>  		return -EOPNOTSUPP;
>  	} else if (err) {
> @@ -1769,17 +1768,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  		return  -EFAULT;
>  
>  	cap.capability = 0;
> -	if (cap.domain >= FASTRPC_DEV_MAX) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
> -			cap.domain, err);
> -		return -ECHRNG;
> -	}
> -
> -	/* Fastrpc Capablities does not support modem domain */
> -	if (cap.domain == MDSP_DOMAIN_ID) {
> -		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
> -		return -ECHRNG;
> -	}
>  
>  	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>  		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..c6e2925f47e6 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
>  };
>  
>  struct fastrpc_ioctl_capability {
> -	__u32 domain;
> +	__u32 unused; /* deprecated, ignored by the kernel */
>  	__u32 attribute_id;
>  	__u32 capability;   /* dsp capability */
>  	__u32 reserved[4];

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



