Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEEA6A8BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 23:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjCBW02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 17:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjCBW02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 17:26:28 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A93A29148
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 14:26:27 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322LPPOo028843;
        Thu, 2 Mar 2023 21:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IEgEwlwAh2wiQwRMFFhLp40RPwPRHQARV4I1iyVhcwI=;
 b=Ob8gBL+ZZaaGKn/IKyv2gQ4fqdEkyBS0/fbksJ6E53fq6x9AcmOqiIEmXdCKZQHu+prC
 9d0UZ49TUvjJyABVZM6XVWxsEHMqDVpo2Wa1S/UWCVpaN1MxndwRPPwdIfImGRH0VDrn
 gyIuW0OxqE3iKYc+/jDaTC/8n6E02rHXaLnntfZG1B9rtsAvstGQfy03ckV6E+YLc++J
 Es/9GmqJfx5Fm6HPt0HGPTlWKiK4tfmKAZXDycXRPNaqa9pn4g8B/xJB5gMQLMCv7KUO
 jFl8tYvObUBDqQUhrJCFe96GqsZl2XYSKKmYtnRj5SMUvnoEHDxtTcb90Ga12A1XL70Y 7Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p2q3jj66k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Mar 2023 21:25:27 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 322LPQ3P005969
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 2 Mar 2023 21:25:26 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 2 Mar 2023
 13:25:25 -0800
Message-ID: <1bf9f1e8-28b8-1519-aba1-d6f4b2795d42@quicinc.com>
Date:   Thu, 2 Mar 2023 13:25:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit()
 function
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-4-quic_jesszhan@quicinc.com>
 <20230301100815.2mwzickezovsg2oe@SoMainline.org>
 <20230301101358.twxrzmonr4qvv5rd@SoMainline.org>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230301101358.twxrzmonr4qvv5rd@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: omj7S-k7Jm-mpEPKSZ8IF133Ho4VASlW
X-Proofpoint-GUID: omj7S-k7Jm-mpEPKSZ8IF133Ho4VASlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020184
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/1/2023 2:13 AM, Marijn Suijten wrote:
> On 2023-03-01 11:08:16, Marijn Suijten wrote:
>> On 2023-02-21 10:42:55, Jessica Zhang wrote:
>>> Now that the TE setup has been moved to prepare_for_kickoff(),  we have
>>> not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()
>>
>> s/not/no
>>
>>> do nothing. Remove prepare_commit() from DPU driver.
>>
>> And again, this:
>>
>>> Changes in V3:
>>> - Reworded commit message to be more clear
>>> - Corrected spelling mistake in commit message
>>>
>>> Changes in V4:
>>> - Reworded commit message for clarity
>>
>> ... should go below the cut.
>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> With the above two issues fixed:
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>>>   3 files changed, 47 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index dcceed91aed8..35e120b5ef53 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>>   	ctl->ops.clear_pending_flush(ctl);
>>>   }
>>>   
>>> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
>>> -{
>>> -	struct dpu_encoder_virt *dpu_enc;
>>> -	struct dpu_encoder_phys *phys;
>>> -	int i;
>>> -
>>> -	if (!drm_enc) {
>>> -		DPU_ERROR("invalid encoder\n");
>>> -		return;
>>> -	}
>>> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> -
>>> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>> -		phys = dpu_enc->phys_encs[i];
>>> -		if (phys->ops.prepare_commit)
>>> -			phys->ops.prepare_commit(phys);
> 
> In hindsight, Dmitry asked in v2 to remove prepare_commit from
> dpu_encoder_phys_ops (and its documentation comment) in
> dpu_encoder_phys.h, but that has not happened yet.  Can we do that in a
> v5?

Ah, forgot to include that change. Will add it in the v5. Thanks for 
catching it!

- Jessica Zhang

> 
> - Marijn
> 
>>> -	}
>>> -}
>>> -
>>>   #ifdef CONFIG_DEBUG_FS
>>>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>>>   {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> index 9e7236ef34e6..2c9ef8d1b877 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> @@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
>>>   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>>>   		struct msm_display_info *disp_info);
>>>   
>>> -/**
>>> - * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
>>> - *	atomic commit, before any registers are written
>>> - * @drm_enc:    Pointer to previously created drm encoder structure
>>> - */
>>> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
>>> -
>>>   /**
>>>    * dpu_encoder_set_idle_timeout - set the idle timeout for video
>>>    *                    and command mode encoders.
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 165958d47ec6..6f7ddbf0d9b7 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
>>>   	return ktime_get();
>>>   }
>>>   
>>> -static void dpu_kms_prepare_commit(struct msm_kms *kms,
>>> -		struct drm_atomic_state *state)
>>> -{
>>> -	struct drm_crtc *crtc;
>>> -	struct drm_crtc_state *crtc_state;
>>> -	struct drm_encoder *encoder;
>>> -	int i;
>>> -
>>> -	if (!kms)
>>> -		return;
>>> -
>>> -	/* Call prepare_commit for all affected encoders */
>>> -	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>>> -		drm_for_each_encoder_mask(encoder, crtc->dev,
>>> -					  crtc_state->encoder_mask) {
>>> -			dpu_encoder_prepare_commit(encoder);
>>> -		}
>>> -	}
>>> -}
>>> -
>>>   static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>>>   {
>>>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>> @@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>>   	.enable_commit   = dpu_kms_enable_commit,
>>>   	.disable_commit  = dpu_kms_disable_commit,
>>>   	.vsync_time      = dpu_kms_vsync_time,
>>> -	.prepare_commit  = dpu_kms_prepare_commit,
>>>   	.flush_commit    = dpu_kms_flush_commit,
>>>   	.wait_flush      = dpu_kms_wait_flush,
>>>   	.complete_commit = dpu_kms_complete_commit,
>>> -- 
>>> 2.39.2
>>>
