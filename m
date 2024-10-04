Return-Path: <linux-arm-msm+bounces-33098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA899004A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE5D282F16
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26C61494DF;
	Fri,  4 Oct 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PEx5vMqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2D1482E7;
	Fri,  4 Oct 2024 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035596; cv=none; b=ULtpfaMA+2okSHXwB5RVdPBX5w16wbnXdHaxg6Z//ZMCOFtgIoTeyhECLSiwF2Kt/HiXi5YHrO4zTgXyFxe7dYLuVtrgbUcx7Yw1U9h0TppAJeA7NW7qrBm2bRNqvjAMK9KAYvxQUnqECc0afPNGM+GSBflEZt9GQ2ntwiqBtlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035596; c=relaxed/simple;
	bh=GvA50aypOKeES5b88ZtKz66IY5eKMzeUwOBuz7Ro7XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KUvN/vPugRieyzezeki/wnMvDjyNnXK2moN6MWo6lhuIAf4cHcpFtdyuyQ2NxuWP5cq4HUP/wCKlnHg+mZZs/7b3fZAFIuWGPAKkxuX9hlqVHyXHPsGw4Pud1aucc1gSHj0CxUThdstSZLtlBw3uZ2gzA+W9xTSlOodV7R1V7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PEx5vMqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493Hxpb5025555;
	Fri, 4 Oct 2024 09:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzdWHLICmCO4FTlS/c50c7Ra96E1mMn63rdysJ+zNO4=; b=PEx5vMqQds95zx8b
	5zY7bB3O/ste4l59Cl3eRXAAEz6jdj+jUMVEDmwYrXaLkz5mafiHnlujARElisB/
	jJeOLhBqM4eo6HNgxTivDF3sdmwrFsfuSY9rr1ou9Q1Y5fj8K8d8L6Li98OhuCK2
	kj5xsAnbeEFjlVg5J/ia7R3yBVmx45fpXeiwGc3i8brCSXKdgjexVcFKCyjLfL6a
	AqpIl8jXyPBxEDnsA/gEnSjqqmveQhhYBWWRzTV9n85RlMh9nIVO4EWZH1NdOJ9x
	ZVhCDRu0ZRScNsHrzvgy+y8tRQ+l/kSU17wbH6nGOUCwf8+H9PBrMlOq8EeOuPIO
	D/n1GQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205khpct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 09:52:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4949qsHF032461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 09:52:54 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 02:52:46 -0700
Message-ID: <ab449231-29b1-4ced-8ab1-178b71b1b53b@quicinc.com>
Date: Fri, 4 Oct 2024 15:22:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add NSS clock controller support for IPQ9574
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241004080332.853503-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <20241004080332.853503-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1zwEqbC4Q7-Q2kaqquI5G2IxwA3f8GFX
X-Proofpoint-GUID: 1zwEqbC4Q7-Q2kaqquI5G2IxwA3f8GFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=884
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040071



On 10/4/2024 1:33 PM, Manikanta Mylavarapu wrote:
> Add bindings, driver and devicetree node for networking sub system clock 
> controller on IPQ9574. Also add support for NSS Huayra type alpha PLL
> and add support for gpll0_out_aux clock which serves as the parent for 
> some nss clocks.
> 
> Changes in V6:
> 	- Detailed change logs are added to the respective patches.
> 

I missed to update few things. I will post V7, please ignore V6.

Thanks & Regards,
Manikanta.

