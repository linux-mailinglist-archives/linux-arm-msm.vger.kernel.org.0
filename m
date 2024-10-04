Return-Path: <linux-arm-msm+bounces-33080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C333898FE64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E3C4B21047
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 08:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E7C13E88C;
	Fri,  4 Oct 2024 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nveU26Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7E85C5E;
	Fri,  4 Oct 2024 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028903; cv=none; b=SRgNPgmMHkqvL11QM5i0q/lkc2obU4nxh98zWxQaVMTPs3z48o9g2OyhBOZb8uKa1LRseFlokGFvbVJ1ztAml3YpEyqs6RWiRpAmM4EBMd0rcwu26YvkQVum9njNLcQsJltOHov6+DJU+HdB7mQAmfRQ+Lp+GQ30BRh5p4SmiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028903; c=relaxed/simple;
	bh=SiiBTUH1y1n3fUWdCqo/59kwXfydc/iVBxK5tNKDGa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ivogtYEuHjnTNoKwnEi+6mdl0nz83HjycyXHi3r2pOiF89oGWdxr6bt+MEDWFXq51/oRkeD+Z8JgaCxsFkshqYnrJo65SCyqLqSUBuTvcK0GxvB8Wd+6o4IBhtbdW+aov5MUW0jTdi1KF1RkCKB9vbVa5mBRNbvv36rlaWA+KTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nveU26Sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493HxkqB032581;
	Fri, 4 Oct 2024 08:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QN15BkjrFFfXZxlQTcHJYqwximCnoWPF0jt+iF41P4=; b=nveU26SzAUZjzbDU
	hFkzzgJG+bwBfobK4DtwPp19D8/Oam3JV9Vo1OBkVe84bwI8l8mJ/9q1ACLcNwGg
	9qGt9NRCgFW4OCOtKSh0rvFoL+Iq6/Jxf6dGLemkO9N9fWrWrmOp47e6uCr/UhqE
	7B9Iw6nYRUqUy7dD12RHCs+Ei6NPIYpm/8JMBgSfY0cGYC4l8LL1WrPGhrBSBpFg
	RWWdkQf7aHDoNoKCR+ap/hbGjh3kFMzOACsMH95TRWQyIPrSTLT7fw715fSjvx5J
	UsjQVALILPJxauYmVj2kp/6ZYTHqM/U98UhYH8c/wbsgangnNQLtIRQYNlqscko2
	9PKblg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f1dy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:01:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494817jW001230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:01:07 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 01:01:00 -0700
Message-ID: <07467780-c84a-442d-b4b8-a96a5c2630eb@quicinc.com>
Date: Fri, 4 Oct 2024 13:30:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Devi Priya
	<quic_devipriy@quicinc.com>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-7-quic_devipriy@quicinc.com>
 <imkcmkqocsyrykaetnl4arxzn5q3x6zavs3ivyaf7mtdai2czz@yplf3jjjpex5>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <imkcmkqocsyrykaetnl4arxzn5q3x6zavs3ivyaf7mtdai2czz@yplf3jjjpex5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d9G4Xr5LXwXbFKHQEb9M3ydj8pWsV4TV
X-Proofpoint-ORIG-GUID: d9G4Xr5LXwXbFKHQEb9M3ydj8pWsV4TV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040057



On 6/26/2024 11:43 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 08:03:01PM GMT, Devi Priya wrote:
>> Add a node for the nss clock controller found on ipq9574 based devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---
>>  Changes in V5:
>> 	- Dropped interconnects from nsscc node and added 
>> 	  interconnect-cells to NSS clock provider so that it can be used
>> 	  as icc provider.
>>
>>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 41 +++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 48dfafea46a7..b6f8800bf63c 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -11,6 +11,8 @@
>>  #include <dt-bindings/interconnect/qcom,ipq9574.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
>> +#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
>> +#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>>  #include <dt-bindings/thermal/thermal.h>
>>  
>>  / {
>> @@ -19,6 +21,24 @@ / {
>>  	#size-cells = <2>;
>>  
>>  	clocks {
>> +		bias_pll_cc_clk: bias-pll-cc-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <1200000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bias_pll_nss_noc_clk: bias-pll-nss-noc-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <461500000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <353000000>;
>> +			#clock-cells = <0>;
>> +		};
> 
> What is the source for these clocks? Is it really an on-board crystal?
> 
Hi Dmitry,

Sorry for the delayed response.

No, the CMN PLL [1] is the source for these clocks. Will remove these
nodes and set these entries to 0 in the nsscc node until the CMN
PLL driver posted with these clocks.

1: https://lore.kernel.org/lkml/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/

Thanks & Regards,
Manikanta.

