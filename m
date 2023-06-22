Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E016D739F62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 13:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjFVLYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 07:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjFVLYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 07:24:17 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE48A10C1;
        Thu, 22 Jun 2023 04:24:15 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35M5gofj002379;
        Thu, 22 Jun 2023 11:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SgvYUEg4wWIl9XdzdYhSXdwnPQL38BSZhqGnsqa/o4c=;
 b=aV6X9m+zqRqFPzDCz7Huxt67Omj6gUb1D/6mH3tRxNePHuKWjFBMItuQwFzdQY9LeJoN
 QHoOXwBw891PJB0hpZv/c1k8EcfhuH/o7ZAYVG5mmSwtH2xKADdx17d7KnMx5+V/yDmY
 uujvuCFWOV5TAewADYeL7cJ3R93b03QMGd/xGTJfJLGFREa+loi/tWH49IgAGlgy813+
 +Q6I58O/h1rR2XWjqQKo5XrVPlZfBIoafYUUemRcCiQvx0O49oclydkze/idiva02y4D
 TLdVcKLtHjxdvjRisPcIRzJO8c1tCDH6nvUfU+egvIkSx5aGIFDbY9tA8hNdzoM+YPAp MQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbykdjush-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 11:24:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MBO8uM004953
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 11:24:08 GMT
Received: from [10.79.212.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 04:24:05 -0700
Message-ID: <95ed2c6b-df33-a252-8eba-3cb848c5c40b@quicinc.com>
Date:   Thu, 22 Jun 2023 16:54:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
CC:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
Content-Language: en-US
From:   Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zCiBuYaZXBwd9gjT-P01LsSqgasUJbcq
X-Proofpoint-GUID: zCiBuYaZXBwd9gjT-P01LsSqgasUJbcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_08,2023-06-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220095
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/21/2023 12:51 PM, Dan Carpenter wrote:
> There are several issues in this code.  The check at the start of the
> loop:
> 
> 	if (user_len >= user_msg->len) {
> 
> This check does not ensure that we have enough space for the trans_hdr
> (8 bytes).  Instead the check needs to be:
> 
> 	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> 
> That subtraction is done as an unsigned long we want to avoid
> negatives.  Add a lower bound to the start of the function.
> 
> 	if (user_msg->len < sizeof(*trans_hdr))
> 
> There is a second integer underflow which can happen if
> trans_hdr->len is zero inside the encode_passthrough() function.
> 
> 	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));
> 
> Instead of adding a check to encode_passthrough() it's better to check
> in this central place.  Add that check:
> 
> 	if (trans_hdr->len < sizeof(trans_hdr)
> 
> The final concern is that the "user_len + trans_hdr->len" might have an
> integer overflow bug.  Use size_add() to prevent that.
> 
> -	if (user_len + trans_hdr->len > user_msg->len) {
> +	if (size_add(user_len, trans_hdr->len) > user_msg->len) {
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This is based on code review and not tested.
> 
>   drivers/accel/qaic/qaic_control.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 5c57f7b4494e..a51b1594dcfa 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   	int ret;
>   	int i;
>   
> -	if (!user_msg->count) {
> +	if (!user_msg->count ||
> +	    user_msg->len < sizeof(*trans_hdr)) {
Can we have something like this here
user_msg->len < sizeof(*trans_hdr) * user_msg->count, no?
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   	}
>   
>   	for (i = 0; i < user_msg->count; ++i) {
> -		if (user_len >= user_msg->len) {
> +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
Do you think it is more readable if we have something like this
user_len + sizeof(*trans_hdr) >= user_msg->len
>   			ret = -EINVAL;
>   			break;
>   		}
>   		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
> -		if (user_len + trans_hdr->len > user_msg->len) {
> +		if (trans_hdr->len < sizeof(trans_hdr) ||
> +		    size_add(user_len, trans_hdr->len) > user_msg->len) {
>   			ret = -EINVAL;
>   			break;
>   		}

Hey Dan, Thank you for going through qaic driver. You patches are very 
much appreciated. This is good work.
