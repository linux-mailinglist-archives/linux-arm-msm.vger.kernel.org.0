Return-Path: <linux-arm-msm+bounces-63921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F675AFB26B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69A91742AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2F029994B;
	Mon,  7 Jul 2025 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4i5fxSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337219E819
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888347; cv=none; b=sIyYAQ6PvuFdihiaYcv30GH3oW7ho9zkD0w0mdwUN4D42oQ4B0Yr+YYFpI99pMJtZT3wKpN3+GXyanyF4iBhfgg/9YAHa/icMKJnjqG8nw35dp7hv6RwZUy5qD+Q2lhDptVGyeN+HFkufhhfeyaxpJTE86zTZ1U0QG9aENRt71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888347; c=relaxed/simple;
	bh=ZmezPv1rIdGYHYrJ58CilZL0h+oTSbTQXl7wE/eVZrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQ2C1RvHDbdhsXs3m4KAO2p/a2mmKD/fx8OW6Yv7313GFzltIzlcrk28h8ke3Txe/BloPbHn3iwi2V1Ua0ydS5zzD3yDI1NnMasWv5D5h/CXFBUjwJ5wCJRWzxjH3Cfvo5dRMzo6fKwz6K5B1Am8MLVBtFcYQbtV1gcXJn6ofPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4i5fxSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676omTo013069
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=; b=X4i5fxSyp46KSI99
	V2EiRuQvPOjvULnaHqZ+39V/fqhpQcRfmQoyPhCY4JBc+SF5y+IsVSemm4ElsnF6
	bKpLBnZsYR0kD9tf6m67lhEg+e8a57vywOQKuXk7g0KKXdGwgUM96xQprDEpMEA9
	YnmbmWcuV1Hvc/J05bxGbwxC+AyfqBm6ocol2IgxhoQEoycVkFS7SxZ4xSfaFLTW
	DKnLYd1mHpASlc4bl/J4dAua4KuwDKcw/nfmnMfK1BA+E1aFfcJPPqPJMwGJtPCZ
	Kq9kY/CYM4aGAA0IaukaC9k51XeN8/K7CALjG5Ueq/5xt7u0trNXHlJk+Es46XTZ
	/Us1+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0j6cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 11:39:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso9068006d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 04:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888344; x=1752493144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=;
        b=E5WgP7RtGm7DQtl5lO8Ko7ua2gCZ58oSOc803rLfMqG9i1HEhEEcixw0hudsPZ1hOe
         0ocA0Cadg382vU+xhDPYYbz11epKsJlauN/H7BmT7lC1sn2CvKtn+qtDglSYczReUsib
         kfRZRy5qEUE3GUNEr1Wd8s42j9td4gtFTZ63MYUOZsuyuyDHNNopO1z0UdkE0PxN/+9y
         LJROqddusfgx3dRaBnozCmDtUN7NandqMwLTBfGfXLC2Yh29X1soiNM8toJdeaZ9OdXl
         HSFbg2IF2z7fmXJ4zzd/bmOwnQBV8fNivp+FAa7v5G/+NQ7Sa6B2pZL7OKasMX3UAwjZ
         qSTQ==
X-Gm-Message-State: AOJu0Ywe3FZC6zG5JRPZoi2pX65Bqt8XoEs6hsmv/Pwi+6+2pdib9KIg
	KtWhlX9ufR3mlxoVf0hdMFOd7WCKxF0jrUGNjZ7ZlqnBoleVmfAI04Br64kCjDBWaksKsL5rnPB
	iy5VYvj0mitUFUlE42xDHk4OQ3G2tmzXwAHSZpGhrKjAlZxOPweSTkSnVRdMQLnPvH2WM
X-Gm-Gg: ASbGncvzeQIXaH2LNiUMZhgx8jXh3MNqWOeWQyzdrvEySY5bAPJ3FGtF68qD9XGM0qO
	EOcrZDP7W8cTKncMe2HfsWcYaZKujl2mZRtHP0xwCYS0CUt7WgKboPEhgU5jaDKBKUY7DkurTNu
	JOUin300Tdq2EYXtxYEeo+/XDrOJXoAXr3h6OKpLgLqEVzdN9JqR4yXG5yN99irWKNYpvMGDxO2
	XoeL14pH14INLQWe/gYyHx8+kfo/PTfjrRWUE3Blg+PWmoLUbRi4AzlXJoIwAt5vyFyfHB4xKCm
	F71Di46lxMg7oNum+tGp96ppd0Ld2yNE5MalgTerMeJ2p4EQ5JdNwfe3mJ20CHTCKHCpVSIsHvZ
	DxwM=
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr618519085a.10.1751888343960;
        Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlBB2pZnjJvy4s0xbnO8kJfhSozJw3RWVxbenXq2SUi3yJy4FIatJ/itKV8hIZ8ggcPhrWw==
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr618516885a.10.1751888343540;
        Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb0ffdb7sm5366403a12.53.2025.07.07.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:39:02 -0700 (PDT)
Message-ID: <c7ecbdfe-fee1-4299-9998-387d61d333a1@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686bb1d9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HBZm8QPBBmupa505GRoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX36IagxGhWmZ1
 vRR72778xUfR1su5EJpvTqvmcShmKHiyZUxs3Xm6pUq0gftT3I7Purl1Bo1gx9OQWVR/tXq/vvV
 hc5F1JOF78RCtnXMCJb9L4w0FHCMKI9qrr/D2Cb2XGuIkGzB6XaZ3r7z6mFloiqvI65W6d7QQjc
 2wciuCCqHYctUlt/Rmv7AusV2C2T++6C+VOAZnWkD9Az+85FU58zP5bu4OYVpjWX+B+b7mWDpkn
 Adas4RJZDksjcu5fc8VIQX0KaQCKzUKZbZtO63kI8bpyw7UAEfF2gRg/wvMZaRMumoeMRKyXotW
 zy6P/E+vV2dXCe7pHCK1m/pzktwIiTMH4pNXn06iuq1xhoDXWSQ9E8wvAKgsYUQ7oqMfunAGqEE
 2SOpHgl0SwkpATwAvBGONEGG9NBYbVfotHUsbYeCDeCG/9UTCU0mKeUTMIebmbcz8R8Mt9/R
X-Proofpoint-GUID: H9clz4b4iWJWbAnKx8E2I4MSsAdbJGBE
X-Proofpoint-ORIG-GUID: H9clz4b4iWJWbAnKx8E2I4MSsAdbJGBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070067

On 7/6/25 12:50 PM, Dmitry Baryshkov wrote:
> With the switch to GPUVM the msm driver no longer supports the no-IOMMU
> configurations (even without the actual GPU). Return an error in case we
> face the lack of the IOMMU for an MDP4 device.
> 
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
>  		return ERR_CAST(mmu);
>  
>  	if (!mmu) {
> -		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> -		return NULL;
> +		drm_info(dev, "no IOMMU configuration is no longer supported\n");

"Couldn't IOMMU-map buffers, bailing out"?

I don't think we need to assume the user has knowledge of the driver history

Konrad



