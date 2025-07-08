Return-Path: <linux-arm-msm+bounces-64008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32ABAFC80E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61793B514D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12731C6FEC;
	Tue,  8 Jul 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3k1vUVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54720C000
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969752; cv=none; b=W6fvhfssHHfrY8XE4hZhLZGMFxQnRjkgXIfwJlK0H7P9q8YOwbsWpfE+PSnzibn1R0gSxvYXsF6dH7WqhYSU5S+xvvxHlVx4vxLkyDVHhlVhUoqN+4y4VkT4QSPiMJk1fsQme76MxX0Djh8sxoErcPacz8D5Qqka0c/zMuHXm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969752; c=relaxed/simple;
	bh=4ItLoeTx3HRyKDPaO+sh4Kd3sq4cOgELPmOoot4c30Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/3dsM63QcOyU/L0zk107+MLPqEpLk0g3MNqlL6gir+cHPuqwZu6OX+QZN1YskI4No4HH/GHA0ncmQcIfX/aPkXZk2HUjmS7dZNCgpTDbSKgQL2mgtV0Iva1GRxD2U+u0AUau1st8yuUExovuatAOX5W1UIPev8HR9j/MmyWtng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3k1vUVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAQlq003516
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 10:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=; b=Z3k1vUVja7wSnnnH
	IketGHiTgcMn3mY3jYohCNO+NLu0OEc70r83fThGNsYDQTR0ehReQXLYWJ8uGIt2
	WmaltGpHUiwLkIAIcNIQG+g67x6KooEIKbNfiHsE2of5ftzRhgUX4ru+7Sah8v0M
	zyvO1FcZ4trf1AvEQLHhcDIZCo+g3H1/uJOvK/edJEF5rB+JFDKm94Gn6BVkVWv/
	4tdYnf6ojHJ+cx3C3ACaoS4BYnU3ozlXQGHxamRdv2Hlk3aAuv4gO2u+g+sBs6uC
	/2vMCceBDTCaZZt15NJziT0oeKr4GQgLUy7aQkUVI5XQ+LP3w5/YIqfCGBSA52O8
	YztW0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefck44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so3905496a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 03:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969749; x=1752574549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=;
        b=tROF0hSLRGCJD2iDvVR0H0El1x3uFfGzWS3qimzb8DujksiuCJG1DVyt1uGbSLldhk
         t1ji8dqS8pmegydhSdNtGDFEvSBQLl+rRQY369Cn80srL9F2UWPBL0YIXVV6oQ7blT83
         KHOkt14IbRwo2EwLhbToamq2XN3TrzrN6dufxUNCSJOMl3KLcJ4a4bcdilAhP20G3dqc
         M5Hua38PzOndtRaAfhSEsDGXawLpHe/28TF1ovuSHsuke1pvIpdcm2l79BwNV5ix2eR1
         3dEVF5Y8PfeQuuyb19EfhYZs1A7nwB8+VHEBQ/F94FTog9zk+z30S1KltwZvR15i3WKr
         LyMg==
X-Forwarded-Encrypted: i=1; AJvYcCVUmxPmlnbR5nbaX7VbzOAcF3CcJf0RfLcWgy1N07Blx+vat48aVNQZJUkl9Xkl0QIiYx9YvVWdQ0E697U2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkejC+n93Q7bz9TQn2E22r/ZohpulnBT+rylUW8wZFL9Gee/L
	P3fHpCaRa46xZvkPUX8ovzuO9JVpFcz6P7mIL6SSnW2GwyhFbjYW1bEZXR9rNd1SNXfZy+YaJSV
	SVaPLLGak5N5v40GMsJCW8X5LY2U57KKuZ8Y5AJTTCTWaa2iJ49oWmkpBuqBac50KDeBY
X-Gm-Gg: ASbGncszQNXqaZ5wILUB7LCoB0ft6XiyNPnCgYEiuJ047/SFoEbSR79Pr0zS43+aFoG
	/hEo2ckoRUoV7R2VP4nwsKR3UPdoSpzFPv+8nwIv6yTvEqYingDi4W12lAbMwGsrTrjMzjJEIxd
	LKvb+pl4eyGjiepu6dr2oK7/fUbd2M1hDF0CKCj4DG1D+7Lfp/11HcsUwrRFcx9dnwHzS0fMFTx
	0TGYlI3FUhqNgktgxxB6oJKn0SH84cZSznHlUPt1JZf3uaUKSIYwhVXemtLIPzL2x8CTceL13G0
	dU0GuDZeiT4bS7Nj24KNRs+Ty1yfX+PP0SN5fD3AK2rVjcxP1rGD
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713736a91.13.1751969748734;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxrinOt6UxxB4i1n+mV0391ziMXD2TDdWIyM6jJWyQXxor+uM7US8wRj4S5OLlgpGL8Qo77g==
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713703a91.13.1751969748239;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21d6797csm1746635a91.14.2025.07.08.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:15:47 -0700 (PDT)
Message-ID: <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:45:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NCBTYWx0ZWRfX8ZKATfL4KmU1
 71CMoTI03NKKmOcvRLA7pQUPHo30DVCbUTSPWMnBW2V5v655k+UYDecTq4T3g0HpJ1THQGXE7jK
 4gGzZahijEvS1bivD8a5ICrOeaNHoCugJFspbGHBZAkOCnVCM3fzshbX9RiW7bad8DK7BYtBxLT
 3t+xd3VoIblDOz4Pe+wW74KSrueeoXcHVHhDpt0AqZmfuSPpXnpmHQ5I4nLfSiHkeSIUlSVSYxt
 vCzuyw5zAjMZUSQCqVFW9ht9rKmTevRTTYjxjfBIVEoHVWKA+vHU9H+LYwj01bXIzTQRMvNyFL3
 xff+ljjue5q8HkhOuElnBE5ksppzyJFmqAWRnmmZeW0AGFah/VAnQ+Dz0aoF1o2wH3jLc16vcWc
 /RSqej+Xhmra2Yd31YMkvO0vSMtHBzY2CjNQJnECvpSUf8sTumDVMnfSiDi1vh62KT8aLDoV
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686cefd6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=bcI8x_0Kv5OOx9b6aR4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: jvStkD1WE_liponYH25m_2LyTfv8gsFJ
X-Proofpoint-ORIG-GUID: jvStkD1WE_liponYH25m_2LyTfv8gsFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080084



On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize the device context while going into suspend or
> hibernation cycles. Otherwise the resume may fail if at resume time, the
> memory pressure is high and no dma memory is available.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   drivers/bus/mhi/host/init.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 2e0f18c939e68..8f56e73fdc42e 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   
>   	mutex_lock(&mhi_cntrl->pm_mutex);
>   
> -	ret = mhi_init_dev_ctxt(mhi_cntrl);
mhi init dev ctxt also initializes the ring pointers to base value,
I think we should take care of them also ?

- Krishna Chaitanya.
> -	if (ret)
> -		goto error_dev_ctxt;
> +	if (!mhi_cntrl->mhi_ctxt) {
> +		ret = mhi_init_dev_ctxt(mhi_cntrl);
> +		if (ret)
> +			goto error_dev_ctxt;
> +	}
>   
>   	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>   	if (ret) {
> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>   {
>   	mhi_cntrl->bhi = NULL;
>   	mhi_cntrl->bhie = NULL;
> -
> -	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   
>   void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   	}
>   
>   	mhi_deinit_dev_ctxt(mhi_cntrl);
> +	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>   

