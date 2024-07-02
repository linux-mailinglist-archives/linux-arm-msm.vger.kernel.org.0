Return-Path: <linux-arm-msm+bounces-24882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06C923D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7562834A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23EA15DBAE;
	Tue,  2 Jul 2024 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxwkcBQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF915D5AB;
	Tue,  2 Jul 2024 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719922446; cv=none; b=EHcD2YqLWLFKl8Kt53kjdI/xy4iML3U2AH8wP38a/SIQtJtIERRvaWNxV7DhfXFYjHDSM7/21lupqUvbKOAX7K0XLqUHS3tBiZ7pYNwREJisURSgCtLhri7gGb2sZbPjS2qF7b6F4PZVRB5J+L+S/tHT9clUr4g/BrLkG6thRI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719922446; c=relaxed/simple;
	bh=+s6jgiAJELxreoow36uUgrgozKOOjkSRma04ypAOOY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i2CECPgR7vanVt3qnUaATEWkV9DTLW8+zpE1LL/6MkqYysRYh1ijh/zlUWtbEpKrWogqavOzKppLxbfa3n8X5RKkZDw+LZfomXpgOFU3ImoB1eNYzuffLhTmprNdQC5u886Z56REOau3i1IZOFBm9u2pAX2lokiSmW4Z0qyMuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxwkcBQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4628FSIe006162;
	Tue, 2 Jul 2024 12:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAc+27O8bp3KbN84Q0eAMJawfTO1NX5ZOKDBTeZA1oQ=; b=LxwkcBQVgolmjPWK
	Uas18qBtOu04XZDaSHgpyE5C9Cg21ukIWiiNLzxqUx+MsxbQpaSFuicy5TQ8k+xs
	OIoS1VBRzxbtC8CbLst03UWR8BRTRSZKtBZ9MFCYeT9UCV4qr2zF0N3Hb4LEv0fd
	Nsx/92Z0ezvnRQwbpN3A5u2rCbutpShj98y633QSI5U1O0BAItQQDuQMNy9sTgfa
	S27VV8GjNZ4UMMB3HRTsUjZv6TnKA2dK0EJ4d4yAdFzU8rk39iTYJ0vYik6S2Z4W
	bNOcTgtBm60jhLdOd3GIkPc1CyJ9L40GlniIkWcw7Xl5Aeipo9ta36i7dCncSD+j
	6siugQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bj87n5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 12:13:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462CDM4C026821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 12:13:22 GMT
Received: from [10.50.55.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 05:13:12 -0700
Message-ID: <5ccbfde6-f26a-4796-abac-e8d6a18c74e7@quicinc.com>
Date: Tue, 2 Jul 2024 17:43:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <catalin.marinas@arm.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <krzk+dt@kernel.org>,
        <geert+renesas@glider.be>, <neil.armstrong@linaro.org>,
        <nfraprado@collabora.com>, <mturquette@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <netdev@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <m.szyprowski@samsung.com>, <arnd@arndb.de>,
        <richardcochran@gmail.com>, <will@kernel.org>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <p.zabel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <171941612020.3280624.794530163562164163.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6shE0fNeo2vFEYGKXPuqETHTSuM8sMwR
X-Proofpoint-GUID: 6shE0fNeo2vFEYGKXPuqETHTSuM8sMwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_08,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020090



On 6/26/2024 9:05 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Changes in V5:
>> 	- Dropped interconnects and added interconnect-cells to NSS
>> 	  clock provider so that it can be  used as icc provider.
>>
>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>   .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>   .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>   3 files changed, 360 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>   create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240626143302.810632-5-quic_devipriy@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> Hi Rob,

We tried running dt_binding_check on linux-next and we do not face any
sort of errors.

However in case of v6.10-rc1, patch[1] failed to apply as the dependent
patch[2] is not available on rc1.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-3-quic_devipriy@quicinc.com/

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240531&id=475beea0b9f631656b5cc39429a39696876af613

Patch [2] does not hold any functional dependency on this series but has 
a patch rebase dependency.

The Bot has went ahead and tried running the dt_binding_check on patch 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-5-quic_devipriy@quicinc.com/
which is dependent on patch [1] and hence the issue was reported.

Is this the expected behaviour?

Thanks & Regards,
Devi Priya
> 

