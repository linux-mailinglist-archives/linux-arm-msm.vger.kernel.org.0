Return-Path: <linux-arm-msm+bounces-102238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOpJICF01WlC6gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE53B4EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A00433006B26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BACA36212F;
	Tue,  7 Apr 2026 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOFsKHBp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDqkarUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9EC37754F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596463; cv=none; b=KJVRhxPuluZZayX2UYspKMzAtu7E6wjrRhwdaMhjb5M9SpNRw8oM6J5j4MJn616Psj54yu2DT3WMqeBENoZ8QoFuOpw6HY/B8C3jIeGUqNQGR7O+1F/UIffWdZW90gGshd8fEHQ+JimzIyR+9hsuCmI5D0mvHNJO/HuTweRUt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596463; c=relaxed/simple;
	bh=qYIk0cEiLICphXq8rqf1DCIt1hLJBQAnyEeh6cGtG20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgLpAMVk4/6a+9XxaoKQI5Gm24Cr9L2rhvtZ5wtaI1iveo0WZeyE85ayTQMWP/wog9zejUQGugMpL0JGUoV+yb4VnzBacNcDybfUnnTSPxKwAW9J/SC8Qh2ZGTWW8Fd1vLIHxLWLnuAh206hgi3Slo88V9eXY4qjUo7gy13cTH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOFsKHBp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDqkarUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637H76422411815
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 21:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=; b=LOFsKHBpQitMeY9c
	aojgScYXyCWOxcgZhyCgBYPSQEixwd/0kB+woNggVOUIfgfIL50JFG+Y01acYsfE
	cVxrR0HR+OsnVgZKe7bks1CM6IBVFrir8JKsz7y5relci/Za9HBGkspO4tgeHTkm
	miXRmFcjgqrFYwuXEhOIVgffdGpagyFSN0ArsqcUYgekaU4lIzodYcBhW4q1znWQ
	nKEHtAaFnrfuvUJgW0GEDR0VqO1kL9aseXIxjW9gMTN6v8bL34UHg2ndO9Ra7WDm
	fDvfV8cNxOaFFAasjDtHTuJ0Itf3yqaOXYsfsIIaW7gciUfIHSTs3iPiJP/z3HbX
	R8zeJg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61v8vba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:14:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b258636d16so56481515ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775596460; x=1776201260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=;
        b=XDqkarUUn7dcjmvNvYtwVl97jyP1nh1Yrax2RDNaH1+4yZ0OXQR9jUMsSnJ4VPn5Ga
         JJlOGZ4qJ02KCW7MvnRzeJ7t0ZWRJ0DZRx49hD8am9ntOr8Z/1hr9R6JDHhW/S5BzED9
         /4541fCt/8CJcgwdjmO+nXau5HmOReE2GMUjgFKIIDNNSxz4iwOHxbl2mxM99cMAQcQr
         u598XUjVtwnEgWeHMBsvKqB50TNeDWS7BH4HXRWUaF0mn3uyETDlBd0RCWcuKM+qxCpx
         16RHfS2Mb4FTO9qmYFdr8E0umQ5D09HAwb9/qphlSrSBZNXH4Tj7k/Wd7sanxFPFUsb1
         pQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596460; x=1776201260;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=;
        b=f3WYn9kPOgy+ku5rYzY6w6knHYUA6hFwqhQypxAU/HT0wELSECdpQdcS0PJX0UMbGv
         4TE92MK7tkla//aA7cWFx7MBw26ArE6+lBYN6MCKRcOF+fqSjRyZkAxglJxNbsde1BAg
         yWcOQREFzRxr7EMT+Y6S+clxOLGpHY8bXMINjjBwiMFOtYwIZBchuG9bSDq3ucsAnViG
         yPxhc7lhMjfzubfTaGED7RFA1u5rf4XvQwA/+vkV564GH9g8y2PbyFKEnUb6y4Xw/hNS
         pip/z5Kvx2Lziv5xTc+fW6KSEMgzOMQVzJtSBUrfisWzDF1gFnSmAezIH3I7MWYDhMbb
         51rw==
X-Forwarded-Encrypted: i=1; AJvYcCVCwCFRQaLWnN0OnhgqM9PULyNYW2oChE7/e40TwAEcsPotZ9KZ9iFJv+M5VAKm60EIVP9LD3vEDRVd5DzM@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJ6BuUcNYy+EWyxWYR2dZolbCmHgxEa9BLSMwcICIB99yo+sn
	1ItJrtCCqi6/omjoOTVbVuzqIPMwZm3sAOKwteqMGAem6j8OlsBnM+EergtvJ8KQDmfpyKJsim2
	zJZzFyigkLmolvzm4QAsyFmw7MeOnA6K4GMhgIGkMfV+K2+Y0KNsipTxeib/iogAWwTMw
X-Gm-Gg: AeBDieuua2uunDE0mIEvE+r95PtCi5wdlDfdfg6y7YjmurrZgKstjFWWblwRz1Pnze5
	369wyQ40W+oti3ceNOp2V7e8JTUEWKp53HVdABSnQZ5w5ZKn4pcWXTvzVdO+aW7i15u31oHyUZl
	xCj4cXI4sTw6DFuTddyfzqYl5NCqPGQiJbCwe08TX8E3f+0CEs7pw2q6W7cjDFfwUf/cs8TymrA
	5zkJ3awhPS5XH7t1P+YXx4SYC0cVnZbOTBrHyKV/hGk+4ImlF7gvzzMUApNmBcS3sgr/JqF0Z6f
	baCVnjX3kGXjZ0b7ooz4gzbvlLIUKVqDygH7dwOBCa76ELvfuCpen4XojIWP6hd3K2Xx7A8lL78
	V5XuW5uUAvHOfi16px8cFlwsCbWJ7lEMY8CEKPL4KjGdBSQ==
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr197860735ad.18.1775596459665;
        Tue, 07 Apr 2026 14:14:19 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr197860515ad.18.1775596459201;
        Tue, 07 Apr 2026 14:14:19 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d233sm186754435ad.2.2026.04.07.14.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:14:18 -0700 (PDT)
Message-ID: <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 02:44:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5MyBTYWx0ZWRfX5T0CT7YVb3NS
 8wJQ4Eg3dwG1wcR9zXRocwrLUiRO5Sz9NZfRsIv+2q/TFYuH8zX4i5TbZEccKlUU9j7qDcUp/tO
 W5Lq6Sv4U31b+hq+rNR4RaK3qpzFusFZwu5ynf9pBfIltWgOv2AajZ3vPsGXEyFS+RBT/6lDPoy
 rzDi406lW9bYqL56HAGP0m5YMfOaR3gZfdij062y3dy36ZB4dPGrpFvMnncU4po6eUZZnsEMJNg
 An6LMGX0Hz67kmIPUHkb5Iei8c8lYZYz+fcMt6JoBFJjjf3HlNYP2XM3VDcniA12xvXo2VMjBEW
 1awd03E6uiH/PjL5s/sh0LQKSxYn8eTqT7JRvmo3zCNh/u4DeVkI74M7PWhaOAXuDN14PTkIPfm
 74JnwpWfLN/1hiTsOYccNhQtCB5z2F1/i9zRPVYA/g5+muswihUXPpbmu8fY5USFYtypwt0PODJ
 YXzI64x2prKTwamJd+g==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d573ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bYgO6XzdekrPMLAnqt8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YzLxOlWNpV7y51WgFKLOufbiuRzZjurF
X-Proofpoint-GUID: YzLxOlWNpV7y51WgFKLOufbiuRzZjurF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070193
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102238-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9AE53B4EC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> A8XX GPUs have two sets of protect registers: 64 global slots and 16
> pipe specific slots. The last-span-unbound feature is only available
> on pipe protect registers, and should always target pipe slot 15.
> 
> This matches the downstream driver which hardcodes pipe slot 15 for
> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
> A810.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 8b4b022d9a6b..102d5e751536 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>  	}
>  
>  	/*
> -	 * Last span feature is only supported on PIPE specific register.
> -	 * So update those here
> +	 * Last span setting is only being applied to the last pipe specific
> +	 * register. Hence duplicate the last span from protect reg into the
> +	 * BR and BV protect reg pipe 15.
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>  
>  	a8xx_aperture_clear(gpu);
>  }
> 


