Return-Path: <linux-arm-msm+bounces-75193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A4BA16DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 22:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C816F7AF401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 20:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64184321278;
	Thu, 25 Sep 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrQ3XmYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FB320CBA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833416; cv=none; b=B7Plu9ZDvN64jAcxEKnpb5P0LVxHS9YucmYsBz7hO1D2vl6XbqPo2WrQDqLzKwJdWehxSAMI8zUZXUgTks0laE6GQy5oalJsELFRwvxSKfewDE75n03+yHyy1NtPm7tEke+qB1wDEdNvPaVXcK9dgx9A34m3/DSAE1KqlPWuCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833416; c=relaxed/simple;
	bh=r2YlAhPV4An6J7hULsM6/H1cMTjJZEVgJidD/lCKr9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF+CWqCdmaLjW0jg5TdrnacDKll9FGI3H//MOZ93h3pUF3xYMQwQxOfYWry+QFdNY/gtWyZ+zsRD6JE1sytn2KyWngcYgCClWWpjX0OmE8Y8tsMfpahgI+TVl3xWYrXrw0ox9q9Y75UQXSv5C67AYH4XzVboEZPHXG+L454Wqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrQ3XmYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQd44028895
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VuZWEyiEWq0pbO1/NGVDc5uQ
	XNChuhTmrxLWaVwuQbg=; b=LrQ3XmYcL0DG4P2UOn4nr7TiACYWrOVTK4viYH32
	p80D0cg4ol1u719nUcs6Z1gARcM+KryVBIx5VroHG6ziKhsDXvtAsa0BC38aHhIz
	nJKW7c9fUFgX8+zWgu4CqMmNJOadBrUvoAQZhFi0AT7rqjPOWm3IB+3kr9I7ZL5j
	Xzcu5auuFa2QYRZN+k9YtlwA9r5HIwzLh9A50PayLBtZ1lGjhOA6PZmQD/J0A6S4
	apM8gGX7q0pKcuLbyQOiStPaOPiaGWR6J4t4U1BWlst7ox72E5bUF3CLC2b2Lt6k
	ZVlDGY0+/zKpSucyUv8iNLHIKMT0VGwlEiMr5kNYyu7Vig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0bnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:50:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d91b91b6f8so32544321cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758833413; x=1759438213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuZWEyiEWq0pbO1/NGVDc5uQXNChuhTmrxLWaVwuQbg=;
        b=Tjlr19aKJh6BEC4n43haApFrvVIoshjjmX5RALqCuw5OfcLoFHU3SvsF+JQFwDGrGp
         hA8MOLJHxgnwz54HsHgWwr3mGC9t8nNBO4pqkXhXPlCs5XTbLUeDY5jk9IvFSyl9BFT/
         WbVIpBPI9lk/gvxWHvdCVvcq3nSp5xa6UFMKEMoMBNBOa9WBg1CqscTmbECp82OeYwFR
         Mnl5wRT+yxD9/Tr5bsm9NFSExYcYO0KW2Bi0aCJ870aEkTSbXns4OAy1O4j/ZEgGPvij
         fieH0AvgcPcTifDHWhrXw8QbP01miXHZdTFenLW2gaSGHbHwKlH6x2zMr1S57MBv4uQT
         9vSg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cFDyATBmbNXP7Zw9FMQayAb7lZXQi385+ghwJloB2OHoXqpQYLzv7myU2mX4krYRroY9syRroM75h6xq@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwxoDfW2qSLlQqP++bpusqKxdtv2u+a9/IlQAxsbUBur2+NAo
	Lk7q2YHA0gwA/WMip/JaKvf2/7UkyR5dC3oEeqAWjMZ1ztyVTIQ7RM1e7939aY1qIEWw8D4InhZ
	eQ9oMW4QahOs+7XJ8DotfN46ZWIZjC3wal4DvOLalxZQn+0R6RACpikaOtmbqW7yi5e4D
X-Gm-Gg: ASbGncuSv8wBbV/fgdIGf5LD7dxYuJNfvyK1TrFHTC03HkTtFhoCHoPBpOcdGBO6hhL
	6xFCJ7pk7F7jS/p121ubv5i2LOtMx34QyvZPmL08s/Wd34EovGQaYMbM55mkWAMI8Fbu/42wyYm
	FXUk8JYoHHjJ5CL63MrTCTTuk7CKvakJOhU4piZpCoS2hjdEQPDx/ePZEO5lD4PMsTe0QQAqfRl
	XuJ6rWjH7usrVEpThY0OCeUSW7mITmVpFJDpY9jFLaKCL/lSopS24xjHbofJTafzDXL4W6aS9Li
	f+fUc0nO9DGDOJLPf7e9f5yY0y4bIlxTMvEmHdjHdFjhZ0VsFpt8XFAcCG3CnFDLLKp41zueFGz
	tAdGexEyDHquGCCIDz4pqSMDelsI98+LfsyLimcEm11r44m1Zy/rE
X-Received: by 2002:ac8:5fca:0:b0:4da:16c:6ce9 with SMTP id d75a77b69052e-4da47353760mr66501041cf.5.1758833412650;
        Thu, 25 Sep 2025 13:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHElzb79CK00zBikzpro/uJvVAH0BcA+vsCJ2LVvui1GvHkA6oHCiaXkKmNCWx9XoRiFc9tyQ==
X-Received: by 2002:ac8:5fca:0:b0:4da:16c:6ce9 with SMTP id d75a77b69052e-4da47353760mr66500691cf.5.1758833412128;
        Thu, 25 Sep 2025 13:50:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3252csm1066701e87.119.2025.09.25.13.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:50:11 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:50:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: max77705: add interrupt-controller
 property
Message-ID: <2v3uonqdew3tq5uddi2jivgmcqsicmzvs4gahvx4ty2dkmgane@a7nvyingc7l6>
References: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
 <20250925-starqltechn-correct_max77705_nodes-v4-3-93b706bdda58@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-starqltechn-correct_max77705_nodes-v4-3-93b706bdda58@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3HADXWbhJQeM
 ZSiGcaOzhh7TZ4kV/nFPEUPYjbRGY3SdJR+2cE8YmmAYapc+1i/u4PQR7S6X3rSs2mhBfx8L9Of
 QzhU0XGw+kQ9yaU0lAw3grKBwAzrNzdhsNbd+lORrd2VZt9flPaqgYU5SRo/ZiPt8ycgc9d317a
 Rsw37amOw41nN2keNQRTrOQyY6g0nnhRm8ntp5FpO+ZHHVpAGSnj1C6AmHf3vjOuXAezAlaPIeS
 SzZMErTa+LRG+Dt+OlqsjOSakkdrHx6EUm7rm4nxzBIoPUKfEXgV4O3UmWGfIE7hR48vlfI+BkJ
 Q5CRU75rnfYqD4OLKNZdPJH6EsOuBjTSUYvj9FyH1dooD3weHZzIpd0gQftAL8Nd3HqvmOkbLrE
 mf7OmgnYmpE+B3pR5JeQts+jf74zuQ==
X-Proofpoint-GUID: DGUWHikReBPQKQoetqGmqqJS-1kk-Nz5
X-Proofpoint-ORIG-GUID: DGUWHikReBPQKQoetqGmqqJS-1kk-Nz5
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5ab06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=8NCsgvPOa7tqS022DyoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 10:38:39PM +0300, Dzmitry Sankouski wrote:
> Add interrupt-controller property, because max77705 has dedicated interrupt
> source register to determine which sub device triggered an interrupt.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v4:
> - fix commit message: node -> property
> - fix commit message: minor reword and punctuation
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
> +
> +  '#interrupt-cells':
> +    const: 1
> +
>    haptic:
>      type: object
>      additionalProperties: false
> @@ -120,8 +132,10 @@ examples:
>              reg = <0x66>;
>              interrupt-parent = <&pm8998_gpios>;
>              interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
>              pinctrl-0 = <&chg_int_default>;
>              pinctrl-names = "default";
> +            #interrupt-cells = <1>;

The same: please group them together.

>  
>              leds {
>                  compatible = "maxim,max77705-rgb";
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

