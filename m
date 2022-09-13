Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2855B7D8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 01:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiIMXg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 19:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiIMXg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 19:36:57 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243C33E3C;
        Tue, 13 Sep 2022 16:36:56 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DNMRi9016447;
        Tue, 13 Sep 2022 23:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QDluYs9EIrWXj5kwYq7EJZq+XOtXveaKEk1PTPlIhsk=;
 b=YcoCMWZS41WvZftzE7mBuQO6ToHgy1Rwn5kg2ijWizmAO2ITAC/CidkSztk4pXS28ZVk
 bD3PZsOFLt7xtNXLkMmme4Pr1V5YUO/r/AmMzocl79X/z9tWApjrxGHyrUO6SP/JhOgw
 Af2r7D6nmGY1pnUUawNVuFEnLnF+nSai5mebq+e4dK4bU4Ba9e86XRhH2LQ0v+oLJakL
 duwLajymcbq++xuULVoQ39z5eeTKKNBl2RhghmwMfDto+K0supA1dp/uwOiDSup8GHJH
 xDWCJTs0FzTL6r/uD5GMtwYGC9iLH8xAyqw1ri3cTLpwvTzKCG48DPX21Chbsz2p/B+1 +A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjxymgn79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Sep 2022 23:36:40 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28DN1Onp000852;
        Tue, 13 Sep 2022 23:01:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jjqbt2j7n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Sep 2022 23:01:24 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DN0TVc032424;
        Tue, 13 Sep 2022 23:01:24 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 28DN1OxS000846
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Sep 2022 23:01:24 +0000
Received: from [10.111.167.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 16:01:21 -0700
Message-ID: <2ce64f0a-8e31-4019-8d3e-49ca3ddd4766@quicinc.com>
Date:   Tue, 13 Sep 2022 16:01:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix return type of
 mdp4_lvds_connector_mode_valid
Content-Language: en-US
To:     Nathan Huckleberry <nhuck@google.com>
CC:     <freedreno@lists.freedesktop.org>,
        Dan Carpenter <error27@gmail.com>,
        David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
        <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
        <dri-devel@lists.freedesktop.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
References: <20220913205551.155128-1-nhuck@google.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220913205551.155128-1-nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DpLLdyEnhGfPp-TYtzvZVzRkbO5p3Ffx
X-Proofpoint-GUID: DpLLdyEnhGfPp-TYtzvZVzRkbO5p3Ffx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_10,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209130109
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Nathan

Thanks for the patch.

On 9/13/2022 1:55 PM, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                       struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of mdp4_lvds_connector_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

 From what I can see this one has been this way since lvds support was 
added. Hence this should have

Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7288041dd86a..7444b75c4215 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
>   	return ret;
>   }
>   
> -static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +static enum drm_mode_status
> +mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
> +			       struct drm_display_mode *mode)
>   {
>   	struct mdp4_lvds_connector *mdp4_lvds_connector =
>   			to_mdp4_lvds_connector(connector);
