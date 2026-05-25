Return-Path: <linux-arm-msm+bounces-109670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DCwL0xRFGryMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:40:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B45CB492
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D406303F7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F623859F4;
	Mon, 25 May 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArMoF0E0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWY+b9Sl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FF384CFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716129; cv=none; b=ryMb+kQ+MVrvif68jv8Gx2VDCag65fSiDymiIPYQXSQZ8sEvY7Kq8zAdRTJdLZMHNzIFROKQNwkY6clMvE5ypJI5DeB1wggVJtngqfrOgNemdHSThJvWGijDDd4ajoUTIvRQH/dn6OE7XdH1flbvxPTulG9PpFONx7wrBPRYcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716129; c=relaxed/simple;
	bh=ITfBPysZvQqB7wtH0cju2S9jTfTV8R5uIRWoqG9MZeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRPajVT8HyXh87viLis5PonDqZf8rTOaREZ8hZB8ZM9azVEaaIg7mJlXiOsn5zP5vb4ymtYR+rKoTg/sm0UMVxIscjx5pxftoVSYGwku7KbfkjAB6KHHw2NHS4XtAd9ZgIWJhPgtL+jpuRXnyk6zrFPObcUfvOfXv7ztFB3HuAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArMoF0E0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWY+b9Sl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P76QcJ1392536
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNLxbtGJrP9x6ELJiMrV9m0Y5RYj50NF/BQj9YA7V10=; b=ArMoF0E0Zh4o/UjO
	yx+pVe07APozjE7Bu2qU7ZstTsKjacKHrR3r4anw3+137NN/5zxTJD8VoHvy+3nh
	dSXPZLcRoLu2s65JmVtseYDTrnFnhdFfKxR56n4RZn5vEnOCDE1zzcOrgDZHv+fq
	GK4NU8mXCl9U0MAdqYPLLFJ8pMWN6obtNkttEtaMyqHTs3UVru8gGOEyZOi48khI
	amPkpzTwsi+kRjrfL43j2NkMQCl3uH8NtvIPXArmLmgfgHadHOr7IbjPZvCRetBs
	B8q35YLL+0W7RTShImHf7NvChqS2wQIW99Jt/uvxwMk4CgVYozLotLooD3C/sljO
	bxfxrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpv84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:35:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso124273791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779716127; x=1780320927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNLxbtGJrP9x6ELJiMrV9m0Y5RYj50NF/BQj9YA7V10=;
        b=HWY+b9SlVBkmjA1vmk/EW7hIzj7ZJWTrnzuCwfugRIzxasbtLHZpeo4GpZPYPT1PNM
         xZbbXYipDyzXb+T21zKzDq7LFGI0brMed4NW+4ZKCBf5akVQRWBNkfz93tTM+eaa8u9Y
         rzk3yYI9LKvuF3w9kPAYOtPIntduGMucViVbWiYYsp1VcY+oZRe+zax3pXNzFqXKUZi/
         poLWCxp2CljLIvDQr5gtfoMt/aljNg91EFouuIdUT3uEB3dnjb4It35G6sWRu0PZijEq
         GEcL16lQ5HmL7L8Q6bOyUW8sWPiU4n3d/9D2kjHOumOQBFxwIquYUKz5o5e11a1FXWlV
         43mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716127; x=1780320927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNLxbtGJrP9x6ELJiMrV9m0Y5RYj50NF/BQj9YA7V10=;
        b=cG5H7wdEh0x2hmMj6y6+As03McAXkhEOWWF0YTABj2zlAod45hHw6sDYMTErSW8b42
         TQgAUJ1bgEvB+eVWvn8r2w4mKpbHaZg+8auMBoC9VdQifqocSbhByMQz3uxboo5Zm0l7
         Mdcp6C8MZ90+gwrpyICdU+1wjlMgi3dO0FFqJv4xponaxCpYjSvAA5dx5syd4r3znR2L
         +X4Wz2RcrJRRqH+Ivr+k+rw0NrFygrCm9d8tI/bK5FMQCStxxGBkrU7Z5qiysNW0UmxW
         UFpEmq7aWXFvcncMJVpaSic3nJHYKwq3Fz9rf3GL1MIjo+F5cCi2PPCZRot9BgODJghS
         eVhg==
X-Gm-Message-State: AOJu0YyxIl+PtWAw3o/DeImJXjEzN6vh6FNEEf/Fe8Q6WUQP3vCHijCD
	XUKRti7vtaU49fDewEkoowVe8uieAPG7EI6n4FSSb4uMVsXZ+s6ziTfciKfiDPXdTqzg1rNtfuR
	/ayCSSpJ4MwHVwqjMKKsq/xnaffO/RnjYzQgiq6cE2uKEgH2X5I2ywAjASUiSEgoLJ325
X-Gm-Gg: Acq92OE42G4Eh+/PykHq7afk5dgpdRdbv/CfSboq+3sKEoiv67gBiyr0nzfTXGxq86c
	lXVGQeWsdzAWT8eY9K7agHh90BHqx+KpgM6NgamczvoT2JIxBeJFl+2yplHsjmF7v0yYp3nnQBr
	Q7DZLfiboj40y7UfINtWq+UwNUWLoNsxc97c4paZLr2Xi0vy3miteVBtJZBkUJ3BIIOi0uVx6Jq
	YWl5ODETvVedBuBjHaah9B7x9rRVnlMHR+evVVy61KLPSxY0eRQ1y4xhg8YQtb98XhiEeAKF+0b
	1tEWDPYQPbFz6n3enP5G3sDphS5tAOluy44EV8EScSNiUapFMnmHijpqabWle6emkvMjdKFi0km
	SxWnEdzzMSybkCQFh6TAwfeuocUQdL2P7niRllJwIn/s=
X-Received: by 2002:ac8:7d45:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516d436a31cmr178465701cf.35.1779716126597;
        Mon, 25 May 2026 06:35:26 -0700 (PDT)
X-Received: by 2002:ac8:7d45:0:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516d436a31cmr178465131cf.35.1779716126048;
        Mon, 25 May 2026 06:35:26 -0700 (PDT)
Received: from [10.236.54.193] ([88.128.88.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm26639898f8f.13.2026.05.25.06.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:35:25 -0700 (PDT)
Message-ID: <4afff193-8d2d-45b3-b8b6-0334e1f8921a@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <00ee4b34-7f71-4448-806b-65bd62ebe574@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <00ee4b34-7f71-4448-806b-65bd62ebe574@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfX9e9T94zzHeLk
 OjmUDEjR5y7JgXtFZIOB11pEIWDrzAX1VY78HnZOZ4/KXO7v5dTDMkPzucZLpgXkPq6taQLeCuI
 Jwwm/RLDqe/gcETU4gRVrBya8OpDLyOz3J4x4tGSHJV+gU6GFC9NGCkgCvze4SV4omYADU8ihnv
 r6rpgrWGEYuYM0pg18XCG/3OsZS88aPYYrjbD+mBTF7LhykWj3JOK2bZWuQ/PlMDNZoaxTtofdN
 A7UB60Va8uVsx24tQVqrmzaTzJJ/KS7W7cGdS1RFIaM1UUYfBvd6Lhk89eLwPQ1qtl6W9nJrG8C
 ct2E2HDB/VzS0KEXQv1Vnwms6zOgLtw0vFJTk0hSOyYqw9tHcOoBReqXqOpxA3/hTHoK816U1oe
 vRc5Q3iN8L0qoxYiEX0knYjpOGRbTw5HXsZhAWRcIv/16YCxzTFdGOlySeg/IEnC2UiMCaMIoM0
 IRv9MKjsGD6Zy0zYzzA==
X-Proofpoint-GUID: mWEqN-FYD3yUmi3gERCmHwXwR-nx1sQs
X-Proofpoint-ORIG-GUID: mWEqN-FYD3yUmi3gERCmHwXwR-nx1sQs
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a14501f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=REkWmwYpG64U3YBEcLtx5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fzl85mFQbXLh34uAWx0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-109670-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 258B45CB492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/05/2026 15:32, Konrad Dybcio wrote:
> On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
>> Instead of relying on the link_ready flag to specify if DP is connected,
>> read the DPCD bits and get the sink count to accurately detect if DP is
>> connected.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
>> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 63 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 20 ------------
>>   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>>   3 files changed, 65 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1dd168acbbc3..97c4752005c0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1152,6 +1152,69 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>>   	return 0;
>>   }
>>   
>> +/**
>> + * msm_dp_bridge_detect - callback to determine if connector is connected
>> + *
>> + * @bridge: Pointer to drm bridge structure
>> + * @connector: Pointer to drm connector structure
>> + *
>> + * Returns: where there is a display connected to the DPTX (returning
> 
> 		whether?

yep

> 
> Otherwise, if keeping msm_dp_aux_enable_xfers(true) is intentional
> in bailout cases:

In the non-error bailouts, yes. I might want to change that later, but 
for now it's expected this way.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
With best wishes
Dmitry

