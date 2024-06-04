Return-Path: <linux-arm-msm+bounces-21560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E358FAD11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544871C20FB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 08:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2581419A2;
	Tue,  4 Jun 2024 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0wdGM8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB14446CF;
	Tue,  4 Jun 2024 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488309; cv=none; b=Z3bxqgB5gtF8YGxkjxvvwLCtizGeVq/VDhWtl4MkIJ0p3XPspjIYapKbveZnAbdmFqRTXcHqmk2eDFuR2vxVopTNrQqvvhFB1J7kwP+4dT/qW4QFBdrlCA4vjOHxcRawiEVI1wX/YKWFr9lZw/loORJz4IdZpnGhXUbStcQpPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488309; c=relaxed/simple;
	bh=vt4WDDkQwQuey6fdhp0ZJrmjjzNYNHKwle5iIbTHIJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GBxJvLfeSi2dfaUn5Cn+3ZnBch9FBNsHQ0f4bW+BfkIZiSrDDUgaa2x5JWW94ZIBV1ebAdJlmf6Vj5aOgEtl7mH8u3IsYzNp/bfVItyZCPUFYLOdaDXBYUgeYgv/aAn9zy/EpUE2Y55GK8MCpiGiCNzvbv+2BNW6+9DxjPzHTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0wdGM8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453LRCTW020306;
	Tue, 4 Jun 2024 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhrxHQx73Ohf0wePaJV5JlyhygXFHUzgCIHHqINdo6o=; b=a0wdGM8cfYgYXkRK
	/WPP9NvnU7TUrF9jpOlk/S+YGC0SyMNIx6Cljhn1Awq2nKBdnJ9IjM26P772QRqs
	gchWmu2v4QckjHMK6tpWvQNUOJjhJ9rgnO1sNJNa7Ae0ojhp7sXgVxbcVNDuJVPJ
	RAfncbebfwwHqUrGZfogGf5obEgAHX4GF1ahzIBE/e5ULatNYgQOawGepDMh61zx
	wGA/MfsE/hGxAK1fmC/jmd4Xq4Uumk//5Hh198jP2UxW7yabjxEbBxlf+NF0tE43
	/3LpIdnidYITzWY4W/8lsMIxH1NFvEnxDJ1c/5kTtNslyjf4eUPtLi9pwIGJ4/3R
	8rUayQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4apc6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 08:04:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45484qHb001856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 08:04:52 GMT
Received: from [10.216.52.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 01:04:47 -0700
Message-ID: <e0b102b6-5ea5-4a86-887f-1af8754e490b@quicinc.com>
Date: Tue, 4 Jun 2024 13:34:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed
 instances in park mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke
	<mka@chromium.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Doug Anderson
	<dianders@google.com>, <stable@vger.kernel.org>
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
 <20240604060659.1449278-2-quic_kriskura@quicinc.com>
 <le5fe7b4wdpkpgxyucobepvxfvetz3ukhiib3ca3zbnm6nz2t7@sczgscf2m3ie>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <le5fe7b4wdpkpgxyucobepvxfvetz3ukhiib3ca3zbnm6nz2t7@sczgscf2m3ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hqZ3vWWdleSptXUoxf2AwkCGzMLEXtJO
X-Proofpoint-ORIG-GUID: hqZ3vWWdleSptXUoxf2AwkCGzMLEXtJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=661 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040064



On 6/4/2024 1:16 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 04, 2024 at 11:36:58AM +0530, Krishna Kurapati wrote:
>> On SC7180, in host mode, it is observed that stressing out controller
>> results in HC died error:
>>
>>   xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
>>   xhci-hcd.12.auto: xHCI host controller not responding, assume dead
>>   xhci-hcd.12.auto: HC died; cleaning up
>>
>> And at this instant only restarting the host mode fixes it. Disable
>> SuperSpeed instances in park mode for SC7180 to mitigate this issue.
> 
> Let me please repeat the question from v1:
> 
> Just out of curiosity, what is the park mode?
> 

Sorry, Missed the mail in v1.

Databook doesn't give much info on this bit (SS case, commit 
7ba6b09fda5e0) but it does in HS case (commit d21a797a3eeb2).

 From the mail we received from Synopsys, they described it as follows:

"Park mode feature allows better throughput on the USB in cases where a 
single EP is active. It increases the degree of pipelining within the 
controller as long as a single EP is active."

Even in the current debug for this test case, Synopsys suggested us to 
set this bit to avoid the controller being dead and we are waiting for 
further answers from them.

I can update thread with more info once we get some data from Synopsys.

Regards,
Krishna,

>>
>> Reported-by: Doug Anderson <dianders@google.com>
>> Cc: <stable@vger.kernel.org>
>> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>> Removed RB/TB tag from Doug as commit text was updated.
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 2b481e20ae38..cc93b5675d5d 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -3063,6 +3063,7 @@ usb_1_dwc3: usb@a600000 {
>>   				iommus = <&apps_smmu 0x540 0>;
>>   				snps,dis_u2_susphy_quirk;
>>   				snps,dis_enblslpm_quirk;
>> +				snps,parkmode-disable-ss-quirk;
>>   				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>>   				phy-names = "usb2-phy", "usb3-phy";
>>   				maximum-speed = "super-speed";
>> -- 
>> 2.34.1
>>
> 

