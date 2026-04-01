Return-Path: <linux-arm-msm+bounces-101327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN+YJ2YDzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:37:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA637995F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E03E320A50A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00083F7E77;
	Wed,  1 Apr 2026 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqKpW5tZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb9uOrZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F293BBA0F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042858; cv=none; b=A42omrRZPCsXEmadjQgumA5HM3mMJ+uRW2s57jRikl3sKEWC7oaBUKgiC5E0a615jlQXp1ZFZkPAhKv11UnhphlrbMsxwBOANbVQLYXAFQBRlXrPg6CDhisb3gjlRZGQnl/aCtaPEAj2NRzj+LMSFoJ8RW+K8+voJbaBNS4cbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042858; c=relaxed/simple;
	bh=Gs86PzBWq0kxklonYLIWBQVLcFIXd3jBz2JNEAH7u14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVpFRKACPAXu788LrQ9eVTtcUKLiQDjYf5Q/yNDgQSN81V3mMe4ZaJlWQAFG0kLyahyBYQWuN+pMoTb/F7ckbdgRzxIYg+7L0oHm/hjGXPUUtXpIlsYcsT5E+A+iSv5mDp8oD+W+rwXLZNhO1hVwJBjdo+ynW37nyYpPmYiLSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqKpW5tZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb9uOrZQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ax9C3081559
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ipd2vKhrN5XkGoR9YkEuFCKpmd3gdczApniBQosBZq8=; b=aqKpW5tZimAU9hlM
	Kz+U6dYLcsT8oLExCsebqJAD2w8rQ8chMO9sCbUwv9UbOQv5MiMg/oNbZv1nG5XD
	OyxhafDBLr53Na2EdmLa+wTVQZu/O2JZFxk4Yzm30ircHYLfI9mQcs0JxzF2nKaG
	qg7lfp1Nye/MAJdgGcpL8kL6DUxfml9oI2OQUNnHBFQHAOlECf0JNhJuUEniZq4d
	XQybb2dqQHLqdJliAnrOoPWhak+Un6MQ8YrXlJhnMEK0rq5ayhoX31PQRzqk6maa
	xJk3Xmh7/9S0VLKvB5KouXKXXZj3ZPZuBoMRi24RBcmtIpk6J1uHa57sDSSuNifz
	pCOR7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkusu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:27:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so346202061cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042855; x=1775647655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ipd2vKhrN5XkGoR9YkEuFCKpmd3gdczApniBQosBZq8=;
        b=Tb9uOrZQaoSXbBtnawFhHi67Si4vyURycYIfjX3ZqH1bltrnrz9Y8oQbY0+lGxdi2M
         g6wo33WKJysUhi+Au8wrrrKpiSSn8KKWK4N7Vq1rsOi8WVb3lNSnCwDCoFH6YeL9umZU
         py911j6oBhRypnaGnC/OrAF2F4ZTiTYeMv9Txq/qN+7tTWt2xZYLhjzcyKD4g242mhiN
         RFeXOts7RbOGAT74oMcXrzEM8Pg3CDG9nCZaPDXDH+iknc9eQHZCiIyKNLTwbrkBzqaP
         5l2A49nT5wHOcvsqr9Qpv+rJXONBvjNgZbB4w0YLiPrjurs2BEHprOKibm+5LZbP+7nj
         Wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042855; x=1775647655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipd2vKhrN5XkGoR9YkEuFCKpmd3gdczApniBQosBZq8=;
        b=ZyCWcK7HQtd3s7JDCAXO13GaCPQXT5+iRCukBLWtWFoXeS93+5UqySP1e/+rYjDPa8
         X5NuEdE7Qekqpqo1z3Psi/fgLTzsvTcPrOKKBqvz28vA/d+n/4heCaHQnVxaT1tz8+F9
         cG7AY/Prsm703Q88ZfqKmv5KNS3shQmkjcQqPlQ/R03ZakNZaIdfbuQQH5lwoOzdW/YZ
         hp3RN4r0DC43a+g2u9azqpMYRLDF7dOosRmUDxK4cLiz/BvcYlwqC5HfbmrHdxuqrvUm
         ekPAp35kdF29DSu2q8xL7VHPDsIpxr/cvnmXiuw2IYgiObq9roAvoI91bodMPUlS7H2X
         SMCg==
X-Forwarded-Encrypted: i=1; AJvYcCUjB7mz8nD4saFPw48t25a+Ka/NPGpFIX4C2N0xgYWOGFimWLZ8pkXUIhgu9s5vDBcyJqdESMoccKRzl4W3@vger.kernel.org
X-Gm-Message-State: AOJu0YyHH3j+fqbuQKyyysGYxOa9AJYnBLXVVirJUCO8cDYqKQDTnELZ
	Q1r7q7256eVRnjaUweU8UQV3RIQZeliZ8dNqOiKXEC+T5aWMOsmY9xM/Vs1Ea2Qp1tbJrUuN6s8
	fJeCf05hOi5FHSnqc9F2j/yIM9GNkFrOwYuydPJUzNlqyaY3GbkGYqezZrSYvszt1pCRt
X-Gm-Gg: ATEYQzzpSuHcE2HcIF2ZiMUjrfR9qEs1UFgh9IDyGhGlvrkf7YTAwfGEYW2VkkRWxlD
	iRhfGNoaZ7x0bqwy6oQyyxts7UE64QfWK+qMKB+CAEn1iuLt9Q6IovTH59Rrf2+GgBTtkfBSgs/
	qy+GoiscMAbRd6qIUHy5e0jsW+NUqzu3jeOOUD36TZR+rLNEJFNdvOwpWdVx3O9LlegC03zm78G
	dpyX/Ox9HTtqvFHQ4m5CQc+j7NLYr44OGeVw0uQJTn+ESvOQZGc9wRczOzMelF6b346fpEF4q/c
	AWQYXkUfEp5iTiH9qrxkMLE7Kvf1E0fzv9quCk56fqXpPFDwVgnQgIC6fZJ3JQqeT3LtS0Wdvds
	hh9Hx4/wJGv3bqNGgs0jmiCZ12odnzWOTTxdMG+dwLWlvNjUyRceMqEWCtRAWYfa8LIP5i4xgOH
	QwnEGyWHqAtr/I6SEPBZnT5oa/jngJ105zWAc=
X-Received: by 2002:ac8:7dd3:0:b0:509:4198:5468 with SMTP id d75a77b69052e-50d3bb5cf59mr45856181cf.8.1775042855462;
        Wed, 01 Apr 2026 04:27:35 -0700 (PDT)
X-Received: by 2002:ac8:7dd3:0:b0:509:4198:5468 with SMTP id d75a77b69052e-50d3bb5cf59mr45855761cf.8.1775042854995;
        Wed, 01 Apr 2026 04:27:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c65556d3sm7736e87.64.2026.04.01.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:27:33 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:27:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <4rhd6qlj4jevrnj2zqctqrcbpkvcalk5qmr3ryuk6ewwa7e35p@o7xzhuzfsms2>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
 <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
 <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
 <4cb29e7a-9a75-4f8a-9036-c96e9190b7b0@oss.qualcomm.com>
 <fbca1547-d54d-4bab-89b9-404d97c3c08c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbca1547-d54d-4bab-89b9-404d97c3c08c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNSBTYWx0ZWRfX4tYqJ0FQxLp2
 /3op2qV42AgPO15mCoyha2tFjVLM9Rb2tAo6Pg7+RLSBVi1dQ48SAMK9I23Bo6ONFO9XMCDvwia
 sDOY7lDByeeofXFsKwlP7jEJMwcxBwLRqdEaIgyh/A/WMLYvYbG0j2KiKFWOKjVJjqqdOowS0eL
 LY5J6qU+Zq+oaMgm5HvIuKR1rPmaNkdjNwlSev/U1iWZI5vU1exKDTfSBiav1CFHGL4TzU3uaPp
 WX1/E0eoC0z4NxGYe3JmBNlWnO/rujqWuAxfdysyaGpoA2Ggl/ncgZu5ox+ewDVNUHTNGQX8D3g
 KF255v55DCQelZKXK6q7ZbKXucxZ+EFqPA99caQh/DkljyyL5e+TU65EbTeAipHD2BEPxdXxByO
 c057IdPRQZB3u++zOMA8Z9idSJmNyn71iw5HD/YefZEpExLE4PvsBbTYQ2B2weTzDkEhHijaSIy
 si77IzWBjJ9PW/XBJOg==
X-Proofpoint-GUID: zhxmfOLA2_HwsXrrlGZeDxUWVV6XtfmI
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cd0128 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2NND0KS8ewDzaUtktxMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zhxmfOLA2_HwsXrrlGZeDxUWVV6XtfmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101327-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EADA637995F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:55:32PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/1/2026 2:47 PM, Dmitry Baryshkov wrote:
> > On 01/04/2026 09:44, Yongxing Mou wrote:
> > > 
> > > 
> > > On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Whenever virtual channel slot allocation changes, the DP
> > > > > source must send the action control trigger sequence to notify
> > > > > the sink about the same. This would be applicable during the
> > > > > start and stop of the pixel stream. Add the infrastructure
> > > > > to be able to send ACT packets for the DP controller when
> > > > > operating in MST mode.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39
> > > > > +++++++++++++++++++++++++ + +++++++++--
> > > > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
> > > > >   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > > > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > > > >   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> > > > >   5 files changed, 44 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > b/drivers/gpu/drm/msm/ dp/dp_ctrl.c
> > > > > index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
> > > > >       bool core_clks_on;
> > > > >       bool link_clks_on;
> > > > >       bool stream_clks_on[DP_STREAM_MAX];
> > > > > +    bool mst_active;
> > > > >   };
> > > > >   static inline u32 msm_dp_read_ahb(const struct
> > > > > msm_dp_ctrl_private *ctrl, u32 offset)
> > > > > @@ -227,6 +228,32 @@ static int
> > > > > msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > > >       return 0;
> > > > >   }
> > > > > +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > > +{
> > > > > +    struct msm_dp_ctrl_private *ctrl;
> > > > > +    bool act_complete;
> > > > > +
> > > > > +    ctrl = container_of(msm_dp_ctrl, struct
> > > > > msm_dp_ctrl_private, msm_dp_ctrl);
> > > > > +
> > > > > +    if (!ctrl->mst_active)
> > > > > +        return;
> > > > > +
> > > > > +    msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
> > > > > +    /* make sure ACT signal is performed */
> > > > > +    wmb();
> > > > > +
> > > > > +    msleep(20); /* needs 1 frame time */
> > > > > +
> > > > > +    act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
> > > > > +
> > > > > +    if (!act_complete)
> > > > > +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
> > > > > SUCCESS\n");
> > > > > +    else
> > > > > +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
> > > > > failed\n");
> > > > 
> > > > Shouldn't it return an error if the register dind't latch? Also,
> > > > shouldn't we set mst_active only if the write went through?
> > > > 
> > > In some cases, MST still works correctly even when the ACT trigger
> > > fails; here refer to the downstream implementation.
> > 
> > I don't think it is a good idea. It would be better to signal this to
> > the user and rollback the MST configuration (as in the case of any other
> > error).
> > 
> > I will change my mind if you point out i915, amdgpu or nouveau drivers
> > ignoring the ACT issues.
> > 
> Sure. Until I can find more convincing evidence, I will make the changes as
> requested.

Or you can point out the relevant part of the standard.

-- 
With best wishes
Dmitry

