Return-Path: <linux-arm-msm+bounces-34928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D59A3B84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D63DB2080B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B52010F7;
	Fri, 18 Oct 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PG32EBmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475F168C3F;
	Fri, 18 Oct 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247335; cv=none; b=AYw+dL1aks3zLbVYDUBrjFf3YBYuQZOXEQYYidQclPTHMMBIsjv7WZH1WOom5of1oT6wxqyNZYdZx8HH7UhKfOHFzPShHk1uFk1cOHGa5KMgTg3p+r2OTcIhZFbJiC3PWXaCOyMKYlnTqi7c0eUUrNNqi9vvl9WKkfNV9fAQTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247335; c=relaxed/simple;
	bh=OSesrguYvyqg8R32d0MHn/mdbmOkWXQq9jcqdL3WtLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IdFb0jhtWdCLC4ODPdrytYHpRcdivzlpoapbF/DIfjgNqyFSDYhC6sj8vZiJM5d7PTBuEA72wIxYfw+3J2HShWB5irVIlCPSr79Ct4mAaDm1oJjY4zPtrT1XORJ+yuCZajDHwgAERsqlzWvJgOth++eiSxW8A0mkuQhIs31dG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PG32EBmv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I1gEH9021848;
	Fri, 18 Oct 2024 10:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gLTCO+h4aAm3dUwXoca9iRtdvgVcY88kBHgtMoRt+E=; b=PG32EBmvcEoiXehf
	g2O80IcgvidnA3yNPWfPe5ZVPizuT52zFCoOkcaybdWgfjqzpoRI7Sj9aNvp+ebR
	OAtxYHxX0rqKGAWqBm5kObnwSATfgAtQEZTaLm4JAmvxSBn2Vtklo+ovH9WldtTd
	iUKBHbkgq8lwQ61/fu1m3KSLZRD1p6xP4eVatz46rerNE7yBOnh3/1ZwuCIKZfQ7
	nk5SMDCLFOsAxdDD7V47r74zsPZjgjiNXDdwSd7t2pI16f3xDZ4uTXXSPy9dcWC9
	I6g5nSAEQC7UVIxRRfr3OAFZde9b7GtSEpsBDCiwuYlJxqAR3xu/wVOcqOpB1FLA
	wB+Skw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8c9cks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:28:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IASWZX000489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:28:32 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 03:28:28 -0700
Message-ID: <1d74b699-8463-4885-b30a-d4f1eeb7b3db@quicinc.com>
Date: Fri, 18 Oct 2024 15:58:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] clk: qcom: gdsc: add separate sleep state collapse
 vote support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad
 Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-9-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-9-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gmhx78ShU4ABUnAIpIG4FaOGi_UceL9P
X-Proofpoint-ORIG-GUID: gmhx78ShU4ABUnAIpIG4FaOGi_UceL9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180066



On 10/17/2024 10:26 PM, Dmitry Baryshkov wrote:
> Some platforms use separate collapse vote registers for the active and
> sleep states. Extend gdsc_update_collapse_bit() to support separate
> collapse_sleep_ctrl register.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 8 ++++++++
>   drivers/clk/qcom/gdsc.h | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..95f8e90a8d25673c8a97a03f92cbdad25c3259db 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -133,6 +133,14 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
>   	if (ret)
>   		return ret;
>   
> +	if (sc->collapse_sleep_ctrl) {
> +		ret = regmap_update_bits(sc->regmap, sc->collapse_sleep_ctrl, mask, val ? mask : 0);
> +		if (ret) {
> +			regmap_update_bits(sc->regmap, reg, mask, val ? 0 : mask);
> +			return ret;
> +		}
> +	}
> +

Dimtry, based on our discussions with design, we understand that this is 
a one time setting and can be done from the Global clock controller probe.
Thus, this patch can be dropped.

     /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in 
sleep. */
         regmap_write(regmap, 0x62204, 0x0);

>   	return 0;
>   }
>   
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dab2e31be8f65408d6d29df42ad5105830760d3e 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -19,6 +19,7 @@ struct reset_controller_dev;
>    * @regmap: regmap for MMIO accesses
>    * @gdscr: gsdc control register
>    * @collapse_ctrl: APCS collapse-vote register
> + * @collapse_sleep_ctrl: APCS collapse-vote register for the sleep state
>    * @collapse_mask: APCS collapse-vote mask
>    * @gds_hw_ctrl: gds_hw_ctrl register
>    * @cxcs: offsets of branch registers to toggle mem/periph bits in
> @@ -37,6 +38,7 @@ struct gdsc {
>   	struct regmap			*regmap;
>   	unsigned int			gdscr;
>   	unsigned int			collapse_ctrl;
> +	unsigned int			collapse_sleep_ctrl;
>   	unsigned int			collapse_mask;
>   	unsigned int			gds_hw_ctrl;
>   	unsigned int			clamp_io_ctrl;
> 

-- 
Thanks & Regards,
Taniya Das.

