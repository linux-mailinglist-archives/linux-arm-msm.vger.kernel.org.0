Return-Path: <linux-arm-msm+bounces-81287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57523C4E7B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85DCF1896A78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AA32F0C70;
	Tue, 11 Nov 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGgsmsp3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPfn5Bkr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD12C2357
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871151; cv=none; b=sQmNI9JeWVT8Uo4scDmhDdtxsUfyv5UQOLqhUCZdL3COy5bUsPTAmK4w81iYPZttNesLYLnw2IahkyNesuhzkZOo/i0WmdF2+1AM89n/sZQKNqPn5imBpvqjOGkuaTQuuHhyg8Ys4qNDg1O2eDJqNQdaOVQgR5A4zjvdZ+9gsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871151; c=relaxed/simple;
	bh=ZynVm5GTjJ3jV5ewXN1Dx5baeS9+v8p0cOWdmi/XlNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u096104wnLrcFH180NyJovRQ9VIaXjmSFQB4aE81Txw9Moff55W99gm53fxre4tFA8xTwlFUcZPicfBh9KhW+RhYfAZzjAEmNSypQP+egB/ttx0Cc5bsMt8L7M78X8LpLFDw4INysg6cgGiuzYfhUaQf6HksHNq89OvQMxHhCk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGgsmsp3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPfn5Bkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGGJa2425409
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=; b=DGgsmsp3z5Kly49F
	2Hq/3japteXVdZPaeIYVZvju6RwgCftm3mwlfB5kZrBZWou2alIVyDiJ8gra/AKt
	NtpiSahSi/l9VMHGE3iqpp5/Z/mNQW4lcrVFjs0l8IB8Eo0+8fhBQBGUYJR+VO5E
	VTXGwe59agQekoRbgea8fGGod+LVAqjbQvsN7tLsxWYmq9mJ6RpOg054zekzaszX
	7oKmwQjXANhYnkw/Dix/5sc2qB6H/L8Qa6KyE/aKSFYuPecUakEW5SEf70FiMmvq
	9jl7LKoTmdduSKy3zuE+u8GXJV5aNOAFxGyBp4i2KZYpkxWRKK6eNZn9AWRurky0
	kWM9YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350vx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 14:25:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso38951835ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762871148; x=1763475948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
        b=kPfn5Bkrtqp45idpTqkbAElyZi3c+I4rbSPREjAAAR7F871Oi9JM7yhLVD/eZZH/7J
         SC1yftntmzCeDML1w8cUWpNfdb0tOQepoygsy/jUK1ztpgBzVyPuPQf/04yFmR4F6UoT
         /SUelyh0m+PYJ7T115Dk11Nv7aIQ/1oIUrdJk3jde6QB4EuucAA3gD3qqywmt9lv9g6c
         o7i6aFsuR2AyLRkQfdB6dNLLXRN0onTDuaqKeY6Cnp3Zii2Q1Qlg50IAxNbYAonbqTAR
         0SramS4RQdDol7DpNrJLRsStG+WatcUd4EQMDzhmokxfpKu+PwM9iw25snweg4hpxx8a
         g6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871148; x=1763475948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
        b=kFmPBfAKIXbRX6hDdkzdeFhWe0b3d3nlvP8m1MCxNlxrmmhVJhnWufHRDLR2OMCkJo
         n/k+d55NK1eO+sCBMWra/1e8W3z11KpDo1GWjHajQ8xGMp8oKnDuVjNixa/Peum8MSId
         iZetwkM8S5tAlAwmMbyYQsa+rOfxB1G3EtYGpnovaKBbNluhUu6/ZcWBXpH6gC5DrQHU
         opuomvOZ22c2UjcRLZNeHyFTxim4nz3/ZzqsxX+dz0zkutEg4h6hRxrVbu/DJpJqqRpA
         7LFkGuDIQUDyIMEksjwseklsqMYWvExKS7dWz2WMQDGO86TSCgzavA4KpPgzR9AuAlgu
         RKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitfeQsxTqw4Cc48eRRYYuk67+66bOI3UGgD4Txyp9gN7pykv2v4t+PM98Gy4qjbeuSBc3Z3cZVkyL9sSD@vger.kernel.org
X-Gm-Message-State: AOJu0YyDD/szDuYMFZdyU/Mkkx2emxqVntgEGO9hfRmZ8d0ClRCTS0Ox
	bSeJLykLlCPzNg8V43vmsSrbZiNz0lX3lxZ1IKIpYK+Io9sputy84BqQXMCAEbRlx6giEuD6QIv
	rJjlUT+ve0Ih/usiGWEFvcaCSdYToerih8v23ILA9+aTTgpM68dKAaC7ThsjB3s/L+VXE
X-Gm-Gg: ASbGnct734U+Z17zY4go7M2QzxGdhqHiaVo2Thy93rH3UpgYRNRD2RSpwpMEVF8Ajks
	gRPTb2rn420ZNaayFehYJFL4CjoDeZ5fhEyfaflTVMHGGMf7nHPc9dqd2I3e+xuxD5r1zXWuDcT
	TuZO3EkRZWL2NvBUxeUj1MblUHxewofRAON7TxD8P0kj4xQ3ABWr0eT4uUvN4kptQ/IGbMQ4fQQ
	4OiStMAvAGfLwHnf7XEGHb20mTq6pNkhgAmuD3FJ2we7j1VBJAcGc2UvqFBq4dZKxK5aziEwT4d
	B9M7pw2/eKrklSSuw5ghpAAsGZjXB6NUd/Ewn/BD/SjaPvVCcjQMq+NLtWk6PA6mxy/1kE9rGS1
	Xl0LTkGABCEavShSgDimSDQ==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id d9443c01a7336-297e562e197mr179715575ad.13.1762871147474;
        Tue, 11 Nov 2025 06:25:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkROrZLUIRrbkgoTAgkprVjqaX7dHmwbXmMslaYaaMrgNrailMFiy5g2vGuUSJjGn5syzSxQ==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id d9443c01a7336-297e562e197mr179715115ad.13.1762871146970;
        Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740a9sm183312755ad.53.2025.11.11.06.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Message-ID: <ad372979-adab-4486-ac69-90a9df1ae512@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
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
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
 <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNSBTYWx0ZWRfX2ZM5dMGVzWcT
 ul3HYZskJyAC0kr5g2B4nFer4glIYmDoO8ARcX87f0jQKiZTZ8B3+R/TyLKu1YxMTzaTRA30MIa
 2v/8+BQ4v81W2KyvkgbItUB+cOllAccOk5jJDMv8DJJ6knK94PI/rlAPuKzjQipbzVRk3yeECG/
 ROJ8rHL222Pvpo9PnDh+bvsdZ5OpE2VZtDX7/PNN9OYhyPcLogjzPEBf8d7O2yTFRFrL+b1sKJg
 JKqJHHtk9P1acSfT2hpBc2KJjr6sD36rHlgoYQsJBZT2B3CHcKrDXfhtKoBkxM2Nlc7FVa2KKzw
 98ENlRjibaOPZOx/IY8HjBO+tsY0GGcMglijrpvr8XesZ84n5lv1V0ptcaO6KIhjXmMNMk5agkm
 AKm4RIBX04UxG22UQMFaEC7QjSJUPg==
X-Proofpoint-ORIG-GUID: cjjrS23RO67hRG_Gzvw05mw2-HcPtX38
X-Proofpoint-GUID: cjjrS23RO67hRG_Gzvw05mw2-HcPtX38
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=6913476c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=3RWeJ3mqlPvKrM-9dKcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110115

On 11/11/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
>> Document Adreno X2-85 GMU found in Glymur chipsets in the
>> dt-binding specification. It is very similar to Adreno 840
>> GMU with the additional requirement of RSCC HUB clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 

I think you got confused. These are new patches I have included for
Glymur support in Rev 2 (as mentioned in the cover letter). Did you
confuse with the other patch for Kaanapali?

-Akhil.

> Best regards,
> Krzysztof
> 


