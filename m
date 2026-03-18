Return-Path: <linux-arm-msm+bounces-98531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI3+KAzJumm6bwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:47:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9462BE8D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B96B30CC7A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CFC30E0FD;
	Wed, 18 Mar 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H552eyIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6MWP0kj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52643B5308
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847364; cv=none; b=YSDLq1b6vcIp7K95RDOYr/dTPdLsLK7obTVSmetGfq1ON8CKRxzyxnX1T5z5QNcieCkjnaRsNDcQPMzgBthqxEpaqHTlhS8vUi6HPRaeJ/W9auOFaXvzEjAw7A4nsqqKr5Syj6R1+0KJtIihYFPzJlWRKaOKrJ5Yutrfmw5cvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847364; c=relaxed/simple;
	bh=Ufs9NXfJU0+rN0K5pIjfDQjG6iSo4IDBOTL5sC6Gows=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQENJpTZv8CcTmr1c+GS2zlS0DtVXFhFTda/kmGCmbW7FcVOKPuq/KKM+xRrkKRf0CwfDf43MZJif/bTu1gVBfT4I23Cs3lbO7ULq+6WzqdkXDl7MY2tc4OPDZTr/1ireRavGLn2uWeX1FKqy3EiBK61iSndD1rR4/pQ9gtL9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H552eyIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6MWP0kj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IEXcCc2790978
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TVdDNl7utYQzDuF/D4cXEr8N
	Ly17OKb5bR2C0gm45yQ=; b=H552eyIzwClHoMSXdS4dZROlKRAFABu6mDW3q4NE
	JfpSEvR6jBLYmFDCzFZBkIKDQY06se4NkxdGBp8gidOAAp8/uX2S3g22zhCw5SS+
	7CzhainbGvV8wgAJCj8hi4GKKIED9txtGqlc+G4hOUTWEckAMrKAGmRiAjciAAbw
	L0b7WeIThpQFARCyRzxeDSqzRrbX5s/7WJ4OZ2chi4amTreRfwe2QbabRwZ244Xk
	4IbSv7SVmCRvxC7ngsaFj03CdX3HH9X9PbgBFa4h0B80RiWKq+IXkRTdxWnoHA3e
	MpY7jct4voW8YnqwQPkZW63h1YQVcQCcSi2Kd/eGJ11vzg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g35fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:22:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffa389eba3so28137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773847357; x=1774452157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVdDNl7utYQzDuF/D4cXEr8NLy17OKb5bR2C0gm45yQ=;
        b=B6MWP0kjY5gUUUC35oSE2hLNkyWyMnXwGKOgnNJH/Kw0upEazWQmbgfb4i6sH6jPwa
         6LjWMi9o/+2c0kGw89ojNu/PXNdDggYwXdrcJKk5s2gf0WzuCtdTcNyrNuJBWOTIjCah
         LbRYFQDQ0BfnEKneaBmPEHRU1nD754dmS7ruaYU3VFQ4A9Xk4LlAWIj66ZZ8znisWcdL
         1T+7Ru3gWQjYBK4V4gsWEoZtIcyfKie0A9qM791v7JYkLora2ihN8T0LIpuxjDU32z6D
         Fsx+RBXSMEC5u3gXJ5D+zage76uiUAdahJyTPJDDfPxcVQZ1GJuNPp0v9yY6JrQn1IjU
         /vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847357; x=1774452157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVdDNl7utYQzDuF/D4cXEr8NLy17OKb5bR2C0gm45yQ=;
        b=Wf+naXMjrVmAU3tLVyHXTnuGpHvWAULeks7XPG0xSxQijOLyjo9nnAVpkxCOIBbX1c
         cWEcXODEjK0VcpDWh324WT/GYecDu2d0pFPXqLqGSvQ9G19B06evxFf3yi85ryvYZ2Tf
         +zdWvQH00il+SYJjXtmie6rp9dX/uZ5duDtZ8y3XjPWVcqIQjC4WH7DsITP/wrxDngut
         jt00zssro4WRCWvSkIHySzAeYPsnnFpOGzo0zfafKu/KqayZ91lrvLCY9B2fSQ/nAOOo
         9XwTs4lSlZSukcLcACu4pFwjjXY93a11R8nelywd5feRN4UlYGTHMiMJjaNwpE9pjlhZ
         ZXKg==
X-Forwarded-Encrypted: i=1; AJvYcCV5WGpASbVZ51cOahCeegE2v47vkllUVG8Dg8JjpJ385UiPfcSqNy2eKmnnR+y+Kug261OlgharcZqcFx79@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQBsVb5moYJ08HC8S97es0bSYT1b8GbRKysRnJ4pIoyXOhfwg
	vuLRX7coBFlSJbUrMfOchVG5ZKHzmFAQ9b6t2OW5sG+e3I9mz8woUoepObphLcgOFgBadpui3yN
	JirUiDyMDBCMeMv9WWPub1HoxR4M7JbBTOrPunbvA8T5tclThFP74I6zBmxWVbNhxSYu6
X-Gm-Gg: ATEYQzyW4Fel/TGzKrvs+POO1mqj5b4jcJUqhzSS4r2DQL7iQN3lLIWmw+7RS11fpzU
	OVidMgkQW/NiC8mv1BdtsQIMSqidD8OfSInqeUujLdiaQDjcrbCM2FwuPWHSKAf5HJqtkkPDtL9
	SkUnqVQ0/nhJtjgCZ55FmepHLYZWyNwYK9v7OqdLFhJofeF6rNYfNotC8GkOtOnHD+subGVCZxE
	DBq4DLaRQOZl+KVxtIfZrIHwR8iCmsKTFxSw4JtTBpud563TNoCZEqmXyX+4+5YpYY6ldxULzk8
	/4q2GTp5Xuu1IGHKZYE3BoBv+2NNCBAf+S9ONdK0pQA0RtP4ZKd8LLBk2fiZINtzTB1tBnSx/Wt
	Cq2fjMBTb7VgE4vmzwYrpz34kJyn2xdUUx4k2r94wwz19YAXLt730TlymvrhlUClyzuXyYEvkT3
	mAy3wzuHoRnRQm0lMvyGiPyEwnHFGw6cdHS6I=
X-Received: by 2002:a05:6102:38cc:b0:5ff:a4e0:1939 with SMTP id ada2fe7eead31-6027d0ba547mr1779219137.7.1773847357424;
        Wed, 18 Mar 2026 08:22:37 -0700 (PDT)
X-Received: by 2002:a05:6102:38cc:b0:5ff:a4e0:1939 with SMTP id ada2fe7eead31-6027d0ba547mr1779205137.7.1773847356937;
        Wed, 18 Mar 2026 08:22:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bd181sm7039781fa.32.2026.03.18.08.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:22:35 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:22:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
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
Subject: Re: [PATCH 2/3] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <dnpjpeof2qtccxibdnxy6lzg7tf2tlxxxmrkpezsx6wt2d6jal@q35jgeypeudd>
References: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
 <20260318-dsi-rgb101010-support-v1-2-6021eb79e796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-rgb101010-support-v1-2-6021eb79e796@pm.me>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac33e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=Bu1RyOF3CJazrzOdyIIA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CaMMNPxrq9Sjop3KKP6wxR3q1-0Rp9--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMSBTYWx0ZWRfX5A5Z12yDu5uU
 PNZuRQrBD8255h1jOeIbqAcnTWaRzznKysVqHfTOi94/+oaNpUypSJcke5JGfrydPj9lBE8RgPz
 3DZYKYA76FXpij1h/s+NvZreqs0vr+iQG1HluRFrzd+gjNemIO1RMlgmSgM22x/hHGW7SSLVpo5
 PidXq8g0R7ZJRK3ZIaU7mAUsnhb6KRIfQdl0rgGDTO0m6xQbW6yzFoA/aM+AGF4btH7ANQP3pxs
 NK96Pb6xam+6udGuPwJPbTFedHsPlGDE+7m1h4nwaKi0+cSw8ZnqYjJW3K6+tyjQ5QTeYQzKe7W
 /zuUAqUSeq4QmHrSKiEuVWL/QNZuU2msn1Xeb5r+5WEz+nx242H3iSlY1ZgPyBAc/FxIm+JlrXJ
 CwE8im17z9+VWOYJEtOSk5FTvOqXP0UsvFDNSeQtr9JtOcczc7rIDh3crWLY8r4t7qkcBWO+n+5
 9g3fwxna1ofWOboUHog==
X-Proofpoint-GUID: CaMMNPxrq9Sjop3KKP6wxR3q1-0Rp9--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98531-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,pm.me:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A9462BE8D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:41:05AM +0000, Alexander Koskovich wrote:
> Add video and command mode destination format mappings for
> RGB101010, and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits
> to accommodate the new format value.

It's only available since DSI 6G 2.1.0. Could you please add the
corresponding check (I think having something like .has_rgb30 as a part
of struct msm_dsi_config is a good enough approach).

> 
> Required for 10 bit panels such as the BOE BF068MWM-TD0.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 2 ++
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index db6da99375a1..3e3d61b9390f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -757,6 +757,7 @@ static inline enum dsi_vid_dst_format
>  dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  {
>  	switch (mipi_fmt) {
> +	case MIPI_DSI_FMT_RGB101010:	return VID_DST_FORMAT_RGB101010;
>  	case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
>  	case MIPI_DSI_FMT_RGB666:	return VID_DST_FORMAT_RGB666_LOOSE;
>  	case MIPI_DSI_FMT_RGB666_PACKED:	return VID_DST_FORMAT_RGB666;
> @@ -769,6 +770,7 @@ static inline enum dsi_cmd_dst_format
>  dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  {
>  	switch (mipi_fmt) {
> +	case MIPI_DSI_FMT_RGB101010:	return CMD_DST_FORMAT_RGB101010;
>  	case MIPI_DSI_FMT_RGB888:	return CMD_DST_FORMAT_RGB888;
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB666:	return CMD_DST_FORMAT_RGB666;
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> index c7a7b633d747..7636e9914078 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> @@ -15,6 +15,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<value name="VID_DST_FORMAT_RGB666" value="1"/>
>  		<value name="VID_DST_FORMAT_RGB666_LOOSE" value="2"/>
>  		<value name="VID_DST_FORMAT_RGB888" value="3"/>
> +		<value name="VID_DST_FORMAT_RGB101010" value="4"/>
>  	</enum>
>  	<enum name="dsi_rgb_swap">
>  		<value name="SWAP_RGB" value="0"/>
> @@ -39,6 +40,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<value name="CMD_DST_FORMAT_RGB565" value="6"/>
>  		<value name="CMD_DST_FORMAT_RGB666" value="7"/>
>  		<value name="CMD_DST_FORMAT_RGB888" value="8"/>
> +		<value name="CMD_DST_FORMAT_RGB101010" value="9"/>
>  	</enum>
>  	<enum name="dsi_lane_swap">
>  		<value name="LANE_SWAP_0123" value="0"/>
> @@ -142,7 +144,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	</reg32>
>  	<reg32 offset="0x0000c" name="VID_CFG0">
>  		<bitfield name="VIRT_CHANNEL" low="0" high="1" type="uint"/>  <!-- always zero? -->
> -		<bitfield name="DST_FORMAT" low="4" high="5" type="dsi_vid_dst_format"/>
> +		<bitfield name="DST_FORMAT" low="4" high="6" type="dsi_vid_dst_format"/>

Please comment that it had high=5 before DSI 6G 2.1.0

>  		<bitfield name="TRAFFIC_MODE" low="8" high="9" type="dsi_traffic_mode"/>
>  		<bitfield name="BLLP_POWER_STOP" pos="12" type="boolean"/>
>  		<bitfield name="EOF_BLLP_POWER_STOP" pos="15" type="boolean"/>
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

