Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D7C786DE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 13:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240999AbjHXLdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 07:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240994AbjHXLc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 07:32:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FD510FE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:32:57 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OAnRNl022037;
        Thu, 24 Aug 2023 11:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=0QaVNxjiNjG5EwCHQtuXcZmwx/t3Lh1mN2Puh1m1cWQ=;
 b=JajH69YDqWA8s8fHQbhTOtiNoaRd46lbpqVJfF0nkca+o024MFOszUATl24NTxhKtpQK
 91vkb2gkmxZ6W7wcJrKfVRGj5B4yC8v5lbPR5ZtO7v+HXHfH7/Ri/c/N7awMVVxX4V7x
 khm4JUwvIP4eAdW0BkLKSZohdtevriBYAaVf59QxQ8Ye5US4SzOdz5QXl74BoLskoY4z
 3621fjkr/TjC1Vm6YxdNMHttxCyegrfCqU4A53mLIp9j9eStD75k1azGh9i16+8cADrU
 o+5ge32mqQ2RSqtP1YrdOKUVVh/Iyy+HvwHLAkeDvRhcFD+JrK9UvoQXQJX1R3Agz0i1 rA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snxtarxqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Aug 2023 11:32:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OBWkem005617
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Aug 2023 11:32:46 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 24 Aug 2023 04:32:44 -0700
Date:   Thu, 24 Aug 2023 17:02:40 +0530
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
CC:     <linux-phy@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <andersson@kernel.org>, <vkoul@kernel.org>
Subject: Re: [PATCH -next] phy: qcom: phy-qcom-m31: fix wrong pointer pass to
 PTR_ERR()
Message-ID: <20230824113240.GB15057@varda-linux.qualcomm.com>
References: <20230824091345.1072650-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824091345.1072650-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8RT5FMWAcYhkrVEwbV8Yop1BeouDaYdH
X-Proofpoint-GUID: 8RT5FMWAcYhkrVEwbV8Yop1BeouDaYdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_08,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240094
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 24, 2023 at 05:13:45PM +0800, Yang Yingliang wrote:
> It should be 'qphy->vreg' passed to PTR_ERR() when devm_regulator_get() fails.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> index ed08072ca032..99d570f4142a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> @@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
>  
>  	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
>  	if (IS_ERR(qphy->vreg))
> -		return dev_err_probe(dev, PTR_ERR(qphy->phy),
> +		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
>  						"failed to get vreg\n");

Reviewed-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Thanks
Varada

>  
>  	phy_set_drvdata(qphy->phy, qphy);
> -- 
> 2.25.1
> 
