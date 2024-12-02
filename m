Return-Path: <linux-arm-msm+bounces-39789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616909DFB60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2794B281F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E941F943E;
	Mon,  2 Dec 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gNcy4KTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C05481A3;
	Mon,  2 Dec 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733125197; cv=none; b=qcpD/KWVza3F57M5atfwQiOW+krUrF5JeYdLfczD34rAhkW8PqaYOA+bs1l1mflFq6QxJ0147EaoH0n8mlJyDJlD8t0bw1/1R87KxHhfU9cGj3DmsqrWX26Nko0hndD+X08NgXv6SYBhxrI0DkBLFQ+ZZ0CESDfuQ2HlI+eSpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733125197; c=relaxed/simple;
	bh=5T4sTb3Uzdwg2h+7xoieqIm7C7OFPeMH+pp1kAWhgvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KmnjI59Ze05dMUDC/SatF03h7pr6MZ2TcySNa4AmIWV+LPf0EMvwAQJlL7D+1xFZVcJ1dQC3nlXrliQBdtAyDoPZhV0BbTuXaqxieKtz1faQ/3NhRPpgvleiOrsNWtrigLV/y/5VIny1SX3MCr1zvdY1tHJmZiwiO8079AkTB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gNcy4KTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B20NjS7029512;
	Mon, 2 Dec 2024 07:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmbBkIJWPy50S1o4OXr/O+AXL0d5Da8umTyIkAYQzj4=; b=gNcy4KTSMw/o/IH3
	3piD1VWdfuzSKlZ1yZyo7J7uK+w2uOBznZkiTtIR7brlShGe4hN0v8Flpmr2mAah
	k3HrFiSXV+SVQ3y3QiTu8WMkCsiMjnCbqw6PwDQvxMca39kn1oRV1GBXTbzLIui4
	Q9O7SLpsMv1fke9RoLRSjvKWivBgIMXeBuxEQ0D0yn8LRXyqK6c9lnaWTFbjPtij
	hINRWdTqgmd4N9ZjY6J1GT5uapmVP7cHQXUt1jQYe20nZIaFqM8JpRTPAaIJTXjv
	Ef12fb/VnTJNXSW6x27sEt5uBrtAFp3TDaf6jeb12wB/iWsBA2myTyFoZnP/XVPB
	a4+V0w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mv1am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27dLR2002211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:39:21 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:39:15 -0800
Message-ID: <bfabfba2-6688-4461-83d6-b6f4c86b08ab@quicinc.com>
Date: Mon, 2 Dec 2024 13:09:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Gabor Juhos <j4g8y7@gmail.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: StFv4zGKPyc7TKqPu2MnXiqvnyBgmOCN
X-Proofpoint-GUID: StFv4zGKPyc7TKqPu2MnXiqvnyBgmOCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=922 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020066



On 12/2/2024 9:55 AM, Bjorn Andersson wrote:
> On Fri, Nov 08, 2024 at 09:39:17AM +0530, Taniya Das wrote:
>> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
>> Update the defconfig to enable these clock controllers.
>>
>> Global clock controller support
>> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
>>
>> Signed-off-by: Taniya Das<quic_tdas@quicinc.com>
> Dropping this series from my queue, due to lack of response from author.
> 
> Taniya, please answer questions/feedback from Dmitry, Vladimir and
> Bryan, and repose as necessary.

Sure, Bjorn, I had a dependency on the GCC patch.
 
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

I will fix the comments once the Global clock controller patch is picked.

-- 
Thanks & Regards,
Taniya Das.

