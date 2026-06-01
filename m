Return-Path: <linux-arm-msm+bounces-110568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGKYMDRrHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393761E3BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18FFA300914F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436C139B947;
	Mon,  1 Jun 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Boo0sc1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U54Vn7fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F73A2E00
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312865; cv=none; b=aAy83sHfPllmlbv4U9gy8pAtoqPz2+w0K7Pv4Rj5l93l6asw4IWK2RcyaP9DI8J7mmqoDZQMScQPliGGAYpjB9PVO4kqW+rVJYboWOm2Czy5/r/TvlSLkPu/Ew2R5r7eA4f7nhQB+O/PXwGngZ/Io5yAPFLKHnYOiwYtjaZ1qdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312865; c=relaxed/simple;
	bh=hMzx6p4b4J+8Yi6hysZmm8VPhZju+tTEUI+2hhuoets=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRvF3GC1h7LbCfjrHxnPYVwlfepAnL6pgc+L+pq+5OfxLUqQwdHPf0FsDf9G2oJEsTNQbEPpgr+DJz7ScC7WhnBpElkj4G7spFm/hYwpHng7FEL2zuqHkelFdwR+Xu+K8DrS3hSF8f3/pYTQkD4CHtMdfAoBRcb4O9jnOpFJB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Boo0sc1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U54Vn7fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fTgN4065409
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nAio+lLQC+YDqx1dS8BKrM60
	KnX/EDWZH36PWtgdsxw=; b=Boo0sc1ULHvTyQgzVDQFRX5hHFtntVVWTcb/gIbC
	i5V+YQ8R57+6xG6OcK0mexqWZccs5DTzoofaURCpRjp0sKFrjWywz+Cu4fxe2E2j
	Npf+zGDC+3i1qVVnlpQgwKnpAHFsIrbLl8v+nDR92gDYb1TNiigGT8N0MOifqVZh
	uRNP/WlkDLY0KC+4zpV3mXNb6zR7tpq/S7WxjRVfNHbBC9Wfg8pnVyYYHd/ednDa
	xNsCv/lh21qMITtktTA93ABNSuuqeO+NQg5Wq/C5NOEaCsyrkwoUZhWYWLAyTrqL
	VZ0mlPq/yBLPST242ONnpeB4BL1kO+xS4OVLsOcdf7X3jw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swrn18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:21:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7e5ac48so1229976241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780312862; x=1780917662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAio+lLQC+YDqx1dS8BKrM60KnX/EDWZH36PWtgdsxw=;
        b=U54Vn7frWz8xfgXz73GbnLbsBBwcRLN6Azrhp42d5jB9hHnLPX0qBYNtu5U2xWhbBd
         W5QjdhjL7/Rs3gk4EjiFoYk930uPwNtAOXXxY2ldPLmHCqyPdzKYXGN5hPhaE1V32yxV
         uhZdlIIy7QNaTk8OmIVnG2NA8Ttw724kymXOdLFbZYshLfgkWaZgYdK8LQRxQqRc2Heu
         K5/2wuCTmQyJZDORjCHDWS8nOAQuISX6i09J/5audtlFkVSRc5P/EVr81RtjrY5zjh4f
         e8SN0tECoNMkH4Y/yrHOZ/roV85d0WVQXc5xydEos1u0MlbOcVrPQk9bg4NE/AIFFXUQ
         3Flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312862; x=1780917662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAio+lLQC+YDqx1dS8BKrM60KnX/EDWZH36PWtgdsxw=;
        b=XZ2DraN+f6pM4JY9k3iYOm9E3hrqSTaBG+T3PLAuHcL1uajJcMF7CyCGBpUJLgaHH5
         RqVo/aB/ewdVZhCBAsNCaqvkcYMjokjunfvo+y1hZQANdvWHcnGsLIBLBELyW88n4S5F
         Pg86HlYsvPyz48xfDUPu+g11FrCtPYtVPpfd+y4Dv+lblVyb3ETcBRprNXj9QSalZ0ge
         iavZMjPv21EkhWYh89VEhsr+lpl/+RI7AEDKFKcM1Hux85oUcxLPF63tSi4DMYh7aFYj
         IzjSZY2y2El0WvqZV9SF7Ka+OFCPltpnNQEnHL43eslOLU1dfgSJDzvAy2aRqFwsasxs
         v/2g==
X-Forwarded-Encrypted: i=1; AFNElJ+tF2L410RMI0+zK7SoWqsG8GJ8+t8ZDCM5BKYV9Pfdbe6evKKG5Voa11skzNzLZsB/9v1lfeF5smw4YUd4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iDj6XVue4Q7DCelDjcY/DRi1jVWrD6vGT342m1klbeMgUL/2
	g8a3wzPm6S7ePUQEi+PebrkSNm62v045Gj8BqpRMR3ygWUPyGJ2Lulgs1GdhRF8b1E1t6eGJZ0U
	SLR4Tpr/kXizqiPTKLpW2YdONtvISIie0hCb/pKsAA20cbzRZW5SkZ0rr/Wy6dLKSdNax
X-Gm-Gg: Acq92OFZX37x1N72n7xKdbioJZejWuvrrlfFh68kzztTxfBo0VdWnMqV+Ks/9TUE8U4
	hX67ZXvQ0cBRIgUnYGXJcU2ceXavy2YhNqMczbeCyT8c1htJ+e0XTaLh8H/Jqdh8U9cwI9W3ea1
	1ogRNsmdNxeQPwC1al42L3uy7giPvlI+MxYxMoR7rcGzbZ4W+bxuPbV4CINIkJs6r0ffFe4e0jx
	1qHcA2f/1G0ARu0K/dW6MD17yWDpFkOt8UCJdhIos4nlp6/4YavzFNslvFfd4+WjbaHc12KhxcD
	G/hPkhiaabsYRE93m9S4eOSuR2oG+QseYbi0OtbBHyAd6oPv0pQ3/0ULshgqzfs1cQScDne4jEP
	CURe3n7Cs5FiP61MeLCIzzewu6GAoSyEa9hoRYcBqNgJRETgxCqJVBFGMYZRaLeuvUlbfYe771M
	z7rHzxJ8rW0FhFfuiTrBgrowixJp7OjAxAD2bv49t0ufZrMg==
X-Received: by 2002:a05:6102:fa0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6c68236ff4dmr4630761137.5.1780312862106;
        Mon, 01 Jun 2026 04:21:02 -0700 (PDT)
X-Received: by 2002:a05:6102:fa0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6c68236ff4dmr4630742137.5.1780312861692;
        Mon, 01 Jun 2026 04:21:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c70fsm1967798e87.35.2026.06.01.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:21:00 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:20:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: add EDID re-read retry in
 msm_dp_panel_get_modes()
Message-ID: <6r7evbpymph4grxu2qdazdjeuwaioyjf73st3vjnlw7zwkeyrp@m45kn6wzegky>
References: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1d6b1e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gxl3bz0cAAAA:8
 a=ZCn7-noLd4lGRSYnUTgA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: mcq4Rj3TqBQ79CzAL935FB98VSnO1-Sn
X-Proofpoint-ORIG-GUID: mcq4Rj3TqBQ79CzAL935FB98VSnO1-Sn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMyBTYWx0ZWRfXzMcsygJw2wxa
 UefXY2Jq+dYNeNIdttufi5oygsx6YiyqpUVvToUKCwZLHfbTFX25WEb1lBtSpZ0jI34eXCkVJkQ
 XVTHKKXCdtcmqTzUMzIHPxl9r/JNEz5RRtSYer2b510ZKg40STNdPMx8hvAJKnvrxPRXRdNJ/pu
 wEBQRf3PIn/VMP1OXREMJO8ozmaZEKwN3sxQbTd/SfRshhq31bPTRhKiJJZ3p476ZBGrHAhlA/0
 uQ6wQxTqlIFylJyzkCq/oN6GaElPe6H46h+Jl/Te6OTjX09iyNbrVbc4L2/lUaQc3sUlEAM6uuy
 Md0TXfvO+g05vkViVJQq5IS+MfTZjuvTQXQlqOfSG23rl96/EzRG0xIbTIqyAFt26l5Hsy0yVaT
 2+eKAHPuHiWNHD3/1WV+/OEMFPWShdjgKnWDbPqm9MVe4b0fc10+HguxTMeQki0e/gPLZdpRkDI
 GP1NnZu8CQxR59A+SCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010113
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110568-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oldschoolsolutions.biz:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6393761E3BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 11:16:51PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> drm_edid_read_ddc() can return a structurally valid EDID from which

When?

> drm_edid_connector_add_modes() still returns zero modes. This triggers
> the error:

Please at least add EDID contents.

> 
>   [drm:msm_dp_bridge_get_modes [msm]] *ERROR* failed to get DP sink
>    modes, rc=0
> 
> even though the link is ready. Since the EDID is only read once, this
> error persists and the display comes up with 640x480 resolution.

Please check with the current next tree, we have reworked HPD handling a
bit. Also, it might be the case that the dongle sends a placeholder
first and then sends a HPD or IRQ_HPD event. Please check if that's the
case.

> 
> Add a retry of drm_edid_read_ddc() inside get_modes() when the initial
> read produces no usable modes. The bad EDID is freed before retrying
> and container_of ensures access to the DDC channel. This directly
> addresses the observed "valid but empty/garbage" EDID case on
> flaky DP plugs and adapters.
> 
> I tested this on a few of my "flaky" type-c to HDMI adapters and hubs,
> getting no "retry failed" messages and the desired resolution. Without
> the patch most plugs would result in 640x480 external display.
> 
> Fixes: [5bea90ad9743d2] "drm/msm/dp: switch to struct drm_edid"

Hard to believe.

> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

-- 
With best wishes
Dmitry

