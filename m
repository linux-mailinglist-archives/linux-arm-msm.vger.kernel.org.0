Return-Path: <linux-arm-msm+bounces-35170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D889A5D36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47F001F2163C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B3F1DE8AB;
	Mon, 21 Oct 2024 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gkKnntAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680EA194A75;
	Mon, 21 Oct 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496220; cv=none; b=SDIg3EH7UYxDvPyNulXA8R9oi+tdaCFiAAqSBdIY18Et0RANb4EOH1ronMsNXV1Wyhzydjs/Gk8CYBdBvRW9Qw9ymZPEWsXrYgEWrHVS/IjT00bdvWj2glYeuG4/HbhHMuEWkEYHbkkiJ/gP2zn15EoTQwg6LTXdKi0u6FrrH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496220; c=relaxed/simple;
	bh=9GKCBaIb9QmWmHx4JsOZoYPtT8tG82pCT9mnxbV2HDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e5IH7lbr85a5gwv4TqE86vlEiyL8h0ZuowlbGEnefYkOcgURRUqu8PskgaA5CxQfyyXf469oCXc41vRuBwGcus4FpUPrjDapVfyWq32yGIvP9R6XS+5m9x4E+HGmjjxOd7QNR1wPBvt5+ODHux8OymdtJSd3Y4rHzHmBV+t7EfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gkKnntAU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNeWWP012434;
	Mon, 21 Oct 2024 07:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9DRj124y6oK8nCHje/zt4bQxd/7GlBKkT3TyuQqH6l0=; b=gkKnntAUZUjRXTaR
	HoDfixrfdaE+f4AxQH0Y1+Rc2BWA0zD/jA1G4hHD5NwFTaxiWFRNhecgBkkKaVYK
	ch/jR8a/Qn/K1RctFg4Zm3/qhC1JZMLndNdJDXob5oR46A5pdPI9i+1EAmKe9LoO
	TTwrLXd04f+0pybwYYuaaBXKXpHRIO6bBN07MpHdKqA4T4NELtLAVE7iGQuI/pmu
	LM+uxToaLbDT/zYGW0sY5p8rfBZAUmlbCdl/2hwrV4GeB2nHdS46mjl/ouZxlfNb
	pyGLM0ypOM6IOlavgWdI6cRyi1zISvc/e32V787zljBxppvac2toeDv7P5O83BBa
	r83N2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc3k4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 07:36:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L7aKfK011127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 07:36:20 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 00:36:14 -0700
Message-ID: <86b2320b-2546-44fa-9c45-130c1084c550@quicinc.com>
Date: Mon, 21 Oct 2024 13:06:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom: Add QCS615 GCC clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-5-9f1ca2048287@quicinc.com>
 <bqnqc3sxnh5afs6nb7hrc45scfk6amcj2d3hbeuyriydowmmam@jvma7o4mg65m>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <bqnqc3sxnh5afs6nb7hrc45scfk6amcj2d3hbeuyriydowmmam@jvma7o4mg65m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8VPJBD05L6NX3FaTDID7m8FyZ-YnEuWB
X-Proofpoint-ORIG-GUID: 8VPJBD05L6NX3FaTDID7m8FyZ-YnEuWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=995 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210053



On 10/21/2024 12:45 PM, Krzysztof Kozlowski wrote:
> On Sat, Oct 19, 2024 at 12:42:35AM +0530, Taniya Das wrote:
>> Add device tree bindings for global clock controller on QCS615 SoCs.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> That's 5/12 but rest is missing. Are you sure you used sent it
> correctly?

Please help review: 
https://patchwork.kernel.org/project/linux-clk/cover/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com/ 


> 
>>   .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |  59 ++++++
>>   include/dt-bindings/clock/qcom,qcs615-gcc.h        | 211 +++++++++++++++++++++
>>   2 files changed, 270 insertions(+)
>>


-- 
Thanks & Regards,
Taniya Das.

