Return-Path: <linux-arm-msm+bounces-67992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F61B1D652
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D04F34E201B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 11:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B54A22FE11;
	Thu,  7 Aug 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP38KEdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22FE1F4C99
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564822; cv=none; b=R9ci6I6b0CzxERBEuctFVwghEUHUxzuzjPSSoCxiBLD3ataVe9sMhl+eCgfiXoqXwEbZ9WuwWvnK87g8djJrAIoofmPQ0TLkLIYK/OEKzEGZb2W+PS6ZZVQ85Q1vstN3Y/skYoiUpAr20AeHLMESJqj0NP3d1nVLbEeNzxcKg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564822; c=relaxed/simple;
	bh=PWMkkhnX3vvqhja9YC5lzWekDzBqHRpC5OdRu/UEuqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoWb46LYdL8SsaLhWlO+ycVX8LjsNPBC3yqpK88ROsjWjBKepeMme3zyrK6jxv53kXcP6QsuR8yPhxLnfs3g3ikQoyeSXD1lN8bw/hc6JaO3hCYvEzfIOb8HgKoO8c+dnr/vMW3PzxN1/XH+BqDYVYIBnNCQCr4KMI8UaF35th8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP38KEdX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cu85011709
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 11:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5nNUQTMQ5AyDnKFFuuhfLnqvTm7neZssafyF8/oIwU=; b=OP38KEdXJyCzC8Uq
	eIQU3J5VlSiIv2cpj5hkLeTVBKSn8ssG1ncPfxyd/LqpavP1fZztoIlMDyoC/aAu
	iZXkoQQnd1PvRy2NE1MP/wLyU/fITiAA1O7FIO3ijqBKBRjoWL0CKsox2KYAjy/v
	Tn2vxGYIoMpCD5Z9yxSUngA79091COMdcMcZ/cOW49CIfkZPS3DvMPKOrYyRqZXH
	d4czasI8vQzPTAaPQR57H7M83qflq/xRHWYUgxU3qZ++TL70qadZD64itgciq5ft
	mAfCWGwcvFkH/vvbWvvNmezc8FSWeZftlqWNg1BOP0DChJkOfQ2dJsTLEHnfQqUb
	hI6bUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy0ssd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 11:06:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af1219f29bso568841cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 04:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564818; x=1755169618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5nNUQTMQ5AyDnKFFuuhfLnqvTm7neZssafyF8/oIwU=;
        b=Jr+BX3Oa1zobWAGpLG8icKFbrhPqKXggjvRJhuVcBYjYLO6nHWl591PQr8D74khF6R
         96qVa8I1+t1zxsdiONGGb4F1ZDzKLHls/torInG/n1WP/J+lnIr2nLDKTjRh6+e2TfUL
         /ASTbg0ap3GTj22ZWW4N6HxpRZbtiilJIrTYawAmoRgry+lHCbk81+Cyawf3QlbftjPT
         r/nloaSAZycHiIfWsIoHFKgH5PH9NKAktBJgglLLt/QJD1m8nWcFbV9vcrZJFm7BApir
         B0lv30P9LtAd83RgTuFbdCCA3P+l9fCZI5jzfkAgsi9+hb3mkn81keGo7Xv0qQhLx0eV
         KEIg==
X-Forwarded-Encrypted: i=1; AJvYcCW4+E7t7xRMf4/73rE36215oLVSXDcAzRWymvUefORQ9pb5Tu6A8r6FpmhAzC5se17biZdpzGoY4PnSTZeY@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLqtd2M8uSHZGeGLA4TpB30Gc5IB0M5ko2hp3BDtJv9LmGOu4
	ahkHmlr7VHILmPrbKSTkOuRimQQSaDQljapUSuaqsUODDHei4zjRAQCnjrtImBHNmPC+LV9b/M0
	pOTWRfkZRHntwhBXHGuE0eNwrXif/eXP5PtuxRdQjByJzG2nnwthSncLfUh/WdSytO1Vq
X-Gm-Gg: ASbGncsH+3velqx3C8NMbqUGXLX7KbsL0JM6YnO3tICbO8GvT0CZTLeOtZr/9iZkmA4
	CKb6jPfB4oJ9alSBtt3xDcdBc+AQPa2UcYcQEkvAPYW+egSuyILl09HQokLATGXFF6wYju+KPTu
	3YErnnfEQa7EMI01P5/uoa0FWoqTEDcs9XbXO0p8yj5vug/tLHGfW+vq8Q9mCeg45eYPgMCmca/
	GWYDyZMiZk0SpCLrY0LUW8rgY9MehjOZC9pD+vTjMqeMq3COL8FJvKDB1gwKDZp6SpV8kAIfpIk
	H7BEtUg0BN6cHptbMQV9NP6TJp/zpo4Bl3CwfyPQopaIZO3OPm1SHlOA/6EPV4LUyLH4+X306/k
	d/k0+YgY1VvANGbC5ZQ==
X-Received: by 2002:a05:622a:d4:b0:4a9:71b9:188a with SMTP id d75a77b69052e-4b091414bfdmr47817241cf.6.1754564818491;
        Thu, 07 Aug 2025 04:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFtc3EdN6HJ63OQb2yikwP4G5bxIWwDho2uGzgH9L+DpH3bfGDc/21pGOHr/8IdD4cEtKr8g==
X-Received: by 2002:a05:622a:d4:b0:4a9:71b9:188a with SMTP id d75a77b69052e-4b091414bfdmr47816921cf.6.1754564817979;
        Thu, 07 Aug 2025 04:06:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a22057esm1281409966b.115.2025.08.07.04.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:06:57 -0700 (PDT)
Message-ID: <4aaa09b8-e944-4d66-a681-a3659fc203cc@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Palash Kambar <quic_pkambar@quicinc.com>,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <c62c2744-0d07-4fe8-8d2a-febc5fa8720a@oss.qualcomm.com>
 <mhridnexscaevsmssu6k3l4x276cj63gl2rlvypym23kj2kgov@pw323zkhqcrg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mhridnexscaevsmssu6k3l4x276cj63gl2rlvypym23kj2kgov@pw323zkhqcrg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689488d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=ftMxJ0LbfJfX_HPbJzQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xv7pkVjQqBEsM3xgt7TZdsiREUKlQThG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX4IhKiBBEt0dM
 DvOKUTOKwzMKjoOkgP3lXgxh2feG8PShso7a121RkRwJrjFEEe839cRYccXZLq8GxuofZd38ssX
 uLEutXoD70oev7kcydd61Yscrb/GX5qiyKZrSlROu7gYMXX8Dx42HbyOZpRqmen/C5rYLJz6onY
 n8K0koAxCoAkeC3yUAdAd4KQzcs2Uco+Ld9ptvLf0snhF4V30l+IUDAvYpyhQSB8f1fcKU985Dp
 REOxK77k3pDMiZZLnAQn85EhhIRfCDk1oogKd5jMvG5CiM0ZRwBgTEJgwjgpc/8O0CQ/CpbEENp
 j/Gft8Kw+A0gTen2tBAYsBKq6dlQ74t1cTCGEeCy5w1/d+oOoFH+CpBlcNxwxaMIkMvHEKlxVf7
 DXnXZ+Rr
X-Proofpoint-ORIG-GUID: Xv7pkVjQqBEsM3xgt7TZdsiREUKlQThG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

On 8/6/25 7:39 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 02:56:43PM GMT, Konrad Dybcio wrote:
>> On 8/6/25 1:14 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>>>> Disable of AES core in Shared ICE is not supported during power
>>>> collapse for UFS Host Controller V5.0.
>>>>
>>>> Hence follow below steps to reset the ICE upon exiting power collapse
>>>> and align with Hw programming guide.
>>>>
>>>> a. Write 0x18 to UFS_MEM_ICE_CFG
>>>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>>>
>>>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>>> ---
>>
>> [...]
>>
>>>
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>
>>> Why do you need readl()? Writes to device memory won't get reordered.
>>
>> I'm not sure if we need a delay between them, otherwise they'll happen
>> within a couple cycles of each other which may not be enough since this
>> is a synchronous reset and the clock period is 20-50ns when running at
>> XO (19.2 / 38.4 MHz) rate
>>
> 
> IIUC, the second register write is just reenabling the mask, so there is no

Yes

> delay required between these two writes. If that's not true, and if there is a

Yes

> delay required, then do:

We don't know if it's required, the HPG makes no effort to clarify it,
but I would expect it's probably not instantaneous


> 
> 	ufshcd_writel(0x18);
> 	ufshcd_readl();
> 	usleep()/msleep();
> 	ufshcd_write(0x0);

You'd still need the second readl to make sure the de-assertion has
gone through before proceeding

Konrad

