Return-Path: <linux-arm-msm+bounces-1491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4E7F443B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6AB2815C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9170225571;
	Wed, 22 Nov 2023 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PgjivSZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FFE19E;
	Wed, 22 Nov 2023 02:45:53 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM4gbNh007210;
	Wed, 22 Nov 2023 10:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EivNr+/IA9QMsMf88VokRs4l9XqtSnUpw7bxIohGx9M=;
 b=PgjivSZB9l6zIBUrduUJ64vn+jLJYKaoZYDTTQdapd69vdy4/MaMZYKIDW117G9C9AXQ
 GBuBvTWU8oIKyPg07YoQhlVT2P3tnL8ojcgjhh1/8ZXIilLcYN3iwi/ifrQjgAX/k24j
 dQeBRVO/vl6Ha5+ZGZ88zbeICfg7Afs4/NxBHEt3lRcPd40fm9v8/6Yj7yqijQm5DiQn
 wWWANrUe1jBTpVbon2vRyHMaAKZmpcoOYDEZhJujqBrQS2md/51ek6qrUZRP9CLN/n8x
 th8/r7wu6dHMP+NtmOsvhpgCvm0v9JpIlJ9bsygIdzdIpktQsptcwpPg1QgGNQbYMASk sg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uh8mw96bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:45:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMAjaBU015075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:45:36 GMT
Received: from [10.216.2.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 02:45:28 -0800
Message-ID: <2e86be1b-7923-431c-8220-a17af14a457a@quicinc.com>
Date: Wed, 22 Nov 2023 16:15:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] dt-bindings: clock: ipq5332: drop the few nss
 clocks definition
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-3-a7ff61beab72@quicinc.com>
 <43376552-7e79-4f34-94ca-63767a95564b@linaro.org>
 <8bb79735-3b5d-4229-b0f4-bc50d61fdba1@quicinc.com>
 <d26eae8d-4968-4ab0-bd9b-696d7b3865ec@linaro.org>
 <2e357fcf-5348-4fb2-b693-2d6bb4d58b21@quicinc.com>
 <CAA8EJprH5zhSQoTAfQG3nq8Ud=7MVKKhWt0x7SGyFP9JnxWgBA@mail.gmail.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <CAA8EJprH5zhSQoTAfQG3nq8Ud=7MVKKhWt0x7SGyFP9JnxWgBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DotD8CUEhKcshAbHAxghHCCAWRzGQN7-
X-Proofpoint-ORIG-GUID: DotD8CUEhKcshAbHAxghHCCAWRzGQN7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxlogscore=459
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220075



On 11/22/2023 3:53 PM, Dmitry Baryshkov wrote:
> On Wed, 22 Nov 2023 at 12:19, Kathiravan Thirumoorthy
> <quic_kathirav@quicinc.com> wrote:
>>
>>
>>
>> On 11/22/2023 3:42 PM, Krzysztof Kozlowski wrote:
>>> On 22/11/2023 11:08, Kathiravan Thirumoorthy wrote:
>>>>
>>>>
>>>> On 11/21/2023 8:36 PM, Krzysztof Kozlowski wrote:
>>>>> On 21/11/2023 15:30, Kathiravan Thirumoorthy wrote:
>>>>>> In commit 0dd3f263c810 ("clk: qcom: ipq5332: enable few nssnoc clocks in
>>>>>
>>>>> Where is this commit coming from?
>>>>>
>>>>>> driver probe"), gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk,
>>>>>> gcc_nssnoc_nsscc_clk are enabled in driver probe to keep it always-on.
>>>>>
>>>>> Implementation can change and for example bring back these clocks. Are
>>>>> you going to change bindings? No, drop the patch.
>>>>>
>>>>> Bindings should be dropped only in a few rare cases like clocks not
>>>>> available for OS or bugs.
>>>>
>>>> Thanks Krzysztof. Will drop this patch in V3.
>>>>
>>>> One more question to understand further. In IPQ SoCs there are bunch of
>>>> coresight / QDSS clocks but coresight framework doesn't handle all
>>>> clocks. Those clocks are enabled in bootloader stage itself. In such
>>>> case, should I drop the clocks from both binding and driver or only from
>>>> driver?
>>>
>>> That's not really the reason to drop them at all. Neither from driver,
>>> nor from bindings. You should not rely on bootloader handling your clocks
>>
>>
>> Thanks, lets say if those clocks are not needed at all by OS since QDSS
>> is not used and needed only for the boot loaders to access the
>> corresponding address space, in such case what can be done? I
>> understand, at first those clocks should not have been added to the driver.
> 
> First, what is QDSS? Yet another acronym?

Qualcomm Debug Sub System - which compromises of various debug infra 
like coresight, DCC and so on.

> 
> Second, if they are not used now, they can get used later.
> 

Thanks. I will drop it from driver and leave the bindings as it is.

Thanks,
Kathiravan

