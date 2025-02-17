Return-Path: <linux-arm-msm+bounces-48138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93193A37ABA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5347416CCCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 05:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5B9154C00;
	Mon, 17 Feb 2025 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdeJaGXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F2081720
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739768831; cv=none; b=C8vMREduas2/KBRliYYiMz4padKq7kAAtMXyzKXsC9z9J4x8LrsH3TfpHLth/4AEUi3vsUHz3MXsoFeoGQ3OTRilUrM+EMchD+J6TctOUn4WTDK47RQLyL6hxyJrHUj+5JAI9TSsvWjiw3J1mja/k8pybUxZdSvC8BYVj9wo3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739768831; c=relaxed/simple;
	bh=CSy5ckSyA5JAv4fYcoW3lC/yeXennFXdTEMrJ8s/154=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBOQo3N0GZu1YPkZhoebyE7bOQTnVr2/WnBStCH19TPWqVfMp8uHIYjxEEWKA30T4oC2mPCOg0UWkjDqOay7lKAPO1JPw2TQAASEaiKK25vd7Fxs1yz6GF/hucdhmSKJBPOff6heaArR/j1ptL9o5RKrO/eRKt8PsYQL8JMXiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdeJaGXX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H05gwm026301
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0R/KOAq/S4y6EYh/T627pPSHsXVDL1m4GNT7r04SCVY=; b=LdeJaGXXrkXDHNvu
	YNGWnAWNVikabqCvG5xGWV/L1iYLbR1tfJe4MGg8T3o+9e/gHoNYl/nU0nveK2og
	N66o0UxBWUBKdGwCt3oQlvLh82USpixyqqP1GJ4hA/5FEPY7LNWIXgFLPyBO9lKJ
	JkOMnIxv7mI48l+zHJAUbtLoH35euxSriuFS+AVc5IWYEOvonwynxPGiHgcKdl3/
	rxsmw5cBUW8aPz7BnmH38Nsn2UyBB2aQp0KKHADhObBFipWwCM72DQtEa5CHDi4Q
	JsEbz27IEzZ7W+ZbM/u4hmnMSrI2TglCXt2NnoOh6oL4cTrKPmRXI+Xwt48t6PAN
	iWHzTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7u8gnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:07:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc0bc05bb5so8200737a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 21:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739768828; x=1740373628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0R/KOAq/S4y6EYh/T627pPSHsXVDL1m4GNT7r04SCVY=;
        b=jioyRQixvK/FKh/tP67HysHiXnXNZe7Udcm8c8Huip0DKErf0NJ2D4bOxF5YrsvaTR
         t0B8wfjSNsNadBjCGq936TDiFDTdYR3LXrF7A4UxZLP0wYC4JhF69YGfWR4Oeo1rK3G7
         y25UiI9kIZfLAlm4lQLGGAtC8UO+RkSpDOIWK4QfWMP97Vy4jcVFdr+FmR3k/pTgPon/
         KJSgIzDXd+sMx1m40/HjvHpEW0PIOnFyGPBeMMQsnc5io0aoBSRduaCfFlZ9cTXhTDma
         mdQVzGv2Yi3Nf4sSj4m54/ZDz/0v1RcC53YfdhWYubjIE5Et0R7PiXZMv/OU7g9DwY7w
         bfDA==
X-Forwarded-Encrypted: i=1; AJvYcCWv0Op0jRr46YiHqIqnsMIZbFDEIu77ZD9WA5IrFtI+5NSeAeQIU8RYzYpa+5/gdcqjBRlBLiroMaU3f03R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzpqtr6ZXG4OGbAFqQC4iU02FM8DKqwbrdFi+xO65a5LZU8jdD
	xVhRHrQLkdA7ZLJqyDfSvgoV1rEE9k+2r4aGtNI0Lj6yV/Q/uDvg06eOdN7UbBI2crwGbVlVon2
	r3Z2hCtm6Dqtom6hGHy3iZGY7MoUExcUO/hOeU3Q0REUPJcajBrVTDlvB1dbwm76rEXTlZ6Kd
X-Gm-Gg: ASbGncvZUV/KJxKMJqKovfqm3qAXfYz5KA+82piaTxw6dPZZRPjdAPt8wrYGboQ9zpu
	SWNcqrh4bq1HOXdxEOy3zBjaHabsm1ZdmpjU/zPJrVHTIEnPb2YhHp6SfZDiywQMC1IE/TZdiFb
	GhVfUu60XublwEyVRPxUuhJ6IKEhDFQ+zRHCAqZitroQM9ZKgjWGSORysQ9LTcG8gSz5UndK8Z0
	AEpS2b+DYrdsBxHWLGMKI+WDYqD40ItJ43tyw+dtNMoiXCcxoHR6BzdN3HvFdxJRX5Um3N8oP3d
	W4w6rc9r/orY1OgdRCRLX9wm8ivHBw2IVw==
X-Received: by 2002:a17:90b:1a87:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-2fc40f10271mr11703751a91.8.1739768828237;
        Sun, 16 Feb 2025 21:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwSz7haFl7RirhCQxbLPQqkYiRlM2NrbpC48FXOn9NMtN3O0PPg+0BR+p2kcOs+NWEa3zreA==
X-Received: by 2002:a17:90b:1a87:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-2fc40f10271mr11703710a91.8.1739768827818;
        Sun, 16 Feb 2025 21:07:07 -0800 (PST)
Received: from [10.92.199.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d468sm62169425ad.167.2025.02.16.21.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 21:07:07 -0800 (PST)
Message-ID: <e278784b-b0e7-9d4d-d7c3-accf8f335de1@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 10:37:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/4] PCI: qcom: Enable ECAM feature
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250210225431.GA21989@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250210225431.GA21989@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qZxFZjPeizcHxqz7JnydbhGnYwgPECu0
X-Proofpoint-ORIG-GUID: qZxFZjPeizcHxqz7JnydbhGnYwgPECu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=968 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170041



On 2/11/2025 4:24 AM, Bjorn Helgaas wrote:
> On Fri, Feb 07, 2025 at 04:58:59AM +0530, Krishna Chaitanya Chundru wrote:
>> The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
>> gives us the offset from which ELBI starts. so use this offset and cfg
>> win to map these regions instead of doing the ioremap again.
> 
>> +	/* Set the ECAM base */
>> +	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
>> +	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
>> +
>> +	/*
>> +	 * The only device on root bus is the Root Port. Any access other than that
>> +	 * should not go out of the link and should return all F's. Since the iATU
>> +	 * is configured for the buses which starts after root bus, block the transactions
>> +	 * starting from function 1 of the root bus to the end of the root bus (i.e from
>> +	 * dbi_base + 4kb to dbi_base + 1MB) from going outside the link.
> 
> 99% of this file fits in 80 columns.  Wrap comments to do the same.
> 
> The text doesn't quite make sense because accesses to devices on the
> root bus *never* involve a link.  Only Root Ports have links and the
> links all lead to buses other than the root bus.
Hi Bjorn,

As part of enumeration PCIe sw will look read the vendor id's and device
id's under PCIe bus0 to see if there is any multi root ports etc..like
bus0 device1, bus0 device2.

In the first 1MB only first 4kb is used as config space for root port,
remaining memory acts as PCIe memory i.e if we access this memory the
transactions will go outside the link which can trigger some unknown
error.

if there is read request for vendor id for bus0 device2 PCIe sw will
try to access after 4kb region which can cause unknown errors.
So we need to block these transaction from going through PCIe link.

I will update the comment description in the next patch.

- Krishna Chaitanya.

