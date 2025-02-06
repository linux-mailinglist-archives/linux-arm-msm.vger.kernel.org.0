Return-Path: <linux-arm-msm+bounces-47004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB76A2A1B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFAD18884B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C81FECBD;
	Thu,  6 Feb 2025 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yp060fIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B961FDE08;
	Thu,  6 Feb 2025 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738825328; cv=none; b=okfjyiRjOWXr+x2mgB4qYxh9TmAFI0vb7myIsNdqhAWJmRxa++49Dv8M0fGkNHlYYkG1jhWRLpJ10FE9ypNi9Kb4QTgJ+Xg54fUcH3YCoyE7NbYe/28R/qr/kNDejHCiDIRz71KVmA+MdTztAiAQPHmKICQPLRmXkJGHlt+nhSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738825328; c=relaxed/simple;
	bh=2GiFkygq3de9GLjZ4hEtVqwNNmejJsX0fXM8BEvQD+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RPLpLRKuMwGNw4jCBX6WUyHlZaQQAd7ryeF2Kl3xS+NRKFzoWJj4BVKSPKCYXkrSKdJKaXzjIWNMXoYxkR/gKnoE2BplmkIHUNflt9j3QH5rogqwe8SLM5innFJfY+PU2mQagOAOhwc7QHYOnltKVitfcifGMCR55Je3idMeUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yp060fIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515J0TJv031638;
	Thu, 6 Feb 2025 07:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrAPzN3R+g1+r+81eLhRZv0SycNO8ZdkZdwOO3LB4P0=; b=Yp060fIwEXZ2Lmia
	I6xC/YsvbTDluwBhMfCfrp2hjbbBVCu8BlrYf7D12R1+/z/0KMJGO8jox3N5Xe5e
	Q1QqKHaOvy2aLbSLhA+Mr6/5AvuMjLuaqRhtnq6IFN0ZcNA/KhH/GXPlm8+sSh5k
	tPpcayFuwe7TGdxLouIxrWMpnnt5HUkqfElJXDiVySnzqOz9x2N/yrpc3erJsTeW
	XhF+NltzsWBqcVy5QDRhTLAZ/Ie7nJOu2au2uKuQXzFB1ha+88JBb0vIrgT9dt9u
	DX8lcAmoFPJ5xO8kZtiKqmTLM2/mNgFNGEFsg+FGFxOO7cYNA1RUvKHxkO2PxfWy
	6ZXQOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mds2hbb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:01:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51671i9h019165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:01:44 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:01:36 -0800
Message-ID: <1cac47ba-f33d-4d2b-8808-c56012b5bbaf@quicinc.com>
Date: Thu, 6 Feb 2025 12:31:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <angelogioacchino.delregno@collabora.com>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
 <jhykmuvgltvuqf74evvenbagmftam2gaeoknuq5msxop4mkh65@dya6vvqytfcx>
 <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
 <befd6574-b9f0-4483-a767-684a729cfde0@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <befd6574-b9f0-4483-a767-684a729cfde0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WdhfDpuHSihYg8CzZyg0zXeFFz5NP4Q0
X-Proofpoint-GUID: WdhfDpuHSihYg8CzZyg0zXeFFz5NP4Q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=709 bulkscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060057



On 12/30/2024 8:18 PM, Konrad Dybcio wrote:
> On 28.10.2024 7:25 AM, Manikanta Mylavarapu wrote:
>>
>>
>> On 10/25/2024 11:21 AM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 25, 2024 at 09:25:18AM +0530, Manikanta Mylavarapu wrote:
>>>> From: Devi Priya <quic_devipriy@quicinc.com>
>>>>
>>>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>>>> devices.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/
>>>
>>> These tags are incorrect. Please read the text of the email that you've
>>> got.
>>
>> Added these tags since the dependent patch [1] was included in v8.
>> Please let me know if this should be removed.
> 
> These tags are useful when you submit a faulty patch, it gets merged
> quickly, and only then the robot reports it. In that situation, you
> would be expected to send a fix, including these tags to credit the
> robot for catching the issue.
> 
> Here, your patches haven't been merged yet, so it's not applicable.

Hi Konrad,

I apologize for the delay. I will remove the tags and post the next version.

Thanks & Regards,
Manikanta.


