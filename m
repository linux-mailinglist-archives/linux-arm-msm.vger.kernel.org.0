Return-Path: <linux-arm-msm+bounces-80715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F8C3F084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 09:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFFF74E43E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 08:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B0F2C17A0;
	Fri,  7 Nov 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoLrxx3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mpa+dpVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF882C0F96
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505543; cv=none; b=kQ6vFqQqcj5lubRYl93Dwn1Kbbuid6+zQN/k45a+x10QKKr0kinyfalI3ZvlcacwDPsWMIwMO1mHoS/AoVpNgeVmtrujL3WhdlEH2Y3poGMx+TSQajNc//agoh3SymTw0Q64MNUWDaQVEB8RqotEVwMUc76UHJMTH8toKnUpFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505543; c=relaxed/simple;
	bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxNIiaunKXSalH4Zs8WEJyiQgS6s/yYoaNiq5YityzECyGiMXxxMdCTlQL+Nfs8Glm7Pa4bUXFNdz08309h+kKE6oHz8BEdU/vNKY80MugDOIcAyFCjA4BUpyoWCpFJXlXrtz2P6iZ3mRgxUmKxfVnUfDjbulqVXG3DA/unsuqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGoLrxx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mpa+dpVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A744n2q2085546
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 08:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=; b=eGoLrxx35ZUoDT9Z
	ojzyFKD3egXl3TYbOqb4VCjB3J5rna4/qatWTyyJvhBZdNYwu49xzA3H7IGfRU99
	4Au1rMkZyH6V3+gsUEUs/IgdbIkefAOznBM0eWlB9voKiDQSwHf2opkxtWtEAIy6
	5i70dPmGLLoeGLNn5IhsGllk4R0VvcxNoy2uvUd8HsyqcLButSzbnQsJwFUM3Yno
	Gkc2SIl+Q5chgk8GapalxY1FAKiaz0jovH8UsGCbIj6lP0cEZPFcRsiI4lYq3dUr
	XZcLK/GzFg1hjwaasZiLLTe3gwS4oluiLNmxTrNSHXkwpLLxFPYUzvj/agFM7mrb
	LokUKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a99e78rjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:52:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so1831761cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 00:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505541; x=1763110341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
        b=Mpa+dpVAhp7lD8W6bT4UHRWEZW1ypHlMwv8GmBVPiVXbBbE5CEVTeNAVl838S4FFGe
         x/jafyDHwj2MJUrh0C8jRHUf+XLPpmgnzn2Ll3fWtfBXlcvNwTnoH7kJhUv6t5p5miQK
         6dyIz+PQHiTmzE9WxV7RODNkWMdh+/BAB9s9MjQoS7RrFYyRHmZfgmukz//9zu8Cp/98
         bVQdnhl7h5Th9LaUFNt9ubgyfAZ+dIt+BbyLAs33yfp98wmCtEGVyAv/J8EYeHxfWuFO
         eXCn3jfNQr6iebFW8R0T8DkZKnGhpiXtcEezpE8lGV+O7Hc4uk69x2CWZUp6aVoPPGFN
         sZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505541; x=1763110341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
        b=IkImqhmxE7KPlvscoPGJEo/7NPq9i374tB/L/llZisOIdhv2pcv2mmrkLseg4xRry8
         LMqpEjzmtFGvz1yr3jOk/K44XACE/GW+Q9nArREQkMK7WrPp/rB+/YAJ0fr/8GDz+GbV
         pqCEMmL48NAcChBKd9jusn3kuNc0BWCokC0h87uFK4U8pgTpQJdnRp6/2O4s8Cwxan3g
         2K/cT+Co/GK6lDvcGnO3tbbcvM+NAw3A2s9V9Sk1a/N/lcbTNXF9x2z7p8+XWWS5Yvac
         qV90vfnGM1Zbq+OehaE4bp7Tglie9wxeSp9I14N4uvFihoqQxKsSegEAs5Vunn8qqFf9
         39Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXkl1MZa6MEmWwe0N0dutOVXoqQ/vr1yo8xBgSwfUMZnlB0vykmiEhgBL78ox8pe360t63prLb39HhBedYe@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdPazwB2gQu0iSi2RbpzWidbwSiuUII857MvNNJ+gANapdRLN
	vRCmXGrmSmV9n0pQF0YBuFxBOp8LEeziBmt9DLkOnVrXSbM53ktllTidGIlCOeNr7p9Uq1rRApt
	JKAuVRmERpBE+9SMlECh+4gfva1jd9Jkgl/DtQ8LuXlPTgSLeOuCsPgTt4X45jgx3o1Wg
X-Gm-Gg: ASbGncu9gbIXcz08DBEF+hbNQVnZhjEBC0pLfpujsqjrRtF/FUZ8+QrZSZH1kfOldoZ
	TwLqDn1XeyKritCoKIfXsbBc1QOoSIrUYdOtcCnoc60eJj13DziYn4kOmmj/wM1uC4F8mhMsMXr
	nZ+1FDGAWxeknN1jIKcYjUS2K6NEYxZKpOpl9KcbgXvI0klaDiEtxcPiHEVdcwFZUZbk0tGaViT
	2ygiffWRRamZH7CaxxFaxPuzBExbvvq57M9xPXiM6aoM9tAmz3gTzfGGaXBWGD7TyMng8QiH5HQ
	+6RzSqUFxmtbUJBX5U7Ut6oW5nHwP6fT6nN65gGt9EMNjLXaLsx9efLYMyLeI6obsTk6qYWLa/o
	iIEXr3Fwd5/x81HGxCLhNupP7+j91WifGR+VM3ErxYzLpEw9jmfWDLtfO
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ed949f2c3fmr17320221cf.7.1762505540575;
        Fri, 07 Nov 2025 00:52:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3kG67QsZQNvhXXJLPvhwblVTCY2za9wLcF0KdPzPtUN0EkUbjgVeOtcVYxRajcJ/PwybTKQ==
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ed949f2c3fmr17319881cf.7.1762505539996;
        Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bd741sm177667766b.57.2025.11.07.00.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Message-ID: <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:52:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MCBTYWx0ZWRfX+DZVlWvJN3sB
 7MwgPUMOPEI+q9bUmoZxTN+rnOi+H4WcD22CXD+1j/Mw8wEZJS84Wb8W8F+rqfJq2Jtp02o75Pr
 jjUvRL+Jmd//FU4THM4BVYYuOojN95dCfGbhWInECstv/W425UVeQt0lMn33o17XR7okwVYzWjC
 pyJAER6PQYpV3+5+QXVcxLhgW/gbj/tgNkKMVgpUM47IFz3n1SRtgI/J+ZvKxE/X9YdTm+29jvD
 AYGXrc0D1ED0hsqFTtmDYu8pSDBrKNnQddw8jbZhvnwlxxkDFGM9oBs8Y0cgjjGC4C93HlibwZy
 IHYtT8Dq2MhVm8R2wUF+u1Lv5dSUg/rGsMuO8LaK3wl7KS/0W7ZLhv5BvwYVRlLdtUJcSmaR+t4
 qIWJixQLSQY+o8l1Z9x5RWQ2AXQQAg==
X-Proofpoint-ORIG-GUID: c5gDUaRbHzTgSZhLnhzRQUsXWfUndigo
X-Authority-Analysis: v=2.4 cv=A+hh/qWG c=1 sm=1 tr=0 ts=690db345 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=glulLz7CSyDjeoE76BMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: c5gDUaRbHzTgSZhLnhzRQUsXWfUndigo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070070

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.

[...]

> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)

The size stayed the same

Konrad

