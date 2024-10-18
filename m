Return-Path: <linux-arm-msm+bounces-34934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6519A3C2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E401C215D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829892040A3;
	Fri, 18 Oct 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AfFlT7H2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F0204091;
	Fri, 18 Oct 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248664; cv=none; b=XSK5DVbCPxwScVK8m57Wd4WXB9WNbFl8wdqetlW3L2iCSd8sJzCKUaz7jea+BFGa90MQPYXGOu79Oj06X+3twvwGCf/cuZGmCW66RNKr03PQ1YQ5Eml8fhage0LwcW+fNo+WIRimMU6xnQ6J6adOtAlMl9na/Y2YyuJ/Kfdx3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248664; c=relaxed/simple;
	bh=tBFnHSDdOhzLjrQwe0jISzdmTRPCueB4BcNOtgLI+3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gt+Jg4WbrNKq2l+h5G0PtwbngaBbbPo6Ujda2saUCzttxDQ0xNbK0k7EsbFyuwr2NW534Mu90/1qz9feSGBsSpW0n975XovFUGbvNr5YPG7xglE4fYArgyNgS3tazb2PRwn8DDboL/Od9D+XU3X8AiuPxwARagQNG4FwXlEuxWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AfFlT7H2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I0NOQF006343;
	Fri, 18 Oct 2024 10:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izzVpy94D2rcOVSHLBZnR3I6g+orYHLyLlH0uKEqglw=; b=AfFlT7H2jpEJj3TY
	mS5Z0zh+Bn+swokUTVq/Z1SWxp9fa1YTJNcxiK4Aw31asxaushpkPKAg7RdDJoff
	Xz70XsNuNfnHKvWOLlSzzfnekX0A8VT/UP6/fMtMAdEm3Xa6N37EaNYRt66HGNGW
	93t//EQ7OedMk4n7D2XV+twgQRuYMBEQ748jfxKpIHlX0mEURaDnNK1+AyDk5htX
	3dJQyzQ+iaTN0+0o820smHPoI1rugXx1vWOU2iqD7MtBx0SdFPF/2eDWbBobsJVS
	G10KFGXovuZjRcIJYdhehQzduFLFW7eGwj5uDMoHoMs3yupx/BnMkW1yZV1EIxPl
	cNF1zw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bd3asjfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:50:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IAoqkC006177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:50:52 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 03:50:48 -0700
Message-ID: <67795327-74d5-4b5d-b778-bd0f90c58e97@quicinc.com>
Date: Fri, 18 Oct 2024 16:20:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kalpak Kawadkar
	<quic_kkawadka@quicinc.com>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
 <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>
 <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
 <5904599efffa7ce747772c0dcc1c897b.sboyd@kernel.org>
 <scwpcovoazmd4yrwtczghx4e5eopqoknknqzcr23wjve65bmxh@ih5efkh53g3h>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <scwpcovoazmd4yrwtczghx4e5eopqoknknqzcr23wjve65bmxh@ih5efkh53g3h>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: etGaqT_EFU2sNd1-erJG_mizPIeoWCZz
X-Proofpoint-ORIG-GUID: etGaqT_EFU2sNd1-erJG_mizPIeoWCZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxlogscore=860
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180069



On 10/18/2024 3:26 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 17, 2024 at 03:28:13PM -0700, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2024-10-17 15:00:03)
>>> On Thu, Oct 17, 2024 at 11:10:20AM -0700, Stephen Boyd wrote:
>>>> Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
>>>>> From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
>>>>>
>>>>> Add support for SREG branch ops. This is for the clocks which require
>>>>
>>>> What is SREG? Can you spell it out?
>>>
>>> Unfortunately, no idea. This is the only register name I know.
>>>
>>
>> Can someone inside qcom tell us?
> 
> Taniya, could you possibly help us? This is for gcc_video_axi0_sreg /
> gcc_video_axi1_sreg / gcc_iris_ss_hf_axi1_sreg /
> gcc_iris_ss_spd_axi1_sreg clocks on the SAR2130P platform.
> 

SREG(Shift Register) are the register interface for clock branches which 
can control memories connected to them.

In principle these SREGs are not required to be controlled via SW 
interface, but on SAR2130P, we had to control them to flush out the 
pipeline for users of Video.

We are looking into the feasibility of extending the current 
'clk_branch2_mem_ops' and can share the patch.

You could also drop these clock interfaces for now to move ahead, as I 
do not see VideoCC support and bring them as part of those Clock 
controller support.

>>
>>>
>>>>
>>>>>          u8      halt_check;
>>>>
>>>> Instead of adding these new members can you wrap the struct in another
>>>> struct? There are usually a lot of branches in the system and this
>>>> bloats those structures when the members are never used.
>>>>
>>>>        struct clk_sreg_branch {
>>>>                u32 sreg_enable_reg;
>>>>                u32 sreg_core_ack_bit;
>>>>                u32 sreg_periph_ack_bit;
>>>>                struct clk_branch branch;
>>>>        };
>>>>
>>>> But I'm not even sure that is needed vs. just putting a clk_regmap
>>>> inside because the clk_ops don't seem to use any of these other members?
>>>
>>> Yes, nice idea. Is it ok to keep the _branch suffix or we'd better
>>> rename it dropping the _branch (and move to another source file while we
>>> are at it)?
>>>
>>
>> I don't really care. Inside qcom they called things branches in the
>> hardware and that name was carried into the code. If sreg is a branch
>> then that would make sense. From the 'core_ack' and 'periph_ack' it
>> actually looks like some sort of power switch masquerading as a clk.
> 
> Ack.
> 
> 

-- 
Thanks & Regards,
Taniya Das.

