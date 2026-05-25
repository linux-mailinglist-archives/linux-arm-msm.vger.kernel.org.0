Return-Path: <linux-arm-msm+bounces-109668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ4AMFZQFGrmMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:36:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595915CB3B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012A13007F52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5916737E2EE;
	Mon, 25 May 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYeSHzfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOC+F8FU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F264385521
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715966; cv=none; b=rFGB3pbSxuCDe4kFGcPGjKO1t/Lb2J7720Yx+nHGdM5yB1tapP6ds+Uc299CbI0BAAAmmJOVbUeicnPq2NxyP20BZNpB0pezrwTGAlNzKluUF1py50gt/RzVYa3NquH01dQqUdG6Ap+zz7JnfNCFdlscAHcdwQC8xU0zedjzy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715966; c=relaxed/simple;
	bh=u1ow/i9niuENMjtqNOhto9R54yrc9dgiAXBNWCwVV9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVSXDX7pi7cy3igQ+jEgdxrn2KTsnyeLEKnD1lJr+wA1As1ZtsBrZjjOVs/DKXtiWPsOwFVFt/zv24kaIy1+Y4FboJ+hgkYCR6e98WuztbqJ7AvbDRaNHS+/UvirmA96GpKjxbY34/mcYKv1H4SIyl7Rq2FrOXlTpjFLUQLixgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYeSHzfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOC+F8FU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD3kYE3604073
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJf8SHZ8adk67Gfl+mwlKWiNU1Nx1Ly7j7+/7kZEWZo=; b=dYeSHzfpjdetWSDB
	BE3WGbNmn1PknpNnJljB5RP+KkYU7f8ngYBw+TX+rDpWUZu8WNkNmEaZzB4hYrCk
	iFai4Eb+FTPTw8DLd4tbFSWgGRrMOd4pxw96+kKKJWG8AQeT+NnjwdMxTFYxrt5E
	ky+SnooPN7jQvGvETIgC65xD79EMrJn08kRt8tugsFmCLdRyN0Uuqv59OFODwK2C
	MCcd+zVtf4JkcsLd185PHAGaLn76Z06qId6QFdwQAVakDixzbsDWMEWzqy3+fneI
	I4umIjNvlPuDX9XKZtR9OmRL/1X60HUzPxC95cQTfD69rIzjlVKdIcpN9vARANLo
	LekPrw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqg3jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:44 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dcd56265b4so2277279a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715963; x=1780320763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJf8SHZ8adk67Gfl+mwlKWiNU1Nx1Ly7j7+/7kZEWZo=;
        b=UOC+F8FUFAXRwptXfogep6xtUkPlIXo7P8ERz0kps/qGRikGNLOvQGFS0XD2cbfaeO
         lO56FyQTRDDTw/nE/HiK0xbE7NgnqcdnCHcNR7k+aBfOfOnr3zH8fhKEbU6llIdCEwI8
         becN6Fa55Lm3lqaAmQx4gywPyHfj8kZ9dhrpwuQIezZspNWKSVZ6gq36nuS8oVN3bqdA
         AG6R6KlqDWQheNtpxYiSOZ5HF3E1MC1yXHcuC88nDy1T4ntL+17I7ssGaL2miHgDZ+zT
         38Qb+06auPKBg9NzJTrplS3Tgo4tEyJvr0fhvYbma/md1BSS/v1Z5/lbfNMEj6sPmsRL
         uPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715963; x=1780320763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJf8SHZ8adk67Gfl+mwlKWiNU1Nx1Ly7j7+/7kZEWZo=;
        b=YUqRQIuVYHphvGxg1a6aLPfYPMsqY7DxnLa6FYqJNPJO98ryxubpPbSGNEkCZUd+IL
         hGyyt5RNNj+P2oq8b0DvbwcP2s4QBrGtzHne/O9NMa6dpLauJbh+zyXlfsCfB0JVB0an
         L1kPVDMHw8KtQdeMyTlb69Ib7Y85JaJSXOW5jUadVO9ggugdbr114bHuvWnuolarHTFO
         b70JW0V6C35qgkyGC4eyHPAL/xrpuYaDOB98c8m9TXqkLMQL+5JiGmioaYcd255H/Ekd
         bCazAfilUSA8joGe9C5D/PLJg+5aiUDQ3Py5LtaymVPNpjO1HGRbv/HalbXddo1MC/Ly
         +RHg==
X-Gm-Message-State: AOJu0Yy4Kuot/Bnj6UQO4uCGjo616pUJVHqfZWNSZne7MEqh/mKyGMN6
	j8So+MHXNj/0LiAgjQsXhTOmJq12Xh6/AUOiNio85sXTZ/2J7RRJWcLGhp60cjnxiL3plnRYKIT
	Ngz+LvJ44pSBus1wsjovjDSqiKRkguX76d7AxZAfYcaRM6QRze53O0Ls4v5hjzEUk3rgw
X-Gm-Gg: Acq92OHsdSeEcoCDBgF1m9uIlPlEJtibrsQsxWlaSTuPSfdAxW7LSNjXbkPhrPtRaRJ
	2YF6vEKQ9LHFiRZazWSiPIQg7YeHSk/xZvLJ5PysEU9Fyy7uC9Seh/W09KSy1vGbpXb8YO8iWl1
	0v3phrBsO9v2lrx5o6kPE2mFvbW/QybTIXP4JJdsmAyL4HeLVpVmPqvpLA0bB+Rfp98/PQg+R5j
	1vnCfflQPwqlDJJKrVOxweiwHYPiv9qOV45tdqaUgTc4kM9sBrQxkpmKlrJvjA93f4Oj8Zr2TGQ
	AfMmmkiAEAoOZcsOyx85HE+ItItjO7wiht3iRrlmTlGa8oJ5+lyiaOP/zmxpv3mAhqkF58zSlho
	TwPVsConzU/mMcQ0XnbBtjegMr20hrD/au8jdKt1W1fOU+tNcGfWkwQvL
X-Received: by 2002:a4a:ec4c:0:b0:695:94b4:d4bf with SMTP id 006d021491bc7-69d7e83053emr4656102eaf.0.1779715963312;
        Mon, 25 May 2026 06:32:43 -0700 (PDT)
X-Received: by 2002:a4a:ec4c:0:b0:695:94b4:d4bf with SMTP id 006d021491bc7-69d7e83053emr4656085eaf.0.1779715962851;
        Mon, 25 May 2026 06:32:42 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eced0asm401848066b.39.2026.05.25.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:32:42 -0700 (PDT)
Message-ID: <00ee4b34-7f71-4448-806b-65bd62ebe574@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:32:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-3-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-3-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a144f7c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=e2WOG6c8x0SVvsxun3UA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: iU2DwJt0J6XWc5futhzV2nFA7i3y2uPE
X-Proofpoint-ORIG-GUID: iU2DwJt0J6XWc5futhzV2nFA7i3y2uPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfX+78X+DNqG18a
 PeWj4QeOTRyxo/Oi6FaDhe6fd7OXZLiFT+UVUspgO2ToxO71axIy5OBkQWG1DHlWXogNpX1fB2k
 nGd69T7XCAm9r5l44a0niBPETHMwk3dVLEEHbVeqYPn6wEd6kqq3khZ1Dxqot7DMqQbtHQi18m2
 4k8P5Z8fjJqpHbKU9vl/X++JDKKXSBzxE7Rkary5SYQkJcAGzHvmu2xvBOoBy5rJnxms+Y6myqu
 WsmQg826t408gnYT0wspvZvyawK9tLxT1oP2XyPrzV8MNUYeWeCen9qObMLw2wClUPkkMHwpkFk
 R/aBnQDH91nsUc0jiMer0rjm9pOJREY8ppUak3GpcgsPi4Q9x6gKCPo0PTXLLwugbLa0SeUCj7d
 n5kKeItqXTQSh2oDHNVE2d2ADtfv0O9nNTzDWZofQl+q9cFPOZ6vWFMHNi2AW/13sRN/sJ4osY7
 l8Lj2VshivSgYOGEyVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109668-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 595915CB3B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 63 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 ------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 65 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1dd168acbbc3..97c4752005c0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1152,6 +1152,69 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + *
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + *
> + * Returns: where there is a display connected to the DPTX (returning

		whether?

Otherwise, if keeping msm_dp_aux_enable_xfers(true) is intentional
in bailout cases:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

