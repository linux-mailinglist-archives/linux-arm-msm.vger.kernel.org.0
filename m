Return-Path: <linux-arm-msm+bounces-26406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36900933721
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688901C2135F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 06:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EE612B6C;
	Wed, 17 Jul 2024 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VDiexc/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFF13ACC;
	Wed, 17 Jul 2024 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197972; cv=none; b=YDpKzCxhQGv3H3ocpN47w4F9D1GLxRZKMXWcVF+0OeanUOOncEdroJfHQ+vm0rv6hQ2KVFtc1IDUGR5aexUD5jXsKQxSvwepiX5oEVpAOtkD5khahYOtxTKdnIr+jM1ksVsx7e4rGORKVDsvawMZlzOri4uo1/cc8cd/5CDbtE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197972; c=relaxed/simple;
	bh=FLMKdQTAzcJMUBa/iZxVuBfsZ2o69ZqeF6US49UERP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0S2ChwCjLV0Wnonnjqiaho6RKkT1ih9ucpEcajf1G5CyCgrpq8vAlS9ytHz6cdlUtt2WSpKueQmZt3KTIaGOhGgrCsjnXvNaI2cQ0dbYFJeXaveif68EFMz2WQeYmVXoYBxcmPfU/R8MBmhTvzH0ckBLAazvFBHoUR7m+kf5Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VDiexc/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfY1s007011;
	Wed, 17 Jul 2024 06:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYrSmjHuBj1kCmSBVioflAmZ45t/EzDpNGXKhx0A75U=; b=VDiexc/ajpiRySNk
	sviEuNk1NvfPGnuwUKDegqZghsr7SD0K89cCC8oPO+4b3HfBsbG/B7xx/iDXq5Sz
	QBNpELBCTkiKOmRXIyL0cGGP7lMisCG7hIAyAp/OGfBDN4FowI9be1hO+Y/oxsse
	I4f6flWn/Zi2PfhVEBa90CiD3SQn06aB/mcV8QTW8nhpIm5jnc9V+dE/LvEJ68/E
	x2NCr9WxwV1+eceHy5be7eudAaJ2z7IQZpaUgjnvXLLI+n4Mlt9ASzJF66lMyux9
	/nZJ5U80br9FXygwtZCY4xAontIuQ+0aJw8CSfr5dcYG7vqu1wp9UEGvqa8ZEvha
	/j7TxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfx9bwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:32:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H6WeLP021812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:32:40 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 23:32:37 -0700
Message-ID: <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
Date: Wed, 17 Jul 2024 12:02:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>
CC: <dmitry.baryshkov@linaro.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: awqGHn7mLAqFUyQxJlf1tj2LVeoh9Z6x
X-Proofpoint-GUID: awqGHn7mLAqFUyQxJlf1tj2LVeoh9Z6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_03,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170048


On 7/15/2024 8:29 PM, Bryan O'Donoghue wrote:
> We have both shared_ops for the Titan Top GDSC and a hard-coded always on
> whack the register and forget about it in probe().
>
> @static struct clk_branch camcc_gdsc_clk = {}
>
> Only one representation of the Top GDSC is required. Use the CCF
> representation not the hard-coded register write.
>
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo X13s
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sc8280xp.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 479964f91608..f99cd968459c 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -3031,19 +3031,14 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
>   	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
>   	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
>   
> -	/* Keep some clocks always-on */
> -	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */


As I mentioned on [1], this change might break the GDSC functionality. 
Hence this shouldn't be removed.


[1] 
https://lore.kernel.org/linux-clk/0b84b689-8ab8-bcdf-f058-da2ead73786c@quicinc.com/


> -
>   	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
>   	if (ret)
> -		goto err_disable;
> +		goto err_put_rpm;
>   
>   	pm_runtime_put(&pdev->dev);
>   
>   	return 0;
>   
> -err_disable:
> -	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);


This change is required, hence can go as a separate patch.


>   err_put_rpm:
>   	pm_runtime_put_sync(&pdev->dev);
>   
>
> ---
> base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> change-id: 20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-274f11b396ac
>
> Best regards,

