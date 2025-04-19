Return-Path: <linux-arm-msm+bounces-54781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A344A94165
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65472460709
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 03:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2E7082A;
	Sat, 19 Apr 2025 03:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+rqrFpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99BF7DA9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033182; cv=none; b=ndlwYbZgTeDEOtazc+DgVfs5P927JTZYihUlvIY5ZJUhXmimYE0vjf4bwdWsK0bq4ib0gKjxakIkiIJPx6I1MUP8zLfpMjuYPSMUHJDkhyXN7Gu1RdmD/vnqtfP9Zc5jqgdZBQpFF453ITBNcGvf/9/RF7Xccpsxw6ZaMppcIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033182; c=relaxed/simple;
	bh=fIItPYHF5KIGOLqM+WiOTfZ4A+JkZHOaJ/9jaBb3maw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJR5jqJtUP8sPIG7rEsVeD/kZoD2huQItUhRE8TWr3ROCB/tGJPsmCjFVs7m9AhNuzFgQ8H+3iNxBD/5lJ7xOKO8ONn4mUFRsqiJEZ+5oxHCXYT1KlllmRaIz6WADCC5MyqfkzAHF3L8XU7Fajr8EOL+g39CFo/Ku+Yj1D5cxAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+rqrFpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J1gmcm024139
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0nG4UMXF8lixn+84edFbB0EZI2yCAqmDsG73B3F/eE=; b=P+rqrFpzYSghsLpN
	iSMrbS5La4yX730SjIPvTku9kV28tpmO4QXA/eoXU7fcr/m9iLGZgpT5Vfvxl16o
	9Zq40vPt5ZNTefRQibqInApdnk8SXaZJEmuawzcHI6TGdpaC6E1eDfMreS19tNf6
	AIiQb//S94y8XW6qYVbsf+jIdRvhDcbk6nvATU9DLd1GiToXubBSC3jidTzkjOxK
	bU+lDIEo8PTRkz4/zQjbBZUmOFXBOEMCq1swQojEJdahCxzRmeorHHs1sPmXUh+G
	4x74Lo/sNITOsI+ZqwaKAm3lH9yOERrpyBTHBK0EpskDknpCgYxNBh/DIZeqDr+u
	OYwm1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9kbgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:26:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-229668c8659so19894315ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 20:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745033178; x=1745637978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0nG4UMXF8lixn+84edFbB0EZI2yCAqmDsG73B3F/eE=;
        b=WOPW/pgxC5LTUu5R6g0xWKVGWDF6Ue+IlH9I7EHbUTmgkW9U9ITGVk06tgZ+w5uXT9
         RoU6eKdZjLtM56pSxB1KzkO2M5vSfEi/kBHp7KSknDJmPOQsnOt4bkY1GicDo0W5VRs8
         wB1VDMK8aNlluKOhTGatNLtaKEBp/FeKyFxp2tamPMMPavfNeI6c1EpYVSoNb6HC0374
         3VaZqdfq6CLiyHsl6X/GFJ8xvMz93MaGh1rF4o6+v2tbmYejMx1B2PBS30bf8GosS0HI
         NxzJA9r8uHFlPF4WYG8yG4PYMu9kZ0N/9yZ0iyXRKdB21VyKRwbooJ0LVcSBZRX3yN+j
         Zatg==
X-Forwarded-Encrypted: i=1; AJvYcCUUUnpj8Lrn1Al5r+h1qWjJTnJX2uAQvJyh2mN5EXUCBknrZra2nmCi0lisVIflGB1+3S/B9uIiHangHI/U@vger.kernel.org
X-Gm-Message-State: AOJu0YzZPF9WO5BULIK9ZPUsyNOpgjbDHP7bvcLSb8jl9kWOsII1M2Sf
	JoG37APwVXKsHHd/1U1fnxqv00U1pYPKrjbEkzLp6AQIbo+gUV4ouAUpo/V5GENNf92xYpPCdcR
	MJRDq89Ab4jmP1yWAEAnosBCVgWs1eQY3hXhtg+ygR6FPTsz9HT5tNcGjwzQmglv0
X-Gm-Gg: ASbGncvvPoUsI438GCx4BebgezL7QgJGbVcH2PdQocIOiywlbVAWID3MRgaHPUsgZH2
	cMUkP/ccQOQ65ouZWFiUIOjI6Z/opApsHZzDYNIPkkfB+qAxCwA1AWOMNU6faafOAFyO+PgOZVO
	VJbBjTVFUDAQih7Pdl3udhP0Ez1tpMnylpnsHvxO8Ya8eoJodK8kA1KDuWKaYwEPH8QAd0qj7Do
	p773kfn0od5w8EthRzLFeThPiRUhRcW90HKm81yUTwQZUvIheSEF9rlpFi/KExQMrHLeZyiijIc
	Y3SRDPxp1sXQ8xbmkPNzb5oXDfldZSDJ/qY9ojE/VfE=
X-Received: by 2002:a17:902:e5cc:b0:223:3630:cd32 with SMTP id d9443c01a7336-22c5365eaefmr73291065ad.53.1745033177983;
        Fri, 18 Apr 2025 20:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGFQuCH0Hqv/o7D1MGakoSD3kUocpcRzFOi91EMpflA/r7ry2B6ULUOaFQPjIvPY054X+fQQ==
X-Received: by 2002:a17:902:e5cc:b0:223:3630:cd32 with SMTP id d9443c01a7336-22c5365eaefmr73290615ad.53.1745033177502;
        Fri, 18 Apr 2025 20:26:17 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.228.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb5354sm24231455ad.154.2025.04.18.20.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 20:26:17 -0700 (PDT)
Message-ID: <91549089-f66b-8e2c-9708-d880f3bf1a0c@oss.qualcomm.com>
Date: Sat, 19 Apr 2025 08:56:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 0/9] PCI: Enable Power and configure the TC9563 PCIe
 switch
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250418200056.GA82278@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250418200056.GA82278@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3AIVS5wpG4Y2jGSifIRCfpgXSaKn3grn
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=680317db cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=M6NtEvFuFW5htA+UmNA0rQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MuaoRvlZ_d6aMCo3pHsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 3AIVS5wpG4Y2jGSifIRCfpgXSaKn3grn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190025



On 4/19/2025 1:30 AM, Bjorn Helgaas wrote:
> On Sat, Apr 12, 2025 at 07:19:49AM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is the PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port.
> 
> I guess this topology is for one specific platform that includes the
> TC9563?  Since it's a PCIe switch, I assume it could also be used in
> other platforms with other topologies?
> 
This topology is for the switch not for per platform, the switch exposes
two DSP's for external device and one DSP has always integrated MAC.
>> TC9563 switch power is controlled by the GPIO's. After powering on
>> the switch will immediately participate in the link training. if the
>> host is also ready by that time PCIe link will established.
>>
>> The TC9563 needs to configured certain parameters like de-emphasis,
>> disable unused port etc before link is established.
>>
>> As the controller starts link training before the probe of pwrctl driver,
>> the PCIe link may come up as soon as we power on the switch. Due to this
>> configuring the switch itself through i2c will not have any effect as
>> this configuration needs to done before link training. To avoid this
>> introduce two functions in pci_ops to start_link() & stop_link() which
>> will disable the link training if the PCIe link is not up yet.
>>
>> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> 
> How so?
> https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> adds a schema "n-fts" property, but this series doesn't mention
> "n-fts".  This series *does* add this:
> 
>    of_property_read_u8_array(node, "nfts", cfg->nfts, 2);
> 
> Is that supposed to be the same thing, or does "nfts" magically match
> "n-fts"?
>
It is miss from my side, thanks for pointing out, I will
fix this in next patch series.

- Krishna Chaitanya.

> Bjorn

