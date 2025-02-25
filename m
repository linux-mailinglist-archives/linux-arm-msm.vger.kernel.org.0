Return-Path: <linux-arm-msm+bounces-49289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23343A43EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BF316F121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41E9267F57;
	Tue, 25 Feb 2025 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9aruR45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBA267B18
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485039; cv=none; b=qBtEwSFVxLIORgpum5rq9YIUVkJTVZZBRH1kdwQrQJKS3ZI3+b6xgxDjACemakEtYuNyYFxYJyQeTOTYTVgdGLIZwD9X7BfeVt2wl5Qr6XSlXVrRHuglyo4NS6+0bX9mb41gxv0ZrdDRwGkNH3KuU8PiyhcvM3jUCKEmn16D4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485039; c=relaxed/simple;
	bh=PxLJGOEsujYyXLOA1LVdxbe3bKtuHrxa6NSwWd3npKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTVBpCqt1XapLy8VZKeWlVu3xadQ0scnb9M9iDANZm+AZrDW9P85DsiCS47DXUiOUWc4QU62enWEJ+4ExyDmjTQrORJT9IOgqqFFt1bEUx1JMd7rsmjl2XKjRFy1wDY64B79brcAJXTSbRB3og+K3NvG3XhrbNP3i9AZmVO0Qrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9aruR45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8OcaL001880
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 12:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILy8Rs3qH0JOfr3SxVmZK4zquSUgVqlPsIwHGwC4KZ0=; b=N9aruR45cP/DOpvi
	loWHxaKn4ePOFa5gdIDZx2TwWjST524P0OwQOQ1kwsX6gOZm+n9FIWPdsVzTxz5M
	dFoUk83/bUN/Az1sTSJJQRpWIJcTJNZQBGR9IwOdQDAv7Rckv6ecfaTHjAXiQdqG
	huLvyzMT547cB+MAOwJGjkPBDD3NHFVkMUh+D1qzkPpnnsdPNJvYNJTwfEHv3Xmb
	WNG1rA1F3Hmf+rl43oYZipdbzgpXdDXp68i4AutlIgNWQiMz43AhF5Pc9a23Ke7W
	IZ50Hr3DW5Pq9XXedl+iswVQPD6OtJpm2oeb4ppULALnCAER3V30O++nRlQ+6onc
	I0lSSw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7rk0kf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 12:03:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e662a02f30so16283246d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 04:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485036; x=1741089836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILy8Rs3qH0JOfr3SxVmZK4zquSUgVqlPsIwHGwC4KZ0=;
        b=YsboRLbQyCNB/CCfF2k5Qh7cl3dBJ8jlo73RB+wZrdHRzfs/TUlr2SYCNNfq1DiUUB
         XBCHKx2rEh0oiYSzi6gg1aLku0lAB+BeJqEZeY8ea1OMoyRdSg55lHrwjjZD7QbszqO2
         L4VCRTs61B7scKYK0QwWi0rc7PXZXsMaWmUSV7Ycj2V7kXM8iPqkZg7aGxZQ0OrsAU2k
         U0HYcYMykyDXKZ9zId/kN+0eBDYyd1EjG7UWCzXdP9DrG+22sC3XocxKZ+z99sxYtatz
         08Kpunx1XjTD9aePX+JB6QoySTs7ohgpMlp3lr7RS97DC0dUY3oHViHrHgHE3ePO20a9
         eSHw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTrAHpV9+g+4lX6kExPKbJOkIh6Ua5Qvzj/Q2W8iZLulLPaMnPg8o1Hzsom4NT7PJO9ArKJNtyaMxS9RZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCXB3nz+BqoN3YLFHVzbXAKlEJTFIXVeUsX5/GTlKFEtxG7gx
	HAaCwGiWRM0mQwX5gwaRvEps89jqkwZQ8dO7Roldi3OAC4ICPJ1q4lHoE6bz1fej7sHk+A+fjk3
	MBbbVYGdxP2JSAQiGi71tMGhURUQPDf0I1TdwvJ+2dIz7is15dTVr5/0LFRM8lEtm
X-Gm-Gg: ASbGncvzStmYDe47B0Udk5H59km81AKaec9ODvsBHjXjuP2tExzm80CEgsL/J2hNH9H
	hkUvwhIqAN/0S09FXPl231Va4SFtSWIuKAjhnB6sHwrhRpEjBcutI1SOhk+FHMjXs0yYYfZSZ2I
	OcELL3093KNpvCP7pCkhp8U6ZyQQ8swk3IGOrr3djIu0VlLvyTfB+dvS1+qm5ra5SDErcwcRaYH
	gge+cWvk6SBGPKYKAaSJ7LA7Pg5bvEqBLFW9ZRtpPEBhMUx8HwAmlBketsTUrvzbPtQiYj6zBF9
	GtUesbIqzuVaDO5CWI41uNv63Sewz4wxcP9X7qVmNDyE4Rsbmyt8JHIc7rSlHE4g/C61RQ==
X-Received: by 2002:a05:6214:d69:b0:6d8:a723:6990 with SMTP id 6a1803df08f44-6e6ae98a192mr78484986d6.7.1740485035904;
        Tue, 25 Feb 2025 04:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEORbqQZ5sf+h6IgcIpi2Q5Xp1o/awXYkrpeSM8AjuI7e7HoyV8DchTL7Kt5TZdBaioRlIlXg==
X-Received: by 2002:a05:6214:d69:b0:6d8:a723:6990 with SMTP id 6a1803df08f44-6e6ae98a192mr78484826d6.7.1740485035581;
        Tue, 25 Feb 2025 04:03:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45a8b8b48sm1123522a12.20.2025.02.25.04.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 04:03:55 -0800 (PST)
Message-ID: <afe5ba99-81fa-41c2-9ce5-0f8e2fec427b@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 13:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: sc7280: Add 'global' interrupt
 to the PCIe RC nodes
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-10-e08633a7bdf8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225-qps615_v4_1-v4-10-e08633a7bdf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g7Ft60rn9Kz5Hxn_aeD4X0nn9xg1XiwF
X-Proofpoint-ORIG-GUID: g7Ft60rn9Kz5Hxn_aeD4X0nn9xg1XiwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=556 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250084

On 25.02.2025 10:34 AM, Krishna Chaitanya Chundru wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPUs. This interrupt can be used by the device driver to
> identify events such as PCIe link specific events, safety events, etc...
> 
> Hence, add it to the PCIe RC node along with the existing MSI interrupts.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

The computer tells me this one is wakeup-capable - is this something we
are interested in describing for link up?

Konrad

