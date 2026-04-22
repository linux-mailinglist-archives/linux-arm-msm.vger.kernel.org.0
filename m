Return-Path: <linux-arm-msm+bounces-103992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF/UILcS6GnVEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4B440D20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E361300B8D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA87B139D;
	Wed, 22 Apr 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7PwNQs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLRDWquV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE11946A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776816816; cv=none; b=jsFYy8HSqMgrI4a6KrmNj7wyBYrja+rr8mi+Bc84dG530oVPF8N/CFdPjsSM+hZ/cckgkPB2ctLkfcghPurMUxtH9iBRrWidBufeUD4ZPz7UZkpSd8Ilk9OmaB4RVUp6ahK8p5Z3lXczg3jb180OaFe+zUZZNLsREKZB4I0ivWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776816816; c=relaxed/simple;
	bh=eoPEMrX0Q9mHucAtYOx+nlxjkGNeJlQzBiuSBXqO4Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jh0NbCB4cvahTN+HW+gJNVKLFnW1uCE4lMwUyVPvx499S4v6Vq4hkeNl138Ciys5vWe6riewEDzHZLnF8gBpGsHV6F+Os3r1lHhr6Bq7uPFwOnRBesxj6X8n54FFMeXwqVAmox3IB55EsT2J8eJZpH+WfYasbizVuwTeqhkZX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7PwNQs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLRDWquV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZgLX2000621
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gFxqEuiUW8mX9TjUpbfMX8nx
	BQmwupZNk5aNTkZ9aRg=; b=O7PwNQs/j3HYKQUOTigogulIGxxc638z4aUQEWGQ
	/YoGRBu7LdICp619Tu5UL9ljkM9r6kE6gkHtu5amc/fMEX+YoGGcgrP+vkiOUQbm
	YsvS6YBkgugCjj5OYz8p2WrQP6wdeNT6UOO7pAX8YFVdnIcmAmMaw5Rsw/17HRv5
	eXMs1x9zL6Kea+7VqyYeQkzuH8S1pl/cGQuchN9Oi3BwJn12DLDsREYnemW2BiTf
	0Sq28IgWPd+eXmKd/O+F9K5SPlR5RSiZb4uiZKAjp2NStGvpwvV8FZDWFuAEbxC2
	Lx3F14GZ81ILHvqbYVR2wU39aNameut5CCP8TciwNJweYQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenf8w6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:13:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-612ef4e6c54so8665935137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776816814; x=1777421614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFxqEuiUW8mX9TjUpbfMX8nxBQmwupZNk5aNTkZ9aRg=;
        b=XLRDWquVLozQKt2hwMxNeqgqDsC/i4VwPpTT6YUS0U2ReRWyCOunWCYJD1pZgqvOuB
         zvUPxRFsvzzu6IwmL+pEy3XEkapq75Ym/OGRK9P8eOR/5i0RaSVuoPrPJdHugkdcLVA5
         ur4Qriwsxykoap3GgGroliEOO+isWSsxAxRHBIlrugO7YQ9eOjcGnl9myDqxf5I7Xn6S
         +bv+b8CTeweVZn6eTA5BR8gYoGANJV57eFjF0EpuE76XvIFS3mLM7KmTEGX6vVHWl+E3
         lGbHA9b86sGrBfj2txoNizKJ/8wGD3l3+qMzXJwq1FUQWxZWx0CYQ4tcvo5WkU8NbD1j
         lcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776816814; x=1777421614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFxqEuiUW8mX9TjUpbfMX8nxBQmwupZNk5aNTkZ9aRg=;
        b=U/SDfnyK3iO6QqaUknMtooO1k/BHamK7bU++IEubYj3f3IPTVm+PV0hQfpE28fv9kJ
         uM3TQgJjx1IxfLLBXq+2d30U0vA6Y3fJjM4n8ZMUQ+vPkxuC04BQjGdY9btqsWhXNG0B
         1Pm1m4oNBHpEBa0VLCvDKGuTXkFuRUZT63ZJOlbXoGnje3ZOi5PSJRnQGizxlmlJSqhb
         i+yQxG0Q6erC/+gsdo+evCkJ2PcDdvjuTUOMSM3uAjac7pzPPSSSN/phOk/ptFOQ6ABW
         qOLkUiNjvWbYUWoQR62A7Iy3X64OB2+tjteXVRycnZNN3WaKYv9E1FZF932L90TqFYAV
         EDqw==
X-Forwarded-Encrypted: i=1; AFNElJ/kECZHPLa+ooglf4dC7ECa2jweXuIRHzMNMN3krHlwXMpaFwy/6dEE+cjPcyTaW5QzYEB61ugWK5yUfnHQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4YQzyicstr5wIL9ny79O++0PrP/pAkR4PFs+jeiVKPtKEP1g
	1gYSOtGMhQN0L3dhpcNiB3VUzqiS1aBNq8H97LLGDNLewKfw+Ya0j8ok3aqx/OfrrJ/Jt0Klvvx
	hmACLHthyYi888H3JR9/yF5JZdtjVZUt6aidkfH91cPQuICJnBvl+wUskjSoSYYUzxUnj
X-Gm-Gg: AeBDieubviezTDEbkNEUKvPuZ9nb/A3sGjeUA8k+b8vgmMRwo3GNdvLnBB7nCNjCAKe
	BHKN/AuotJ+dnlKDo68GFPGudCZTrNyCK9x6/C/80hHnSHK1nR7PLx7iRhJW8U1PSLHneQ8oiag
	LcGzyGbD+bizzPlpnagAT+q/3xpO1Fa7hZQ53ZicZrmZLiHt+YJaB5QDZZZk1P95hcVd+fL/UUh
	nfNL8KhGo59TnWDjc+kdqN0XWsRuPZsxV38xX5Z1hN/KR73bdmHPbyOyRXaUEaOLNeIZDy5J1il
	8mZ8qqt6gi/l8jXgKI8o2Kda3+Gh9O+Dw0shrABZfvMbIPvMleMLZsuLad7qPdONY4P20P6oyeN
	cbF9cGQQCOgVHSM12jgPaCPhbD2ughp/2FOBoO79kfBjPkeoakwWCTt359kX+5UYKvN8ztaZQQO
	QnVB1uJ1KJQ0sVX49XK6k+YJ+V02HEeTMepOjdmKbpZaiiGw==
X-Received: by 2002:a05:6102:f8b:b0:607:b901:5d74 with SMTP id ada2fe7eead31-616f4d7d122mr11002519137.9.1776816814075;
        Tue, 21 Apr 2026 17:13:34 -0700 (PDT)
X-Received: by 2002:a05:6102:f8b:b0:607:b901:5d74 with SMTP id ada2fe7eead31-616f4d7d122mr11002509137.9.1776816813715;
        Tue, 21 Apr 2026 17:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f68edsm31547371fa.16.2026.04.21.17.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:13:31 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:13:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/msm: Make msm_framebuffer_init() an internal
 interface again
Message-ID: <q6fhnbd2trwlkquzx5hnvtladveusuy4shzbcccemaegynjbc5@jr4eagrod2nd>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-7-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: Zz_JxeUOTHglc1Lgr-bHKvcWtGGFfxT9
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e812af cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=CE9xpL8bT2USc2ompkMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwMCBTYWx0ZWRfX8FYV5+yMD9lW
 PfyvUUCcIXy6xJQJqFxn6aZSnADgJwp8O1ZW26I24m7OX0D2psURLcgVHl/ix585UdtwTLLGD3s
 mtjrw8A8Vea6dILQoPwb1UPSBzdqa0EBoovURRvZtRvfsE5prktrv6imnLISg8StejqfS2rc6NN
 OShR1ts8Bn5ZvmeJNIkhaL13HREQmJ6oRi7fylG+Y4cr6vzW6BnxdXXbv/VGP+fHiIKiEjWC+eG
 GGxHF/DA7mbHQIxHxtMxUaaVlTIW3hSzN4ZdOM9tfwVQSpj50kzJ1fU50a4YEma+ZuThFcZz8V0
 qfm52NN92WJscn2PtLNXsWf7NLcQ6e4EmUhTKirV5+gCCy5C4AL3RNrfbxE59l0sBz/t5HjmEoS
 Czc+yYtcOvB1Muwqbl56nl3XNS+5fZQPGjXM/U3XD4G6WUc97NtUhHo3PZ657MVAEsOnNaqEoTo
 dCYUrKmNQSgXQbP0s5Q==
X-Proofpoint-GUID: Zz_JxeUOTHglc1Lgr-bHKvcWtGGFfxT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103992-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,suse.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82D4B440D20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:19PM +0200, Thomas Zimmermann wrote:
> The only caller of msm_framebuffer_init() is msm_framebuffer_create()
> from the same source file. Declare the former as static.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 4 ----
>  drivers/gpu/drm/msm/msm_fb.c  | 8 ++++----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

