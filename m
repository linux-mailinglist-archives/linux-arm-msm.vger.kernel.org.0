Return-Path: <linux-arm-msm+bounces-24401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE49919EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 07:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F3E287F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 05:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0552B1CD31;
	Thu, 27 Jun 2024 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lNpPFIoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735171CD0C;
	Thu, 27 Jun 2024 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466696; cv=none; b=dEzcs0UJ2+rHQVW+6OYhjHSfp1d7X98ExfUmssiA8qxuPF3cTDBqd3S9SSdMCcBPJmc256wtJvsxF9M0JDP5VdxI48laeJ8+B70jAHolWPAxFOTuuMbRhsRLtt0WoFzOeT93V0hGRdyllxTxbrqUFXPZZWgG0rmLj6bRqW157B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466696; c=relaxed/simple;
	bh=K6d5U/J+OhP5XbyMF5bFdwe1a5dAG0EXgpN36348UUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lzoFQH2HxOp6n4T99NsB9JYdG8DOI33d22CPjJjoRYjUEmEVldeBXZ5iYGx4Sxj0LTn43WHVk/jqVXZH4zCcFn9BSW40V3WUZZTW8gqaNw+ffFVrmwWdUX1HN3FOj3skkB9fvsrdCozopghsM0oReTsBVBEF1JAV0LyUVXcz1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lNpPFIoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QNsvD8011470;
	Thu, 27 Jun 2024 05:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1XTB4r53fxKuVJ+ffpKN10uZXO4xAgJ7bZw+nI1ZKQ=; b=lNpPFIoMSTknubVK
	rl6xRrqb/R+D3FamgZoRk1TTpPw9/ZwKiIDRpHBbPBCIqTNFoaRWYnsjkaE/VAev
	D0VmK+u+B7muvx9x+xBo2t4WAxVhN/3XnjkudqUE0tCnEKtzgZ7l1jXoruHFijMr
	mx0SdNfEG0k8Q+DtMSqvCqBhK0M+GcfTPHMnmopQEPx7VRdwyH3B3tIj4RTJhtuO
	d6Rqsfti6ueQaTzrXR1QZ8InwW+r9y2Awg2z5ssK9f5Ux2pxeZG2A7cKJI14U9yA
	/1ZoZcPmFPagWnAtX5lVbworVj1o1uwrv6RIjmu7WpiZAOudwBqOnR4ePnwYSlPV
	vxTXnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqb586-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:37:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R5bZD6003813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:37:35 GMT
Received: from [10.50.52.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 22:37:26 -0700
Message-ID: <69126dff-fe23-48d3-99b5-a2830af52e6a@quicinc.com>
Date: Thu, 27 Jun 2024 11:07:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
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
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
 <2391a1a1-46d3-4ced-a31f-c80194fdaf29@linaro.org>
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <2391a1a1-46d3-4ced-a31f-c80194fdaf29@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mN0dPTXalv0QnqBdDs-HJr5m6-26SMHV
X-Proofpoint-GUID: mN0dPTXalv0QnqBdDs-HJr5m6-26SMHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=667
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270041



On 6/25/2024 10:33 PM, Konrad Dybcio wrote:
> On 25.06.2024 9:05 AM, Devi Priya wrote:
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
> 
> Why?
Sure, Will drop this in V6.
> 
>> +	struct clk *nsscc_clk;
>> +	struct device_node *np = (&pdev->dev)->of_node;
>> +	int ret;
>> +
>> +	nsscc_clk = of_clk_get(np, 11);
>> +	if (IS_ERR(nsscc_clk))
>> +		return PTR_ERR(nsscc_clk);
>> +
>> +	ret = clk_prepare_enable(nsscc_clk);
> 
> pm_clk_add()? And definitely drop the 11 literal, nobody could ever guess
> or maintain magic numbers
Hi Konrad,

nsscc clk isn't related to power management clocks.
Also, I believe it might require the usage of clock-names.
Do you suggest adding a macro for the literal (11)?
Please correct me if I'm wrong.

Thanks,
Devi Priya
> 
> Konrad

