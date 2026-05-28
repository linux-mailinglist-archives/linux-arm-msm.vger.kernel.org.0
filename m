Return-Path: <linux-arm-msm+bounces-110086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oARqAKcVGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:15:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1D5F0622
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90BC930234E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8D63B19A5;
	Thu, 28 May 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUETkDiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTfnEpL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03F376A0D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963195; cv=none; b=bD3LyoiRgaCt6TuohVLj8NLXQtAYI34FOm+g4ZXGLKdr2sCHtXhpjAri8ossNvYHrN4pEdhA6Tfyiq0MerEauhvxMCAGkopVRr/C6Fg6lWOMmMfvLXqsX0zmA7NgmYkMCssATU3c2Rzt9COHSsAmGw+p+sLmZ2Q7jlX2LsT1m2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963195; c=relaxed/simple;
	bh=JFl9SLagFHstVkYll1Bjr2kunrMsRs9NnKMig1aEYqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwguTtAtE+B1PPUf3wbfx3+gjiOBuyJlo2Fl09w5pDDMKjyDlLhr3e1tDNHdQ4LeF3E44C0NiSN1D9Ry7TsrL/I5eHI3YyZGqyaT0y6zLMqz7lo+rQlDkmyH7CUj81GieegL01txS0xmKgDILHHUwMQd5BnvkdtGQZjVm2LFuGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUETkDiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTfnEpL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vlxK298257
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tw9BCq69+vPICTaEPFF13m6QUIzPyxrc7hFFrxx7Wfk=; b=WUETkDiHdPqIxrha
	Bj+BG/eb1EQsF8AVbKSyChhywX+y9FhIinp8B1Pcq3eS9+wb1NzQIA3v3DQE34pX
	IG/Q4RFInaqDfwleMWDFrU7qQ9ZqGTZnwK9qEHs+EdMmwsCM/VNdNpYpjn8fn9Fi
	AGpJs0INzoYxSdYPtCL9wHp62mAiiEtqvUT+pIWFSXIeTp0nQF7rU7/SN4OxMm1y
	NeGyvKWaNsjcFtiuqdfDI40PrMuIHWy+m6WOxFNsUaggK1s5Cov4JqdRW5Qkrnsz
	j6sr1abSMYCACx3U/SeUOmWe94EO7/DwkPllUdm5NbSDAggELQ2OqLvWXzFL8hL3
	oGdqOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajan2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:13:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so308735961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779963192; x=1780567992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tw9BCq69+vPICTaEPFF13m6QUIzPyxrc7hFFrxx7Wfk=;
        b=NTfnEpL74zfKuFHKSwaNqfgd9YrnbX30lXVzGPyqrsqrP4LSZ+tFiTkligrr/IpjB6
         ug8PVa+Ubkq83sHqMIAZQ4i1POBMSrxyLQ1iwmdOrKN3Y+Ymimh30PxUHUZ1Zw6NDYxX
         Q25rO6H9GxaqYDF2QK4qtaQFZPTJRrEy3TVdqk+E7oN0N9R2gCI75V8savOF+SaGGb26
         uAJcRyQPMhTM6EtbZhxxryRKGmdz6/W8RLSbGO4HjdzSOOaUicbdK9qamfWYNPrzFbd/
         8zrEEjVxvFAYB2qX19PGdldY+4cuKwArHS+icWl6wJhHyyyDhzdxYa+7/oxSig6VkfnT
         /bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963192; x=1780567992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tw9BCq69+vPICTaEPFF13m6QUIzPyxrc7hFFrxx7Wfk=;
        b=d+GzGMomCSFjtE4V7TEXRIu47UEpRg/u8TzD5jMV9K/klCB2OhRm7rkPs5xkpv21sb
         EJ4rtu07aI2cv3a6zMquJDOa/eQiqPd1yIiQj16MCvwZvDlkdffIpz774sDnztT8uKrx
         shoWMJcZ51BH9gUTM/+l9yvfgpOUmalFnhT5oNg6CRYS4f2C5+R7/R/X67spTGpkU1SI
         Luaew1u4T8SvLpYiIzhUkEp+bh8hxO1PsntwoKwgddZp92r1AMDzMzOjBQy5G3bDPGfc
         D6Be5+9/5RVQOVUbSjWWQy+tE95aQrD0umqjxZNdlhuOmd8KUgPCb2ihTvWuIQe9abNv
         eZMQ==
X-Forwarded-Encrypted: i=1; AFNElJ82b5Fjf63zcLc4SI5ZxMJIoa6fK7Bhl7/B/s5yPT/4BTaF5bgE6bnizvTN2GYr1NTy/YPrkv//HKpI6neN@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsOBnJqqw/9MWc52KYE8y5H6trvSJWJT4VMF9s0Ll0RLQKLCy
	tklFA34Erw+nepw48dWRTjZDAzciEAvXZ9whjidNMw7T+xEfRl/sUtzHfogRRtAuI6dFs/62+PA
	R4faGjw9yX1HA7yEKiy7rL6i4qEhnlvmfIfOYAZ8DmOB2k6CMTCsmIWO/RxvJTd1UA2LO
X-Gm-Gg: Acq92OHTJEEnvoHs17hvHkW75j5WmAt00CKPUW2y3HyZP7kO1LbKEFosMhfDteMaXxW
	13L/eeiYhhMbGbuY0Yn4PrPM0yGwsGB31uaEYX65IURV/ePIhi1+mJrIegT4Zje2QsAWWftP53a
	JVVZaLid9EKpHzlHSRHZUJUGETz13rYOYCsO6ndySZqchqhTftTq/bzKclhNJhpG89XflejF4qs
	oZFQbkBMo99nRspLyRyYdN2r178DOPZNtMsCobgm0GIkbe55qa5yDu4vM7qBwtiO8uxKChOMRx3
	/9Bg6AULpiHwxDSR+o6z+sWUf1a3OSyUC87AtNG/cxd7Z7zFTyouTsWtBhnqZLGp4YtcPiVuS+O
	TI92Kl4au1F3yh8o8p0Stjg58Ycl0QKQ99u4+vvTW5uMeS9CYeh5pDudr8c1acqa5IiBIe00m23
	3h5QRXKcHylQWS+NRLG2V6Ww==
X-Received: by 2002:a05:622a:d0e:b0:516:e96b:2356 with SMTP id d75a77b69052e-516e96b277fmr252286911cf.24.1779963192095;
        Thu, 28 May 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:d0e:b0:516:e96b:2356 with SMTP id d75a77b69052e-516e96b277fmr252286591cf.24.1779963191696;
        Thu, 28 May 2026 03:13:11 -0700 (PDT)
Received: from [10.111.173.202] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80ded529sm195589336d6.16.2026.05.28.03.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 03:13:11 -0700 (PDT)
Message-ID: <057742e8-9de9-4aa0-ac5d-8ddf44cf467d@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:13:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/39] drm/msm/dp: pass panel to display enable/disable
 helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-25-b20518dea8de@oss.qualcomm.com>
 <7dxlzm5hm2uq7ai56lmvzyjntn4kprdg5bp6qr77cqetku4hgu@iom7kqnfn4eo>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <7dxlzm5hm2uq7ai56lmvzyjntn4kprdg5bp6qr77cqetku4hgu@iom7kqnfn4eo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _JklTvPsAM6A0pVO5rkX4hlt-rIOTOGt
X-Proofpoint-ORIG-GUID: _JklTvPsAM6A0pVO5rkX4hlt-rIOTOGt
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a181538 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=keVsun0R0cJNlHGda80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMyBTYWx0ZWRfX07BhQKRLvU/4
 D06cXSwO7O8TtqKANZSv8zqQCpcsxATLDich16UoEbSrlOdHybGOe5SJG9BQuS3cvAxcJK5RcGs
 9W7JZ85QZSJkuE3etMbIjZKjYxdLvga0tctEdnu6v4ce2c82m8zt6pgSuBar1G4rVdrDOaYJ679
 jD/mQIW0UksvJ5kLiyPiubRz/BhP+8q/fqyx+OoAdCCvho9V2P/snSGrS03IxVceLsi0e+wBrlM
 u+dEEYuh3zSskjPt1Kj3nEWRiO2aK8NdpT8xBMADXflDzJ0zCBy6yrWafcld4zF/Xq/Qdr3IDJG
 FSP+KXR5xpvAA/myECjnUjqSIhv+X9ta9qAp9kpApFgvcidUQw0+9wdkDJ79PPOyMrIthoOh/Z5
 z6TBQvxs2s0gUTXPNz7/UyCseCRZte5u/8ZcYUPpKn+1pC2CgAgBlAjUUsXxrOhCDCO97Rkyln3
 s8+jrmfuEA7S5ftAFgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63E1D5F0622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 8:05 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:34:00PM +0800, Yongxing Mou wrote:
>> Pass struct msm_dp_panel to the display enable/disable helpers to make
>> them easier to reuse for MST stream handling.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 7b3b9160e005..88a078e53dc1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -668,7 +668,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>>   	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>>   }
>>   
>> -static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>> +static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>> +				 struct msm_dp_panel *msm_dp_panel)
> 
> Where is it being used?
> 
Got it..That was my mistake — I’ll pass it inside the function.
>>   {
>>   	int rc = 0;
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> @@ -725,20 +726,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>>   	msm_dp_display->audio_enabled = false;
>>   }
>>   
>> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>> +static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>> +				  struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	if (!msm_dp_display->power_on)
>>   		return 0;
>>   
>> -	msm_dp_panel_disable_vsc_sdp(dp->panel);
>> +	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>>   
>> -	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
>> +	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>>   
>>   	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0)
>> -		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> +		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
>>   
>>   	msm_dp_ctrl_off_link(dp->ctrl);
>>   
>> @@ -1529,14 +1531,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>>   
>>   	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
>>   
>> -	rc = msm_dp_display_enable(dp);
>> +	rc = msm_dp_display_enable(dp, dp->panel);
>>   	if (rc)
>>   		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>>   
>>   	rc = msm_dp_display_post_enable(msm_dp_display);
>>   	if (rc) {
>>   		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>> -		msm_dp_display_disable(dp);
>> +		msm_dp_display_disable(dp, dp->panel);
>>   	}
>>   
>>   	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>> @@ -1573,7 +1575,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
>>   
>>   	msm_dp_display_audio_notify_disable(msm_dp_display);
>>   
>> -	msm_dp_display_disable(msm_dp_display);
>> +	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
>>   
>>   	msm_dp_display_unprepare(msm_dp_display);
>>   }
>>
>> -- 
>> 2.43.0
>>
> 


