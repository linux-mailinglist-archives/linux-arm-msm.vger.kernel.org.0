Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89CB775BCED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 05:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjGUDsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 23:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjGUDri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 23:47:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F03D2D58
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 20:46:48 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L1pq7f003433;
        Fri, 21 Jul 2023 03:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=+YlhCTxSKFtAXzmIyuSYXSbnNwVWT4OrjvrRMyMtbAw=;
 b=App/zAiKs/E/IoZ5FL17X6duGy2Ksx9E1P/74DCSiiSpLoqQk8sid/QbfnrGE+V2o7P5
 uO8lo4lit2pdZn8XgNaBDUWfsdNOCAQXtBRflNXsVGUZUEbG5O2+5KKPVzgh8xXoYAwu
 iAdw71I4Cu5ZeI1ZNps0sz1eIlI1UgtJD4CFXbA2AGkoCjxD88YRWcPiGHlZSadB9ayX
 EPxHuyfuHH/9DgYK/WX63tpAXkU20Vj1n4fPE5A45thItanT0WFCMUJu5AMDM7ytKt1i
 14JGrGGZ39lmxRp9rYD5JuTJp49bopuwcu4gPHuj61a8e+urPToSzTMaaxf0TypHMv// 5g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ryg7w06ry-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 03:45:54 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L3jfVJ024166
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 03:45:41 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 20:45:41 -0700
Date:   Thu, 20 Jul 2023 20:45:40 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/1] soundwire: use devm_clk_get_enabled() in
 qcom_swrm_probe()
Message-ID: <20230721034540.GA1428172@hu-bjorande-lv.qualcomm.com>
References: <20230720140845.33734-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720140845.33734-1-ruc_gongyuanjun@163.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1KbWUAzYDNO8EUrvk0ahP9xDsS96snSl
X-Proofpoint-ORIG-GUID: 1KbWUAzYDNO8EUrvk0ahP9xDsS96snSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_01,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=867 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210034
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 20, 2023 at 10:08:45PM +0800, Yuanjun Gong wrote:
> in qcom_swrm_probe(), the return value of function
> clk_prepare_enable() should be checked, since it may fail.
> using devm_clk_get_enabled() instead of devm_clk_get() and
> clk_prepare_enable() can avoid this problem.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/soundwire/qcom.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7970fdb27ba0..04bc917b7a70 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1549,14 +1549,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	ctrl->hclk = devm_clk_get(dev, "iface");
> +	ctrl->hclk = devm_clk_get_enabled(dev, "iface");

This gives the impression that hclk is to be enabled from probe() until
cleanup, but hclk is toggled during suspend/resume. So I'm not entirely
sure this is good practice.

If we choose to use devm_clk_get_enabled() then you need to remove the
clk_disable_unprepare() from qcom_swrm_remove().

If you choose to solve your problem by checking the return value of
clk_prepare_enable(), note that you have one in swrm_runtime_resume() as
well.

Regards,
Bjorn
