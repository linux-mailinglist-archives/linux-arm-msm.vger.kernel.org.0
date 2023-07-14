Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB754753A03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 13:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbjGNLrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 07:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGNLrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 07:47:17 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EA12D49;
        Fri, 14 Jul 2023 04:47:17 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EBdK2X022892;
        Fri, 14 Jul 2023 11:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=I5T558B5YQgyepz5gu79TCUziba1MJXSqNKVlxcFyVs=;
 b=SCWL86Yoyk4M6vox8JAUQgGAnhk72uUoH1enJ7iDYORKhZ/nJ26nlKskz8PcG1s64jEy
 +qU7Cd04ei5bL3lg5gwtHp5x3GRSD0C7uazjMMN8IZ0KAFI2XaPhjrv8aCjEJ9nmQ4e7
 8ouu6XOzQEJ9U0grTIH71ICCHhYBXv8DA3fLTI+SzZOTbuE7HMiWJB5uHJae21pLrSbD
 a5pm+wFDvYj4HNy6hGwzSWfq7dKJodpZGMw+0SZuDuJRMvG2F5au1uOFR36TTwPj1+zt
 lSmDSL2e28014A+XmR8ZfSCu+OyZfmRI3E3SeAozCOZtfagDkNQetIrfCkU3K8nNnbSp dg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptu9m2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 11:46:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EBkhlt022602
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 11:46:43 GMT
Received: from [10.50.55.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 04:46:41 -0700
Message-ID: <20176ae3-025d-da15-0ff9-d68f533298dd@quicinc.com>
Date:   Fri, 14 Jul 2023 17:16:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/5 v4] accel/qaic: move and expand integer overflow
 checks for map_user_pages()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
CC:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <ZK0Q8hNiX5JlUPm3@moroto>
From:   Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <ZK0Q8hNiX5JlUPm3@moroto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M7Xb8HM78lWUjEmr8mLN-Maf--gT2h6s
X-Proofpoint-ORIG-GUID: M7Xb8HM78lWUjEmr8mLN-Maf--gT2h6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140106
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/11/2023 1:51 PM, Dan Carpenter wrote:
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
> no change
> 
>   drivers/accel/qaic/qaic_control.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 23680f5f1902..d5ce36cb351f 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -402,6 +402,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>   
>   	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
>   
> +	if (in_trans->size == 0 ||
> +	    in_trans->addr + in_trans->size < in_trans->addr ||
> +	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
Why not use xfer_start_addr ?
> +	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
> +		return -EINVAL;
> +
>   	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
>   				  resources->xferred_dma_size, PAGE_SIZE);
>   
> @@ -564,9 +570,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>   		     QAIC_MANAGE_EXT_MSG_LENGTH)
>   		return -ENOMEM;
>   
> -	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> -		return -EINVAL;
> -
>   	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
>   	if (!xfer)
>   		return -ENOMEM;
