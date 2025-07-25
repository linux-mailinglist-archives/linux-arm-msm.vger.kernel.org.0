Return-Path: <linux-arm-msm+bounces-66659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43AB11A6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC0E7BC3E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5433E254873;
	Fri, 25 Jul 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1l8Qljp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359E251791
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434073; cv=none; b=jva1w4JHqaZuu/n5ADrHiYwsKDYu2xlEgYKuk6KA0xCsDfzwuOhfPVe4lnDGS5wwyK4wyUP0JOhVkvhA80q4oarPkktP8tXlq9lm6q3U/37gmd4B4zgeGxofVoA2K7UNwujDwOt6f0XsUpnPRx9lEDxfwSTemhN2+PkinVvgSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434073; c=relaxed/simple;
	bh=eHBVrcv60amFq3ruB8uTKQNWHu+oGg7Vj8gM9d/IemM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4V4WNgbhhqZNP8slIy9yBYO0racliOESiK+Y6jbncTUcmfigBjzEJ6TF8Uqv1qEVDelHqKQdXWFBuL7xe8YEpfpWHgpRk9hQj+OB9rjddQfDBq1H3f6KraUeefoPWK7hXuki7ut38xJt/29hDiIMs0EVSgLGrSSZ+FmvLeW6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1l8Qljp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8rheB004498
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kCHehafS9SInAWecplAWILdgUxDGSl+sM8DQpqxSmEQ=; b=D1l8QljpjdxzqSsH
	U9U0gukpncxus63HVU5vHZavqRfw1JK6TTg2GPolMbrRWr113UkyufM9Gl0W0SyO
	Zm/GVDk6Wwh7olQSIwJt/cdfD9dW79cxBVT9fiQnVCSJqJiY5oNS/BoyHqAG5LP/
	Wy/buMB1OiV67CNIMcBti7LCIuZ2m+CudByuXFm0el01OLzVPjsyB/2Th2hkcfoi
	ms6I0KqRbXfmMqOLpslTaj/PVjs1sG9mK6uYGzEhq93wozEF419jRHhNjf3JXKP0
	tha14Y0yf9UgWD8Fk3cfSS0wH1LCdcYuTkaldxHgtX+UjG7V0JAyN0z/DLWsdbm1
	rjS7RA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w539f5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:01:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f13ef248so1937888b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753434068; x=1754038868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCHehafS9SInAWecplAWILdgUxDGSl+sM8DQpqxSmEQ=;
        b=vT4z8ZyFTp2rbeumfvuhSWTEqQmkstQW2aDLO9JukZY2krJ6IRW6w7R+xYnbNMIyj4
         jQbT7tDlDAjAtjJuDPK+X7TpTDAgtJR2OzKmWCJwHIkAgexNB/ITlKYKdw+a04IqpPb8
         JsC5EzC73jiyM034wdkxMg7E17/wXnI7x/msLjSHtQFZozKNtySLh7krKa1OesSZ0XlY
         4GHc5vVd47f9hnFJdzxH9QylUw2Ek55ouV429hOan8fnevo0EQexDZ5lNQow/HTstpxb
         qAIHx9O7p2wwSYkShYAmcylOU5h5gas/t28d1rnOY5ZFT6C0OxS8D++VnaKoP+DH0YqO
         UnBQ==
X-Gm-Message-State: AOJu0YxjYLPl8TyQgpHAK4eOzj1+fxJpTzBcWGJManInPGWWkAj/C9fh
	6WBSX/Nmaj/LgXPjE5pBux/KG634h33EEKSFqx+XlQz5TLtrj5rJ0tUOvxfDSW0me29da8flgFx
	Q3L2rkYwkPpDUNaxA7Pu9LqWXEMCMRqi5V/Yg2sgHhg98f0VofCBs+NZ1hEwd8FFskPoZ
X-Gm-Gg: ASbGncuPqUPg26ny078qUb7qObGtqLIiTAE3wXWtZ8PPk+33hSyGczHlad7a0XOemAS
	iq2I58pcZU34lyaaYUyKUWXbIRkTSWQ/lsudzQjwR/utpSbxhNTgZwzLGdtC1psNkynD9Qwmga0
	2Eqt9GIfWl1zc0uKV4EbQJDxt+/kin4enGgb5Iuj5DyqU7j1m/fCd8A+QX2+fjwypWwFUuCRGCt
	2B4sdwJ/aJJeIrjW7F7mDvOOm0ppy4A++vExRtLqn7bZZUn3FbijgwWENZY6dqilEg20cpPFPzZ
	XOlrF/DduynciJJuocmDDfMqK/HTLNisPp69oHbLNqZWMDXovNBQZ6rlvbXXaOOYnH9LMmkSNch
	bHof4j6oGGyaDFSOjhip3Sel5Z3I=
X-Received: by 2002:a05:6a00:3c8e:b0:740:afda:a742 with SMTP id d2e1a72fcca58-763312e3376mr1899659b3a.0.1753434068264;
        Fri, 25 Jul 2025 02:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxSG1ckDqeSKw0txrjXjcpLKjYBali81JfWT/ss5/ZGXRkuSSCKWeakEwYGytl4nEu3b0qcg==
X-Received: by 2002:a05:6a00:3c8e:b0:740:afda:a742 with SMTP id d2e1a72fcca58-763312e3376mr1899618b3a.0.1753434067723;
        Fri, 25 Jul 2025 02:01:07 -0700 (PDT)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761adc70799sm3417240b3a.12.2025.07.25.02.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:01:07 -0700 (PDT)
Message-ID: <cf84a8ef-9f4e-4f13-b41e-9525e21a913b@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 17:01:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-4-91b00c882d11@oss.qualcomm.com>
 <d55f79ed-0bec-4045-8bc6-9005d19f865d@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d55f79ed-0bec-4045-8bc6-9005d19f865d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=688347d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=r3APlHBmsgh8zSLRT1wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3NiBTYWx0ZWRfX3BAu8r2w1KWe
 4WLdJ3xoAxlKl/7oDsKNphIPG3QO+c5RxhMsJbNmhD4o64jyoKJ/vOOrL6sQjwU1ZrJD5Z8MBft
 Iekl4iNFf+Wp6PZ8myCnED8y2khvmv6AMFe/Eqqp/3DDZNHGs7BNYCYRbqJG2LnHvQMZauiehUs
 zNAgjRqBTsScIOUJBDAEli3kvlGVSuWoWrLhlQxzjruuT+bdgtBy7IkyeaWSiRVdRLiGSiz/nH5
 1uPZNo35xvTDqjdGdzsKUhlPP0EkMg1l7uRzflgU6O+pboZ0fqMs1SAvRsC8ozLQnHC/rXdCoIA
 SvLgz6aTPMyV8ExeInwMsrELwYVGRL/eZ0ItlauG/36pLY7IvcrQtSpvqE48G4nyCigcLGGnIDT
 1R9igZR3nyEe2qbqMrpviJmDetseXck7MRJGF19y6Ok9JZoyvXv1oCY/fYo/qqwxbFHwBygv
X-Proofpoint-GUID: SzcVu__MEJ9haWi9ZKts64da6ve6zaV2
X-Proofpoint-ORIG-GUID: SzcVu__MEJ9haWi9ZKts64da6ve6zaV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250076



On 2025-07-25 14:51, Krzysztof Kozlowski wrote:
> On 24/07/2025 10:15, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables and overlays the following peripherals on the carrier
>> board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>>
>> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
>> Mou (added USB DisplayPorts).
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
> 
> This still wasn't tested. Use the automated tools instead of community
> reviewers... Your internal guideline documents how to do it.

Thanks for pointing that out. I’ll update the node name from 
wcn_usb_sw_n_state to wcn-usb-sw-n-state to align with the schema 
pattern and eliminate unevaluated property warnings.

Regarding the regulator properties for wcn7850-pmu, as discussed in the 
previous version, the required supplies are already configured via UEFI. 
Therefore, redefining them in the device tree would be redundant. To 
satisfy schema validation without introducing unnecessary definitions, I 
plan to use a dummy regulator as a placeholder.

Here’s the pseudocode I intend to use:

dummy_reg: regulator-dummy {
     compatible = "regulator-dummy";
};

wcn7850_pmu: wcn7850-pmu@xxxx {
     compatible = "qcom,wcn7850-pmu";
     reg = <0x...>;
     vdd-supply = <&dummy_reg>;
     vddaon-supply = <&dummy_reg>;
     vdddig-supply = <&dummy_reg>;
     vddrfa1p2-supply = <&dummy_reg>;
     vddrfa1p8-supply = <&dummy_reg>;
};
This approach ensures the DTB passes schema checks while keeping the 
implementation clean and consistent with the actual platform setup. Do 
you think this is appropriate?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


