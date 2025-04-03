Return-Path: <linux-arm-msm+bounces-53073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25260A79B17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 07:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB6CB1753E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 05:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F1A197558;
	Thu,  3 Apr 2025 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y2YEE+8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8218DB16;
	Thu,  3 Apr 2025 05:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743656899; cv=none; b=DkUhJP35Zq87sZu74Jj/AgsK22T+K1YI2K6rhH+2c5C3Qv78vi9UtAGZMcYKYPCRFtc4wRIHR6VDMKRiN3CFqBlOBinJ7eqh7BqGglTcf40WBd5Fd6SKgzRsD6NBaFR50ln0qb4ICcBXoZe7hGZ6jE+vVPSRd/70xXEXllALYUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743656899; c=relaxed/simple;
	bh=2gdDUGzlGVNBfMhF2TU8tbvOT7CrmGcKCSnB4smnKaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AL9NjtsR1ZWmEq7xdcyKkTI/UWt/Wgvq3IfIAAavwqynpyUr2P3f1jlbXEa9OPX9VR6fxxMhYQhss0rrolNqxjXb/AMMi55+6J7xMTtgK5JgPBP4WAGWc5zEvVWC7KZJtK3tUkN+VxT6ljEAxei35vn5NoCpDEUv8QOt6Ful5hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y2YEE+8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5333mlAm031730;
	Thu, 3 Apr 2025 05:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xje1eMsyvhZuOhbcBq7OJz15zbYdM9P9BLGcPsjMtsA=; b=Y2YEE+8G03TLSJs/
	SpdKPNbvm2/0cA6FxILGdXD5Noq3jTvbh1X/0aTg47D36CbKXiU/Vvb2vBpCUuhE
	H7IzqCeLDz6ZyOMnu91NZE6gocVhNIkSzqo2kVpJciRRY1C7Ks8qSNmsezHeFwMd
	L+qrHr87xCfIA7k4mN0gUH7yqUTWv+KW5YsSfnkIPom2zjPo6ydtdEfV+cSvc1P/
	IrB9lQ4NguoJlqSKExpSmwHUx+ZUa6EH+lIO3EFbJ3VjUNklsVGmp73WrKTbOXvK
	zQh6bdk17iG1DPacaaVcEYMCvEgQapIDl0JGutUhP37mzv8XiRx4S54OByi/cacV
	WUYveg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7yndt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 05:08:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53358CVw007839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 05:08:12 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 22:08:08 -0700
Message-ID: <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
Date: Thu, 3 Apr 2025 10:38:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ee17bd cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=kx6ie2_k--WTlmwe1CQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wdy5-CVMtC4Pm24fZ-ny0zLZ7rijNuCw
X-Proofpoint-ORIG-GUID: Wdy5-CVMtC4Pm24fZ-ny0zLZ7rijNuCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=765
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030025



On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V6:
>> 	- No change.
>>
>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index 0fd0ebe0251d..1f89530cb035 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -82,6 +82,32 @@ &dwc_1 {
>>  	dr_mode = "host";
>>  };
>>  
>> +&pcie2 {
>> +	pinctrl-0 = <&pcie2_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> 
> 
> No wake-gpios? Please document it in the commit message.
> 

Hi Dmitry,

Thank you for reviewing the patch.

The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
I will document this information in the commit message and post the next version.

Thanks & Regards,
Manikanta.

