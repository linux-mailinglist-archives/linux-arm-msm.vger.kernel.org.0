Return-Path: <linux-arm-msm+bounces-109032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFlqGbLuDmqwDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:38:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9F5A41D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D113308C9C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F554125A0;
	Thu, 21 May 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcHfgysV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Odic3RdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D253859F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363283; cv=none; b=VcsktWi1+WIE/c1FVn2nlj27oyZCqctwtJ8vYHjgDBIfPven0gCmXqxbs+b2HpO5jsLL0u84aFwvvyMCaAv0VuESXKUuno4HxB4lruPyTDmD5E5lKxCjRyIjgCky9mv58VWmnoLlOR352W82bw2WMsreIBT/kkIDaOUgY/b0M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363283; c=relaxed/simple;
	bh=onGbWX4+j0/rIjiJlytFfCq5hkYRahQtjeUHPtbYiKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXAuqsK78/V0gAOr6QA3/+YXLbB9X6uxftkJlxy7j71q9y7QTpWatf5KWB8KrZQqYqn8NuW24unxLHUZ7MBKu7xoVa7dwHiShqv9tf1kqqUVA6nrlXPLsJ16liEb27sllEULhbrQOwvRBrOUCD6WV16KZgIe6vgIQIcKim+yVEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcHfgysV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Odic3RdO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99k0x3343457
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdNGl96a1LRZ4HsRLvAttgH7mqHz0ODVIhshUZSEX4M=; b=gcHfgysV16q12LbB
	9wVRB+KEWB1Kde20SRh+pTWIwHS0bvR1Ylq1J4SLdR65wKgY6y6DYM+P8bfjZx6o
	ZGL66cb4Wb0BXLjDlPCeEeoJWAgBdDcN7on31h7o9AWEkg77kj0I5/OaJTJ8Emc1
	TC9QHms5iQeASI6QbB8vun+vD2L+woUuP7MRuCMcmlGp3eK/PHnsptirgee7CMex
	Dq/yzpCU6QejBJA/iaTZRHpKucj6UWKms5ICm9sxoci8ght3WwwhPmD6VKeueNlA
	LqKeKBX2FZPWUglXAKLWBX184xZwg65BT10rwslMgF+LkRrIbvxPv95rOHj4sSTR
	GYFTsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs388-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:34:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so98900335ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779363279; x=1779968079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdNGl96a1LRZ4HsRLvAttgH7mqHz0ODVIhshUZSEX4M=;
        b=Odic3RdOTi7slF9Cpa7pnpLm2PaN/dH0oPxy9paALBmdkoJS07JDfueAk0CRFtAftu
         sTpUOTC5A2VrLZaecjVNm0ryajhnYhHPVYIh7J+WKkGNzGZ3dB1LPe2GjZO0/KvgVn60
         R2Kegolu38b/925EJ8Evjx0Q2fuowAK8nOC88+1Mt7m38KSipQOq8a3MpLJ0xIKwFEJd
         /zqL/Iqx8mgWNAuPRMvQueBiqMpfxHJbFVOjsrVe/mocEqr9RXB8tsYLUKAxF6yziN4w
         FkDLn8fWBNaq50bLXGQiSyZ/wPklByV3B5nBGndipgtbCpBc3hkfAwQE+Qlmr6axkcf1
         Z4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363279; x=1779968079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdNGl96a1LRZ4HsRLvAttgH7mqHz0ODVIhshUZSEX4M=;
        b=Xp7nqSf5zjsUIBly9cG/OvgaXNiYGxqbcsQGJ5F0kglcpAyLVpQuIEzFP53U4vw0Rk
         +B9lBQ04zvxBqpsftzWTR0rhV2Npo5UTY88+WcKP8zU0iWKd3/+0Yq5yybNDTAM5LXtu
         UVC9LKMjP3CMNnA7FEmjm9WHw1Krzo3hR1SLxVT3vFQWsqpSwNF/Vws41a0slmrwZrna
         ZpMKhwb2hkOo8Scp9hbfyaIlFrXIQ/zGZEnHldyaUmOU9960/KBKa+pFey5EdMlSl8JV
         /zxTNZVi299460DynPGJFFGXekoMofb+OwVLu+tjmkdFLWI0rberJVvnZxkYpqfT7Bhp
         4K0g==
X-Forwarded-Encrypted: i=1; AFNElJ+6+nJWg/huDTDb+a0K6Fr07tPS/bVkV00Cmb9K9eezlUrWUesLHzHd+sSyA2OteAG2wb8xAmNzXlcw338g@vger.kernel.org
X-Gm-Message-State: AOJu0YxirWonQnkPFc2OxSxv0hsqFCzcgq5U6daxCba3Fsn+mXaRokYt
	n8mSYF/aJijkfq0+178g7on9AxKD4ulZxqiICvGwi/RkhXSYanCn0Rxws6/MiScm0A/9LYUVb6s
	x3fp9hJ/Bpzf3xijWhwENLF11CaBTvuvl0eEqCXeQeaUSuxkk4tlOwB9jITdsAsyfvAL+
X-Gm-Gg: Acq92OHNGTgDtcLoLaNCOlBvl5qgoOTNP6LjOUDtYvMqjF02bfCeaKqs/4U+3IbpA0+
	wj+iWNb+4HTLj0oZaIqmbDzNpITSTd6CK1yv9kKTnaj0cN/zfEykKJ9CtSyf+vHE+MKDcEfai96
	JH6F7+oYfawxNKpDDZ2Qxhyupz47FwkbI+fvdcKyMDLguwQt12xeTucP1mGiGmFaASSXjkxsYOb
	vShvRR3ffLG191BjjOXxHz5EUzYXp6emYTq+bX55N9y9S0biSr7C2DBcS+mimw8a9hqrgVniSxT
	k2nO+J8XaNXuWKGucHZbL7rP+J0IK74gLP/WMtyamJsAI9mdBQgHq1RWtmYVa2AXwMU9w72EHGa
	U6rL8WASL1W4l4+SXdtMEuw1jvLREXb79LZyFxO3BUxdai8HPg5i3NyRM/Cz5MI3aLnPJEXOW16
	FtsFztH5WWOsXnisnNsw==
X-Received: by 2002:a17:903:22cb:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bea33e3948mr28017935ad.33.1779363279473;
        Thu, 21 May 2026 04:34:39 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bea33e3948mr28017515ad.33.1779363278953;
        Thu, 21 May 2026 04:34:38 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98ecbb2sm7832445ad.45.2026.05.21.04.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:34:38 -0700 (PDT)
Message-ID: <0e39dd9f-9858-49cb-a052-7d0791b694af@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:34:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
 <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExNSBTYWx0ZWRfX5xwu7fxFfSwj
 Qz2yd8Bf5Rxwg3gmjXqvugCO0TI3yeBJ0n4tzpYfmA0PpsnQhE8Trmd8IjrZmH0NsbdkZgXSqsb
 iEiH9hJ2N0mG2SFcwWkRJ/XSZQc0qauERgD4KbCYKNDyRuVAUNlWum5o/87vp6PcQVNSJcIeYiN
 EaTcW/4lpZe/nkZHdTw1dpXDxpxbNC0pRjkKKLnKWHN9zH87YQsAZw6Z/0HwF1qOep2lA8H39yV
 hLKgTL9RRmVXxhiTCbrHicVXWeBiF9Ipx1UsW7giBkmO562paB8PTyD7poYaOMWvSdlIdGNwoip
 Kv14gcBLCiB9XfiVke+kFG2mNP8xDdsZ9mAlWsjvUGYUIQhFqMOSFR2tXehPX1s5jNI9qTqCTQd
 /uEhf9y+oT36MJTf3VfDYpIrPcrhKvai0KUQOCxyQ0OFgzjCl+XlnGYxf5DY7Aaqx6A6Y2Y+bxL
 OKaF39faeYFb+JN9JQQ==
X-Proofpoint-ORIG-GUID: NNWl9nwul9Laxe8GWLmeQdTv4kGPM58g
X-Proofpoint-GUID: NNWl9nwul9Laxe8GWLmeQdTv4kGPM58g
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0eedd0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WZztYMh3yrmu__bEN2gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2D9F5A41D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 1:59 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:49PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Introduce the `mst_streams` field in each DP controller descriptor to
>> specify the number of supported MST streams. Most platforms support 2 or
>> 4 MST streams, while platforms without MST support default to a single
>> stream (`DEFAULT_STREAM_COUNT = 1`).
> 
> There is no such const anymore.
> 
>>
>> Also accounts for platforms with asymmetric stream support, e.g., DP0
>> supporting 4 streams and DP1 supporting 2.
> 
> There is no need to mention it.
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++++++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>>   drivers/gpu/drm/msm/dp/dp_display.c | 20 +++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   4 files changed, 39 insertions(+), 4 deletions(-)
>>
>> @@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	if (rc)
>>   		return rc;
>>   
>> -	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
>> +	ctrl->num_pixel_clks = 0;
>> +	for (i = DP_STREAM_0; i < max_stream; i++) {
> 
> Why? I think the code was fine with getting up to DP_STREAM_MAX clocks.
Sure.. will change max_stream -> DP_STREAM_MAX next version.
> In fact, I'd rather use that instead of the hardcoded value for
> determining how many streams can be there. Think of the old DTs which
> didn't have extra stream clocks. We still need to support those.
> 
The current logic only assigns num streams to dp->max_stream when 
desc->mst_streams == num_pixel_clks, otherwise set to 1 which mean sst.
I would like to introduce a switch in the driver to control the number 
of streams, rather than having it fully determined by the DTs.
Do you think it would be acceptable to use:
dp->max_stream = min(num_pixel_clks, desc->mst_streams)?

>>   		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>>   
>>   		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
>> @@ -2750,14 +2752,26 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   			DRM_DEBUG_DP("stream %d pixel clock not exist", i);
>>   			break;
>>   		}
>> +
>> +		ctrl->num_pixel_clks++;
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> @@ -1234,6 +1248,10 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>>   	dp->msm_dp_display.is_edp =
>>   		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>>   	dp->hpd_isr_status = 0;
>> +	dp->max_stream = 1;
>> +
>> +	if (desc->mst_streams > 1)
>> +		dp->max_stream = desc->mst_streams;
> 
> Here you can assign it from the DT resources.
> 
>>   
>>   	mutex_init(&dp->plugged_lock);
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index a5c6ed5b18e4..b0cfdf215970 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -26,6 +26,7 @@ struct msm_dp {
>>   	bool psr_supported;
>>   };
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>>   bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
>>
>> -- 
>> 2.43.0
>>
> 


