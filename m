Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C827E1A74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 07:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjKFGqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 01:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjKFGqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 01:46:38 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D006F10D9
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 22:46:11 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A64r2hv026218;
        Mon, 6 Nov 2023 06:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OnrqeFkEtjoiCXc0Ehn8zHQ5TrYWKJUb+9NiVzRaJy8=;
 b=lJlSy7DtctKbl5AImy5C9ilPnhCEwwTaufJ1ncSSvO/tEl8OYEznt2FeoHwSiHR4MBal
 8QJmS3W1tq6626P4M9Ni/nrH8aLSJ5EQyfvsssz2rW99ffIyFeIYnOeGS6qHMKFnQo4W
 lu1yLu1s+fKYtLAtsI+Nbvb3q3aahYhXgR2VIQWpQG3JHmMxDjp5+jmP0drJFCUDr45O
 D06r4WablEjKOAbrrkYY0iKPleqOFXstTS7pWKJAN5FfuO5RpHDoCIkK35R/zYXvCDEW
 m21XRsszF6pRB+I+SbfizaV8InN60XRCJn7a3z/ZYpvCcUyVv+vqZbCPfQmu7s/z2N6H /w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5eg8k8qy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Nov 2023 06:46:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A66jx9D015485
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Nov 2023 06:45:59 GMT
Received: from [10.214.66.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sun, 5 Nov
 2023 22:45:55 -0800
Message-ID: <aabb8345-7b5d-447d-af79-1e5743465315@quicinc.com>
Date:   Mon, 6 Nov 2023 12:15:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-combo: correct sm8550 PHY
 programming
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BXb1BOMnmb-MWZmC_WvRXrFSZp44gJES
X-Proofpoint-ORIG-GUID: BXb1BOMnmb-MWZmC_WvRXrFSZp44gJES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_04,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=743 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060057
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/12/2023 2:08 AM, Dmitry Baryshkov wrote:
> Fix several small issues with the QMP USB+DP PHY programming on the
> Qualcomm SM8550 platform.

Hi Dmitry,

Can we have a conclusion on this series? The USB support series [1] for 
SDX75 depends on it.
[1] 
https://lore.kernel.org/all/1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com/

Thanks,
Rohit.
>
> Dependencies: [1]
>
> [1] https://lore.kernel.org/all/20230829-topic-8550_usbphy-v3-0-34ec434194c5@linaro.org/
>
> Changes since v1:
> - Rebased on top of Konrad's patchet ([1])
>
> Dmitry Baryshkov (3):
>    phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
>    phy: qcom-qmp-usb: move PCS v6 register to the proper header
>    phy: qcom-qmp-combo: use v6 registers in v6 regs layout
>
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 50 +++++++++----------
>   .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 28 +++--------
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    | 20 +++++++-
>   3 files changed, 50 insertions(+), 48 deletions(-)
>
