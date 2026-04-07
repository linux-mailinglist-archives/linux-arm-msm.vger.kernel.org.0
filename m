Return-Path: <linux-arm-msm+bounces-102039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F4VNRVt1GmatwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:33:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C643A91E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36E1B3007AFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0638A37267B;
	Tue,  7 Apr 2026 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLcqfOVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0YqoW0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFD34EF0F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529229; cv=none; b=NlTty6AITPxiVzwrYAEe8O6kGyk51CG2Uw/HWgOoMfzsmkikFRcJu94lZB9xLqbFfWtUq8kJifKevfO4umMUNbGyuPJiRvXkqCSlIERLIVJyiOSyp9FAHOzFwW2K0AvXmC6qqBIUrI1K0EOTwMoLnfsySIcwSQB8m2ISTnLeqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529229; c=relaxed/simple;
	bh=oES0rGsVrHO4Qzz9FgagQdej1AO8/4pAXIKUeCAQ030=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hd7y8kMBRQctT1x3dD50ILOB2u5abnS136oSVCROlmyUBFvQcVAyUYTPdTXbixt8rDmp6MjelLF5HYwCMcXqe91p8rsoCBqhdm6DhNSAHf+dq8g/L6OFajUjjJZSwo9SnIik9qytQ+nsCLmC67URUjiCJVtwpf/Jn+SQ/X3LWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLcqfOVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0YqoW0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LT4EL2580486
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89gbJ4/Y+ioC9vThJOmb87Wer206nh06egfFrTvEDCY=; b=iLcqfOVmi8BwWlPX
	brlIBgMjYBJPxI4zh74O1bmM3TPrhSv2SIM2g0H0b2OnotGZ66R/sixcCnaDOZd2
	KXx5PtUHMzFojsqr30jfOF4O73weUia4mZbD2AJj9svp5HzJ5qiwhsaG7qxVSrr3
	cecxGPzWQzUt58nAtLObTo1CcwH6n0nQKfE1TorkvUJmu137ZnBOha4kT29tDTTx
	mcuiXL70AotzszhAFtimswpBKorTtDZ609EPfcXWQEzMCoNSW5X1NMNp8cG5djDP
	iY70VjgPabilOI8hise+odrZFXiLUbYAS1UkQREGBAivudtwtDh1Qnlgvy22I9e5
	8g3yAg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf0npn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:33:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c646e980bso2310108b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529226; x=1776134026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89gbJ4/Y+ioC9vThJOmb87Wer206nh06egfFrTvEDCY=;
        b=U0YqoW0CQXpZrDJG1FA+JWYKPnysy0fX5K2O4VQBe0LDZ600bVXzGWl6ZO+p6+Oc4W
         00u8tXsQUlf56Nre6hAiqt03y+wPJ1i/2luNbSloaj1LNbimsdrCXpWRuBv7KIqmedLD
         +te34LZHRVOIVg/N9ZaOA+HQRKT4tRc9kToScC2WxF1n8+vCW5TVkMG/bQ+9ggTcXssG
         h1gkafAxLE+hzc3VURIw9daF4gRZejL5VnReheEfkG6AKLeJ4tN9cGzC4guSPvr8x+M8
         7KmjBJ7WU9TLd4A6zITPhaZeAoYVFBOTylvzyzxWYay0W5ncP4rsMYkXxIFXru97avdn
         mk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529226; x=1776134026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89gbJ4/Y+ioC9vThJOmb87Wer206nh06egfFrTvEDCY=;
        b=msspJhakvJjYDEu8TElNCFqek7GxxpIt3117KW1oJZ/5qFU9WPkxskpHgFo+H3gUaC
         xPXVFvSkqWs0YUe5Y6sU7LhfPV4sjlYGbAkWfpVTjkIFplYT65m1z88tsa893kuVdXf3
         qthDQVRMvPr5t7Nz7hkepQtF3y6JbqdGllWorDbnz334VGvWuTCFw2KQYiO2A9UDlnqo
         /INIYU+HD5rOaxOZCe6OF+2xaCsA2nJMS/1vDrukYsGF4qfeTdKAtJnIvckulj/EqZPD
         ocN/IMjzh3IPaVv6ZoR3qOgeevNN2OGfXqCGKp+Qm6J4LrEj6AEpLtV2LHtQhnJdNtAw
         6OBg==
X-Forwarded-Encrypted: i=1; AJvYcCVXSeqfUvHLBc1ORIgyHIuje7zaaou4YfCnK7WrtU1tQP2KpvIHGungEYZsOtYBlOoXfAbxnswuXW9znTXP@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWQVK6gVCKwutWNKgc/MwtUpzFFK8q5Ck7zFSDd9wa/pJgPIT
	MMPgQi1RBn1H6Qiyr/gLi58A7Ar5fACUIMCnUrGOMqz8pREnEYg+jsbGVjnXtrScSk0FLod/eS4
	H4TUxH+AB9zMZcB2eP3f6st12CliDEIUkRmDb/sMLsAVLW/SmBdcfH9VFHo4EF1uTz0B0
X-Gm-Gg: AeBDiev/LEiBQqgx5oHw41+cNo2l8NpHA1kpGgZZBhK665sRLu/1KlALE6Nekt2T8zj
	9dbDUHpQtrqT7zts8+/3mAiP0TA7ZDubQ/aiJbhfs9KHr2+ycEDI8j5lA28+84+VDX+2RK/3EYG
	1/28007RuTSbWDwiWvlW/dXMpUsOfaBuDEWRDfEP4qReiGNK1eWqvbYQC74s373UIDpEg3//coD
	EnpiWSOYeMoh4F4pO8pNa7zcQXdjbY6LjQS7JzeyB0nPeI4yBCbkju/n92teGs5uwt7KSsupxxm
	N6K173W+4IQAlvRQ7fFfQ1BY8hUgKjoBF+p1GAP9Aa6D9bz5jW6rPk/yqSO2U1mLXLL+uBzHGGp
	y+rGOPV6+cRp62KE9kKgvXVHh95lScBF4rbXJK25wmioXA+LGwlRg+4xGUnFw/kDVTjaq8OHhAx
	QsKoZ3xo7HTz2Ua55mHQ==
X-Received: by 2002:a05:6a00:2d10:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82d0da345b2mr13849259b3a.1.1775529226368;
        Mon, 06 Apr 2026 19:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d10:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82d0da345b2mr13849234b3a.1.1775529225895;
        Mon, 06 Apr 2026 19:33:45 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b589b8sm15404155b3a.24.2026.04.06.19.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:33:45 -0700 (PDT)
Message-ID: <c976f5cf-c61a-42ba-97f9-3d36e2baed26@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:33:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 35/38] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
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
 <20250825-msm-dp-mst-v3-35-01faacfcdedd@oss.qualcomm.com>
 <yztpuhehjydmtefynpa7gt2keysdjpsdmrke6nkjsv7jnhkvkq@cve5yzs7v2sx>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <yztpuhehjydmtefynpa7gt2keysdjpsdmrke6nkjsv7jnhkvkq@cve5yzs7v2sx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMiBTYWx0ZWRfX4hnycIGuhTwW
 qICCAtSYoOSYKNUSLINbVpknh3ffRGNWaSIWUkQgnBlF/W1ANzepvIPRXT9p/ytzyUrp+w1oZ1I
 ebpC2J5497uCMVEjjgh/GZd+9e1p1pWljockpK3gvzFogzKOKqkcKI2DEoxrwXeQA0B06QJjLs/
 wcaU+U2twNnlI5ei5y1FYRGv4ciLsEgY7ZNwDRKHJlXLzlt6egySyy9SI4ozQvEx7160H8c1SLq
 GlpvPZ1wPFJbWCa1j80tTEGjIfoPSr0HuDimTbCSDr9BpoHbrhq4oouZEtg/fBxQ2MXXBXnQQWe
 Mf/rpXPfxsckYE+nfaL/xxAxtyeEAAhOwtU0HbqVNBoTFI7d6R7WqyFkrajJvxpMuRAkn6grjWV
 K6yed5PrdDKeMA8OKC2nQUYwwlwlAYA8NFfGOOg2O45AAhpa2nByV+ub2g4ig8/NhG46IgpK2Gx
 36o1ewH6oWukvVPk4oQ==
X-Proofpoint-ORIG-GUID: _QTzDOqk15nDBfgTYWiZLknvIcvncrQk
X-Proofpoint-GUID: _QTzDOqk15nDBfgTYWiZLknvIcvncrQk
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d46d0b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fATO5yK3SkeBLP2YPJcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5C643A91E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 5:27 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:21PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> For each MST capable DP controller, initialize a dp_mst module to
>> manage its DP MST operations. The DP MST module for each controller
>> is the central entity to manage its topology related operations as
>> well as interfacing with the rest of the DP driver.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>>   drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>>   drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>>   3 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 0b9d9207f4f69e0d0725ff265c624828b5816a8b..4036d3445946930e635401109ac4720ed2282c2f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -681,6 +681,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
>>   
>>   		if (stream_cnt > 1) {
>> +			rc = msm_dp_mst_register(priv->kms->dp[i]);
>> +			if (rc) {
>> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
>> +				return rc;
>> +			}
>> +
>>   			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>>   				info.stream_id = stream_id;
>>   				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 909c84a5c97f56138d0d62c5d856d2fd18d36b8c..897ef653b3cea08904bb3595e8ac10fd7fcf811f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1586,6 +1586,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>>   	return 0;
>>   }
>>   
>> +inline int msm_dp_mst_register(struct msm_dp *msm_dp_display)
> 
> Why is it inline? Also please move this to a corresponding patch (the
> one which adds msm_dp_mst_init).
> 
Got it..will rework patch to make them look more reasonable.
>> +{
>> +	struct msm_dp_display_private *dp;
>> +
>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
>> +}
>> +
>>   void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
>>   {
>>   	int rc = 0;
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index 3e64ec7b7dbe1d1107e85def9aa80277131f40bf..c46c88cf06598df996a17c23631570fda078b371 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -365,6 +365,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>   
>>   int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>>   int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>> +int msm_dp_mst_register(struct msm_dp *dp_display);
>>   
>>   #else
>>   static inline int __init msm_dp_register(void)
>> @@ -392,6 +393,11 @@ static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct d
>>   	return -EINVAL;
>>   }
>>   
>> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
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


