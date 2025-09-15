Return-Path: <linux-arm-msm+bounces-73501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33146B571FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7587189EE0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EFC2E5B3D;
	Mon, 15 Sep 2025 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsQLO7UA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138C2E2DE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922595; cv=none; b=Z9ABEcMH9O2lFFSaDSJlw3d6/CMe3vnEUpf+w1WWfp7cmfU04Z18KeOWf0rBX/0S66DBNQFxPzarP5X9B+2qlLPALOZXcTYKvSfJ/z5A8rlH+Q6g54EyJvvNaxHun+oCDPm+PnxduEQZv11SnNovK/Jald7R/6TMJVqJe1dzmX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922595; c=relaxed/simple;
	bh=nJbvDWyIsUQWk9OzO7GLVb1p8RNpMPZw5O64MziGJsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkVdXUTsnH+tVZv7T+b+taRWypjyTnBl1F8cKPeXhC8UY8qd5PrqDNgOi1zg9Zv1AZzhCBih3n7fAkvC6qTpmoZbffPI89wTv4j+1QZzs8CwlbJT1lHFHAdI/edXpBX09wErESFwY9ZrtCuOebdqvClh/gGyPr0lRRhacqiLD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsQLO7UA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I5X3014405
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnkhKzB3cTjh1Jm0VWCLO2P2vkgaZAhGkakhCBvhtj8=; b=nsQLO7UAf5OE9/3n
	c7nyvYhh8Bj8HiXH5HVE4YK96wkYQ+N61SCYjfjxtfRml8MzxjcKPrc7UAVZNpc6
	MMMcg5n8OD0TtHjxiX1eP87k2nEXcW8URKl28diMLopdB/XrMTeMNnxjNDG9+xHz
	sxBeaVknR8zj7sVTLjLCEKGe+V4o9JAJN2Dhiky7JOyOzuNUCjiomgE1UBVKoiGC
	16jsNBmK8eZX9JSxh1NGZCiIf3uHUco5uMxxwcySRdDwVDWfM+2nhWGJ34V/LKN9
	n6odQ39uQiP6VESsKvaUvZeo4FSH/AjyF2Bq1GrPfEzEmpPgkpFFeMG4elqo2OWW
	2ytIzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da98961-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:49:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-77c37a2c874so3080956d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922592; x=1758527392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnkhKzB3cTjh1Jm0VWCLO2P2vkgaZAhGkakhCBvhtj8=;
        b=hrZfcKnSJlTE7JlIWq2M5CKMYBPFyf0R4JlD9gLvmvb9llUgLKzYA9QRZdPqULjU9j
         uJ9OJpFPMUtCSs52dwzPcFoM8lZfgJ4KJej3t8PcDvHVkbsP5+9K1RAoY/CorIPRS5b/
         fb9FEULYrQwlHb4ZNhqZIo+lZjKxWszETsu2Rf8XfIT3JCmP7tzy5H0vYKDu3eftOQNp
         1o+fFyFSbPMxNZV+a8d7frlwaDotVTkqj7rYDVs5WZPOzKd70eGB2tpzhjwCPrRx3Fou
         IdPNH1kMHPsAnSaeoCE2Dz4k79SX2ZVtwTszkV1xAB3C2a3SFAjPCXNe7S97EtOkr1w9
         pNNA==
X-Forwarded-Encrypted: i=1; AJvYcCUKzEPPBBlE/h6gxu+yHDJoqeyqu7h3CH+TNYxD2f0LonSqtjcWj6CDgS3R9WbG3qNmZL8e7g0lYoNBREOM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6g0fwm/KjLGdhB5n1iAGc159fYo4ZVzrS+AuY8aOiuzdVBJnk
	bO/tvDUDWLyvrM6n9LQUUM5rXngowvxdN1yzYXk5REVWP41goYn3xzO4XXT1VTalsbQp1JCilMv
	V2+iEs/i2Tp6tBzQ9nf77wIVXpYy5y3DYsa8NfxuIoi4+TMg9F+m6I+/OLa3KenlH3nHr
X-Gm-Gg: ASbGncvS5W8PA5VIh1jwqXKayzmo0ImiqFwcwGhmMuHtUN2Fb5HOUwRyq221CwQubMb
	Hf2KJEPPzrpMrB+N7xguJZu08sGhRcLqFWzhHVAFXkHJ2Wc+X7pqAGagmOXIPvC98AykBzph3HX
	LWSQMfQQEAtcIL2JorHAtddZLVHn9mibohzlgTTl7L+WWEmL8l5vlZ4/zYoMXHMuzXiWQ1280WI
	xso9vNO4mdzlUIBVvSpWrt8FcBl58T9EJMkVsrviazNIYVYcQSL5FQ0o8zxCqSu8BBY3jSANynq
	xZxIIT83jll6ey4CLZFQyPlYbAOVMPxq7frR4HHNyi7uvYJt2bAcyr0p3TVNCRZFSj5Cw5gy2id
	RWW9IXlvwBSE3CBdS5JscNQ==
X-Received: by 2002:ad4:5fcf:0:b0:74b:7908:b037 with SMTP id 6a1803df08f44-767aeaebfd1mr101391716d6.0.1757922591674;
        Mon, 15 Sep 2025 00:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHJ2mWH2t4Qq8AtZmB7v2EaqSnwJW0KUMh0XXzRrfB5UlrVR1nKNYtdQ0ViWTInmxe61E+gg==
X-Received: by 2002:ad4:5fcf:0:b0:74b:7908:b037 with SMTP id 6a1803df08f44-767aeaebfd1mr101391596d6.0.1757922591270;
        Mon, 15 Sep 2025 00:49:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ee7b531d7sm6199740a12.51.2025.09.15.00.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:49:50 -0700 (PDT)
Message-ID: <a3ce0aa6-41d3-4ce8-adff-14c767d7f871@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:49:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller
 node
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7c520 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=8NCsgvPOa7tqS022DyoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: V9ZFOb0CpsxqwS8tuVhn3sO1I9q7BonB
X-Proofpoint-ORIG-GUID: V9ZFOb0CpsxqwS8tuVhn3sO1I9q7BonB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX3l6zhnqKifcK
 3jovpwPKSUkJjmxp6kXlduFHN/5SRPWPad0cSWUJAOhQXi8jmd9aElxQm+6MSSvx4Pb8M9k0ll0
 zDr2ikEZKnBA/pKHaEPqQnET0bJU2l5G4+rJdDe31qYjuLTqEMExYTgONylgx4XgfGKQQEN2Jkw
 TE6kea1X4ejePvmlgnnOzY6PPcgKY52Cmp9JVTXxnT9V+h9kGR4EO1gHNEGJEO1OcW22qC1jOs/
 IE/CGcIRlOANoFWggl0pMr46kXMw3kATrqoa8XbrqowiDiIq/CVyKuHxyjgZ5rPVc3RVrOde6pX
 FUoIf66H4C0baY529dfcxbqDgASCNBrXW9Dw23rnCNBqIQOrDDRhBzatrRKWATvF6ZKO6phcOI5
 tACUXnrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On 9/12/25 6:47 PM, Dzmitry Sankouski wrote:
> Add interrupt-controller node, because it has dedicated interrupt source
> register, to determine which sub device triggered an interrupt.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> index 0ec89f0adc64..d265c8213a08 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> @@ -26,6 +26,18 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  interrupt-controller:
> +    description:
> +      The driver implements an interrupt controller for the sub devices.
> +      The interrupt number mapping is as follows
> +      0 - charger
> +      1 - topsys
> +      2 - fuelgauge
> +      3 - usb type-c management block.

The MFD driver registers one more interrupt, and these don't seem
to be what you say here:

static const struct regmap_irq max77705_topsys_irqs[] = {
        { .mask = MAX77705_SYSTEM_IRQ_BSTEN_INT, },
        { .mask = MAX77705_SYSTEM_IRQ_SYSUVLO_INT, },
        { .mask = MAX77705_SYSTEM_IRQ_SYSOVLO_INT, },
        { .mask = MAX77705_SYSTEM_IRQ_TSHDN_INT, },
        { .mask = MAX77705_SYSTEM_IRQ_TM_INT, },
};

Konrad

