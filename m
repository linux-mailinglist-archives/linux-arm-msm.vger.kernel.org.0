Return-Path: <linux-arm-msm+bounces-111501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yDmaKOoRJGp22gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:26:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252F64D66A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cV9Ov04g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f8CwQ0wd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111501-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111501-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 363A73015448
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECFF3A5448;
	Sat,  6 Jun 2026 12:26:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED98B37B415
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748766; cv=none; b=tOWynkfJ2RAIKRZ/GDIpxl0b+Hpx7ui+ABi4WjEqyrr6XWhaESuBaDkklA0kRb8kvhLp1yqr2GLh2Cu76hRiwydTdkiinXMG6Je0LS49mfxMM/+xRRxOOjQnc100QFEEFbpnMB51dxZutqFNpXotsy6LnJlOqMrrOIO/lzwDTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748766; c=relaxed/simple;
	bh=Qi9IwdFd4KmTUC9AKW1rwlMFjUPjck9AgYDQ+lwdIME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oonWNkYS5DJf3lKQYOnPY4lBBnvP6ize2Dzc0zCahZkqsyYiod4Fj5cnnQNGgg5ob7nfb4wXKXjFosQw/5vhhW/oxQFzmp/3ykKCCZgvm/ZAu4pwIMjQR7oV5PygNmEoHJVqeJA9fpnDOIbMW58HVSolixnIHm0OcUh8YByoxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV9Ov04g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8CwQ0wd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGeaL1311047
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=54X7KQzUXeCLylQBD9l9cQGo
	OcAgzYsMhQbZ3OncteQ=; b=cV9Ov04gn6P2U6PWOAUNiZB5Ssvky7hbJgnv0sXK
	5+1gu72UVri2PoAOkE3mIjwZJjw/fykHar670cgaA0+7jewByTevNxk/2D7c7Tlt
	9YBQYBjf+SMVWq87Br5ihPgs9fSfMzKteulA5GW/bsvrvBKRVKlmtR96vraknz5M
	fygkEmO+ydvCqv3QOj0GW1cn+NWoFuwfnKBSBR7Ho4LfXFodOb9RaOAfOzi8xjeo
	AVentumm9RGLKuXHLg1ajCB9zvwuneB8nvY0UCDHZOhLxDk1PRnxJEVmKyiE5RuY
	rmPtRd5Zoyaz/EnEGrBF0LN1MnxLLManAEwWXniluPMy0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w1692-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:26:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59f18de8482so4137709e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748762; x=1781353562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=54X7KQzUXeCLylQBD9l9cQGoOcAgzYsMhQbZ3OncteQ=;
        b=f8CwQ0wdkB6f//dPYpeXHn/73rtxAp03kee9K/vCez3dQqgO6WhQd8hET7iXa3hELa
         gdQQzV2TEWysGrib5DHmB7F1Uq3WDzdvXrB3CWlBcShMfjm0cQXcLo/HZyNpVBL3FmWZ
         VToOZIyzNeaS6P/T8ZUHU3ekXcmbsuFUdMmGk2O7tVQ2a2wgPk6xNN5ND0ocdRmuKyeM
         9R2g2rV+wlIMi3MJqWbseMFo6vSE48UQuiJT641D41AIR4NRhMepzcLoTgIP2FMxXWbR
         lHFoWBGi/Ph3zSyfClaLPW+jc5CIHtPJWXmYgUsR++8vgZd1CWtU2XAzB9s3DcO/shzD
         JUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748762; x=1781353562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54X7KQzUXeCLylQBD9l9cQGoOcAgzYsMhQbZ3OncteQ=;
        b=k5knhEsQrI4L7g38g+hyV/eg1s9nnAlNTDGqhMgb/0O1XLV/l2fQkzhiDWDDTE/zR9
         dcYLshZSEW8v5qNG9PW3K8DxQuRzPABsjjIDgOrRGT14pXUj9XWa/BWoWjfAFwjs3PqK
         Tkhld1ApCmcvi98eLTmWqbqL45+98g7+fZVv7cs+gY6tR1SyXMb5W+kJfyzCAe1XBV6A
         55oXdK4UDW8FCb1HLO193EKa53mzBLqboY/QddoG4AUz8tznCkUQsyUGTLTvriwD3GTE
         ODqCukjfG5Vqk66S3kmFPY2aoiwJ1gsbywsN4pzR3AqYIcvNw8Ad8mfec1TXj2iQDwa9
         W7lA==
X-Forwarded-Encrypted: i=1; AFNElJ+AFxjLzgGdk7bW3ICD2IvTul1c6jMMJ/G3snPGrSvVPGTzb16/0onhWvxrXJ067Dxm91jWUHVdLPEQ+t3N@vger.kernel.org
X-Gm-Message-State: AOJu0YwevljpWuzjdzb9KTClF7XqTBv2C+DkmKJKFnmMGJtPbLxfAn/Y
	iTVWyk95ykNS6OkZtFDzCkT9PNM6ovyo0VV1MKfb20Gs7xiNExYdpuIvnG1S0bjLfblmYkL8ZZ4
	g+i/9BFwNhVpMp4kzRscs78aaooXDyBgmh3PKIJ1cVUQ6ply8Q7jePx0ChdLOdsMuaG5s
X-Gm-Gg: Acq92OHHqquzW9dF+marj0RU+TSpWaoaOH2yvPOLa537kqNcfn+1SMg7Mllhve4uATB
	hN3qYMCmYokCFSXQSRvaE6u1W266rrkR5FVQQGqKIZRNEmvT7BRNzt5ph611pH8EJjSRo5qWXcm
	1Kiqf1ArjMgtzh9LDjLW0xWT0aokE8BeZGvjOhfDefeyDPwHtez2yFFCj1eCVlZShelszCAsjD2
	meDl5Y5wPxhG/K9o0slnbZyexL0u6nEgk+KeaHJ8yr4hYbBmO5MZvTT+ure3Qo1ZvoQC4iDNnwp
	acY23g/Hv20UJDO2/Rg2d/K70qi/YAAIfjsyyd2CMIAZOIua/lsuI7SXXw4R+xnTl7/K3alMeoU
	cCgGToZCc2H6PObuYU5+ZzwYRcJAfFFz7tLcwXPQLBkOm6eKsowrj1VCX1lvVf0XUB8C06OEjYm
	SIP/0bnsmVX24dF1MlRiPzdSXvlPaM0vZXtNlK7fLDDTL1Fg==
X-Received: by 2002:a05:6102:6886:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6fef853029dmr4573031137.18.1780748761991;
        Sat, 06 Jun 2026 05:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6fef853029dmr4573016137.18.1780748761641;
        Sat, 06 Jun 2026 05:26:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm31142401fa.0.2026.06.06.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:25:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:25:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Introduce poll_hpd_irq callback for MST
 sideband handling
Message-ID: <rikmu6glk2ehh64rdt2csucjyn4d2asv44gpsbrkz76b3ct5ro@u6ioy5ah2tod>
References: <20260606-mst_irq-v1-1-98bd86445c03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606-mst_irq-v1-1-98bd86445c03@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sOQnbdgUlU6t8A66M4hCRn22ZFyAawwZ
X-Proofpoint-GUID: sOQnbdgUlU6t8A66M4hCRn22ZFyAawwZ
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a2411da cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xNi0aPyhXB9LEuxe7ewA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNCBTYWx0ZWRfX8+qcB3NhwpAr
 YCYvsgiYRVFSe5FQFIhfGmynlvgfq1Yvhk7WqpQTzSxj6hOXGOENQXex9uRg7GNbs1BdE4Ifsce
 L1u2SxMhCHyox9DieBjbbzm/D5vw2GxrmM3rvYASaMqVd98IpP/xF2/4TNN+9A3o5v/0s2coxDj
 1Dt9Eh+spALV1smC0XdZCKuAD13ZL6MDcnRbrN6HY06FemmNVh1PiaOo+WxGYEvogHpBN0Qsl1u
 uwUI2jnzL0RzL5TUVT6B0V3/mH2z3S8NaeXSwMpKqCmXSK8++qqcSVwPulue0eeZ8+t6DHwK8vF
 OnpTHJeelAWAzIzyYcrreiPqGwpXoXybKPvea5SywALGQozZ3XY9GdO6Arr26WuEMEe6fXchQ4c
 PTOFFdXjnnSCjToaokV1Lv/kZi4QgEy1S/+SqfOyfBD8bea4y8yZu4Bif5gYecX7y4sKictvTAW
 Fv7At/mZmsZls4xFnAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111501-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u6ioy5ah2tod:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2252F64D66A

On Sat, Jun 06, 2026 at 08:05:29PM +0800, Yongxing Mou wrote:
> On RB8 hardware, after drm_dp_add_payload_part2() completes, the
> downstream MST dongle has a high probability of silently dropping the
> short-pulse IRQ at specific timing windows.

So, who does what? Is it RB8 missing the IRQ_HPD or is it a dongle not
sending the IRQ_HPD event? Why is it being missed?

> 
> Implement the .poll_hpd_irq topology callback so that the DRM MST core can
> proactively poll for unhandled sideband events whenever it suspects a
> missed IRQ.
> 
> Note: The new MST series will integrate this change into the introduce MST
> IRQ patch

This should not be a part of the commit message. And also the patch
should be a part of the MST series.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index c8623849c001..8cc44dcc37cd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -60,6 +60,8 @@ struct msm_dp_mst {
>  	u32 max_streams;
>  	/* Protects MST bridge enable/disable handling. */
>  	struct mutex mst_lock;
> +	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
> +	struct mutex hpd_irq_lock;
>  };
>  
>  static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> @@ -500,10 +502,12 @@ void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
>  	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
>  	bool handled;
>  
> +	mutex_lock(&mst->hpd_irq_lock);

guard(mutex)(&mst->hpd_irq_lock);

> +

-- 
With best wishes
Dmitry

