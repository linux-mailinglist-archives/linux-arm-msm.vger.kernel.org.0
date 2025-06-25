Return-Path: <linux-arm-msm+bounces-62474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46192AE8527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A5F189B8AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EDC1DE4E1;
	Wed, 25 Jun 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1oTDIVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7393074B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859335; cv=none; b=VhoOyQm67vBwmcKpS3NsKV8IR2ymuaLY0PrUvKaTvJ3969qUkOeJiDK3HxJVyIrjDbm+U87DqLzBWMC8PiB6cIGKHjiuyaPnAS2SeW/pBtODvPkJF+WzJayL3dNvZQ4rkUkv7axCML1QdvCLmY+V6pfM2qbAldSgIMGWWd06RxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859335; c=relaxed/simple;
	bh=W8XsPkooqSWhBnh7adPxkW45QqSreqR0Z+hC/C6jh7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ISDOdFRgSM+RsjJ1TVNKspbJNcFtSqmRtYm87UwU6O/cK6aCO2rahqxGM0r8Pc12n3RW1/kjcxWwyWSejMHWpbaF2IiCCgaUyzgDB/sBwv4djXmAo1uDIcULCvlqN0c+20R+go2ea4eLzzJTv+hIxeeKCuQ/0ano72ka4tJDqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1oTDIVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBDw48021620
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ei9ke8f8VrdBo3kzyAxK4Rvp2+UBwljgyHvH+xR4lYs=; b=H1oTDIVNB3bnhka8
	qy4s2ckP2JWJ9ow75CuJZ5I3JhWzwS0jiSO4YCAaP21Hq98icGzRDiAbRdwSdsot
	8VMb9Yb5fpdErHSb1HO8mE804xWQl43nMEQG5zvM4XmNdHEKOqp0RNlVuCj0JwME
	dqUjQi15QYD1ylyWIaxwF7HvxpAZH92TIZAEVqwWw9iQfHfYnfGn2j1huoBd6f2O
	99yps1wxRQnmsXa3fiQVdom7xtDfW9qJWtx+Gjd6e7IOINuM10GJuNBiWX/EdKFb
	s6+GMqOBnCcrS+Lpujc0T4iAYnJgNUJpI1e6igXiv888Ql42H4OoPOZ7DmNTOPXw
	UyQnbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26a9qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:48:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso157151185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 06:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859332; x=1751464132;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ei9ke8f8VrdBo3kzyAxK4Rvp2+UBwljgyHvH+xR4lYs=;
        b=R4oDuvzcZ401iNa7hkH7NP/3t8jKhsDf1jQfQaOpHGr1MyX6yqcA0emdeEcTbR0hV4
         60BQG2LmCiyw9NaD/T3mnhid329Bzp5vDzGpmntdUdUXVZZ+jVwqFsehkDpjkqmVr53w
         TtSsMuQJGiv5RlHc0QKB4kgd+iH4sqp6qp05EdP1lp1sHCNwWrYjKjnxCkcucqNICd5c
         s2aqOLjpPui+aFtpuNceTiQU8Z3LLUoN2NAWm1NEtj1MVqF6OH1jDpKGlvFnlfpzmkqo
         zPsmS1HmQkRwOFAEIuEZsGkSKthU+kgMQTDBkHIk6WfMfJb7BbHwBq3usfD8euCzH5U/
         uuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2xTVkyc6zvlb+6OCET/SMn/881EOgL3yyIo78DmYHXevs8V6Oda777vEu6S77JJ9A3e49Sw8zhy4DWne@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbjkT0IqMoWAaA/t4CtdkKunCnwHwwnI1q8kfHvpEHKyUj9Ay
	GhtIda3Kcz2v3wOM2XaCm78IPjEMdUYCUYJALxKSh1M6Idu20ptVJmKVl/FPELp0I+LYyFcox7p
	wx2g24MnN62cgMiR+H3exxGJ3C3orNP4sJDCjbJXg1RSJEj+HwhaE7ZUuCZp929fj1evxM2bxuk
	Pd
X-Gm-Gg: ASbGncvQMImRZM/LMfTISF8VQGaEq2NqVXW/K5XaywS9la6drdQUgo82jr5fKJ+pHBC
	CGXL7JwNH1mptLug3//Qk8NMtynOK0keTRZCpUlJZvsEzy/SbSKbEnWsfQaPnbn3JkckQGgwfpc
	vAlUNIpVOnm4HJEkwTcAJKm+H9hvI0vHwfH6drKyOZZ5SNUd1jIrAQ8+SQsMGuB/ZoMdszykWAv
	sRgCWm8lej8HXZXclW439aPvYB32wblKCO0VHN4wDnBcWa1qp+G2g6XWOyto6pFjYpvKOEod0xP
	a4ivKyg3xSKjcQnnBZs7LBCXUTJkMxsvqwhSFKBKuUeF+CHI2VcU0WEChGovJ7xmKGoZEyrcPXJ
	Pr3E=
X-Received: by 2002:a05:620a:440b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d42968e592mr167185585a.2.1750859331473;
        Wed, 25 Jun 2025 06:48:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvZiD+bu+9cfo2FdpBRguQ7Froxb2vXSKWzwSnxB6dEOID1nqIr2EGwl2PGIAdswnMqrVA4Q==
X-Received: by 2002:a05:620a:440b:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d42968e592mr167183885a.2.1750859330883;
        Wed, 25 Jun 2025 06:48:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cd77ac44sm28136966b.146.2025.06.25.06.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:48:50 -0700 (PDT)
Message-ID: <b86bb1aa-7db7-46da-869e-da0ae439b78f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:48:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support Qualcomm Snapdragon 8cx Gen 2 (SC8180XP)
To: "alfredo.nodo" <alfredo.nodo@protonmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <xAOMDw6RIPBRl1NwaOZsLwoNu1l9Rs88XkbvK0P85jVRSKAakqWbTlrjEWljCJFmEXplwDa9e4MippQ-DPD1XFy_LjPTly9dUxC8NVfT7UA=@protonmail.com>
Content-Language: en-US
Cc: Anton Bambura <jenneron@postmarketos.org>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xAOMDw6RIPBRl1NwaOZsLwoNu1l9Rs88XkbvK0P85jVRSKAakqWbTlrjEWljCJFmEXplwDa9e4MippQ-DPD1XFy_LjPTly9dUxC8NVfT7UA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMCBTYWx0ZWRfX5pFyjy5u9e44
 VWMK05ZFokMnn24nu0X3ibPHdxyeb9qb/ISxztMjOlk3AHvE+z8/+SSqOxOGdOB4soqmQ+nTPln
 CnglCcTNqAvhxe54wCh6Aaf+t8Iva14FgUiOgrRImiCsI1YdCHcwtfqBV4NTC9FKtXQ4KLj0q3D
 A8o3pL1f9jAIdqvJIcnTWayEpbGJ/E2HGhoKQWxMLbVfZVDxnofX/C7Xdc/fvg3olZfck5o6L7b
 xSLSpW1Sr28LDILQ831/+AjR0JGVuafL1k3MvslJGD7r1UXKKPMy5tJ3iouQBMQPPCS44/3hEm7
 2Yis5c+BSzK1ptqENPz8XxcPR1P2HcNPpEbj1UEZl/CUHS7VV03rtYQwJs8jfDMTfr50RyQsrmM
 GyXpyTyqoC0ZClURUXAz+OzUUmMTcPhNdkpm3BfRb/bIH/Hyy6oG3ctZcW6/uP5oxxM/WkY0
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bfe45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=C_njbwFpAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=25SuL4xjpopLNeviE34A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=oYje-pY8dkYRBaSVYofo:22
X-Proofpoint-GUID: dpFwuGdhqCHCz5Tq23oOxdzw6J_xBP3S
X-Proofpoint-ORIG-GUID: dpFwuGdhqCHCz5Tq23oOxdzw6J_xBP3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250100

On 6/25/25 3:21 PM, alfredo.nodo wrote:
> Hi,
> 
> at the moment this is the current status of Snapdragon 8cx SoC support:
> 
> -   Gen 1 SC8180X (https://linaro.github.io/msm/soc/sc8180x) supported
> -   Gen 2 SC8180XP not supported
>     
> 
> -   Gen 3 SC8280XP (https://linaro.github.io/msm/soc/sc8280xp) supported
>     
> 
> -   Gen 4 or X Elite X1E80100 (https://linaro.github.io/msm/soc/x1e80100) supported
>     
> 
> 
> Unfortunately, Gen 2, which is only slightly different from Gen 1, is not supported (same CPU-GPU, but at a higher frequency, with BT 5.1 and WiFi 6 instead of BT 5 and WiFi 5).

The only difference that the 'P' makes is "no integrated modem" -
everything else comes to variant and/or board design differences

> 
> I have a Lenovo IdeaPad 5G 14Q8X05 with Gen 2 and I am forced to use windows 11 with a virtual machine to be able to use GNU/linux. This is my dump https://github.com/aarch64-laptops/build/files/14700163/ACPI.zip
> 
> Here you can find the ACPI of other user https://bugzilla.kernel.org/attachment.cgi?id=306011
> 
> Is there any hope to see such a device supported?

You should be able to do most of the bringup work with sc8180x.dtsi, but
I think +Anton may have poked at this device specifically

Konrad

