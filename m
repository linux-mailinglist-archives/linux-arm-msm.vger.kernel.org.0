Return-Path: <linux-arm-msm+bounces-96346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDo2CpInr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:03:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3B240950
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F425306777A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF6341B361;
	Mon,  9 Mar 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8C4jeNW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8DL8RF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93E413225
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086348; cv=none; b=oKF9VUAbjDAGXhrz43r3iqigwoltkqeUzQbgpHbUDnVaVa0AKonWaEQWHGSSH52L4h+o2yYSCEJQKbK4d6Dkf5omnuTEBCupwV3Sm9GL9IjxxxCn+iWoFcCy9LRnXRJjMpsOhxbGLfSbR1nZh+9K+0LEkTL3ltvXQYe/ZkjVJ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086348; c=relaxed/simple;
	bh=MyHbrx/qWqK5uSPkbn1NO5a92mbqI1B28o+YmukQqS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pesdki5ubSAk8j8S2ADZeJoL+mIr0zAr51t8MEraJcVzESrb93JNqE4c4GLj5ncVlgHZht2Q1CEpQl8uM1Bni+rtiu+vO+z2V+1dRRTm7Vuf11SMsk3QT8SeHLad1IlacFWEiTKNqLfpKwkcqw1uBPOjtpGAT876js+ieZi8wQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8C4jeNW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8DL8RF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JG3q32872930
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mIoUic/ArDby/rEar6KZzxq8
	OQXv7K+uT63AuQr9DIE=; b=g8C4jeNWn7PzEIjNKCHjlS3JytmuGSIMPwH0pBo3
	CPzHFs8qagUNompx7BXc0RIDITKUjcT3enPh7SYVDKjeGnCbWAFO9+PqJ4Cl9HuC
	TUbq1a05wKS9zHCVhFai5Tq3Hoem6Ic07QNdZn0c7TwP7atzoli3Y0d529vN7jkd
	XGCpsh4WIq8wivUrRZIyVtnhxoTTWYhPBUy75T/yTSNMZK/zY9zVqJf/clcNhyZr
	XEMuHXHef5c0aiHVGs2T0zhgb7iU837pdgopiVSnD3ZsHodzsfnYSSKiAN/vcPXw
	ryB9irDIVUBrxZC5rFrUVtMWhmfmy+EmgUM7m13wJAbsow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477g4c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:59:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so957908585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086345; x=1773691145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIoUic/ArDby/rEar6KZzxq8OQXv7K+uT63AuQr9DIE=;
        b=c8DL8RF0ce8BUcw6nHUVNfWU4QxF1EjTrQeJKjx7/ZjP1GQMa/cG5an69wTEcgirsZ
         iOO3LcJzxPZxCE9B/tY1XZDxRW4O1eVyK6jSkQvfOEnrJO21jSItkIfVpRT/xsEKOC5e
         e0kD91d2P3eqcFXAnB64A46nQbhxIM92MLTZkJAq2KMmL47FonE4qXek10hoPBHrtJLO
         IPxEZ68YN8sVgOFPHLAL9kLF/+g64IaYW9YQxWMBmOtTDDGsLHdqbZBZ3buU2XoyRwYF
         oTolssOWcR1YLmwismmdiTPH1sRQwhzXdxXmjmSUjD8mi8L/Q6u68wu5E2SyjBKpL4ct
         WodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086345; x=1773691145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIoUic/ArDby/rEar6KZzxq8OQXv7K+uT63AuQr9DIE=;
        b=pHNoT7rL1+I7sknLHiGlQKrm96b3A4UMqPm79GtxBkZinCZnBu/wA54VHWxQWffOBx
         rVJcnvnFh2xqr9rRO1dy87V18qBXYXX1xlogQk/BsH2DjDtikClWX7m0LKYsE8x7gj1a
         CBst/c5SOXVV4v8hF1b0n9CQd1X4yKhVvIRUGLw+By1+HWIvRW2/Gv4etzo3KsXTs0m5
         6pRDaNL6WD5UJnnBLP/5v0n3r/KrXjBrtYdnv4tDcsWnX0LcXb3rTYtjwvqYHS/v9ghc
         3ko92s5dhyPBtBfm4ZoiUeJf6Hye0a3yU0r0fSoLpQX171oeupLkXeLVPV9Bvm+KEkxx
         sOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YSCIGIVcGSnpRaXOT+Dou0XIgUKXiCfwJ+ZUcIv3UwSBVCDr8FnLL6ANTDuv+5wPwW25OKLT+ZhASKCT@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0LrIlnJsTW8mxGSsudrWtTqMHV6hbsUH55ceGUGjU93hyrvE
	cAOESvcHpomGpV/qXMWJXHteBXYqzlju5rwbQLMiPgIyb4xrCiPoysIU5Blf7ZYFMFJiHffgNmF
	We0H4gYmV+XYcR0pNDmMkq8sXr867iQ42ZSRhglCRDcHsKJ+1n1/gs+9ymEaO9ntaKf/R
X-Gm-Gg: ATEYQzxZ8OxUQ4QQNFHGLOYZACK2MFs0iYfXIP78mIPPo2UDwFMb9aE1NHCFyTyU4xt
	Xjg8ArcxMJDFcIQ6+t8fk8LrJuxKHwRseUFf/HHXU+wRexUCDPEwmGCRhrRDeTACpMiXfNw+I7r
	eJGTlj8v23LJxzGr4Zh6xpKTmA+t2O81NcgKMzeokTx36cfiLno50z75sZZb0W0PTuVD/EIgUZG
	aQdLqIe4txOWfBSIIxJIUQS9YUiRBGGFFQmUdZ6Cm+X6Kx4cEaS2NVJnAKV4Rl/5UgbYdoh68gX
	sea3nFYFWSvuMowe98obN9klMZojMHc0mKLYMUXhCvU4Y3DJkeeeVTrPCUOmMJ76wFvNoG/yynv
	Z/PCSnlvEVs7zLKVwlY4Mzj8kh2VmzNr1X5V2zoaWDoT1kmFRKsaPwQSxNmIVNEFi27NaEwYyVH
	s01kRsKcyWqc0+iEx146k/sU/r0vvTFuWGuh4=
X-Received: by 2002:a05:620a:7013:b0:8cd:827a:2abf with SMTP id af79cd13be357-8cd827a36a1mr857658585a.64.1773086345155;
        Mon, 09 Mar 2026 12:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7013:b0:8cd:827a:2abf with SMTP id af79cd13be357-8cd827a36a1mr857655985a.64.1773086344665;
        Mon, 09 Mar 2026 12:59:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e015sm2393313e87.46.2026.03.09.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:59:03 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:59:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
Message-ID: <iwde773odhwjzfw7uzugkh3pl7f422lvdph4k3ycunrlpctost@fdzvu7waf2rr>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OCBTYWx0ZWRfX91Dz7eSJNRl3
 Kva8DbJq5k9CG2Cz4CEBxnaY1Dd+j/HtM8SKkrLUmxypBiX7Akan52SfC3fCl+vGqrQvIezn9au
 0eYSVOJiVCOjMTcMfhIqacU4HREL1zLAPxnS2RTVVjdbzdmdKbnSMN+MhBPkCwUbnzZJylrM4er
 Jj0306yhp9/9EjmaQIroOTPkNIHooSDvMLnOKvU9jOli6wM/rhZKtto3e4K2B8oBwk5se3kBEh9
 cG9MdK+ldRXvQN9rWTrAtesLcaB4nhb5l/ioD2sR0buoYwTNpDzt+idljr3FxWbwE14UXiQM8vx
 +UvT0LextbF7GAT6q6zpwTcciIrdh2sH50l8tThMlL3Q8RZUyAjO2roLLIYIA2MpIHBPuHlDEwf
 +94O+eJLFheT/ToahFTPT286TILGiu2NIbAsDbUbZBzdfGsQOwqdrW4+NEAnHTGj6wHZPr/ktCx
 2y6CB+Rx1kZ9BcA/qGQ==
X-Proofpoint-GUID: i4pQJQehRObyP2XHIxCRVpcb4cfJ_99O
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af2689 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=2i3PJfWd8q0j2ReteEEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: i4pQJQehRObyP2XHIxCRVpcb4cfJ_99O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090178
X-Rspamd-Queue-Id: 94C3B240950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96346-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,patchwork.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:45:34PM +0100, Konrad Dybcio wrote:
> On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
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
> >   plugged in (as opposed to if the DP link is ready).
> > - Remove event queue and move internal HPD handling to hpd_notify()
> > 
> > Note: eDP is mostly untested. This will be sorted out before the next
> > iteration, but it will not affect the series in a major way.
> > 
> > Note 2: there is an issue with the DP connectors using GPIO for HPD
> > (rather than using the nativate DP HPD pin), the DP will not detect a
> > display if it is plugged in before the board is booted. This is not an
> > issue of this series and it will be handled by a separate series to be
> > posted today or tomorrow.
> > 
> > [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> > 
> > ---
> > Changes in v4:
> > - Fixed PM runtime handling
> > - Fixed several cases where the HPD machine would loose its state
> > - Fixed the case where detection was ignoring the plugging in display.
> 
> - forgot to run b4 trailers -u

Mea culpa!

> 
> (no worries though)
> 
> Konrad

-- 
With best wishes
Dmitry

