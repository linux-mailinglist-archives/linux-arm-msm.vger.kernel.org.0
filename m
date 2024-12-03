Return-Path: <linux-arm-msm+bounces-40006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310D9E1270
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB94DB20DC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5320D14389F;
	Tue,  3 Dec 2024 04:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dGr6FT74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD11F95A;
	Tue,  3 Dec 2024 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733200469; cv=none; b=NKDX1c9cYuK5BPO7xGlEslep13xdRQRsjVFuVWW02neh9tPBRFGYcFlO9nFdF97OKHhGgysXu8cZHz4ndqfKP+1HAh9OItdgqOoRzYDkYh8ssloMOPWucqmWt51dPu0Vu/iXfAHmRhKaF0jAdPl9BaUEkm7e9Tp1zgP6W2jnCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733200469; c=relaxed/simple;
	bh=dacbi10IAGPrR/TJEE/lVeWhVYMlBBjh6nXpcRIbyEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aRVeEwTKVvcntZ8J790CC5k+njJbrX3/bUNhbi1ghky2Jio57sStADwFB2sUC0lhJT9TaNOd/x/mjpIbkZ95+qJhsSZ3dP0tehCOnMg4klzf7eM2xIw8iIJ53dErEvZ2SYqmoQehVZSQcmt2MniF0NDXhpLSaJmgc4qTSdmG+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dGr6FT74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JLmhW032665;
	Tue, 3 Dec 2024 04:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7r+fTmL3Npekgfx1Bw1R4lQ7zlWHmzynV+Skqmaw7PU=; b=dGr6FT74v/5Lx+H8
	sMvtP1p2ANdd7/iHkt2KzREUytcHEaEVGF1DaXZYTDv5Mj19MVJO0fVzi1BlR6yC
	gTGOpjAbVsHfGtWxdYtB7slre46wR+IBw4CH6gxqtBtUjYmyCBKw3h2p4vqgBeG8
	sLzx2kKx09OGgYABsP82ZaRLG1tyqsDnib4a7SPQ/FOM/tNOq5LvIfn6DIDF6k/y
	YF2sIN32RDFuDqEARWj/cbYHP0pjT/Nz4s2z6JseLbIs4cUMaAfCN/LVeLe9NgKm
	Vrd+hrtPGUVXvTvwRDSPDtBZIzLg4RLHic07vIH37PjzJDUeZAKjEeS5rpgR0O5m
	qAc+tQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2xsrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:34:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34YMSf026361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:34:22 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 20:34:16 -0800
Message-ID: <97c6ef74-7ce8-4e67-85f9-d5452678f45f@quicinc.com>
Date: Tue, 3 Dec 2024 10:04:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
 <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
 <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
 <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HNTHWeFsis9Efc1EhwplX26Drn1XB8AC
X-Proofpoint-GUID: HNTHWeFsis9Efc1EhwplX26Drn1XB8AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=697
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030036



On 10/26/2024 12:12 AM, Konrad Dybcio wrote:
> On 25.10.2024 8:42 PM, Konrad Dybcio wrote:
>> On 25.10.2024 10:52 AM, Taniya Das wrote:
>>> Add support for video, camera, display0 and display1 clock controllers
>>> on SA8775P. The dispcc1 will be enabled based on board requirements.
> 
> Actually, why would that be? CCF should park it gracefully with
> unused cleanup
> 

Yes, CCF should take care to cleanup. But I am of an opinion that as we 
are aware that this platform do not require the dispcc1 so we could 
avoid the clock driver initialization and help in boot KPI.

> Konrad
> 
>>>
>>> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad

-- 
Thanks & Regards,
Taniya Das.

