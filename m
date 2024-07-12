Return-Path: <linux-arm-msm+bounces-26036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A392FA52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 14:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D5BB21168
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C70C16D326;
	Fri, 12 Jul 2024 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RwVl0OO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D513D88F;
	Fri, 12 Jul 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720787510; cv=none; b=Vot2Y39FKywrEwEVTmPADe4W/LfFu1+dO+3Bayl0c34KjbwdFQwEbYOFHiyvALwVl3YwrBMGe+49gFVhPpeg4Ryswp7kvkyecdYKnYHBcRg/CO0F8IR0Y9L88TcVmabMbikMN+uCIBYOFJzHJkd+0ItOnqIWGVua63kM5F6k6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720787510; c=relaxed/simple;
	bh=AQ0ZiZwkcI4kLvbzHDhRwfoyIG57J2j0XVFdAA1VfxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JMJSq14uQ98fXnKkz7DLjrEGL9kPsv5aiwMYja5ALrGBq0hG7rwRobCclj+qn8G0Tr8Okb3/qGHj9hSYNLOE/RhggNW60YRP7Wfsqoux6GMSZQufbyy0A/nj3hfaxzbmyAlKYITdp9QjNvhvgymh7LnB6cAtcZjjQrG6rq731Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RwVl0OO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CB9Xmh026406;
	Fri, 12 Jul 2024 12:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oO1n3vzSenkoR8gCUBXoFqXfuXYNWXZgUhkfVcHQaZg=; b=RwVl0OO0P8EOEABO
	5VC2Rg8GRUuDP0wdoOQXkcfJXGrVFMGNS5PiiPqZuolEe1na2nDpj0+IZgynfxYL
	/uyc98fMua+U4cR7hncRnAznRrQNjEa9Ez7Xp806aJ065wJS5g6FgYxGCHA4pI3j
	GmaeklqhWreEUZosHLIhjzYtS+axuFGAcdsGrYvX2F0BBvfpRlmMZMU6Q8fQxbXF
	xiIWr+FGd7umehiYQ3+i3kp0xMJfQtc0DaQKxmRiw0c1w+gRlkfS3r2vo8QddPio
	69L1GccASYHDLkGx/4ko+Zv+7L8Z+BaKHHFcMMUzO2n6tbWk3RU8d5oolnowdpey
	4J4Pdw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ar3fhmug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 12:31:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CCVc4F021263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 12:31:38 GMT
Received: from [10.216.11.166] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 05:31:33 -0700
Message-ID: <46e6f1f0-d244-4e53-99ce-9fee339dc4de@quicinc.com>
Date: Fri, 12 Jul 2024 18:01:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
 <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
 <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
 <9c3de930-47b7-45a9-bf7e-6e506ea2accc@quicinc.com>
 <8f7cdb31-c50d-4690-b878-518bad545612@linaro.org>
Content-Language: en-US
From: Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <8f7cdb31-c50d-4690-b878-518bad545612@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y-7PqjFM1-lyow_Xs1sQSEEA5t89iTkB
X-Proofpoint-ORIG-GUID: Y-7PqjFM1-lyow_Xs1sQSEEA5t89iTkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120085



On 7/12/2024 5:52 PM, Konrad Dybcio wrote:
> On 12.07.2024 11:53 AM, Ajit Pandey wrote:
>>
>>
>> On 7/11/2024 3:25 PM, Konrad Dybcio wrote:
>>> On 3.07.2024 11:16 AM, Ajit Pandey wrote:
>>>>
>>>>
>>>> On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 6/11/24 15:37, Ajit Pandey wrote:
>>>>>> Add device node for camera, display and graphics clock controller on
>>>>>> Qualcomm SM4450 platform.
>>>>>>
>>>>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>>>>> ---
>>>>>
>>>>> None of these nodes reference a power domain (which would usually be
>>>>> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
>>>>>
>>>>> The current upstream implementation only allows one power domain to be
>>>>> scaled, but that's better than none (see other DTs for recent SoCs).
>>>>>
>>>>> Konrad
>>>>
>>>> SM4450 doesn't support MMCX and CX/MX domains will remain active so
>>>> power-domains property is actually not required for SM4450 clock nodes.
>>>
>>> It's not only about them being active.. some PLLs require e.g. MX to be
>>> at a certain level, or the system will be unstable
>>>
>>> Konrad
>>
>> With active I mean CX/MX rails will be default running at minimum level required for clock controllers. Adding power-domains property for CX/MX rails is like a redundant code as that will also scale such rails at default specified minimum level only. Also we hadn't added such property for other targets DT nodes to scale up CX/MX at minimum level.
> 
> What I mean here is that, the minimum level may not be enough. In such case
> you would also add a required-opps = <&handle_to_rpmhpd_opp_level>
> 
> Konrad
> 

Apologies, but could you please elaborate the use-case where minimum 
level isn't enough ? I guess for clock controllers configuration min 
level of CX/MX would be suffice, client will anyhow scale such rails to 
higher levels depending on their use-case.

-- 
Thanks, and Regards
Ajit

