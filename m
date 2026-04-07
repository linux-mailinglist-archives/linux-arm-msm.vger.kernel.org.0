Return-Path: <linux-arm-msm+bounces-102040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB6wDZZt1GnStwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA53A9214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84560301FD46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E3E37269A;
	Tue,  7 Apr 2026 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7VnEzaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGys3Q/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0492236F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529360; cv=none; b=fz7QQVNSCyYJ+38EW7dRZQRjMNFddxABvS4+cyT0TcRHw8knLPkYtfWoXQnhpY5woNkEMOv+R6HkYZtQ75MD0XBG5C5Ddry2vdrw+VK0gNQGSyNLaIckQfn0uM+3u1ibaHUrfkHAJTx/+PDQM8+kf22pG8q4AngO9LiuBz0yqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529360; c=relaxed/simple;
	bh=g30wszMAxyXajPK6C5fviVRDfBK78m+7vidE9j+5ZnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7SeSH334071N3LOFfdHR2Fjnbfv6I7ZrwUX1zKNT0qLe5oYbGAskHDi1s4u0h6f1MxN5fLeX7fJusPQDuFOrJpKaLfKKXyZS7XFm/n5ZMtXFamYlTVYMgeDGSrhO6j8a/3DFCyV50xOQBqFL4Ya/ZqmyHAeUZW36wn4jVrvLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7VnEzaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGys3Q/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQXr23402354
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKWZGWsm+uinU5enYlneg7o88Oa9y0lewOd8+OxYdEo=; b=a7VnEzaSz691Ni60
	jHHQs8DzeX3CnTDVWSMcEOhnPdsUc/yi2a3iUwS2TK3anYUaCPHVbRLUU7O0sJ2r
	eyo2Xk8ivIgtl09y/ife7H2Ny/61ta0uZahK8bNEphAYEdXVY5/wyUQaXGLcRqGF
	F7bo5MwoROvwPTnDX0siGeS3wR3t661Z4Pjipvcb6PRL4zLYq4u26xcAscEwB7xO
	s3bjYGlkl8XG6hzz0dIkBTwK2VgzwfPXXBOVhL7C0dtjiy0J8v5iHB5RCc15HLyC
	bpRYHsdcERjKu3NHbCFegRXnaJb0ulTF28l3d1DxJfUGGCsG2zpvws45f/5eqlou
	UXU9sQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhrp0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:35:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2489af602so44633265ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529355; x=1776134155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKWZGWsm+uinU5enYlneg7o88Oa9y0lewOd8+OxYdEo=;
        b=NGys3Q/hkGGDsoUQJ8Pwfw5r06aYrn2D8zq+H/n/9GaksCvSDwiTFgUqPHqifMQrYO
         GvaPZTTIs0nlXkUIdcRa8MbaazxPbLyxtYpJD6IMCHzVdrxJlRUHda9IJRdkb5DsCUeL
         TJE4pxgzgITtVOdUyY/ADG5ptN7s61DjKSzA1tm6zStWBZA3iUM8HxmMHxVELU6MXZfU
         a+qqta5JkgtTlqroKqnZIdClCyPR2OWtxEs49OggGElZsJiDyXgOsa6mh/YZNCKjRQAp
         UxL/C/QI+/zasUvkyz51BLEU9b53xf3sJOdD73JP2wzbwuoUIQrqGlJ+MGH9vUQaiZfp
         5W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529355; x=1776134155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKWZGWsm+uinU5enYlneg7o88Oa9y0lewOd8+OxYdEo=;
        b=hTkE1MuJdmMsQOXnSKPqxB114DzkewClKJJ0hNGLrBNvEFMk7gDOhq59ZxqhyrnGR4
         Nss2+PtMTyBcYtaOlc5LWDCFHWI7cRMDbstv2hECq8eXbYbiF17YVMWZNNZ2iOBNaTNt
         ZrAg5PpNJ+wQd9bmmZ/UMoEGVOg9dhqHSVNiRMNRBvZu4BYPOObudNYOYvuLYUqITSJB
         0lp6O+g+tkQnU7OPRoMps3xg7AN5z11bRk2a7RAZA06SYDeeZosh6qawZBqsYLcvHk9X
         F/VJZbyO3vhgttyB7FWwlWqSAQ7CoHBAOfaYWJLdMrXO8sUI3vDyZgz+tx2UDTYD8GVg
         HwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpo7entX4bo1QSaxncmkAISgo5JblRHiwI16uTTxFISiwYbNvwv16CKhQYs7h3kl/V60kkDnHsRHJ2VcP+@vger.kernel.org
X-Gm-Message-State: AOJu0YyoX2VdYtkShq+v/fwFBWJk+EqjQ7abZLkj7000koI2q/BYa1Ur
	XNm4Y4fQOSle9LkSyiPxG/kUUWHx/XOeADeToWNhucIKRJ/6JsU6jINbDz5J3P7bEFvECZEiovN
	DpICBEgMXXV+zKAmv/DnNJNT0hZurGTE4u9aye0ZOOqIAl/6jcZJvmRjO7JZ8dd2qPZ/p
X-Gm-Gg: AeBDieuPlFpjhpkoN4zmGqjUmZFsB55ZbxMzV7L+F/YqaGiD4rDbLLeXAaFPocIo88j
	+ftlQyrc/UiTCc76mEvu8o8DWNmsCQgguxk2G05DWjwtRk15TsXcgwqsNEEXqjbT0RPNLeC0ooo
	nekScHNZ/w9W+ZqUlQx+F0/tfcY3BjvDAENWmd6RXY5jZqAxPEE8NigdTEJLhBMq0gApw0nohn+
	sG5FRYJxwMFZXG1j3fxtwX80baOlrWnz5Kp0eMM0MiQFr/4sau5Rc4p5Nnfkm/z0+BIRKWJgy4h
	Jl7pKa1dFWdqZ1IgkVeWsSvTMo82CLGDYeRHKSr0FTuN7izQ4IaQhoDg2CeZLxMTtVsH6gW2nyI
	ZItlT8oQuSfgYicex2gBeD6cHCzc3ygpTRfOEsOqpJyqWzxaAXYQMZH4boqzcQgQadvAKjP3OOs
	+gnYGw8lN6dKsgEOfxwQ==
X-Received: by 2002:a17:903:388b:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b28205a9d8mr144906085ad.13.1775529355067;
        Mon, 06 Apr 2026 19:35:55 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b28205a9d8mr144905685ad.13.1775529354518;
        Mon, 06 Apr 2026 19:35:54 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af19sm149001615ad.50.2026.04.06.19.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:35:54 -0700 (PDT)
Message-ID: <a69c3d6c-da4e-4ee1-984f-cb827c298c0b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:35:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 34/38] drm/msm: initialize DRM MST encoders for DP
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-34-01faacfcdedd@oss.qualcomm.com>
 <npxu4ybwj2dztn3dbvmkxiwqw27wyr57g7ps72ndst7cful6n7@vuk2rizlz356>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <npxu4ybwj2dztn3dbvmkxiwqw27wyr57g7ps72ndst7cful6n7@vuk2rizlz356>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMyBTYWx0ZWRfX7fWsN9Z8zhSj
 9u5m1vIf2oQg7HZzk7v3ynOe6rVUIec1fvc1LeKza4q6Xqt7PsUeHi8bddDCpNR1WrsqzuwOWfB
 bWwbZzjKWIjffcQl/Q0PcCDYbwSj6W6zWCA2VlqF4niimuIa8mu4zAC2IikHOheMGd57FSggtc1
 fTEn3m8y286J/dQAjTquL7Q8Rrt6rBoBFG7+QDLShHdgNvHb63RrWgEHsT7IJKsLqOx4avmtRlm
 okG7vuc4fm2VDN3lbWY1HgG3bV35vONnShfFJS2Jzlkp6nsyPJ3uqMauL73LIhGq8vkiafLlZuF
 oYlPkIKTvl0FW9AVYFiq1FWNuUsf9xSLZqYl0Wz978+oE3Ym6e8nLhDLuFEaIvJ3xhQkt8mJWif
 9KvgzkMhlyIEYGVwkchJyRgK5/vPn4Arn7Y1biedw4+cBoVHa4Kn/EvfasAKYOWFXZxaahkJhxk
 UAvmWvIrg4WDQUm5Klw==
X-Proofpoint-GUID: Afro89ZW0_qoZXMRaApkiW58tAhRzyfS
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d46d8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Bl6qu2857310sCFhzq4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Afro89ZW0_qoZXMRaApkiW58tAhRzyfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102040-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EDA53A9214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 2:55 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:20PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Initialize a DPMST encoder for each  MST capable DP controller
>> and the number of encoders it supports depends on the number
>> of streams it supports.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 --
>>   drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>>   4 files changed, 37 insertions(+), 3 deletions(-)
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
>> index 12dcb32b472497f9e59619db4e810abfbf610c7c..0b9d9207f4f69e0d0725ff265c624828b5816a8b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -653,7 +653,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   	struct msm_display_info info;
>>   	bool yuv_supported;
>>   	int rc;
>> -	int i;
>> +	int i, stream_id;
>> +	int stream_cnt;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
>>   		if (!priv->kms->dp[i])
>> @@ -676,6 +677,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>   			return rc;
>>   		}
>> +
>> +		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
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
>> +				rc = msm_dp_mst_drm_bridge_init(priv->kms->dp[i], encoder);
> 
> This is an implementation detail. We should be asking to init MST, which
> might or might not be a bridge.
> 
Got it. How about renaming it to msm_dp_mst_attach_encoder?
>> +				if (rc) {
>> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> 
> DP, MST, no 'bridge'.
> 
Got it. Thanks.
>> +						  stream_id, rc);
>> +					continue;
>> +				}
>> +			}
>> +		}
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> index 8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e..d73e3f908439094532e88945ed4d41ed092051c9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -82,8 +82,6 @@ struct msm_dp_mst_connector {
>>   	struct msm_dp_panel *dp_panel;
>>   };
>>   
> 
>> -int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>> -
> 
> Squash this and the next chunks to the corresponding patches.
> 
Will rework it.
>>   int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>>   
>>   void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index 985db9febd98e35dfed51d39dac1a522abe5a351..3e64ec7b7dbe1d1107e85def9aa80277131f40bf 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -363,6 +363,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>   			       const struct drm_display_mode *mode);
>>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>> +
>>   #else
>>   static inline int __init msm_dp_register(void)
>>   {
>> @@ -379,6 +382,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>>   	return -EINVAL;
>>   }
>>   
>> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
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


