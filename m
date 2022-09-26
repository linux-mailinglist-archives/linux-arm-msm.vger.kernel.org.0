Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6505EAFF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 20:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiIZSdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 14:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiIZSdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 14:33:42 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1354F5C34C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 11:33:40 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QIBG0P028897;
        Mon, 26 Sep 2022 18:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iJBTAqXN/XXcUOGDVDgIc8+945bIMYNQLu9jWVBWuUw=;
 b=G+1mWz+BDcNhdsgBYmethwtY8wqDjzmvHjVFPealhndgTu3hCkp8bgSORyyc1k+LrTfa
 UKw2btkzuOG8uwh3fsK6c60+qQqajSJjj43hjHjk+936MIndQP2vD9C4FksCSLWk0M3b
 6iQAQNXa+LfXRvXxeBGlPVXYX9iUmtbDHXw8SxTKwRsUU53FbAJ+t+uLbNIAnO0PEAwJ
 P90MiLSgB4Mf7g2Gmo6+hcYCAjPUoi23jdW7pnYPuvwRzXxnWQ/nYhkFxkOHcbx5vwxV
 1jwj0ev8MeJt/Kb5+V2giaUpcD+uIUwQsGyTD4SOMRNM2kehrux93xNx3GOkehVQ5pEU Qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jssg6vds2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 18:33:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28QIXWLS009583
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 18:33:32 GMT
Received: from [10.111.163.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 26 Sep
 2022 11:33:30 -0700
Message-ID: <aba835e2-65f6-b965-d4fb-cbbebee6478d@quicinc.com>
Date:   Mon, 26 Sep 2022 11:33:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: use DEFINE_SHOW_ATTRIBUTE to simplify
 dpu_regset32
Content-Language: en-US
To:     Liu Shixin <liushixin2@huawei.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220922142147.3246649-1-liushixin2@huawei.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220922142147.3246649-1-liushixin2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PsZAPvwMCCA6cFHVhpgfy-l5zfet0dpI
X-Proofpoint-ORIG-GUID: PsZAPvwMCCA6cFHVhpgfy-l5zfet0dpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260115
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/22/2022 7:21 AM, Liu Shixin wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Looks reasonable to me

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5e6e2626151e..f3660cd14f4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -194,7 +194,7 @@ struct dpu_debugfs_regset32 {
>   	struct dpu_kms *dpu_kms;
>   };
>   
> -static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
> +static int dpu_regset32_show(struct seq_file *s, void *data)
>   {
>   	struct dpu_debugfs_regset32 *regset = s->private;
>   	struct dpu_kms *dpu_kms = regset->dpu_kms;
> @@ -227,19 +227,7 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>   
>   	return 0;
>   }
> -
> -static int dpu_debugfs_open_regset32(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, _dpu_debugfs_show_regset32, inode->i_private);
> -}
> -
> -static const struct file_operations dpu_fops_regset32 = {
> -	.open =		dpu_debugfs_open_regset32,
> -	.read =		seq_read,
> -	.llseek =	seq_lseek,
> -	.release =	single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(dpu_regset32);
>   
>   void dpu_debugfs_create_regset32(const char *name, umode_t mode,
>   		void *parent,
> @@ -259,7 +247,7 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
>   	regset->blk_len = length;
>   	regset->dpu_kms = dpu_kms;
>   
> -	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
> +	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
>   }
>   
>   static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
