Return-Path: <linux-arm-msm+bounces-8569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7283E89C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 01:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9CDA1F25FBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73F017C7;
	Sat, 27 Jan 2024 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h7iK0Xc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370417C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706316053; cv=none; b=bo9bIt82cpwHpUI7oxURwcZhyN7zSJPHHv2n4B7Hn+MQw78gS0Eg/tbAzPgBN3Hk7iykgiMyGx4XtefN0SQhT4wv/FaTrgzpD+Aj9uxxJsIbWglTDvrTnUmFvOsUemkLq9DrrpV6Y/fBsgCxMpgViOj7+QVeP4FQAN/0Jbf544k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706316053; c=relaxed/simple;
	bh=/QLNczxrR9pqZBcmjtJIgOKXHLM16CDZwP761yLb4Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c34q2F1AOzlx5Vv6Xcdq+W3lPkHrcQ/tyC0v5gL8sxwuRKGas+VQtcg/bUh4d05uu5h+KMX65VmBRNQBij+PTBXb2pDRPtkcr8lN1TEP53ts1ZOFQJZGnghYLXDyQzFhuDbsV2QfRm/agKQ3gQYeA0WL9B1aTThYudUMqmabBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h7iK0Xc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R0XZ1e017912;
	Sat, 27 Jan 2024 00:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=saLPFdhCpWmNrk9nNpvAuB6wp9eNBhHCq6ap3lklQeo=; b=h7
	iK0Xc+tehROddKRcdPOkqLktLuBknxXVngNTKrKGka3xMddxCbgia9034eXBhLFy
	OeuNiVYJ13FatElDKXCaZuyMJCIj0b4tQJ9WthHMqilrbdKOY9O4MGzQRewMjyqS
	E0mdsYKuR435tEbHPduDXTKZszW0Mr7NfsmqorpIE9ziveeum0YDI3hnHelIRn43
	VUxqvTNzbczcN6VU2uwdo0vIydxj8ISCp4/ElEJhi95+9llM62BeJ+r6ZXANxDK4
	49Vv9XFaBbmXp91rNMurGiSabUQJhVOtzY6ELhB1xtOnL8wbmZcKwXsfxVlBi8E3
	Knp/i1oXxUbTP1AN8ZQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4nrafbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:40:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0ecnL029591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:40:38 GMT
Received: from [10.110.17.189] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:40:36 -0800
Message-ID: <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
Date: Fri, 26 Jan 2024 16:39:40 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
 <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ccORHx0KsVu6IwtQI3_mm7EUzRIN-sZS
X-Proofpoint-GUID: ccORHx0KsVu6IwtQI3_mm7EUzRIN-sZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270002


On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>>   2 files changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 993f263433314..37ac385727c3b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>>    * @hw_intf:        Hardware interface to the intf registers
>>    * @hw_wb:        Hardware interface to the wb registers
>>    * @hw_cdm:        Hardware interface to the CDM registers
>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM 
>> configuration
>
> Please realign the description.
Ack
>
>>    * @dpu_kms:        Pointer to the dpu_kms top level
>>    * @cached_mode:    DRM mode cached at mode_set time, acted on in 
>> enable
>>    * @vblank_ctl_lock:    Vblank ctl mutex lock to protect 
>> vblank_refcount
>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>>       struct dpu_hw_intf *hw_intf;
>>       struct dpu_hw_wb *hw_wb;
>>       struct dpu_hw_cdm *hw_cdm;
>> +    struct dpu_hw_cdm_cfg cdm_cfg;
>
> It might be slightly better to move it after all the pointers, so 
> after the dpu_kms.
Ack
>
>>       struct dpu_kms *dpu_kms;
>>       struct drm_display_mode cached_mode;
>>       struct mutex vblank_ctl_lock;
>> @@ -213,7 +215,6 @@ static inline int 
>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>    * @wbirq_refcount:     Reference count of writeback interrupt
>>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>    * @wb_cfg:  writeback block config to store fb related details
>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM 
>> configuration
>>    * @wb_conn: backpointer to writeback connector
>>    * @wb_job: backpointer to current writeback job
>>    * @dest:   dpu buffer layout for current writeback output buffer
>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>>       atomic_t wbirq_refcount;
>>       int wb_done_timeout_cnt;
>>       struct dpu_hw_wb_cfg wb_cfg;
>> -    struct dpu_hw_cdm_cfg cdm_cfg;
>>       struct drm_writeback_connector *wb_conn;
>>       struct drm_writeback_job *wb_job;
>>       struct dpu_hw_fmt_layout dest;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 4cd2d9e3131a4..072fc6950e496 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -269,28 +269,21 @@ static void 
>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>>    *                                     This API does not handle 
>> DPU_CHROMA_H1V2.
>>    * @phys_enc:Pointer to physical encoder
>>    */
>> -static void dpu_encoder_helper_phys_setup_cdm(struct 
>> dpu_encoder_phys *phys_enc)
>> +static void dpu_encoder_helper_phys_setup_cdm(struct 
>> dpu_encoder_phys *phys_enc,
>> +                          const struct dpu_format *dpu_fmt,
>> +                          u32 output_type)
>>   {
>>       struct dpu_hw_cdm *hw_cdm;
>>       struct dpu_hw_cdm_cfg *cdm_cfg;
>>       struct dpu_hw_pingpong *hw_pp;
>> -    struct dpu_encoder_phys_wb *wb_enc;
>> -    const struct msm_format *format;
>> -    const struct dpu_format *dpu_fmt;
>> -    struct drm_writeback_job *wb_job;
>>       int ret;
>>         if (!phys_enc)
>>           return;
>>   -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>> -    cdm_cfg = &wb_enc->cdm_cfg;
>> +    cdm_cfg = &phys_enc->cdm_cfg;
>>       hw_pp = phys_enc->hw_pp;
>>       hw_cdm = phys_enc->hw_cdm;
>> -    wb_job = wb_enc->wb_job;
>> -
>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, 
>> wb_job->fb->modifier);
>>         if (!hw_cdm)
>>           return;
>> @@ -306,10 +299,10 @@ static void 
>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>>         memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>>   -    cdm_cfg->output_width = wb_job->fb->width;
>> -    cdm_cfg->output_height = wb_job->fb->height;
>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>
> This is a semantic change. Instead of passing the FB size, this passes 
> the mode dimensions. They are not guaranteed to be the same, 
> especially for the WB case.
>
>>       cdm_cfg->output_fmt = dpu_fmt;
>> -    cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
>> +    cdm_cfg->output_type = output_type;
>>       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>>               CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>>       cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
>> @@ -462,6 +455,14 @@ static void dpu_encoder_phys_wb_setup(
>>       struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>       struct drm_display_mode mode = phys_enc->cached_mode;
>>       struct drm_framebuffer *fb = NULL;
>> +    struct dpu_encoder_phys_wb *wb_enc = 
>> to_dpu_encoder_phys_wb(phys_enc);
>> +    struct drm_writeback_job *wb_job;
>> +    const struct msm_format *format;
>> +    const struct dpu_format *dpu_fmt;
>> +
>> +    wb_job = wb_enc->wb_job;
>> +    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>> +    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, 
>> wb_job->fb->modifier);
>>         DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>>               hw_wb->idx - WB_0, mode.name,
>> @@ -475,7 +476,7 @@ static void dpu_encoder_phys_wb_setup(
>>         dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>>   -    dpu_encoder_helper_phys_setup_cdm(phys_enc);
>> +    dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, 
>> CDM_CDWN_OUTPUT_WB);
>>         dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>   }
>

