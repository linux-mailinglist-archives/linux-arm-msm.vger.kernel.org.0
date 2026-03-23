Return-Path: <linux-arm-msm+bounces-99406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K2MEAmxwWnlUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:30:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE682FDBDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15FD2303C827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CA037D122;
	Mon, 23 Mar 2026 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NljK6uLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPkH69j7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E2537D118
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301374; cv=none; b=mApZcTc0WrNUOb0oHsL3Lz17WfWoR4hdH5rvwczUZyIGyG8U28NxkLi9asfVcFnrTzkok/G97gGoWQ81K0nhJrlF6qlIvoV+5EbXHhbhBms4nE0e0jtivDsSjE24G82nIpKW8xO7phK1uO/gbxa8ELrsngzc9QcYi6nWuna7hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301374; c=relaxed/simple;
	bh=LoEgyIOLGnpVIkobVLcs/eu1uTGQgupK2sw12319Tnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9FobP2bnGlvOq/uOKOVzwuM4cQPzo9nLWD8kxq7TcSdz1ZL4xWZvivQi0TZqJVOguqE9KgQAq1SBM0SVeK0Fmupea9BJ+mFQx8NDTZxrPKdKBlNf4dFzjKcHr5T0oiayMbOrR6+XgKHXuabXxVf2kdpeXfmeqQXslTph5ybfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NljK6uLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPkH69j7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqW7g3817386
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fGTPmBY5vWGW1J+pc1gcodKZaPogmrWSzX6ByBHUis=; b=NljK6uLZLsqjqNDi
	HSKXMJHMaqn70Cpo5M/tuIydVWwUVYyMudjlxONN5pb9JohScyiKfpqOHsa115MX
	8mU0C11E/17YZ0/yUcDLpWRDpZVgfC5fn/hDjvd2VFvQYF2ZcujrXWQ26Xwyd65m
	PsVFaPAdvu2dtMnFQ0yvj1F2y1y2sokEZDE4KBjXyYt+nF4ybuDYLrFoQ5EQfIM2
	RSWoCxqybORFXWCl4klq/eaOHEbNHHgRog4ZSSshpOMxga5uE4QX0kMkZNZxH2lC
	lJfrUZQanROGV6qpO+0PQf08Kz7gBIUtwG2Ob1CydzH1Xb6/2DPa/d+k/A/2kbLr
	dxGCSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1why-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:29:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso86655831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774301371; x=1774906171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fGTPmBY5vWGW1J+pc1gcodKZaPogmrWSzX6ByBHUis=;
        b=OPkH69j7Ts98+HU7BgAwH86PwAralk0X84gQo10Pem50q+Cygl1RXPrjI4cvNyfMpx
         YtxLbvoNNWA8U5g2SvUWww2g1Xfg8UGFbV5JnXJe7fMwUeCHmrzaWFq8Zpt353pE6XZb
         Idt8XnWNmeCP5cqj4kbyA6zN4PCC8sbs5KgpxwLfOxUp3s+NSgsdq/IOj3MoM0IWeyMJ
         G+bV9z8foy0ij8rzbJ7XR8+AKjxQq7HFvChSM+xN0hWLfi/DbcPsHXq6vSKDFR2cIaDG
         c0jczVLPrgFkPb9yOj+Dq142VmYqi+Hdo8/q/BvgVdvVA3m0/HbdRJKfFue1WZjPUW50
         iQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301371; x=1774906171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fGTPmBY5vWGW1J+pc1gcodKZaPogmrWSzX6ByBHUis=;
        b=aF8sh+oTfLqpwKpzBsPzN5ggfgRuZoPYfA0HXj3TCU2guK5mE1wobBCBNEZC1UMfcv
         0Ca4Dgq3AqTglmwlaQ93F1Vo4sixthWnjQokRErbBs+lannGMtjpMhpApQJF6ZS7Az4p
         fqI/Q5+GcOsY2TNb1kiJN20PHu6atfJCAoieTNWP8sBBMFp3yi0bBkmQ0Aio8FiJLXDX
         5Y99l7exgO3F1xS9+WJVKBHStAAwKvxht96bl/8P9SfUxjW88wDQQawENjNrxhS8ILVC
         mqG2QbBjmZLN5U4IQtpbfRAqXDnvmnIzJjdum3mm4hA5fYshwQADp79DW55u+ChZEr2Y
         x2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCoPu+5BftKP7dyjevSd3d9vL60HY8AT2ujt51oT0ZXiKMOhj88ZKK6ftImIsdfdsKMezk9hqPWf1re6TW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd09xDIyVoCL2cLXTkamVUH8mwOy2NGPwNPzzAFNhyn8k/0n7s
	rWvLE2w9r3aquJRj/0HtgKiNHhu7dAMX7bmjmamlA4cGcv27xLNTEct4e9SWCrxS7N9KXGKBuAS
	y9yI9VMrC5OgPHedZ2ZTDuZSSH/+tj8sVE5nZFAMjTGfTtVctkJOlYk64fFfYsqzqohFg
X-Gm-Gg: ATEYQzxYFHXFbbC4V9vVRfZh3RMa97X67u6uAA3HqXpiwByFXYnB5LokK2Uf5kxOhog
	8aWwdSBMN4Nw1ONC6NJFo/2udmUm1f58kRfqwsbWgM21k42cRSTVcbt5aP81IDdUisXomkA61Wa
	XfA1Z78mCt7jGxv9Y+YzTAZxtigA78qM+orSfAaYBN/Dqmju0CkVDACxdP6jN9hp5pejf8jeryN
	dDoqv1XqjTMYH2SWQD+arXzz9FKqAMePm+bHIPpYjOu/38s2v9Cm5LeRJKF45Bf2gkDHm51O62v
	SlFlBKca7r9lfEjm6tjbWOcXst7xvwPHmde81gZy1jogdq7tP6jYfKvDnVU6KUiGtjHmyxpw/wS
	47QARdg3aksHJghVsJkBmUzt+aKcEnlIrwn2ZroI2AaniPUB5EGSVCLpaDM3KJe0KLQJvNRxmkZ
	ZfH2ygZY3F/xN4sRX0X9jaMmOdaYZ4pQsf5W4=
X-Received: by 2002:a05:622a:2c9:b0:509:172f:bd5 with SMTP id d75a77b69052e-50b3739f59fmr222809421cf.4.1774301371577;
        Mon, 23 Mar 2026 14:29:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2c9:b0:509:172f:bd5 with SMTP id d75a77b69052e-50b3739f59fmr222808921cf.4.1774301370999;
        Mon, 23 Mar 2026 14:29:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305fa1sm2662589e87.67.2026.03.23.14.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:29:29 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:29:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] drm/msm/a6xx: Use barriers while updating HFI Q
 headers
Message-ID: <s4jt64qc7rsbngkt3magrphvluclodlc6yopm4pnmmgjbno6l6@kfqcbsilsit6>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-6-fc95b8d9c017@oss.qualcomm.com>
 <CACSVV02XkyT-om4LQJA_Xa-4Z+B5aKOPU_3uxtwHCa1nMXVUKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02XkyT-om4LQJA_Xa-4Z+B5aKOPU_3uxtwHCa1nMXVUKg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1b0bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DHZr7MJB055T0w-EqowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kouvKr1Y7J9h_hujwoAxym8Isxwq1iyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1OSBTYWx0ZWRfX+xAHW00HD1zn
 z4JU3cwoasaWMy3mBOMQERX7HrpVjIOgT1fhRz56PvJolSALS7XCFP07v17X57lPSDvDQfp6OKt
 eTKGR11feKG0+iJ9y/hMshR/PFWcrPqcM13T2A36lqdJsPzzY5hem+4rTKu7Gvo5HDhlcrzBiNt
 2VasQdg6hP3j6zwop8xqoVRijMpmjTD0Ig7HPqZuTZEN2NOTT8/hX3JyIB59jF2GaA02iQyXgTV
 MvBgD6v/VEUCyUWmH7j4OJqkoOkf2A45Xao+sUo8pBf+KjEv+bzxIsBRLYj9rxfZeGcCOetFCsv
 hf+yAEtigrGWM0F41+92cuKv4hJPyVm/7+5FRc2N8v9JgTWBXUjaiuW3dE/o4+bCQqCuYDlyJX3
 3pwNsKFJBT4X4ThGYWPQ3OjY7R7p5B4BXpQ+vkwiibIdv3aUFvaElGoSG+34vxE3DJF14K3MnJ3
 YpN3hnf0yixhwTgg9sA==
X-Proofpoint-GUID: kouvKr1Y7J9h_hujwoAxym8Isxwq1iyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230159
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99406-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: AEE682FDBDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:45:16PM -0700, Rob Clark wrote:
> On Mon, Mar 23, 2026 at 1:13 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > To avoid harmful compiler optimizations and IO reordering in the HW, use
> > barriers and READ/WRITE_ONCE helpers as necessary while accessing the HFI
> > queue index variables.
> 
> This feels a bit like it should have Fixes: ?

And as a friendly reminder, if it is a Fix, please move it towards the
start of the series.

-- 
With best wishes
Dmitry

