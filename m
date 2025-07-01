Return-Path: <linux-arm-msm+bounces-63282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D794AF02AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BEA2188AC41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA414280332;
	Tue,  1 Jul 2025 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MaDyx/td"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF69B27FD6D;
	Tue,  1 Jul 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393630; cv=none; b=pggOhy1/mQr5ejyQUU1dufdo5Q8bPDNFpCSfwpQhwBOsW+hE0r+sU5CNj5JNQGNEC5L0zvQCtF7cgeX9Y56lCmo3YN3eUL9Hbq5aRs3jhjC+PCYDJImJ9Jnx0JK89x5+/cIby9gg0lDVWqK2EMgm+8eP0h+RH/df1tabo4bZ+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393630; c=relaxed/simple;
	bh=yNB84JbWq3w18P6XUSeSuM3LsGvmrzGS4ra6BiFoz7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ojOJgvnGL/qxiT90KGkWQwNS5bt1efIo79EG358a7op4jil3INmCuxZXhk+jWKWALxJoIRLDjGKVr06ayVffEDLpLkwLp0/K3kFTE2VzD2Rf43HdTBL7zOnuRv0fj8eSChttb57X7MvQZ/shQfvQY8bvZ+/GpEIYX/A564lgP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MaDyx/td; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561H4FRI002240;
	Tue, 1 Jul 2025 18:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMmXeWJLOsQ1VNY8cW9v50pEpisDdJ7oVLjDPbnYtSc=; b=MaDyx/tdkZdcf+AF
	spKtwfF0F+oVnPrMjj4EKRe41OYzNi6cHRvYxZNdh7AvGxSgKmyggkaAuoubAEtE
	/7EqtBD2/KjdqfrGcs2wRSq8/tUxWzY3IeeuL5EmrjtCM+/ph59C5132ch8jMtv/
	HuQNuSpoJJqwstjSUgIES5eN+Z5SSKp+WjFbQucTVcsvX8IcdOPreWNR6MFMgL49
	wjFQOys0vPku+xRr68XSDGGHNKzBGXQBnkKN5a5zFjIK1U+Pniv0BadwiW5AS7Sb
	yUsvOVR6Ee46rE+ZmQCTgGkD4SPl6HVtp5TlY/nMlbztrlNt0Y0G2Lf9fFHuIvvY
	7ogtxA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcssd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 18:13:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561IDiJC026012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 18:13:44 GMT
Received: from [10.110.47.15] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Jul 2025
 11:13:40 -0700
Message-ID: <0c0e3732-54e3-4a4c-ac44-3175180298fd@quicinc.com>
Date: Tue, 1 Jul 2025 11:13:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add support for two additional
 DDR frequencies
To: Pushpendra Singh <quic_pussin@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kernel@quicinc.com>
References: <20250701074334.1782967-1-quic_pussin@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250701074334.1782967-1-quic_pussin@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yOk5qIZYBt9g6HCkT57F9g9n6cDL8mtD
X-Proofpoint-ORIG-GUID: yOk5qIZYBt9g6HCkT57F9g9n6cDL8mtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNSBTYWx0ZWRfX7RecqPZvOGm1
 rDIBDsL3ZisQoAR4Dce5ARRcojlXLdYKQyroCl56F2iBPpEHwW2+ebO5LBPykJUGYMdfMV10hN2
 ozH97mrhqI+BETppj5cKV0tTORxRZ7GLlwbsJL75C6GY2ps6efofF0GH17JyU0Ydis3Uszi2Nlk
 yIiqkLwc1mMXaQ8bqLhbbuGU7cD2oPx8wWqnbxa9boD2jxAY+YGxHEvO6MngtXJOhKhAsJxH2de
 hzb8HbAG+DQ+T4ebq/CItfAsBGjdrHtrh5/+avFdDOjyRgZgkUp0aLeDkuU78fXL7/5vCj3C4L9
 d2en7FDNBcKruQqUS/fHZ5qPerXmXRvAuofoakCSP2pXTZPyIZDDcKVjYurzZ10uzelw4IMC+8W
 QKRXes0rOEJrQptQ1ebZDsIjNab9369otC15byVXQBjILXZJvcfS2EpVUACoaE/fw8Xo8aVI
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68642559 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=J310i9rcTv6EiX6W7m0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=946 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010125

On 7/1/2025 12:43 AM, Pushpendra Singh wrote:
> Cc: kernel@quicinc.com, kernel@oss.qualcomm.com
> 
> The SC7280 SoC now supports two additional frequencies. This patch
> add those frequencies to the BWMON OPP table and updates the frequency
> mapping table accordingly.
> 
> These changes do not impact existing platforms, as the updated mapping
> only affects the highest OPP. On any given platform, this will continue
> to vote for the maximum available OPP.
> 
> Change-Id: Id3a91e065c49848d9af18e5c3edee0836cb693e5

Why Change-Id? 

> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 64a2abd30100..cb945abf0475 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -620,12 +620,12 @@ cpu4_opp_2208mhz: opp-2208000000 {
>  
>  		cpu4_opp_2400mhz: opp-2400000000 {
>  			opp-hz = /bits/ 64 <2400000000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  
>  		cpu4_opp_2611mhz: opp-2611200000 {
>  			opp-hz = /bits/ 64 <2611200000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  	};
>  
> @@ -685,22 +685,22 @@ cpu7_opp_2381mhz: opp-2380800000 {
>  
>  		cpu7_opp_2400mhz: opp-2400000000 {
>  			opp-hz = /bits/ 64 <2400000000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  
>  		cpu7_opp_2515mhz: opp-2515200000 {
>  			opp-hz = /bits/ 64 <2515200000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  
>  		cpu7_opp_2707mhz: opp-2707200000 {
>  			opp-hz = /bits/ 64 <2707200000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  
>  		cpu7_opp_3014mhz: opp-3014400000 {
>  			opp-hz = /bits/ 64 <3014400000>;
> -			opp-peak-kBps = <8532000 48537600>;
> +			opp-peak-kBps = <12787200 48537600>;
>  		};
>  	};
>  
> @@ -4013,6 +4013,12 @@ opp-6 {
>  				opp-7 {
>  					opp-peak-kBps = <8532000>;
>  				};
> +				opp-8 {
> +					opp-peak-kBps = <10944000>;
> +				};
> +				opp-9 {
> +					opp-peak-kBps = <12787200>;
> +				};
>  			};
>  		};
>  


-- 
---Trilok Soni

