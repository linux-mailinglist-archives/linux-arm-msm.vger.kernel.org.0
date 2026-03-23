Return-Path: <linux-arm-msm+bounces-99411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aObGEsCywWkYUwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:38:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD42FDD5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61B8A3013FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9A037CD59;
	Mon, 23 Mar 2026 21:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrFNjCMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNbgsqbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F7637F006
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301794; cv=none; b=Nju29rBETXcXOScGd2kDj5N73eFJBjlySNQ1JcWrg6yDMAMdNUroJ29v9qwGzI7IftfvwnC0UsrElgXfQPE7/Ih5wvvgRzkE+8xh2hd4wwBjMyDWZQkXodt6tdkKfttt7Ek4o1SV+yznoyQPTiSjFuITDBorFF4bvUd6PBIX/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301794; c=relaxed/simple;
	bh=EC22RisbDqPHDSMewfzx/dAOsWImiMQWJcV7mdzVVyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo2eSA5rzryygDq/ICOGxytREQ2vUeVx8jzwa442lGbsGNm4ggQuZv4Yp3XHxopnPuRXW+kmrO3CE/yEJ07WMGmBC6AzS0xDnBBcU7JE2Yf7osLLf8eRM4R4c2GueFmkC0ISpKon4pNcg1lRBxW1nbmzOzKhYDWO91uF2rBfL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrFNjCMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNbgsqbo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqwYq2972577
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bH91rnHhml+24JA2sTCrFNBn
	4S5/j59oXFJDm6t9eEU=; b=KrFNjCMW84X/A/rpvVLDVFYOUkprYc46K433EJOy
	00GoXVHLcpmZ4FEfAieTpL3dZK4s/wgVdC5ta2JCcQKix7p7s6PViifJ0jmOCrhy
	wQDGUzDIkqZCx01RY8jul2iqPypjp9BX/sZBXFxYljw7ekFx2DrrlIiX0SYPwMCV
	6so4mUzKW9mhkVH+sEKbtKEAcOvt9KczUh78UHdDCfoQaFREGRsWZn15zWFKW1ch
	e+lcgz+aUWtPdP4olkTmYATX0CXH9QOgJHEojf9YjhAoh/lk+CFeiLBrUTF2iZTa
	/8huyrQYU4xebz7K3QwRFN4TLat76ACH0AERNl9yoJid/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc2tu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:36:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso103535001cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774301792; x=1774906592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bH91rnHhml+24JA2sTCrFNBn4S5/j59oXFJDm6t9eEU=;
        b=PNbgsqbokIwpWCwObGiymAEwXrrX6qdkVS7Mbu26lrFZLyRTOn0q8rcSBtrCrBsQoS
         OFDaBKszcVMLPeNzV4g/gjuoTUD2A/3vxTw1h44FLH0V+1gBLUtfANU9VV1J5dPCpfuE
         JAYH/PFNqWm0wclsAA3Tg1S6H4i8mJa2biWLcaKoAWx/kfG0tlCIr2pmYEh/ZAV/vdkT
         MfqoKtr4xAoI36laKOS0vIJcPEAinfTqap2yhHbX+HeJ/OgNQK6PIVTe7CjoU620hV/j
         VDEwiMq6K2dWlYPrusZFM/LYYCy7yPjwnv2hXBk2o1qEo8alIxlRHaFn8PU+GdA3rc+3
         nMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301792; x=1774906592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH91rnHhml+24JA2sTCrFNBn4S5/j59oXFJDm6t9eEU=;
        b=TMPFpjzIU2Yzc1y47ZzmJawrmB5i9B2rq3O8mb5BrPWpmi7Ua2a/Kqg4GmjNA7zL9V
         wUPn48lghDa1htvgD9UnKOA8Fsibyece5tAwdkhBZr503baX+tNftEhWf2t8aqyd+PJ+
         JMdwNJGH5wgwEm5cAyuAhCvAQJtA+GXoz3xbWcfZ78VJyQ2W3xQA2oGfKiOhdqmI8Rr7
         0WClJmPUSC98NvFUTHLFpGBDFwvyq/ddcjpeHGP6gh4FZBCiRMsOP8NLpwnX7YSgHboa
         0DjVHwxYJDIN+sCXq8s5j3TtVKiJj0u44N2025iJwVIi8Uxx76sz2IC2pYjKwyXmPmGA
         7TpA==
X-Forwarded-Encrypted: i=1; AJvYcCXVI8J5zQKHZzGDFXZdrI06aK8QUN6ZMbeikEbMQUjUC7sPD+3TQNtu4y6Cje2UylEvBADWQU+1rdpEFVcY@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRZ2St5avUMLNPA8MstD3V6Jcex50KDDFbQQs50l8MkGLzeHN
	q2keXi/w9ZJPzeLdLj5fYDtJPFhVLB2rFb+vMN3+lWHmWq7u2j2Pb12lxoTywB/fCizY9TgdlcQ
	UL2XvBPU4iqayAJTI8OjDJ6frBoa9JNdh+0SYaPBl9IfVxjFhGy39m8kwMg9VjItYTWld
X-Gm-Gg: ATEYQzyL2f96gi449At6ZznI7ON4K6xCx24WpclvK2FvlLQDC+GUv1s9GXM4lrPL7ga
	7BN9SbAkdg0eUmaFz/dDIC101rrTx6R55TRry/NMlaqn3mOPdCqbIjqnDbgzNI4FNWO9cmdOCF+
	286rAxQm+YLeqfgaU+a1zpZv/Tmv1EgY4BRitUm3OuePb4RhSP15M0TmY/sxTIJefzYGR6lofxC
	IJIXy6OppUtBPZVvL1Q9bbsL2rIwNL/w2SdQPsSCMFsvW8pSFwarsj0VW5l92Ty0uumcQJmnkYl
	8OncD7xjeqHIni0WEvMANWzk9/5hr5xUB4p5WcAsiTqDfa0OZqRkW0UDUbco8d3bpCINPDoewY4
	pFA7a/CX6ri20PCUBM34q3xpwOUaMGGMIZS7O+emqhz9StA1uNvzto23+roKx00TuA+i/FfY=
X-Received: by 2002:a05:622a:1f97:b0:509:4198:5474 with SMTP id d75a77b69052e-50b373c2322mr215964721cf.2.1774301792081;
        Mon, 23 Mar 2026 14:36:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:509:4198:5474 with SMTP id d75a77b69052e-50b373c2322mr215964361cf.2.1774301791642;
        Mon, 23 Mar 2026 14:36:31 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa3575sm30587691fa.30.2026.03.23.14.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:36:29 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:36:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/16] drm/msm/adreno: Expose a PARAM to check AQE support
Message-ID: <4cj3yheakuxh75hf4r33ukokswa7fbr4cetezrj7mujb5mcxjl@fqoek3yfi6ep>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1b261 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fNwUJo4UZAcYs_Yiko4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: V2QZDKIt4w7gDxifR9hKB581kM6AplqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MCBTYWx0ZWRfX6wctykryPKC+
 e+j2o+ICtB7fX3i0+SbwiR/5c9tLWxmd8eMG3t/lEiXvaMfXIDjL6ufUxaYhSNau2njotiC/rs9
 gMSQFYqYbUZ1VE54sQFWCNRpgiuHozDeT5Aw6O3S7YkoPItg4Krr9dmwmlmcbXDEq/yMiELd9OG
 hrENw3phF3S4cM0ru8CgVcrNaWbYcd68QM1ZFniuq7ystCdJ9IUYbczBx2E0w/IUgbN3PrxI8za
 fUC8rZSjUodnx6NWf8qafogiQljZ8gxY1qPfGDJKQuFt0N67DO+lEymYnHrw2D+lhFxEWAQRaJP
 fpDPmCISn4GtqxU7Yr98qYr3Fu/vQgW8ayvLAmG6k76cfFYXaQLFBXmy4bTTGBmbFyCvPo34WVo
 DnQJ6uofFto4XIfQ1LjA8rJ2fct1YiMNQ415BbpSR/xgjAh0im8rrenMvakbCQ18UfjZhZiMQ0W
 FDtksqkxJ/IhfBSv+KQ==
X-Proofpoint-ORIG-GUID: V2QZDKIt4w7gDxifR9hKB581kM6AplqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99411-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51BD42FDD5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:42:28AM +0530, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is required to support VK ray-pipeline. Two
> conditions should be met to use this HW:
>   1. AQE firmware should be loaded and programmed
>   2. Preemption support
> 
> Expose a new MSM_PARAM to allow userspace to query its support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 13 +++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  include/uapi/drm/msm_drm.h              |  1 +
>  4 files changed, 19 insertions(+)
> 
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 5c67294edc95..b99098792371 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -117,6 +117,7 @@ struct drm_msm_timespec {
>   * ioctl will throw -EPIPE.
>   */
>  #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
> +#define MSM_PARAM_AQE	     0x17  /* RO */
>  
>  /* For backwards compat.  The original support for preemption was based on
>   * a single ring per priority level so # of priority levels equals the #
> 

I think this also requires a version bump in msm_drv.c


-- 
With best wishes
Dmitry

