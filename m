Return-Path: <linux-arm-msm+bounces-23626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CE912B11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC461C26174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D34915F40B;
	Fri, 21 Jun 2024 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PlKBEnFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4A2772A;
	Fri, 21 Jun 2024 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986542; cv=none; b=Vr3vyXd87UefXdR0YsGhDa82zbFPU+jf95b+LwNjjFX2p+QM7FAWJ0I9pDtUCcxTyKWxjMiGOrm54c7AyaCDddJeKVWOlACH282qqGHUg2KXv0fD5xlxPCoEIPlIUbFConI9UGueYtWCBYZr8hSIg7qNcq8i1tkWA+AV1kd+Prc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986542; c=relaxed/simple;
	bh=mIBPSubn+A+rwfRdqEMhcD6Z9rKRDA+vQOru7HxGBSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O4Yy7ruXef5LpBX1yOb7S67hOV937Q1u3J8pN6Pbdh6410d0EAyaOqlkjmH+K76ytoOs2E3wQyrLt5Un75mOPgSKBRkZG2yH5XsRqCfeW2Z50iqXOakxL3CfjjTnvJzoBysapbICSA88+LFZvPIDxTov33h/V2P6hxgyyfCqXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PlKBEnFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LDI6rV017550;
	Fri, 21 Jun 2024 16:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gn6OCO8KpDARrbaPjyz9cq4ME5Nm1k9iw+OzFSfwA2U=; b=PlKBEnFjb2NI5jKA
	DpsCVcnMmV4CYQfnP8K5ryJ+oEMTprIVLiC01xnAPbpPmimhQ2Fwv8yTHyM93F1C
	97H5/WDm1TWHrsbasLyk+JaTRhovVt+aBeEuJZX47olU02se13ehr9Vld7xY/hXU
	d2hKw+L7plJ2XlEKUkhDiDrG5TTetPhTrMkXADylLG7J/I9eJutyg4uLVVaum4p3
	0zXu5ryo7P+TdmdeUF72/IzIeYt8NPcY4Q8unjvYvs4i2P6ay3qmBne9mhHEBfKD
	rmvM1Wgqup9xsw1MLc9KIojcNP2ghNOycvyE0WNsGXtB5ktP1C5XdDko1CW4gwt6
	6leLvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkrb3qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:15:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LGF4Dq010537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:15:04 GMT
Received: from [10.216.56.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 09:14:57 -0700
Message-ID: <815b4da1-606e-4cc9-8c62-cefc605c209c@quicinc.com>
Date: Fri, 21 Jun 2024 21:44:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] clk: qcom: Add WCSSAON reset
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-8-quic_gokulsri@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240621114659.2958170-8-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WNHLYVBFJwBEdrhRIs57Zv6DPAroIWAp
X-Proofpoint-GUID: WNHLYVBFJwBEdrhRIs57Zv6DPAroIWAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406210117



On 6/21/2024 5:16 PM, Gokul Sriram Palanisamy wrote:
> Add WCSSAON reset required for Q6v5 on IPQ8074 SoC.

Commit title can be written as "clk: qcom: ipq8074: Add WCSSAON reset" ?

With that,

Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>

> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   drivers/clk/qcom/gcc-ipq8074.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> index 32fd01ef469a..d382d16b9c10 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -4712,6 +4712,7 @@ static const struct qcom_reset_map gcc_ipq8074_resets[] = {
>   	[GCC_NSSPORT4_RESET] = { .reg = 0x68014, .bitmask = BIT(27) | GENMASK(9, 8) },
>   	[GCC_NSSPORT5_RESET] = { .reg = 0x68014, .bitmask = BIT(28) | GENMASK(11, 10) },
>   	[GCC_NSSPORT6_RESET] = { .reg = 0x68014, .bitmask = BIT(29) | GENMASK(13, 12) },
> +	[GCC_WCSSAON_RESET] = { 0x59010, 0 },
>   };
>   
>   static struct gdsc *gcc_ipq8074_gdscs[] = {

