Return-Path: <linux-arm-msm+bounces-69168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16879B26059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EAD97BD981
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFB523D7F6;
	Thu, 14 Aug 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pZrlPDFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767FA2701CF;
	Thu, 14 Aug 2025 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162690; cv=none; b=hIrfY5VgLBKHDCEk9qdbu1jg3jDOJ7RC7injRDnnPU9jnqiNiL7vU1FkAz8RVTigRQR7klS9P8X7Hm4KnSakVDiQLeOwCKyZEQkepSAyCu05dJLesamJZO/+9ohj1GeWOtKQEcJ11KaNp7Nnc6BWtkHGku2VImxQXSv9EuNgITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162690; c=relaxed/simple;
	bh=qNvwJhcYLhnbBPmx4kKfq9wII4mIG69VnJAM/C0L7Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rC1Gq6IZ74M/y/zP1hSBzf6z6I3wcqLD6i2QHC6PDDxQfJloE2TR4wozDd3q4a9Hggnf/RFGTdzl18bGBw6gKV5qhLjFdgPEnkc3JmaET8v7uxwDoBb7qAKWW6tp8WEvzfbe/Z0qk+YmEIrd8cDrOYuw0JDTh9GPmo9Hav1ICVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pZrlPDFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMxxcF025656;
	Thu, 14 Aug 2025 09:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/iGF2Af2BkLG8WZ/tTUpHnPSkZL8t0ynCZUt+sdALU=; b=pZrlPDFi2FNB/l93
	9CuqirMqhthG8tAaWMogtKRxwtP6KU2aReSqLOfGaAozvsMjNaFIZdzeUHZm2uu6
	fAh4IVvChHT3btfodaZ3VTOyCtjP91mWWZAWTUhNSHHDR9pROr/YbzQLyFj4UmX+
	1jrX1HrniLH/GvnmWJPjKi+jlQGNhgqyD6QqCHPZ56NI3QrzurE9R3iIrdFt0Qke
	yR3tqj//jN/0DergyPpepr+uVeHdUE+gLMUV5bdNRva7dcTWAZ83Vcfegugh/f5q
	u2L+bXyo5SVdjkPZRe/f31LnzRZ21B6odURjI4d2lBBrdOhU3eKDCPvS4NlNzYpI
	8gW5Ww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gf0qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:11:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E9BJg7019673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:11:19 GMT
Received: from [10.133.33.15] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 02:11:15 -0700
Message-ID: <01ccebf2-1a2c-4996-8b56-1fb951a6d8c6@quicinc.com>
Date: Thu, 14 Aug 2025 17:11:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
 <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689da838 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=dP0PvF52YB23nZRe8tUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX4Bh/5V+HPUx9
 VDi8edSJz8osxD9wghKYqfKKCRZ2BFPL8cqEjdw1859INpPdJKXnPwHwTR7BxsqBaubG7RXgy1b
 N7/Y9L5xjpaasiIfQ3Hw66a7OdZPCHAsB55clA+7bb2ZeteYY65BXT/7TYbowt37mqchurbJQeT
 HHLsHq7YPDBr5kI6P57ZEE9UCAn2+z27GldS8fQPu87ZI6QjDV/P1pvpzfZYTJmkBToH9CNMToR
 IPsNHk7isrktVj4Nf2A52blhBi+R7NcKMmCNL/wdzqpvWS3QD/9FNC7uOnRODcEvRsYw9qEIflz
 KstG43p/fJ+n3HjemdBz05VfLhnhphmFUq1Fg5LCf1bUQukub+SkZnnfM3RkwdU9/2kS/1nV9nI
 Z7xe3T2Z
X-Proofpoint-GUID: zPUnsn3d8c9SlH0ncwKPzaLOKwM0vSfP
X-Proofpoint-ORIG-GUID: zPUnsn3d8c9SlH0ncwKPzaLOKwM0vSfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 2025/6/9 22:17, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Initiliaze a DPMST encoder for each  MST capable DP controller
>> and the number of encoders it supports depends on the number
>> of streams it supports.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++
> 
> Please don't mix DP and DPU changes in a single patch.
> 
Got it, thanks, will separate it.
>>   drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>>   4 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -28,6 +28,7 @@
>>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>>    *                      based on num_of_h_tiles
>>    * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
>> + * @stream_id		stream id for which the interface needs to be acquired
>>    * @vsync_source:	Source of the TE signal for DSI CMD devices
>>    */
>>   struct msm_display_info {
>> @@ -35,6 +36,7 @@ struct msm_display_info {
>>   	uint32_t num_of_h_tiles;
>>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>>   	bool is_cmd_mode;
>> +	int stream_id;
>>   	enum dpu_vsync_source vsync_source;
>>   };
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   	struct msm_display_info info;
>>   	bool yuv_supported;
>>   	int rc;
>> -	int i;
>> +	int i, stream_id;
>> +	int stream_cnt;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>>   		if (!priv->dp[i])
>> @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>   			return rc;
>>   		}
>> +
>> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>> +
>> +		if (stream_cnt > 1) {
>> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>> +				info.stream_id = stream_id;
>> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
>> +				if (IS_ERR(encoder)) {
>> +					DPU_ERROR("encoder init failed for dp mst display\n");
>> +					return PTR_ERR(encoder);
>> +				}
>> +
>> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
>> +				if (rc) {
>> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
>> +						  stream_id, rc);
>> +					continue;
>> +				}
>> +			}
>> +		}
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>>   	return connector_type;
>>   }
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
>> +{
>> +	struct msm_dp_display_private *dp_priv;
>> +
>> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	return dp_priv->max_stream;
>> +}
>> +
>> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>> +{
>> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
> 
> What's the point in this oneliner?
> 
Emm, here we consider declaring the msm_dp_mst_drm_bridge_init() in 
msm_drv.h and drop the one-line wrapper.


>> +}
>> +
>>   static int msm_dp_display_probe(struct platform_device *pdev)
>>   {
>>   	int rc = 0;
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>   			       const struct drm_display_mode *mode);
>>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>> +
>>   #else
>>   static inline int __init msm_dp_register(void)
>>   {
>> @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>>   	return -EINVAL;
>>   }
>>   
>> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>>   static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>>   {
>>   }
>>
>> -- 
>> 2.34.1
>>
> 


