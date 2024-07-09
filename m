Return-Path: <linux-arm-msm+bounces-25610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12F92B5F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535AF284C46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F224D156F4A;
	Tue,  9 Jul 2024 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bn5etg/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3215278A;
	Tue,  9 Jul 2024 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522401; cv=none; b=ZWhEgjti72Q0mVrrSz4kSidZPhUBclwLPjfDq5EqrEgX2J1XHInB/guiugx4+S2nJqqv4B5J9snvJAQhUmCGaHU78MCsuZvI7nsU0rr6293ErYiAxofB1LGDTR5bIMMr9gTu6h0CsRzwRvsILqMi9VFhoJ9CgjPP9tu7FbHUGzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522401; c=relaxed/simple;
	bh=dHOeuJ/fUbf7/BQudVG04INtahpwVAVzOw8zSnqKO1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GtKwFfj4P1QTxCV7274X5QvJlPp8uOu2BsfTf5oOhBLp2/danNCeJdu7V0ns6g+rQko3MBI5DROakq028oAtpCgwIFVVKP9t9YbQH234m8ZkJD76WC7sZDJBLYdsMcyRvmlVGoSg7k4Hwque28gRrtBhzibnZYzTgaTEe/8In9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bn5etg/B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469A5SN7026613;
	Tue, 9 Jul 2024 10:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tMabEDkukSFfEaVvcVxlVvVONtz8HMw08XPgSZAbiM=; b=bn5etg/BJES5T1zC
	Z/m7k4qfzwXeftPMVnIvAlkkQ8FbyyI7jczlZXkAvV23N5UuB6XX9F2LeoSiGUWe
	mEpoT6qgN+4MQ0AQpTNneCpmGx6tI4OqVFrgziacxkIHR1F9/ZwpJVZQRwFj2BcX
	X2Avgyl3DXACgS8lOyJUHygFG/W3Zo0d/x3WuzhSNrS9FhPuqnWoPjbcmBK6C/hx
	2EdtYZQN+NOhwcHwHCDGlavugnSV8JXX0g1rYyQVTav+Bfkt82lu11Q763kgOBtA
	ldid32xrgYiHtN1NS58Lc8qR06N0ah7Xa7gpSJZISUS1pEsIS6TLJEx0dz+Hclok
	58Dprw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t6d1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 10:52:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469Aqwij025653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 10:52:58 GMT
Received: from [10.216.26.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 03:52:52 -0700
Message-ID: <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
Date: Tue, 9 Jul 2024 16:22:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s1qDvv-1z7Wqj0GcQOAoOjAu9IgFUnMu
X-Proofpoint-ORIG-GUID: s1qDvv-1z7Wqj0GcQOAoOjAu9IgFUnMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090074


On 7/3/2024 3:50 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 02, 2024 at 09:20:43PM GMT, Satya Priya Kakitapalli wrote:
>> Add support for the camera clock controller for camera clients
>> to be able to request for camcc clocks on SM8150 platform.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/Kconfig        |    9 +
>>   drivers/clk/qcom/Makefile       |    1 +
>>   drivers/clk/qcom/camcc-sm8150.c | 2159 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2169 insertions(+)
> The patch mostly LGTM, several quesitons:
>
> - There are no cam_cc_sleep_clk and no cam_cc_xo_clk_src. Why?


These are not required for camcc sm8150 hence not modelled.


> - Why is cam_cc_gdsc_clk not modelled in the clock framework?


This clock is kept enabled from probe, hence not required to be modelled 
explicitly.


> - I see that most if not all RCG clocks use rcg2_shared ops instead of
>    using simple rcg2 ops, could you please clarify that?


As per the HW design recommendation, RCG needs to be parked at a safe 
clock source(XO) in the disable path, shared_ops is used to achieve the 
same.


> - RETAIN_FF_ENABLE has been used for GDSCs for sc7280, sc8280xp, sm8550,
>    sm8650 and x1e8 platforms. Should it really be set for sm8150? If so,
>    should it also be added to other camcc drivers (if so, for which
>    platforms)?


I have rechecked this in downstream and seems it is not really needed 
for sm8150, I'll drop in next post.


