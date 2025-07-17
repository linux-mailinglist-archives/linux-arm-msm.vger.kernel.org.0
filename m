Return-Path: <linux-arm-msm+bounces-65335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EDB082C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BC4317E6D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 02:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC821DE3BB;
	Thu, 17 Jul 2025 02:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzlEQ4E/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D21799F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752718470; cv=none; b=mwbcZM1eHvvKDeg9584tpoqlOwxIo1RmLoxVSgiNDPmqwLw/M8sFNbYzrnkg0ipVuuXG71bSohY/zmynL7NXCtudHsOPEA4g9ZMjzEL9nJuWzBBFyLB0I/8cYoK2OhUrG3WIkbqwXDwlYC7EqpGzo2f3cWP7Xv7g2LVES6XLMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752718470; c=relaxed/simple;
	bh=Ocf7rDEVq/yfElBauBHcGF2Xn4oeGqrWWXKA3Ya4w88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTfQckgPLZR6TNQuYm+mHfOvvDeEY+7rTm8SfGah90C2BPdHClCNfZcpJeix6RVY/xOx8rYlbBaqvcjtNo9D21zxbVePCYsiFAcA8pN1e0D++KGpUHSkQkmxJu1DsWG69ykBvZ1R81mPne2jL27fQRFBTHHmW9IPMK1kUsRHAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzlEQ4E/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDPMI000552
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTC0WRX4p9Xlvnf+T/Nq7VBMyv7m6ojUA5HCSntnl+g=; b=BzlEQ4E/sVojPRjG
	tn7FhnQ150jJYWfSIObH3trPsWcVJfaZRfEM+hu7takN7pHDO9ImELomAtdNQiBZ
	D1FheRegFz2/wet9oqnpy3EA6LvuIRAEvt1xmRt0kgLeWbRlK4yKHTGZkkS7zPEA
	a9wKeXyjfjJndJNtQ5RWbpbT0RKrU1jsj2COxdqNg+CRetxt9tCOstfrP5Hd/51E
	9fY/YhaLKyow72R5OMOh7POJ4yDF0wATDb+/rOJELOtkhOT1aRQG0GyzRwg+PzDO
	cHMbXmsazoLybXtn3Qoge2ax9V9xZ+Y2/FkUi+SdLalwxeXITSwaAc2IwFd/Iw0J
	Xvs21A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drs077-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:14:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so4322565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 19:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752718467; x=1753323267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTC0WRX4p9Xlvnf+T/Nq7VBMyv7m6ojUA5HCSntnl+g=;
        b=gHdOQGO+lhqNJnbcUWvPluH2+qwsed8S+fVuEREXSA9L3LY4o7LlZa1CrQKQ/iPHWa
         MbrZ6BRf7t5ug/JenYNYFbEoFNT1L/+ozOnM3JA/42jQxk3CoGDcoBMc208yt0WYcOxe
         aQ2DRkVSemKOGzTEJGeMdmeNRQX9wlrCwhUM0Hd2ZT5hwK66WjcW5b7PIkcY6CbWV8jm
         PgH9zfuFHQf2QXAGsTeTxy2Fg5i4sZNCbHTGkAezB7dlkzyyFqx3Q3NcHOy2PHJvnmMp
         xmljoQYfz7Yjr3Zekhe7VHoQ52st6pruA75wl9Oo8at7KZDRjQ+Iy5/6IU7j2o6fThfp
         Q7cg==
X-Gm-Message-State: AOJu0YzK8d9X3dB+XTs4/3n2T50Qx5lXaIbCBOAeLT0v9fMMwifPQUIC
	3LufFixqAdHefbkUrng+5p+ZiB9toS91nxmPq2pFWXT8UbnuyQoNjOlgg4RwfRYQHPlKEKCPo1O
	wu4TYbBz3bWpL/cLBvhInUCMCd5FUXZWS0+k76fv9+WHP5I8ZqHw8/U67A/hjw+2oURLS
X-Gm-Gg: ASbGncsCVzLV6FADjAx0bzHoecnGvB1HDWxMYyPry7Uc1T7cmCVWb2nCi6WdD1MN/+R
	84HSxdtmSHX6vqVcwZxwrXVIBnXE48rgWYSnksM07a6c7l0tJBwZb1ar8mKOzW3GLsE9A5yWGYp
	vMx5NRdW6vo/o9bwZlpKaQlBZy+HZN62+a1Pv6c2GRPGm6XsBF1yfZRII5g5iEb0strTqzWlVv5
	Axmr0sOWF7CO5XqIB8M4AVJs5NxWL6MYRWgUiNjhVWe3yPeB9fXu5VPoeVl7sYD0o0Ok43mrV1z
	HUzxXtPAz2uEC/Hdd2kvM5GNZpJDG6j978qiobmC3dNxuuTqcOB3Y+LwRfQRy7EUg9/qYxER5Nl
	rnfD/tfp7aOQB4ird5FuUPxUOktQ6
X-Received: by 2002:a17:903:80e:b0:23e:3164:2bf1 with SMTP id d9443c01a7336-23e31642e68mr7927005ad.53.1752718467233;
        Wed, 16 Jul 2025 19:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn4xLdliAVfCrSfN9/WNrtrgGxPkMsfecnWK61oAUnA5ybvMwzlXtm6829MrraE7ebG577YQ==
X-Received: by 2002:a17:903:80e:b0:23e:3164:2bf1 with SMTP id d9443c01a7336-23e31642e68mr7926835ad.53.1752718466838;
        Wed, 16 Jul 2025 19:14:26 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42864b9sm132765355ad.30.2025.07.16.19.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 19:14:26 -0700 (PDT)
Message-ID: <bffff2bc-6f42-49f4-9147-a4d706929e93@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 10:14:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-1-f6f5d0f9a163@oss.qualcomm.com>
 <604a5823-c563-4d37-ab14-e3164f3b1cd8@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <604a5823-c563-4d37-ab14-e3164f3b1cd8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i1XlpyUSYisx2jFEQY5tTAb0BnB14ePT
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68785c84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VgApEbnXb6FI9c-La98A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: i1XlpyUSYisx2jFEQY5tTAb0BnB14ePT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAxOCBTYWx0ZWRfX/k40ThJbgtDM
 uI+D+x3hJ/zpZHhf27PmZuMw8kKYERDLMNsY4I6gP3z3WnNlWJ1RUbFRtWc4ZXyHjVsm3yLaxez
 3Yd4St5pmk8MGRlg7bB/zMjmuLQ8YqQ1JtRhFWo/DRz/TOTAL1FmOzkyQjahG0FxGjLqm9/iU/b
 B5MVbO++BoGPfW/+ESpyJZt6ANXt645Z255gQBovBu+92tmSnp3jeAebCUNOiPowZJi7pCgd7F6
 k91WoP/1641Z5q4yoJ4Bd5FuHdw2eoyRKSFqhyT7e2KvQb5OBKVsicCq5+VF+MQjlRXgUQkJazE
 gEdZyCLxcNVzOOo3/06jR9qEfnLduFW/le0ni2x63qaM7DMKSDUb2oIOLq2a81K/nQqrVdNbqq9
 BDc4T5tZ+TUHUIpfzdcO+mBvL5MK6xSo3cY/0hUb8pQLMp7yWETBOMk65aE91OE4pTZRffLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170018



On 2025-07-16 17:30, Krzysztof Kozlowski wrote:
> On 16/07/2025 11:08, Yijie Yang wrote:
>> Document the device tree binding for a new board named "EVK" based on
>> the Qualcomm Hamoa-IoT platform.
>>
>> The "hamoa" name refers to a family of SoCs that share the same silicon
>> die but are offered in multiple speed bins. The specific SoC used in
>> this board is the x1e80100, which represents one such bin within the
>> Hamoa family.
>>
>> Although "qcom,hamoa-iot-evk" is introduced as the board-specific
>> compatible, the fallback compatible remains "qcom,x1e80100" to preserve
>> compatibility with existing in-kernel drivers and software that already
>> depend on this identifier.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ae43b35565808ed27cd8354b9a342545c4a98ed6..83b09ec1100ca03044c832212a99e65cc1177985 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -100,8 +100,8 @@ description: |
>>           sm8550
>>           sm8650
>>           sm8750
>> -        x1e78100
>> -        x1e80100
>> +        x1e78100 # hamoa
>> +        x1e80100 # hamoa
> 
> 
> Huh? Why, no drop.

Okay, I’ll leave it as is.

> 
> 
>>           x1p42100
>>   
>>     There are many devices in the list below that run the standard ChromeOS
>> @@ -1162,6 +1162,11 @@ properties:
>>                 - qcom,x1p42100-crd
>>             - const: qcom,x1p42100
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,hamoa-iot-evk
> 
> Don't duplicate entries. Look how this file is organized.

Sure, I will merge.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


