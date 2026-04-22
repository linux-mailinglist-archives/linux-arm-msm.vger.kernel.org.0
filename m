Return-Path: <linux-arm-msm+bounces-103993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB4pAd0S6GnVEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:14:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02A440D2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB7753020838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB5EF4F1;
	Wed, 22 Apr 2026 00:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iV1SKUUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtpIvbg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FF5139D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776816858; cv=none; b=tObC/Y2rBHWss/xVvfdvgXNIVqJCThHvENXARG0DBaBYWwvHXu4ALC/mlqQDlEWdtxXuZQdMLldjOgMZrhfQiAEpEO6znHNrDMCk/eFKDuLGd+gzEiHMyWqfpIHkPcKLUswLLtpZb85xHiyo0fLXhDleuahxV8NKa95OHaq3EyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776816858; c=relaxed/simple;
	bh=HnoS1Eewbyn//Nyyopi0kl2Vselg8/dWRIz/stf4q2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoxSy2QmbT6F/dqFUmQMXDrd2Xx72uyBj8uoxnN8mzUP+sX586Y3RoWZQFrpUM2PwNH21DOrMO1iIME7btK74JLwN9aKki2Kc17zVr7b3zAMn8msF/+iXPWeqhppH4DmbVz9zxTfV6l6Qa/ewXYd8v1PWmCLg1Fy5n/44bR//X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iV1SKUUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtpIvbg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZkL82000979
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fa9ijfGy2njsQ7eq08Ou4TCL
	LA4Ab7TBDNn8fSAtksI=; b=iV1SKUUu+JucCiYy4wvuy5+Cp2uN8ms5cwi81ylE
	vLcNe4yAjR4T8FrFFs0rYrBzSNzKz89ZARj++V3pPbSQ3w6xbuWl9Z38LX13Aw8Y
	84U1ERuHqEX6AR4fRlOAh2hmuqfywF6P9q0xKHP9byucs7+DGkzztafAPfLhBUDx
	pP/XlSSIrAn37OwJVfyauzpfkFd6Loatrac32J7pm0mhdZ6+NitdC38GFXc8nawn
	ofWralYCAYDn2PWHQreSzjNby2rcbCBOXyMTGSklb794dlDbi9fZXmcpxLVBxUt9
	rz6u4J68zwVhR0WW77GyN8kP7DdFn46pSmicJvTribA4NQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenf8w8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:14:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9568707f486so2951290241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776816855; x=1777421655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fa9ijfGy2njsQ7eq08Ou4TCLLA4Ab7TBDNn8fSAtksI=;
        b=FtpIvbg+HHm+aOcX+VeCQdxKAtA0LE0poDYi30RxHb0gLc36fId5m7Xnk/6zWZV1Yu
         Jf9m7fjyB6UZ5JrSdnUqKo3WmG0U8xWYy4yPspbUTnAuPW0tuM2Lu1udoa+nsK5r4vaX
         LlgvSBwh4WvztAOA/axPm2FgGmNnPta11essAw7wzvRMs/+aSTgmvVec/JiQCc24k0tN
         p6lEX3JZ/5Mg1VOpJ62LvpCBxEjdO4ZEun9/9VIC4JN4QZXQ+jEeczyER2AffTxqmAJJ
         fLRbJrmYZH/YzX8xQ46ltJM6YDvWYqZ3ffwmuQiIhiyNztmQqnZrcgiQdhH1aHJAC7jN
         k9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776816855; x=1777421655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa9ijfGy2njsQ7eq08Ou4TCLLA4Ab7TBDNn8fSAtksI=;
        b=FTdlS2jl8D0QUeB1Oz+ov3FFwwonFhN69GMb8heJhX/q+e+2sekGPfVvHb0ClQ/Pi/
         qEpaanHqjztTaFiUVk13QSlMwSoKn8ryTaBGI6iX2iMPSprMl5IXegCf0GbS2oodQJuV
         PqB3PSrYc/sx8m3iRDEwESM1i0qvsKVmfPM7cAMt44FmRYPDaPzpPQWWUbdPLAjT6MuS
         XK9puEZ7PYLbcpg6qBtUeybGT1v4yqvVbTBS0lBWP5vv83FeYHSacfG36vKOTMfOVKZY
         EB1Kot7hVATKNF7Gd+I3yVRn6Vsv7kg1fR9G7cPT/n/1nkLU6VioflOY5EH1kJxD/Dxt
         EiLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZdNyQP5N+uAk70zOmZFZVbxqOFWniNxNTdTpOehBFZ3QUD23MCrz3+V99Rg0VhNKV3Kaq89SPTCxKM3nr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ciAx/m3egQig998vmnyBngboWCe7hBBgAp/VbB5AZUoRKCw8
	JkbFQeFmjDMFvxa4EA6fP2p4yp9+v0i9qklkmnew2ObpKtWxTmadcssX5wSM0nf1Ig3LbicWNo0
	vEkX1NNZl/0lQazCyHM1p+L8fLdTC5xszwogdYTdqt6HBaFGVw2j0Psdi8zefF52Gm5rF
X-Gm-Gg: AeBDieswhrW3LOZsVuZ9XTy8nT3CY5E6I+FkDgEwosPAlxMle100KztSxmaJRkIZ6nn
	dWv0R/hHHFAToyoHs8+WCHJiK8mv1YD9kvHT8v3Pkn1QS5klQk/k6E9tgmm8s4+d88MFX8emiN9
	FBF+LjiwxFbTxME80L5V42YRe9rksDnVJWEkjSL6D3tyWMowmwi3bZiehby3etiyJx5tUBZqkJb
	mOoymZst52MulOZEqiMc/v1oQNgyxpt0TvSOvSVpEXR9U0CfZGt/du7+q45fj2Aco+GezbN8gsk
	hO/o4jP00sTaSIk3sS10dC9SZOUcaw3GayMvIR1ScW/KaJOE48tjRyQ9s51blxPwKyASdaAnBZ/
	Pj8dXr6N6Wg1+M7rsTKPKhkzSOaWYZ453wwr+StoFgVM/J2ARvCOtLYlof44apegE5QZwG2cYOQ
	veJ0WvTSx8yrb3d4mrW07uiwMQuPXOIXv6gr6JkMcgvQsuZQ==
X-Received: by 2002:a05:6102:80aa:b0:604:f155:9374 with SMTP id ada2fe7eead31-616f67c7f28mr10964526137.15.1776816855086;
        Tue, 21 Apr 2026 17:14:15 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:604:f155:9374 with SMTP id ada2fe7eead31-616f67c7f28mr10964520137.15.1776816854745;
        Tue, 21 Apr 2026 17:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb73de2esm31660631fa.36.2026.04.21.17.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:14:12 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:14:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm/msm: fbdev: Use client buffers
Message-ID: <tyeiktohirfdxqz4psxoxbvxogakabbnbdwcf6ado2um5sym2n@5h6ip5oj6ucj>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <pcbuciyme6uh7hmduzzykuyacwelope6or5durvddzwfandtvb@wfjyexsjra5x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pcbuciyme6uh7hmduzzykuyacwelope6or5durvddzwfandtvb@wfjyexsjra5x>
X-Proofpoint-ORIG-GUID: n3lqrwXlHneSD2OAMMfGvG4KIco1jL35
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e812d8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KNjA7eja_kyHsgebIicA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwMCBTYWx0ZWRfXyE+pQdTo0+gK
 bdkZoXMiU5rTlqvNoXEfBTB9h8EshDk84rsnjsWAwyebxP74SCimaeMm337jsiXYWrT99zs1gQ1
 8YE3RfpG4jSG0SJGWLB9vsfFaM11yRVxLRPSkgQHJyHklnp44vO/jR0SfAAKH6IyYLJxQ0Bn5AS
 lTqkLCrI7H8+H5UKWhQHldNd+8YWBYZD+UQHYEC/dG6MSlFsfi0VynFVwQ0e6txX1nHpIA0PuMA
 41Z8kqE8pHhuOoflONA55lG0wGVvpi29verISZhZOJil0UH5bgpIw3xJG7PF9pvQMrFY3Uxqnx5
 Nu+qNqXiVhbtRKLq7aM1gbz4uQp63Dyblv+H/VcL4RnTDXfk5+ZPS5j9sniYfu4mA71pFuG/YTy
 XsvBtJHlvoK8j0XpPMMDvxSzJEqRhFXit9cGRuz0TDdQjUpz0N4mgP1Qbn8Y030aswNOea/5+Nv
 FuJJQLiEsWWaTheRQFQ==
X-Proofpoint-GUID: n3lqrwXlHneSD2OAMMfGvG4KIco1jL35
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103993-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C02A440D2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 07:08:31PM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 02:51:13PM +0200, Thomas Zimmermann wrote:
> > A client buffer holds the DRM framebuffer for an in-kernel DRM
> > client. Until now, msm created an internal ad-hoc framebuffer for
> > its fbdev emulation, while by-passing the regular interfaces used by
> > user-space compositors.
> 
> I assume this was somewhat because we supported using the stolen memory
> for FB. Support for it has been dropped when we moved to GPUVM.
> 
> Rob, would it be possible to get it back at some point?
> 
> Thomas, would the series prevent us from using the stolen memory for FB?

And answering my question, no, we still can continue using stolen memory
for the FB.

-- 
With best wishes
Dmitry

