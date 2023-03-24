Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D0D6C8555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 19:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjCXSsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 14:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjCXSsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 14:48:22 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8A626B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 11:48:21 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OAtBrm026240;
        Fri, 24 Mar 2023 18:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z4HwbR1jttxjFB8Rt7hZvOwHBFqZrpbH2eATJiXVVT4=;
 b=NaAvbsb/r37UEY4QweUa7jPFMUvxvOPZcf3G+54ZK47slCPa9L9gyglGTGR08XuAN5Dc
 vxn/qe0jaJVBA4cxpL8XUNUaGiE5Lv5/DWyZq2cae2CTvSPhAzMQdL1+9eLFt9Y+xUQd
 h6LdOlMvsl4WEa04Trsv8Fvl+9bxQvmqS+F7+YVXVlgAV3S7WZmy7b50xgXzeZl9fHsO
 2d+L3l9f2pdMD09tPGuCXcu2HTxhe25KoViM94JFxNCkeI4wHj1KshN2eVjyzFgMYVpp
 csmmGi0280jxWVu2F8Bri6srSsPB0GrwvFzExbGZe7OoGuz7UAhR0mFUcR+LpCu/2utM cQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgxr1auwd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 18:48:06 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32OIm6oi029515
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 18:48:06 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Mar
 2023 11:48:05 -0700
Message-ID: <22a1632a-e622-6b47-92ca-737a1d0de4a3@quicinc.com>
Date:   Fri, 24 Mar 2023 11:47:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/msm/dpu: Add support for AR30 format
To:     Leonard Lausen <leonard@lausen.nl>, <robdclark@gmail.com>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6f33219dc848ccd7122bce6933338033aa18c33c@lausen.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G6wxnR-01gt2wz-6-3GYSmbZe3W04EQp
X-Proofpoint-ORIG-GUID: G6wxnR-01gt2wz-6-3GYSmbZe3W04EQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303240147
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/20/2023 7:58 PM, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed enabling support for the
> corresponding per-pixel alpha-blending AR30 color format.
> 
> Declaring only XR30 but not AR30 color format support can trigger bugs in
> userspace. KDE KWin compositor versions prior to 5.27.3 for example prefer
> 10-bit color formats, rendering a 1cm^2 black box around the cursor due to
> missing per-pixel alpha-blending.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

Hi Leonard,

Was able to validate the changes on SC7180 with null_platform_test and 
modetest.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
>   3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index d95540309d4d..2b1ef186b909 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -536,6 +536,16 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
>                  true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
>                  DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
>   
> +       /* XRGB2101010 and ARGB2101010 purposely have the same color
> +        * ordering.  The hardware only supports ARGB2101010 UBWC
> +        * natively.
> +        */
> +       INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
> +               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> +               true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
> +
>          PSEUDO_YUV_FMT_TILED(NV12,
>                  0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                  C1_B_Cb, C2_R_Cr,
> @@ -591,6 +601,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
>                  {DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
>                  {DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
>                  {DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
> +               {DRM_FORMAT_ARGB2101010, COLOR_FMT_RGBA1010102_UBWC},
>                  {DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
>                  {DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
>                  {DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index e8a217d242ca..6ae9c5358c5c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -157,6 +157,7 @@ static const uint32_t plane_formats[] = {
>          DRM_FORMAT_RGBX8888,
>          DRM_FORMAT_BGRX8888,
>          DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_ARGB2101010,
>          DRM_FORMAT_XRGB2101010,
>          DRM_FORMAT_RGB888,
>          DRM_FORMAT_BGR888,
> @@ -186,6 +187,7 @@ static const uint32_t plane_formats_yuv[] = {
>          DRM_FORMAT_RGBA8888,
>          DRM_FORMAT_BGRX8888,
>          DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ARGB2101010,
>          DRM_FORMAT_XRGB2101010,
>          DRM_FORMAT_XRGB8888,
>          DRM_FORMAT_XBGR8888,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index bfd5be89e8b8..0ed6a1a114c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>          DRM_FORMAT_ARGB8888,
>          DRM_FORMAT_XBGR8888,
>          DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB2101010,
>          DRM_FORMAT_XRGB2101010,
>          DRM_FORMAT_BGR565,
>   
> -- 
> 2.30.2
