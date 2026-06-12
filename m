Return-Path: <linux-arm-msm+bounces-112858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FhbHGuC0K2ozCQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7D677377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NFXSBxlQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hK8v0mbE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7110730177A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4299B82899;
	Fri, 12 Jun 2026 07:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B342BE051
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:27:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249246; cv=none; b=l6vmFf2lz5Ky0hF8jwP1txCrh22/CdXS/ex7rlt7dtvIVhtOlOR0qvOqhT5E8nOdzbrwXZ6RgFelupRfpa0aXMiqmStcs+5mRDd5NeaqBQMb6wl7+xQv1YskbEl9r79rbMyLYb6scy28Z0X5gNoodKoJ1LsxgwmeY4dkjMh7P/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249246; c=relaxed/simple;
	bh=QzPg96JUKcoV+G0GJYur1F5fpQ4F40I8Dl2VKqYRUvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pt3Jc8is92mnQ1KSMf1tbuvNze2WCNVvrTX8PzbzdMC8DwMbZlsrFk8EsliBbV+bHR/tA67uEKM8vh30Eula0Rq3lpDU6yJQbyjHvlrH6dAv3KvY6ID/KYJtnfv8+CTebSOgd0R6T6Sgvahhh4jjhLuK0wUQwclmCK/7l6pYlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFXSBxlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK8v0mbE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39RjP2502674
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I51ADhbIT21j/GY52vCSJ5Ih
	2eKhqau6635b3E1NSKM=; b=NFXSBxlQ1/5yZiO4SKHU11IOnCC+3iqBkbfpu1Gy
	pY8qgg++FF9AVr+Na1UqBdaCcJThMH1W3CudVzKXQIZCbcs9LAYFtpIWbbwzh4Dq
	Qaeu2JUYgkemkXPiFV6Cq/pDWWnPDT9psE8fNakgEK7yZ1uS6NWbaf1tPsYzJ/kG
	GUjAMVs6hiMMs2xvkXZ1OGFOHaGxZEAAK/E5+9xAmmwmgIW1Oltg590eyyEGirly
	Y7CftkV5vfusFH4m1E4XDCvJaW5rZosEMlFJ4JomdTM7eTvgj8zE7ND22pUTDf0H
	AeUHnAAdAqnsyryGgOXgo7b0Ez0uDmvOAqgzCAZh7AKp3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2njd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:27:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176cc5bf2aso8099141cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249242; x=1781854042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I51ADhbIT21j/GY52vCSJ5Ih2eKhqau6635b3E1NSKM=;
        b=hK8v0mbEunvaB1BX7fG2zxzHOObOI5P4EruRdn1lgDBeyfNMJsLCmtasm7jxgqBitr
         e4rZNdXdQAB0YuO1ErCHLT8TLnAfnvmvaNSGSMJLK/Vf8nteSi4aR2hK1W2cfiPhaGUN
         QMLDotbL8G5sIeF9kaFM/k23fac62b8EGZuDUUxg0iLSI2bSqKWvAD5UXndK1R0TPG1s
         0gBcTxBYTRw+DuQK0prVY5tKZtJ80xfbR2KkwUTOFFQAJrhTNX0N+KznDzKj1yyS1ms6
         GA4q70Pvjg2hXoe2v8CH7CVvQvMFlxKLL4o6scEB2EheXuK0BbsqhUb8zELZQp0vuPQH
         UmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249242; x=1781854042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I51ADhbIT21j/GY52vCSJ5Ih2eKhqau6635b3E1NSKM=;
        b=BaRSCtFLvCp7Wz0SI8jIQuvvZt4KR4MUvJKB4Vx2IFbiICgcyTINm4J6fNIjmcwt50
         BCMh0ycRG2Q4X07s5BZwEZsSllHbLNuMRVLczD/jer2/ravON8mZ/xa6qti8GHKn7VS5
         gzpRAWUV6LxAffwoXur8mid5f0b2t/sLV0PLUkD6WDfGhPJ/+v/RrnCwPc9u9lWgAFX4
         E8w8y3QBACRyo2vjzt5pTht+O5dOcsO8M7pkGEie1VXNtj53r1iQ82m1W/47GVlArdWn
         QYFy10loDI21mIRrkKtdxcWITajB8+ugEK8CLGsqJbcuT04tB6Q1abdXNMmuxRh4cSJh
         NYlg==
X-Forwarded-Encrypted: i=1; AFNElJ+r/eZzDPkwWbyLI7bNh4QNoPhXiO+EWCiyFc+1wI5t76nMZQARb0aHouYBxrMdCMT12YjxQUm9aH4BThUo@vger.kernel.org
X-Gm-Message-State: AOJu0YyuqYKpMDK9AzX9TyqWFpAhhojNgZbB51E8i0Hhe6gFtg2U0oid
	gklWOEQ69JTB6QJ1ohr0P8iwhZtvBfMNkrSNM4q8+fR2ahoJQMnTooIjCWHWYl89CKBZaIz/zm2
	vfdZKFPQo2RffepKe4w3JgcrbaurDZKMoak8GYzCf8lzrYK7zhv2qZ/yZ+vWMUUmfG2cy
X-Gm-Gg: Acq92OGAW7kEAjX4i3KK97wvfDHGubprjCCmBZTK2y8iMINfyT8qzHgtIy6YaBtI4Jw
	7fF4+S/AVDRdm1NT+CEZ2p8T1ee0mSssf0xH0WdnGLxPvuN/u7KdGCDC9/luF+cgUcHd/CkyYqq
	uLyTDVqJnmKbdw3sMDqymeLZH4026b16M5haKPQBozjKjTJHzQZmPX90hGXjdfl6UWbMFVbVxaX
	8mXOBp0F8aYtHNVsLkb79sMnyScZTLMBApmuYIu5SMU33s/Xtwil1xsvA6OWa0uVLkD07Syr0fQ
	QgXrV3mehlV4oJ9gd19pdZS34s/0HYBogU+9NikvihxVBMBd1J3KJPUhBQWqtHn2TF4UTFPb/at
	nDCWZmRKNDH52BAnEfawyCtrVYUOdgovTOzGI+oUerS9r2PHRAOlbkBKc++FWCHFgZ0OfWC2CEh
	m5CjzmFQXKzztHc3cuKft7EtaqVuCfa7csCq0=
X-Received: by 2002:a05:622a:5b0c:b0:517:7f42:76ed with SMTP id d75a77b69052e-517fe1ddb42mr18061441cf.12.1781249242613;
        Fri, 12 Jun 2026 00:27:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5b0c:b0:517:7f42:76ed with SMTP id d75a77b69052e-517fe1ddb42mr18060981cf.12.1781249242137;
        Fri, 12 Jun 2026 00:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7362sm295468e87.43.2026.06.12.00.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:27:20 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:27:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/mdp4: keep inherited display clocks enabled
 until modeset
Message-ID: <qkfhs5r53wmuolrddkywqqhqfokbzh3p6fxbmctuipz6fjl5ue@otwtwvisrjwj>
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-2-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-2-22925600e4f2@alex-min.fr>
X-Proofpoint-ORIG-GUID: tI6U7IJti3PwS-Pyge_GHHrKsT8lHLlA
X-Proofpoint-GUID: tI6U7IJti3PwS-Pyge_GHHrKsT8lHLlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfXwfo99F92SIdk
 9hN+5zTsCQZSqm5JA9lnbFmsiG7/rdRMCFkKBCXGPhEMPT5RVNvo1CyyTRclGL0Gzp4FDTUOH0+
 JM7131LEDc5yt3cF3eAo6+g8U/OMlR1xA+FVRiAHlxmIM7i0oOjK5J/i4qjq6aEHr4q/iFOPcwt
 cf7ZTUfEYV2cdS2GlFvLPK7lu1DEP5+r1W4La5GiQraTfauvZYctzos29giHDsQIsdWH56GPLrS
 Y7YcSQ9khs1FrbF5DRGo6BRMF1rz0uxEfUdsenkio5kg3nW7qslEQC8ZD3cGfwrMfKkNHHOdNfG
 3evDWkrs13NX7yHmmdZLk8l8f0o738O+tR0fAuVHlAVCBcfUoybn2I3rUTARfoFkvi1NXQGm3eq
 gnWMduEbXmYwOFDjKPCjrgc76ZWu0WzYzw/LSgzY6ofxYn5UYwnl9tIdGBuJsRWc46wbsBBJUWR
 xgcAd0Y1QOxICaSOofA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfXy+oX6st5ZhDC
 9BePcCPi9hqspYONI8INSSDCnJ84glQ6H/qDl6LEb9egbYH8UVnrUltHmHxDTI7vG1B5vEoRdzj
 HwG1oZGJ+WGa7vYRJAz6v7qJoUDYIzk=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bb4db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VM_FTtwWbEzbSf99l9kA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120065
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
	TAGGED_FROM(0.00)[bounces-112858-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,alex-min.fr:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,otwtwvisrjwj:mid];
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
X-Rspamd-Queue-Id: C3F7D677377

On Thu, Jun 11, 2026 at 08:07:47AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Some devices boot with the MDP4 display pipeline already enabled by
> firmware. On the Samsung Galaxy S4, disabling clocks used by that
> inherited pipeline before DRM takes over can leave the panel showing a
> blue screen.
> 
> Keep the required display clocks prepared when an inherited
> DSI/LCDC/DTV enable state is detected, and drop the extra clock
> references on the first DRM CRTC enable. At that point the driver owns
> the display pipeline.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  1 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 66 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  2 +
>  3 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index 9e53c9d956ca..0aeefd48be1f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -297,6 +297,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	mdp4_enable(mdp4_kms);
>  	mdp4_crtc_bus_get(mdp4_kms);
> +	mdp4_inherited_display_clocks_put(mdp4_kms);
>  
>  	/* Restore vblank irq handling after power is enabled */
>  	drm_crtc_vblank_on(crtc);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 4c60b49fb784..1264ce7e8459 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -151,6 +151,58 @@ void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
>  	mutex_unlock(&mdp4_kms->clock_lock);
>  }
>  
> +static bool mdp4_has_inherited_display_state(struct mdp4_kms *mdp4_kms)
> +{
> +	return mdp4_read(mdp4_kms, REG_MDP4_DSI_ENABLE) ||
> +	       mdp4_read(mdp4_kms, REG_MDP4_LCDC_ENABLE) ||
> +	       mdp4_read(mdp4_kms, REG_MDP4_DTV_ENABLE);
> +}
> +
> +/*
> + * If firmware left MDP4 scanout enabled, preserve the core/LUT clocks until
> + * the first DRM CRTC enable takes ownership of the display pipeline.
> + */
> +static void mdp4_inherited_display_clocks_get(struct mdp4_kms *mdp4_kms)
> +{
> +	bool inherited_display;
> +
> +	mutex_lock(&mdp4_kms->clock_lock);

Please use guard(mutex)(...);

> +
> +	clk_prepare_enable(mdp4_kms->clk);
> +	clk_prepare_enable(mdp4_kms->pclk);
> +	clk_prepare_enable(mdp4_kms->lut_clk);
> +	clk_prepare_enable(mdp4_kms->axi_clk);
> +
> @@ -594,7 +652,13 @@ static int mdp4_probe(struct platform_device *pdev)
>  	if (IS_ERR(mdp4_kms->lut_clk))
>  		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
>  
> -	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
> +	mdp4_inherited_display_clocks_get(mdp4_kms);
> +
> +	ret = msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
> +	if (ret)
> +		mdp4_inherited_display_clocks_put(mdp4_kms);
> +
> +	return ret;
>  }
>  
>  static void mdp4_remove(struct platform_device *pdev)

The clocks should also be put in the mdp4_remove() path.


-- 
With best wishes
Dmitry

