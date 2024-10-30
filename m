Return-Path: <linux-arm-msm+bounces-36480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46A9B6BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7D5281700
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F031C3F01;
	Wed, 30 Oct 2024 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pB+JALZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD91A2631;
	Wed, 30 Oct 2024 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730311548; cv=none; b=WhYfF85abS0c0lMl3b7oH+1fmuSnNaye+gu9m9+OnpG24ga32AKNSt642lHGYGhh9nqoyQllc/f5NBHAmN4Zt9cAIXFoKJr2SVaaHn0UPWRWFLA7R+82IBJwTEJ1YX2k9RRaVKaqH8O/dEiHpDa5/yWzVpzjIgggDTjC+zy2GFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730311548; c=relaxed/simple;
	bh=YOZPTsTF7TsVm2VGEg9PWV8F8hJruDTWv/J4qiqqY0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=blbtZ6gdGmNqyd5RCQ9M8/9BnFlQxFuhPF2Tg6SgP7IAz3QHjSwAPJeUkXusS/02rcjKqnw2sVzeSWIuqKuRJiUY0rx2zOQFofkWaQ2X437gi4ESS74y0by6MW6QvdcmxEkkiOdcR7Z1xd2yy9EmmwZ21rhrg3eUh+8iGxTBjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pB+JALZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UDq4VF032007;
	Wed, 30 Oct 2024 18:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wg6iW5B0te6AyYNCFKTR1rnb/HaJc1WsC2nIBBwB0SM=; b=pB+JALZhrwSkqHax
	S39AqV3HAxugV1AxBaHwcPkKuIFO1X/HvW1/WsPyOeNm8Ql5ODDEquRM4PGe31T6
	/SzkaglJN7yG0M2i9+tEQAcwEPraimV4w9uu6DIrfb1wJ7dPgcXxMha3Aih8XAc/
	pOgI8D+e6c9LbWuR+s1o5yPXNvlhI6HwpZZwnuClbYpLc0UqLV9xkt0SjrPZjB9x
	KygOlXm67/6Fm2/GnsdrLspkdRwhKYZ4SefLDtWqvX0at+KwdiKgOsO1Ee1teOAN
	Akip3DutP7Y/WkSYsfBdXCIwdtMQkrpDnU62jpiuJCmEW8A6auRaKz1oeCZQ0EJg
	ZgMtng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kp2g8q4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:05:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UI5EsC024501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:05:14 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 11:05:08 -0700
Message-ID: <91d0089f-93b3-4d1d-a6da-8af2cf47046a@quicinc.com>
Date: Wed, 30 Oct 2024 23:35:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable QCS615 clock controllers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-11-4cfb96d779ae@quicinc.com>
 <zbkqqweb6e6sw6cic3klg4pauxoi5wkcq5js5g4axp64ghpank@7q7jowwrwp5x>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <zbkqqweb6e6sw6cic3klg4pauxoi5wkcq5js5g4axp64ghpank@7q7jowwrwp5x>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 96QpCYqI2PhHPJViIWw3Of681fkBhEdn
X-Proofpoint-GUID: 96QpCYqI2PhHPJViIWw3Of681fkBhEdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 mlxlogscore=629 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300143



On 10/19/2024 2:02 AM, Dmitry Baryshkov wrote:
>> Enable the QCS615 display, video, camera and graphics clock
>> controller for their respective functionalities on Qualcomm QCS615.
> .... used on Qualcomm ABCDEF board, please.

Yes, I missed that, will fix it in the next patch.

> 


-- 
Thanks & Regards,
Taniya Das.

