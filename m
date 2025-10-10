Return-Path: <linux-arm-msm+bounces-76810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9FBCE3FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 20:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7322F402CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 18:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C12FDC5A;
	Fri, 10 Oct 2025 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRLRSjuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6E2FDC2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120954; cv=none; b=oQzkWatJiNGY29WyeImFs+WfmZNdQmOdTKVdpbdq+GxHCyzdaQF5z6+7J0JGCWL61Lvcc0o+aPavf+qPRRnUiLVs3SUzqi09XkHJbG/UVo1DxiXPgjqRvKRyIelinZkNpBZYtJempd7bxVkAjsuNNnyfVfLiWkvgUFaluyRxAwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120954; c=relaxed/simple;
	bh=DDGFgNcpRXXs5drDknCOk7ZT+jZa1tJMMOq5dszvroo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYaYdgnAVW1WS2IZpdPY76dSuvZFn1UVUwfZ3QgCPGBq2gareBtLuwQhROCkAyjKVn1WAkymKDJB9FON3A599J9/gt+I2n5RHnYBl45NQAgZq9NG/BWjJ+EkUTa+6SR7yjAsPszWwrfoMWsDKVX/b89+3O3Ve3C6gtlQ2JneaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRLRSjuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AEx40o002873
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dMas5ueTnfbR6ogwJDvGtBET5Zhd3Y1zcYOGGYAo7eA=; b=WRLRSjuwy/30kckx
	lUlmPjjISE+Oc+T53aXKK8yjijNhLGKAdhrajBwPqIcZrrPhzM7aMXm5F4p6DdDc
	UDl29/ajikFx0MESr89fC1/HeWYCv6fi7RSKTI1kUuag4TVql0CwY7D3X3dPjuP4
	WYAYUitFYyFVHg3Ru4uEiSwlDHYXogiyyohbO/eQdJYWFaueDnAkF2NiRpcV0QZf
	qke9TQsrjZOm9dguouFN5ZE63ATbNl+HH0yYBepSwzKuES+rDWsucSlVUEp6xsoz
	/x6VJeRizTjasHjaOK7fHHF/G1j9xbCC+IKAW7LqT6qPrFsS8dWYUSyLzEg0Ixwu
	lVv9yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsuvb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:28:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo111874185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760120937; x=1760725737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMas5ueTnfbR6ogwJDvGtBET5Zhd3Y1zcYOGGYAo7eA=;
        b=C1nPI37JBiwaowUksk1NaCA3IviymH0JYWnru3zkTzTDjwuajXv1WM5TAxT6xY7hpQ
         LcAnCcaQrjDI0HFUwyKExzgfmlU9SX7M9ShCk759MgLHXTEGr8Nhe9b+cxZQ6of5gGhy
         yeDttmtlkn3l/Wu5q9juuRtn2HndSFmBbFFVcyTmYL2cfKfIclFg/dNFxQqpOmKH1RFG
         ucSFvm4h4BAadTKJ3krjkXQd2Kp+VCclqmPKRbt1J4SUVXAyoGuwyFBfcvhaVqmrKH3B
         DdV7Hk5/cqgC8jzDe18+CzZwGsoVYdmmX+EBKG86Bi1dF0KG6yBlR2pQCJCAlszp1eIs
         YgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvrKRFdRb7os5H0FntEnuYvGNsslSw1FF9mqz9TDBis9gW2ncvX+U2kZ5EJJQsYZf4sZjtJsjNAex3PJOD@vger.kernel.org
X-Gm-Message-State: AOJu0YytLYwOO5DvZSfDAH/oBxbsgEsnYPtqqk763aFxjBYX/LyGJl2I
	DaVcrv0eG4bgwpiCMDSmlPoR6nzRC+4vovS8Ug53HBCkvxbGvoe6KmUwfB6WmB+uH+RtToAhyQF
	F6MBCQWVtLliQLXYbKgSLQb5r/hyQyVtqYrer+n991toBJ27mmO43S/Aj1yh9Dm1DVori
X-Gm-Gg: ASbGncvYkICz+12oQyPf8VFpfAbhjx5N9+hAAzi+5yBt+6VF58mUFe9m5OT3SIsS37r
	ld9Z+TFrL4ty+j9GDtCLIki70Kdbq8iWh3vzbciXutPM/4BDUcfccWtPswrHEMqimyPCCMXSlpy
	GLr2mQwcadzDPzQ27yef8mYwEzlmpU9imZC+mGbuQl/qaGayQp1M5OaXeJVfSk6wqh/Wg7t74XY
	kQg0acR0XGit93nyJxwWL7Dq95UND3mWx8nxUqklX38qGAmb4FVOIwp40DTsq+W60OSRacJ9Wts
	u8XHqY7vCFOjG6PLKK3CPQpV72WpzwT9wsou24bi2fmNG3sYhrcV3+tsaG13DLBKoOXdsq3WE4E
	M9av7cG1zdOh0mMggLkOQvA==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1201123485a.8.1760120937382;
        Fri, 10 Oct 2025 11:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4ijfK86so2oQgbaGVcntvQ4Ssr8eaS2Emg+YzBaOfN0x1ZloTX9mbEdoCPNs8davYPPQ1A==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1201119785a.8.1760120936880;
        Fri, 10 Oct 2025 11:28:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm2911251a12.30.2025.10.10.11.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:28:56 -0700 (PDT)
Message-ID: <896b58cd-9a13-4b7e-bf62-e062728d3e53@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: PCI: qcom: Enforce check for PHY, PERST#
 and WAKE# properties
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
 <20251010-pci-binding-v1-2-947c004b5699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-pci-binding-v1-2-947c004b5699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PzSxEU2st_VQqjkVOftfR2ev5_pOhNNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX3YK+eFZJts+6
 KL88+d1WKU7uK0PY8oDAJr3ESE36/vzG9fHqTcxPS3DqGdktxiUpciyxDh0kSDQGZRDmBAXIPC1
 83tto2v9YJbdx2tJdS0Fehwc1Co3L3fxJ62Kuy8+8H/mC/sTR9FpUSDVVxhUuJUbOej7ikt2m99
 NbfuGRSQCTqiWKTDlc6CcZ8alUHyNBj2IfG5vw1ukj58irag5vKndptD67oszT+X+xbB91jazIR
 WE2mqIcgaWFl1AgONELlQIrfp4Rh2w9AVWXBzZjQqVlFoY+O5W4Qqea0p5tSUBgpf9YLc5kSnsN
 iDy0LnBYWG9RnS8nDH9jphm+8WTrV1QDwLt7MjiQjXEaG2C4Qa5OYCnEtxjz8w2d7hohymUmw98
 js0axs7I33Il5sxlZWC+Hvp4edzz+Q==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e9506a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pqiSj10MyONZ7g7U9k0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PzSxEU2st_VQqjkVOftfR2ev5_pOhNNv
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
> Currently, the binding supports specifying the PHY, PERST#, WAKE#
> properties in two ways:
> 
> 1. Controller node (deprecated)
> 	- phys
> 	- perst-gpios
> 	- wake-gpios
> 
> 2. Root Port node
> 	- phys
> 	- reset-gpios
> 	- wake-gpios
> 
> But there is no check to make sure that the both variants are not mixed.
> For instance, if the Controller node specifies 'phys', 'reset-gpios',
> 'wake-gpios' or if the Root Port node specifies 'phys', 'perst-gpios',
> 'wake-gpios', then the driver will fail as reported. Hence, enforce the
> check in the binding to catch these issues.
> 
> It is also possible that DTs could have 'phys' property in Controller node
> and 'reset-gpios/wake-gpios' properties in the Root Port node. It will also
> be a problem, but it is not possible to catch these cross-node issues in
> the binding.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-pci/8f2e0631-6c59-4298-b36e-060708970ced@oss.qualcomm.com
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

I would also like to add

Reported-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Since he originally made me aware of this issue

Konrad

