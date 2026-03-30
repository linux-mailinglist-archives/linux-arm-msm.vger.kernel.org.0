Return-Path: <linux-arm-msm+bounces-100681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLa0Fp4rymmQ5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C713D356AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2A88300B9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F303A8730;
	Mon, 30 Mar 2026 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJLP8uhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFCJsfla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28D39099F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857106; cv=none; b=kZyKl1vSYoxnmCTbQpboUvqPJDb3TKV9RfNVMExjeQR+rb56vctCPsuJB+n3NnpR1za6Ev5VzfDnuoVJAD9hX/Ugy7ALGEjW8zOiAEf12WXBAmCgM15InHsKRmO3/C3GbpXlVYj1YXRNwIZ+7rFyDzzvcvq6HUFzFoNzALUFnus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857106; c=relaxed/simple;
	bh=JUw+2cbgpxanUtdxHxVY5HcaiGSr6oezlkMjfnTm8Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKdVjKKC/E7TBw5cDDfvOxOTV5h5oNZZ2Qdis2Udys7Hm6CgZWAj6itlfU0onPiHlULUUVLxWYKvlE64l0yaRrlGqdAZJRj5QOPUY23GY6XE8KjF9phzWOeLeVgrW4QMOjUWvBpQHv0ht+a0Worc5T3EOUJE3PiBPVsR2fH6Zj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJLP8uhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFCJsfla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4QY7r4008353
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMiUe9iN06BRdJhoHLMir2LU+GzeH6cFH1Hb19BsFhA=; b=FJLP8uhUBXQdg1zp
	exyv/CzkrEPMgAoYTZs2W41+N+Z3yk1Dv5UnZ3l0wYe4U+LqKWn1KcKmKxE5g4H/
	pCjUFrCR3kLfroOV45hYQCvVEAVMgM/0wa4w7PqOlnAwXGaTpGGiLet2x3KhJVpu
	Qjt3g/sLnZfjsT99OdQD2xYfmuJ5LCCeya6VXQpn0FYIH22nBj/1urwXAzxG6t21
	ObHbzwLd1RoJNFnLwrfL3oOpbJZwiKw/BSeizypyH311fAalSUHooHuDGEpe/kdj
	IDVMEo8IXt4qTzvcEFaWJDJwNv6II4qpYvp81zaCILgLc/swZz/NbWRcqhEEJz/b
	tSeksQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm5gnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:51:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0c92ff4ebso41249665ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857103; x=1775461903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMiUe9iN06BRdJhoHLMir2LU+GzeH6cFH1Hb19BsFhA=;
        b=QFCJsflae4yDtOcit8gnTNYO958rJT3Hhowenx29KwJH5NyAPF2crzpqbFIlBhXop8
         f4StZgtIbb/5xqVy5aydQwaOYpZLEK4V3AWmvhlYjl86saBXhDltTdW4irKi38QyCgHq
         9IeLbhUk4CHG2JzeKHpIPcYwOk3VrSL5A5ZSMa+gTCeXGIZQU7X/zFfea6P2jZmtOA+E
         f59u29PoWsUU05kbMnH3E1ErA9gwtC8u6arMlf4Kqxjskn6xWlkCjl3tECxj2+rAPbWM
         AJG6sapGcxlv72p5yjBq2h0s+lQ/A+Vu9ACxxwKDJeXprgrKsmt3HxY6uuIGpO1NjjnZ
         xxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857103; x=1775461903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMiUe9iN06BRdJhoHLMir2LU+GzeH6cFH1Hb19BsFhA=;
        b=RAV3V1N7F59HBUTyF2MuilCExZ1hMr6Nv7gTwDLhxvl1MiM3dA0MPfTDbUl/kBLTEa
         eqG7c3CTz6YK5LowM6w0fbA1cHN6L81G4lzaMfceM9A/7lops+NNdeJJXxU7JMhJLiJh
         2xoRvkCXnppUhgw6yQk9a3aS2um/Hr7tf1Oied4a2XI9ejHZSzFhA8/Hx9uYTmxvpQlJ
         A0tsZd+2zImaio4OBRzCM0oszE5cQUYxLAVRnOICKivZw+/ve+mJpt8hVhVtCm335oOA
         8aIqDYvxsgwtOMjJvCQIWiz1at8co0VTomSq5nuwpbGBrngzxTIj9GcIRBdSv/R4YL8L
         BhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUao8zj7T992OOVZvuhq4Vq+jGZ1sAVXE2yD4FQW+HoQL3csR5vruRcwlpNjkcBQdOYULx9cAVZpsi1lV7N@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjlhx6JMAcR/YO3N4kl/t3p6Nhl8Oc/+i34xy7oht6gHRWR9y
	tEftUq2Cv6cr2LR9pGHO6jBBgbouvbEVuqRfMP2q9dUHkLhMb71LaUWMU0bXNWvaYD5CzUUt488
	ERWSopnrXpz0oz5IJl1DNT+5s8eJS9rnVMJv+9ktB3JSyOD0nvSdh8AJQ6lFQbr+90G5J
X-Gm-Gg: ATEYQzx1DW4b/x1pTByAANfm2I4EX+KASxLD9GuhJbEkSfU3YxrUUgQhHiE2Hc+1SjO
	YjqzCXhFgYkRytyRShayNPcprG217u1A+4uGfquszT0GlFWTLkRSKBx+Uw/iZe19Xiv8QgON67V
	e6dkGOJsSKGfUFtfwznF4tBX5URsnX7wP3aXqmS8qhf2XJqNNIydxSHcSf3vmcSHiCAHlePl2b3
	va46DsKnfiBNDPjfY+VPA0XGPFnaXpngsMiX154N8ilXg28NI54GpEhUMCmWosENPgYlxHvdfW2
	f2p8q0OelS+AJkV3QrzYCPYiYbHwPhGEw8raVcSoooR/cilIpwTaEBapCEA4gcHqwTRBsl2VTrw
	7Hp/2ixvpc8xAbuj2nGBz14SnryWiVSvRwQpIfdayaD4szlY5
X-Received: by 2002:a17:903:2f82:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2497e4b68mr59145595ad.8.1774857102834;
        Mon, 30 Mar 2026 00:51:42 -0700 (PDT)
X-Received: by 2002:a17:903:2f82:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2497e4b68mr59145235ad.8.1774857102341;
        Mon, 30 Mar 2026 00:51:42 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277e8d3sm69819085ad.55.2026.03.30.00.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:51:41 -0700 (PDT)
Message-ID: <1a45815d-1354-43f2-abb4-438e55e2cf44@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:51:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
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
 <20250825-msm-dp-mst-v3-2-01faacfcdedd@oss.qualcomm.com>
 <aa35nnvo4mugk363rwa3cndjwj5sukfchdxv65yob2uf5ugskz@gus3l4d6vccc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <aa35nnvo4mugk363rwa3cndjwj5sukfchdxv65yob2uf5ugskz@gus3l4d6vccc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zog-I-pEQlcZVi8FYMgH7GJmxcA1JKfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MCBTYWx0ZWRfXx6W32uoakdNp
 4JK9g7fi8wdkubSyRI673HRmssqFwx0slcsrGkDtQz45dA5EtW0YwFV02wQVgu8mndhxFMBqDo9
 4HY7gh/2my7oTL4HTHekBkrkdm0PBzhD8GLCw23uvul+HhrefddqCPmoT18tzrIvpcyooPdJNRn
 7PfF7s87QB0UWH/pcV0rYqH6IRkcAqxbBOFCj5UVkL+qb3mTI5t4cEUq3SvCbU+uTF/AFY4f/hl
 XbseUPtavHJBoYdNXs0HjjmhHmnnUUaXOt4tVVlITzjeR0MbgqLXafhCf4yLg44X0HwnfGR0VEh
 YBndjA9Z9UI/JVvMVLh73yBYhHrBuVaHWsfWn3REzqNYaoGy2svcyrhWDBTddVQpPMx8kOYTDne
 akfBJsK/2zkX+5zoHENd/zu+LD5L054fuueZlF61Fq4py3ayfrDmLQ0kY9jvJxqiQSW2v52pxz1
 oPqscwCJbMhCJ6ARDXA==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca2b8f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BixJ-8ITQ80jKJ6xuOMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Zog-I-pEQlcZVi8FYMgH7GJmxcA1JKfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: C713D356AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 12:50 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:48PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> dp_display caches the current display mode and then passes it onto
>> the panel to be used for programming the panel params. Remove this
>> two level passing and directly populate the panel's dp_display_mode
>> instead.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 66 ++++++++++++++-----------------------
>>   1 file changed, 24 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index dadf31bc37763c4f07f68b76fbbe33fb77b20850..632a1191e4e48fecd7dbda2f6ec6b8ed0aeebc93 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -60,7 +60,6 @@ struct msm_dp_display_private {
>>   	struct msm_dp_panel   *panel;
>>   	struct msm_dp_ctrl    *ctrl;
>>   
>> -	struct msm_dp_display_mode msm_dp_mode;
>>   	struct msm_dp msm_dp_display;
>>   
>>   	/* wait for audio signaling */
>> @@ -649,16 +648,29 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   }
>>   
>>   static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>> -			       struct msm_dp_display_mode *mode)
>> +				   const struct drm_display_mode *adjusted_mode,
>> +				   struct msm_dp_panel *msm_dp_panel)
>>   {
>> -	struct msm_dp_display_private *dp;
>> +	u32 bpp;
>>   
>> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
>> +
>> +	if (msm_dp_display_check_video_test(msm_dp_display))
>> +		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
>> +	else
>> +		bpp = msm_dp_panel->connector->display_info.bpc * 3;
>> +
>> +	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
>>   
>> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
>> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
>> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
>> -	msm_dp_panel_init_panel_info(dp->panel);
>> +	msm_dp_panel->msm_dp_mode.v_active_low =
>> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
>> +	msm_dp_panel->msm_dp_mode.h_active_low =
>> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
>> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
>> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
>> +		msm_dp_panel->vsc_sdp_supported;
>> +
>> +	msm_dp_panel_init_panel_info(msm_dp_panel);
>>   	return 0;
>>   }
>>   
>> @@ -1328,7 +1340,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
>> +	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		return false;
>>   
>>   	return dp->wide_bus_supported;
>> @@ -1389,10 +1401,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   	bool force_link_train = false;
>>   
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>> -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
>> -		DRM_ERROR("invalid params\n");
>> -		return;
>> -	}
>>   
>>   	if (dp->is_edp)
>>   		msm_dp_hpd_plug_handle(msm_dp_display, 0);
>> @@ -1405,12 +1413,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   	if (msm_dp_display->link->sink_count == 0)
>>   		return;
>>   
>> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> 
> Why is it being moved from atomic_enable? You can access crtc_state here
> and thus the adjusted_mode. The mode_set is clearly declared as
> deprecated. We should move moving code from that function rather than
> adding code to it.
> 
Got it. Next version wil drop .mode_set() and move it to 
msm_dp_bridge_atomic_enable.
>> -	if (rc) {
>> -		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>> -		return;
>> -	}
>> -
>>   	if (dp->link_ready && !dp->power_on) {
>>   		msm_dp_display_host_phy_init(msm_dp_display);
>>   		force_link_train = true;
>> @@ -1479,31 +1481,11 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   	msm_dp_panel = msm_dp_display->panel;
>>   
>> -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
>> -
>> -	if (msm_dp_display_check_video_test(dp))
>> -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
>> -	else /* Default num_components per pixel = 3 */
>> -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
>> -
>> -	if (!msm_dp_display->msm_dp_mode.bpp)
>> -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
>> -
>> -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
>> -
>> -	msm_dp_display->msm_dp_mode.v_active_low =
>> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
>> -
>> -	msm_dp_display->msm_dp_mode.h_active_low =
>> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>> -
>> -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
>> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
>> -		msm_dp_panel->vsc_sdp_supported;
>> +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>>   
>>   	/* populate wide_bus_support to different layers */
>> -	msm_dp_display->ctrl->wide_bus_en =
>> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
>> +	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
>> +		false : msm_dp_display->wide_bus_supported;
>>   }
>>   
>>   void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>
>> -- 
>> 2.34.1
>>
> 


