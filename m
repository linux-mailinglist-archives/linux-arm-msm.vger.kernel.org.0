Return-Path: <linux-arm-msm+bounces-118613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id np3FB8woVGqwiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:52:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BE746489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aBZlC9PP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IqNAFU2F;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83D5300C018
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8E53769E6;
	Sun, 12 Jul 2026 23:52:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171922DC32E
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900361; cv=none; b=ga3e8KhHvAZLIrLwNO5rnarbd9ba6xqR6j8OyXAe7KGTE32bVueesWdQQT9c4phPhFyj6j8KYx5w4GO5iJXoTGgdOuPoM6sP9U0BnlgklP6qpVGmYBZr1XfM+Tcdg4iEm9ruJJ8qxK4UNPbDY3vCa4FapMBOwcv1MdkHo5wOmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900361; c=relaxed/simple;
	bh=LNtLtof4HbwwM8AWTyx3Qckf8936c2geSLTC1W/XLgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMKURcLlPYxakNopPN9AK9J0vVQh+aXnY/fxT8sj4cUYMU0bZRFTVKMQrEZt0grrLvghozDG+yyhjEKtPdUohTKMzHP+wsj++23QUzGnFS1+F7kUWOSXbqOQtBSwSL+cIXS2psyo4+kyq63SRfnA8mb2+F84eSWlcxC2LdczpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBZlC9PP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqNAFU2F; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNUFLW4022251
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LxCHll1Aw78l1lcAz5g9/ywK
	BDMmON6JBEpVT0jGNq0=; b=aBZlC9PPWqL67IOxkDDTi2mza7EwcV0nf2AMHKoF
	mDq5UoVBJDh/lPhYX/irCs6CiHMIWwf4zYROhH7KMKjT6L96Ic8yK0N3/JlIQgfj
	3Xzfw3XYixQMb9HCsV7UfFzrkrrksDpFXUUqX83kmX+U4tAC0OijaAAAvyhwmitX
	vOamfTII84DKi6+TpqPlV7P3/YSi4tPU45P/eokm3v4KvDRpWELe6KXElmAEw/AL
	fwt+EZMIOCLP39EgigYF+NDnangBNt47XRqVzp9nCQZC4yAN+6Z1QcqoqvhjQiso
	Qr6QboCADCVjQBYxeR3msZ81sb3oKNNC8UL1ZwwmeDc8iQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn385x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:52:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso26465166d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900358; x=1784505158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LxCHll1Aw78l1lcAz5g9/ywKBDMmON6JBEpVT0jGNq0=;
        b=IqNAFU2FIxQQrDTM6OyQFd+ppJDX3dJTA50r5qUz/Wm2WPf/FBMA3j8EGLYt7qPx77
         sJMuuRROsN1OdiNlo9Nbs/OK3nERVk/K5g9VsUcqe0zGULv0Z/ckVzSXQn02nqcbumIM
         wWw//6SV3Ma+eOn5H6gbNGKAC7gGXOIIhIktuHvO30nz+NF995d3bABr7xVjxckrUjq6
         rPpgzqUTfMz3T6OM4hSisdbMauabUNxdgLOQUjAt9j2Ilqyq7W0bgLlPy4PfbFdk6Zc1
         J4Jo7GRUDi/dJe0Oal6ZUxExjInbZ/ocohM59fMysqmGRsK2ceW8l3zuX5zsNG0ZtGgH
         Yzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900358; x=1784505158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxCHll1Aw78l1lcAz5g9/ywKBDMmON6JBEpVT0jGNq0=;
        b=Hvi4JQrkMvteU5Y3XtW6KUY9ExvBoTKdSymTrsFgfuH+nsM8M1H3xkVDcWKXjTtmUp
         d6zO26sHysq+Gpe0gP9TIUeroChUmtz91cY+WDwkq0gpQbuWHEZ7Bm/Ol/29rlf2zqr2
         sRWRSKTAH+pSqK/NG5j/KconYpEDxZXXOGIFL2V/EppjM5a4HPpKfRrzAmXaOr1UQxev
         yN5LBDLl4p3cKwuwPZgUQNyq632K1JyudLx67V9lhjM0yzpCTvorzPXZg6ghxOaytvLe
         wnN+w+lEjU35WKOFML2L0HO/f1EzcPwYTYY96zdUdX96ZQUl3YPfi8x2uNb7Vruf+tbT
         7DPA==
X-Forwarded-Encrypted: i=1; AHgh+RpAUvBvWhAYb/B7Yr18Pt0T1+ByYdSszsrmnr+P0DY9pr1nueFmYAweR3Foe/R3j46rsIgjHVHlWEgM3I3s@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4g7x/Tz91yAweoHhQlLkXtXbTwzOKN3EwpHtohTLwPF8acRe
	lrFrWGgqIPGG9uCfsHWp+WiLdBavanbyG1upLEw9Z9e/+tqsE2pCHawG8J8bAVReyde/x3P9xuA
	3KcRUy6bGEx3Gx5Df2jmxQff8k5TpUCD+MJvdiLGrequH8hT8oy42rvmAFCfZoPvJ7jCE
X-Gm-Gg: AfdE7ckX68lXDiLZ/32Q1Ww3DWpQtvwrHO3JU/C5vc3O5wBim6IE7W4RTutsUmkSRbr
	eX6Nc/OowjcMO9maWVt1oIcywbbZ6EGtzlx/yw6YMOU+WeVH3Fky6BkFGvBo4a7W6z49Fb5RHdA
	JaBZN73wgPm3dEQpnRlW91kmhpcB8hCuzIYhV16T25PKoYkHBodpF8xwd0RbWGjxLEYr7APviBq
	YTAwlBSzi9DUIzh3pta8jnNDdEDjAnX/cNpCI629yuZOXRed3pDEbNDi1YccyN/qEH1yynQy2Ec
	T8wzyDnVYfmU+nAlPesryUJR7K4qYbpzMyR00ssZ5fDSYe7hbswhxbhmCDkJeGzSYCDRv8Dvbra
	WvnNDr3KambUmXyTb+Zoz/rRHCBctdjriIJeIGGeKFQ7iGIi48qxaoeDmqms8CCMS054HYfNhgJ
	FMGz6iRZKl+LbxlpqE07Ds0F0M
X-Received: by 2002:a05:6214:54c3:b0:8f4:6909:2a22 with SMTP id 6a1803df08f44-90403f494d2mr77299606d6.43.1783900358264;
        Sun, 12 Jul 2026 16:52:38 -0700 (PDT)
X-Received: by 2002:a05:6214:54c3:b0:8f4:6909:2a22 with SMTP id 6a1803df08f44-90403f494d2mr77299316d6.43.1783900357772;
        Sun, 12 Jul 2026 16:52:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm2441846e87.62.2026.07.12.16.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:52:35 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:52:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 00/15] drm/msm/dp: Prerequisite cleanup for upcoming
 MST support
Message-ID: <4kiwp4uec7hebailwhgxqkansskg6v4msdnt55vdheqdjrcq2s@jjer5jiprygc>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
 <b05487fa-e282-4236-8f10-016e7ee4dd87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b05487fa-e282-4236-8f10-016e7ee4dd87@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1OSBTYWx0ZWRfX11pColzVvvNO
 R2JhFCHJRqB9WMIsN80ptj/F8NHdKjsv7/e1DH+jx7CCvqRWM6Bzybnpog18ZO6iRNoXTcHUMLt
 630Oo4zmmGk0Q5miefoBDu4yzgaCwL2vvNAXLlN7Ub0kcTWSsv3ZB7Qxmsea2A6qsEOKhTy38tC
 pauYyu90cmcYBdiXhL3WrcYp3PMklTZ6KH0juX439gMqQrKBphpuyK4O6z1T0VlaR6b2pjqjoWM
 k7VO81s/AGztGQA7WXlTvWndjIOEkQlG00ryHj/GScPSSoANB259KIgNVc06Uogri2V+jmwtFCt
 3QLOeTxsDVPPiHNHMgQldji+eK5mDQXf+hy8w+4tL4xCRRAAO6S4i3+Cf3fpnUqBwvRBUODCMbd
 AMChW5AH6c/Pv5Bm75ykEV+CYIoqAwshmak6FzSTpd4Q82K2HkhDjusOowiekNRGbkDMSqko+8C
 ZBxRMhPsiyEg7ECNU/Q==
X-Proofpoint-ORIG-GUID: d-yZOziT0SG6scP-El-qiiXjd2pHn9rT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1OSBTYWx0ZWRfXyokrHT2Lrvhk
 S4Q9c9ShJJh5m3aUKIilhRgGdREY9MKIDOp74gEgdvqrEAl281oy9pfS5yyB44g4pbe6ChRPy0Q
 h2e3lyUv9SUgDy6gAqn+TGM6k94Df7o=
X-Proofpoint-GUID: d-yZOziT0SG6scP-El-qiiXjd2pHn9rT
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a5428c7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Rg_EiSDVbbziMxJWx04A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120259
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118613-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,jjer5jiprygc:mid];
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
X-Rspamd-Queue-Id: 5F1BE746489

On Wed, Jun 24, 2026 at 11:16:39AM +0800, Yongxing Mou wrote:
> 
> 
> On 6/9/2026 5:46 PM, Yongxing Mou wrote:
> > This series is the SST-only prerequisite portion of the MSM DP MST
> > work. It refactors the existing DP code paths so that MST can
> > plug in cleanly in a follow-up series, without bundling the cleanup
> > with MST functionality in the same submission.
> > 
> > SST behaviour is preserved end-to-end; no new functionality is added
> > here. The intent is to land these refactors first to keep the
> > follow-up MST series focused, smaller, and easier to review.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > 
> > ---
> > Abhinav Kumar (6):
> >        drm/msm/dp: break up dp_display_enable into two parts
> >        drm/msm/dp: re-arrange dp_display_disable() into functional parts
> >        drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
> >        drm/msm/dp: split dp_ctrl_off() into stream and link parts
> >        drm/msm/dp: make bridge helpers use dp_display to allow re-use
> >        drm/msm/dp: separate dp_display_prepare() into its own API
> > 
> > Yongxing Mou (9):
> >        drm/msm/dp: remove cached drm_edid from panel
> >        drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
> >        drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
> >        drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
> >        drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
> >        drm/msm/dp: split link setup from source params
> >        drm/msm/dp: move the pixel clock control to its own API
> >        drm/msm/dp: simplify link and clock disable sequence
> >        drm/msm/dp: pass panel to display enable/disable helpers
> > 
> Hi Dmitry, will this series be merged next cycle?

Hi,

Would you mind responding to Sashiko reviews?


-- 
With best wishes
Dmitry

