Return-Path: <linux-arm-msm+bounces-98375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOQiMCJ1ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:49:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1672B961D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE54030E93EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D120234C12B;
	Wed, 18 Mar 2026 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjkhwcqQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAkdq1AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEB3A1A3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827082; cv=none; b=ROv75matNi/pAtom+Xvz5IOJc+vG9GL8XY0w2k8zdKf2q0wEHx1NM6h1ucT0TTc0T4tPjnJ9V/Ox11q73IfwswiAykYOBq1WRut5Q6yXKCjWaH6jKc3JHgxn2WKuOstFFpokZeo1cpjXpalwB0CyKkKnKEnAPA8qpRJbwk60IVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827082; c=relaxed/simple;
	bh=mQcczBmgWrD4EaGtmWIZbGaqQlWDV8NOz7y6/vLEuv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxRmeDNZ9P/jXAiO4BgUtwtUjfhkCtu0DhYr4geQsk9W2QVy+0B20RRnVhwzp6dlXbbtcCArLfcthOeZDVP+fvR96gt+I2t0xgu5BoyG3xOHvUbvSGvIT5c2o5bJObAFr53x8z2RhgRa/iDnd3RSOesWUXykOfU0L+XVdFRkZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjkhwcqQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAkdq1AI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7oNDt2789492
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=amemIOjZKM5K9aUMgTO6U4C2
	ChZss2oJUtADn1/2Za4=; b=WjkhwcqQfil3EhW7e6TDRmvMImyTB0My97fqECVw
	dZiLZ13+Iw6MIcCe84hu4IfdyBIVuBxmBJBjuXcrJMlHKnZQLttXfWXi77xSkXkF
	+49dmKWVHW7UuxQGNzB5GDqjxQIaDhXgcaenkB6Q0toJb/+W6HrxSHOSr3MGaT8I
	S/yyt4X7fFaZ2YxSMvWHLL08DcJd0EgW1Yp93P1/NQSswBNWme0f7+FJv6WKlxiV
	SDLLiHqcgiw3etjzg9SXC0A20K1Pb/ff3itZ3OxK+vhfnKrVOuD8Unyyalqr2BeD
	P7ZU17/qjopd3jmtCFIxlS0e87wBxH91zAUpc6zzxCUTqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g1y20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:44:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509177a915aso59701251cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827074; x=1774431874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amemIOjZKM5K9aUMgTO6U4C2ChZss2oJUtADn1/2Za4=;
        b=GAkdq1AI1pxxCF21e2gvTDunuChgbWkGDTbwKDHBW2eeYYi1kG8CB6zc3PTZThJB+s
         P/4v3kh93/CIZ5SnHkBciGjv4yma47ikluXWbIeOeIDEKe3zzysS3k6YhmTnw8RlipJy
         5HKlWIoGg3tD62W+YXv1OadohYXUOLpAkXRZcekw95tYQnkUkpHwqfRShxDkwEay3bTU
         xVRxU4ZkkL/I2Jf6NWV5Lt+8+q5O/cH4tralV2WEO+SXL0SRxD2G+ZExg//rocZ0mdXn
         JNF2MlJuKzgAlLTbLvaCYsxdBbOej2XUqmAOH3b1jdcWT/yhwMYBAiECswGrcKGQDwEc
         RZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827074; x=1774431874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amemIOjZKM5K9aUMgTO6U4C2ChZss2oJUtADn1/2Za4=;
        b=OvYu3BWlXGK6cnPSEstiir6JsbAqXOdELG9FD6pHSBqed46hDrsgRDg/Y9sf42GYt4
         3eK1uevHNvld/3/XwzbeOqFpVCJwOgB6PCADLRay72Kef5KZXbZka6KAZyl7QfQbqZ46
         hWIvRj4q8qkTTk0nKmeIXJ6BPpgGuYBox908HXC/mE7uFqghocJa166N10HoOvNF7aY3
         sUUrYh5H+hoaBBVejsbOFrmEywgut/mLjehuu7JCRS1lQzXjcOc2Q0vwHzk4Ix+Shnl9
         jOKTDWlD8z6i2DVKSfngylX2o6g/icaEX2n9ZSYe0HWDSv9AQswKabk/XUsv51/VZAe0
         6DSg==
X-Forwarded-Encrypted: i=1; AJvYcCVCRO4S0MdA3XyjDwOjQ/aE8vm2FYEdTUpufPlBVLYeIBDrkbkhQkRioooyg9n/2W9fabFT/TdR0JRC/omb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQH3lDmopvQ12c2PWQVfJY3j8UCi1vM8pr35Edj5NXHWiidcEk
	frYwOsW46hiL52kbjDSZjS2UTOqpw0ulrkaGiSfgUeWglSeYOVf/ztonLwJ329Z6p1CVImNjrs+
	cMLLrVIflSfAUbZaPn2pFYNX8PvtCFv2GhktNhOrJv9RGMOlVCjW5ZZjzel0xH9MuQSQU
X-Gm-Gg: ATEYQzxaRROkNRYITK5HUhqLDFlT96R7yttfbwyjXjUFTeSEhEkW15ip7pYRKtbOGrt
	PhD+h7aXHWgQPSz/Iylv7cJnqYdeH3ImpK0bqtPhDWEJH2kn87zC05ELd7eYWyjcOEKFkSgc+yA
	ie2QfJqpdjymz0BKiMeYuYAEcFPQ2Ez/x8EFgOuhpokI5+T+o9bGGwxO6lXqpYvmOJ4hCAb5gEe
	h9TyEVW3kjOpsz0uXlP/ULUrU+CB59FUvtQpSzkYBO9phWXs4u/Cb3S+bT6I1tBrvLRiqGGJ1CD
	uzIcR/VA6V5xD6u2EDN6j7q8kl7a6rwvclNzj6de9bY+Gl1/k2pgWDOtKttPXDWw206zmjPQJn4
	/6UHir7tXptXaG7W/a/DA0uGtJLmFoR+HId1OBsuDpjzjmUKb+XMvMaOI4wDrxQHEse1W1PTvHt
	qdMxNfrax3jZSqbYRN29v/c3ei/JprRUaOrjw=
X-Received: by 2002:ac8:7d0b:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50997ff8dd0mr76936031cf.5.1773827074008;
        Wed, 18 Mar 2026 02:44:34 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50997ff8dd0mr76935831cf.5.1773827073595;
        Wed, 18 Mar 2026 02:44:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd51570a8sm4700141fa.6.2026.03.18.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:44:32 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:44:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>,
        Douglas Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add flag for sending all DSC slices in
 one packet
Message-ID: <ii3y4yjt5kymqqtoki5zsogauurjb2yyxtfn5lygvwxrts5mp3@u7b2z57v4xeg>
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v1-1-1bd66b7f9e0c@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v1-1-1bd66b7f9e0c@pm.me>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba7403 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=T2ZltfVFVEVyCiQaPD4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pETrSPzmOm6WGYYhIKJus1OmdPhSySXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4MCBTYWx0ZWRfX2twvOinMTyWh
 xTnkk+L/Zio7iK8yTiYZ2TI51mV4q9pa8R436roXr+g3JR8kzLm9Wrzuch/S6TEOH8CwB40tNFf
 E6dhSsoXS97qI3I9EDJSbuukQxJwDz2k+bgZN0L+pWP9c2j0hOa4+vcP90PE7JFQ1/PRhhh7NGl
 8IOB0oSBZ+/JAd1vlc5Af9XcicPAcfOVDzjoziMZcPGI/8ULVOWNnSWUoAonReSnntcfPOsDmGN
 F30kS/0eMR6FLFpdn7simVLLPaSz5GDLa3vqiIJP5qvZl80OUI/PlIzAw7YZUvUl6R1IqUwzFeu
 1EhS8TxnkHYGqtHBoGXZQCAwl6TjETK/Y7DPpdGHtG1lQBKunZw9NAwf4327Hi2MDo8ET0moaaI
 MFyeENsmoFnZm2Aa4sXG5Pr7HlBv99dpvbdPPawxiCUXkPH8rZ7mmchGyrNP3iU/+1v33Gs9E87
 63h8lmVr4nRYp1QGlYw==
X-Proofpoint-GUID: pETrSPzmOm6WGYYhIKJus1OmdPhSySXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180080
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98375-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,pm.me:email,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D1672B961D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 07:32:58AM +0000, Alexander Koskovich wrote:
> The MIPI DSI v1.3 spec defines two modes for transporting compressed
> pixel data: one slice per packet or multiple slice widths in a single
> packet (Section 8.8.24 Figure 40).
> 
> Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
> set to indicate that all DSC slices for a line should be packed into a
> single packet. When unset should default to 1 slice per packet.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

However I'd also like to hear an optinion from somebody else with the
higher authority.

-- 
With best wishes
Dmitry

