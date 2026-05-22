Return-Path: <linux-arm-msm+bounces-109343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIDUB+NzEGoZXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B95B6C52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 171B5307355F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA1644CF44;
	Fri, 22 May 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i53jBIPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlpqnUsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72305407CDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459695; cv=none; b=VADm20HJVFVso2/FZMNezIrAH6vaL07FO/bq4+hszI+sgn4B8YL1Z2m3AqhDxzghzLn+1ynekPZnFDLjtmTOSssDQZQfdY9sjbmmbvx9U+v65n2pNUC+IiTUDIgCJVH5ER3h8qXGjagyjb3/sGVC1Pcnqq/eRANrSqw8wivuo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459695; c=relaxed/simple;
	bh=8mJGK1FLLZUOOQnXFpViOauQDAtWi2US3DDWyQeF3nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un0S9MQTICgi4ch4lglmkf8r2UX/UzyLS+cfmLiWq5goQnIlpcBZ1jo5ydaBBVln9Gt+n9gJZekGYVMdV4d4rmzh167PEp3mMpT2vzTYPTvo0Z3NAFCjILAU3r3sY0SEfjo6fXfYwB+pW1f2I3iicT2ouHTxfWTd5VIhP9lQF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i53jBIPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlpqnUsC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBZUup1297958
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=; b=i53jBIPC/i0fJ+XE
	U31AvAFJK00Aw55SLFDhZpf9lvBlALSDqdHh83+TDNR4hZ9LMb4r6C5pvR3RF6sc
	tz+1NaA9oVMMfS2OE74RLPcfsTrOc+/HAHZfoEa9fToc+kkNpA+x94/S9Gn0hDCS
	GYa9PIdAmiM/jSqOm7/gjriNvVSLCf7fcILcUCrOgw0ks5dh7mQQBUpHLXTPAfzk
	0BygaLwdAcCIgymhEwPdYoli/ZQs7HGFxDmti17UqaVPnSOk6gh3deoEljrMKkim
	M+E9DVkYdXwhbXglNrn4dCnB0LTroG6qq5SSKRePg+jTBKw58ePQxP/rssPTbKkO
	8z4+MQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0baut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:21:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369ef27fd09so5641875a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459684; x=1780064484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=OlpqnUsCzZVbNsdKNnixOjLZ7Bis++sL7BPV6GHUpSZz+HcIoDm8qd1vbVA6BZKuMc
         cghioC2QVs5tZEnyoYmwXeygayTR/a9KHgLtZGRW8C/Thkb/znthS91VdIx9C5tWEh3V
         ZwouYa9DQXLJy8SQPftd+6U6j3BeF1F/vBiaBDL7PnjoqM0QhyVBBsWcjWlZX78uYKMr
         HF3YzDth3DMzndtpz7itT3rOX8VwW0dIaT5yKMOWfspKpzY3yxvDsjbFGlzU2o2JXbhC
         grH+zOjIMNoGVA085MjDfSPS/D7WKpltTdaW0CS67/3hsWoIVXZGmJ1rxyVvrQiglqX3
         XByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459684; x=1780064484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=CnGDigPiTV+EQ7M2LLZFDrlUcKBx2cbernPkrFzlfbsdp+I8UhIaIXCa5HHovVB521
         BGYbQBMkf5b+65VKqGARJFWrvzDtz97C+NC4WWsT6eePUwW6II0PXwOaY834Y9tgIJJZ
         L4tnHKlf0Dr2TPm5qwfvBkR2mK9OZeVHgzKJSH6Wvp7jUNkpprfU+W6Ce9OTtxpl2wRR
         q+mtxn0BLpAzI4esGD5xrhCiYdxOkIKoln9i2moVEgBXRUVROfwgg3bkkGtS6BxztQ4K
         q36CoZcuvbprEXxpyfRXjDBez/Q0iDszpUdB9Q3G1ze6I4Y9twBXkpK4GjTeiAdYX4g+
         ZZHg==
X-Forwarded-Encrypted: i=1; AFNElJ+l9EItPO6V0IEOo4s5Qrhx58A32du8TMNEg0qOAm41i9uNttm6LgzrAZw8hla+sT3S0qjpxsi8sln2ZOL+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmA2KC/LK6dCIf3PzNAumyhGGEl/pIOWQUaao3N1ChMq4bBSJ
	VIpE+nzonTaNBAA3alx9aEh3JLyoZaW0+IPWfFATEfUGr80MJgYRUqsa/HTjRVlN9I/utP+Ngq2
	8e+dHSKOKFSFV1dYzccQemYEalsQAuXM7ABWbiPYPd0KlM44zXjMZVhI749gEI9O6wPV5
X-Gm-Gg: Acq92OFUBSwDcM6r9Spa1p8tDNfawmYujLoUkZ/2WsaKdwlqKcLf+B9dgKjUufvMGUp
	aB6WVuaIo6jqyVORBiehVF/w30nEDHcW50FvLWV/N9NLnLDPb+jf5HSRae3+JXGD20xLzEtDZq1
	LRQmhFkcUu86w6WN9RIePB6En3/SZjabxpmjKUci/vs92ep/SaRTvGVkybG5yPNHLHFPEQepgrk
	NwJQY8Gw/vkjGiMBEyidWjiqCA0p1I1GR45B1NzGAqgV0lXs9YeqB6cuwl8mholMriXeqlIxZN4
	jR0R/sUm+1pX6bKtGSB5l8kDVSXF8YBv3jra6cl+DhKghUEUCRSya0vuGo2ffodsLiqzd2x911s
	FzJGhA/VzhpcL3jcob4Tpz2qkyoRnOGtOCUKylWgzok0se93rK9NH
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494374a91.0.1779459684536;
        Fri, 22 May 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494333a91.0.1779459683996;
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6f0baca7sm1350671a91.2.2026.05.22.07.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Message-ID: <8da827fa-bc60-4086-a424-5ec376f15e27@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:51:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
 <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MyBTYWx0ZWRfX+zBUhKZvXCeV
 uwhyW4xZXTMya4zvi6vnrejwsVU60+DG9zRUx1mrv3HutTCvLFi9DWqKorfVePf5a5xNBXcPnDc
 A1T3D7bX6eA2tEoOYm4LlPpgSdoHh/FPTGdOzD6q4dsiLkOh/YetIPSV7YvrMufc6Px105OJewN
 BVHd7IrW5gJkwPbjgRHyskdLMCzjqEel2HoAVFYILeBM0DeI0bRj7rqUWkW7QOaUdifodHIde+4
 MdMs6jfH91QwddFpspBViT0aRPbfmUI+XbtPMqmW3Z2ibcjP2riA9W1c98KEsTbOSu6oyUhk67V
 FM8gk0bv/wDvu4YlyN1QDQ1xc9cPZVocQPyjIq+a7mwAbmmWiu3woDmzw/DZ77R7VBQ0UqT0j4Z
 BHRoqh/Wnh6j6xltjRcsEQosiDLDjXlgQYiuMO0KUVLqNIDfnKjF4jK98VLn86kQ/b9yI5MZT5q
 P2V2wpIwyUcNoOGDtJQ==
X-Proofpoint-GUID: ubVHgj-IX44LKOdjpEW7gknLdl1N_dCI
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a106665 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rjDOXfNolGiz0B_7zKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ubVHgj-IX44LKOdjpEW7gknLdl1N_dCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220143
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-109343-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 221B95B6C52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/17/2026 11:56 PM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>>>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>
>>>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>>>> reaches high temperatures.
>>>>
>>>> Set up GPU cooling by throttling the GPU speed
>>>> when reaching 105°C.
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>>>    1 file changed, 135 insertions(+), 30 deletions(-)
>>>>
>>>> +
>>>>    			thermal-sensors = <&tsens5 0>;
>>>>    			trips {
>>>> -				gpuss-0-hot {
>>>> -					temperature = <120000>;
>>>> +				gpuss_0_alert0: gpuss-0-alert0 {
>>>> +					temperature = <105000>;
>>>>    					hysteresis = <5000>;
>>>> -					type = "hot";
>>>> +					type = "passive";
>>>>    				};
>>>
>>> Why don't we keep both passive and hot trip points?
>>>
>>
>> Need guidance here, we are keeping passive at low temp so still hot trip is
>> needed for such cases.
> 
> I think we are saying the same. Keep both passive and hot trip points.
> 

Sure, will send updated one.

>>
>>>>    				gpuss-0-critical {
>>>>
>>>
>>
> 


