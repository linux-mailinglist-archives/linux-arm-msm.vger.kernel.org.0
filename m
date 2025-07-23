Return-Path: <linux-arm-msm+bounces-66348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1768B0FAD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAF69188D6AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA41221727;
	Wed, 23 Jul 2025 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koS+cKhb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A1208994
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297855; cv=none; b=I4nfZ7czauIhAw6fXDKqj4PnXdfeRQsSCr/oehVHZ6kkfQLCC7K1ej2MNwJVnnxbK5+WqEoVlx5Zf8kCqknei4G9u4Hwi5UwYj84mc1UJep7Ncs8+waRxBe/MM6EPcqOhVM3D5HFzUG1TR/mtB1IKOlu53Z9ZrXKhudBf62bnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297855; c=relaxed/simple;
	bh=XMbqwf1g/qeYxxwegoHGwxwKfx614CKpPGSZP+z8OyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvpQWGYuEvZR+LD/xLk29QSxOsgOscM3YgIH+RASQDLy/ofQzErOqyiD1ihtP0xIlM51fny0FX+Zyg7eqd8kXzzd+WD0gYN11DAvtRdI4rBU53HIMsAHnRREtzqjAFDQGGJ/UF9wSTQOGPycFyodcIx9y0/2osJp9LE0PXaybMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koS+cKhb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH7KAq025715
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=; b=koS+cKhb+lq+w662
	kXqbKfL6yTiH0OJ2FtDGxz+azvW/3i8pGhqAoAaEyfTj3y/t7BLszI3SyNZq+g+B
	OTLXxVh+07Issu4T9bMhYkgcC5g7yCp3Oh09b1i0W1W4sSHSchPWCOrA+2ZrHl5Z
	IFj3fOrGB4syUhU+SerDrUSMfG+iFsOsHuiz8VkG5l7OCV0u1L7FQGXDW8b3/Ydi
	QJzdRTA2zTOs9OVl4c/FbCaLRyXCCOhHqea8WlqH7xL3DpVTkFGpN9ceovdj+QZK
	Q5L41bzy/qZmhAGRNzzWZdTVS3ZdhcZeHHANXql9pKz/R/zvMBHoAmZmxPfHaH3K
	4Dvb+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ucvh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:10:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso145447a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297853; x=1753902653;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=;
        b=NnNam8khexsMLG2mQMmK4kMVl+NDSbSqCZAKzECB4snv3qMoYLEVaJxGyEPb5d370q
         nZEj5KDyZmU6voqtoyGMJTUrVDo1Vem9Hz7LNCLrQNuO1HUErZNZC3oWdf22wli7Z20+
         C0EjCHOE9t2zi5GUhvwJOLlhW6lNjDgFYhtq5H16XmPaTPJo3s33sHDtYhYw3KmqBxdn
         e+aFZ4Zk3TDyVNcSmbn6g51v3AeCI3AbLGGngD5oUc906/IoVBfABghAxYDnPMYieY7i
         CV9Dymbr0aD/ajHNuogAqQQu6WRzcQe3lGw4rE5LD3v9H+eXvX1IsiWs+417AYRRyp9J
         d+Zg==
X-Gm-Message-State: AOJu0Yy5OwCxVE/NV7Pom1SAfVtVBPrf9j+3+sFeQA21aNmTmZKzyixY
	r11sbtpMfVeZ8GU5Obm2tWXcOv3NiNe5Nlie/AxELqTiMN9aiEwhHOLjhsnVNtAYtfKLHWpIOJ4
	CLNRNfTdfRhuOF3/AfX4BhGCfW9av7jzriKra3ebSehJqELBJ0hr2NQTFMfZri8i5QgsR
X-Gm-Gg: ASbGncuWf0Gkk8b4xtqrq0zgSZ5SocjhtbMUCpBu6l/6ORuBXf72t5J3o+12sbXbxos
	OkWmnsTus4/opMZJJD3RzMd4minlckpgHcFiYvoKRK3/K30fs2+yqGD1fSTl2vGTsMYK2HMl6yl
	8wROCT4PAiXhRXU2DybYR2hN7c2LXMCUCOMZX74lzyi1bXPgwSQ3eLardL6hTLJN+1i1VfImE0A
	eBZSJQNO5wr31uTWSt7hg5Zfbg58i2A5QjlyEnbebh19NZJeKB65EN2EA2p8DD2UtQ25nHyv9ws
	RdAOr38XnM6zHRCc/5KSk3txdqkkch8LbtoUJDOaT2auet82Isoe/d/6I2KpaWpk
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id d9443c01a7336-23f98161a50mr46228345ad.6.1753297852693;
        Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3CHLM1wF9WJWdlUe1Sb3b2TPPZfOnw2+jdpTbeD4nUnNJuQbnaKGQAjcRTI5pJWuujuk/7w==
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id d9443c01a7336-23f98161a50mr46228085ad.6.1753297852153;
        Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3c89sm101986125ad.18.2025.07.23.12.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 12:10:51 -0700 (PDT)
Message-ID: <100ca94f-e1c1-4cc3-8282-a14066396f5a@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
 <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
 <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688133bd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iAeCgxixrUXn6QA2EFgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX2xbi2N5Y8e+o
 PQxEN9ehZeIP0+jCQUBt8fBxrokayvE4Z89OlZuMTXpeN4MpxEsyl1JEV58Ur2R6ZZXaQGz2Cg8
 tcKRI7GUbGRrPkCfwpUf4MYoiV4AuwxdYMISOdS7NnnhPAjFFHPIEF2QYJLABC1SoTQw/IcngU9
 u9EcwctLI6LOHtWYuhujVdjZ8u8wGBWC+jAJJeV5RzsvJiQAc8Bz/L3BVzvUNgKEzcgd/ASkV2u
 otKiKD99Vn2RbYiIObFmZNj4dIcFoI7Lkz/AmNh3avtsD1DWQLzHJgPQJwWFX69mnGZbJAr7WMT
 VXFSf1wbTqKhajFZ9LoydwGmtarEg/ru6iyxtRzaeUbXZIwdjlCQwYL250Uk7OKem3BaskLYHlB
 eMoPl5DaeyQpRQVTmj1mroylVSjd5cU3AIcTJbyFyACSinejiRXdR4KyjrOyA1ESXk9kAx3/
X-Proofpoint-ORIG-GUID: yKRMPScf-GWapJNRYiMdx03JZlRycZUg
X-Proofpoint-GUID: yKRMPScf-GWapJNRYiMdx03JZlRycZUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=867 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162

On 7/23/2025 3:43 PM, Konrad Dybcio wrote:
> On 7/22/25 9:47 PM, Akhil P Oommen wrote:
>> On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>>>> a single check. This helps to avoid an unnecessary check and return
>>>> early from the subroutine for majority of a6xx gpus.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>>>  	int ret;
>>>>  	u32 val;
>>>>  
>>>> -	if (!gmu->legacy)
>>>> +	WARN_ON(!gmu->legacy);
>>>> +
>>>> +	/* Nothing to do if GMU does the power management */
>>>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
>>>
>>> This isn't quite a no-op, but I can't seem to find what the '1' value
>>> would map to, even in 845 kernel sources. Do we have to worry about it?
>>
>> This is fine. '1' seems to be a low power state that was removed very
>> early in the gmu firmware development stage. We can ignore that.
> 
> Ok, good - could you also add a define for it, perhaps something like:
> 
> #define GMU_IDLE_STATE_RESERVED 1 /* Cancelled feature, never exposed by fw */

Ack.

-Akhil

> 
> Konrad


