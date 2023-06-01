Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE58C71EEC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjFAQY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 12:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjFAQYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 12:24:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F09B133;
        Thu,  1 Jun 2023 09:24:51 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351Ce1mY025423;
        Thu, 1 Jun 2023 16:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WNAynx4tlKqXRZp5kDxLG89UEaNImx42SZIHHfZDXfM=;
 b=atZgqiL3xeyOLWRoxI/AOXm9BRSfaqwpC4rhRKLyCk0Z9xVR3pMTmp7XwSSTUilh5F9M
 KXMmV3g1Jauy+YqoSRv/a2lDUY8G1mMcqaAiWyxC1oN7PAUe+tLIBOTwzKqHVYLF5kd0
 k2gGtqi41UBn6/GzRM8aOsgp2azkKhpB5J+y+SV0Dd30t1O9LylTT+l6zZTjl48izrgQ
 oLxUXunDWxsSP6DTjLU2jei8gTIzUGfAIJXJ7sGWoCgmbYYRA6CMl3vaEFuyHol0Ffsq
 cNN9EajVbR8NzSfeczRWlVJgqVvm5kBEC9746PqLrcZiC/CDHFzyT0IacMrINDy4tcvv qA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxugrgn8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jun 2023 16:24:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351GOPRD013298
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Jun 2023 16:24:25 GMT
Received: from [10.110.26.45] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 09:24:21 -0700
Message-ID: <d6fc9ce5-75e8-3b8d-a598-beb3cc18fd2a@quicinc.com>
Date:   Thu, 1 Jun 2023 09:24:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 11/13] drm/msm: Use regular fbdev I/O helpers
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
        <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <javierm@redhat.com>, <sam@ravnborg.org>,
        <suijingfeng@loongson.cn>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <intel-gfx@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-12-tzimmermann@suse.de>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230530150253.22758-12-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BwxUl_z5rEwYNDxEuLg0AizkPvjkYHQB
X-Proofpoint-GUID: BwxUl_z5rEwYNDxEuLg0AizkPvjkYHQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=657 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010142
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/30/2023 8:02 AM, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Msm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> Msm's fbdev emulation has been incomplete as it didn't implement
> damage handling. Partilly fix this by implementing damage handling
> for write and draw operation. It is still missing for mmaped pages.
> 
> v4:
> 	* use initializer macros for struct fb_ops
> 	* partially support damage handling
> v2:
> 	* use FB_SYS_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
