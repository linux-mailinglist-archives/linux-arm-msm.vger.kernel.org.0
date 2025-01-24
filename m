Return-Path: <linux-arm-msm+bounces-46060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BEA1B38C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0BB516B7ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5C01CB534;
	Fri, 24 Jan 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O7mLfyac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3E21A458;
	Fri, 24 Jan 2025 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714868; cv=none; b=GofNioDwqsHGzq6mE8959A1LdvmvX/6LXCM5OTuiDBpTjTMQIvydACSWoS10OXGJHR2Q7+7TX7a0TFrcmQB/6tLVBlp/yBawhzRC8GSm13TK0RfC9+QeEWhKr8Fj7Su4zsbNq00q4dygzw8+DygyxXnbv2RIrVCRJE1uhM1NBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714868; c=relaxed/simple;
	bh=5wcM4QIJC4BSmGyfcFPsLHstZ0CFW88kBtzLJCQxVUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JnEduvysxji6UbvF89JrSGe7rKKnEvLwpkewDwtymBXlOlOyCbjrVqBIL4OmVFUfiTu4DWEChwkvdx9fXki5sQpfF99oZX18cZK9o9BCjsKowBWpc55628u2IhYFjORhOPn58ULAkCXqJOG6KhIuh9kPFXrInpJI7vWjwF5uuUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O7mLfyac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAKS0m018318;
	Fri, 24 Jan 2025 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRpwYmsT4nj/YzlHnbrovWcxr4ZoXl/eyyF0IyQo3nQ=; b=O7mLfyacUeOKt4/Y
	3TyV8RiWvSS/DqJbWY+0iU63DPiGtQkUqM04RoO2oxM1Ax/wuZYZx9PFKRhHN6cz
	vJ0CA9CLJ/yy0L7ZnDA2HGHPykY2zuwqLIsUHmus6OQ2ConY5bx4QGyZxnbLGRAX
	H/FAglqij8q6vE6/1DZlIb7qQJMTFf4tNiALg1vL047pOrNR94YkWLE9fxdS2ozo
	/b1w3G7p1y9Pedz4Pp7KxooYTrj0PPlfI45UximCQRpSplbEsxAVpNee+kq2hmSk
	THyUAMA3hYwMcpP+71Nuqt7ztg5e7MqBjIDJX1MsOqGqB+s+/kvu2JJupTXeZEr+
	gWecjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c91ag1m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:34:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OAYMgR007454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:34:22 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 02:34:18 -0800
Message-ID: <695a1cc6-7b03-452e-a904-52f3a199189b@quicinc.com>
Date: Fri, 24 Jan 2025 16:04:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
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
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
 <20241206-sm8750_videocc-v1-1-5da6e7eea2bd@quicinc.com>
 <oylnao5wjtqyczivesfg46eexfb5oj6o2azprtwf4bl7yhko2c@saqzbycbixqk>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <oylnao5wjtqyczivesfg46eexfb5oj6o2azprtwf4bl7yhko2c@saqzbycbixqk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CGE147kX71B3Ke9fCtPTXYzmNFJxtefa
X-Proofpoint-GUID: CGE147kX71B3Ke9fCtPTXYzmNFJxtefa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=886 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240076



On 12/8/2024 11:00 AM, Dmitry Baryshkov wrote:
>> Extend the support for mem ops implementation to handle the
>> sequence of enable/disable of the memories for the invert
>> logic.
> This mostly duplicates the patch contents. Instead commit message should
> explain what is the "invert logic" and why it is relevant.

Yeah Dmitry, I will update the commit text and update the patch.

-- 
Thanks & Regards,
Taniya Das.


