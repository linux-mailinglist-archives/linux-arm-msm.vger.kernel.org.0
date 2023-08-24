Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C77E786E0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 13:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbjHXLe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 07:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241145AbjHXLeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 07:34:14 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1766B19A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:34:03 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O9wqlb029932;
        Thu, 24 Aug 2023 11:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=6UDhM9s3fnBshMjolhFp56Wl7D/Y9UTV7Pku1zfaLPY=;
 b=K3/cLCJG63X/7BfBTNLBkhJFlWcNtliwHLGF0QRsdKl1udV/6INRQsjLYkN1pMVozg91
 Lz58YkJXT0qC6ELDds3TA04RBdaF/CHniE7j5C+YKa8oiF4JLvOpoKm7plKtfQbuXJjX
 cWYLHUjkHdahjJWVDCsHBeJnnu+/dYeMFELQufpFm5WT5uL6h2DutyJa9WGYu2ZYT1nu
 yyfwbpETkmVKQz09AGy4F/H/u/BoH51mmnIKuByQIfmSmgynt27N+8KsFVqizK0mTihx
 PZd0wxb7JGLCEyEXLRD7Z4huRY0BBbfYkvjqL63T44CQLTIgT9CbSFsK4Cz4VixnKhkP kA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sp4sbr6cp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Aug 2023 11:33:50 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OBXnfP003572
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Aug 2023 11:33:49 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 24 Aug 2023 04:33:47 -0700
Date:   Thu, 24 Aug 2023 17:03:43 +0530
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
CC:     <linux-phy@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <andersson@kernel.org>, <vkoul@kernel.org>
Subject: Re: [PATCH -next] phy: qcom: phy-qcom-m31: change m31_ipq5332_regs
 to static
Message-ID: <20230824113342.GC15057@varda-linux.qualcomm.com>
References: <20230824092356.1154839-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824092356.1154839-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 60qWOQ2dMIdS5RX6utxAlPgvy2hVv6-y
X-Proofpoint-GUID: 60qWOQ2dMIdS5RX6utxAlPgvy2hVv6-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_07,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240093
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 24, 2023 at 05:23:56PM +0800, Yang Yingliang wrote:
> m31_ipq5332_regs is only used in phy-qcom-m31.c now, change
> it to static.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> index 99d570f4142a..014278e5428c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> @@ -82,7 +82,7 @@ struct m31_priv_data {
>  	unsigned int			nregs;
>  };
>
> -struct m31_phy_regs m31_ipq5332_regs[] = {
> +static struct m31_phy_regs m31_ipq5332_regs[] = {
>  	{
>  		USB_PHY_CFG0,
>  		UTMI_PHY_OVERRIDE_EN,

Reviewed-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Thanks
Varada

> --
> 2.25.1
>
