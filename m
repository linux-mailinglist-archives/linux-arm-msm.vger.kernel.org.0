Return-Path: <linux-arm-msm+bounces-76811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA73BCE421
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 20:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C7774ED0BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 18:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CDE30147A;
	Fri, 10 Oct 2025 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D++fSYIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96487301006
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121180; cv=none; b=HENvGhcvcTkx4LvPTw8Wk6aMgC59adg2OjJXjXtO4ckIz9e4X/zaUE5DjWsNS0t8AXsSwM/oYyCxDl9NBN9KJHEuTiWWrDv21IZVHsge3p9C4u/q94nOK3f3T84HmltoDSUVDTN5QwMXFWM/i0kMlrJiwmUutJ036rJW//NXH1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121180; c=relaxed/simple;
	bh=DeSZCmy8qKaf/hrkCJzbO4T+6mmq6tERS/lKYAuCof4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=habyIf9Yu1qJ2nD9IHioTaktkxMrREVsMvg7oYk6tmBxXirCVTMEaKfnkEgPA0tiLPcfpDCPVjMV5vH4yRhtR+VZEbZoobqXTtfLCIbFxjtk+kVbwLZwFg3S7Dg9K/QuN/YE8wjt8xUnJFi1oo5kumAUS8vRyYGvHiAcg3fIUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D++fSYIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFEKXU002297
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYWMxOVH5PMb6N4KYuAsgb0talNOaEWcWrXu6nfbXTQ=; b=D++fSYIqPfAG9o7p
	XNaX3X0R0NDeawmwiQ7621wPBgF+Jw9yb0owM6epKEj6xxqUnqPa3VOmiZLTmTUO
	XAVLul6LM5PGyLR7Yy3eXWGzjvWp9FkOpXb17FqLOE9ODopBEB2oRNYZaX+WPnUy
	74Y81ijrx8Jw2SkloO0iNxFZvwDl4Yy0t/iQEjvk6ryVCXYZEIlSkLDZG/XtUv8f
	+xHm9DJEGGGDL93Nis33yeNcQvyKVCr0j1NNXPXYYmlu5VfbGXL4x6Vfw7ZWD17h
	+eG0hu3tx0MI3XU6M3fxi3kctBRqSpzZeQa8q1njIZpj2FieB8mMGzDmsjiEmy3H
	qmvH1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsuvn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:32:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-873eac0465eso12744206d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760121176; x=1760725976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYWMxOVH5PMb6N4KYuAsgb0talNOaEWcWrXu6nfbXTQ=;
        b=FU7aQgK0rqH/d0kdZ7m4XthuErIPZc+9vdL3M9LrzTGZbENWaVCFASfmNRc8Uyz/a5
         OJPpJcZEafmOS7nx8+ddmGFm60r84CFCaq5t2XVE4Af7up2Y0Ukk2fSqCuEnW3GRp6ZR
         ml31X/hXSDp/orPuVfXYT1vmV8i83h+sotMwOnItTg4B1bVeQ5wDNL/L0+CZVjzjMunV
         hJMp1jv5o84Tq4tkRdJGcDZF2UNesUY+yZFPDbctvTj2mJDxQiayMKGXPpSdIx6riFa+
         RW1laHhEdY8Ya8wpbElQOJU6ZTnyD5qHanht6XfQy5FOUNf5Ds0BV/F2XhfAxtK6ZQxC
         IjKw==
X-Forwarded-Encrypted: i=1; AJvYcCWIivDTjVPzk8zFC+n9iXXC0qZQkVeKQiu8ZDsc2Dn0CT1lZIDC1xhs+bXuPv0LyGzO0meN7SZ+c5y0CA45@vger.kernel.org
X-Gm-Message-State: AOJu0YzDOpICnXGwtasyytjv5X3MRirKBuTho6dh0+wSKw28tc+B1Yo8
	/owuzTFbxyTZXZykF+WYDks+YH4kcvW0FMqP0O6ou6HIm56q6jQQCcMOxTEuQ1KtqUdSxbpYCT6
	NvIiadc2SAOVIPHiy6dJqnrFX04iz0/u9dgQgmjgUQ2DzoyKXA0HnXCtXBnp8vNpLb9b9
X-Gm-Gg: ASbGncuXZpRh6RTnqf0XTCzUwI2ox2Ieo9aeENmIhaS9sCoVgbOiukUq82U7eOY/JtD
	HuYZWO9O7CNHqcR4ib3zcQNXaCRmNzdYXOW4vPQWVrZNE1COAaTDJG714aKpntpdts65X8WDvf8
	ytaVdj6CyGRn0l1t4DtXfW4aY4JJxzPv2pQg8QoInIDvJ+uyva1izLOAMbhiXHZjXf89g3MlHpg
	dqKwW/NmU7HMzC9sq1VoPzvRQxricUBtVFm62W+J2sQlnClEHnci8SfvMJg3IybJUD1/4+hhr3L
	iDsmbsnvvROZmXb9ya0vFeprfw+DZGbBji0JUg5v/SG7BOiDXrP69Je3V8WdGJbCM/HHXwCLlEx
	wc6EtFfoUQ/ep8afN3ob9EQ==
X-Received: by 2002:a05:6214:f25:b0:7c8:8c3b:99fc with SMTP id 6a1803df08f44-87b2ef4ed5dmr112076206d6.4.1760121175642;
        Fri, 10 Oct 2025 11:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhQfGBPvvej/Bb5PYt709FHH1mmSHi9GsC/188HhZgdbWAkPACwLdz6IVQIlQc1SwCKcIL/w==
X-Received: by 2002:a05:6214:f25:b0:7c8:8c3b:99fc with SMTP id 6a1803df08f44-87b2ef4ed5dmr112075716d6.4.1760121175001;
        Fri, 10 Oct 2025 11:32:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f860sm2817329a12.15.2025.10.10.11.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:32:54 -0700 (PDT)
Message-ID: <4532e2e6-51bd-4443-ad51-41fc02065a7d@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:32:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Treat PHY and PERST# as optional for the
 new binding
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251010-pci-binding-v1-0-947c004b5699@oss.qualcomm.com>
 <20251010-pci-binding-v1-3-947c004b5699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-pci-binding-v1-3-947c004b5699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5KMD7Tm7bzd3es_9TIpGBjimDxI84KUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfXxGzgbwSRnGS4
 gdsR72mLX3q0Ku3vOYcYDGR7M6/Z/lWC8oFKxmiZadG6TgSgBMoR/zmyQRcWyjYCXMK1XL0We3a
 P4sJWZ5R3wQrJ7Pn0oZi2J8anrJougs72MsEibuuDSeh+TiHdshewbjJvDH3Vm/JvpPYfhyXzOB
 b6Jr7geFEB0iDEaATm0fROKjeZWHxschuE+E9y6jlZ/XcwPvHmacfwJWG/OpwQsjN10Cq9gfagV
 e7KjKOolbTpJfdN+ICBGq1vcjxRvk16baBdR2qioWd3wGpeISoB2KskWaeGu1NR6NH+dUeXMXRS
 waX4vxN6HQsv47XMmZVbm4gul9Slgfl30+yEQn/D7Ne3HnqzTCnzzpXd1aMdvR1bsUHdQz/2cdQ
 VBoTt9TEYtZHOTclf6QnelAABiXd9A==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e95158 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=f56zXKZffaiFsfKDMp4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 5KMD7Tm7bzd3es_9TIpGBjimDxI84KUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098

On 10/10/25 8:25 PM, Manivannan Sadhasivam wrote:
> Even for the new DT binding where the PHY and PERST# properties are
> specified in the Root Port, both are optional. Hence, treat them as
> optional in the driver too.

I suppose this makes sense if the PHY is transparent to the OS
or otherwise pre-programmed and PERST# is hardwired or otherwise
unnecessary.. both of which I suppose aren't totally impossible..

> 
> If both properties are not specified, then fall back to parsing the legacy
> binding for backwards compatibility.
> 
> Fixes: a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root Port binding")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 805edbbfe7eba496bc99ca82051dee43d240f359..d380981cf3ad78f549de3dc06bd2f626f8f53920 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1720,13 +1720,20 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>  
>  	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
>  				      "reset", GPIOD_OUT_HIGH, "PERST#");
> -	if (IS_ERR(reset))
> +	if (IS_ERR(reset) && PTR_ERR(reset) != -ENOENT)
>  		return PTR_ERR(reset);

Please introduce an _optional variant instead

Konrad

