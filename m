Return-Path: <linux-arm-msm+bounces-58420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C6ABBB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626DF17B278
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FDD20C038;
	Mon, 19 May 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8m/+Ca4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160A1FBC91
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651866; cv=none; b=fHgBtpxYu38WYLK1SrqdZh4v6MQoh+iY7kIXKQBQ0iJBlt5KY/ShKr8TVnfR+KM96wJIrYKsMpV0HYsTa1+WIOo2cpM4M5iKFCQjnmA8DU9i6uvNs0to9r3XBhT+zH9A52MC9TCneDMBZd+MF9MhPpKDrN9gDK0ic5hwBAP6plQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651866; c=relaxed/simple;
	bh=fAR9nKYcV4t/ayWL3S+lSRVaIzQns8SH/L54gkPLy3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuzHYw3GGFs9SEMypV3phsplFEDhvpX3DMPbDvShc/7zYIpXYjbRWepbOmLhF8mJor3LxPaWJGTRoiSuf6mGNwSSCmrEdrdc1rWT1h2dZm3ww4J46zyllb/HzPlJh6PqGulLOXu+u02PZzASRDkwcySTzXNtX+6+7Knep9bZVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8m/+Ca4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6P3OG007437
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3ZSSQ2BI0FEr1RhjtaD3Kk7h1vCtQqbskNrhnolMwk=; b=E8m/+Ca4Ch3aL3Jm
	J6enJbhJ25NnkzwelZrjmGWEssbSpQLQ+d2AAK0E0V/+7odlZYaXlBrZQCVFPSdL
	K/Ka3OZ4FA/nQ3GIZxkldtbpj2ZMFT9xllqKCqdE/F/XQsqCGrd6DuGx0B1RGHaO
	VRxu+lWLF8mH7hx7M0wUIT/al/fyqUdk8P64evDxMS1dkExDFKJP+uZbl+pZoZJb
	magn/m17S4d9V5vKcU1hTPQGY/h86MT8FCN+2lTZs3ubAt6SjvRgyitcdmzYlOeX
	0X4+yfvrdVABQjc1dT9/6WyV3mjpvXnLhpVhtzjPm1PiIPJIGyi0fNeCOZyCI9gO
	s3ul7A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgtk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:51:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b270145b864so835639a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651864; x=1748256664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3ZSSQ2BI0FEr1RhjtaD3Kk7h1vCtQqbskNrhnolMwk=;
        b=hbnmh316+yXVuL8dI7CquhOEsKb1/YaxKYj8aASY/uXvpEp6BteWql3omJ2XM43Gqg
         Xxjhma10dCY+cH9acM7A6bay5/c0C3F91x+jt8f1rzZOkiCA0eb9jrv0UjpE2XxbplAE
         icKMBRHsp9qGrR25ZQNxELU0v1gXqUDSis0sCHkNKYzspy0hbIprp0oMptruImv80o/O
         XwviUDcsQl640OjvtFR8VsDmxJPzimBNm+sT4pNcCpmRByX5g6DiDRKLxgMpXltAclK2
         4nkr7ylhdXKIX3Z5So+8g7op1Pl2pLyAuy4NrXNSn08W93Ick8CJa2rfc2OiTbpk2ZML
         WhXQ==
X-Gm-Message-State: AOJu0Yzdismtu+8TVOYhapT68lOypGCZqIOw7ocPsLfDAP4qeDoWmukr
	nA6Pjv0JLYC+M0Drsd5z7Am7LpcNQ8ILWedji+th3VXG8xcp5bx9xfjzdflPqdpjIQFwSWQUpA8
	leiWWyJvYStChnadu5RZNQlSIYZpHy24LnLwJg68u1Or3o6n2KJNsCe2EwcJG6HgfYQ46
X-Gm-Gg: ASbGncuyGVXrsdT+tqs/sO5du0HAjVxxdcZvtxLdvGcp/8AShtGAzT524YNAKaNhZ2D
	SNq03u6LwZuv/2H9bLK/BYQR8Q7aKX3Wh4j8KXWZu6+Um0VIRz+qBwHUcB1f9Ax9ilU47v+ROSF
	eSclHoYkCVL24/r5wYVB48cq+QNAElDOjTEjCBiXhB6WUgIfMb9RorgYV36hQxJjOmlrvimte1f
	yj0n8kvRdrc5GB/Zbst5YrubuxP7yoiAEq9FmxL/faYDsJPSyAXOeXzRtIjORxgu5+CLn45LdMY
	Nyd5sjK2teFS2jGYCO6g9ww+L93gADfIyA9s9w==
X-Received: by 2002:a05:6a21:710a:b0:215:d4be:b0ad with SMTP id adf61e73a8af0-2170ce19e95mr18160183637.28.1747651863669;
        Mon, 19 May 2025 03:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRUZHj+keYyh4tvRJA0RMopjYd9Ue0jtkb++xI97wCYj9qcOcTnyB+z2V9xA/ltGj+bmNFPw==
X-Received: by 2002:a05:6a21:710a:b0:215:d4be:b0ad with SMTP id adf61e73a8af0-2170ce19e95mr18160153637.28.1747651863265;
        Mon, 19 May 2025 03:51:03 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6e6a5sm5931497a12.17.2025.05.19.03.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:51:02 -0700 (PDT)
Message-ID: <2b1f5b07-aec0-46e8-81c0-9f0090828ef1@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:20:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
 <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
 <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cA7wrbmOcj057tz-Omt74oOcnP94_-PE
X-Proofpoint-ORIG-GUID: cA7wrbmOcj057tz-Omt74oOcnP94_-PE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX+kn/dtiFPogG
 BxAV49ao2Eczk6WJ7rCldsL2yElc8oL2ril4CWT0EVh11ADXN13FbKoRwzofRX643DWtfIHYEzK
 bOcqOxFMPKkNcnALgnSflbYaLzr2+FQWNZ1T1IKENAm8RLVWmknT1ZxpgkrYMBSiQp/0isu3HBk
 mZTn56Iu4ptEhoNfk29G+vj5uKSRFTjtIthhlO0o6I4OFrx5SBZw5ye4BifnoU15YYnC/pZ/7XE
 Nv4aoIhmGAbiyZHUwYKPBFAD+beidPgao6mez7bUHZAsdwZtTjIQmmg3TGNI383E/y6liLgIu9a
 yo3UFKjNxtp4VZBhZNHRhyPL446PJeObmmUf8lo0O/HKDx4e9s9kSI2Qd+0INA34wRXocw1IVgf
 WOnP9i+pP+q2LfgVQ4UAmNuMqwJn0d3zIRIWd3LzHLlDgvmMT8TNZ1sSmmbsD1JPM8m1ROYu
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0d18 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5nem0Mg8QPlJnJBmK2IA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102



On 5/19/2025 4:10 PM, Srinivas Kandagatla wrote:
> On 5/19/25 11:09, Dmitry Baryshkov wrote:
>> On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
>>> On 5/13/25 05:28, Ekansh Gupta wrote:
>>>> The fastrpc_buf_free function currently does not handle the case where
>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>> dereference, causing a crash or undefined behavior when the function
>>>> attempts to access members of the buf structure. Add a NULL check to
>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>>
>>> You are mostly defining the code here, but not the root cause of it,
>>> What exactly is the call trace for this crash?
>>>
>>>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..ca3721365ddc 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>>>  
>>>>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>>>  {
>>>> +	if (!buf)
>>>> +		return;
>>>> +
>>> Most of the users of the fastrpc_buf_free() already have the null
>>> checks, It will be Interesting to know.
>>>
>>> If we decide to make this function to do null null check, then the
>>> existing checks in the caller are redundant.
>> I think it was a primary reason for a change: to eliminate NULL checks
>> on the caller side, as we do in a lot of other kernel API.
> Lets remove the existing NULL checks at caller side as part of this
> patch too.
Sure, I'll remove the checks in the next spin.
>
>
> --Srini
>
>>> --srini
>>>>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>>>>  			  FASTRPC_PHYS(buf->phys));
>>>>  	kfree(buf);


