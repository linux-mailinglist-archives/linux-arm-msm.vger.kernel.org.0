Return-Path: <linux-arm-msm+bounces-72007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B52B43692
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896CA3B8761
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139482D77E7;
	Thu,  4 Sep 2025 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX984a9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B6C2DF6E9
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976721; cv=none; b=lrrNNKBz8R1t52f+x1s1hzlQT9QK7UT6H1FCMjSuqUmdRianPy/PyTipOUdBCJ5CXiAfoTtTG1q2Oj76Robizep4u3yibKw4/SZ6JEvsUxKQGoDWqsK/fYY8VF4tuHMhpMYcG7pfFQz1YFcQSctDxicRgyF4UH3sD6y4aqM/gUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976721; c=relaxed/simple;
	bh=Sfrg9M2z5FZ/TjS0lIhxVa3hQyyN5eG2q5tz3HsFm60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV+beem5xp7QWEj/yjbP4MiwsNLgunOWErO7bxCuD5wMj2FfzXIvWqHqueU4Hfzg/+tX44IRjIuqhWVwV/sOOYTG3tNfLUIsi/l6J3oqI/skp9bAglVjavACgj2WwojGFwPN9zkK8S8EVbBlvvm6D+aWbDWGSBmFMUprdU7GtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX984a9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840u8AW020996
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0hC6l5JZ6Ge20n6xQnqgPWUXlQn8IFqduagSkQakE=; b=fX984a9mTYG01Spv
	pxVCFwWAwFFqyvnOCW3Ag12UujxQOArmrIlH4hBk0nFg81nmmN+uT6mlCvbWCN6D
	ZnMN3CaQCrukPQhyY+tffHri+v6qJTFg+SGnKaOXnApT8lYG2l8+1GNASh9eOG5R
	ObfdroRmjcdfgfcXIqZohroXczVGJfc8c2DOTy+n4C9hewyOjXUQb0JXBFg6QZ+k
	qNA0GY+DZvR+Yz/DeL3RemU9EoEZ+ie+7s7upBIwb+tzwjEWj5sxwVzhRtYOssi5
	S8VKUYAR/I0v0jFgcz8zL+jmw06d55JOUGGtZvmDVIZEjGvKF9OKntJOKjWQwDbS
	LdoWNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fps4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:05:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b32216a52cso1929031cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976712; x=1757581512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xF0hC6l5JZ6Ge20n6xQnqgPWUXlQn8IFqduagSkQakE=;
        b=gW+LzAifCIPHWps2DNnR65o8kpR/5u15mN6DA8+4PDaSHCDkxCMsOzPBiyT2GXY+xM
         JFTHmRuK4VdcmmC/y08H3NEe/NFR1rYR4e3pqHq4eI64DnyUr12BBOv3hKi+oCmUl3lc
         RQ/DFFwRK2gIvIIby67X9J1jrIZfvNBX+V+MQyIIU/zjxWPMaR94z0xjzLgMCQEWnmSM
         p308Ko/mA52hOqyFEztk+3U+yPuzMXCwbjHwyEjgFlob/ABjWKgTlze36KIdrDSjzkIm
         4fft5w2N4rm/cn/7rB7k6AN9khtykC2gvMXkT1U8JFdz5P1luTapFdpYClD03OAbWR4u
         9y4Q==
X-Gm-Message-State: AOJu0YytGPP1ommfzW/ZE1J0RNvui42qx9hV2mf0xTAvYY5yOlAK8Ufh
	cb5bwP+s+xzdKF7fmcyDlhi10JIaS9hMn6yv9rtTkd9Nd0S8DP3BpvVAwk1lJ6hKTGmHWMDzwAT
	8v/6IyaD7vTZuTMlbPSGRqr0lUdArJPCRwJ1JldC5cGZetd9fg2Rqgt/I4OHd2tlfNX/GCRauPE
	hH
X-Gm-Gg: ASbGncsvn5rRfnXYO5TWcKHW1VytFYkgzuYpCKop9wZ3lO/pnZInSbe8C9MRWls9U+G
	1C7LfYBD/f3NSyRc4D3kTKc1ZQCpXiitta53jQW3+AAHExQg1tgk5aAtUnL+DcaLpLtYCF2s2qi
	g4fX5XHeGKdHtSSdh2CH4EsVlsbC+3ASOiLt+fx8cNYdEG9eS8SrdakOSKGc8mdxfVuH95+tuD9
	1PnDO+xr1Y6yy4EfQjnbsu53GpJB32e+/faNxak6EoEWzTEpG4WQH4vUwQNm2wL+H0wEVgSQWOW
	WrOghMJa+b7JE+QBh+bFCSHo0wo/TbZjLDB4II5WBibcAJlfGovSEvz+j0UkK9gP6c3c2xD3nMc
	l2raMJhyx4koMsTVbX76A9Q==
X-Received: by 2002:a05:622a:1ba4:b0:4b3:2c2:8843 with SMTP id d75a77b69052e-4b30e98a161mr167907731cf.10.1756976712360;
        Thu, 04 Sep 2025 02:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Qp86ciG228KLCiY7qG9SpMLg/p9RWq4SW9peO7VU4ceuMeQRSa0cHLhEVy2hzVv6Pg6ttg==
X-Received: by 2002:a05:622a:1ba4:b0:4b3:2c2:8843 with SMTP id d75a77b69052e-4b30e98a161mr167907431cf.10.1756976711628;
        Thu, 04 Sep 2025 02:05:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04189de5b5sm1085623566b.10.2025.09.04.02.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:05:11 -0700 (PDT)
Message-ID: <3a00018f-7573-43c6-867f-eff4041c0ca7@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] pinctrl: qcom: lpass-lpi: Add ability to use
 custom pin offsets
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Nickolay Goppen <setotau@yandex.ru>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <20250903-sdm660-lpass-lpi-v5-1-fe171098b6a1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-1-fe171098b6a1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX7xntNqPFhaoq
 d5vxajpy76U9P8LKNqXajtIWVKLlgQCeZj9unw2+GLGPCx+BYQop1CzR1ou4+RNnq9nI4Uxnqvl
 eZ3imq3HmmVwYNRYBHDeqaKrCHMw2gCE2n+8sAipU8HE2bS3LSFGZMmI2J21klZL0wa1RBRXEmb
 KFpaj7ZWRyUzlzcv3OGAmhTaMJagA6y8bRXQXUGw9f272wKF6PCMaaNCtS8tS+XDvf6OjwpnQDH
 MqXSAatAqpX0vh6T8w5efR9gUVQ8DTvw/h7jLAU6eKYJpsio0Rwkd+63GEw/ifRxGHINko0lgLk
 UFH3Fo3HwDpb/qXuijyUljWNGCgbjdhI9EgryWnOIq+XC48xKpA4/uTU+1+FI+qEtXV3Vy6mNlR
 K2Ffid2B
X-Proofpoint-ORIG-GUID: n3IhcZatJDMmbjGPHgi5SIRUboyB_gfN
X-Proofpoint-GUID: n3IhcZatJDMmbjGPHgi5SIRUboyB_gfN
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b9564e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=BJytJd1QHtw-lo9AdRcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/3/25 3:39 PM, Nickolay Goppen wrote:
> By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
> However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
> LPI uses a predefined array of offsets [1]), so extend lpi_pingroup struct
> with pin_offset field, introduce extended LPI_PINGROUP_OFFSET macro with
> pin_offet field and introduce LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag.
> This adds an ability to use predefined offset for pin if it exists.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

