Return-Path: <linux-arm-msm+bounces-24600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 532D191BA6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E421F22E9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62D214D2AB;
	Fri, 28 Jun 2024 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pso5GkyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986A14D422;
	Fri, 28 Jun 2024 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564816; cv=none; b=NgpAX1vjvb0r8dItTeeQFW8EsCSS3CG283g1/Qb8b0xgBLe8ftOw9tdogEr+pcnogBstNj1aJETcEyApe+PB3Muzzo2XjW3FsHdC5oh6B8L55HOveVCuP3BWzBhfbdl5dN/0u8nF5AxsVfYVQ/DgMQUCAtA4XrvNsnSoJ/w4aQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564816; c=relaxed/simple;
	bh=oxTnH17qDngqxivrM5yoTjoI0FurZB5eV9GU0Bc8qMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dg6YvXetZh5QVQxo38y2WINbh/ODSGhmtul7I58jPVKb+XvPePqj2swkL8V0+1Wa98TW2SQpsaCOUGpLq4cN/8OSdBDyT0BY7rL/OF0IBCEdGUAxYqIFOUgalsrJKyV2qUYQcb6hgB6W0SheEv/puE36e8VhGnxNU1oLXksgMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pso5GkyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S4vs7J026976;
	Fri, 28 Jun 2024 08:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kq22wU7wwsGYjhBl9xtahOdtEa8X2tZidLfwDtYSi0=; b=Pso5GkyEZP2QbA+o
	fveJJtbnmUXFiuhuivdKvTBD5SIsLlvwes7hPiSvkmqvKyBTn/IfmTjca661wAit
	SRNUz5gN/h5M6kX8gqqyopVn+Y+nZflMTjm6cPFVGmCESIPJ8YaEQGWiqOsUFkyu
	GixmaNnVqoJHMW/5XiDjGIIoo73K601XUpV6OQGx8nYSsJi1mWApzG2OoKkddnYB
	GHRTyN8bvKJqevREb+NQeJavaJKYpT8IyCw+aphDbz9ZSidnhEoIKBauPxJvlhnz
	S3La1x9nKhpiaVyHNMxoBD/Q4nsJFGQ1MjQTYe/2OuVYxzDAv9FLM/e8Nn7EVV0x
	MQg2mg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm30nhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 08:53:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45S8rT7x006124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 08:53:29 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 01:53:25 -0700
Message-ID: <18458d55-0ba9-4cee-85ca-88b38cebee0f@quicinc.com>
Date: Fri, 28 Jun 2024 14:23:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Fix halt_check for all pipe
 clocks
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240628-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v2-1-db3be54b1143@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240628-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v2-1-db3be54b1143@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ddnQDAzrZO6JdrBG3p-rRsy007guMOy2
X-Proofpoint-GUID: ddnQDAzrZO6JdrBG3p-rRsy007guMOy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_05,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280065



On 6/28/2024 1:38 PM, Abel Vesa wrote:
> In case of all pipe clocks, there is a QMP PHY clock that is feeding them.
> If, for whatever reason, the clock from the PHY is not enabled, halt bit
> will not get set, and the clock controller driver will assume the clock
> is stuck in a specific state. The way this is supposed to be properly
> fixed is to defer the checking of the halt bit until after the PHY clock
> has been initialized, but doing so complicates the clock controller
> driver. In fact, since these pipe clocks are consumed by the PHY, while
> the PHY is also the one providing the source, if clock gets stuck, the PHY
> driver would be to blame. So instead of checking the halt bit in here,
> just skip it and assume the PHY driver is handling the source clock
> correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Abel Vesa<abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded the commit message from scratch.
> - Changed all pipe clocks halt_check to skip.
> - Link to v1:https://lore.kernel.org/r/20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org
> ---
>   drivers/clk/qcom/gcc-x1e80100.c | 44 ++++++++++++++++++++---------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index eb7e36ebd7ae..fc80011342da 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

-- 
Thanks & Regards,
Taniya Das.

