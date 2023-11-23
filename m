Return-Path: <linux-arm-msm+bounces-1623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C63677F58EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D0FAB20D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 07:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7824156DC;
	Thu, 23 Nov 2023 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dUKGSkAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E05CB;
	Wed, 22 Nov 2023 23:13:48 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN6u2Rs014625;
	Thu, 23 Nov 2023 07:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pAQAfqihYi2DiVm04BqeShmGb4dAjJKqb3uGVZ3wapA=;
 b=dUKGSkAp3KRRjqDy12n0HrLhPXu8uH81qhNmHFKiCPW7lDsMAjNgODWWzhad+/dG1BVA
 Z7qD8sEXtA1qRBXf0hPEI9MfWnEiMtGiFYQ5U6frhXhG7e54kyAIfkQ5DtMjJMzISSmr
 MHpTSb2oWjAG9dH6YWGs5XUopZ8NrX+CvDpOHrqqEhCeHRodNJ2Q8xmLLByml0KHJOxk
 VmkDJcHiJ8nOnVSnPMavx2xylcLtqQ9BSAsMQDH8O2iodG3uspb2ibRgZ9NnkagHShId
 ngO0/7rEbdi1CvsXWFOdhhWbljPouQx8dz0fogeE2N1SQftl02RYH3pzVr0y3F3/Q53B 7g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhgudaadv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:13:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AN7DPe2021541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:13:25 GMT
Received: from [10.216.58.146] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 23:13:17 -0800
Message-ID: <459005b7-df82-48c1-a85f-d4125ddde124@quicinc.com>
Date: Thu, 23 Nov 2023 12:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: ipq5332: add support for the
 NSSCC
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-8-a7ff61beab72@quicinc.com>
 <8cece5d7-0fcb-4366-be72-6494842b7c41@linaro.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <8cece5d7-0fcb-4366-be72-6494842b7c41@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V7vh9dVEOWNCbszbHchbgdNhNVn2IHq-
X-Proofpoint-ORIG-GUID: V7vh9dVEOWNCbszbHchbgdNhNVn2IHq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_04,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311230049



On 11/23/2023 1:52 AM, Konrad Dybcio wrote:
> 
> 
> On 11/21/23 15:30, Kathiravan Thirumoorthy wrote:
>> Describe the NSS clock controller node and it's relevant external
>> clocks.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
>> ---
>> Changes in V2:
>>     - Update the node names with proper suffix
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> index 42e2e48b2bc3..5cbe72f03869 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> @@ -15,6 +15,18 @@ / {
>>       #size-cells = <2>;
>>       clocks {
>> +        cmn_pll_nss_200m_clk: cmn-pll-nss-200m-clk {
>> +            compatible = "fixed-clock";
>> +            clock-frequency = <200000000>;
>> +            #clock-cells = <0>;
>> +        };
>> +
>> +        cmn_pll_nss_300m_clk: cmn-pll-nss-300m-clk {
>> +            compatible = "fixed-clock";
>> +            clock-frequency = <300000000>;
>> +            #clock-cells = <0>;
>> +        };
>> +
>>           sleep_clk: sleep-clk {
>>               compatible = "fixed-clock";
>>               #clock-cells = <0>;
>> @@ -473,6 +485,22 @@ frame@b128000 {
>>                   status = "disabled";
>>               };
>>           };
>> +
>> +        nsscc: clock-controller@39b00000{
>> +            compatible = "qcom,ipq5332-nsscc";
>> +            reg = <0x39b00000 0x80000>;
>> +            clocks = <&cmn_pll_nss_200m_clk>,
>> +                 <&cmn_pll_nss_300m_clk>,
>> +                 <&gcc GPLL0_OUT_AUX>,
>> +                 <0>,
>> +                 <0>,
>> +                 <0>,
>> +                 <0>,
>> +                 <&xo_board>;
>> +            #clock-cells = <0x1>;
>> +            #reset-cells = <0x1>;
> 0x1 -> 1, it's a number and not a register

Thanks for pointing it out, will fix it in next spin.
> 
> Konrad

