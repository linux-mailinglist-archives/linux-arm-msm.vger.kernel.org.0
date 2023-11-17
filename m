Return-Path: <linux-arm-msm+bounces-955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD287EF15E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 12:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5547E280E08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5E118E10;
	Fri, 17 Nov 2023 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IbjiVYHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB38171F;
	Fri, 17 Nov 2023 03:05:57 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9hFla012456;
	Fri, 17 Nov 2023 11:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XxGBBu1LffqaXiLyEfTCw9koxnp7zedG1KdbtnKStTY=;
 b=IbjiVYHw456nMwmMCtlw4z8XB31CCIHl9gEyBEr1i/k1BdEdVF0HNf4PyQPLdrMLcFz1
 QZTm7YhUwdJmROzzZ1mlmF11+h5YNT3xplmDDTKb8aKWkztX7k8DQKkn3m4lTNqjx0xR
 LR47HTMvcrbMcU0fXxlHvyMyUu/6QYYqOudhgKvwajxllFpl9OdRNTCEm49UjAcezrSk
 4elX0aqWH6nZT1hWt373dXrfARbYiTxqvHv0iNr6ovjNIPMDcFLfw/a52f/7oPkJaIwU
 1jh3EAjMU/yOYiy0m+aVwfEAx/bOco3S9zhirkN7jnOhaVyfwAW9hOZ7kgNjweuYxwHx VQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udw46s617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 11:05:53 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHB5qVl020225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 11:05:52 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 03:05:47 -0800
Message-ID: <afc1277e-1a46-d88c-2b02-58cba756bff4@quicinc.com>
Date: Fri, 17 Nov 2023 16:35:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/4] clk: qcom: videocc-sm8150: Update the
 video_pll0_config
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-4-quic_skakitap@quicinc.com>
 <651e9b17-5c08-4d6c-b318-cacfa2341d7d@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <651e9b17-5c08-4d6c-b318-cacfa2341d7d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ll6NsppdS19rkruZbYGgy0uScNb9gj5q
X-Proofpoint-ORIG-GUID: ll6NsppdS19rkruZbYGgy0uScNb9gj5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=558 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170082


On 11/13/2023 5:37 PM, Konrad Dybcio wrote:
> On 10.11.2023 07:50, Satya Priya Kakitapalli wrote:
>> Update the video_pll0_config to configure the test_ctl_hi and
>> test_ctl_hi1 values.
>>
>> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
> These values are not present on LA.UM.7.1.r1. Can you confirm internally
> that they're valid?


Sure, I'll re-check the values and update if needed while posting v2.


> Konrad

