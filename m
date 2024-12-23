Return-Path: <linux-arm-msm+bounces-43155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 340839FB06A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A6B7A340F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89EE1B0F1B;
	Mon, 23 Dec 2024 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8e7QK1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A61B0F16
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734965660; cv=none; b=Es3uXekpJsKWslakZ0H2U08s/O4rKG3raxmLBal/04lxBpjYbGiXF/l+t2Ij6UhQmRm8qhBvSNllgk1WLIQzUBXMnn5tX/LXH+gPNiKtvqa4cRMV5y6owBbvAHP87wIoFCjNl8vAgyVyvMrqiKPoGqQhOF4KzTm6uDkdXQ1uQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734965660; c=relaxed/simple;
	bh=qBb+RepxlaQBQfUiJ8jtOEW61pLphvFaO7Ijlb0LmZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fk3GtSLOWoVx5Ml2S2Q80f92P9RrtWIBmjuGRsT/5qIMqf9Bl3tu01rUiZA7PzkmpHcSG0YfaVqEEDftl1BrjFwZR9qyuGaFG7UPue80W5+DKC4thKircpuJOXshpNkNtvmU//dbhXy0/4EweJhdnmLfHN9y5KgniZx3oyY0oQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8e7QK1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9Tj4h020555
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=; b=F8e7QK1dnVMk5SD9
	BBlhQLgeK+yp4+E3lygn5nCYDM6n16D9d7KnejaziWiIUl66uHrvjwhJ/nmXhkpr
	EkuyGTsUI3W9zGrtxEHPm3IqKJiOhwl1Xl/G5BLb8J1iaLCijeM+Aa7Us/WwTUKR
	wr0OuLkUCibzNJL6hQjKwa5rQBMDp8laTXKTQK3S/dLl8i94Pppije/a1P2H03tw
	cTdhOs+f1CY/ZXB1TOjkw42Dr84jI67FHkp+lHIU0AjrYyiwOnN5FlvsccYEkut1
	+tAor35CJuH0JCIc79tv6X4ydFxPDG3eO0+h9Rf7Yzfrgq87P7Q24fLC8tfL0vbv
	2iFOsA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nn8vsbs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:54:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso15485616d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734965657; x=1735570457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=;
        b=vl+ZutKlSr42ubtK4i3ys8cPVXnYyL9b06v8OkpV367JjTnEXrikEmRCzZOjt9cm2Y
         u2ShaAFrq2QhrOk1u+GPU7oyUYNoPixgKSboTPLNlLlfRa1RSAglAO4H7i4kcENolcNZ
         mKQSi8c49J7CdmVCYttEd7G+IGwe/UAzfUDsHG4FRtCUrGuXumRjNnne98Qqt31dw/pK
         Y6IgGynOErJFMeerwgH2xPFGlTiqz0ornmIfwGf/LpPW4t33KMZLU3yMmIo7IjXAOYbc
         HDQ3oVzVXk3w00tLVo6fv2db8pbM3NpOxdb5jRDjcpntnRCGkbBP3yTEyNpTBlmZOQ3W
         3qMA==
X-Gm-Message-State: AOJu0YylrBoHD2fuaAp1xI5JwLGO0/0CISxXnhcw4D140/ZBVhXIxVtw
	qh0PgSOUVwhQhELBDpsk9Xy+h4Rp5uhsg9ug11M6I1q+EVSS1xDEhF7c4ATYwSICu7qGDzzG1bk
	0JDdO7u0+gn/f4pEK656NcKHMAdy+BF8kBQRjhr5VpmcelNWKeooPaj3Dpymc/9KE
X-Gm-Gg: ASbGnctrHog3fsHgCAnPKKu6Oj/rQ++/jeq5gcSf9uHu6+X6rPV+UND5GmlUudoJF3L
	HyzxKe4ZsdaWjho/+F9p48xb06HJATG5Ke7X454qmuv/qvqft5ybLQVm7ouR3ghMsIvYGmw9LVC
	pjSknUolmyX/MWklrMgJmmeolkE0fNmU8rga2mKu9CJO5oRP2zWMCwnlx+XWNsmITL40k2aCl0s
	02KJZ7LLumeUprEiD+grCLlU9/MblV2Ll19/OZqvw9jORuPJNMAjF0Ve7hZNkoxZmZ1SNTeA06k
	fiRTWZq8zrtV1YK1utX22AsESHeKplfpOhc=
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6dd2339fa19mr73953716d6.8.1734965657273;
        Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUHjlXPiR8tK/MMFoP6x2egq/NcpOXsphsui195pchWCXB8kVBb97e8UecvHXUqfznd9wX+A==
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6dd2339fa19mr73953456d6.8.1734965656891;
        Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aae9a325afbsm311084866b.181.2024.12.23.06.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Message-ID: <5b1fa9a3-de58-4ad2-aaf4-f239f7c60ec8@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:54:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rJafH5K_UbFNyF7Sgy3igbm66bdJqIfS
X-Proofpoint-ORIG-GUID: rJafH5K_UbFNyF7Sgy3igbm66bdJqIfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230134

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the other side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the floor bandwidth against the maximum supported bandwidth.
> The AB vote will be calculated later when setting the frequency.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

