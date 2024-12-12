Return-Path: <linux-arm-msm+bounces-41657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B29EDF60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3640163A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 06:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA10218BBB0;
	Thu, 12 Dec 2024 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g26//coB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F0176AB7;
	Thu, 12 Dec 2024 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984668; cv=none; b=ZOlId36FMTUkO0iUMR3XdfVKlhZZtQQreeSDn3jfrvyHfjIDIQmDtdqnMpM2TQXH7AMH3/WduWxvuMq7p9yJZgJUmPHM0XuDNywdvPNNqQ0/OTnIhpY3+VNyxM3v5jjX1IbEKLN8EnWcfYcLcXVHmql9f/WIHWVfPJxt4c/Z1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984668; c=relaxed/simple;
	bh=Ud4pGrCLse3V/ff/8/nhe7TvIzqUA6HiX2Bg2957cR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eGABwcKIX0XpTKrtdWEpqYlRS6Mw4aUlMM3yy+geQ24/YYL7ODWBzAfg7MMYCp5w4R2VXXc3Qnnk1KA6oTYuFcyXcfh534+khWyH0IVQmh8QGck5CuAGw4MywUfMo/Qb+9pob0Ko5XJs10nMzEnR4mH02CUXrD0rvn6tM7te4lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g26//coB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC2rWfA000492;
	Thu, 12 Dec 2024 06:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zpvmK7dAYod61iGUouuL00ruDUGzRAWRU6lPNQQMzU=; b=g26//coBd+gJ8HOg
	EDYbO+uUlws9HqmfTf1ITj/FQw/IDbvuFMLfk/IDXGKYCtKl4HxPF/1fdJXMpv72
	KkwoCXs8xQn3Pbvq3d453Lvq2RFoyvXWGU4GhPYosjEhk5qX9O4swffCF21gYp/K
	9Qua7oeq0v+hXZfq2grAM70ey4W7v2qWyZ4AhDxBO1Wt7TX3vjwDr1uK/mGYiEk8
	Fl9da/oeJhUd7uXhlGpHGzOAyQFUiAWD83qGdrlIlH3IUGEVHtt3ORbIpI6r6Fr5
	Vvq/pKWNrJdG9jN9435nNpcHvwNFEknHEcZGjHf43eEs51Ko12gflsPfDqw96uTN
	GzAEWQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes0dqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 06:24:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC6OKNw004677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 06:24:20 GMT
Received: from [10.239.132.152] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 22:24:15 -0800
Message-ID: <c0aa9b4a-5161-41af-8000-6b6392a53dfd@quicinc.com>
Date: Thu, 12 Dec 2024 14:24:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
To: <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
 <89bbf7cc-db04-4e1d-a1bb-570898eb3449@linaro.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <89bbf7cc-db04-4e1d-a1bb-570898eb3449@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5jkb5Guca0hteEPgG89sA7XB-1OMOMzy
X-Proofpoint-ORIG-GUID: 5jkb5Guca0hteEPgG89sA7XB-1OMOMzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120041



On 12/11/2024 6:48 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 10/12/2024 09:23, Yuanfang Zhang wrote:
>> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> Is there a way to validate those are working fine ?
> 
> Thanks,
> Neil
> 
Yes, these can be verified on Snapdragon 8Gen3 platforms, after boot up,
these nodes can be found under /sys/bus/coresight/devices/.

thanks,
yuanfang

>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>> Changes in v2:
>> - Update compatible for funnel and etf.
>> - remove unnecessary property: reg-names and arm,primecell-periphid.
>> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 165 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 165 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 25e47505adcb790d09f1d2726386438487255824..76620d478e872a2b725693dc32364e2a183572b7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5654,6 +5654,171 @@ compute-cb@12 {
>>                   };
>>               };
>>           };
>> +
>> +        ete0 {
>> +            compatible = "arm,embedded-trace-extension";
>> +
>> +            cpu = <&cpu0>;
>> +            qcom,skip-power-up;
>> +
>> +            out-ports {
>> +                port {
>> +                    ete0_out_funnel_ete: endpoint {
>> +                        remote-endpoint = <&funnel_ete_in_ete0>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel_ete {
>> +            compatible = "arm,coresight-static-funnel";
>> +
>> +            in-ports {
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    funnel_ete_in_ete0: endpoint {
>> +                        remote-endpoint = <&ete0_out_funnel_ete>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_ete_out_funnel_apss: endpoint {
>> +                        remote-endpoint = <&funnel_apss_in_funnel_ete>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@13810000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x13810000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    funnel_apss_in_funnel_ete: endpoint {
>> +                        remote-endpoint = <&funnel_ete_out_funnel_apss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_apss_out_funnel_in1: endpoint {
>> +                        remote-endpoint = <&funnel_in1_in_funnel_apss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@10042000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10042000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port@4 {
>> +                    reg = <4>;
>> +
>> +                    funnel_in1_in_funnel_apss: endpoint {
>> +                        remote-endpoint = <&funnel_apss_out_funnel_in1>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_in1_out_funnel_qdss: endpoint {
>> +                        remote-endpoint = <&funnel_qdss_in_funnel_in1>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@10045000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10045000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    funnel_qdss_in_funnel_in1: endpoint {
>> +                        remote-endpoint = <&funnel_in1_out_funnel_qdss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_qdss_out_funnel_aoss: endpoint {
>> +                        remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@10b04000 {
>> +            compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +            reg = <0x0 0x10b04000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port@7 {
>> +                    reg = <7>;
>> +
>> +                    funnel_aoss_in_funnel_qdss: endpoint {
>> +                        remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            out-ports {
>> +                port {
>> +                    funnel_aoss_out_tmc_etf: endpoint {
>> +                        remote-endpoint = <&tmc_etf_in_funnel_aoss>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        tmc@10b05000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +
>> +            reg = <0x0 0x10b05000 0x0 0x1000>;
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            in-ports {
>> +                port {
>> +                    tmc_etf_in_funnel_aoss: endpoint {
>> +                        remote-endpoint = <&funnel_aoss_out_tmc_etf>;
>> +                    };
>> +                };
>> +            };
>> +        };
>>       };
>>         thermal-zones {
>>
>> ---
>> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
>> change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8
>>
>> Best regards,
> 


