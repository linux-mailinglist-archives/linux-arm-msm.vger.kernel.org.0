Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C737975F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjIGQAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240643AbjIGP7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 11:59:04 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32704284C2;
        Thu,  7 Sep 2023 08:47:26 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3876nb4Q016363;
        Thu, 7 Sep 2023 10:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=XLJztAV/phq5KKxeTjoRmOdM6LRYuvdNOdfunfImmz0=;
 b=O25m78kPKU3qPVRbzYBDctUw+uACsHY0eVcMND/kH9QtaP30r8S7NKwWXY2fpUdXNaVl
 61I4gN0MXSSqFhRY4D2syvGoR2EsKkLQHBqi1esiICEE1BdEnCGdpE7ICLzOJBxeLKhW
 /LMzvAvpW85q+GWTy68juVeVDrnaeK+kQ8f31ErWF9zJ45eV/2f/gVMoe0KoODbTN/lT
 dK1j16/8drhYgKFvLiy7EzaIg6Gbc6yhxHus2T8mQk/N9fKdc20ajsCKYm9vQNR8F79B
 MmBm4ClbtnTRF8LSSdFQKibSQLqO9DzHAn0CONi+7z2WH4uhsy+3ZDqE8Giy+le8iLsn GA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sy951ggcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Sep 2023 10:24:13 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 387AODmW007795
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 7 Sep 2023 10:24:13 GMT
Received: from varda-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 7 Sep 2023 03:24:09 -0700
Date:   Thu, 7 Sep 2023 15:54:05 +0530
From:   Varadarajan Narayanan <quic_varada@quicinc.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <20230907102405.GA7987@varda-linux.qualcomm.com>
References: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uepUk1hYhfIIYyBLxKaaYwTVyx55XYRF
X-Proofpoint-ORIG-GUID: uepUk1hYhfIIYyBLxKaaYwTVyx55XYRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=782 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070091
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 07, 2023 at 12:54:39PM +0300, Dan Carpenter wrote:
> This accidentally returns the wrong variable.  It should be "qphy->vreg"
> instead of "qphy->phy".
>
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> When we're adding new drivers then we should use the new driver
> prefix instead of the subsystem prefix.  For example:
>
>  Bad: [PATCH] phy: qcom: Introduce M31 USB PHY driver
> Good: [PATCH] phy: qcom-m31: Introduce M31 USB PHY driver
>
> That way it's obvious to the first person who sends a bugfix
> what the driver prefix is.
>
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
>
>  	phy_set_drvdata(qphy->phy, qphy);
> --
> 2.39.2

I believe this is addressed by https://lore.kernel.org/linux-arm-msm/20230824091345.1072650-1-yangyingliang@huawei.com/

Thanks
Varada
