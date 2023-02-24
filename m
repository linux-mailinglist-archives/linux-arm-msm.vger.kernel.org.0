Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91736A20F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 18:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjBXR63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 12:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjBXR63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 12:58:29 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B409E1ACD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 09:58:27 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OCSiVW026898;
        Fri, 24 Feb 2023 17:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CgJk6NPcXCP97Mt4LfHWYEcez64DBUnFG9Z0CwJz8u0=;
 b=mIEp4SUBgmSXZ43HyHSZ7gdeiXjPd8YWM6pH/ckg2qOMjavrfAFSJP/V98lGcseq3cGM
 b/7ArgVaHNErTAQ0R+EbRQTiX/XZBIYTwVpq55G9aTirW+6glLLT4+WL15uzMwQSWwbs
 jK78MNSzDKLZh/L7ca3vv2eMCS+jxpNW4B4CCS2daZkajqfh+9ae/1gvIz5g4ll8+Bz0
 etn/VIP2oqD9899qxu+QxJ5e40LFyoOTI9jQmdPnIZzlcDA+VMLQy3iq+l31FmZEUNcR
 Q7tY9mIR6Ajnmx4xswAcc8nEVFdvjC/TddB4VgAbLo8eBQtNOz5rV4PK7XmgOftZ/17/ sw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxugh95p1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 17:58:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OHwIFe028205
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 17:58:18 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 09:58:17 -0800
Message-ID: <4143ed74-8945-fa67-62c9-a37d6cf93498@quicinc.com>
Date:   Fri, 24 Feb 2023 09:58:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, <javierm@redhat.com>,
        <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20230222123712.5049-1-tzimmermann@suse.de>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230222123712.5049-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SGFMjtUWD8iqOKIF75LQdZIrXsmS0-uU
X-Proofpoint-ORIG-GUID: SGFMjtUWD8iqOKIF75LQdZIrXsmS0-uU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=519 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240141
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/22/2023 4:37 AM, Thomas Zimmermann wrote:
> Do not run drm_fb_helper_unprepare() if fbdev allocation fails. Avoids
> access to an uninitialized pointer. Original bug report is at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/ # 1
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
