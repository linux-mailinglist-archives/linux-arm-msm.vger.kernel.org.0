Return-Path: <linux-arm-msm+bounces-63354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8AAF10C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F413B408D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1162472A6;
	Wed,  2 Jul 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LcgduZoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83821B9D6;
	Wed,  2 Jul 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450300; cv=none; b=AbumCCRnpoa7iaPgKPgr9ZCHbNLJpUegSefsEGJE7AQI9XUHks6vVgWOwVEpQW620I5+NhQ004LWcyDwaiBijqSLLumhtCyzWgS2rrNODIVPvqJWYAVG2rw9RD4X16QsIv4ZUIyswQOvZhbVhMT13tBfxI1dYlQ5OYxOXpOErC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450300; c=relaxed/simple;
	bh=yfplu+IybJ/rIPsisymgLSYrMZAW+veThvWdMZBknTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ozsfG7WkqUN95I1/JfxBuzOUix/4llYkDz1FHORJ3p2IH1b0BA7D1+N/rgNQFxAuMr0M+QoDRlh6UKdiQuQ933xbfqLd8suULIm1UvXNPBrLouqYkQCCppLvnFFh0VCOFyo51JgihuZTmFr6gFl8b9NNzKMKJ0sw6ozFNsTBG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LcgduZoe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626OK2d025364;
	Wed, 2 Jul 2025 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlTuoRYc85ZU1I6UU0g5G25mTjIeRsMqpm0KeSXhRkM=; b=LcgduZoeVX5rSk56
	E1GhlJ/9xVNDKSdRfOKVR5x9wa2C+ujrj3uEAxL8k1nvt++VaqFMIJrn/6Scg/Zh
	Q4a3QgEFBnPn2OcLy3ZTfptbNXmKOvLQPsX/xc/LMB9wwE7WNjwTgMGPoA/M9G4z
	EIyFKxVmKfX54Aolc7deecQXOjLnoH2xpQrxBsOWGROkI+UQNa03ZdBlsWBeMsUn
	fEvhvsyPaaaqj+bT7FX3JO2JT8Jf/OReUO69IxgQhMVhlUzGrz7SlrPnDjxrWo0U
	20a2dqpLwRGx2w/3PZWRtb0oW1eSIiOs+sD3T0W/OroMlOWdviAnx72APAmN1lt2
	zsWbLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sbd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:58:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5629wCZX011929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:58:12 GMT
Received: from [10.216.7.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 02:58:04 -0700
Message-ID: <25808d55-7633-4986-9e32-58571c149af9@quicinc.com>
Date: Wed, 2 Jul 2025 15:27:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add support for two additional
 DDR frequencies
To: Trilok Soni <quic_tsoni@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kernel@quicinc.com>
References: <20250701074334.1782967-1-quic_pussin@quicinc.com>
 <0c0e3732-54e3-4a4c-ac44-3175180298fd@quicinc.com>
Content-Language: en-US
From: Pushpendra Singh <quic_pussin@quicinc.com>
In-Reply-To: <0c0e3732-54e3-4a4c-ac44-3175180298fd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=686502b5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nyc-0TqUprqe_HWS510A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MCBTYWx0ZWRfX49r1PhZq7//f
 p/J9J8b4aBdDrm2cp0riOOFs4+vWckxCadEQD6d7+WlCMkjQes7+E1YwMtdW2z32T75lvu26wuv
 6ic/7cOLTGP8eyZTzxPWB6jZmCWzrz0Nu4IEXFbM6TfhZGJ9hQidI4Yu4VWlwbAjH0yhLDZNL6F
 8eOvPxTDVQYSGyFbpSX+9CZ56dWyhr5w1HE05WtoPjWFTd8u1/YYTsG5IYJN08iaMgQfnxn7isG
 JeTtZBZtI2VCLdLUzT0pcPooR5Sdrq94PadQ2NN7mpZRugRAmbtRgcoXbVurzeuFO1hF4MzTuyP
 4Sanm9apekfAYrtEez+rodDnSAonxSH5aVHDERKfTXqrksb22W3Pgw9TVCVH134JgQtLwAOqo5s
 /IUNx++6R6GLJd4Vt76cpK7g2hyLbpPaDqYgbYF/tF+9x6Ix3Qspy95b6KnXgX451TrzDtwE
X-Proofpoint-GUID: Jho3U1duj_7gvC2OaP6Wi2uybEi8GMo_
X-Proofpoint-ORIG-GUID: Jho3U1duj_7gvC2OaP6Wi2uybEi8GMo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=954
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020080

On 7/1/2025 11:43 PM, Trilok Soni wrote:
> On 7/1/2025 12:43 AM, Pushpendra Singh wrote:
>> Cc: kernel@quicinc.com, kernel@oss.qualcomm.com
>>
>> The SC7280 SoC now supports two additional frequencies. This patch
>> add those frequencies to the BWMON OPP table and updates the frequency
>> mapping table accordingly.
>>
>> These changes do not impact existing platforms, as the updated mapping
>> only affects the highest OPP. On any given platform, this will continue
>> to vote for the maximum available OPP.
>>
>> Change-Id: Id3a91e065c49848d9af18e5c3edee0836cb693e5
> 
> Why Change-Id? 

CC is a typo and fixed the Change-id in V2.

>> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++++++++------
>>  1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 64a2abd30100..cb945abf0475 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -620,12 +620,12 @@ cpu4_opp_2208mhz: opp-2208000000 {
>>  
>>  		cpu4_opp_2400mhz: opp-2400000000 {
>>  			opp-hz = /bits/ 64 <2400000000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  
>>  		cpu4_opp_2611mhz: opp-2611200000 {
>>  			opp-hz = /bits/ 64 <2611200000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  	};
>>  
>> @@ -685,22 +685,22 @@ cpu7_opp_2381mhz: opp-2380800000 {
>>  
>>  		cpu7_opp_2400mhz: opp-2400000000 {
>>  			opp-hz = /bits/ 64 <2400000000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  
>>  		cpu7_opp_2515mhz: opp-2515200000 {
>>  			opp-hz = /bits/ 64 <2515200000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  
>>  		cpu7_opp_2707mhz: opp-2707200000 {
>>  			opp-hz = /bits/ 64 <2707200000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  
>>  		cpu7_opp_3014mhz: opp-3014400000 {
>>  			opp-hz = /bits/ 64 <3014400000>;
>> -			opp-peak-kBps = <8532000 48537600>;
>> +			opp-peak-kBps = <12787200 48537600>;
>>  		};
>>  	};
>>  
>> @@ -4013,6 +4013,12 @@ opp-6 {
>>  				opp-7 {
>>  					opp-peak-kBps = <8532000>;
>>  				};
>> +				opp-8 {
>> +					opp-peak-kBps = <10944000>;
>> +				};
>> +				opp-9 {
>> +					opp-peak-kBps = <12787200>;
>> +				};
>>  			};
>>  		};
>>  
> 
> 


