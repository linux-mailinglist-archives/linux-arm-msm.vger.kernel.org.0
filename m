Return-Path: <linux-arm-msm+bounces-33081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C098FE67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62001C20B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 08:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A144F13B588;
	Fri,  4 Oct 2024 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f3Bv4frj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B98817758;
	Fri,  4 Oct 2024 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028954; cv=none; b=IXrNROnymYpKqAzoYmps7G1qvzVRCWf8hIPVbXDBIxR0rWe+nfJ7EdAGfmv6FChSHKqdKuMJVJSsxv7zbyQAMPT+fI5FDN+3jf64YcGpH540wzmUBbDv37q+k0eUD9m6fBntvlQEBq436rlT7MXjgF1rT4IJ/D9ogo4luglxfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028954; c=relaxed/simple;
	bh=nCAdfraMrBMYOjQaxQFPKyByIAkrnpsokcrGWyl4FNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dHfxpI77qLxwgAaYvNCCOx917LD97jtXNhM1mt8/Jux9eCKW53+tt7x4o2d984XmimouR+CmFCvfVXOkKkaqrmbmmqL/ChomLx+Qg1iug1k3XmXv3dHjqyhUkVrIPeyd1GjdYlf9M3OTfIBskBalpeajwKiyufvsb0pm0mNLWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f3Bv4frj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493LoPKu018562;
	Fri, 4 Oct 2024 08:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6usrgQie7+gNNQ3hdRFEjpuEV0TcscHL44Hxv/X5Ww=; b=f3Bv4frjGM6NE8WF
	SNW7233bO4i8fPf4xUp31RjIlBlHnIIAksbBNoUi6CX6fvJjIrjnZPYTFrSOZyan
	KcSZnjuJLD1KBBrBzFPjIVSr7ZRLOd1Jdw44KKjvh2/HbiIU0m70MUYJyyk/hPhY
	qWWFiinkxheo06LCOn7pqntTMSgHWsUi52sGXzzXvkezFP547gTBqVbrBu1NaLeN
	ocSYFouEOxAozEljDL55/rW3x5aZLP+LVv3Okdf22XaZUR/lrp0NlRkj0D1oJiNk
	yojmUqPGnN1lKgh6A0PXUjpvsemf2PLPor17zuEyc/lcoH5S2KNsUylcbbFLoqNn
	638grg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205e1ew9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:02:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49482Apc002677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:02:10 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 01:02:03 -0700
Message-ID: <61299c8f-4603-4f9f-9aee-8e4e51945d44@quicinc.com>
Date: Fri, 4 Oct 2024 13:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
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
        <netdev@vger.kernel.org>, <konradybcio@kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-6-quic_devipriy@quicinc.com>
 <e678339b-356f-4aa4-aa04-e6e54d8e554c@linaro.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <e678339b-356f-4aa4-aa04-e6e54d8e554c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JPjpeUFsiMOQDb5mAYitXp9LCGrRTrmQ
X-Proofpoint-ORIG-GUID: JPjpeUFsiMOQDb5mAYitXp9LCGrRTrmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=755
 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040057



On 6/26/2024 9:09 PM, Konrad Dybcio wrote:
> On 26.06.2024 4:33 PM, Devi Priya wrote:
>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>> devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
> 
> [...]
> 
>> +	struct regmap *regmap;
>> +	struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;
>> +	struct clk *nsscc_clk;
>> +	struct device_node *np = (&pdev->dev)->of_node;
>> +	int ret;
>> +
>> +	nsscc_clk = of_clk_get(np, 11);
>> +	if (IS_ERR(nsscc_clk))
>> +		return PTR_ERR(nsscc_clk);
>> +
>> +	ret = clk_prepare_enable(nsscc_clk);
>> +	if (ret)
>> +		clk_disable_unprepare(nsscc_clk);
> 
> No changes to be seen..
> 

Hi Konrad,

Sorry for the delayed response.

The ethernet node will subscribe to GCC_NSSCC_CLK and enable it.
Hence, it need not be obtained and setup here. Will drop this.

Thanks & Regards,
Manikanta.

> Konrad


