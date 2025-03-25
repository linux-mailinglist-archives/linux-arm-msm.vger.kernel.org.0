Return-Path: <linux-arm-msm+bounces-52421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CEA6E8EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 05:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DE91896F67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 04:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1911624E0;
	Tue, 25 Mar 2025 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP5czc5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A86364D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742877714; cv=none; b=uiz4653CDsnQN0kzQDizA3+gqmPjEs3FTiYGDLSFE/BIr6aWv+IUuOJkAuk3wQhZwxTkHCBnk4OtPS5FOIgr6hJGsV3axHEBa4HqU83kJXlzYKsvRjmBxnFqtYF6GeTOysQpgelsPNrT6VeqnHy0RvRwwW6ctLfDNVxC3HuehMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742877714; c=relaxed/simple;
	bh=7xWy80QMrujZ0Ex5DlTo0yWkJidfRM8xZL9THcZoR9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9BtxJoXGTmh+HHjgeiVc+JBazenoNSgam2fThluvEtmDl3c50WAKCt0hKQMtMRYIwFp5WAODXto4Cy4cUB5nLirFtdLju82myX1rY1DBiwdwzyEg7smd9lqrycgloZYMFsl/n62f0ulWR9Mw3PkhepaEuufr9LPtPS1E7a8nts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP5czc5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P3D5Dm019075
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NVjTuv2vpO9LvwcHKST3gkeOTVrunOLOzDwRQAoVj8=; b=lP5czc5tEOR+Sg2U
	O/y928utt4d9HJeUsFEDvJmT83DMwey+bMiGpgoQcpyfHMPd+Yes5WL571MdsDub
	8QvdVh71pZhJBFh4Ay/ZAGV1offA29qadrr7fYTK+ypW2mfbsb2vWUGp+nzMZ5Dg
	PtQGR0x2xqg7+UHMozKW6tD4AtSmCewwPGqpeaXjlUCD1UyRAxJNvkO9g+Cvw/O+
	DlANmTtlAX6sZHAxlqV5PXX/XqbNxkH0tQhYZ7fGZeyUXbuoNBS3gigHlXKmu9BX
	bfluLFEEvfnpRRNxaoZ+S7xQkiSExe9d9wShZycdI6JIv8+WierliyictdLqOCEC
	QlbSTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcy85vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff68033070so8204066a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 21:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742877710; x=1743482510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NVjTuv2vpO9LvwcHKST3gkeOTVrunOLOzDwRQAoVj8=;
        b=L7AmRr4obB7dJh1RbkCBIERUJ5qhbySVwSA0+9LCMxbqnB9nX1NRHSFOO1L8/FtcrA
         0oKqm34ZBF95KqvzXtqt0aa5FokCbzK9exYJQmMPJgyY4bpSZMJP1pObV2A5550EuKu9
         1n7+Ad6riCl3CnO8WwF3r/ImErNhFI7ze4GGyH6Li/mn/QKS/INK5d6xfydtJP3PeDFa
         LM4d/JJuJWJzHR7q/tihWJbQyuaL51Pf570eUFB8FJD4J6AwITd91rp3iST+u/AXDUtl
         ffcfBNjlIRYPOjDTF4wR0yG+b2pqzYcu7lRn5W2uzEzlm+2Eo++VtxLdu2vNjhjA9epm
         30PA==
X-Forwarded-Encrypted: i=1; AJvYcCUIB2hrM4SsTfC4lWltJitB7wmmD7kKxCCqo2C2HshdwwVevqpKnVADi+30dMlk0IXIIMR0JFvE+fRAKh3j@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGSVdOPOmG8DrwYz5z/9B6Ipz/hmYOdsPPHrDZ0deSQU2rzed
	bON7LZbbEAFn8Fvf/bzrD0rC3o3mE1/KkNUvu2tMhiv+pWQBoR27oY6EyjoTLoKsXEmbD+szfdN
	AS5M8CZuLC/fGSS6IHQJ72OXbQ8fRbJIXurlvrBACYnOUfTpTPsNZRGZT5B6WTkuY
X-Gm-Gg: ASbGnctuqZeTRIaP5bguCIJzFAThStNuLdv5ctKJPynZhO8s+LKkrohPK74OhRgAwQO
	WJbXIyC7EEifnbOkGRakiqR6WbxbuWCN3VAwhco5n7wA09/nmAlSeX3Ndy2x3phtJ/L3POcGPF3
	c6xOhxUT8FcuwlQ62FrFwqVTl56BPDl/SASMRamfLiW6UW+BxEHRLIxK6YhlkCR1Jb+FzklV7/p
	lToyLRtoOwSp6IpRImsEnuAxunc0Otl/yTC63zh+8xfshgNDQDKhVTwCavQ8G2b0KN+5PgdY/Ch
	NgSNjVawtQNAsJbucYUhT6zVYgqIbvCets5jOw0hcsKBFg==
X-Received: by 2002:a05:6a20:2589:b0:1f3:48d5:7303 with SMTP id adf61e73a8af0-1fe4300f771mr33673873637.31.1742877709917;
        Mon, 24 Mar 2025 21:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx8jVmGZQjbSLUZtNjlclkoC+wjvKr3wBjOfaf15PVujgPxwv0lUOLrrAJyTEPiV5QhOiaDQ==
X-Received: by 2002:a05:6a20:2589:b0:1f3:48d5:7303 with SMTP id adf61e73a8af0-1fe4300f771mr33673825637.31.1742877709329;
        Mon, 24 Mar 2025 21:41:49 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4c905sm8046504a12.66.2025.03.24.21.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 21:41:48 -0700 (PDT)
Message-ID: <7a0e7b48-6c08-abbe-7c23-a7e1c746351c@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 10:11:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset gpio's
 to root port
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com>
 <20250322-perst-v1-1-e5e4da74a204@oss.qualcomm.com>
 <20250324163945.GA304502-robh@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250324163945.GA304502-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e2340f cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fxgvsqju1LP9AadwZSIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JOTpRZAXG1EGAT84SVuqqpcgKkawr9gV
X-Proofpoint-GUID: JOTpRZAXG1EGAT84SVuqqpcgKkawr9gV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_02,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250030



On 3/24/2025 10:09 PM, Rob Herring wrote:
> On Sat, Mar 22, 2025 at 08:30:43AM +0530, Krishna Chaitanya Chundru wrote:
>> Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
>> the bridge node, as agreed upon in multiple places one instance is[1].
> 
> You aren't really moving them except in the example. This is an ABI
> break for sc7280. Is anyone going to care?
> 
> You need to deprecate the properties in the old location.
>
Hi Rob,

we are actually moving these properties in the driver also
patch 3 
https://lore.kernel.org/linux-arm-msm/20250322-perst-v1-3-e5e4da74a204@oss.qualcomm.com/T/#m168bec3f5d218a7f0c18293ff7380cba07a12e0e
is the driver change in this series.

>> Update the qcom,pcie-common.yaml to include the phy, phy-names, and
>> wake-gpios properties in the root port node. There is already reset-gpio
>> defined for PERST# in pci-bus-common.yaml, start using that property
>> instead of perst-gpio.
>>
>> For backward compatibility, do not remove any existing properties in the
>> bridge node.
>>
>> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,pcie-common.yaml  | 22 ++++++++++++++++++++++
>>   .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  | 18 ++++++++++++++----
>>   2 files changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> index 0480c58f7d99..258c21c01c72 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
>> @@ -85,6 +85,28 @@ properties:
>>     opp-table:
>>       type: object
>>   
>> +patternProperties:
>> +  "^pcie@":
>> +    type: object
>> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      phys:
>> +        maxItems: 1
>> +
>> +      phy-names:
>> +        items:
>> +          - const: pciephy
> 
> Just drop phy-names in the new location. It's pointless especially when
> foo-names is just "${module}foo".
ack

- Krishna Chaitanya.
> 
>> +
>> +      wake-gpios:
>> +        description: GPIO controlled connection to WAKE# signal
>> +        maxItems: 1
>> +
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - reg
>>     - reg-names

