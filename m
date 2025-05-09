Return-Path: <linux-arm-msm+bounces-57434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E68AB139F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5158F1BC1FFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037032900AD;
	Fri,  9 May 2025 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnLUUF76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A612900A1
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794389; cv=none; b=VDdmedRYJwYJxJ1zhS6yyYXjjoIrGZdY9VLTsneRLq9InVNIPwyOdOqaKj2hlkF6rIQSQH4NZUg05DYFlvlWFYY4mKxgqEA5kE34AUVmoxQDuDgR7iZHYh8i+g9NiDv2ATMVtLrEQrnZky2vdM7/QF+/fH5PbzeDSBzaAt4dyIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794389; c=relaxed/simple;
	bh=/yVwv3WnxQrh5A9TkAjLUuCLJpOPoWAN+elytrliOlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQ1eAAUsdHnDgdRh5mxsMhvHjZmo2XQnsywfnp0Fvfnes+Tmr+hP40yjaG2IIwwNQffL75TnEh+YoTeR6L0WlXAyGXSSI2yq8ONOhdgaZh2yaHzOHUMzUglhxoEvn+k5vfAzlXD0FciU7nJiu/D3lcdYZf0pWW9kAGF0KitB730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnLUUF76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BwV7T010240
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=; b=KnLUUF76t2PuxaRe
	ypLdVnGyaLLu66zSCesTwxcmWkL0OyupdYnP85RjBJqaRGr3Y9mUdsW+WGmBbHZm
	wws1I6B3PDr+y9fMgwCJb5FCfEkN8nQux7Ehj8rJ3IQjl32nEaRzJ1u3BprW+mOo
	V2LS3XUHbvTAglhtFTLVcH+eM19dSORNU1foWMKmfzu+zdhQZ4lLFfcgZg04W8An
	VlF+ir97v0BI3kxI6xJzWKEvOcamssCsPKrjRjcsQhRPtUyjQ/6hIz+c2c1GtnjE
	KTum0rXo7u6+h16SjVjI6XOvOhY5pcWGcl6CeIK9gs7SVOyS9JrWusCcMu2UMqgw
	/aeATA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7cr6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:39:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso50663985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794386; x=1747399186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=;
        b=Lv0rXxVwzh69+akIdGRbK5K65BCRYUImm3q7KuNUSHHGW4HvnMkkY14JifkkyXnwB/
         NCPQHO3H+NSjjNxGOvYCdzdUJqCl8H2NNMuaQTIcNb2+rvK2pR6Ocd7EJp512PUHofHQ
         lI2wlZgQNst/GpQ3HSytydFa/WHw1OnMjBNEmGSf2+6LZsjAdCrp4jNQJ2VwKmLucrtu
         L+NugeXftUIC9koMduibm5yuhT1OeEHy1JF+hBuipOOCzYu+qqFR3oZZ4jXFKlb9GzJn
         ku9eSPg18Coalz41h+SFgiHOiDKt68BKTG71CH2PuBU9B+RttZGqgB3L1P6EHjjXez7b
         Xqzg==
X-Forwarded-Encrypted: i=1; AJvYcCXDXY7qcEHgRZXeSzV7fC27Mdro/N8SMBJDkBgTo6YdAorOG+aCjdXoIoNFS1FDxzTBtCRKr6MQTbyCh+2/@vger.kernel.org
X-Gm-Message-State: AOJu0YygHoSm7XlunrnSmsKyvmhxs18qX9RfFpxH2tFJrGIr+MPUpUyq
	h+2cM0PH4VvGERNWejOWkhiYp9wuoYSg6X/DVb4Qoa6NKh3/yhV8xciYiR65l0G45k+TIkUhOJk
	Tvodk2LwNRTi8meTcRqCiZik0DPalz14LQnAwzEKdoVdjiHoGKWqTiuz5ySvstEsD
X-Gm-Gg: ASbGncv1N/RSLhsDhn2jk2pQzDAn96kdGIwmivAyUEzJvYCZgON4aTX1swptFQHJSP2
	Jrz7WvUaWb8X/iXFn3KoBb0cPo3NC+7UCknkJWpXCNqSiuV6n0FGCGsuS6WbdHbNXa37nmk/zTX
	jCHgJZQKWLmBGbB3qAfVmEPTe7Xch4ICCRixAaDiQD7P0vJ9qW2/CdxyvtXQXgkVJyXpzhcNieT
	NdqexBji/o1aZglwR6PSBSbAvx+QdDQce7b2VdHk03iRGBix1E9p8TPOkzGOB9cBPn3bL5+LxKM
	oVC2IPu3G30L3LfdeW4K6ifxI989j4rB6GUUGKXMla90XPlIjIOBrwYdOEaTLrIfpfQ=
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id af79cd13be357-7cd011186f3mr194765185a.7.1746794386274;
        Fri, 09 May 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhQplMN/T2Kquk8OAgFmlti7cmfd722WmVfsRvtwRfluidvoeB7ua1lUBaXYSIjte577KX6w==
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id af79cd13be357-7cd011186f3mr194762585a.7.1746794385893;
        Fri, 09 May 2025 05:39:45 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746506sm143082866b.88.2025.05.09.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:39:45 -0700 (PDT)
Message-ID: <b374b468-819b-4f5a-9ecc-0926c3696db3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
 <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMiBTYWx0ZWRfX8ra2SHX3JgF4
 VHbK/ZYXYVW/nRV/8EoFX8Q8i68afJnFTghk69VCoBDrXeiSv3h6366je5+I1suKWU83SuY2maU
 6DA33BqyPkFcUqxXCl5cOdHW4ucEcbY/UgbsK4vD6xIBflLONR1i9UDrwNewOcYu3FuRlPxTgWI
 DgMSYPQEEtaQFPTCRXrF0JYBJJgNMfHiWBKROZLkASOg6SUcEj6+LFIuEJisyIiOIHdV/jLXdr8
 So13awE/7skOWdt3M3ktz0Rr96K7CKpmIQ6sFg0T6lwVY775qjeujT3L8yiqMviEcB17tXokF+1
 S1iytlt/x4l9V3PRYh2KY1+LUw3bZfuc8cJ1hn2xHPOEHSreH8eN1nBvJkMhI8wXRg8c7Qsfe1Q
 afbGi/uxac/Jj5jocmVvyE6YQb2sqz71vY+0PcRgfsAJovyasi3gOKjerhsBoBumMvSTJf4w
X-Proofpoint-GUID: bzhOCuZW9EoBIPW6_VvWpCdmYV1dnfm8
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681df793 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bzhOCuZW9EoBIPW6_VvWpCdmYV1dnfm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=886 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090122

On 5/9/25 2:37 PM, Konrad Dybcio wrote:
> On 5/8/25 8:25 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> This bit is set iff the UBWC version is 1.0. That notably does not
>>> include QCM2290's "no UBWC".
>>
>> While this is technically true, AFAIK the only difference between UBWC
>> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
>> is why I originally wrote it this way. There's a bit of redundancy
>> between the UBWC version and ubwc_swizzle bit 0.
> 
> It turns out to be a hardware matter

Well you just said that.. in any case, i can do either (or both with a
sanity check)

Konrad

