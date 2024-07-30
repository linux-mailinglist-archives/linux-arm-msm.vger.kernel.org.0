Return-Path: <linux-arm-msm+bounces-27358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA6940682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 06:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECF081F21FB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 04:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8945515FCE5;
	Tue, 30 Jul 2024 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EK75cH4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED717339AB;
	Tue, 30 Jul 2024 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722313732; cv=none; b=Jl5Kf5dgKVmJcJEoLQJNigtzOr1PiixF9xvj/+7+Xoi6yu9glbDWAFcjLOfoh1WRROCwqpGuhS++OqjHe1nw4IxC4KKSlAEj96FBfX+zRcKs0Cn5rkWpUq2Q2Joa9UDv23+BvYIMu5cdpsnLALq2jvfNmmQa1ORwhyrcGykqpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722313732; c=relaxed/simple;
	bh=ECDJw41kftKekRgPyFzH6GhtVmcagqZ9r2akdj30Wuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uU9yA4TzyZCYM3RMMP8cLaBO8PiW/wl+w+XrSS5WHi9TNJ5ksruXfAJ9SSxFRzu7KrLTyAhoqjcyMlu3PR8ukeOg0wH/yURa4Ax9EoOaBwjeLyfk7xMbeq8GEhCyo6R4Q8j0ru9nZlA8YXp2wtB3fvM6qlCwNo6Cu72hFnTxk30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EK75cH4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TIiUqJ007857;
	Tue, 30 Jul 2024 04:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOGJ1/3ZiTqZhOAkMmzEjDSTSpshuCZFzsSd4IbyfsU=; b=EK75cH4UHVY0m4UP
	GuWplahCyaslwsh9GoGnFK9tM4A2jAqhoX9VNyxeQHkt3FrA0k+TOVjzvlKnWUsF
	kaRamXpQ1ZLXvBbLqZuf0A5ghe21opeIYZh0tZnw11QPK4V6eeGrLwewINpGzQMN
	WdYD8KFkiwO4TaSkfg4v8kCVvKUdfYPQZv8mwzOesIfzd2fhsH3eRGh6F/i67crh
	FTJPGfmFvE+6DYyn2wEht06zjN7c1MAy6Gwfl+SClHA4m8iL0RKjIQTTKxb2uS6b
	wELWKUXeb1sKp+B1KxIwFsMGNhdWvviL1qo+YDtgl0M3otMimslny//7XmYl5zHc
	U0eRgw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96p6ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 04:28:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46U4SMK4009657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 04:28:22 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 21:28:16 -0700
Message-ID: <d64be833-0e37-49d2-be45-951ec731a364@quicinc.com>
Date: Tue, 30 Jul 2024 09:58:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        kernel test robot <lkp@intel.com>
References: <20240720052818.26441-1-quic_jkona@quicinc.com>
 <d760dfb1-b86b-4d1b-a927-575416e780fd@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <d760dfb1-b86b-4d1b-a927-575416e780fd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PH3hirN91UNy-5wEpXj-xkeTxUWzCeNG
X-Proofpoint-GUID: PH3hirN91UNy-5wEpXj-xkeTxUWzCeNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_04,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=680 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300031



On 7/29/2024 12:57 PM, Vladimir Zapolskiy wrote:
> Hi Jagadeesh,
> 
> On 7/20/24 08:28, Jagadeesh Kona wrote:
>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>> sufficient for clock controllers to operate and there is no need to 
>> specify
>> the required-opps. Hence remove the required-opps property from the 
>> list of
>> required properties for SM8650 camcc and videocc bindings.
>>
>> This fixes:
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>> 'required-opps' is a required property
>>
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>> 'required-opps' is a required property
>>
>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock 
>> controller")
>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera 
>> clock controller")
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> Well, I believe I reported about this problem way before the change has 
> been merged
> and the problem reported by the robot, however it was not taken into 
> account in time:
> 
> https://lore.kernel.org/all/0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org/
> 

Sorry for not addressing this issue in time, I am working on fixing this 
issue now. I posted V3 including your Reported-by tag.

V3: 
https://lore.kernel.org/all/20240730034552.31271-1-quic_jkona@quicinc.com/

Thanks,
Jagadeesh

>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> -- 
> Best wishes,
> Vladimir
> 

