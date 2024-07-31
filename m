Return-Path: <linux-arm-msm+bounces-27503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9AF942969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 10:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138021F22F61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812791A8C1F;
	Wed, 31 Jul 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OldTkb8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AC1A8BF6;
	Wed, 31 Jul 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415490; cv=none; b=YZnItgJIpj/w7wNnHdAuEP3r4S/xNFOTriKlfPUCL8/yozhOFIRM9npLqjHyKOp4zsh6YNIyaTDnS7UgupJ9g5bXyMpCjbPdjfV5qsqENXyrKvu3fY1Ta+/2pV7Hv4MHGjDz+M0+Y4uATELUHyaVCtDwQl7v6YfkAXOWXBHh8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415490; c=relaxed/simple;
	bh=1HUvOzGn/5/wnNY0VeoxnmUHfzCa0HeyclKPmXiNkU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eZFNqKRZVxS3XXscXfOgFNpwlKhpbNxOyXvsUwhHRi525F6vbOesSDxtYwou86Z9b/2B7nm2z9y8sCdK+gZ9/twdXN3Uo27+g/h13muO1I8pgI77TNkhh88QPRPHupI7tgjPU9FqvJJoGw05tcj5GOuwjevuFEedIqqJ3WJT1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OldTkb8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4KmR8017422;
	Wed, 31 Jul 2024 08:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzjcsNVmdmaVZf0vOv+8BHQKa8BBZ7bcsZkbwlFsE4k=; b=OldTkb8L/4anYwDb
	lIN3UJg6ZhZiho0bkCJFTmO188gAgJRQXA84CKMad/r5rz4lA+L2sKGRbs9rgqUJ
	bm1HcSUF35l9bA06VginkHNrASfnDCR/ZhAc3Js+t0o2sh5N+er8jK1XVwpHUWBj
	P/QAPtc0LBedMvg3tlCGRYUBa9nFjUvCjTcakrjmv7ZKNk4sJ3DEbZMXkIejKkVn
	aybjUe+OJThYLT5bsSSVcUj4AkFk6/u0mNXgJ2cnPJXi2LRxrZAQ0AcAFd5DRXK8
	UhjRIQlx4ZWlsM+lMKrSljYeA0ru59OtAAVdg5WKXMzQnMMr/l6d1WZHXmbkMxpA
	PNSu2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mryu2mce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:44:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V8igc9014941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:44:42 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 01:44:37 -0700
Message-ID: <ea7fcbe4-1822-eca4-7492-55f1f2895605@quicinc.com>
Date: Wed, 31 Jul 2024 14:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS
 on sc8180x
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
 <20240725-gcc-sc8180x-fixes-v1-1-576a55fe4780@quicinc.com>
 <g4etw2efnugdsv73ejbbqfxmumy5m3oqzkpeqexzpgzlxsms5r@u62f5jcskqfd>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <g4etw2efnugdsv73ejbbqfxmumy5m3oqzkpeqexzpgzlxsms5r@u62f5jcskqfd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dFtDdG6RPGAwE8MznNszhoK27aaGZB98
X-Proofpoint-GUID: dFtDdG6RPGAwE8MznNszhoK27aaGZB98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_05,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=887
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310064


On 7/27/2024 4:24 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 25, 2024 at 05:03:11PM GMT, Satya Priya Kakitapalli wrote:
>> QUPv3 clocks support DFS, thus register the RCGs which require
>> support for DFS.
>  From the commit message it is not clear if the patch fixes the issue
> (and thus should have Fixes and possibly cc:stable) or an improvement.


Actually its a fix, I'll add Fixes tag in next post.


>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/gcc-sc8180x.c | 350 ++++++++++++++++++++++++-----------------
>>   1 file changed, 210 insertions(+), 140 deletions(-)
>>
>

