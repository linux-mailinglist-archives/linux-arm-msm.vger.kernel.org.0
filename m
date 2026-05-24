Return-Path: <linux-arm-msm+bounces-109492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOV8MoPLEmrk3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 11:57:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1AC5C1D45
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 11:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C3823004601
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF97D3911BC;
	Sun, 24 May 2026 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj9njkOe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjiE0NOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071D38F249
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779616640; cv=none; b=csZqh1U9EQyMTJqIc/YkBoxgs81f8o51uv9oucSV9yhj9WHDinIhYjRTbbnC7+FmgakEM8x3gsRO5lxRksapkxYQs6Bi+QlVsonfhz0pBRv2IOgfhsiPGdws0dUFALrxlZXCW3vCDXttDOFkodp55IizCAVfXUdlA/s4VAQAYgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779616640; c=relaxed/simple;
	bh=SQxtPZDbyD1sz1n6nWYfrIsBokYFb/gdgoObj681I/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMKhXtN9sWXUMLunfT0jHFx/4FYbhDYqe2C2uta9dMmTEldtUv5pDRH6wQuqsNzV3Vq5Gaeit7l+Yz/MKsn5Y4nCMVsdEIvHJNcrUGnhNx1/S+zFb+hVJ+I0RPQWQaICefnQBWa+g/4S0gU0HOYp0xeGmQegKZENjzL0/qjyu38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj9njkOe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjiE0NOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O7q1r83233247
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WECMzIHcFOMo/Uik7+1vSfMf
	c4YRMdyFmzp0mcarGAk=; b=jj9njkOenktmdwQzxhbCvaJq8G3QWczahF/njtY6
	oVMjQg2BXT3FMFjkZ6ZAQ5kfOaPBgO7iI8fV6bWrflhgBj4XpWItkFPFyBV37SUs
	YU9a4O6lkD1n7r/VwGXhPFDkewep2ZA/aB5Sk3FyurSsW0I6YJQJyeC9xBSA/QqT
	2tg+nelwnL9QkLe3OCh4ZFVns+iLhUsLBJ/XfiM8Kvr+fdQqPGLCDglbODDwMJmY
	0Fqnoo/MNGv8rvf1iAlx48hmZs9/vdXT2hpKBjyZYKwu6gb6ytbO87JvaWWIpx4K
	rhfT32Cx/EZZbR/EYKi12H1we1Lz4nEaZ7kWjcG9d2zsug==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3avxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:57:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313cb80e7eso11146516137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779616637; x=1780221437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WECMzIHcFOMo/Uik7+1vSfMfc4YRMdyFmzp0mcarGAk=;
        b=AjiE0NOOPMTUPsWQx3H8oAfxqtuyOUEN40ccGpbhtdOg5uw6g8ToBXx+FH5mK1ySen
         45/AhhZqrtyBRSXSayMC6EQSFYkMHdxK4UKRb5ZJ03Pb0NiWv8zQe6EGxX5dGpqLtXhc
         dpGnZZ78KUrKlbaciSiizFQvTKYAENDUI2LuPc3lN5BBiJTwKwb+PNHF8eoWVksV69Ym
         8H7jzVMsTSoaqO7BmskxffupqCHwSVpr8HU58hLwu7vlthbxpjrq5CS9xC8UFSE6fjmu
         UlRiIsgiQyJuIs96dBgvBQIdUwliaHaK4AeNdLyxHwRrSjuoyxML65EFVwlEV3/cVnRX
         Je7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779616637; x=1780221437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WECMzIHcFOMo/Uik7+1vSfMfc4YRMdyFmzp0mcarGAk=;
        b=eVfZyeHcWPDxRvoiTjQsGuSECXE96q+agwzmEZlP+AFRT8ba2oyBNDmOQXacCV6aj6
         G0jmTmTPE13bwBQONFmF8P2Y7FZRmqAJ4eLnLQMvwTeDS4JtO1mTliYJALsXSRsl7ljB
         5v31OQG5Ha9CCpFcPOpyhvdGKd1MpO3QmeIbNY1B+8u2vQSgvrsyXQXIeRr3vj24oEkN
         gD/h01IvdwJ5NhOxMCI6DXvh01FDMB7Zd+6Anh3M/Ey6oMMJNfGB2Et+Mn1euXEF60iX
         tJTec2YZ7i0u/bpRwruj9h0jlSZ0J6eDgtyS8mGi+vnCVM4Jqez7EQPDneKdwLo7cwOA
         4Lfg==
X-Forwarded-Encrypted: i=1; AFNElJ/CjsXHXn97jHifoGqWx1WJMnyZ3EhwHvNOBUfrv2i98eA4mLYuyP7jPR3MPT2oyYit3lfLJ7mSljfTbZOM@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNDEqAQMQP0oJviF5+rXa3Yv8eTMtVv/haWugseNPFYUPGb55
	X+Zd5sFyTB+kZpnIt5CTGqGh4x1xgh0wamprbLpPl1WtimIsboQBHQC+j1KHDIFMz0yYKVXC66d
	9W+I44C1+Ps0mb1YxrWPKiSi66z6gsel95yMA8/r8fxrsutVMq1PzfD7xLpZIw/aM40l4
X-Gm-Gg: Acq92OEJBoi7vShPGm8T1CeTa8FcBvVdS82cejP+BntCWFcAJ6FvS6XFfsV9k6Fcklz
	8ktl9KGDShbnuHdpr7HRLclykv9NpIDC7HHWxvcXeNOWS+735FipM+sLYBfBRYrF5UApAKJ6iVP
	c4EPsxuRFuDlQX02IZ7kYExy6dh+nU/0iiKzJgjfodtNdKW89BYGjBMa3j9EDfuyhQLGBOKBI7S
	uH+Eydrv8lng8U9Uz7brxMH9VV7G/RVDPGi3QRXs8hueABrhfUai6NQZlpPh9rvfVpPMlL09QCG
	2XWAKsOqC1Xpq1BezqqrW/boffydfKt4iRPMNXZDZ93Tt+owyaX7Pdbav2bk7T4/ide80diZjV8
	BmQVj1EoQptTICW/RCFtos2oRAntDF8BT/Mi8Iv4XjEyV+lb8CzC5hKRlKqEgr3vtpw8F2ya9LV
	KRZIZSoJL0Le/mVW50QvFZyuUEmfhHIGuqIBo=
X-Received: by 2002:a05:6102:4424:b0:631:3bbb:f23f with SMTP id ada2fe7eead31-67c8113bf3dmr4876265137.26.1779616637397;
        Sun, 24 May 2026 02:57:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4424:b0:631:3bbb:f23f with SMTP id ada2fe7eead31-67c8113bf3dmr4876253137.26.1779616636937;
        Sun, 24 May 2026 02:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cea754sm1782363e87.53.2026.05.24.02.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:57:15 -0700 (PDT)
Date: Sun, 24 May 2026 12:57:14 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/10] drm/msm/dp: Add sink_count to debug logs
Message-ID: <x6wsf7ht26uotuszokvadqttkoglcxs2vepszanuijxqmezpoq@lfjw3zw37t47>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-8-0c8450737d64@oss.qualcomm.com>
 <e8b8834c-3bb2-40fa-9508-53381839d417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b8834c-3bb2-40fa-9508-53381839d417@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 73rjBxHxXGOahoUHEgJVeYWIQ-8q66v6
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a12cb7e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=t5iseO5INfQlQVqLfegA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwMCBTYWx0ZWRfX9ylJ9ZswSR6f
 epBbv6yyo1JcogmRQxFy6m7oHVpuVNCNRsJHJ/ZqMffvcRIPt+UU6f4U/SKqJsT3Vn/rRczIXWF
 7/U/JmRfnwWtAJhuLbR+Kdn9WMmL47lWUlEMGoTuBzobg8KE+Rlb6O3McAyMjjVt6LWaS79c+HC
 jtmeMX78pwUNHJnNq/SfRzREE+h/WkNuZXFuQeDMvtLVMVExlxUUm7Pwlxgn1Rw+NLlj6WxqfOe
 3xzEvbGJytVb6m1Hsj28ja4P7n530jPckbo5TrRx5yaiLzFCfEJynjOYaDnlPOG8+6Fojc56+2h
 ukWacStEALIxhcELIPm+IXfJxSjvPOIKjVhPV8rQk9qY7V5mu5odDZzScYf25a023+rz59sqGr5
 RpWtzOOeUL2N5VsqSZCkQdncowCrl9dSlSVJ4u9yymhbFsCr+9ndgVzKPNkAyo5cGfy5BCaLMcF
 7nY4Ay3Cn45ZI41ZD0w==
X-Proofpoint-GUID: 73rjBxHxXGOahoUHEgJVeYWIQ-8q66v6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240100
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109492-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C1AC5C1D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:40:36PM +0200, Konrad Dybcio wrote:
> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jesszhan0024@gmail.com>
> > 
> > Add sink count to the debug logs for [un]plug and HPD IRQ handling.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > [DB: dropped link_ready handling]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index d61a8ddd30a8..b4deeea0ec59 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -388,8 +388,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
> >  	int ret;
> >  	struct platform_device *pdev = dp->msm_dp_display.pdev;
> >  
> > -	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
> > -			dp->msm_dp_display.connector_type);
> > +	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
> 
> dp->link->sink_count is an u8 (perhaps over-eagerly? 'int' seems to
> be fine for "amount of things") and the struct gets padded anyway as
> of right now

i915 also uses u8 for sink_count. I think we can sort that out later.

-- 
With best wishes
Dmitry

