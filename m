Return-Path: <linux-arm-msm+bounces-113304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZVRGG8idMGq4VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:50:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD168B119
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:50:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MaKPAN6H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yve5nYtQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B739306DEF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7D427A462;
	Tue, 16 Jun 2026 00:44:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366918C933
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:44:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570659; cv=none; b=NwPYwzQhj1rOU/9X+21aRX4M2MMHU7EnTEVW1M+0iWPGcC+KmT9ceoGkOmZ+rdPoZcmRUW4P1ePDsbe1mKs1seGeZDs93awQEpjhYTb7zIS0DzZEF3eZHEvSzkfQKMtHU/3F4aKG/JzUU/Ab0YsEWtVM7G4J1gVMUwGjLLe1+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570659; c=relaxed/simple;
	bh=SCXHq9bhZUmP0t3L48Ywn8/lMkAvt5MLKYHsafwtmy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCKvp05JygeGroF9oByED+MxMRUny15AvxEUYmpJb0wCWmoTqTF9rtJOuKiJ3dbfuR/3t4TJFSb7q7064ZZo3WED96ciK+aw673p8/TR6Dvs2V97uLOTkMykXRwZlhE4djq0HfdV+X27uEKYIY9Pr+FkI3c3oMYYcLZMnafQWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaKPAN6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yve5nYtQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OHCM1914922
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7zc5eDmQnq/IplllR5eB1g7D
	oy3n+pE93DScVljOljw=; b=MaKPAN6Hs08YUzzGdefVdfGEzU8ikH7dqofgXvX7
	AA1ScvVLo1sPrtKVRM1CcrlihucQBI5m+AQ9kwmZi5biqHgEBKlsCM8W0xbpJ3T9
	4tsdsdozM1tQ4WfbIOBh/dzMquvDyFzo3FNmq1DPK4awrCjqoSUJZHTM5cJx07Nx
	yiq7Lly4apXTnEsgGnJJTNjR0lxHnkctKAWjmcZUKi/N9jDcWx138RB6VYlcLe4F
	M19e7MIFu8Ic+l5V2FWgf/AIsvA86zBfVyWGyzwHDAzib5G4/T1cwRL3v2EVAPa8
	lUUy1AUy7Th3TPBWF2XmpPPwvnlNFzkQy6WTqoU0C0w50A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3ttb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:44:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157de5360fso906855085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781570656; x=1782175456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zc5eDmQnq/IplllR5eB1g7Doy3n+pE93DScVljOljw=;
        b=Yve5nYtQQmXREb70GvH2acGNZ8l4PCjI+Gf4RXcGakUztyCoVhv9ChFfKpp4jXgbKT
         mtgUin/FVg3juT1spaqlTkmINaDwvC+xMflCDacUGIaVlk7HJRKbleGtWlJOJ4zalWOm
         D6qWH63ApE7hf2Eltl0A/JMI522hB40xNyKf6WR61pG/rPT49tf4KLqgeIwpGdxaqwNM
         30vSi4yRCJOOvd7uxlotmY2pd+xuD4a0p3CvNoVsCSYtZJ4yBucr1pzsuPpKLABPKodq
         jyiMRZ77jLlV/qz2ywMIy3CzJupf+33u8o3eyfXPhY7A0oMjUafavOsyyDmMq6vOmqAd
         qnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781570656; x=1782175456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zc5eDmQnq/IplllR5eB1g7Doy3n+pE93DScVljOljw=;
        b=HRVett5eYkeybv3/GSc0XksS3f7/KcaTGeIRdoh43LBthRAF0Qw8WJovtXWOK7R3Tt
         iNf8EAHWfFTeLUfviM0+HqxDdzFVHjhyDcdt2rdcbLJasGLXqSmsyZzpzGukiD7KlnAr
         mL4t/2RDTzaa8EsHrx6z3d21gKlSYGdFkiewGnvEgMXDEgxYPrgdqi7QrykBT3M6vh5U
         b2t6OYyr740/ZmcfWRcFQl0lJn7uGeVXk/peTZil2Mjxz5rdl/mLzxwDj+xjWyTtwNiF
         ChXX2W6rG72SM7W4Yarf3Fu7zBGSzWfv3ejksEz22wuXZoZ5SMCmP05oXHc6GNGAdkrr
         r6TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3tJqajktFcUURL+VQ0S0yLfDGyfnM5PwUIKm/PTNvJkIcBec+whjqxLG5pKGByRdR5NSnMY4YmeKQa50t@vger.kernel.org
X-Gm-Message-State: AOJu0YyYo4hXRfZ32fqNUClQPYN/xS4XeakQSJJYLW0k6AZm4NFegUWc
	cc+No5H23Nbkmuy8VZbEoOw2efRCGt9CtRo1nFHDmn0Y14yArsy3eourTyf2HRu186szxNlLKw/
	uoFdqHpbljkPfISipZrWDNL/qAzUuWgpmcsgYLaQcgXoB3QOZk5V74mAq5VFVBzWV151x
X-Gm-Gg: Acq92OGD8pRteu0odZblcyEzVxk+Vwymq9kjTGadfUV2YZlTJ5M/AUGijbuELEyb+au
	OGUmsZIk8qJVvkcxR34HaqweSlkd0xnTek6IDSAsOwuX5e1QCf2CTU+aoIRoNuGO1wi8ioa9L3O
	kQvOV3veQV1x/RJZp+akIckO++y1jtNFoP8I804e6XYq2Hnv43w0aH1jNC3ia9vQ3HPLSJltYn1
	ixFasLylAHV+KmmJABktohjDP8QWY372r50DGc+tpgLS4e7ZDfnF1gsD0sUW6w2OJkIrk2fMObK
	6pcd/xivQvY793bgiY3NcPmw4JvM+hgbtQHdzNqk4Zu7btoVstdznYe2duDekeIxA712qb4DvVZ
	ZJOfgAujE3U7OhnvH10fBzSy5pks1jsld1M2E+crNt2nF/SIB9xaSLVrBU1sa/XBx7LI+U65j6X
	CLhZ5SKXx3ortoTVzh6ehccv33hg6IYQjbuPg=
X-Received: by 2002:a05:620a:178f:b0:915:9931:3a3e with SMTP id af79cd13be357-91c2e9077b8mr252269885a.27.1781570656017;
        Mon, 15 Jun 2026 17:44:16 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:915:9931:3a3e with SMTP id af79cd13be357-91c2e9077b8mr252266985a.27.1781570655497;
        Mon, 15 Jun 2026 17:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7357sm3155367e87.42.2026.06.15.17.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:44:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:44:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 22/39] drm/msm/dp: Add support for sending VCPF
 packets in DP controller
Message-ID: <n6qjiuouisangxtov7dd7au7wb5ubt4vouodhhziuq4fychkva@275qni5tykry>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
 <i6x7675n4neufglcjwneds6nehetclystyg3abosbdjkh25ub5@psdjsrfl6wek>
 <d3689914-4afd-4bcb-8aad-380aefbf23d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3689914-4afd-4bcb-8aad-380aefbf23d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QFWdF6T6lpNAeUR8QG9bthJwrP4b32rq
X-Proofpoint-GUID: QFWdF6T6lpNAeUR8QG9bthJwrP4b32rq
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a309c60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=aoCmxbk1eBWus4yxrFEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNCBTYWx0ZWRfXyLtqE2YpoPXV
 pW8HVxIRUIeV9dUfWuAB4Hn3anKBD1YYLa+Gom5dWhm/LYLUljeJ1NkkHjMyqySPzuywLiWQDbY
 7lDK1kx2doNLV6uElVcGh2z+rynBw6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNCBTYWx0ZWRfXy+NgbNNjxA1w
 nGDCY0+/G/+mTL0EoN7nEj/Pqu/9mUxB2ZsCea53cYF67oHRNwVX/9gX5vmN3gh+TU71+AaYLTq
 7iVncv/GK3wMWwjeME/NKGsouf93s20js1ojEouiwGsdILIPjBME2Gi7EA4tnYMEFZQrcs0LUMJ
 jdutz8b6kslliP11ovzblZRqF0ugL57fr224s0Gonj3YmxwyfkREosOFiYlmnJ3fEgTheTJ7sMH
 1ghZsRR5T5ZFiJdmdh5YVPAI/spRr1WWNZJp28Uwk5Iim29rnOqtV2NKQh3U15XRbfYbK24hXQB
 rOA5tNEuizSj8N+DiIuSzZ7fMm6/MszBgLJ7spUT/QNgW0wj0vvoaWXCx1o3Hm8LmvrqnGAqV40
 QVlsD9aGZZYR5XsmY81uvp79HKg+XEeji975wW0TjLHKjqez/pmMdMfqGhoEG3Cnj5DmZ6hUuky
 Oh0PgLFgS6s8R7/gB6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113304-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3AD168B119

On Mon, Jun 15, 2026 at 04:35:06PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 3:24 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:57PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > The VC Payload Fill (VCPF) sequence is inserted by the DP controller
> > > when stream symbols are absent, typically before a stream is disabled.
> > > This patch adds support for triggering the VCPF sequence in the MSM DP
> > > controller.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++++++++++++++---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     |  5 ++++
> > >   4 files changed, 58 insertions(+), 6 deletions(-)
> > > 
> > > @@ -516,14 +542,28 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
> > >   	return true;
> > >   }
> > > -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > > +	u32 state = 0x0;
> > >   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > +	if (!ctrl->mst_active)
> > > +		state |= DP_STATE_CTRL_PUSH_IDLE;
> > > +	else if (msm_dp_panel->stream_id == DP_STREAM_0)
> > > +		state |= DP_DP0_PUSH_VCPF;
> > > +	else if (msm_dp_panel->stream_id == DP_STREAM_1)
> > > +		state |= DP_DP1_PUSH_VCPF;
> > > +	else
> > > +		state |= DP_MSTLINK_PUSH_VCPF;
> > > +
> > >   	reinit_completion(&ctrl->idle_comp);
> > 
> > And there can't be two streams wanting to push idle at the same time?
> > 
> In MST, msm_dp_ctrl_push_idle() is only reached from
> msm_dp_display_disable_helper(), which is called from
> msm_dp_mst_stream_disable() / msm_dp_mst_stream_post_disable() in
> dp_mst_drm.c. Both of those
>    callers hold mst->mst_lock for the duration of the disable sequence,
> which serializes push_idle (and the wait on idle_comp) across streams. So
> sharing a single idle_comp on the ctrl is safe.

Comment, protected by mst_lock in msm_dp_foo().

> > > -	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
> > > +
> > > +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
> > > +			  msm_dp_panel->stream_id > 1 ?
> > > +			  REG_DP_MSTLINK_STATE_CTRL : REG_DP_STATE_CTRL,
> > > +			  state);
> > >   	if (!wait_for_completion_timeout(&ctrl->idle_comp,
> > >   			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))

> > > @@ -2183,7 +2223,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
> > >   	int ret = 0;
> > >   	int training_step = DP_TRAINING_NONE;
> > > -	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);
> > 
> > Which panel are we passing and why? It feels to me that we have two
> > different cases, one for the MST stream and another one for the SST
> > link. Can we handle them separately? (note: I might be wrong here,
> > please correct me if I'm wrong).
> > 
> For SST, we push to bit 8 of MDSS_0_DPTX_0_STATE_CTRL.
> For MST, stream0 and stream1 use bit 12 and bit 14 respectively.
> For MST stream2 and stream3 use REG_DP_MSTLINK_STATE_CTRL.
> Do we need to handle MST and SST separately here?

Where is the MST panel coming from? You are pushing ctrl->panel, which
is the SST one, if I'm not mistaken.

> > >   	ctrl->link->phy_params.p_level = 0;
> > >   	ctrl->link->phy_params.v_level = 0;

-- 
With best wishes
Dmitry

