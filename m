Return-Path: <linux-arm-msm+bounces-74863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037BB9D1B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05BE53A4FA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E502E1C6F;
	Thu, 25 Sep 2025 02:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A260furQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28832E172E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766362; cv=none; b=TtE0PmThSvZNl3PHmxWO9sy56//1LJ5Dv7e0DDLElqZhCEMV4jidU2KglSDIEh/xANK2sFnPpu35lLmAunwNlx/EOxp3W/MPrTP3YqYS8N9jXCv0OB+/nGz7VpPRy3wAZ0X5PVrgWoMj4rNRaB6B0REXVDIJYWseRjvzCXX99lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766362; c=relaxed/simple;
	bh=jN68/zDaDashxkI1jmWopGqajPlvGlaxNHpL2uTBzQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpoTWVDOmf+Hy9jjcGFW9bzNDX49sOv/vaBYaySwgr8UZgW+OoomaiNz2zYWrKKkow+21AQ91k/pcHRgfDaRorJ3v3xdaCnGtlxw/yUGZ7YFynKrt97VhbgQQp5nBV3dek1f54xAWd+eixVF1jX/FqDP4UiOwMAjm6E3Bpqyphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A260furQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oZnY025366
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dvJBurB7j+89LzioRchQekzW/gf61CfAG+LrJTxbWM=; b=A260furQ//RTeU/h
	v8SqIn1rVVavyCKExglW5kYv4mdf1as1Exv4GtJtLtIbIiAUapyT/zdVHcaxXeVo
	dE+5p5Xs+3IuLeXwGD4PQbr+87E1pTczeSnPkADQYMfsS2ECA+YueP7HBuZ+mPW0
	XzL815TgsHheIEagR5MCBZIQ9PqEIzK1zl+N53/WH8cedUpjhr8hvVdYwNFgrRbS
	OUSpJRDjLM93XbsHrM3mQ5AJF9uKHwibuTl+fssKmKe/Jii7jvxRbFYvfLD0fhsl
	5YcDPnyYF221zvpjUYPm5UTFd5SwiHA78jKyxlrwlekeJYJUsv2Otj7MrJKtbENf
	0ofbXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexqbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:12:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so628627a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766359; x=1759371159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dvJBurB7j+89LzioRchQekzW/gf61CfAG+LrJTxbWM=;
        b=kXcSdB7Jq1fWoHKoy4fXO5V8sDY3LLtNsUMCpvBjUiAAvsjJl2H2h4y51f9EvYF/jX
         t+XhLCL0xT5KweYtKPS3vTDp835zjyQE37CaJ2cgf+yAGQ23Tfpjd3+pxu/t/PaRWNzW
         V4llt97PHxa4LtXWAYLC1jgSHW0tECD6aLj3QhHvUfqbOnJApC/aLdinOsrTilffOk21
         /tQaKid7cHb+NcbrMUkAX+g9FJehspj0gfIQSOO2IQtYsmDjvGlYB4jg7We+4Vpd8/CR
         7Rm/iBnFhGjtYWEsK3vDuWRxnqkwLf4e2+GMXjGQm0CtaFSSgn6E7Y9E8GsjBasanghp
         dn4w==
X-Forwarded-Encrypted: i=1; AJvYcCWr1OWupP7dktqmYF39pVZrBpLjXZd+Q+zrpB6t6B+SPnbKy2CS55kYfuL3eMAi0nUtYB485kE+JvTOSmRq@vger.kernel.org
X-Gm-Message-State: AOJu0YzhD/M4lC2ZwYjZ63gE/+zKARyb1x8Yv9mtzcO/wibsgTkakfYr
	KUqQA0mVEOiLoKplSDwPH59XdHgRse0moFK6mEfqGDxHlJczOohZGxfyxoWnlOM6OHdtnUg7any
	QVIRI++3Gyb3nntqmhcbO1g8tv+Qz052WaWAHCFtPSBVWxd87Mi3p5w/UURzHH/DYicCv
X-Gm-Gg: ASbGncvw3lK1QL0HqTIwp2Vnlpz9wznBmSYhXnRlWvKSARHAKhT5RWfUyBIWTiGNWZ8
	tkeGY4+eFdQeW6tkFCsGcbb+VZmB54vQxZ7urIdMUcG3HiEnwUjyqDBJKSxYRXrU5Z2lTFApk/2
	EkPwztcoimXN5xQZToMxuFXtD8sMobbuQDGqrIsam8MV9stVGYnsWOImpNXWcppbnIPISefcdMG
	I+c7LtaakrjyTPn+aEBWS0X7pBJXq50D7JSP+U3a5tcaMyGPo/MUILzkjfrFKqjH+eAjX1e92IK
	zijmuHOtz91Mp7bsSOVGmEh+66StdPz9KtZBz6eZR8O4BfDoSWUilrtRm22HSjTaF57QuVXArpU
	LJOiwaA==
X-Received: by 2002:a17:90a:e7cf:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-3342a233d5emr1613490a91.13.1758766359077;
        Wed, 24 Sep 2025 19:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiFq+Ax3tsuBm535fFypfYZDBvGHuhaPdv6ObItfXPUghRoREWtNMMZHvHofw+cdFQORJn6g==
X-Received: by 2002:a17:90a:e7cf:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-3342a233d5emr1613455a91.13.1758766358594;
        Wed, 24 Sep 2025 19:12:38 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c8f85f48sm252450a12.16.2025.09.24.19.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 19:12:38 -0700 (PDT)
Message-ID: <efa5ed28-674c-6a30-eff3-eadc650ed6ea@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 19:12:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
 <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DIWBS_WrUG_4Kbj3kp4f8wHAHSk2FBM6
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4a518 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mLeorRv-Xii_F4RM4uAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXz+4ctbqU6zru
 rv8cUndS5AeH/OotdVwEjnYRfVbfgjxXet7oZAaTdOvicBiLq3KoTZrhTYEhOB5QTTuHceN20+X
 b5exhPkcixkEIoteNL4FL23U13RkSTWr7RmGwrwFJ6okIseK+0FJb24OMethKIgcjwIFuY2iHZ9
 69do8v8m8vdd1cGwJ6JKEx4ao6/VEiZWMZ0AhJIm13Tv7vs/eS0VlYqb1yBaluOk7W09vlmsDi+
 9ENABfLsZVe5iyulyep6vhqpkf3+Oa7ghaQmIAUeh1fmrktyz7kz1g93UJ/opNSMKVjLa7x6/Nm
 qCIpo1prhn0YXCRc1gGJlBg3Z5Uqmkxc3ttEYhMJbri1RWyQBteHEv+WJPurnOzJoXxV6BHSDgO
 J+8dJWwQ
X-Proofpoint-ORIG-GUID: DIWBS_WrUG_4Kbj3kp4f8wHAHSk2FBM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004



On 9/24/2025 6:12 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:52:20PM -0700, Wesley Cheng wrote:
>> The Glymur USB subsystem contains a multiport controller, which utilizes
>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> index a1b55168e050..b0ce803d2b49 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> @@ -16,6 +16,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,glymur-qmp-usb3-uni-phy
>>         - qcom,ipq5424-qmp-usb3-phy
>>         - qcom,ipq6018-qmp-usb3-phy
>>         - qcom,ipq8074-qmp-usb3-phy
>> @@ -62,6 +63,8 @@ properties:
>>   
>>     vdda-pll-supply: true
>>   
>> +  refgen-supply: true
> 
> Which device is going to provide this supply?
> 

This is just a pmic regulator.

Thanks
Wesley Cheng

>> +
>>     "#clock-cells":
>>       const: 0
>>   
> 

