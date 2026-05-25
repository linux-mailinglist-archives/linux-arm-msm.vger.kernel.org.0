Return-Path: <linux-arm-msm+bounces-109595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEOjGfUNFGo7JQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A05C8251
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EF1F301642A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A603E6DCA;
	Mon, 25 May 2026 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAtKmecL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzXeFJTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4D3E51DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699079; cv=none; b=mwgsx0CpcUUFf6EK4hB3kAAXUMJroCcnlAxAiUL0wmaXJyRkaccQT2KJKCb7QQFk76bSrdWYNX0NWMxOxmrML+92UkF40AcS95ZVZlNgZ0ViE6slCW+Qsp5Zq1ik9mW0xZ0XpsvMprXlzBY2OjaIql2l2tLwVGvXywNmSmK65ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699079; c=relaxed/simple;
	bh=rvEqFavA/cffNfjlOIPINLZ+ptQtgnXiLHik2uSQHIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc2z5Gru3Zxlig17o3j4TGvAGX9PSMwsT5hNpv+8rMQGhOuCUNJT7qVcluNK8N3nI2OF518QKAYDROh+LQsoNWk5Q7keqwaBgPMDMYOFGpEF8Jxaf+mFcNnIcUwE9QMHGKarjL/uRI8P2E0J1SBjazG0QHVvyBe9P5bq+Pgkt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAtKmecL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzXeFJTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P74NDk2024296
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gmzxJUdNmgwbMgi64MvkIm+S
	WsTqXZ/RU/qirTOp0cc=; b=AAtKmecLvPwfse8fV7D2ns0kwnp5xFTRiRI+lf58
	qBNKAY/XUF0FFcMY22cv5vJdnF/1y2nGv6HdFMWmrZNLFDycBu6b+4lhDwZ7iVQt
	M8Jgx1XMfu2TIBojhv2TrHHCfGjz3uSkSP6YYAR0qD28lep/De70zKV0dOJfmJgb
	2W/Wjm1CvXIEetbsKpREllh5BwMKGRklqbO/izz+8pDfyJ5ghOHjaj1HEnmqZ7WB
	6c3dAQUV6M/4nN+2xU2qFjj84HbE8WWds3/1B8YsTrcvRmgdv8YJc97RcNt1uf9J
	VjoRfrHTXQ7+d89IM/Uz8GGny+Z18bTKpMe8rHoOzSimtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w3bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:51:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so239689511cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779699076; x=1780303876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmzxJUdNmgwbMgi64MvkIm+SWsTqXZ/RU/qirTOp0cc=;
        b=PzXeFJTUJIZ/6Xin6BjeGWMfWcoHuo8Mtay/dAIVi/Cdzdn+kJjBJdF6Hb31m7pWvK
         iFoSVZ9tqy/MDY1miugZ6LAdh/bURdpgVnl88gd925HS/mMjKnEJpZAREnVRjX0uC911
         tkFg9cVgF4a9qNY1wlWanH0opyblcOD40smVmRR9jQLDiqVuyrk9fPVidXflwse5HBJg
         5nIT6XZpaUE3QepSNez+rXTSe2xtAQ9W37mrJN0pNWrBYKBHv84TUYyxE/b6wSBYCI9O
         MaCWhtye6ZDsPVx41GPgAaRlaj4boAHlbQ0Z/IQKksuvXEcoly3Kf9RipA0OYoPy0nwC
         hUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779699076; x=1780303876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmzxJUdNmgwbMgi64MvkIm+SWsTqXZ/RU/qirTOp0cc=;
        b=G1Uo1j76Y3CFV/pugN0onv140W3KlDUR/SPc2vuspWjcnD3Z9u2RQCTTZGe4PHsSYC
         kIPpZt5xGx8bt95mNjP6aPyXKdILlHVnd6JdZf9BeKXiMxzRlGWTCrsDwzgjUxoQqGfX
         qiyIPsk5gTAoghS/TTBvYRo597PxhNXLYaE03UlLQOVP3S+bm/htIa394tC7M4H2Vqls
         fXcKJ/CJ7VqIuPVEAuA49N1/VNBEfaJM1ImkvffpRODvihc2oYfRTM6acCNxs9Lp3nQV
         4eIFA9hnB7/6IzJ9Twou67llgTz4QKyRemt54wm1CeZh4czISdZ301fRRl6gixWSdvAd
         toyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UkiavVZkA5AExClrgSjw/v0sai8j3S+Rn7ssupXIreAPGl0mHSXarQvG2PhRYr+B8BePSin/IttcIJE8R@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNXmEQaUTTQTPccwOYMXIBCTLJztsBA1eOJrDqv66FXHQCCrL
	S4BP29+yVt0xKKOkDuPOuTZdmF9WB4BVdB8hlpROW+St95qxwdh/e54E7ko0t/mr3f3XvQh2Kdk
	qtPv+8r2geKRgq2YC5y/YKX4LQuJ9VjxQrjkJgJpQ/nK6Q+vDlLyenGTYPZE2J3MTiNgY
X-Gm-Gg: Acq92OH+iKcKiirpCAlNv7MRSwAlaAFHDkWESytm+FnMaIsgQF8SeJBLKl1sZGPek+7
	bXklNMBDymunF7QaZoGkvV/I57Lj/TUvdTVNmQXJQdid3ruIjPErU8V+J7/PCE59VQ1AWjzVEm9
	NdGiKeFRzMn4jSs8xp9ltq00gk0juckhnxeCdb0iwPZ9MYx9E3jHaCR6MomlRHQO6spVoSaDWEw
	M2t0557ZRixnDXE5ynBLcoFr47/BkPW7oOoFhzegyE/lwxvgj0DAdi4ekzBoGKlWwBBukzXOLw2
	Fr9aIBeygMGVTsobXATg2bJhCp5/+6YH2eSo0rZbeymc3ArkR62N+Joh76Y34k+7wmCX2XUJZ8H
	0f26WQglmgoJxnBPU8MwgTya2MPlSYnlxrSIMAgv698YU1gGcIdALNqTjxpKVGLeUAd9QKsrNv4
	iUbvKaBSlK5Zlpyws+IhSuvWeLicByEQwnQMo=
X-Received: by 2002:a05:622a:8d11:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-516c55d2762mr178735741cf.19.1779699075740;
        Mon, 25 May 2026 01:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:8d11:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-516c55d2762mr178735661cf.19.1779699075310;
        Mon, 25 May 2026 01:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a4d8sm21522551fa.25.2026.05.25.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:51:14 -0700 (PDT)
Date: Mon, 25 May 2026 11:51:12 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v6 00/10] drm/msm/dp: Drop the HPD state machine
Message-ID: <kqtiqyb56yauft4ajzeu4tkfx36eby2hz57qzl5jtkz54qke7s@fwpoa6a5zwax>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <ab26ea90-5f28-4582-8f82-3925471d917f@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab26ea90-5f28-4582-8f82-3925471d917f@packett.cool>
X-Proofpoint-ORIG-GUID: S2arAJV4qI9LX08-iyQ1BdnObqeRWw39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OSBTYWx0ZWRfXwwLoVx3MhUBw
 15uCkBCWv5OPJv43msu8lEzKRQxKdXtY+m+TswP/kFBnxCnla+SSpFMgFOMgUpynkd2WiCbihkm
 pafaHwMT/wN40bMfWbhye3mIdVfe6IXsl3UlHo2s1QgdgsyYtdsh5QQtBDwppGHT52XiVYsbTFG
 Oexf+VxXk6hCHL4KuCdKCPKVl2hLSfyY2n4GLdnC5ykTCYGGtJFcX2k4pbZiKHYm8Jplsn6aTwT
 HOCCqSzVTBGgVLgvAqdJjOYh/9fIN0z5yBeS4xD2DD2ir/YLeCeSloI1cHBrMKKtzopolUVLVam
 XyrpZMOHjb2R6t04krVCzFMNXV6eq9eSRdRXAPZd6efx38JkcXa138lC/YXJSaU7DR7m+RHGXCc
 ONGhRbDN4o2Cs3SoMAD9O09AU7Nmm/At2WGuvGeBfWn4sRitEheog0HBkHIXvh2LdXMLx3kklXz
 GHqOUH4oPApIQdC6n6g==
X-Proofpoint-GUID: S2arAJV4qI9LX08-iyQ1BdnObqeRWw39
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a140d84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4TE31p-vCBvcHHLj6PsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109595-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 085A05C8251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 06:32:18PM -0300, Val Packett wrote:
> 
> On 5/24/26 7:33 AM, Dmitry Baryshkov wrote:
> > Currently, all HPD interrupt handling must go through the HPD state
> > machine.
> > 
> > This has caused many issues where the DRM framework assumes that DP is
> > in one state while the state machine is stuck in another state.
> > 
> > As discussed here [1], this series:
> > 
> > - Removes the state machine
> > - Moves link training to atomic_enable()
> > - Changes the detect() behavior to return true if a display is physically
> >    plugged in (as opposed to if the DP link is ready).
> > - Remove event queue and move internal HPD handling to hpd_notify()
> > 
> > To correctly detect the displays which are plugged on boot on the boards
> > which use dp-connector devices, this series depends on [2]. USB-C and
> > eDP panels are handled natively.
> > 
> > [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> > [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
> > 
> > ---
> > Changes in v6:
> > - Corrected mismatch between Jessica's From and SoB emails
> > - Corrected documentation and fixed style comments for
> >    msm_dp_bridge_detect() (Bjorn, Konrad)
> > - Changed msm_dp_bridge_atomic_enable() to bail out earlier in case of
> >    link training failure (Konrad)
> > - Corrected commit message for the link training commit to stop
> >    mentioning event-related changes (Konrad)
> > - Added kerneldoc to msm_dp_display_host_phy_init(), describing return
> >    value (Konrad)
> > - Switched to guard() instead of raw mutex_lock() (Konrad)
> > - Link to v5: https://lore.kernel.org/r/20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com
> 
> Looks like v5 is already in linux-next.. merged in:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4d28d7f4c69895437aeb0337d5e8d3dc2a5395cf

To be replaced by v6 in the next linux-next buildup. There were comments
(and r-b's) by Konrad, so it was worth replacing the series rather than
forcing v5 through to msm-next and then drm-next and then landing
changes on top of it.

-- 
With best wishes
Dmitry

