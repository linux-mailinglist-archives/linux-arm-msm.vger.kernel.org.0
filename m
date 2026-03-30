Return-Path: <linux-arm-msm+bounces-100887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLarMZ7HymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA2360094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9DDA300C3A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1843E022B;
	Mon, 30 Mar 2026 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALQaXzQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwO6IAzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428D3DFC8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897049; cv=none; b=jhAlbBZtwgNf34SlrZqZTTUHQQy2RVbH67i6q4KX+GNNJR8B5ruaokxParMRQu5kYuMrf51CGT7pqXyrQhc97DBZgoKGaP79vQjUrWHZSI15G6hB+eZhG8KsojlSvl0l7eC6P+iN2FQ7cFEJ4q5E+mVobr/7oIUXdV6nvBUKOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897049; c=relaxed/simple;
	bh=UuawWSUrpdEgVZYKEtaQiTnPpk9LSict/jbulKDvtCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t27umbsUW1JdjPKQFmLdsYEg6grHYJ5I/Py2q1rZ0VYdCpbV1WmocXP8O9qb4l3tYrTtFwYjJM7x2RihNaIgITrgPrzUyflPiH8aZ7QUCbBuNQx689UivthrDyfpOQ1Mo769BR3HSwB8TZMfcRcBgVHVcI4+lbM713pZgytlm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALQaXzQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwO6IAzL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEgMYi3721896
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bw2n1JjHUO1SVcf10j+QO0Rs
	MwFDwlWuIyf73gWTUSw=; b=ALQaXzQumj5oXkpvH+ySP8jCWuqGUkbYERSGebez
	0O3gCz3ieEbzs+gh73yC3VwaN1T3JQi1enaq4UXkNPo/xwpC7w69YwB3I1IctwaR
	1uaGKocjKk9P3xqmOLwRPbfGabovaizuHyreE9FlZVJomnsOwotV9SU2T4gkVHIn
	wW5QV2q37Zts19Y95Xh696Ke4chidpJQxXMNWsWZ2JYx5qyu5C3Fwd/RYDtNsPxE
	9kMsS4KhwmPmjD//wpFvO+U1Hb2DgNOXWH/i4dccU5+Du4IX6L5jZIul0y4WFMei
	INW/kEQbxRdgr1555svSme3I/cvplQLU45FDJkH1xEKIIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmt5ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:57:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad9f2ee27dso13952755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897046; x=1775501846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bw2n1JjHUO1SVcf10j+QO0RsMwFDwlWuIyf73gWTUSw=;
        b=VwO6IAzLTL9mhByIiWzZpCBLF6nxn4qhT8X+J4EX0kja54p4ZZQWyjNnLcRIN/i03d
         l3JIe7dke/fPmlDffPkxYsGBhypxApmjzLdNk9DJcWdMkpoznoZrZ9H8I7vfTXdltSRk
         WSYEBsbkzrhxuNze0YL74UCnlqiSpYXZN2dpdjyBB9DyrmUj9H06QLG1VcIXYzGJ473B
         byFWmL79MeAh0NvvLuvp0V7eyXGeE1DOLv2NZwx6vT1TvhNOYmVCvLDvu2zhFPy7DZIT
         HcpRYgIC7aBouOajOe3jV8ZZdV7cuFFO0WofadmzKgLX60QIFV4pGLG5JgTGNToebnXh
         Q9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897046; x=1775501846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bw2n1JjHUO1SVcf10j+QO0RsMwFDwlWuIyf73gWTUSw=;
        b=Sz5gd6E4To9UCDc4J6mnKch7u2rD1a3yqD0ONdAxnDOZuwjhTMI3oEJbM1OO8mfD3r
         XD/fe3YGqStjlhsmZa2+izlShzUGi/bBzoZRdthm+Wggoq945ZoFJVrptMbDw/CJ7eWC
         nobT2JRRSXK9p0Zi99BzbfEJyDvOtWb1vmJeOSUCotJeVCyDsszRnnWvL6bcHn/tMSI0
         wwB6ck8+Bp4TuCx2CH+UmtzXBLGTs3FjTkKyWYZdh1B5oYyfY9jyAfO+RW6klEc9qZrN
         YLEzCGQ1HZRDJ1uyq0ZnQjjzDjCuMNMcAGNZdeP3Ex8LtkijE39oBVZJPa5P9Cuij2IL
         IbHg==
X-Forwarded-Encrypted: i=1; AJvYcCUMWMYOhH6y+ylM26xo5vAehqoH8fREUVElynzh++tLcI/97UGwXfF/DglAUs1/AQbmsenqEwOVn0xABaWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+kmBWNoV4fpPPh+zg5+5q/pUjwWPBfUWhwl9RApgao5k1XyD
	IvzWt5ke3hbKmgTd2SrYJr8kcaYB77ICNiqIVdyK+V4FLLhUR8H25zJ9PzRXzWZYlAZcGImBsLd
	hWWTZNs3GlGqMNUleP17o5rO60hPJeRuGK/nzTFYdiEXEHZLfEo3c3mv0P/kDQvMcY99z
X-Gm-Gg: ATEYQzwPzBLsXT4uhRgmFNM9/C9L6So7Z5yrqe8g4vY7OEkDEqIAqr1Fq4PFcPheOuN
	8hALeV7v4wcLVJ8R/w94N1+E/WY3teCIo+CXwVYSMepL/dZz36CMwG1RpxWADEVD7YBCAUQNZP4
	MgAwEpJiZNIjCnF0t6pgdKq5L9SW2kxEu9EXrMzarWu/JKh1hayOvg43nMYjRoijJkcvAsz7FNH
	zYJ+hApJnhard4STS94G6XRCCHBn/VBWRTajBKwS02dpZzMvUx20nMvQksVjHS5XnbwBIx2Ibm4
	KIZpxC6ARwVvwZM1ky4uIon/xsEViQh1cOZzOn+Um5qqDK28po8jMYIbNMMFQv9HI2KqCm5ycmj
	eIctH+/Q1QnYw9BdVc1ZDEiChD5or9sjamWKmUnjvkyO6O2CbFGNzMmAvNd55UcXgWxCltD737Q
	jGBtTYMLkhV4Jde9lZGYQHkM0kyV/mEV8pL5zucrlUNw==
X-Received: by 2002:a17:903:3d0f:b0:2ae:5d79:a163 with SMTP id d9443c01a7336-2b0cdd44230mr80987885ad.5.1774897046171;
        Mon, 30 Mar 2026 11:57:26 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:2ae:5d79:a163 with SMTP id d9443c01a7336-2b0cdd44230mr80987605ad.5.1774897045710;
        Mon, 30 Mar 2026 11:57:25 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427a27f2sm119371675ad.67.2026.03.30.11.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:57:25 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:27:19 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Message-ID: <acrHj02HsaoK5N1b@hu-vishsain-blr.qualcomm.com>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
 <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
 <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
 <c7xvoopmujdmdar4lr5oghcc4olc72fpfrpe6yq7wrmtqaytjg@iweixftggvbg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7xvoopmujdmdar4lr5oghcc4olc72fpfrpe6yq7wrmtqaytjg@iweixftggvbg>
X-Proofpoint-GUID: GlD5IHn4Kw5YK6TTbSWhMNGNjJSnKK06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfXwjrmGv0AkEMC
 OKp8dOy52AvmptqR8fzoGv46VM6poBl0WAp08EqawaoTLHW1oyEv4STSsGoNn+zWsFFVuv6QPD5
 9/QzkZxJsw5ZLGhG8/gGz6BDNx52oi03Kthowkk7QLXZ6MqDKUnNnD+wBNGMD/FLUzlJlUHFdE5
 Q+rScVAz1ODGdnyDF75+pHTqvBfNH6qUyasdWaoXUFUMvDq90bM+ijcKSGzVmdlA8a6Yzoy0QAG
 onmE1RJ8UmjA5xdw10vRfYps9jTsSP8Ucdat+mv34mO+RJdCoNrhdZ1l3yEfIvNpgp/ZKWISYVz
 MsPxgwnVR6QEPe8Kj5aeXWrdDrIvZMEPLGFBtfpXpPkxVNRgAaF/wreVCTt/9r+wQ3xTFVVVmiC
 FHTScf2L5Yc32SiZTKUaFDFokYhrzizqSTS/0uxB4wROx/mSGmoovaqAj3hn3Hqh069CvsWf1yA
 AXYR3XtejzVw8xT7csw==
X-Proofpoint-ORIG-GUID: GlD5IHn4Kw5YK6TTbSWhMNGNjJSnKK06
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cac797 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dtW-sFU6C_rc-SncmgUA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300158
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-100887-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9CA2360094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:39:31PM +0300, Dmitry Baryshkov wrote:
> On Tue, Mar 31, 2026 at 12:00:07AM +0530, Vishnu Saini wrote:
> > On Sun, Mar 29, 2026 at 02:24:53AM +0200, Dmitry Baryshkov wrote:
> > > On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> > > > Few targets have lesser SSPP line width compared to mixer width,
> > > > SSPP line width also needs to be considered during mode valid
> > > > to avoid failures during atomic_check.
> > > 
> > > Technically this is not correct. There is no requirement for the
> > > planes to cover the whole CRTC. Nor is there a requirement to use only 2
> > > rectangles to cover the screen. As such, it is perfectly fine in
> > > mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
> > > if the user tries to stretch 2 rectangles in such a case.
> > 
> > This is to fix an issue with 5k monitor on rb3gen2, since SSPP maxlinewidth is 2400
> > it can't cover the whole 5k buffer in left right split mode.
> > Do we need to fix it from drm backend by dividing 5k buffer into 2 planes and 
> > use 2 pipes in split mode.
> 
> Quad pipe is pending for 7.2, most likely. However, I think, instead you
> should teach compositor that if the commit fails, it should retry with
> the lower resolution (it might require somethi g like -E2BIG from te
> commit).
Yes, from driver we are returning "-E2BIG" during atomic_check.
Thank you for the clarity, will try to fix it from compositor.
 
> > 4 SSPP rects --> 2 LMs --> 3d_mux --> DP
> >  
> > > > 
> > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

