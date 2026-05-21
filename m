Return-Path: <linux-arm-msm+bounces-109053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOgmOBf6DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE115A4C51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3FFB30FA07F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1BB3D090D;
	Thu, 21 May 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUrdCBO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtUJA+sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056F3D25C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366026; cv=none; b=hZ3YCMgYvxjV/EJVDvkEB9plASXW0+1zIlU+pp5z4DLkIMM7g9VY8cA6ho+n+CGqZf6N2lsK62v771hKJeIY8ZX/5uADhJI//xL1hFDDd5S6d3l74pMtA6fDQHrSDPLvKhjkPavuRZegBZ84kvFeborZKT48uyJ7ujD96NMGcb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366026; c=relaxed/simple;
	bh=nCd/faCbjRArzCgPSEMYd1c/Gb2Ml6uXf4HsmCTneEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kogiHJkw4KYQHQ3eHsifZMnuBuKl83QO6aKKpgPrZygNPRygzyBZGKk59ImQ4NjJMxN6B8YuP8xW06i2UW8K2MfdX9Y8mcZb9yoVznD87hGddMRFxKsZ/Hg/eDzcLV5insb+FYLLuBMUUO7IvGxURLVUdQZOp0R/e/vNSiBIfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUrdCBO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtUJA+sy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMSi3556019
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoxEM1YTlmO3FFalc7XhHVbs5SY7WJHAbzoe8nlfLQc=; b=EUrdCBO3DL/fXinD
	PwIjPGuWJNGEw564Sz1Xsxvd/p9ehHya6OeuzmFpSwBdNg0XWa67KpxmLyCALUwV
	YJn6MlAqjiSCjykTuPCiOtRh6TO9ZMu+LNE/JFK5mdhvDNaYf0MxRBErej3B8QlL
	GXJffLFTKBfm9vPmqF4O4W4QGT/4mPMaVMba29kz2YCbPqrM/b4xQTxaZsV2OKUR
	mwSHLozia/aGTN4zGiZT6BF8rq/vJdl9T8JoA7LGv/ypYkpe80rsmgPtwvzxQu3Q
	0Ws+vwbtFxwaixco2MR824fgxIqtO4Y3XlLifm6MfY23sllr8/sKDl6nfookJl9r
	dQZacA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6meum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:20:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63144b84f14so9640128137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779366023; x=1779970823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoxEM1YTlmO3FFalc7XhHVbs5SY7WJHAbzoe8nlfLQc=;
        b=WtUJA+syq8GzVIIW6oAtlbI7s5ROM+82yhibzLtr5RpUkHGZ4zmbWY2ndfwfexyqQn
         +pm296o3sE/Xg/1clZX1NFYMGk1/tjmyDsrGTSEbDMXeKB7XREj4k9JuX3nVjyjUljoa
         EwLZ0DajAzllzkOQP9G9v79YtVXkInAXE2aqDFvbzchumKF/8Wo9Flo7b1alqEGHGgq7
         vPvmWkkmw82BJDk/1hdkBeIHEDkkOsnfDFlwOHFEmZSF1qJ4qGVlCpDjg3Kr0HGa3SR8
         Cp0uSPclnoLDISDQrIcaENN0u01IPNSsUwo6o5utef9wnMeO+uboou2Dks7qGVCp0yqG
         pB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366023; x=1779970823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoxEM1YTlmO3FFalc7XhHVbs5SY7WJHAbzoe8nlfLQc=;
        b=ef/H6G3hGE6YZcmNfguLRM7Wi7eOc2EEAh+W9T51kUUiIIP6Ly6MEmG4TVH9jrMUA3
         CGEm5EtefPI5cAyWmRPZ51R5e4RUnMHBiBPSrQlUSml0K3xs80HgYlsyJE30wCfeOJnV
         4wW1aw+eVJl/esS/DY3XFVw+9lXLYTq44iy1cHKCUECY/YP1mlP2KqypYASRmLJxljVQ
         t7Y2cMmuBs7HihF4RegMdENXnYhGvxqe4tIT6ehQPqAugSbKs+HtOOIdImJ0LS0UbrKK
         5NDN3vZGM0O6MyfN1RFR/2jf7LYPqCxVA6Ujn6TJ12hbcYpujMxja/i4xX8dQXvlfKPg
         VD9w==
X-Forwarded-Encrypted: i=1; AFNElJ+ZkYs/vQHSyvXP+KCCH7Uo+b0Ow+PE4RGZx37rsosw54fdcgK6wYbioO8xXdvsJXxpT4DAMn0+6/X7eKhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlz9fupgo1K8bEOp+OScc1IDsgfIEG88UMEU7etJ1IORx34qeV
	7kTeKVn0OaUNSt+mu9cv7ObUY/0KewwoW6H9MG5BRbdgBxDO1UWLDFkc48gZDkAtKu70PRmx5z/
	tPiaGciEfnhCK/kErYEtML3cuMVKCV/k08zIQDtSPS6Vakl1NRecYJ60m5OgE8amw6h59
X-Gm-Gg: Acq92OH/neABHbbgudhcYaNpF0cJF7htxlFuYbUifN4/7HSmvzecZTq9DJxMCD8I83J
	xQNcz/ScZjXQIv1XAUnjkaFuGn4yGsHz73bDCyj9U7UlGU6q17C9zrIN7rPZeUejAoObmeNeTuT
	B6xkoQaTw7j/z3WII1lV2rm0vCCOgSyQIXnVC/jKcupgEyG9dZIrTEGwYVbskfQfPIPO56p7CEu
	UD2EHvSb+TnO10LHIhQhiBrGezRyEi+2R+SwBplM3WdB3HYoElAJBxMnfvHrGaqWbPEnGjCd2Il
	IWmxPvFIPzDeNGGjyRPF86aOX7F8PLn+qMuhtEA2qrdaiRusXm8GZcJcEbwgTUpGin7IZsfshDu
	yTF8F29fgIMcfvo2I5UpJgIoMxf6XrRiOXi9zGh5ayLi5e8xmt605pUcnTn5osLLWYjt2N9SnDy
	hOeisRlvYfuRalSPQywBQhPXkLsOeEFo0UeHg=
X-Received: by 2002:a05:6102:809f:b0:634:eb91:695 with SMTP id ada2fe7eead31-6738b876346mr1484623137.5.1779366022966;
        Thu, 21 May 2026 05:20:22 -0700 (PDT)
X-Received: by 2002:a05:6102:809f:b0:634:eb91:695 with SMTP id ada2fe7eead31-6738b876346mr1484515137.5.1779366022279;
        Thu, 21 May 2026 05:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d09df0d7sm2370981fa.4.2026.05.21.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:20:21 -0700 (PDT)
Date: Thu, 21 May 2026 15:20:18 +0300
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
Subject: Re: [PATCH v4 15/39] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
Message-ID: <qslmbwi3xwdlc5fac4yjbxf5neckmiuy74en2wiccv3gos65ey@twcgc5wrayrh>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
 <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
 <55081f4d-f1a9-42c7-a1cd-cdcefc008668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55081f4d-f1a9-42c7-a1cd-cdcefc008668@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ef888 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=gUfPeOkTqw4iccYOCI0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: crEv0es6CWcqBJwyhGbNKMY5qBtwCCWu
X-Proofpoint-GUID: crEv0es6CWcqBJwyhGbNKMY5qBtwCCWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX6K/vNRjvBFZh
 VXdl3RUMgBPgoPBlqUySSWw/sxNazH603n1RS/Oue5lyagBkwhEUHQ/HgSDFEv9GoO+yuRijzD8
 n421xFpk1cLHyFHPPFmLH0wH84ayRkrqlgvoRumluvQgN7RajhkzcbKRDIT0A/rgBaybjr1DGhC
 PNZKL09UBf+YFFLomQIUBwiJFOPHTee3zoU+SviPN+GXakCRM5V12dYhaH7TcnpBW3fguX8Ny98
 SVzHQAGNPfk7TVRltYFxYYBYNpson938sqFA2qzeTNFS4cs0AeuFqoZHW8WHHgpghOxZawaxqIb
 2YWHpmsr3UP+9DyXPA/f4bsK9K5Iu4HTWX9AmW+0pe8lXEarNaP0n+J/aHz+6MYsQQovdcx3Sgy
 6hl8IAX3EIkVNrFzqITXR/CrpIr6stEoO0e44VzSLx5yUw2TRM/QCznbmOOnyaMayGdoSby7Rvw
 UwTqbwTkJkiRisbDYNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109053-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AE115A4C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:50:30PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 2:07 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:50PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add support for additional pixel register blocks (p1, p2, p3) to enable
> > > 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
> > > and msm_dp_write_pn for pixel register programming. All pixel clocks
> > > share the same register layout but use different base addresses.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 89 ++++++++++++++++++++-----------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +-
> > >   3 files changed, 79 insertions(+), 53 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 7984a0f9e938..ff506064a3fa 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -85,8 +85,8 @@ struct msm_dp_display_private {
> > >   	void __iomem *link_base;
> > >   	size_t link_len;
> > > -	void __iomem *p0_base;
> > > -	size_t p0_len;
> > > +	void __iomem *pixel_base[DP_STREAM_MAX];
> > > +	size_t pixel_len;
> > >   	int max_stream;
> > >   };
> > > @@ -561,7 +561,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > >   		goto error_link;
> > >   	}
> > > -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
> > > +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
> > >   	if (IS_ERR(dp->panel)) {
> > >   		rc = PTR_ERR(dp->panel);
> > >   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> > > @@ -769,6 +769,7 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
> > >   	}
> > >   	panel->stream_id = stream_id;
> > > +	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
> > 
> > Hmmm.... Would it be better to set it up differently? Allocate one panel
> > per the stream from the beginning and then simply get the first
> > available panel when required? This would require some minimal resource
> > manager, but then we won't have to pass dummy register base to the panel
> > code. Or actually allocate a panel when it is required? Do we need a
> > panel before atomic_enable()?
> > 
> In this series, panel come with MST connectors, Because the connectors are
> dynamically assigned, we don’t know which connector corresponds to which
> stream, so there stream_id and pixel base address are dynamic.

I read this as 'streams are dynamically assigned'. Connectors are fixed
and created for each branch point / real physical connector. Streams are
assigned on the first-serve bases.

> we have 2 optionals here:

What is the runtime requirement for the panels? Are they required for
parsing of the resources or only for the setup of the actual screen?

If we have 5 monitors connected to a single DP controller (via the
complicated topology), how many msm_dp_panel instances do we need to
handle the case, present it to the user and still let it select only 4
of them for the video output?

> 1.panel come with encoder (after bridge remvoed), like that:
> struct msm_dp_mst_encoder {
> 	struct drm_encoder *enc;
> 	int stream_id;
> 	struct msm_dp_panel *dp_panel;
> };

This sounds like a good idea. This way there is no additional resource
management, etc.

> 2. During enable and disable, allocate and release dynamically.
> would you prefer which one?
> > >   	return rc;
> > >   }

-- 
With best wishes
Dmitry

