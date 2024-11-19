Return-Path: <linux-arm-msm+bounces-38275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB29D2008
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341EF282967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460661547E9;
	Tue, 19 Nov 2024 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DtRt13en"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C6153BD7;
	Tue, 19 Nov 2024 06:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996526; cv=none; b=qOu/cGa35EIwlpYciWLfjVrCjbqkVntjxARheDSMrThow90d6IyWhQs9M77C72XHauIzF6WUZ2k2OZZ2DOebzXdiqVgW7z4qJ5igeB0guGS41Ks0FA5s5HVERo5jlo7jmb42dUZDWHMqJyV1ijkbnPVmWAGVLipg3r3sA9V7GW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996526; c=relaxed/simple;
	bh=W+HtRLN12fHyz5D3zVyJ6BBUX21il5uMixPDzuPmSyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NFGPpHF2ITtwchegbx2pzrEYReY74vPjQP0rzhs9IYq12YPys6yH0MJ9/NZjzZoUmjUFwTlHH+GGLmUgR1aMneuS2t7hEDE8N6Bb0lOqantgtWN5V5gpNjy67XscAZR65xcP48H4sOKzoMwQ4U50hDUlVGNeVQxXEjiNZc2Mrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DtRt13en; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGnxw028573;
	Tue, 19 Nov 2024 06:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKfXy2r1xB27Jmr4Wgcmno0GpT023VWTrSj6kj7/aSI=; b=DtRt13en62Ggw+OS
	67cJw66mPJnax2SsWrXdYt95xbF2zBEJdVhxKWsgytoFMjyiRbwkpE013XteS2cE
	wVxmvbgN5TAE+4UT0yVb0BAhVnY6OD0f2snsbdU/39ZReImJPBD9d0rGKVU01v7I
	3uXnN7vD549PITG3CubgZ1C7hXyRDREGaL28POzZf2dFJ7+hxYwC0+x6JjyhIb36
	UB0UaX7rvOMDKGaKdVMcDUN3NtYxJm/K7oYPyNMHXNHxIfav9J4MOZMunf+sybVG
	TP6BTjRj8c4tsI5Vq3kIAvMfe0utIqRUuqQGUnztEdhpfombgf3ZfhXtQV36YNJs
	x6KjFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5skbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ68eIn010333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:40 GMT
Received: from [10.216.46.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:08:37 -0800
Message-ID: <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Date: Tue, 19 Nov 2024 11:38:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rnBe-pCd0L0YOP4qCmXQz96D_DoRdnU6
X-Proofpoint-ORIG-GUID: rnBe-pCd0L0YOP4qCmXQz96D_DoRdnU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190045



On 11/18/2024 7:54 AM, Bryan O'Donoghue wrote:
> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
> multiple power-domains which power it. Usually with a single power-domain
> the core platform code will automatically switch on the singleton
> power-domain for you. If you have multiple power-domains for a device, in
> this case the clock controller, you need to switch those power-domains
> on/off yourself.
> 
> The clock controllers can also contain Global Distributed
> Switch Controllers - GDSCs which themselves can be referenced from dtsi
> nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.
> 
> As an example:
> 
> cci0: cci@ac4a000 {
> 	power-domains = <&camcc TITAN_TOP_GDSC>;
> };
> 
> This series adds the support to attach a power-domain list to the
> clock-controllers and the GDSCs those controllers provide so that in the
> case of the above example gdsc_toggle_logic() will trigger the power-domain
> list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
> respectively.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Bryan, as we were already in discussion with Bjorn to post the patches 
which take care of Multi GDSC and PLL requirements, I would request to 
kindly hold this series posting. I am in the final discussions with 
Bjorn to handle it gracefully to post the series.

> Bryan O'Donoghue (2):
>        clk: qcom: common: Add support for power-domain attachment
>        clk: qcom: gdsc: Add pm_runtime hooks
> 
>   drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>   drivers/clk/qcom/gdsc.c   | 26 ++++++++++++++++++--------
>   drivers/clk/qcom/gdsc.h   |  2 ++
>   3 files changed, 44 insertions(+), 8 deletions(-)
> ---
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
> 
> Best regards,

-- 
Thanks & Regards,
Taniya Das.

