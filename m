Return-Path: <linux-arm-msm+bounces-79970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE91C276D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 04:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF51C1A25BDD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 03:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0148F25E44E;
	Sat,  1 Nov 2025 03:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boKYvFta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9J11lE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F91713A265
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 03:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761968297; cv=none; b=cFTlEXSGzq6iz7vu8fZZU895iHhfxK+rLmfy3Dm7qOqqSROY2wMoT2+M91NQ/LHfiGCcydonXZqVOV6n/ttRbeHNxLfqrOQJUTkltul8p+WwWSgCit+x1q3bV5UMYwSDXCtdvgmEQfWB8y0X2CF5mh2onO3D2+dZei4/r2hjMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761968297; c=relaxed/simple;
	bh=QOV4s441pUMcnd5W23H/g9SGPLto9keaiax99h+lJMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2T3Xctkk0aaWSTsD45vRL7Uug+PRvQ8oa2zJzlHRvurfAEZTCq3GlMlJdwBormLaMOd80JxC3tXNIvJJDw+CUQ9dK3jyZMReKpwjzVNH/8mwYFuZgQk/mK/NGEFpD17oN19K+1239UwnyyjRkwBQOfGSi5IH/9l4flNdwG9xSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boKYvFta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9J11lE0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VDFwMK1826599
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 03:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+MSSJNAnzhdO1DSldaGMP+f7736jkHHfxLd+CmKemI=; b=boKYvFta7QfNPlSX
	a8XeodXvIm/ciqgQ6avwi0jcO6Y12EQAPWIG105GUhI6dXv5tlXeWeOopsmVYb36
	aUcdL49VKGbMMCD3YuiYixcNws712f0CNJpB8fz44w2khLY0XzUakC5RbeU0FUQW
	6jPI9PCRzZQ05q4JtOD7RMxUBJ2W2EaH8Y+APaEWUcpL1sxQFU+csg5rGjS4Bg86
	rP3g/5d9X88J+v56NtOhWx0JyJA8Wyj48Avw2Yodxkjcz9AaT9FWqczj/NtO8tWX
	LFqAf2UOl7Ad8AsYpLNy/A7FDJt0pOvg+L5lKNk7bu437bH1wig3PoJPH8DKkVSi
	s69Wuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11u70p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 03:38:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295395cedafso14932445ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761968294; x=1762573094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+MSSJNAnzhdO1DSldaGMP+f7736jkHHfxLd+CmKemI=;
        b=C9J11lE0jNeHoxoHsbyzm7xrJOqBJqIewKy9y/VpkeF6BR+9xpPLD/YfXeifnURADH
         b7j9cICvXLH71w077xHn+wEMBBJ1XgzGdg6gWrIUlZs+ydAyL++Fm8DwJSZvzF/CZPJl
         umcbOtvLKYefBqBQKOaKFhUwGGCbMg25zmbCPDEKTk2Qrr6ab9GFSF1GF19qsLXc1c1m
         Do4+UrP3xMorA101P2GDWc0fMZ43BlKlnMdquohv21typ9GO+mVxnwnB0gm4qwsUvDLI
         EW+g91xwroj8Zp7IUoK5gFZ9bCF2vD9uvC887ZwZ4kARoXd9oHbFM1GMyN0akYaS6MRi
         BR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761968294; x=1762573094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+MSSJNAnzhdO1DSldaGMP+f7736jkHHfxLd+CmKemI=;
        b=Rm+qVO0RRomTh8KMXqZZ7kgwHRRzX3cQRlr9p0qlD5Lzd+IPrv2+rCe8g296JSc96v
         tXKTapsOzby783I3bGb5O0d1JAbVVDkVXHAo6P4dfIqTKRLLvWDfxRLedzaUCN4PBPHf
         eDjVThqvvroL658EMAM3R/d0tsHMPhBVk1RMhX9lXPvz+NBMf5I+/ZV5Ho+28SBm51qW
         Nn9TEsDx6bZ4uW97Bsuy0Yc/hspd4jH6LY0/vzxQf6VqQA2rWJJgyu8qeovrkIkWHv1g
         zaSTDMI7gp5EV2o31JXI3W+Fss/OR2eo8L001mdz4Jtjg4P76ZHVOgcYhV8+p9E45P9v
         cSAA==
X-Forwarded-Encrypted: i=1; AJvYcCWHPZhhiutDuWoo0LHrarOYCvKSOBeG7UmiN1iC6n+KPAgrENSsSN6sUAzzVeHzhgeH5OQom6BDZ17rZw44@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8eKOom2iZTu3A+DkbvplmuPS0Q+DD1esCXerd2cHZmGUHk0lp
	goSaYzYr96bKWwoF6Zmjsgrrb+fqf4edeCtPqDe92CN3wr3zTAlInh449wMkx5aAFDkJ7xL33FY
	datE/clm8RnO0QXmMkrnQ3amWrECxotmQF/0gd6go1yKO0iTtdwu0i6EZ7koDDhXZisU+
X-Gm-Gg: ASbGncvnY2QACiF9eXIXo+GQh8GRKhV7fQneR5i0qd1QLRXcSuXoqNoClBEymQMWJnn
	5ibxlQHsOkcdwD047tRHWhGHqlJi9wPlRLB5yGMctzkKuKsMlGPTYc0IZose3AOwpOuniMJqLqF
	CGiKIRCEPsPekp6YheI91L02Ji9iluz6HI+UdlRxqpIBeRKbhbGjMM7wvZ++X91zu29fOWKFK0Y
	WGGhA9FmjAmF/nkUNpbNACHOw6GrD3E/NAP0hxafHY0vjWXWAlHCvXP4+lN931fGoIwf35rC+gH
	EZe7J2kCb5TImeRRv8ffPO5km4Q/DsEnb72Bj41w4JZE6mYFnf7v0PVH9WhRwue2V+Wq8Q7SRv6
	x5n7lVmO+oZhDJQu/v9dooaZvQ+RcJ9Ijmg==
X-Received: by 2002:a17:902:e803:b0:295:5da6:600c with SMTP id d9443c01a7336-2955da66315mr875345ad.2.1761968293827;
        Fri, 31 Oct 2025 20:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhZKxQBBnG78bpCeGKL4Lw7oZMFbVF3Qy60/ZWNH7pX/qvw+SoCu2WjYCu2EsGiLa3sETv3Q==
X-Received: by 2002:a17:902:e803:b0:295:5da6:600c with SMTP id d9443c01a7336-2955da66315mr874975ad.2.1761968293290;
        Fri, 31 Oct 2025 20:38:13 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.227.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2955615d720sm8247975ad.65.2025.10.31.20.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 20:38:12 -0700 (PDT)
Message-ID: <bc7732aa-6958-4028-a3b3-a0c2ba3b0252@oss.qualcomm.com>
Date: Sat, 1 Nov 2025 09:08:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251031221238.GA1711866@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251031221238.GA1711866@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M7j8XlA4aCm2t6v7E_Pj9DMrP00sw-Pj
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=690580a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ISmZZG41GQzdpg15mxjwIw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BNVTMueYxggUNz7gLWUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: M7j8XlA4aCm2t6v7E_Pj9DMrP00sw-Pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyNyBTYWx0ZWRfX/W7WTsh6GGmK
 2ss4VzzGQMkij1m4PIobMcCc685whO7N+wLTtvY6NkgOe2pCJMa33xVe/kkd1el6uGefBBjZbrl
 /LSXLO8vXjw3AvfZzJhc9PLLSuCyqrXVaH62wq/aDOz5ycZ/t1XfkZerX1Dfy/WNbOilhw227O8
 Lxeq+jMpAw1CgzszvKvk34UqhlhN1C4RGc3qZpUWLAMoP+LtRCeSLmulCtzn237v6VEqdNr5LU7
 BDVMu1SCEikzBGMGncDbkaF7uFpj6m29YXVujCljKykDwHXcYMB5tsXA7/E5yY5bu7xH+MEIeG2
 NIfo2LpE4xcoXSssPFn86QMbla7e3dWLyMuS9Q1Zg8zaZY8rTCZeRbOJb0JXYN1xGzIKiYL1kom
 TpNTIdf+kf5vBhorZcGscz5ZVJZeZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010027


On 11/1/2025 3:42 AM, Bjorn Helgaas wrote:
> On Fri, Oct 31, 2025 at 05:00:13PM -0500, Bjorn Helgaas wrote:
>> On Fri, Oct 31, 2025 at 04:41:58PM +0530, Krishna Chaitanya Chundru wrote:
>>> Add a device tree binding for the Toshiba TC9563 PCIe switch, which
>>> provides an Ethernet MAC integrated to the 3rd downstream port and
>>> two downstream PCIe ports.
>>> +                pcie@1,0 {
>>> +                    compatible = "pciclass,0604";
>>> +                    reg = <0x20800 0x0 0x0 0x0 0x0>;
>>> +                    #address-cells = <3>;
>>> +                    #size-cells = <2>;
>>> +                    device_type = "pci";
>>> +                    ranges;
>>> +                    bus-range = <0x03 0xff>;
>>> +
>>> +                    toshiba,no-dfe-support;
>> IIUC, there are two downstream ports available for external devices,
>> and pcie@1,0 is one of them.
>>
>>    1) Putting "toshiba,no-dfe-support" in the pcie@1,0 stanza suggests
>>    that it only applies to that port.
>>
>>    But from tc9563_pwrctrl_disable_dfe() in "[PATCH v8 6/7] PCI:
>>    pwrctrl: Add power control driver for tc9563", it looks like it's
>>    applied to the upstream port and both downstream ports.  So I guess
>>    my question is putting "toshiba,no-dfe-support" in just one
>>    downstream port is the right place for it.
> Oh, I see, never mind.  You keep track of ->disable_dfe on a per-port
> basis, so each port has the *possibility* of using it, and you skip
> programming it if the port doesn't have it.
>
> I would assume the two downstream ports for external devices would be
> identical, so I do still wonder why you would specify this for only
> one of them.

Hi Bjorn,

As this is just an example, we just added here. In actually use case we 
are free
to add it for any port.

For remaining comments, you are right I didn't notice I am still using 
older one's
I will fix in next series.

- Krishna Chaitanya.

>>    2) I see a lookup of "qcom,no-dfe-support" in [PATCH v8 6/7] PCI:
>>    pwrctrl: Add power control driver for tc9563; is that supposed to
>>    match this "toshiba,no-dfe-support"?
>>
>>> +                };
>>> +
>>> +                pcie@2,0 {
>>> +                    compatible = "pciclass,0604";
>>> +                    reg = <0x21000 0x0 0x0 0x0 0x0>;
>>> +                    #address-cells = <3>;
>>> +                    #size-cells = <2>;
>>> +                    device_type = "pci";
>>> +                    ranges;
>>> +                    bus-range = <0x04 0xff>;
>>> +                };
>>> +
>>> +                pcie@3,0 {
>>> +                    compatible = "pciclass,0604";
>>> +                    reg = <0x21800 0x0 0x0 0x0 0x0>;
>>> +                    #address-cells = <3>;
>>> +                    #size-cells = <2>;
>>> +                    device_type = "pci";
>>> +                    ranges;
>>> +                    bus-range = <0x05 0xff>;
>>> +
>>> +                    toshiba,tx-amplitude-microvolt = <10>;
> Same question here about whether "toshiba,tx-amplitude-microvolt" is
> supposed to match the "qcom,tx-amplitude-microvolt" in the driver.
>
>>> +                    ethernet@0,0 {
>>> +                        reg = <0x50000 0x0 0x0 0x0 0x0>;
>>> +                    };
>>> +
>>> +                    ethernet@0,1 {
>>> +                        reg = <0x50100 0x0 0x0 0x0 0x0>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>>
>>> -- 
>>> 2.34.1
>>>

