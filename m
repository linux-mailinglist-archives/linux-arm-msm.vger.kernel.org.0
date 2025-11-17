Return-Path: <linux-arm-msm+bounces-82119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE14C648F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA6594F16B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A78B33373D;
	Mon, 17 Nov 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaLNWRlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5wwF4Xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC2333727
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388060; cv=none; b=GrFHNJNgb5pK88OqLa7mFxUtGQqO97pQ92P8BJHrbcATCPatM9czALPyLf17El4t6upDhf445w9cFHRifRSssxf4eU6zvbzXdPZa+VzpuPXgB9LyArI4tbSfJ64Qyp4BA3Yvb8CJXtobimC/CQDW11bZVAR4uf+5gRbdB3fun0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388060; c=relaxed/simple;
	bh=tYRyG8yGuVMjxpdn5RQJt9JNXWc4lvUyFER+lwm3rfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFwKBCNGBlBfm0SdEQCShBuAk9/1fbDA2WTC3MaRtcZcFd5xGByl8H3o48IBILbL3IipbLS1sX7osHcAix7Ulk934i7npev4mOtFN7KWljRTbUrTKX48zHQojwInvhATDDCoR0ORHECw7dzEzJ0rKg0+lGmqbPYh+uYzcWyN/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaLNWRlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5wwF4Xh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3a343517229
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=; b=CaLNWRlLM2uKAZYN
	zumD9UYmsPf6oUOVgIDz1j75aOapZi2Zk3w6jEeuZ902Te9KZ3QoHgAavMpXGXWz
	mTd02hHbgfZkTTFjDcKhu2o5YASXC4Q/C+toi9qYmVOCK4f9u2wWooLVtukLDy4d
	MGXQxrrRs7k5FW2a1qAjNVQ2JWdphcxhmjwohGDR0Qd3txoliwcX81HHKJ2goDWL
	jtY075H4qCqC/6NBg0qRZiZoywBsPHJ1KVjg9w4kC8d2cLtTvZEv6YFw3DWZAilg
	Aq2rPi+fMQoHDf4THYnwBPW0FDV6GeIaVcHbAZ0atBz6YFIfvxvAbmKM/gXIfuck
	GTkqhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8fhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:00:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso6464501cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388057; x=1763992857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
        b=Y5wwF4XhArx2pXqrXD6jaYbNakCLmL0EUejUE6l2WGnO28l6qRJKC0KY2uubuEbvit
         L6DZ26XrT9nozVFefXOSdZVIe5awk3WOAzfU7vP64uxOZ/Ex9m7Ne0AZXMRrw029OM1T
         k2wpDUWH+he6kAmD/AwbeFLOMfhv4pmD79W3Q69MPx8ZGvYkQkFIZXUTL7q1h1HDGN6V
         wr7aAtmlEaeqEsz38WrAIvsNFR/bqSA+n5/8DofDh7ymSqtU9w+B1xEv3LJrs9wDfq6W
         udqCrs2/P0wpKwoOycz2ZcKyv1eNwPbRhQq8YabPn/rsrxedhcVuA6ou/hDElrTskcTc
         KJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388057; x=1763992857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
        b=H6vC5ADHLP1zmIHfgJKMlbIUeU6JScuiz0do8jdEimKi+wHpuYyAFGiUIJ44RbjlrJ
         WObVrYBuHB95/tjkEYxkEu+zlJF0pLsbRZxncOmeHoFXJxxPjOpRisWB1eQ3btR1fgyN
         xKGPzphViCoVJ/g0LX46r9gRLDy9tHztjZpxjRvivBlugfNDaGvnsREGS+XRqWPVhE5N
         AxdOH3htJD1562DnIOJGdoSeg4lJ3u0XAEDHJBi7iQtVd+EceNytHkExdWHTJKU0oQlo
         EbcGRAfBCT2SezjWFFvyM5uxe+skFeTkDJSk1s5ZPjabIzo1MQUc4ePfeQNoydoT5O/Y
         wLoA==
X-Gm-Message-State: AOJu0YypRoaoP4NL+a7TuFAN6ZWq2guinxgDni3e3qNf6FKfXGa53d+g
	OTsqIioBsRcluW32jKAeJfrVxyQUeobC7dT1rbM/ZsF593NIJCJNXVMJg9I8unYyic61qisMJ+9
	pmoidsKwv+OjorLrPgzE0JjCxZQtVn8UhoXT23CyYsitHETug2y9sBalo6voXOud5DUwu
X-Gm-Gg: ASbGncuRyuYrTO9oGbq5/kvuRMRajMP0+zhWSK28GKJx4D5AoBUBOHcxbzYfotllC/2
	dwoOMxmy8Vw1lKDaHx7b3XFKcjmIFvScol+YWcyzc25IlQieuZPceLklWAj9f0Ke4g+VTNizCUd
	Ra5dx68Frb7ex4YYaSnetHITgWp9/wkyG+cvMJJSlURAZmrabsa/8Y1QIDtElqHBP3i0XGyLgT3
	BdQk+EET9eYaXyLpH7g6b0cdl6PWop6uDqjj6MqyA/B+KfBgLCd34oOdGWmR1Z4jw3+MU8AP9ol
	/+RdTJ23aHze8VQL0OFMrT/lYrMYC5YTfIN4TFYcfPiGSc1cofrx0tlXZ9p6K9+tGXe3OjAz6tI
	3fSqcRf3cXU0gkRKAoEUGVhtMTC4wvHZUiv9mWHbJcauLKId/H4k5tLf0
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4edf211b66bmr120920851cf.11.1763388056362;
        Mon, 17 Nov 2025 06:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj35tYdr0HD47+9f9g95x0CjScjhWZaLoteYTa+aiaYqadjZmKPlu5QoVkMf1uY20EKq8T9Q==
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4edf211b66bmr120916341cf.11.1763388051601;
        Mon, 17 Nov 2025 06:00:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1079743966b.70.2025.11.17.06.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:00:50 -0800 (PST)
Message-ID: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:00:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qf4uuNLwqRJErSuSOW9OaebcnHggemhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX+CdyraMFfqUD
 yoHKoUzUHwtd8+bdpELhaPoQ4Tf9Ewih6VSGf7GtIEu6XtOIvf2SVKWzkkO2icYiaUR7mrSbu7g
 LfnEaOUut20q3u2ZCBzvHPsSJ77XzdqfdSGI+VFE+vFQJzdfBxCF5vXfDL0SXPuCDXhfBSJ09RU
 hdzHxN/aVEUKH+CFSokFB9Sp10k+h8ckdCDabK56xCe/gPluxk0wrYS925184U2wOsYgXY0YLSu
 t/saq9xTzDlfSgjdSSQUtkNJY3Uvh4ZxWy/iTU+TbdX6zcg0XtP1+lryHKDYoW9tcpOredVpSQd
 /77EZqmqopf3mPbq6S+SJ9zNNFyWUZnr63GS0LRh08OH63Nkvy/VeT4ygT0uy0Fdlejfda3B8wp
 W6vm8hcGT2xQ++poAdlFt4nB6J1luw==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b2a9a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RYDHkQwZWS8X-3Noaz4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: qf4uuNLwqRJErSuSOW9OaebcnHggemhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170119

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> architectures. So skip dumping them during recovery.
> 
> Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Looks like this changed in:

https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855b563c1203b33da354

and needs_seqno is never true now?

Konrad

