Return-Path: <linux-arm-msm+bounces-93562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIr0Mv9nm2nszAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:33:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA53170546
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB3AE3023346
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 20:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D8C35C1B1;
	Sun, 22 Feb 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv4u07dy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjiR8Nsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FF35BDBC
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 20:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771792347; cv=none; b=qlP1mz+HBlU8VrCm8pCP4t647cne+seMljVAb1h5J18KPB4usWHTs72zgINSTHtvpzl8MmnkFYkr91WvF3A29pXsj2nTsk8FD1bYYDw33Vovtd2YcpPcXttjhQ7cpFuPMzZy49FzdYcafFCzpeYQJ76d3Z4dz+BrQSqK7MkNxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771792347; c=relaxed/simple;
	bh=XYlGCGGhH3eKgr3IAicEEM5pEl3ZkvCadCkX1C7FEQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6+JYRS9uNyZffraz+JDgPmw1pb3hAYJFLmecJCIfI9kdYpl4WvHl26dJf+GBrGc9aNmNbMVw0vwJX0n8m0Z8Dx8OWQ+Uu3jZxsRW7AdTaNIT7Rsvn9BSREzN2UntUY1F+WJ6JGb+I3/rbKblevQUhTHvQ39kuVSZW8uMzsBEO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv4u07dy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjiR8Nsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJwWnq860078
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 20:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vixSB/xeTFdgfFUWBT+u0QL5
	zCV4kpNBkYe9LQ4nqNU=; b=Wv4u07dy2Ft1iw9haiqH4Loacfv3m9xl6lEex1LH
	8ogODMOHAhaVffWskCpTuJLT0OFymC/IaPIOdiQbq78joB46xUbgcREP+z0Goc8+
	Pl7VdGJOx6EQwePPV+xs3HiiAtIpNxlN9gLwxtbRJHiNgPtKgLL+3WEJSgo0fjwD
	iiXNszTvQ3wbhx/Q46pvT1C3Fo718qdkqTYASBq+VXH0cB8VDMFYZPMQNjMgETFY
	bdAzhIwL3mXiSUT7B4zkyv8GoOHJ6fEfC5VLYE3a6RXm0rNU2r4ReRdQt9akuPZQ
	0R8GJ3TCArqUaB4ALVeolqfJRpWYT0cefHgtCSo/zqqvVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603jpq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 20:32:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so4999469785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 12:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771792344; x=1772397144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vixSB/xeTFdgfFUWBT+u0QL5zCV4kpNBkYe9LQ4nqNU=;
        b=LjiR8Nsls6F8GvzBtWoPo1m3B90RcRgEAneuS1gSMs5LgstkiBltQvi+K0xtD3VoC5
         bTo+dGa/L1Mif4+UhZR8Ws3KIqK+WBAv6whqS1pFVBdIwzqyL12xlgckQTn5h3b1SIEm
         UUGLIZteQCNy4qKEvkW+1CURLbj/7W1QSSpkBIdA4DixExKrx7CL8dlmdSDQaJM/TMux
         ABSytyRnvIRUvbPuUycu1CclcqEyT+pu7tb/7Rtabd0deu7LvyMiIKz1G1E7kSZQkBwB
         L/zE/dV2aP5gcZ2tRzQJ4ewu7ANGcFJn5WqYCzXoHuJxvAe2LH1SLESwRkgtkxhXauhO
         W3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771792344; x=1772397144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vixSB/xeTFdgfFUWBT+u0QL5zCV4kpNBkYe9LQ4nqNU=;
        b=P8xAKeJuatrXWRM5zDDh5t0sojJkLkSJrIkkcNl4CnnekIzj3fekHAt0dNSkIisoQp
         JFanUDZYPl/ynCvHNqfY5Jpg3xWZg7EOQKJYDwS5sfagego+SJbgpBEWJ07NRmRA9bdp
         9/Sj+kVIPqyOgNIqw1+Otk0YuXj3NYigJ9z02EgtAeV5M+jeWUJiFWAC1xzOjIbDR62A
         ITo+fAaFNDnqMcbyKj69AHK22+8q/cqYrlZqKI4tHUx+hWRq37Op6UbAtuXNBZ1F9aL+
         sYL/J0dsUaRxRczrHm8MG3k53K4EJ0kp0HAq2e4r3mymOcsTUOqpKqVxkGOKzovqIE2q
         1h4w==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ib6t1zpewNyrhna798xYOMhW/mqxTEzjymeT3GpaWGsOTD9ggP7h/SAmoIw6O47MekMP0FaP007mndnX@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5kpL2/nIhk7CkthsyXDXy+H7JYC8mO6V9U7ZYCQiQ8I+SLSx
	xs15/myC2dgfxHrBGPxxL7yucKV48vircbtKu4Z/9dCjPIQLlnPCENMgGMJKf6njeue4wB0qfnx
	uvMTHH4lMRDgGCCHx/Aa7qPvN+NiIEzvdVLsC/erNB8jaD2LuRYqex/Lv/1gQWhqb9cVh
X-Gm-Gg: AZuq6aJZBexjQ4fnxwI2gBzhaZx2tFGv4ruSzg1uozqe7D7yBSj8gkBhD7ZDlIuWx1M
	KKYrIG3etcWC7ePBvpt+7/KSmMPMbU+5VL28G0P9LbkK2mcG1KdnnC/lKCuSNRFwPiMsxOtZ50M
	WOlOQUJD4su9ABwZPNt+h/5e4mPmnN4jkCA9FfxWEmTRxuVFt2winaQyLQ4hsJJpiKTW7PldbX5
	X0KfUfN5PZgJYJ2GSfwFHC9+lvwahgqr8MJ9Mn79E6+XahhpKOltn9kHEpmszOrxwHPL8YSRlCd
	ONs5Z8Jt0uUoQiGjsJ7NGTYtCDgqyMVfwd67CqFx++6GTpU+ZlgE68GVhkxmJI3e8XJSLNCtjZj
	bNeI1AaQqHoGbjejhYJt5ewZEuIX+SroXNH33NQoZFfot8+L9DgCZUHUsXsqut3ZEDY2c8qT7Yg
	bqdkuOum1dabXwVTJVuMvt1TLbYh4e6c4v+KE=
X-Received: by 2002:a05:620a:1a8e:b0:8c7:109d:e9b3 with SMTP id af79cd13be357-8cb8c66aa2cmr760472585a.37.1771792343705;
        Sun, 22 Feb 2026 12:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a8e:b0:8c7:109d:e9b3 with SMTP id af79cd13be357-8cb8c66aa2cmr760470485a.37.1771792343240;
        Sun, 22 Feb 2026 12:32:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c60bsm1154322e87.84.2026.02.22.12.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 12:32:22 -0800 (PST)
Date: Sun, 22 Feb 2026 22:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699b67d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VCWYR0DOrcW2_Bky3Y0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE5NyBTYWx0ZWRfX5wxrj9pErDso
 03GlubgFPq8ZFbsu2nkjqxvZTLljxOsoeysmx/N+JZUh0csOZrKhFelHOi6iS5uWVJTnbFTySui
 AhbcClpzM+t8kAHYde5lw2kZp9C4317BwAOpNIG4oE/SNTY45UtP4JB5RWnUpWdiU6ohMw7uPTk
 tEvKcacpek65QTvAuzd3LwnV8sL5cixhzmIMYR04mLhVo1dIbICWb+AoVETlbPVIx4i6cGsROJc
 vs9DXkkeZhzNX2oPaKvhXFDWqNljz4lhKY05SemBlsWiOuAuD0V4VXWkqUyCs66TqcmL3Aa4QLh
 UTii9lAtLL52heQtK0YDc1h7qVpmEim1INNe6rgoXa54ljpp/NDGwgHVNUSeT7iASwXLeHkVDHd
 MBa/bOvXm8uw8X/jXiwOQboso5xosap6AF+iTDQqJKuFFQ1JfvwFsgo+Jjmr7d9ZsYYwn/WDjoo
 zF6ZA6aBq/fz8IJXhaA==
X-Proofpoint-ORIG-GUID: txIpYYMSgnOowIyz9ktf_CdvU3bMzu9-
X-Proofpoint-GUID: txIpYYMSgnOowIyz9ktf_CdvU3bMzu9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602220197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93562-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DA53170546
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> On targets with multiple display subsystems, such as SA8775P, the GPU
> binds to the first display subsystem that probes. This implicit binding
> prevents subsequent display subsystems from probing successfully,
> breaking multi-display support.
> 
> Enable separate_gpu_kms by default to decouple GPU and display subsystem
> probing. This allows each display subsystem to initialize independently,
> ensuring that all display subsystems are probed.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Depends on:
> 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/

What exactly depends on this patchset?

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ed2a61c66ac9..65119fb3dfa2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -54,7 +54,7 @@ static bool modeset = true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>  module_param(modeset, bool, 0600);
>  
> -static bool separate_gpu_kms;
> +static bool separate_gpu_kms = true;
>  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
>  module_param(separate_gpu_kms, bool, 0400);

The patch LGTM, but I'd prefer to get confirmation from Rob.

BTW: have you tested it with X11? Are you still getting accelerated GPU?

-- 
With best wishes
Dmitry

