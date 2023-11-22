Return-Path: <linux-arm-msm+bounces-1474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 249307F4344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4541281460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6AB21A1C;
	Wed, 22 Nov 2023 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DZ8GOh8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B255A100;
	Wed, 22 Nov 2023 02:09:27 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM9c5hd028838;
	Wed, 22 Nov 2023 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TgmvFpfDyjjrjHH2iGALQkRvhXzC2NmU7EN6MHLQb/0=;
 b=DZ8GOh8axw7+0wCMcuPV2YprThKXfIuP/H9NCD3UjbavQegFrvFzxnZS/suf6cPjCVyR
 5nFqXPt2GznIDKdE/ema/UBD11QJTa67nRr+jHprUCtY7eGI5nOb33+/AzoChx8Sr6x7
 532hzmBe7lxIuIwv+fbsIUm0LWPcT5MljLcUa1qwJJL3zcx30V7zOkVX6P9BueAS69rP
 moVexRJMV4YCBDV1ChSQxZpv42dt0n3XFhbFb+IlUnk8beYyXqq3l1S+5BlXyx8xY3P5
 ZSWPWdm+vV+ydpI28g4bAQlm5srrKR4Jnaxv+8o9z2hayE+n988cNh6DHQvLqSa2o6qo yg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uh477hm9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:09:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMA9Huf003409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:09:17 GMT
Received: from [10.216.2.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 02:09:09 -0800
Message-ID: <8bb79735-3b5d-4229-b0f4-bc50d61fdba1@quicinc.com>
Date: Wed, 22 Nov 2023 15:38:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] dt-bindings: clock: ipq5332: drop the few nss
 clocks definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-3-a7ff61beab72@quicinc.com>
 <43376552-7e79-4f34-94ca-63767a95564b@linaro.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <43376552-7e79-4f34-94ca-63767a95564b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vYM6GU4uF4S8RyYM9Bo6aBK6sbTyNKj4
X-Proofpoint-GUID: vYM6GU4uF4S8RyYM9Bo6aBK6sbTyNKj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=501 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220071



On 11/21/2023 8:36 PM, Krzysztof Kozlowski wrote:
> On 21/11/2023 15:30, Kathiravan Thirumoorthy wrote:
>> In commit 0dd3f263c810 ("clk: qcom: ipq5332: enable few nssnoc clocks in
> 
> Where is this commit coming from?
> 
>> driver probe"), gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk,
>> gcc_nssnoc_nsscc_clk are enabled in driver probe to keep it always-on.
> 
> Implementation can change and for example bring back these clocks. Are
> you going to change bindings? No, drop the patch.
> 
> Bindings should be dropped only in a few rare cases like clocks not
> available for OS or bugs.

Thanks Krzysztof. Will drop this patch in V3.

One more question to understand further. In IPQ SoCs there are bunch of 
coresight / QDSS clocks but coresight framework doesn't handle all 
clocks. Those clocks are enabled in bootloader stage itself. In such 
case, should I drop the clocks from both binding and driver or only from 
driver?

Thanks,
Kathiravan.

> 
> Best regards,
> Krzysztof
> 

