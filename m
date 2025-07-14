Return-Path: <linux-arm-msm+bounces-64794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF84B03BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E983A64FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 10:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C264C242D9B;
	Mon, 14 Jul 2025 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SV2NH9S3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84023A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752488791; cv=none; b=an9w+r+jKCfozQ43ZvwsJLN1ZapZSUJw2CGlFiscwlC88ovptxfnqzW2+cbawm08BRmMYld1JzrJkvC9jc8GDIxvvXO/nOi4cIDts/4hVoLvRPNmmcLRAGd9pIcHDMwfXESt35Om5RE9McYPSbNMXZZwu2ud8tdSz9grONPwqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752488791; c=relaxed/simple;
	bh=3WgJKsJNXm6nkCQk25rfynsk5InHOlPiGe+VoI8VjoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enRChU90kOFYKbgnlKtn1wyxaYPJp0xO4humSzSS/3Cls3Jxb/UmJMiK+tc0NmVP6gPlH+RPI3gTWzxWnuC2cQAiHWl/EGQwRG4f60hIe6pI1kw3pXPMUzUPJvUcQyYs4OJo27hqt84yWM3CWsJENlncDOwbTaYhFg3fiP3cQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SV2NH9S3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9gd46026710
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egAELupiCZx06w7wEK2KFv4UsZXmQJRYPb1g2z2YVqY=; b=SV2NH9S3KyTAlgcK
	40EZ36lyqXFJ1HVoZwyB43XOXkIu/ldTZXodxZ6bC0y/XckneTlzgE+yFYlWffGf
	udJcJT8CmQfddyxX+vsvS+Frevh0IqP93p8ajTOG+Ymk2dGVvWOIFNow3kCjZCGo
	5jXDUahHQ+M66zDYi/f/vYf6V/bzDDaFKLEt20AVX36dQpUqcM1cuqA7qvXW2AG0
	fF5Yg0ez6bVk7x9UbM2TYItKccB/dwFUtrXHQ4G1/GdnOZUM8vQ3+pfn9mHwBry8
	fjPwD8Q0Tw6UbWr4HB1julg/Mqnt1dZYBhvGh/uSOCs2Xwv5ztg4+eh5LuBKGnij
	LP5w1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhc9ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 10:26:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9b1f1fa5eso6081521cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 03:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752488788; x=1753093588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egAELupiCZx06w7wEK2KFv4UsZXmQJRYPb1g2z2YVqY=;
        b=M9AnIvo1+oe5VdJc5NDMo0t+2T9/a/jsMCsJqz2YxPhUqWbpW4Q3xcS6qPbAQhOXhg
         /xcIYenrW2dLe72H5kLgiSVvkGbWAiY3vPTJnperYBcCEUt7EOLJY7jvxNkFXcJeE9J1
         JKa5zlrDYEvbG5N57vKvxdky9OnMmgarglfvq81U3T7zqJGl6bUu0hiP3EpcyzUK36o9
         46fR5sfmJL8pCbKA7yh9oVJgntnlAOd+sYl6LRqmHeIaewMO4dwgyrm2z12Hx5GV+LJY
         zc0aRNesZ3eX1PlWYTKt316fyOrGp4B0Yowi0FK/hrJcovj3+y/jFe5cF551pCH/CHKa
         8kgw==
X-Gm-Message-State: AOJu0Yyth3SM0gChQ2J3SKl6dZbl4EyyZ+10ejcoKmRBmaXvxBwgKAFr
	5kI6Dr8GBBdiB2BhA8lQpE3Auxwg28NV3gjE8hc+C0gcoGeBUOUxJbedzTGQ7fnB5NmrFfTR43J
	7ZrYmy4d0A/4WN4ARZ65W+Kxz9vnaN581mllDat4DU3wDK6jFDRPzN/ySuFEWWikwqxLr
X-Gm-Gg: ASbGncuXl1SDy5bGXjBYpGkZrF4PNqdR191RMerDp6wSGb0MWjMx0GI6l15iL8SLHHN
	0P4ygP2cJaHF+by2+nA6ACIEyswBza70rcJiZ2HVcPCJvsTz5+kx2awkngzxGC5TKLoXXiFr5NN
	HK3bBc/SkPI08Zkb2AGqdXhbR5t6S+JleCgZXVX/qAaKtlT1JizbkI3B5VKw0B/7Kk9z3SnsfhH
	t6OeB8v+HPB2XBs7KwW3iPO8uWE4YGtRw2l38XQ5YDC5OvtCiUT0l4vxAX3FKTbk/kwkdZd+3Wq
	M4vccCl3jX3/W7KByzSLmEju77wjEg2I8iIpgoh8Trip9IDwmNnY9wQqWD0Oi4GA9gc1ZNZdav5
	pjiYD6rscspHm1ZAjjf/I
X-Received: by 2002:a05:620a:3194:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7dea52c0555mr554053185a.11.1752488788011;
        Mon, 14 Jul 2025 03:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDL1NLrtu1vBkvJOxO8syOjdbhxl5epP7yC4DT9HmFC8zYh1BXgqTPIUl4qDv2CMgF8y+JcA==
X-Received: by 2002:a05:620a:3194:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7dea52c0555mr554051585a.11.1752488787599;
        Mon, 14 Jul 2025 03:26:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7f292d2sm801836866b.72.2025.07.14.03.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:26:27 -0700 (PDT)
Message-ID: <e0e08139-6231-40c3-8153-5a1acebadf3c@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:26:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] PCI: dwc: qcom: Switch to dwc ELBI resource
 mapping
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
 <20250712-ecam_v4-v6-3-d820f912e354@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250712-ecam_v4-v6-3-d820f912e354@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7fdy4Z9ge_YA_DZPL5WWf91e2Y1ZTHF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2MSBTYWx0ZWRfX4z7YhnnC7LIj
 O/Efr/vQDLSKM3p5los9QSkN9sJCIUEO/g9ZJ+1lDPfOG+CJK/RJulyXclXClKv8xAosdXPggsZ
 +9bONdzBQSIHUd3AE8UfEYjB8tgiuo7FDIRZAe4X3ibkV8lpPQg1AnLcI6A/3u+4+CaF2boHXRk
 4noURQNu0IzIAhns0mhTRFRyc6xf3AFBEwMwFFvpZvq3aCGnjAnP2KyT9aAyfEt7Rc+qdSgjegt
 P5FOne0LPkxwsKbugmxPLDaWh/1k7ji1w2QFb/SFaGvQ1kQ64Ygb8JjkhD4Uy4Hgx3gS2ozNap4
 Epeb5naWCTA9OQ7tiUU+/pxENHcZEjf5WFsmjyBvslaheiIvDQk+XqLKPy/rCmU6vmkK3w80KeW
 /VEIUokCvAX4LQBYKC+QFPDKW03IxZJ4VBMEGA2Oh24ATrvZQET88gNBZS10b8d+fftxr1qn
X-Proofpoint-GUID: 7fdy4Z9ge_YA_DZPL5WWf91e2Y1ZTHF2
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874db55 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=827 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140061

On 7/12/25 1:42 AM, Krishna Chaitanya Chundru wrote:
> Instead of using qcom ELBI resources mapping let the DWC core map it
> ELBI is DWC specific.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I see this can also improve:

pci-exynos.c
pcie-histb.c
pci-meson.c
pcie-qcom-ep.c
pcie-kirin.c

but this is ok to put in another series

Konrad

