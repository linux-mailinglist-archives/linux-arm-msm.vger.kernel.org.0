Return-Path: <linux-arm-msm+bounces-57291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4EAB0091
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B012C1B640A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7C283146;
	Thu,  8 May 2025 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BHFSfP8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059621F462F;
	Thu,  8 May 2025 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722336; cv=none; b=lxHq7ZS+IUJ5YLUnsHErOO9BM4l4ms5o+8jieEkzn5aNxDZ1nPDWC7wN3xkXo74LQrjby1OTuRgl8Kql9URH7/spALlcMVbv7HZdS+8NubDEkWlORyaYjlZTtGWBfLh1ATriOVZFKypvOSRajwEzhKv5RcVOhgFa+zQ0vca7fxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722336; c=relaxed/simple;
	bh=Dw1RR1HygY5GCmHnUj+DW2JiapjZyJxWEOJRfjulfbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aD8HCz0J9/ljSUZ9ATBbYQtlGweYph6/a9cLcdvkK0/sLHyv/aFdMfRk9YKG+sAjuZ2HdeZUqdWowTdBUWUPBfj8sk3zv+8yPatgvY6O8bc/wfyUmacthaiZU2qII5YbBjYFpOsx+JN0mKnUpreYis250RJp/tr6GMZL+TJRpTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BHFSfP8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0Ol5008438;
	Thu, 8 May 2025 16:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CG024qvKHGgTF9642w4NMBizp9Z8Zc5tdu8BvOBtOdY=; b=BHFSfP8CC77p53mp
	O+YdCv/m1fyRDDb5h7Iubq1C6JxytO7E086Ve5Av7lWF/NFu41HIpMULEF7cPhb0
	wH6pLPoWCKb41pZJdXlnBfBVs5PTX3RvxsS+2dlL0sn5Ic2Lyy3jCiq+jqh6YKZn
	epAdBja+NRVtnYtHWpSTyezEDmkqnGIW3QqOwpuURfwdI6BuUa/D/DMgqWnRU6L4
	BMoLQvv2tMtof01etYcWm4hcMzZp9p2i30mtIyCP9nkJVltQlkpaBzosAvoO1zjA
	ohrnOeFW/GTdhhmtevqIrmlOqqcz+/ZCOCOxbU4bNVuHyML4jwbKPCmvNVUb61TC
	wIWZGA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a04a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:38:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GcoXj017462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:38:50 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:38:45 -0700
Message-ID: <82e6c229-8852-4ae9-add0-5fdc0a15f7c5@quicinc.com>
Date: Thu, 8 May 2025 22:08:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
 <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cde1b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SN4UZCTYLQiUCmDajeFXvTges2PiM95O
X-Proofpoint-ORIG-GUID: SN4UZCTYLQiUCmDajeFXvTges2PiM95O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NSBTYWx0ZWRfX0U8hza35FXr7
 bgcZx3Oz38FdEWwUmvoM/LbYP6/ejuM/PB3+IywJ7eYOxChNltT0bXVCoHyj3FE6S+CX76A4B1L
 /Dj/5NsqOk6QXlI88FnAObW7Y1gkdwxcA97yKqYvdvbBatxss/eHeONrdqJfxbxXciTRYu9a/Wl
 +26ZE29FacamhCpDyZT4zIQKj4Pdh+vIseDAfc7aLy8qi3LgOoOHtrKKJbo6sVwLq7mUGj3cetM
 nGWwOGONMzMsy9GszwVGXbtjY3kQ9fKF4ry5gaqtIUsfBGeFowPVTsndy0xtee1AcPCDapeZbCu
 W8Khnk5bd89Cadk9QX6HKwMsaEEAjoy4a7uo0as2a1jzwTNoGQW0qzTo6l3NbX9D/XyVXOgGlmI
 /kK8k6+ow2C/INTSitD2OBOkVMJcxytOu9J5PjRYELD+V2lK4nY9F8vRHpl26pOw/92y1nCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080145



On 4/29/2025 4:24 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
>> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
>> through the q6prm clock driver.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> index b11b9eea64c1..f3859d805ea7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -11,6 +11,54 @@
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   
>> +&lpass_rx_macro {
>> +	/delete-property/ power-domains;
>> +	/delete-property/ power-domain-names;
>> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> 
> TX -> RX?
> 
> [...]
> 
>> +&lpass_wsa_macro {
>> +	/delete-property/ power-domains;
>> +	/delete-property/ power-domain-names;
>> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> 
> TX -> WSA?

For qcs6490 RX drives clk from TX CORE which is mandated from DSP side, 
Unlike sm8450 dedicated core clocks. Core TX clk is used for both RX and 
WSA as per DSP recommendations.

Thanks,
Prasad>
> Konrad


