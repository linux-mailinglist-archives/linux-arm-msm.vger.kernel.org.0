Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D2175B70A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 20:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjGTSo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 14:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjGTSo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 14:44:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953E9E47
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 11:44:24 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36KBSs0r015413;
        Thu, 20 Jul 2023 18:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=2sSWXxg0H8c3Z2L7YfYwbW3qyJ7YqI3rXC6g2FOqB0M=;
 b=TDkXwpB8H6XEs9m8NKKm7rRZ+wZpg2UOyexb3uKO6fv95sJYilZh9OISOqRXOK3962Kq
 VPmQUeMPJULynmcxKT0PEkaVrnXqLyLxG/gZBVTZSXOpNZELzcxVt6e0USXaBWFTk//8
 r8XaPg+auTQ1CmevmojosX81ooypCtjqXzr0hszB0aA1pGPJwpmp9zRfWoQnJ75hFLuR
 ynO+fvAFI9UCOAuxEas0Ijkje+tSMpoxlBi2pteIjf5O3vOFzMEDrNV22y2JjdFZvmMA
 3SN0d5BNr6cfeMHnI3VVK2AZClACs2JdPgnPMZdYrQeCnv7x93tN1tAynZuBubb1JyAo 3g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxt18a6h6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jul 2023 18:44:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36KIhuca032716
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Jul 2023 18:43:56 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 11:43:55 -0700
Date:   Thu, 20 Jul 2023 11:43:54 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/1] soc: qcom: use devm_clk_get_enabled() in gsbi_probe()
Message-ID: <20230720184354.GB2667611@hu-bjorande-lv.qualcomm.com>
References: <20230720140834.33557-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720140834.33557-1-ruc_gongyuanjun@163.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4IlgilIMax_YshIt1GBGbwbsNK_PLvMn
X-Proofpoint-GUID: 4IlgilIMax_YshIt1GBGbwbsNK_PLvMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=979 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200158
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 20, 2023 at 10:08:34PM +0800, Yuanjun Gong wrote:
> in gsbi_probe(), the return value of function clk_prepare_enable()
> should be checked, since it may fail. using devm_clk_get_enabled()
> instead of devm_clk_get() and clk_prepare_enable() can avoid this
> problem.
> 

Nice, thank you.

> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/soc/qcom/qcom_gsbi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
> index f1742e5bddb9..de94a20d5814 100644
> --- a/drivers/soc/qcom/qcom_gsbi.c
> +++ b/drivers/soc/qcom/qcom_gsbi.c
> @@ -178,12 +178,10 @@ static int gsbi_probe(struct platform_device *pdev)
>  
>  	dev_info(&pdev->dev, "GSBI port protocol: %d crci: %d\n",
>  		 gsbi->mode, gsbi->crci);
> -	gsbi->hclk = devm_clk_get(&pdev->dev, "iface");
> +	gsbi->hclk = devm_clk_get_enabled(&pdev->dev, "iface");
>  	if (IS_ERR(gsbi->hclk))
>  		return PTR_ERR(gsbi->hclk);
>  
> -	clk_prepare_enable(gsbi->hclk);
> -
>  	writel_relaxed((gsbi->mode << GSBI_PROTOCOL_SHIFT) | gsbi->crci,
>  				base + GSBI_CTRL_REG);
>  
> @@ -212,8 +210,6 @@ static int gsbi_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, gsbi);
>  
>  	ret = of_platform_populate(node, NULL, NULL, &pdev->dev);

This can be further cleaned up by return of_platform_populate()
directly, and removing the ret variable. Can you please do that as well?

Thanks,
Bjorn

> -	if (ret)
> -		clk_disable_unprepare(gsbi->hclk);
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 
