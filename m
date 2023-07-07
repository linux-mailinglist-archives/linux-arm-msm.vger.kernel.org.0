Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E5874B6F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGGTQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGGTQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:16:54 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA45124;
        Fri,  7 Jul 2023 12:16:52 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367JBxHY006241;
        Fri, 7 Jul 2023 19:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uoMCcu0ADg9v8c98oqlOfQQ0Vzu/VwnylItfKHSz5EE=;
 b=FqqcraC+nK9LyuGERBnp3LG83eBYt7CV1pIiMumzoudD6Wz1LbsfZ+a62iecLajyRynN
 gE3cc5Vb5ZupDUnOyznDApgAY6SNcmxZsZTrWDHHK8qS4LHQvUCTDYbJiXrmx53AItih
 9kEe601NynZCSxMRlYUxg47uxH7PrkzxWDzf+dZ3/i65ai/zgd/elOKPHCODTY2lhuVw
 Uduyokz1qyy89q+HmfTqjN+xPQ2lmhD/J/Nrle0V1ZxUhZHN+Y0STNCEgW+07aMlLCp4
 7TnTNAxT+NSu9rhE+rjxHOnuWMA1agL2gf4naDAEeMgneRtm/Tyukv/PxVS++8q6hyBc VA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp96vta7g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 19:16:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367JGksk011973
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Jul 2023 19:16:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 12:16:45 -0700
Message-ID: <5242e7c1-7718-91f4-fbaa-a9c42a9343b0@quicinc.com>
Date:   Fri, 7 Jul 2023 13:16:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/5] accel/qaic: move and expand integer overflow checks
 for map_user_pages()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        "Jacek Lawrynowicz" <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <435abccc-9251-4c27-9b35-8fdf4bbd2433@moroto.mountain>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <435abccc-9251-4c27-9b35-8fdf4bbd2433@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c-4RBNjQzR4gSQxKE97-41DXiCjClPqn
X-Proofpoint-GUID: c-4RBNjQzR4gSQxKE97-41DXiCjClPqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070177
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/21/2023 1:22 AM, Dan Carpenter wrote:
> The integer overflow checking for find_and_map_user_pages() was done in
> encode_dma().  Presumably this was to do it before the allocation.  But
> it's not super important that the failure path is a fast path and it
> hurts readability to put the check so far from the where the variable is
> used.
> 
> Move the check to find_and_map_user_pages() instead and add some more
> additional potential integer overflow checks.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> I kind of went to town adding integer overflow checks here.  Please,
> review this extra carefully.
> 
>   drivers/accel/qaic/qaic_control.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 96a26539df18..03932197f1ac 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -401,6 +401,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>   
>   	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
>   
> +	if (in_trans->size == 0 ||
> +	    in_trans->addr + in_trans->size < in_trans->addr ||
> +	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
> +	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)

These checks seem correct to me.
However, I wonder if it would be better to use check_add_overflow() 
instead of open coding the check?  Feels like that would make the 
purpose of the code clearer and reduce the possibility that the logic is 
wrong.

For the final check, I'm thinking that it does not need to check against 
resources->xferred_dma_size and can check against in_trans->size 
instead, which would then make the use of check_add_overflow() possible. 
  xferred_dma_size should be trusted, and should be <= size.  So then, 
the only way it would appear that check fails is addition overflow, and 
so checking against size should then be valid.

> +		return -EINVAL;
> +
>   	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
>   				  resources->xferred_dma_size, PAGE_SIZE);
>   
> @@ -563,9 +569,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>   		     QAIC_MANAGE_EXT_MSG_LENGTH)
>   		return -ENOMEM;
>   
> -	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> -		return -EINVAL;
> -
>   	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
>   	if (!xfer)
>   		return -ENOMEM;

