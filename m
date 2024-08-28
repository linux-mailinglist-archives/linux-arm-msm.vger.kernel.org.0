Return-Path: <linux-arm-msm+bounces-29732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25B9620EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F222AB248A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC37158D7B;
	Wed, 28 Aug 2024 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mazciC6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E415957E;
	Wed, 28 Aug 2024 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829850; cv=none; b=sZ7cQ6lpxLQxo7zJJtD7h1cRRmbr1YjBExnx2cmfzceGt5TGZyEyi3zavKkqH/qFfmNu7KKmHNRpaIYOxBk+zIDCXJbcPPhj2jaDpY/uxVAgLTepJKOxvDjUKj9ltD4L4ezLna4XyKo4hwW6h6gD8VyoNEarI8hd9NeLvnpTDTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829850; c=relaxed/simple;
	bh=6CmTzbXpU4WzlEQvnVHqE3EiYn0C7V0RHm7JIGuT8iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S17086R7uDszJhX592E+9hOSfCfOHbXjNpEZyQeflkZYkI2LZarDzuW8McowFBQ4CzcKaDnFCi60mjZjkSGi0q9ynZCIuhnUdtBWHbOUi83U11pMmIv2qYiMmVm0bbW/qygw7v3lEqEo0DEH6WtMdPX/KBTqF/aL9HtYKU5xgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mazciC6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLb2rL005522;
	Wed, 28 Aug 2024 07:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KoqV5Hgx4GL211WXWMqK1XxknmZXyFuj0kMNo/U8Z8=; b=mazciC6mB6AEFPeM
	bmKa5IOz0ittfuIr7aCVyn09nxPGESjSGnfa5JnUS6I1VxJN5heP6EZpE1qZqodo
	iviElv32yhRBzVwAsRmo7MpBZ3d259iafPKRpZOlfTjyEYPXUsTlO/8LlMDtVcuU
	1TI3/IDBofJzB2qpVG9RcJ3ktxd5bWf667Lb1hTxWSLLyd65WLOgW/k+u8n7HwAl
	+FtuQCtdpPVsUtKSFvlDoBTSe2arz7cAFhUBO7JK9zItqq8epNBl3hR1XWlQVftO
	BmSlmGLEn3fQRsTcNQ0jn3B+siI8ZScbV8kBl8HxpLvFlGz/UtVUTIxie+RgmukA
	GBAL6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puu90vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:23:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S7Nq9O031253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:23:52 GMT
Received: from [10.218.5.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 00:23:47 -0700
Message-ID: <72999a68-314e-4f63-9411-ef92638ed31b@quicinc.com>
Date: Wed, 28 Aug 2024 12:53:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] clk: qcom: Add support for Camera Clock Controller
 on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-4-77d53c3c0cef@quicinc.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20240816-sa8775p-mm-v3-v1-4-77d53c3c0cef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lXetiUr3hPXPzezup4fNePSW-1u02Tx8
X-Proofpoint-ORIG-GUID: lXetiUr3hPXPzezup4fNePSW-1u02Tx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=949 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280051



On 8/16/2024 12:01 PM, Taniya Das wrote:
> Add support for Camera Clock Controller on SA8755P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig         |   10 +
>   drivers/clk/qcom/Makefile        |    1 +
>   drivers/clk/qcom/camcc-sa8775p.c | 1868 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1879 insertions(+)

Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Thanks,
Jagadeesh

