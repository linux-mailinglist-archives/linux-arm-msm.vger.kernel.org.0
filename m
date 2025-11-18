Return-Path: <linux-arm-msm+bounces-82245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6273EC68C72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7DE2C2C725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E97332907;
	Tue, 18 Nov 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzmP8zWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol4v3Qwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959FD33710A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460591; cv=none; b=ESUEwEA4o15xfFajGNcoG89/pT3DO4hl2yQF3ETteFOPa14x7hxpbYFlBgdwG+efyP5keQZeE3OaUJ1MTwhbSTrG7sDrJOSuD1SqgNEPca/h4FS/GFRg42fnGOWT7CetQ4SGtR1Di0ovuAQwCMrcAfOd4bksJ7QD5Sbflyu5ljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460591; c=relaxed/simple;
	bh=OqUORvbTuc3X0J/VSCAu/hr2s9Hhv+URzk8dOXhc72o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjdZit2H/xnsPLV5q4/sJ2jLP1p24aAXf0lO/oYncJ0b4ZY78CJfluZMfuPm97m9RiEed34i6xsY8PnBQpOhvdl0PUyvU8wZWLPzOzmATLzfYu+VQcbfdrSsoYMhP7VBX7IWotrfZt48Z9mbHy4SgSqaurrXmaWLwv7W5lPYuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzmP8zWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol4v3Qwd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fQDg2272050
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=; b=GzmP8zWb6LZ+TQYq
	2YlKVJKFLi6qZA9tSJfMbgKW3CE5waFIrbAsCTuu6eIScK00r33Pv233EF/Fk8Ay
	w3qTpZ+PkhXLgVtpU6kaRSZbgRJs/kylg8B5HejSwP6W2hBmhk7Hc1vKrJGZQ0Id
	7yXn2grV5te3qPGf2XFw9jSu4XSAZzgAM83S8WeMQj2U7KeJf7+wgnD3oNKmVfcc
	dlWxyJR64rI+CPrnwT4JtkHTrGClgLj2RxUo8dRBvqeXYHnaXTJDBWAhx8ePvJMd
	nJEwc3QXWs+JFonu7sDhJCo8sQHNr2bDRmiugJV9b8Qziw0tETjFFGNfXcx3lzch
	5d+unw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgmcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:09:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso9793491cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460583; x=1764065383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
        b=Ol4v3QwdAGkWKFSrlYKqLi1aIb/Wu5vIbWIkZujYf9kiVd19iFDtLMGOUI5VsBmBFa
         mojexrhxbjY69Wz5RPPSzHa9McE1YfgjI3haoBBLPvy1ISarDul2n2qvoS7WtjrThG9Q
         Ai5JgQzrp+OJS1muAqO2EQyHdoEB+nWTSqXu3DY48N9Sc2Eq7chNpCNCBtTQhQKZs1L9
         49Xe+oPFbhOy+k6elSYPIj5yqCMRg7YQ3vPsl6P8gsJkWn72ryFcs1JN6sC5LtjedVzA
         i8/TdKu45vH3Sq+rodJIOVnvVZtV11Zh2yiB9wakbcR3gbXxPZvGY72cdqSG0XkfTTxW
         wJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460583; x=1764065383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
        b=UJ7ZR9RiSfeT4PO/TCIEdl6MeX1SVm6nagngGhtErde5ird/Oe+uZHGsHeigVd+2zl
         GB7BL83eHcOfVA3I1r8F2BCxkb6NPIM9lg6RfFsNFCXI3ukyxwPmy4PTMQdp//IBWE7M
         JGapvJ4YSsDxuWD2Kccc9V0rSiR0obuewv5XbFrAVTTiYB9711HX78j8cjuwuW6iojoi
         6UFSJZxk/BI7i8dsHoPTm+iukUxgSCxUhlnAD8tVme73dUJFjxVZys4lIAH+XrwJ3FJF
         nOZaAd+OEiYvp8yfgpnPojixDyFxx6P1ynFsHrtCIkjcf1asDUy/i+3wDSpdLppYlyvw
         1tkA==
X-Gm-Message-State: AOJu0Yzlv9lBMVbQy8jmgPuI7/ELdIkUAOUmH/yhHsMhEA5dzq/VPdEH
	IiyVUmdRXS215QHxG3DI1nTtZuyfGSQ/iKKv2aISaeZymcT6naPP5A4wUsple80t2g9gKIKggvv
	FC4KUUYgnai8lxL7NdkzwU/E4AJr7GoNvN1VyGvhRCCykR5l7cllXCkrwjdAlLkuFpvfj
X-Gm-Gg: ASbGncuDT/L4DLeFqMNSew4uzJQ6bROwdTzhwePw9NYkhUAihhS7DAsOOBsb5uJWepb
	QY8E8VE2J9u9idhh5qHKSMYU02RhBl1Ga8gVCjR7de7jwLiJh6Kvqn756p4rRHgKqMao5C2pV2g
	ULRAN4bSF05CqhcTS8DD8oMjLU9GRExnZJEWyIjwOqBl6e1D0W7ZC+dijXtOE5gXu4ze4DyL7KQ
	xIt8zTlC0P3xSwKuyDIVruvGYEtNNk1ejAFcGLI/TM8f6bAcfKGCxAsuYYiI2XM3tA8IYKUFByD
	Q3YBB3jGTd5kP16r4VnS6nARW1M6rBb0ydIT+X8r6XqE1igMvBh3ynyQi3vIYe/3HYu+1XkFsJ5
	NWXoSCqEOw8vCcC3TjQzKIKkbUgeKjos5mgy+RS9VCB6U2GlqkpTJj6AQYSio/k4b73w=
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr148537581cf.7.1763460582702;
        Tue, 18 Nov 2025 02:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN59Q61Eb2CNlYDxQpBWVtF5VFujGxsR5/ckcEtaIq+KMFxkfUpWv8DK6msTFYM50HKOrU6g==
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr148537121cf.7.1763460582152;
        Tue, 18 Nov 2025 02:09:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm1306025766b.30.2025.11.18.02.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:09:41 -0800 (PST)
Message-ID: <0167a373-79e2-49f7-a765-d3a770ff2395@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:09:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
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
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MCBTYWx0ZWRfX7zAyEKU4OX2g
 2siJCH8nmPD1vV3UL590cwK0hXEI/eHWqdl2a7SUMcBcS2q8tC37TAHSaBgUURSOCIKn9D2H4fL
 luZBdA8E230ikSxSHQfWjFDA9IVdmn6NE038V9b4H0Mzrz7cSQZ8CmqNC0v3Zlb7tyR33na365x
 rBYbPhJpecYRLKkkN/Nu+ss94XQPqb+F9McYsLj7anrX/Wy3jCM6wSGNPMee97qjq9zbuN/nHsV
 r2mLdRW21wTkWpypH2bVCnUC/OhbVDRo0K3zvlkwhzgGckXhOwT/BWfaCkc8mg6TgQChUxuOBEM
 p5BZRWHYU9ClZ3ml029ImkZuWT4iu+JVklWr3EHa1l7WAmAH+Qq4U7wtvv6SYc8pMrI5blXS+L/
 bTXDAZoueOQiO0c7a0bEzUGgDvg+wQ==
X-Proofpoint-ORIG-GUID: 0KJUZLoOK1-Q2tkEhQOrn5fL7w06GB1y
X-Proofpoint-GUID: 0KJUZLoOK1-Q2tkEhQOrn5fL7w06GB1y
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c45e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MwKg9OkWFYoYUW3DDnkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180080

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
> range. So, use gmu_write() routines to write to this register.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

