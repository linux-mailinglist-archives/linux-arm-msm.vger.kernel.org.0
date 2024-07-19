Return-Path: <linux-arm-msm+bounces-26610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0293743B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 09:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2345CB21503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600964AEEA;
	Fri, 19 Jul 2024 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bnCIJMII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE594383AE;
	Fri, 19 Jul 2024 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721373382; cv=none; b=ONd2YzjuNuAA959SWWWOGmp9XGI8wHDAswF3o0vpuUalNMe3HGVrSzmjBZFV2/lVIAY2HOYXZ3HopClwPAtJTQ6oPNFVdlQzrpbW8ZsFUwlYav5/x/DizL5SFftr5wtLaHj38gICiJGF8tgkNLi44aVXGeOjGntbYBxCzRfURok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721373382; c=relaxed/simple;
	bh=Pri28JxsKbTdgBxDah1HX4+gjz3x9JcY8LT5JSPjCEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iVI0yZ/2B1IJG/UOBjiH3cgSv1cvciHjzdqVXikmBRr0B5/abtWeBvOSeLjDfClMQAmSjEIEISfYC4DmN3OVEVp4a9OKGWjCn3LtjeDNk4fBpsvbzifm2wy1yupPgIeRWouF/cgzX7EkHVwN5G/5yyY+cOguUSEzqSNAiDy6ZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bnCIJMII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J1Boim002461;
	Fri, 19 Jul 2024 07:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V18CnCDRdByuO0ymYaCTdwRDpiRNMMquhhslWE+RwDU=; b=bnCIJMIIel6X2gkH
	IqIB/BiCqwouNq2u/cmlqFmLPy847+W84q1FWoYXmS0TrEI8FeeIlT3vs4GfwrA/
	JAlYt75CgBVkG0/JdVjRpksN4P1FGBbj0BtOGy17CP+kg1pc8rhu8J+fVQfHfYxi
	maHcNsxDLGK0UpsoNSAe4h0/ICnLgs0Rv9pYliDPF3Ws3GVnexW5nLj8T6TOU/cP
	N2EN6e1Hyx1AKRdOspH90UeLFli5ZJup6Hureo2jrAQmFDA48dwVYYy8stZhp2yi
	AdJ4+6FDVYDMAcdCB21ngkfdF5wp6E4fE51jV4M3ystoaq1Q2+ltoTgxmCii5lOl
	M3Nmhw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe94rkce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:16:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J7G1sk006359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:16:01 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 00:15:55 -0700
Message-ID: <ccc981cf-0b75-461d-8440-4b307856e507@quicinc.com>
Date: Fri, 19 Jul 2024 12:45:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        kernel test robot <lkp@intel.com>
References: <20240708130836.19273-1-quic_jkona@quicinc.com>
 <rbej7rbjiwtgf4reiomtmlv3ef3ljfys5yfzypigrertylucu7@be3v65aeuimb>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <rbej7rbjiwtgf4reiomtmlv3ef3ljfys5yfzypigrertylucu7@be3v65aeuimb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2KiNyAUo0-nw64LsjnRv8ojnvWc8ToL_
X-Proofpoint-ORIG-GUID: 2KiNyAUo0-nw64LsjnRv8ojnvWc8ToL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=770 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190056



On 7/8/2024 7:32 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 08, 2024 at 06:38:36PM GMT, Jagadeesh Kona wrote:
>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>> sufficient for clock controllers to operate and there is no need to specify
>> the required-opps. Hence remove the required-opps property from the list of
>> required properties for SM8650 camcc and videocc bindings.
>>
>> This fixes:
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>> 'required-opps' is a required property
>>
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>> 'required-opps' is a required property
>>
>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> You are mentioning just sm8650, but your change applies to other
> platforms. Could you please check whether other platforms supported by
> these bindings required the opps or not. Make required: conditional and
> enabled only for those platforms?
> 

Thanks Dmitry for your review.

Yes I will make this conditional. Currently only SM8650 doesn't have the 
required-opps property in DT, so I will remove the required-opps from 
required list only for SM8650.

Thanks,
Jagadeesh

>> ---
>>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 1 -
>>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index f58edfc10f4c..bd9612d9d7f7 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -57,7 +57,6 @@ required:
>>     - compatible
>>     - clocks
>>     - power-domains
>> -  - required-opps
>>   
>>   unevaluatedProperties: false
>>   
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index b2792b4bb554..8a42e2a1a158 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -44,7 +44,6 @@ required:
>>     - compatible
>>     - clocks
>>     - power-domains
>> -  - required-opps
>>     - '#power-domain-cells'
>>   
>>   allOf:
>> -- 
>> 2.43.0
>>
> 

