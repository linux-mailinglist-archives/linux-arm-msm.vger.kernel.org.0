Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D26266E66D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbjAQSuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbjAQSk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:40:27 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6366B3B0F9;
        Tue, 17 Jan 2023 10:12:03 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HEf5lc016080;
        Tue, 17 Jan 2023 18:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LRo+64SRoFeqVmLnaAU630X4W5gRnmewgNT4nsU8iz8=;
 b=SVR8etnkT+eTUvxL16i7IE0981FSALaYjoxCOpre+efF9d234mlYIe/yaXo2OwBYdLRn
 e93YDS01Vd8bw3lipbymFi7O8zn2Sc8UXi18q0eVF36uZg/8vLpZsJ3+iesvmyiwL5Dw
 LqqBzPe6NZYBGNvj1r18hxAZX/VRK2KtlZb/zkVdPzU3fb7BXeSj5KfMKXk8o7Pbm0q5
 NQREk0hUVgpgIoLBTbEoGb3CGUt9nqALhZrZnXkDWQsr0OQqYccH1Qh3nwNeqF7/CBH5
 OXp+kew59qBq6N+4mfiLpKxMQx4ho2/yxT5hqiA8JOfS92VcjyXYYkK3pgqE38Lwh6io Tg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5r2qh2en-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 18:11:56 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30HIBuUd026567
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 18:11:56 GMT
Received: from [10.110.100.92] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 10:11:54 -0800
Message-ID: <e55b52b3-91a7-9dc6-9d3c-1587b50f0fef@quicinc.com>
Date:   Tue, 17 Jan 2023 10:11:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dp: Remove INIT_SETUP delay
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
CC:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20230117172951.2748456-1-quic_bjorande@quicinc.com>
Content-Language: en-US
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230117172951.2748456-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dt08k3Z0etW4hCNP5tHLoRzZF-QxyEt2
X-Proofpoint-GUID: dt08k3Z0etW4hCNP5tHLoRzZF-QxyEt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170145
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/17/2023 9:29 AM, Bjorn Andersson wrote:
> During initalization of the DisplayPort controller an EV_HPD_INIT_SETUP
> event is generated, but with a delay of 100 units. This delay existed to
> circumvent bug in the QMP combo PHY driver, where if the DP part was
> powered up before USB, the common properties would not be properly
> initialized - and USB wouldn't work.
>
> This issue was resolved in the recent refactoring of the QMP driver,
> so it's now possible to remove this delay.
>
> While there is still a timing dependency in the current implementation,
> test indicates that it's now possible to boot with an external display
> on USB Type-C and have the display power up, without disconnecting and
> reconnecting the cable.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index db9783ffd5cf..bde1a7ce442f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1506,7 +1506,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
>   	if (!dp_display->is_edp)
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>   }
>   
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
