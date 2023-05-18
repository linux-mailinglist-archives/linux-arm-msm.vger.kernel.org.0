Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0741D7079FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 07:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjERF7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 01:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjERF7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 01:59:41 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C8819B2;
        Wed, 17 May 2023 22:59:40 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I4ewOR007167;
        Thu, 18 May 2023 05:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Dl7oz8ammG7Mtz6su7HIBihAQ5DPUJKFWz3t7I0/z68=;
 b=aQO6L2LAMnD12uT9Oi91SCl6JlvsjuyePBcvmfv8WidMBCTYr59BgxfzBcDanIx6vr03
 U+kgkxbqs76EQgMqoYoBcqcP+BfwY8N6LKm+aa/VJIhmupDF1+JK6jO8yV3klizc6/3u
 crXMetHAsIyLTgZicxzGu5HbzBSlrBKM+iF2xMxVDNjWMYfwBCP8c+dR5dH6UkXwTWhE
 a4NjzXCPfbO+mdzenZKbNf1a7K5U+ORCoBm7aDCZekrUJoyA0f5eIV0U27QBAI8FJ3DD
 f9QS33dODPbsRFWBaKxoP/Y4Yf9WsQa4WXLe/SM1rPDrDUWA9CAB8pQ/Ci4ksOOlma6Z 5A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmt5gtn44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 05:59:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I5x9v4024850
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 05:59:09 GMT
Received: from [10.79.212.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 22:59:05 -0700
Message-ID: <d608dca5-7ff4-b820-47f0-b893f13b0fb6@quicinc.com>
Date:   Thu, 18 May 2023 11:29:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] accel/qaic: initialize ret variable to 0
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, <trix@redhat.com>,
        <ogabbay@kernel.org>, <nathan@kernel.org>,
        <ndesaulniers@google.com>, <jacek.lawrynowicz@linux.intel.com>,
        <quic_carlv@quicinc.com>, <stanislaw.gruszka@linux.intel.com>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20230517165605.16770-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From:   Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <20230517165605.16770-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8uC3he2BNT-JSWmepv3AsbaOH9RjZcVA
X-Proofpoint-ORIG-GUID: 8uC3he2BNT-JSWmepv3AsbaOH9RjZcVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180043
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/17/2023 10:26 PM, Jeffrey Hugo wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports
> drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
>    value returned to caller [core.uninitialized.UndefReturn]
>          return ret;
>          ^~~~~~~~~~
> 
>  From a code analysis of the function, the ret variable is only set some
> of the time but is always returned.  This suggests ret can return
> uninitialized garbage. However BO allocation will ensure ret is always
> set in reality.
> 
> Initialize ret to 0 to silence the warning.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Tom Rix <trix@redhat.com>
> [jhugo: Reword commit text]
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 8ab26e64b231..e42c1f9ffff8 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>   	struct qaic_bo *bo = to_qaic_bo(obj);
>   	unsigned long offset = 0;
>   	struct scatterlist *sg;
> -	int ret;
> +	int ret = 0;
>   
>   	if (obj->import_attach)
>   		return -EINVAL;

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
