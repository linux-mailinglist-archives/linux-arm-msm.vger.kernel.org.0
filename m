Return-Path: <linux-arm-msm+bounces-97829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHhLLsV3t2nxRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:23:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A46294627
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F5C300F5FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17E031E822;
	Mon, 16 Mar 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8pQyTRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ7ahpCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B1137923
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631426; cv=none; b=AcvR7r4+iwT/3lHZl3NBenuMhQZJlerJ4jQLgeSmayLlb2iquXam5HTGetmGZe76Nc+2QTCMBIED3hEoGDB5UcrRS1sLVVyaNzwwkVuCdXpnQeH+RpEvFhOrmmP8YadcVxZlCTrdLUMhqY7J5PBcTi5y0+5gVh3toqKmnpNogrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631426; c=relaxed/simple;
	bh=BI4SgI37h3n3RnFvYPv0R4BVDHFZlyg74dFVixLFDAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDQuok3yyBBc5nyf2OgmOasFBagqxFVQLTe73N7m0SShEPkzpBEKj1zbsTkcqFzshAjVP3zHvNfyv0i1lYSmw9DbQ/M6Tci3JXro2KiGpAmDZ1b7Di0W76AWIsbnFH7afxIIN4TEpNfFIaPaTF0TZsNiQLBx72nniGwgY82J2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8pQyTRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ7ahpCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FJnS2D4190886
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCTtvtbeSyA/RrQyiGYTxM5IzCFNImcGvaMiSQ6lzRY=; b=L8pQyTRr6ABq1Yfa
	jLM98/76PZAWz/6nsKDgwUM/5ByFsruBDk9FQ8nOo4HEUZn+5N++MVI+fKsGIVER
	5I4rKPvCtzfmyJahr3ffKpxiInVlGl78wYCRHF1djQtDd2seEaf8rtVrYdNynYBD
	enfwpMSPHKz3/d0OhnCTYNaYEzayg+ZvYh544qqkijky15UGxMGor2Sc6v7FBTEm
	8E8b9ssuskZNdDf54vuw2O7KrQ7eRQixvKQ9jKaxwJ5CeQBFfXX4D9fze7AFC5Yj
	tQ7k4kbzHuQcWjdlggj5oXc99HC5Kh9fHwKwA2qAiGWYqXlbNh/AbHjdX0FhXGrW
	zs3jUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc3ur7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:23:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50923a9bec8so62017571cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 20:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773631423; x=1774236223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCTtvtbeSyA/RrQyiGYTxM5IzCFNImcGvaMiSQ6lzRY=;
        b=JJ7ahpCCjJGlWSyS6FR8U++an4RExAPr6w3PKE5G5qzQkzU7WOt36o+AwN90TsOX7A
         ynfcVcKbg9jIy40pd8F+4BHM0vogjP1lPg+dVjtMWWlLV1Iapf6CxZCqtNgrr6TQ22K3
         /22to3JhH6x0O2IyEV1UTQuy2trdJziVGUSX7qtpJ6Ae56fHXPmn9OL1+YEJngN1x1lF
         bAQ8jGYto9zC3S9C4RP46etO5s74J8XQHlb8VV2WwgSvCnfLcQ2RhtipLcfxnyKv9Vx1
         yYatxyTikwPWmXbnY55Wr2qDkaq8HNc+0e/c1AqP6DP8+3SMY7nvRLLFHaO+xCpGGIfS
         JYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773631423; x=1774236223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCTtvtbeSyA/RrQyiGYTxM5IzCFNImcGvaMiSQ6lzRY=;
        b=LAFhFxipppIMpIB/z9n2C6fFXY6tQtEQ5GljLbMTr+7GPIszHTmFH7088mdnLS6Ob1
         Kz48epHKvrqdpAQKp2VB+wl4IpVtzKUoqmv9Pd+AIs8k4wT/yIbB50Sr3itaC4kF+icl
         fANLbVEj+dNlC4X+7Jvkjp2j/oxA/+W9O9H87amQjGmZeKN3J30ozC+qvCdvFrhwqJT4
         bC2glmmssZvx/tHO1YU+mPHc4kN/6T85kajCW9EgFb3r6x3MWmRrxjsCjkyfRSyGXczL
         c4PHVRPE5LjzVUAbjIAvf+RvRVSI8TaHc1aSwepVB7DlDoOxsWi862Vq/GRBcCa5UNRG
         dNAw==
X-Forwarded-Encrypted: i=1; AJvYcCVeJqVcrKt2tqEK+/3MwLbpLH8Ig/iTdcgqi7g6h24pwO07FjFJdYBInAQHab83ja5rJW0OFYtDIcqR5nnx@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPl0K90FZiiTGJSV9VCSC2tL7auold+BfQhD0FQpWFOX8xQQJ
	0S1H25OkWTIiJyoVKd/xySAYaMbmurZjFO0FvcvS4xb7kNTGy29tpIyrnTR8sIIT+neXLNcRJba
	xuiM8uvJHJFfw9mWVQEbwxOyhFLPd57yzN5gjatsclxlxF0xrMpsvADF4JuCwwYI01+7z
X-Gm-Gg: ATEYQzxCmOevQ/s/yUFNbHOr7Lff+j0vn6M+fcfcExzq2mMZw8C0MstW86ttqFFGYVi
	jaMlxFWvB42bjyfnSa/CioUjwnKXaI4iQZ2Z90mkO6jfUiiKZ36vQjkGxE66ttQZSG22dufie8a
	2xvgNxQyVhkZXzhvhiIh9j4nnPtaH2jx3Aoz73YtYk3miAdaKLthCMcPTcCi0B/RBLlVNvHGiq1
	KQhT7ybXpwQOfpLmnEcjeQ58DHtrBOtOIjGT5qLnnL0QfdJpFFOM1yVDrqzueW5MHQr+RWgv3/M
	IQLEA+7YzDmUrg1X6T/GGY9Gzc4PvMG//ZiKtcK1j1f/cspSVVwf+2/fz1foSR7xcq7+ksRNiLv
	vaWUNSrLOx/Jpro6NQuMn3q0WlUxHn5397Ky+46zoe3LY3Que7vhiGmmzbtlNiBgfQcywvTQdJ1
	CmPI2GpnbVmzhEz2cA2FlWeP7jmWPHNMxdJ2Q=
X-Received: by 2002:a05:622a:291:b0:509:4db5:88c4 with SMTP id d75a77b69052e-50957e2c164mr143607861cf.53.1773631423545;
        Sun, 15 Mar 2026 20:23:43 -0700 (PDT)
X-Received: by 2002:a05:622a:291:b0:509:4db5:88c4 with SMTP id d75a77b69052e-50957e2c164mr143607691cf.53.1773631423052;
        Sun, 15 Mar 2026 20:23:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67a2dsm31696561fa.32.2026.03.15.20.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:23:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:23:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
Message-ID: <itszs6eu7l2zix4stdiokftgxjpqlfukbqbdg4u3sestln6pgl@yq3wud26vi25>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
 <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b777c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ndv8QXTNta43bgeejsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ySMcgLTB62KiMzz0f0Cw44oUO-reSyUI
X-Proofpoint-ORIG-GUID: ySMcgLTB62KiMzz0f0Cw44oUO-reSyUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyNCBTYWx0ZWRfX6B2kTsnH58a/
 5+8E7oDdpOU/1uIrxJapC4oFE0LqOj5HcGYqoAU5D8YWHIDfALyvGmKZypRm9vw0SX7G0jeL5kG
 8umbrVJ2pCa52DWEP0D4avVMCIFyHeZBlCtaVC0WcxABlaCOP4PIV+/pDzuiQmV6/x6HFCnqAP0
 wc2eTbYc+QgXkH4ka3EYncpeaHTq14c0/WyY4uu5pandQZdrQuFg99wWsECDfbQi1GxJlgegs65
 Wosxx4NPKCTfuO63jBmNxzP6lpkBfBA9ilGxyfGFF0DHGgf7bGoPtU0/CBIJRJHc8qbAyCw6RE/
 YbRwOCJ2uHQHtCNBaAz9Cye11G3UL7bdgVh21FznyWdeYFOVKbzu9khF+uK9aEHp3XHS48yZIyY
 RWbuQMa5rc7bkQWjPogmrqVuxQ4E+xnaiis6iANl5LNlxRFXBBIkbm4wFErQgGtSMdEQ7LiB0SB
 lnTH/WBXGLIabk073Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160024
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97829-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 15A46294627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 10:10:26PM -0300, Val Packett wrote:
> 
> On 3/14/26 9:51 PM, Val Packett wrote:
> > 
> > On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
> > > Currently, all HPD interrupt handling must go through the HPD state
> > > machine.
> > > 
> > > This has caused many issues where the DRM framework assumes that DP is
> > > in one state while the state machine is stuck in another state.
> > > 
> > > As discussed here [1], this series:
> > > 
> > > - Removes the state machine
> > > - Moves link training to atomic_enable()
> > > - Changes the detect() behavior to return true if a display is
> > > physically
> > >    plugged in (as opposed to if the DP link is ready).
> > > - Remove event queue and move internal HPD handling to hpd_notify()
> > > 
> > > To correctly detect the displays which are plugged on boot on the boards
> > > which use dp-connector devices, this series depends on [2]. USB-C and
> > > eDP panels are handled natively.
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> > > [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
> > 
> > Unfortunately this currently seems to mostly break link training with
> > USB-C, on x1e80100-dell-latitude-7455:
> > 
> > [  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
> > training #2 on phy 1 failed. ret=-110
> > [  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training of LTTPR(s) failed. ret=-110
> > [  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed
> > link training (rc=-104)
> > [  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
> > 0x01000000 when not busy
> > [  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
> > training #2 on phy 1 failed. ret=-110
> > [  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
> > training of LTTPR(s) failed. ret=-110
> > 
> > [..]
> 
> Actually looks like that might've been due to having applied the [2]
> dp-connector series from above.

Interesting. The series only affects dp-connector. It can't affect
pmic-glink usecase.

> 
> Removed it and rebooted, now plugging and unplugging multiple times between
> the 2 ports works fine.
> 
> Except unplug is still not reliable, the "ghost" monitor often remains after
> unplugging.

Does the patch at [3] fix the issue?

[3] https://lore.kernel.org/linux-arm-msm/177362655076.7429.3868048981197120360.b4-ty@kernel.org/

> 
> Almost nothing is logged to dmesg, literally I've only seen this line once:
> [drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* panel edid read failed

You might want to use drm.debug=0x100 to get DP-related messages.

> 
> But I have unplugged the monitor now and I still see:
> 
> crtc[108]: crtc-1
>         enable=1
>         active=1
>         self_refresh_active=0
>         planes_changed=1
>         mode_changed=0
>         active_changed=0
>         connectors_changed=0
>         color_mgmt_changed=0
>         plane_mask=2
>         connector_mask=2
>         encoder_mask=2
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=2
>         ctl[0]=1
>         lm[1]=3
>         ctl[1]=1
> connector[38]: DP-2
>         crtc=crtc-1
>         [..]
> 
> and the compositor thinks it's still present, I can move the mouse to where
> the screen was etc.

-- 
With best wishes
Dmitry

