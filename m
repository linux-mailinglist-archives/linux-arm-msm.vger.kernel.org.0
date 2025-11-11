Return-Path: <linux-arm-msm+bounces-81288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A10C4E805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B36D2189F532
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E62DECCC;
	Tue, 11 Nov 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELmNGRaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGVdv98e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70093299928
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871235; cv=none; b=IxzhWZlRADuYx958v7kRfrXLeM9KWVgG7PvZ9JoDn00tSwN1bIsX904Nb9IIZQ+PmBjg9mocTwi8ENmh/J5JMPa763rk1kaENwV7Pm2nFvkj9jiW2kYLgsCVkw3fpezBqpN3ZTUzEmJJrM2RqBJX3vyI3JqQpuGcfLyngs+6eyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871235; c=relaxed/simple;
	bh=At3jsEqPyxFdSaRWeiEomMCAUDUz26XIRWm1MrjFu5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6FyD4nSo47nqr9KnNUOZ00rwSTEWm/l2/FdDR2rK/zt85qeI+xTGMxFODkp3JSbC6x/Mzo2Zk7i2BXwql1YO77HD3hxiA+KIGLRWfZzw8YDB6+Fkh/ZHWQMcCtKpd5Jqk7IEA+7A7EoBKfw7RYwYzQSOEfQd5OMX/L1wU8Wg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELmNGRaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGVdv98e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGBhW2165207
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=; b=ELmNGRaYr3Ek/O6D
	IZP2qD4dyHqpwVTbQTB5Yw3o7cHSgiJmwqmKEAZZuu/Enh+gW8oEjFXL/nEAT3Kr
	BF3WhBOaHZgcNJEUMFuq6hqLxo8WqaeE1epEsVy6qbmYVSYc9PWsbkAIXUpnh+Gn
	FjjokjwRWSwj07XNlHaB94Sun9WFZfj5zsYISJ7hHCGfQunpODwWgXSfrhtoR0g2
	DDJvIWFa4vjpKY04ixCA4UYNl5IsESmhuJhQJbJuUqxwr5P5XR5DfoOHWvKn5tCo
	CfxfwSfKOxzJdYrZs6Z7LeJ3AevlDHLGPuwe0BXz/SyUqlIgLS7uxuvJ1vt6H3fD
	OGAqFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhhj40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:27:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78105c10afdso4710796b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762871233; x=1763476033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
        b=GGVdv98eKxY3Hc129GA73zrElAiyg3hm6R/8uA8JXf/kP7R1nQsNMzCtxXn+4OVqto
         bUPnB5jbSsaZIygVufpEvNboQrclTCMknus2ktopzzPUvP2ryHt4vK8hyl1qd8vKxfsz
         kI43HxgVSAk2CdNmWAhWjtnnu2OcGhLmBSJTtfNNuZneErMMpBafn1nrTzntMbkxsr2r
         owfbFi/IoypOXFzqACqk5qKJmw4CCQm4t0/Of3gkYZ0aWgmpoWVxSnuguxHOfOD7Syja
         XTSN//6DCQEDzXfXE4q3BEgAsERM88gAlwtFB8XVviXdUsbHSOlMT3/o3Q+g0tTVlq12
         7xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871233; x=1763476033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
        b=OUQxmdWFBjOG1Q80Lxcuyz0Fp1Efp/jAibt+dcx+s+gtLtjIsvcRUVJ7RgUckVWIZH
         68RjNic7Tkb5njvbfa+jmUGfgxEftGG1w99p4t+Cj8BsRj06uR1KhodTWMRG6CZA9wsg
         d14bBnsfiXvOpB5Vu+2EeViy+lGS2QTnkkxhlqR9QJYwSAzd1/nR38zx9HAyOeqbDkD8
         I89rzvRwSC7nRSOEVW+vLJxG2AxwV2UZCF4oqTGJ+dTd2Vv+jnmFQp+JUH7iqJz2BUzu
         Fu8UBR3Rz/k4xfgv2G+SlbwGnL5JaGYL3PKy1zFxDrCX71pgT2e4sEOe7j2+tf5N90XF
         rEgg==
X-Forwarded-Encrypted: i=1; AJvYcCUeS9VsdpBO+FJ97t/pZNBt6Dy1zrHpMId2KR3TwVo7owPI0HSVd+ZQwEfhFn2DPP+EfTFX12Z67Or34GVb@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmTokFXozTH5B+oidGIYIbKgWjFtRoRXnLsaYs/GpoEZXCl3b
	Hdqy5RiEtPutaAz1qr/M687RKOmPlKhQG85bsQJydMem3SjqHJ3kkPHKnyNfhciRe9gv/tloU93
	CbXq8KMoA2MeSgFZK0cQqFCRGPB7rAXjFkMrzs86O6dvu0rFykgnHVqczR66DtecpWU3q
X-Gm-Gg: ASbGncvULFrx7CweqKfAgfNOA6bNKrOqbqnsXcKUdMPL5d6rCwDwrNrQGfCHSW05TD5
	qquNlNeRxS8CdeTl+7WuSiBIoJBK/2J9dZU0oFwz48L7CTlgkNoOzli5M6RfxofhhPLaT2jEWj1
	FRQdqE9I3qoJsGhmZqIn6ZeBgIJF63fwiZhneUrAJXeO9Jl32G6ZpMtPwyOr6MsPooNKp1Og5aX
	hCeZ5gAn+CmZeqyKiS0ngTtZrKCXYkCaiDSgvTtm1hZeHQwRNIOikz1Cgwu3eB6r9rZpq7zMIXL
	HLPDujwoFDQdKU8vbvFpRoHIx4xcdCbAjENIAzMYJq2B4C/PP6BuGRHavOWLNKa2cxBjuPoGepx
	EX22rfoSHNZfecHa/63J7HQ==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7b2266a8d96mr16270323b3a.15.1762871232978;
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGS/7Y+JCV0WL0rDJJwpThYAOraNVEcFIM32zGMLfnISD9Q77+PeHDE8FGvMX6ZgCVDRIoTA==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7b2266a8d96mr16270287b3a.15.1762871232438;
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b75bda9f77sm100571b3a.15.2025.11.11.06.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Message-ID: <08f8de55-52a5-4942-9a39-222fafb093a5@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:57:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
 <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=691347c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WzT3ZZK9S2hwGh7ljtQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: XzK9R7ITI5TUzSur4p7X-vp9aO25rVWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNiBTYWx0ZWRfX4gJhLtTf9ATx
 rlWCry7MyekdCwZ4MehGppLptPnMnR1Zlc/xsP97VmAt6VbEwS7TmVtyXjwQ1Monx+GGAMqnk6j
 DnGjSK0mjVuaRiS6O40BM4WulSqo7YCFh0CFSL7j18Dm6QQN0z6YCMVh2OTfUYKWpy6PNU80Gwi
 t2KDPgtWWIBTY5cczwq7+o9ZiH7kg+ZpIbaE/u7thM2F3q0AW+ge8q2fc7s1trBKxLkgRfFaTLD
 t5OsH/nbO+DycCaFYyZjHLhoRMYJjZ7AjAAW1i0PWldLrA0+dOsi/j476jbQ34dJAHuYOwWvDP2
 dvioZJqJ8RJ05q84y89Cdg4UL+NDDW8kj6PnIKlSmJ49xcxX2j+SB9U6oHu/YOoiqBB6XNElyzb
 7mnjFtAwK0St5CDqnPHgbgiuXF0+hw==
X-Proofpoint-GUID: XzK9R7ITI5TUzSur4p7X-vp9aO25rVWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110116

On 11/11/2025 1:20 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
>> Update the devicetree bindings to support the gpu smmu present in
>> the Glymur chipset.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> So you ignored entire review? I drop the patcshet from DT patchwork.

Same here. This is a new patch. :)

-Akhil

> 
> Best regards,
> Krzysztof
> 


