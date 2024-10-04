Return-Path: <linux-arm-msm+bounces-33078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80798FE40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A461F22858
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 07:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8331213AD2F;
	Fri,  4 Oct 2024 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ok/KjEEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0142209F;
	Fri,  4 Oct 2024 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028677; cv=none; b=eeRlgPmjnN73/tVl2BhFci5rQKzoCBkeiD8wYAaOsuGc4R0iSimtYJi902h7s3mVJ6W+zPcgL8efTfYF+MuI7UySCN+gMwn4N4YZA8mYkFlX9itssNiAnA9rzidHcnpLA9y+IWCpA0fr415G2wnmB9SyZp9PtQO8Mf8vHcToIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028677; c=relaxed/simple;
	bh=Gx3ByTHdqH+Z6NrgWs+dOHm2pf1YYYDIrVPK06ZcIsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dkEUjvpYP8sAjZsFzgR5HP8oFbsJkQNpXZR9lSYm00bNmNu55WeuVjkxvJH0vx2juINvywKBi5+x40BkaKKqZbSFHUkgfSErRtR0v0XE9zftIDfPveO8QmOj3kW9/8sQSjZBAPLuxisCO0bTJjMpmV42+WxG155CUvv2rQkrkcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ok/KjEEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I03lo021789;
	Fri, 4 Oct 2024 07:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXpbF4mHKiP22JJzGGOCfafZjcykIbh3vzNu3zCQFe8=; b=ok/KjEEikM5YwZV2
	LAk9aO7k3ybCAtQJ7KIm51QbEsePu4QSKBzpl7C+GW95XYz8Z+VXIe8ucJlDMiOy
	AL15wQKyeMHMOJghslwMP519w39o5OFZSXg56pM32xR6C7FqJZmNzAvOKxZO/240
	NeBlPsPBI5gzNqP1EJ+j1JIsVBPJevLtb6Bd/QTa4MeKNsGsepkUcBu3fGgIkSQv
	PnPvrHa8SiT0q014Wy04oK4qzw87NB+K0Htv964pkpBhVlLFcRFQTKaidmvvWQaz
	ElsEuLcK+yOjFyWNRwrl3BT0HxLOYVBZlcNMESFu4+FkpjGLvnVL+D+PnUdp9cZz
	fsKc9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205p9f0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 07:57:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4947vUMT013051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 07:57:30 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 00:57:22 -0700
Message-ID: <c7ddb7d3-7046-4e27-8ef7-c88262da6b8a@quicinc.com>
Date: Fri, 4 Oct 2024 13:27:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Devi Priya
	<quic_devipriy@quicinc.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-7-quic_devipriy@quicinc.com>
 <8ffd8a3c-83e6-4753-8bdf-7daa3a3d8306@linaro.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <8ffd8a3c-83e6-4753-8bdf-7daa3a3d8306@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N6PBUiV8ug3rBba6OwewLPJDVEfSfWD4
X-Proofpoint-ORIG-GUID: N6PBUiV8ug3rBba6OwewLPJDVEfSfWD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxlogscore=688 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040056



On 6/29/2024 7:00 PM, Konrad Dybcio wrote:
> On 26.06.2024 4:33 PM, Devi Priya wrote:
>> Add a node for the nss clock controller found on ipq9574 based devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---
> 
> Title: s/support for//
> 
> You're adding the node, not the support for it.
> 
> The nodes look good. Looking at the driver, the interconnect paths that will
> be sync_state'd away due to no consumers don't seem to be super critical for
> the system, so I'm assuming this doesn't crash
> 
> So, with the title fixed:
> 

Hi Konrad,

Sorry for the delayed response.

Okay, sure. Will fix the title.

Thanks & Regards,
Manikanta.



