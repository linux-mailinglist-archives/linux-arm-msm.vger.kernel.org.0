Return-Path: <linux-arm-msm+bounces-84558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE2CAA05F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFCD7306955B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8304E1C8606;
	Sat,  6 Dec 2025 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuwrZkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McgcnoXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC076026
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 04:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994002; cv=none; b=Dwl4qKKTXKaTJ6MoN1TB94G1vOrAICWA5MF9z0shiwJtOSEL+7SN0JMjeMwqbJ8dJnW5E8qpbPwo3ZTwbFInJ8sAAnWgJEE2EsnO/Bj6nQCGn0XBj/KCZ79Raol66u3WbgHie1FArf7XOpg00wIywHD9o9lTtrLSqxYhXlnG5LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994002; c=relaxed/simple;
	bh=L6P1v7cLlO/ZlTdiyzUmGDJVgwDAKuWaTajbWnpDiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+0iX7OcyioHS3WSvrDQ2KmC8LVzjjVNpaH6OOD5OnEnT6zqHASCVd+hQ+GtGodrW9ovSCD0ELLsWhcJ2tqVfbH/sMVOtuDyW/wUueAZ/qo4lE+3+eCl52EGg9uR6mSaj26sPsYSabT2gbuv85Rc1VM+betJyjl5uRoMhGcUfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsuwrZkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McgcnoXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5LA3jr1421756
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 04:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ioHtb5HIwaL26ulBFRNSHqMt
	+y3wCZhvYD3a8jUoxgQ=; b=UsuwrZkTGzU61nZ41skom8ZiSYgQIdLpFCoA1vsD
	fmUeHdRAhp66CUi10SyG10yfUakd3vgqGMX28Fb3mi6r6My75x/kDijjclttbd5g
	rw6w5VNSU4/sH/YLTve6lVaCHWM9DaevnBaf+s8iLo3UOFJqj6LDus497wUHNdJU
	n5Lzeji1aa6kcHUiebDHHtBLqSsg5esVGnF2fstFd40n52lT0kfNPrzYeo6hi/BG
	7q9MUwSU9q4NdhEOmQ/vgmaKCPWEIMzRvqx98/+wzkpakUAYNQQXyaRUQM4JHzKx
	uCkLnO7zxhxFwkTGkaoGQ9XzebhoYMZCztRJJULERux14Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av71kgqfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 04:06:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2657cfcdaso364672785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764993999; x=1765598799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioHtb5HIwaL26ulBFRNSHqMt+y3wCZhvYD3a8jUoxgQ=;
        b=McgcnoXNR1bdSBDwEqtF8YtEFjCZhww6avGpkyEqVBC/KZfic1E2ego+qFuk3/uFBx
         PB+CG/tbZtTZzlRrMf29W6LfaK8F8tvaXGX/usade/IW8/VAnGGGhx8qF4dGoq3NSVim
         BP1Xk3bfePBgEZ17+FkQYP2Ev0O3NTd/WGjoWg0qIcwwq+swb3SpDAGXFqkXy6y8L2+Q
         xL8koIal8wE/rEhVgpOiEeGkGkPxLWoZ5vK52YjN4QmOxhKYCtu9SaniylvW53DrJY/r
         LnloMnEiPfB1E0/Yphpd5WI0v5ym5wUfzYK9b7U9lAEyPmKekBUTWkJJTN97+giYGd0j
         T25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993999; x=1765598799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioHtb5HIwaL26ulBFRNSHqMt+y3wCZhvYD3a8jUoxgQ=;
        b=WADcYP572LL+XLYLj4c/HBF2Nm4I3ONkUBUcazO+3Dxk4jxE5lvtwYKyFnXlf6qQWM
         etZ/BUhk7bWGX+E6TRGunIGG/Y9LmzDBT9D87L56KPF2435OAEsuh5L6cpoyojNpjvSA
         qhaZiejwx1PrM5ef1RjBsuBSDOtm+n73Ck9weB/uFnPvXwxHiiWAvPzTKLLwJkuIqE4O
         2bshEysD/kSeWQAKRAW9C+x9mZEwAz5pNu19I5eAKdIlow7U+6n5ttxWZE9F+CRFRrfJ
         MAgQuy/3niXnLHZWVcqgmVZDku3fu7hZWQ2VrnZZExMQwRqQZwkLWiI3BhMdcjPj/kn/
         o5mA==
X-Forwarded-Encrypted: i=1; AJvYcCWkP1Hs1k41CpHxt+Ksa4O+nVRD83VyA6nfRIFhUBNlhi2DW0l3c9wj9SThIyJ+wzhBmpGebABg01k1pOL8@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTUHzNKVksb9H3O6amQyEwf8GEo+7++LsGDHNXRU0zsymjfvu
	l3PmkJcJXfrb0sw7c9uR3z69OJ8JJ/2cUEwb/f8hv/4x4IxTeRbrEBxbujSccLkFns3v64ZM6BF
	voQcl3CzreDldyJuCMKMi4kkKBMgWITVJuUZx8hE28C6zdyCFmlRueDCORTlpu3L1Fb2e
X-Gm-Gg: ASbGncvZ3KQCOZIDzYyK4sGKOVN2lRN/mvySG3F8Y4lB39hqwoU4xsh253mQEM0FVd3
	6GW2Zp6vu++oMlCVbykYmgUlwS/qbRuoUeVkQvYX0GwmuYCXrQ779a0hk9Ncz0wnUykXDz1P06l
	LT/w1Ut4uTVfRC73hG/+HX7K0VdxP1Q0GJKCgRl7iNuAV35EJ/FL4Cl/GEUW6SW0HALrXgg8Zxu
	6mQfkwDH3Lck0jhpJcbyFHpjyqkHCM7ZNvFFwEfmESpvUrGhb0hCqDrYDbds8JOUL0My4mFTKqi
	TG6txEaa0SImnu0IoNDvdsBYV+A28vSdmjHphUtaRWNfap/nE/jw6k8DKrGKtQ1ON5KB1wDKR56
	xUQKMYgE6235PRIoKsdi3axjx0ttbTYeG14aKRuWen8os1xj6CIPhxk0Qm2mnhh/9KQl53LDQLR
	W25RPZevvDFas3gFJ/BxzyVE0=
X-Received: by 2002:a05:620a:450e:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8b6a23e21cdmr201262385a.75.1764993999257;
        Fri, 05 Dec 2025 20:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFbIx/DQsHd/oAtdoad/neq3FS4ZzR1XcBlOTzq1Qzp11h57B63wFLzDIo+e8CpW0ZC2CvUA==
X-Received: by 2002:a05:620a:450e:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8b6a23e21cdmr201259385a.75.1764993998731;
        Fri, 05 Dec 2025 20:06:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597dfc536e8sm471345e87.7.2025.12.05.20.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:06:38 -0800 (PST)
Date: Sat, 6 Dec 2025 06:06:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Keke Li <keke.li@amlogic.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] media: iris: Fix fps calculation
Message-ID: <7mqgcndlrffm2wczev4s5osza7eg44zonqykfmbxq4z62u2rzf@3ugznlbhqwiu>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org>
X-Proofpoint-ORIG-GUID: NHZ8HT_xjMIMe9uW4u7XETQmCyXO11P7
X-Proofpoint-GUID: NHZ8HT_xjMIMe9uW4u7XETQmCyXO11P7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfXz3mIeUWOqJTw
 hpDK5vW5Fgogc+BRFYRjdmrSqE8GRQgBC72OHXARIVCVBKJJvpSdTr8n0XpUKUURgrErrVmlh82
 TeZouyi2qHjnBfm0TJLEzxrvvuxCcXimT4m2P4K4+vD8a5+M43Mx5efx2L5m4VBTwGPj+dSAJdu
 5U4Atj2zeXPKHa8KmAgGj2VlADOo6hk7RId6UjZRRAjOLTwAPKY1F3FZ4AF4Fkk9gnGWS+9hP3/
 cUamYi0exzlI+8JW4ziu59IVvttZlIAkq5L+uPNz7jkdgh3CZEIqFo1zULZMPVfiOuN5Hhae+fK
 VYULmLcyAHA2RL9a98Erq50MWGTMX4EPJZmvnraTfhNAVnUQpSPiUN8j47wgOjks+zrnhdU9BC4
 J3Whu0uuwrYiAuOZ4NYqQpd2UNT4gw==
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=6933abd0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=0qo9UwXc1eKLUzRIyuAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060029

On Wed, Dec 03, 2025 at 08:55:36AM +0000, Ricardo Ribalda wrote:
> iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> a normal division.
> 
> Now that we are at it, mark the fps smaller than 1 as invalid, the code
> does not seem to handle them properly.
> 
> The following cocci warning is fixed with this patch:
> ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> 
> Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 5830eba93c68b27fa9db87bac63a691eaca338d2..730f2aa1a83b2f4f90227ab9a7e04aee7c2c3cfe 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -408,11 +408,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>  	do_div(us_per_frame, timeperframe->denominator);
>  
> -	if (!us_per_frame)
> +	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	fps = USEC_PER_SEC / (u32)us_per_frame;

Can we replace this with:

fps = timeperframe->denominator / timeperframe->numerator ?

>  	if (fps > max_rate) {
>  		ret = -ENOMEM;
>  		goto reset_rate;
> 
> -- 
> 2.52.0.158.g65b55ccf14-goog
> 

-- 
With best wishes
Dmitry

