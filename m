Return-Path: <linux-arm-msm+bounces-23581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C67539124BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80DC5289C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614AD173357;
	Fri, 21 Jun 2024 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QhH6jBuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46F1527B6;
	Fri, 21 Jun 2024 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971596; cv=none; b=dKijNnFk5CLIgKOsmGPHaMOkmG4s8zmAcSUvGhYDz7R9lkzUSRh31Rwb7Ca57c12o1AHw9NiMaQRW491tViazuzwRtWsLvhhJdzsWr0MnGeF3mzpC6Ka8KK/0BHFnVXj8RV/QWCmMPqv1GDq6yRpP/dz+nQsKqvt2Xs4xZKEgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971596; c=relaxed/simple;
	bh=l2igSO8O7G5RzRxQ3yZ8xZyAbetAJaOFvPFrxwmzk0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JJuLb5LJ77KwskU6rsgj8eq0OfZXwWdnR+3lfHj661J+vnvLx1PZ/1MX8HIppqCcVfe/6Lz7bEK1jwZZGIY+V+uc/yaKR56677Zb08ib9W0u5GNX32OiEDNtk2dbvGUfqkdSFKEsUg1LWVYOH4IvPajbTolruwAWW1KpNyqFhHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QhH6jBuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LAr7fL028340;
	Fri, 21 Jun 2024 12:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/3Z1xfOkFSLFLCdSeQvAYqkVHrsu2wKwKESRWjc5+k=; b=QhH6jBuZoZTJjgXV
	f6yPhW4u4+45hYJ/VweBpBp5h6lGzj+gVIpZSPBox+VIgHVBSJq6aseHUvzTgxsR
	3xAXTPG2d/T0jjMEEu6biBbsq9nzTe4uTUV8g0pvaJkY8E0CUx9mayrC/tpwootx
	KTu5SkrmDQZbHEW6uaVnhVRKQO9rh9WJQUXWw14VH+cZVCxut9mvGPmoY3UPCkv1
	nAyFzHI0+bbR0fDMoQVAOQH9QY1nzmDViUsFrjcfKhb0R02EBUMwSJ3ya+v9DRzx
	W4udRTpn50WW5rzEk1vJ1HFFcNeEAXrS5RqrwhiuupCDhRarByqqskh8Ju91jFPc
	9ig1/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw85e052b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 12:06:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LC6TT0001969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 12:06:29 GMT
Received: from [10.216.44.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 05:06:22 -0700
Message-ID: <a0847448-56b4-4793-bb17-9e40a0a9feac@quicinc.com>
Date: Fri, 21 Jun 2024 17:36:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
 <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
 <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VN2Om5P9v0-yHPkc8dt3uYXaDzjCLmLF
X-Proofpoint-ORIG-GUID: VN2Om5P9v0-yHPkc8dt3uYXaDzjCLmLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=658 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210089



On 6/10/2024 11:44 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 10, 2024 at 02:41:10PM +0530, Taniya Das wrote:
>>
>>
>> On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
>>> On 31.05.2024 11:02 AM, Taniya Das wrote:
>>>> The RCG's clk src has to be parked at XO while disabling as per the
>>>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>>> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
>>>> clk_branch2_aon_ops to keep the clock always ON.
>>>>
>>>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>
>>> Should the same fixes apply to 8350?
>>>
>>
>> Yes Konrad, it is applicable for 8350 as well.
> 
> Can we please get the corresponding patches (as a separate patchset)?
> 

Please find the patch.

https://lore.kernel.org/lkml/20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com/T/#u

-- 
Thanks & Regards,
Taniya Das.

