Return-Path: <linux-arm-msm+bounces-4498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1981097B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 06:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAFB81F2145E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 05:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0019CA4A;
	Wed, 13 Dec 2023 05:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HR52wP/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48386CD;
	Tue, 12 Dec 2023 21:32:28 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD4ap62006983;
	Wed, 13 Dec 2023 05:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DJVXKDPsNY4QyQG2ZYDGT8e0H7uObC2Qb9v3P42JEdc=; b=HR
	52wP/FkRhJwpciH6r/JuvAGiAjWgiUkwPNRuQkJceh5HXUQ8fN6kWibYY7k+7jBj
	XLUvRoGmk6qup2u6ToqN4EFPG9pN7DqhJXyoK06JP2pj+gnpiQNhEp8lKbyYi7/Q
	wAGsfxS81KFxsb35PmWfhUi8HNOoglDCj6WbeHaEminzVGtYVlu8oXgHD3B9f/y8
	gGn++x01cA9OO2K0luHReqLclGvvklOVKMdxc3v4v63SuaoD+7ccA0B3PciEVUp0
	DHNgoNyvC65JKVvp64jg0Af/Ys3G/HeoJhYEZvuLM8OhULf3lNJHxfamGnpO7IH9
	c1d4/GqKp3PvIF2t44aA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy3rprc1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 05:32:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD5WGhi008301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 05:32:16 GMT
Received: from [10.201.3.200] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 21:32:12 -0800
Message-ID: <51133a78-43ca-46fb-8f5e-b3bfdaef9a79@quicinc.com>
Date: Wed, 13 Dec 2023 11:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwspinlock: qcom: fix tcsr data for ipq6018
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
CC: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231212142509.655094-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
In-Reply-To: <20231212142509.655094-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AYCYbXP-AcD_xck8dwEYI4BkDdIcGUe6
X-Proofpoint-GUID: AYCYbXP-AcD_xck8dwEYI4BkDdIcGUe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxlogscore=952 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130037



On 12/12/2023 7:55 PM, Chukun Pan wrote:
> The tcsr_mutex hwlock register of the ipq6018 SoC is 0x20000[1], which
> should not use the max_register configuration of older SoCs. This will
> cause smem to be unable to probe, further causing devices that use
> smem-part to parse partitions to fail to boot.
> 
> [    2.118227] qcom-smem: probe of 4aa00000.memory failed with error -110
> [   22.273120] platform 79b0000.nand-controller: deferred probe pending
> 
> Remove 'qcom,ipq6018-tcsr-mutex' setting from of_match to fix this.

Hi Chukun,

This patch was already posted [2] and Bjorn applied the same [3].

Hi Bjorn,

This patch is missing in linux-next. Could you please help check ?

Thanks,
Vignesh

[2] https://lore.kernel.org/all/20230905095535.1263113-3-quic_viswanat@quicinc.com/
[3] https://lore.kernel.org/all/169522934567.2501390.1112201061322984444.b4-ty@kernel.org/
> 
> [1] commit 72fc3d58b87b ("arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size")
> Fixes: 5d4753f741d8 ("hwspinlock: qcom: add support for MMIO on older SoCs")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/hwspinlock/qcom_hwspinlock.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index a0fd67fd2934..814dfe8697bf 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -115,7 +115,6 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
>  	{ .compatible = "qcom,sfpb-mutex", .data = &of_sfpb_mutex },
>  	{ .compatible = "qcom,tcsr-mutex", .data = &of_tcsr_mutex },
>  	{ .compatible = "qcom,apq8084-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
> -	{ .compatible = "qcom,ipq6018-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
>  	{ .compatible = "qcom,msm8226-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
>  	{ .compatible = "qcom,msm8974-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
>  	{ .compatible = "qcom,msm8994-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },

