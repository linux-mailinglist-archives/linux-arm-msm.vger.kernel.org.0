Return-Path: <linux-arm-msm+bounces-100894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBt3HTXRymmsAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:38:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C38360800
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2D2030205F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1D5279DCA;
	Mon, 30 Mar 2026 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qiqbxkk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwqlYyaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674039A809
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899502; cv=none; b=TR4t7BKFc2/2LWTBwgZIsTbyjIfBvMRWVV/ZJ6f1pn7jdG4h5urbFAv9MCovuDGe/zuZAaBD5+ZE3c7Tckw6I52be7Mz0aWdaTLoO+IBhk0TVqkKPAKaxKouL9f0cP921oPMEV8CiqUCMjvkwc5FBKzjaZOygkx4SwchWEf0iQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899502; c=relaxed/simple;
	bh=Ye9j2YKFXtzXs6b4O/brIpm03BYb4yiiXW3TT3iii1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iay04V2g2SMJkyvjcRX6NNVcEFf4fU1+CML/rksSOcJBMvTR6XOAtBEg9T/mlEynb/doB992noAxrhVI2wmRe7T3r7eJi/e9FhML5IpNkx/VoAPznnDpxZ9LpiaPCoFMCH/8bvy7Mynlz1LG6fFaK38d21j0AazUbMmGodbPaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qiqbxkk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwqlYyaQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UExmtH2391401
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cu0HvQ7vzc/dwwRQ08t4QFfK
	4UOUE6YCPsd1rfuvHH0=; b=Qiqbxkk8NW0Pe9voAXaPRbY4eIAo4oO8+oP35SRq
	KQoBfdNE0yrc7m91KzP4qKb9bDL+0NAGhGKWi99tEl3/ohFGbcb0jp0waVMBZ3XS
	Sac5cfqU1+rQL8/skPZscZg5Qzo7mnfCxZk55S2M7VYoVR6/uN+Zql9qdL0hU1av
	1AQehnZvnau0rz7KgCnLAXA9Xzy698JswsedaMMYufL+Xq/i4DOkMZgkpWn5hmjV
	s2VYZh4M6pBDLwp+SRGhjlMH9V39l6PdNHgmlTdUBzs6W6NX26Z9BrqafTaR1Rgt
	1SWYtKV52C/x4LAGK905oGAmvnZroNKxs52/F02XtcnI4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7h3rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so94337661cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899499; x=1775504299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu0HvQ7vzc/dwwRQ08t4QFfK4UOUE6YCPsd1rfuvHH0=;
        b=QwqlYyaQ+C3QgUAGLywbW6GcqoCYabscA3DEN62bu19sjfRt7pI84DxoLq0rTquMq4
         8OAnSxBx5u022Ov7OhbXbAGx2katJ38JTwIdrGOFWPrebV0yCikthCG6n7qzNb3zMgh4
         5fsvuMWRykyJAGVQZ90kBs//soAjsEH4aFJcgVDAR5n4ZkVMtL02zbSCB1fYoTGtuySt
         QfdZaluTeTGl/5tGJfjNRAy6J3AJH+KVxK9bmbxbhXHbUoGHjN6swFzKfGzU3iet5IM9
         DCwwXOjjOgYVL16sWQz8Iuyrq6hC+gc5o/FmytUrr8YjxRdhSx2BwAKd0R1dD7vqe/Ii
         KPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899499; x=1775504299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu0HvQ7vzc/dwwRQ08t4QFfK4UOUE6YCPsd1rfuvHH0=;
        b=E2JScwXlOcwKoqyLtyairTHaKD5tf9vz7gLZb0PsSKHFOch5bq9Gx9C9NFjktjxVuH
         fC1PnccMVqu7RkeIbwKcVnbp9bQLza/DuVfjGzb2E4MWJxan60PP6v0//actShshQfIP
         1T4W6t8q4pqRP6VmN8bVklmhFHEaOZPoffZDYOt8+kkAnzYQB0Q6854UEYUHm1ICmTUt
         Y+dmcIyUOcjRUwWXwqSRIxhAhJl3w3HkKpUKDkHYT4Z44dIGDpFCg0jHwgHyUgMaPQJ6
         PJa17pmm6y6d61/HM8IwYGa0+WZWZcjT863KYGZpr09gvCRv2ciLzCR9JvJhbjsoyNNn
         8GWA==
X-Forwarded-Encrypted: i=1; AJvYcCWZbuFKRblEv6lb/XDiW0dNplAiHdmRN9mPucD4QgT+waFtBb/0/J/Umv3PgzzH2vUnKKuvTeG+rX0Wk8rS@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJMIivMAWj3JISzdv/9WYYJib5IJspxuOBcMN+HT3VxL5not8
	cexsgxHQJu/althV3VzIfIuY1TIQqENkF3pvwSCjqYiO2HnIudvEiEOq2tnYqRxVjeLWXITUVpK
	8k4rt+JXziCcP0jsX1z3OIOAVeb+f0MdZP+9yEflMe96bIYj90FH4qjt6rHGM8+Gm1pZ4
X-Gm-Gg: ATEYQzw4kXotdhNB7b+3CofKmSxv61tho2tztdWLIO1X/jweEiVJ/Q/fuVF5GHHDqoR
	rr/3DJdz6HQi4C1FZQm7JzPJNocqjupUwlS4gSm/NlG1junDUuQt4H4kfzI3ZMfbiiGBBxRdDXB
	ccHg7R142BfJYHcJCaQfmIejYl2l9Sg/98ywMdlg6Xo+FnsHzvwlrZWWQHeaseHM4Nd3fv6Ya4G
	XedLB96stQn23q2R1u1HZhNzjdQ6q334Giu+thlzy1GoIk/z1+nG3QydILKODs5D9BOa/qSDpRz
	z6gTcJSpnBmnQcDjcIM1Cpp7u/xqahn2V+RABd1MhlF7ufKs+tRSCtezYlgA3HXCQnyVpq9bzUJ
	o0qR0aBqgg9Tud5Xjwz+m9Q4ClXKofXwSDTx3PooGZCQZZ4vxpgjBYMNiaXhglhgZy9BXFtIzcA
	eKabcLNJ7KdAyfmCv1iefxtUNCgmsDNOLjY/o=
X-Received: by 2002:a05:622a:6183:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d2c8b041fmr11463591cf.25.1774899499135;
        Mon, 30 Mar 2026 12:38:19 -0700 (PDT)
X-Received: by 2002:a05:622a:6183:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d2c8b041fmr11463261cf.25.1774899498649;
        Mon, 30 Mar 2026 12:38:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f16sm1946495e87.44.2026.03.30.12.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:17 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:38:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
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
Message-ID: <sube4fl4iubrutg7wvdqcmdpuvia5bavmc5x5gajrngsrte6fj@nybmbjbcm6ma>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
 <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
 <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
 <c7xvoopmujdmdar4lr5oghcc4olc72fpfrpe6yq7wrmtqaytjg@iweixftggvbg>
 <acrHj02HsaoK5N1b@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrHj02HsaoK5N1b@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfXzyZagHoIQEYp
 fTaVgbbmITVDeifAVVa7sLTHdD7s2h/LVMgPsooWZwGizmeBFfvf96Hq8E1yJZW72+Et1bo8rbr
 TRbBelGT+cUGlq4T0IPFxCLJuFfQxJScbRhjq3vxQjLxiVpiwpm3KwtKFy+TXBnwVlb/pZvUXg0
 f55jTtr8KZiLQq05OZPnKLArKs8rxa1fgYxZ5jUJQTxuS/XOqoQscPAJpD31Ez03LX+Odi2mDui
 CoUfzoE2Ta6NxtiT+ITXAxuf+qpA2Bnu5Hzx7NN27KzHs8NrqqTuRct9wI2gYLDFG99k/Qs+WXg
 rPewg7Tuvg3VPJgP6TJrgk8NLjPihZEnLmFPxBYe/XHlxjuvb5W2fC9JDqP4sbCK9DDgzYz7QUy
 XHhYl2CQG5Nqf7TXledpCfNsk7mVMRtYAQVK2Q1PpWj+JI213d5oyC6h1OIJyv5mS+OCH6mRVWU
 m/6bjZyBdDQmxbzobDQ==
X-Proofpoint-GUID: TM53QKpaA_hZA8JdW9Q-1pGwY67Syrfk
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cad12c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=G2SdLJHArYRvH_znJewA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TM53QKpaA_hZA8JdW9Q-1pGwY67Syrfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300164
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100894-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38C38360800
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:27:19AM +0530, Vishnu Saini wrote:
> On Mon, Mar 30, 2026 at 09:39:31PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Mar 31, 2026 at 12:00:07AM +0530, Vishnu Saini wrote:
> > > On Sun, Mar 29, 2026 at 02:24:53AM +0200, Dmitry Baryshkov wrote:
> > > > On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> > > > > Few targets have lesser SSPP line width compared to mixer width,
> > > > > SSPP line width also needs to be considered during mode valid
> > > > > to avoid failures during atomic_check.
> > > > 
> > > > Technically this is not correct. There is no requirement for the
> > > > planes to cover the whole CRTC. Nor is there a requirement to use only 2
> > > > rectangles to cover the screen. As such, it is perfectly fine in
> > > > mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
> > > > if the user tries to stretch 2 rectangles in such a case.
> > > 
> > > This is to fix an issue with 5k monitor on rb3gen2, since SSPP maxlinewidth is 2400
> > > it can't cover the whole 5k buffer in left right split mode.
> > > Do we need to fix it from drm backend by dividing 5k buffer into 2 planes and 
> > > use 2 pipes in split mode.
> > 
> > Quad pipe is pending for 7.2, most likely. However, I think, instead you
> > should teach compositor that if the commit fails, it should retry with
> > the lower resolution (it might require somethi g like -E2BIG from te
> > commit).
> Yes, from driver we are returning "-E2BIG" during atomic_check.
> Thank you for the clarity, will try to fix it from compositor.

Just to point out: it's not different from the driver not being able to
perform the atomic commit for any other reason. For example, if card has
3 outputs but can support only 2 concurrent outputs, then each connector
will still have a list of valid modes, but trying to enable outputs on
all three of them would still fail (or trying to enable high-enough
resolution on all three, if that removes a possible question of limiting
number of outputs by other means).

>  
> > > 4 SSPP rects --> 2 LMs --> 3d_mux --> DP
> > >  
> > > > > 
> > > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
> > > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

