Return-Path: <linux-arm-msm+bounces-81916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC30C5F5FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DE6235B4A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177935BDD7;
	Fri, 14 Nov 2025 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ew8Xh4g5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzQNebpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465D35BDCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155882; cv=none; b=UoyYg96bLWUKOY+dUuntvMYbwlfArTbTsCmo68j6mAyuYd3am3XafpGdp7nICs83Rv5JvxY+DQmsXMKOMWSY2AXrX9KygLs1+OU1mJBGh7eb95BynFkC8XmyRd8b5Rn8TB++gx9G9faJ9BBqfhW8OoyKRRVsVN2jOzQdvcUUqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155882; c=relaxed/simple;
	bh=4wHutVPZHzKW0CBC6gvfiy435oE3atvyvraD0aRRdUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEm8330kmCINPsLUElefZe8uavbZ6oK8JJOkpkNgTaxMyV/Ht351opu+Stt6oAdpipIP5k0DLSBU/+JVzgtf7oeUV/FqlGfZIa04idLoSweP5lzcWgf+kIijrPkFTxYHR63c6uiIyEap7EX0ouXBwEFfjgFbq2fmDrEW7+AV8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ew8Xh4g5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzQNebpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQ8NY091892
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3eMOK+HlzN3NWKmihAhMU9paKgRRNM2y2GGr7K3kG4=; b=ew8Xh4g5vpSP1Zjg
	bpWldg37vo5D9nIfqlX75E5xvFWmmHVSPFcE66SjIym7DmHtNWj17HeRtFs7wcoO
	ZteQGNULrbIrvhIsIPjlp7/gSkqmFmfA2osH5N7twAAVA1QtR0z4mQ01TTXrZVbV
	8V3Q4Plg2vg9WZziAdO/G/3NcW8ERHOB/oIIZVAYL+fAJLaymMiLgijHulGeRBeC
	ySAKrF/snKDJIZL55r15iRxIQQP1pneM3emuH4LG5hzp/jI51WeUcHCbt7tyygdS
	LjXUSTBQIwlPCPV44y8HZCfP2HqcJztHWIDMI24IwGDd/zi6Qhs1Omb33idzlE0M
	E6VntQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae6xm93qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:31:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edace8bc76so8156641cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763155879; x=1763760679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3eMOK+HlzN3NWKmihAhMU9paKgRRNM2y2GGr7K3kG4=;
        b=XzQNebpeAmpZdSOEqaPnwSICDxfHGSwGEIGoOH1tn6p0O4oqSJOj0C6SdgrtDvp/dP
         2yX1/HJCVq1MAFr48kRnD2sgDTSGbXKKknVdLMGDvfmFBWHWkNbdVhNONVDYPJqE24e9
         XfL32SVm8VoXBMyEZUznJN0nlp3IMIGy3IA2FMz3NIyKN5HTPP5Of+ZRGm6CGunDc8Pd
         gfZ4Iam3YBRhS9sLXvz7L33j43VXJc/rzsX6PWMdxiKYPLSZNvkUzU08poKW8KccmUPA
         X8Bf7yh/q09UynJ8PORXes10Ot117MHugEgfdqWNY8YX5WHV/Ud5b51JN/fw8Utra7Gq
         xn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763155879; x=1763760679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3eMOK+HlzN3NWKmihAhMU9paKgRRNM2y2GGr7K3kG4=;
        b=d/XFAd/++xX76Ekub6pCepoXlDtRjSGp21YU6dhdFVBMQqlG+6CV3VbqIsv0q3x5MA
         0SDVzcI9lRVVz28rl8+adk9MvWhEzFo9B3qUyqi9Z2TKcY37SC4BMHR0kpF7yA3g6mZh
         r2calOv1etrzEFbDCLr7DdQIH1BKoQKCVG2ikjh0Ep1L3ZHkDspP7BVLnnAPypGmaE3v
         QYnHcPD1QVtgXoR5VCa/At02DeeMIxfrTk/xtvN06A/Pi0NkHMwUmMpcNCPo/D4d0Hi6
         P0tvsyAa4RTYjSNTYFl3WwP6R4bAuiCByoDZkB8nbobhIb13ca2w+nbma9M9T0Sm0MD3
         7luQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdzqhTy1hVafpltg5LK3ud5Lc8gasnwqW+vGKFeUpOJP2qi0wI3tIq+mGcNPQbv6EU3RFVtJjm0jCVsCO0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2SfSMD/30HGd6KBwnhLhbL6guQIjKHIuPqfaA2TNGfC1SG1AX
	EpTaXPhF8b8G6HlvJqRLMIdCtEFG/39uXMiIukWyP58lIeRe2HgitL07xAO10Tu+i/vkp3NjGd2
	s8Ve3dLBR32QgazpBHG0/oWZUA4XwCsHihUBz4tYg4rBcVg0gOsLNd3JvBF4mADkAbFij
X-Gm-Gg: ASbGncuUjRqMLo159Tcs2nzX96uYuL8ySh6F2HfOQLmxqd30D9D26WKq+gIf3xksOD6
	hSx07tYKmqgng/ifMTRQNsumjmEr/fSEzwNV2evVG1Z9Pct0j7+V+fswamszVFEAaGx4aOM0Lvk
	qMbUL92MCePvf5ISi8LFXZfTBeAsD0Yy4DSOrUIaJOLPPeEKXQLNXayYOsZ/jCGBylncv3KvBAV
	I5b8ynWW94dJ3lB8VrPc8VRb2wPnq6+Z4RwCbsjEHm1KUjiu8GiDwfOwioLfH2qJjHVRxXwhGil
	07C3cn6MVUgBkxwNPWv2AoHjpsUUuvY4rB3tGI5UzwhNv1WwtIy+oFwY5l64OnwAqHJxAhG2t47
	EdgHbowcOVKfsUX58G2XANhPA0Pr4/hBZNOZnjPMt/BAlaNyv9zkQ9RuC
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr43731161cf.8.1763155878562;
        Fri, 14 Nov 2025 13:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG84e13Ij0fjz1mCVTKqmi8pqco4zDdzx7qetDnkV/I00+/pFf6pc8OO+AxyQJYwxhlZiqWog==
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr43730771cf.8.1763155878151;
        Fri, 14 Nov 2025 13:31:18 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm463058166b.25.2025.11.14.13.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:31:17 -0800 (PST)
Message-ID: <f4fbc949-415b-489e-b333-4c846d3ce8c7@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG
 variant of DB820c
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
 <20251111-db820c-pro-v1-2-6eece16c5c23@oss.qualcomm.com>
 <02a9d6eb-e480-431b-bd4c-a35cee170516@oss.qualcomm.com>
 <wf4h2lwyvgswtv4bgdfidj4vpvykwhu2gri4crvvtd644hf6nr@cnpqi5bmpvm5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wf4h2lwyvgswtv4bgdfidj4vpvykwhu2gri4crvvtd644hf6nr@cnpqi5bmpvm5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3NSBTYWx0ZWRfXzGY/3Jsp4GKz
 BbR78sE+CM0Og1LoOVaUPKPoXnLq8KZ3DStzelj203YN0jOOPJjJKewyqp6PNbkNaK23lKZWA9L
 EYmktzMsXhEs0Cp+h3b1UdqSonuxdRbKLJy/MIH7aC4p+5hsnMleNjqyUrfAf4uwBndPY4irDBh
 w+cWkRvijmJOdLfoJWSb1WneWu9Dgf8KlhfLl5yE8FGtLeP8sLDkE3bijf7R69pWXj3v6WaafhL
 X9wIUn9C3F5v/kx2HuGWp6XcwBh60nN1BmaBbP6Ept+Bw/zv4hFje6gUg4Pt/luP3KqMbYuTJz2
 Z2XQV9FYfRKwNE3cDw9jPI66y08yQGQuTBCoCiD0K8FbGAGgd1PZQiSMzxX43/csljv9NvE2Inf
 3bBLIerRZ8oM1XHDYPx8pEhYUzDMaA==
X-Proofpoint-ORIG-GUID: vzjA0t3lhQUUYzo0XHvu8xvhBUvvp264
X-Authority-Analysis: v=2.4 cv=NZHrFmD4 c=1 sm=1 tr=0 ts=69179fa7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u3Kf3rDHAAAA:8 a=p0SuUtGt204vInNQsQgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=EGheP1PGFffiXWuNiQ4X:22
X-Proofpoint-GUID: vzjA0t3lhQUUYzo0XHvu8xvhBUvvp264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140175

On 11/13/25 9:32 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 12, 2025 at 10:44:49AM +0100, Konrad Dybcio wrote:
>> On 11/11/25 5:02 PM, Dmitry Baryshkov wrote:
>>> There has been a (rare) varint of Dragonboard 820c, utilizing Pro
>>> version of the SoC, with the major difference being CPU and GPU clock
>>> tables. Add a DT file representing this version of the board.
>>
>> So is the conclusion that both flavors were used?
> 
> Yes. I have had a production unit with a non-SG flavour. Bjorn's lab
> has a standard one too. All units in Collabora lab are Pro ones.

Pro doesn't necessarily have to == SG, this seems to be sort of
a "MSM8996Pro" and "QCM8996Pro" situation. I'm hoping that speedbin
fuse values don't have different meanings for mobilePro and SG

>> This product brief
>>
>> https://cdn.lantronix.com/wp-content/uploads/pdf/Open-Q_820_Development_Kit_Quick_Start_Guide.pdf
> 
> This is a totally different board.

Oh right sorry

Konrad

