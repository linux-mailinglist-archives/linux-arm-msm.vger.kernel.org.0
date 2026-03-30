Return-Path: <linux-arm-msm+bounces-100905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDEjBzPfymmgAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB09361043
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E2D3010147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47B336CDF3;
	Mon, 30 Mar 2026 20:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8pH9ESR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxeiCzHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BFF2F363B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903047; cv=none; b=Dj2lNS2DV0z2qq8urC1+yGgqMg8zC9Mie0dg7gibDukRYF2enuxugNK+h7Vuzy3tr2OztnJIyAJDCe9V86AUbq0gecBOjTKdCgOKGEcDwQjtvwtlY8k+EvY4tXB3TZYCU+3zw4UnaY+XjzLeRKfD3T6wThVlStjCBNEhmQK22Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903047; c=relaxed/simple;
	bh=1vmPNLR+fCtPTWdkx4qkUqBSXreBxbrbpTKcaKKF2KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vB1eBGeQrHgbr3qsJRnah3YOHsnsc/zAL6bN/pOkZu++c/Q32bsucvHlCzKvVggGBOT7J15d2YHFqcFNoG9tU4Jzs4XNngJMrdyURAoRjYAoZy57x2m5Xalg9IkMGPooOGL4imRKG61xQpk/H6rpW86Gn4O1mhU+JR3knWOpJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8pH9ESR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxeiCzHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFFukR3539573
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yImGOfkvrPNf4nn8Y5ji+vWnvutW5wQn5OLphXqepxc=; b=h8pH9ESRUw8OQd9Z
	DrbVOl1897hzpjGCSTkjgIQIX/iyKB10CU9rXzUk6wgkjDEnQetMvn2414lyBQ16
	x0oOLPeLLjwm6qntOVXWRYeaa0bOz5uZ096ZGbGTKrXqfZZmBEmdwULiVW9MtIXB
	XsMxa5l3NEwPAzHabr1E1AFVu+1M0bZ1tKhv/IKShJAjdb5/sg1zM+dU8esdTP/1
	joCL7CpfzeRug30gUSM4xqUQzZcd3ypYTANGs8qvOIJx3bk9VT8qylq38BFvd5UW
	UTOmN2TstX9hplzwqSFZgFGD/nes2n8I3C/qX2GLzPx/Qz3XzYOlSsgz8AEyfesJ
	vUO0OA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59te9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:37:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70dd30025fso9661290a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903045; x=1775507845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yImGOfkvrPNf4nn8Y5ji+vWnvutW5wQn5OLphXqepxc=;
        b=CxeiCzHD3u1U2p7PIcdWGcNClh7c+OVWSBtqC+k7h+dQDhg3/BAuTSj0T/1dFENtt/
         Wfc+Fn/ZjqmbEqvniF443B4CCCPKE7CqgcjckiQJRcjL2yBvGcH1X/2q4IJJUVw7H/7x
         6d+JnpQln4Ufs1cuS9kDVTjRlr1mm4WAvM8wQNqy6pAgZl65Yha8GPJpUgRrLDbaJnX1
         GlIA4HUEA5Lvt0M9b0GtHN5OK+U9qo0BaBZwcCJOlmlQjnSM61zJ7ezXQnbYDvys2TS/
         1/NU9/jGtpbwXej7hVPZoVnqiRIzdZGtx0RhtZ/QejDXk2bwx6nL5ZYbSLawNFSBLfpk
         1viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903045; x=1775507845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yImGOfkvrPNf4nn8Y5ji+vWnvutW5wQn5OLphXqepxc=;
        b=eJ2GjqVwCptaH1An2FnXCBEsaId1tI32GazpO4BVXImBPZdcb9mDxusFIIKd3l3iKs
         vdqEb8rmlL2iMnQhrpiH0EeZk96JHZ+OnfTb/3Qi96BxfdONWKFcKT2zZPmp1eEoUhSF
         1YK1/TSmMvidg0Cy/RPMz8WZxn6wYQ6cvNVGYl39nf/V3c+RGxbRSXmv0x6TywEFbBPU
         CBDRpFOhM0qjRzZFv2oq/QFyBG/c8Y8D1zsc+doWJqvVScOt5itb8zyVNd3zuJZpMSOf
         0FkaG1i2iBIg26MZHQm/Tr1W8kBWbd3xrxPWV1MYT6BCd7fiXeWODMFdQHQVxRqKLCJH
         Wqxw==
X-Gm-Message-State: AOJu0Yz2Ps+zTRL4n2fg8B3dtVnrEl2IXTOsIeYErhvbtI3uCO3scide
	R/dZXSiXwvS6k8aUfh+TumYO87LFNPCm/5D94HuESxL3tspwv6pNY7FhOfChMcYZ7PuE56Exspv
	2yjkMf7s4S+ljy9+twapTfihtrdyvnQOs7iYcW8JyJRvfQyR4fufYZwUB2dz7eC4fFXNhUiA+Fu
	Fi
X-Gm-Gg: ATEYQzyNHovZE4BiXHD/9baO5/1KHxnxYs3co80RT4RTnM5qgUrWqDGtF/0qWyMr16V
	4gKS2DS/7+pL9Hwb+0A3OxOXL3WhOXOmO8qH9nv8JioUUKpLcIsnlp1my4EfzMlIeBg1pYLOqG1
	nVvr0EmEXsPq9C6xnakdAskBqokHX6ks4VIZ2McG3frxxqT1VtZi0DifYIfNfF96ChbP/mYEqFh
	ouo+AEFMVqwoAkdhe6zNhFfAYT0+OiFUQIMSa/smmEldu3RoOvl3DcZnkZWsu7VnJht+2q9IEC/
	E3s5p/5Kiqi9ssBpajuRj7G1xoM8YrW6nq9wS4P0GZcmlE5CISUJwMTLo3LFP4WzpMSdr7+4BjM
	hnd/wxw3jokxF7TVbjvl+6I4Rfhftn9aPD7MHMDi36WDG
X-Received: by 2002:a05:6a00:1488:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-82c95ee518bmr13677889b3a.29.1774903044998;
        Mon, 30 Mar 2026 13:37:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1488:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-82c95ee518bmr13677865b3a.29.1774903044509;
        Mon, 30 Mar 2026 13:37:24 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86247c9sm8270549b3a.54.2026.03.30.13.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:37:24 -0700 (PDT)
Message-ID: <8cc91ff8-55a4-4662-bea5-355524490591@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:07:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] drm/msm/a6xx: Fix gpu init from secure world
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
 <e44e776c-df8f-4555-a487-9a7a6fe032dd@oss.qualcomm.com>
 <7d223573-438c-4e93-b4b4-64975c4da93f@oss.qualcomm.com>
 <4522e20c-70ab-48ef-8b0b-59f2548ebe64@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4522e20c-70ab-48ef-8b0b-59f2548ebe64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qE4VqDQNmieq1gETo6vtW3dBz0Lcd0iN
X-Proofpoint-GUID: qE4VqDQNmieq1gETo6vtW3dBz0Lcd0iN
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cadf05 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0_mfmPpWdV7espOYW9wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX8QmBczb2XAdu
 01TAAWyi+xLqkttONF9HcKevWSOxznxfdgZJfasBOpWlqe+rGIJO+KDR/BheLFi9KL6lkKbajvK
 OoR5A6mbPm6OitcxPPWzWp4oBZF+udwXaKTRrEdmonmZdx6Rmp8e0vw1YvH//DpFDuhMSZ4Oigj
 nGSWOd6yexDx8WJqJgtqORLaDA6gP9Q8qCODu6xqpW7l7v5kbL92q97EA1GyaGaasW13hkP7icS
 fd/pD4G5OH3vsr7Yr0VJR8lZc2lgjvmsWMgh69sPeBmjvvvtQOFqrKd4qyggqOI8+fzFFQ/SoLq
 V3ChALiUubXqTi32XT53jsEBzOEbkMD4S1zUWOjnpU16r5gwwxv/UtBviKb1Sz8HBbsFxGKV5kH
 ImBRydZzRc7EYlWogClvUl7ZYyMs4mFC8pysd0m+C02xzL9t7NV/caTsmAjD6G+3Si4vgFWvBwr
 A9310K/ga4Ey5XVS/jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DB09361043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 4:53 PM, Konrad Dybcio wrote:
> On 3/26/26 9:12 PM, Akhil P Oommen wrote:
>> On 3/24/2026 3:37 PM, Konrad Dybcio wrote:
>>> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>>>> A7XX_GEN2 and newer GPUs requires initialization of few configurations
>>>> related to features/power from secure world. The SCM call to do this
>>>> should be triggered after GDSC and clocks are enabled. So, keep this
>>>> sequence to a6xx_gmu_resume instead of the probe.
>>>>
>>>> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> This now makes this happen on *every GMU resume*, which sounds
>>> undesirable (kgsl does this in gen7_gmu_first_boot)
>>
>> I had this in my TODO list, but forgot to update. Will fix.
>>
>>>
>>> Similarly, we call a8xx_gpu_get_slice_info() on *every resume*
>>
>> No. We check then slice_mask and return early.
> 
> Right, but we still branch into it
> 
> I think the best solution would be to add something like
> gmu_first_boot_setup() which would be tracked by something like that
> bit you added in v2, where similar things could be moved
> 
> That said, this is just an optimization

Perhaps, a micro-optimization. ;)

-Akhil

> 
> Konrad


