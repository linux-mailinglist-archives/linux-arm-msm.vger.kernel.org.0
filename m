Return-Path: <linux-arm-msm+bounces-109277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GL4FqtBEGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:44:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB95B330C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34A4B3049DC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDF03E8C7D;
	Fri, 22 May 2026 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELr8j3nF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/1u/Som"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26E3E8C78
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449594; cv=none; b=LHF9GFslbsCRr60g0r7fNifVgsK1vASJM1xyeGOzA6meLA91Kw3X/y0hOtZ7authWbl747rVzbrMqLL8HFPplZsvLEEjiOXN0eyVPYGyWjxJ9prchsFW79fDFmwbGVU8zvLCembLMv6S7tuNPZT6opN0AbN07GVye9y5Y7ffT9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449594; c=relaxed/simple;
	bh=k76CFvOUtYTWX2742eULvV2pXmKvLaBCzSxRd/5zrtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urWAM+epLPKwxhJnyAem52siepaMqNZgaa7VuwhmATiva1rYz+ftT41EwFT95t0ANUM2NLQN7aoTHZIcaSrPwzjFlVdbpwjiizm6pCjyLUTjbUlvdct/jrDmRK4vu/zs1gLdzXt7OvFeuYEu9EH/wMoSLKimNqPi66HOB9Whjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELr8j3nF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/1u/Som; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M733DY1298195
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gW8frZZ8Fde1HC+RzR+WMWPFCf5xWqdVBkT+AH22Cr0=; b=ELr8j3nFK7SWU342
	WKeO/0WJnKRJ+BrSmgT1N/7BFttmEH4vUwJVkS0Pfj23OC8ixVonLXJIAudwVoZt
	1bcsdFv5xhEVFhBk2EEKVwZ0y8tXwhsaFqrmc0YutDA469E3Dk+j1ybhppUGU4OJ
	veYKLKaTBEGIQpeNZxrAyeiZeY1pBLxqeQCjPmUDXRWCZR/WA+cSKWK0/jpBrY7W
	BvkwUtCy+l/trEPGBor/yFjX1sBWR7eyTKd/OrCER07Lsp97vVCE+ok7KLhs1jvl
	hlJR3JTMQTjyH32k8JqRleFLI8qoolSnD88mJ5dHMfCvtiMDiunCyQsz18MOhAqb
	MsLlzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0aqy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b58ab2c657so27932236d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449591; x=1780054391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gW8frZZ8Fde1HC+RzR+WMWPFCf5xWqdVBkT+AH22Cr0=;
        b=C/1u/Somhuz9XczxRkHvt4hHShGWENhZ5VJuo1EfoY80fCwwq/jYeHwVuvYdyWIvFw
         TELWNwmwCSXT2ZPt1/qgx6ogkt0PKsi1+X6zhorPeuKG/5rFAWj7R5HrIApHYf0n1K4t
         IxIp5z6BSSKaCFDoasOg6/RvswbHXpmx3dDiss4yWXHbbeufbwgozvViEKCbz/w+yOKG
         8iSfkRmiOZPVuW0+En2ipq0EQtFEJ79b5IQdF7uD/4wFh3T4CPNV4koTVlL4bUeXDvR0
         ZrTTPFTomvdC5qOublTNg5MimO3/DdkezT8rZ7Vo/gNHRMqc9PYNv939Nam0PsSESpu/
         4V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449591; x=1780054391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gW8frZZ8Fde1HC+RzR+WMWPFCf5xWqdVBkT+AH22Cr0=;
        b=WnqgAA7nedQc+EaJ9NtQ7dRTX062jzJ6wwRt7sYp0GDtDer/DrEzPCCj3dxpHcWYfk
         4dbado8NwMVQ1ItT00hXOvmUQY9ASLv5QT35qkzTo9xYkHoNj2uOVBiU+BpHp8Wpt08m
         SKhqTuDcHQs2CVH7UOq112e+It8dRXIyj8c/JzABS8TozRif3qWo3VLWjlmtvPpKA3VO
         bxxMq8oureQSyGZiAUUJkD5H85oMjNQIgDpKrMikY4WrJj5nbkZyRInJdcdJxzMXXzH7
         AOUuDWaT15krw2v2o5Dh6ws1Cuw0MYvmYAXNBkZcUGGV3iLUsvjUYh1f7aBp0Fl3P5ih
         zA4g==
X-Gm-Message-State: AOJu0Yyg3D2FPuUar0wNh+I/vQ3kqRYyu1kE0BSRZi+BDX/YWJMszaUE
	V3MFiodaxOXrQj7HVCVn2zXo04dMmAc+Acz2IGOWNkVLPqQuCycuIcAYw4uIs++15ZLUhSNpVeS
	rIY4SAHemvl5NP62wmZCm/3xq4kderFT+nGO9Ro83K8J6ZqbQCfS5V2arHi1Lqr5hR/M7
X-Gm-Gg: Acq92OEYHeUx9Nr2OVO/WbQ09DyD91tNUTMbNq6CjUpgB9052ADbFCO0LdxtyLkJUAr
	SBEJPiQWAbxYvSWAdlglUz9FxiTe1BWdQ2XsP3d2J74odhUI+3I1hxYnZ8imtrS8mwjgkF9Ue1M
	a/GikstA0mbP/HEyV+umwTUX13/JX1LkAXY6rwXvDVTkoOzM8plsLzIfyFu5anpyRuc+WXg7bfo
	NThuaHkWb/nQ4/r+s9an/e0S0vudRX2Cw40OyguI/Or+nIHae9ryI7Nd2BxBSZoOiGREuVU9X7x
	DUwu/3X/65fiTNIDMdKyA2I3oufopenlzCL3cqOiHUhhpd9EPMJaTAfNx8Se19PAladomuI2SGR
	6hgkmnD2NtPeuE1y4KpQ/yHRMBtE6j5jMNCBAbRxbXf7uoQ==
X-Received: by 2002:ac8:5916:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516d419f0e0mr36225831cf.0.1779449591115;
        Fri, 22 May 2026 04:33:11 -0700 (PDT)
X-Received: by 2002:ac8:5916:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516d419f0e0mr36225491cf.0.1779449590594;
        Fri, 22 May 2026 04:33:10 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d5d0csm45618666b.43.2026.05.22.04.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:33:09 -0700 (PDT)
Message-ID: <7bfcdf7c-f114-4f4f-9ca7-6a0d31c856d5@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/msm/dp: Move link training to
 atomic_enable()
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNSBTYWx0ZWRfX0KQyMgN3fUYs
 bANJ1/fzLgrQ3phfqgCZShJDY20krLdNh7aQfWxRDlSCQsIc8IH8blaMUX0FDkUFwoxcgbpa27Q
 Q5dDBNcstLdKIDUBycZU59uVONHsIyje5sZsEmx5+PGM4rr/Z9HUo4byLhXHEonpmxGyylopi+6
 BaTuNNujqe/0SETD0oVNVNQuH6QIS47IHdNc6SAnUXHUluWJOR9E+PlDIC9VoFUZPmVzbDSTp0w
 VmzBnAYWTAlZRm5fx4bmi0vl+QWVtSGvcKfch0kaCS3u3GWNwZcYimgo9cadAC2E84DJUT29hyM
 yquA0A0PNQLJBiIbtwiqtlzpstvzYAgthd/zmUhp89n+r03HBAG8O/vDZquP+IaeLRMGp/nzdLJ
 g2CCgwLJHzqIYbsW/bJuYb49bN7/kGHGh08pu7BH97UyTn8sNpWF3d1UeNUdPyLh3/D9DjxhOWn
 bQgCOIUsi3PglVtuKwg==
X-Proofpoint-GUID: 35MSEzHbPwo00-DMPAPMoTVM68SM6uSt
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a103ef8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DFjhG9jlQqNoXxgc5tgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 35MSEzHbPwo00-DMPAPMoTVM68SM6uSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109277-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65CB95B330C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a05144de3b93..e7b1ed5491c4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc)
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);

So this will still crash the device if the above fails - there's some
return statements in this function, should we bail out if that happens?

Konrad

