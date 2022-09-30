Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5DC5F0273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 03:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiI3BxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 21:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiI3BxK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 21:53:10 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF90C3DE3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 18:53:03 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28U1AUmi030804;
        Fri, 30 Sep 2022 01:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6JtyLI4T5Y+MyTtKxWvLyrSO5E2Gj6P2R5yJG/K2FHw=;
 b=BjepNA/3oueJPSBu0PWvm1ee2ppmBpRYF+suAaJ5E5mMDIWXA8yHVLRrC8T4onsxZs/T
 yu0zOW4iTinZsND8fYfKUaWgNAor8A1k/rl5JXuQ3Ozt9UDbSf3La8gN2mIHbtBX6SCZ
 cwQ475zIdc7AQLhylISKk6BY5PAZT2Qjrp5+P7GBQ3LToDqhcyxWGAVCDrNHQi0WvU/G
 RCcuBEpg2hvIIsii3Ta3LdNuBSJvI3ftKzQSf1UOL7AJSaCfZzZUxfqRDyDh3pe6lsmn
 A36bagcdqhZDm0lkpwk8nqVaxKRrXD3ToxN8VXiYHVmfoSiAdVIu80OEVyKsbdXGtINq /Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jw4pc3r9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Sep 2022 01:52:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28U1qXKZ001892
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Sep 2022 01:52:33 GMT
Received: from [10.50.63.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 29 Sep
 2022 18:52:30 -0700
Subject: Re: [PATCH] phy: qcom-qmp-usb: correct registers layout for IPQ8074
 USB3 PHY
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        Robert Marko <robimarko@gmail.com>
References: <20220929190017.529207-1-dmitry.baryshkov@linaro.org>
From:   Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Message-ID: <1699f970-c27d-7454-7017-288eba1e3118@quicinc.com>
Date:   Fri, 30 Sep 2022 07:22:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220929190017.529207-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VtmpKQIkbUW2NpxoPXYs6fn2LhOcTiQs
X-Proofpoint-GUID: VtmpKQIkbUW2NpxoPXYs6fn2LhOcTiQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=847 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300010
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/30/2022 12:30 AM, Dmitry Baryshkov wrote:
> According to the kernel 4.4 sources from NHSS.QSDK.9.0.2 and according
> to hardware docs, the PHY registers layout used for IPQ8074 USB3 PHY is
> incorrect. This platform uses offset 0x174 for the PCS_STATUS register,
> 0xd8 for PCS_AUTONOMOUS_MODE_CTRL, etc.
>
> Correct the PHY registers layout.
>
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
> Fixes: 507156f5a99f ("phy: qcom-qmp: Add USB QMP PHY support for IPQ8074")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index b84c0d4b5754..c3e7a860582b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -1616,7 +1616,7 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>   	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
>   	.vreg_list		= qmp_phy_vreg_l,
>   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> -	.regs			= usb3phy_regs_layout,
> +	.regs			= qmp_v3_usb3phy_regs_layout,
>   
>   	.start_ctrl		= SERDES_START | PCS_START,
>   	.pwrdn_ctrl		= SW_PWRDN,

Reviewed the docs, changes looks good to me.

Reviewed-by: Kathiravan T<quic_kathirav@quicinc.com>

