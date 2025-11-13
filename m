Return-Path: <linux-arm-msm+bounces-81559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B78C568CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6819350F20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD302C158F;
	Thu, 13 Nov 2025 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR0pXfs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCwb2D4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F828000F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025318; cv=none; b=kwlhWiUtTTiBLvI5vE1TXNg8IQC8pVuSMS2nXZq8EPNfaMTUB+R6zV6MSTZzf76ojOEO3vBSaJjgOJ3/anHHZUwcsUpyRfRPq3m6lm7RQ3hgwA4O0jIaDKJYKACOnNEcyqhOcoPsmOhzrD8waTxmgzGefRLDoG/yRkx2b3xqQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025318; c=relaxed/simple;
	bh=+2I0kET+9CVqktnQPRUDWWQn11vlGXQG5XhzK2wc0YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u+VD6uzXPeTcH9R3sDH8MWMsQe4HrlBlnB1gIQCNts41P0D6KGwODYu+dIWe/9+4iUF2fNR08HKujlR5xalbGUSA5W9IfyPXVU4EcSj2se82X3n4B27NoCekN0pK5U6DASTBK8IYlNL9U86zBdA3HzCn2FKLBoDstWdU+IZCwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR0pXfs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCwb2D4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD96NXk3035335
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLP2SIHhzXib+2zlnJMs3Q8griti3mtpmjGcYyxtDhM=; b=TR0pXfs5hGmPALNa
	Pw/FVcmHa4XPGqSoGZq+P/3+rPwTGBZq0jPWQwAz+zXpI/rQs5bgd5+UqeDBOK35
	49F4aMDKu2ibvbGDBiWS9wHPCTt5b4E0s6G6rvtRH4hdUnjSudCzCGzOpqLgNUW7
	6C+dX+SInX4pnmLee56WFTZM4h0+U1U5LfuF68RyMwCPU416m7DxkM4xBFCvvtqo
	/SnjIopHrR1ekE/vlaJE8pDwxdNUBUAAXAEi+z4AahokN7oyEtmLBGAXxbXOiN8n
	GEem0mnZCXnrDvD6jJyb4qUyb4HgW5v9NxOxl6sNVTrs4lK4NnE1Heqo0eNp67bE
	oc7U/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad4ju9gd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:15:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74694decso1246231cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763025315; x=1763630115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLP2SIHhzXib+2zlnJMs3Q8griti3mtpmjGcYyxtDhM=;
        b=fCwb2D4wuat77QRgO0I3BnR5rvNHUZuPBdzgeH5p/HP9bGQeDJOqBvh2DZGHhkJ8Sy
         Rz/Ycba0XPtiyMfdkc03TdcNsZ3hXZHzNfu6Vjrk3H4/L72AEReVjoNar64JSbw/x+/v
         E8me1RQYuFsl9tHwKaqiBEXdNkwoTYgMzWEZNX+zvlMvcMVbmjDaDrN37yPpc99JE8F/
         0SBUNvA7GFOvwbZvBZb0Yzw7KF+3YAQVuY2uOsSk8NLhSIZhTTwdsl7fXoAdF+tGN7Wm
         FlSU/Z5ZhecoIN5O30Ila8f399SXgJvXHrlZZ5VO2Fy0aJyG/awOHQcF/46oWGgB6A5O
         DW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025315; x=1763630115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLP2SIHhzXib+2zlnJMs3Q8griti3mtpmjGcYyxtDhM=;
        b=XQKWTZvJK8RIwzCaD5zkmwbYC1bpYCNkwmrImxcptBvSJCenfpqQOlgMPcXXh6AbEz
         qdiPqGeLk1/EkGlktWWYasJ1TSvvZROnhCmI5wLKOskEPwrYAiRCUxOSgkwTcA+NkHpJ
         W4IRZZdLowKTBrJDMJD4qyZp/oVt1szOr1SqMPv1xQr03PBOIiWxtqgM1/qdlLW6Bg6n
         TwlWK+xFDyaxTrJA4uvcIETmW5ZqIt8fB6Rlp3fa1Bd+vIdzdBh+f03w5WRr/NhyYjTB
         fhirLPhHsae27AYE0g0z1uFcxIxKsMFu849USPY/suP9JvAEDjve0+7zfk8IweuHZeC2
         FzUA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ciaHGIMJVCoQ0yDvXXLpFgDEXLMTuVYtYD/S/+QBWlZCxZtiJFgAHMxFnn08lY3avcCob2safYRW1Hjf@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2rf9T3Jb4p6NzIlR5HXu3snK1KYM2cWIs9smTm5zVLWXhMaJ
	4Qv9tdSH59hTF/U7dB5cky9Kc0CKo5GSk1/zOR6i7eonBHVFP6fgokV1tTOVzjpGkQI/p93s73b
	eYYWFvN1yqIKXJ5ye0I+1MgGd8IGR3g/lDEvL90OKIUU6Y37LQdBxLFWBwVrf16uMmDE63fpEsJ
	tq
X-Gm-Gg: ASbGncuXfCQ0DAXpxVzs0e6zvBfijjXMinJ0vPMf5Ok2LVWoPCjamWIGSoKNwUvs+++
	7y3IErxSI0pBY8IdMLHW4cMmrjIrQUTq+gEmAozYVTK6wohH2ye26vsMJVBlnsSdDFrGZVE5k8a
	WaBYxpekCNKoxOCEqPHv7mUAZZO+Fh+en91Sr4Dp0x+qdg7jX3zvzHGwbO2zxMufnyYxHohQfxk
	BEQeDttJC6qfnxaagdOgJmDh7fh/SMyGQab/bRQ9m4U2Peb4QSKudiC8+gy4t6Cix8uMq1Y8ZIt
	vxD+m2HbLBlhQFw6VBZZvbpHnq+u32VRH6lQaqlUJRAP4of2Xc5m2v6TXZOKlRgkhbw/R/TzhUs
	akN8wWDJejPA5ogevDW9Wlv+EPcdAmCt7sYDmP6TNKk/P2TLjIESRrwAv
X-Received: by 2002:a05:622a:1108:b0:4ed:e2dc:dae2 with SMTP id d75a77b69052e-4ede63aa5b6mr31796301cf.0.1763025315618;
        Thu, 13 Nov 2025 01:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV4PFuPYpN0A+ngIo7uy5Nni/EE2S28eHTbVKJjh6EHJpC1GGPOmK562qgRfTr9ZF6na1ygQ==
X-Received: by 2002:a05:622a:1108:b0:4ed:e2dc:dae2 with SMTP id d75a77b69052e-4ede63aa5b6mr31796111cf.0.1763025315185;
        Thu, 13 Nov 2025 01:15:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28bbsm999537a12.28.2025.11.13.01.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:15:14 -0800 (PST)
Message-ID: <cc4d11bf-a0ac-4cd9-ac86-2ff814073657@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: add support for new fields in
 revisions 20,21,22, and 23
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251113085432.1309629-1-ananthu.cv@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113085432.1309629-1-ananthu.cv@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mbzmo3fh-vi4TGTwNzf3MJXJfTiQsWRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2NiBTYWx0ZWRfX2n36eQLvho06
 Bdjmrh+RzGEmf0npe1zgpVGI4VLvd6/oCSVpUFT67PpZuXHJZioccWI1vMZdTVLw1b5R6ZqSl5q
 CEqZUjew78YZi0tFDXeKI4uDFoCD4ncvcg3qq5j4FZiGazPduocD2x4ZhHJyp4aYrBUInMmJ0hx
 218IQqZAyGrDcbQwjsXp++G3rQjMqwZLkffBZDcHRRyvtZb5ToHhnmsvQrT/SyHtO1rYTtoxERH
 VRCTq4JRYM7kU5pNtag8vP9rQOroi9UyoJx88u3K2SrtZGyEaB78v6eeSP7icd5ZrFbC8jTb0+B
 BYcekyQAd3KGrh4ETe44qEH/Lv6WAmQxCdxcUbV4pwVem4v+EsrQ/osk1d6J9UFpT9Z4j0eLKI4
 zyRhCDqiUQiI/JJWAwtnHRSbA02ilg==
X-Authority-Analysis: v=2.4 cv=BdnVE7t2 c=1 sm=1 tr=0 ts=6915a1a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lgXH0h_iqx_sREGEgRUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Mbzmo3fh-vi4TGTwNzf3MJXJfTiQsWRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130066

On 11/13/25 9:55 AM, Ananthu C V wrote:
> add support for the below fields in socinfo structure:
> - v20:
>   * raw_package_type: type of the raw package
> - v21:
>   * partial_features_array_offset: position on array indexed by
>     ChipInfoPartType, each bit notes the corresponding component being
>     enabled or disabled
> - v22:
>   * cpu_cores_array_offset: position on array of cpu cores per cluster
> - v23:
>   * part_instances_offset: position on array of PlatformInfoPartInfoType
>     structures
>   * num_part_instances: length of the array of part_instances at
>     part_instances_offset
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Please follow the existing pattern and add debugfs entries for the
new values

Konrad

