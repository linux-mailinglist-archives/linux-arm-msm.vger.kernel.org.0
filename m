Return-Path: <linux-arm-msm+bounces-71529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBFB3FABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25EA316C0DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB23275106;
	Tue,  2 Sep 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYvIywrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DC2E8E0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805787; cv=none; b=kwwFUlpEps1LJ8iDj/EC7f4u1roK3nnyabT5WDK/N+UbTD4jmuNSIQHRh0YSVL6wmYBNIP1Yr/VSroRHZV7Jv9nPurT6O4gvsHUkTT2ma2grPogZtX7DIPK0rg84zVaLVvupk/ziA1m00m9tG9aqCg83gw9W1EJnp/Tpo2zGL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805787; c=relaxed/simple;
	bh=YYBOJ0SUlz8HvGAIGlmhlyEV4PWBo+R1ZBUAuZZS+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeTHVLQZik/bR9zpI6xSX0aq2sacqfN0mwdHo0Pzqk36Va8OICHhI6htlGUQ0pmlSBD7x5WMa7jMn/A3qMqy32FhLJiAuS7rihzgNPgVXzhATsT4tdpC7MJ5o3L72rBye8CSpP2EVhprysM6eRZg9u6j2cqSFkB7nsYVeJ1Mikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYvIywrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rog4029965
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zwxseqR+TZhAlHd8nXn4rEVr
	gvLiKS1QfDCvUia9uDs=; b=BYvIywrX3heQ7ne5hRRZ5urv5nl4T7xAfnc+SZM1
	/i5UPcTEuA/pByNJR0mc3t+cw+DdPg8mYjpo8RAcOSuTkTWvJhpcr/BAuzYDC1x+
	rnip3mPByRZc1p/LcON3dNibvaAyzY99svf9HnmOiKPDPJleFdLGcTrDpp6oVQYG
	YBtCVvI1NloXtXqOOqMAPQwzgQVMWt3pOGGwo2GLlWkLvNsfm7A40wUSt179x/1w
	8joq2vla9hDBamSayx3Gjl0H/Mr0E1kpSqZSBgBke1+VmT1z00xLtZQb+j61CVRk
	Iua3yEjZh4VDVx8jhku+r7DMkHn+VWS04c6zZRYzguMKGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy34nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:36:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2f7851326so129158081cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805784; x=1757410584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwxseqR+TZhAlHd8nXn4rEVrgvLiKS1QfDCvUia9uDs=;
        b=xRyDCvpUgFvMvLHrHkwraZb3gphyLdHJytTDFixZe7PP1MQed9dkl1G4RI3rxrWD3j
         I9fvULZwb1Brkr6kqIByc5Y/u/5UOiJM27KuEiGpHIVCTkXDpugfDKBtukez/XPcRHYP
         ATGz0rEXEeFBIH5RcU7cpJx+/iNimE7gLmW3BHiinF1xf1huviMDUx+eojmMnAX4ARqS
         ENZUR1NxSx4wFa9+igL5QgM34oI54Ef4JbIfP27DUIMDlcr9uLsypJpDhSjMtDMhbZHj
         Tg+bulccF0gT5b0+4WQ5MZESqGchcQni6havgOhSZQnDhbkNP2PQ9kv1mNg+c7y3kt4H
         1jWg==
X-Forwarded-Encrypted: i=1; AJvYcCVGRG5/PBs5EBxh8pYdaMIF9BoPtD7GCe4udnNBQhmNmGVChROJTkFyKFP8KAHXLTY+2kYNlPaR6VMJtn5G@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJ3nJDpUAPFFu8IyChD5X4n8GA4/QW65bOzul2gnK/bQexibH
	HDt4uDBUHGJNxQI+KGMGsNTzfxBj88uGQOKyx/HhIMgA4pizPJs0giJlMstUtea2W8F0X3hFP5X
	m4YtTerEPC6/Xb0ThkFkMRa0WN/X+iPYa/u2PI2WgEW+RISS7Eeh1eoLgSKK5h7qUaA5Z
X-Gm-Gg: ASbGncsYXPOuw+Adc2wdAcCckwkCTSxYJwefMicvoTie8d6LLzAGnfykweYrMjF+ELS
	Rf4z0iziD9MnFx6lnibwi3+DWz2WAaDGuB6G8MUggJux8UlkNfr38/YCtRwOAcYG2KzNNVubwf9
	ph/CsRxIGUFVNbQT+d+bK7fgmrjJBcV8wkcpPVtUWDAu+kY1TRJAFwcWpFhMuWMeL62+048tCi9
	GbtnWNBXqzFHoSmKT4mYgKWRKwOm3onQtNGFYEDGedDevh+XSYE4RiLlAuVp5BVE7T3mlJHSyr+
	xjOuYPvnX09+crxbYjCvBIX8S0PD5Kzx/g52U7lFk5KkDYR7kMBwtuFC34kJs7hMydJ7DVDjIrj
	yQIYeV2U10mM5KhLRHvKToC+W2n/hg8iVcJb6dV3nKmUF5K4Aq+1i
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id d75a77b69052e-4b3459c7a6bmr18166001cf.47.1756805784132;
        Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx6nrwggqsOXBxF3/OABMklDbP3IK5x4SRajgGDGpPKXyjhgzvQjkfyqsdwZoBMZXal4NHjQ==
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id d75a77b69052e-4b3459c7a6bmr18165671cf.47.1756805783493;
        Tue, 02 Sep 2025 02:36:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827aabf5sm544368e87.137.2025.09.02.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:36:22 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:36:20 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6ba99 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kpPRz-UtyBwCQlaFug4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LDM-AXeQd0xP_L7zlmiKvuOhuXkqk57A
X-Proofpoint-ORIG-GUID: LDM-AXeQd0xP_L7zlmiKvuOhuXkqk57A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwUcW7mSxefsw
 gfn0I1mpZsCAPrwKDWnCGccS3gwPfUBJtfDnCxXbNcfORA6svvZ/G/ISw9jg+Xuzd6D+YfT4Rhj
 cWPNdvhVu9rgg2TtKwXaOn6/xdfb4qh4w9Y9Glh//3aaTYP6Wa3hs2MTHTG/sWl8IwqMAm93sJk
 yZCVIcSlCWHm0o8ISBvlwXVwNnZNghfM5Xv24Ncpj8PJ5PwsSeVQQuxV9VFXmag5f4GaPDurcCu
 KJiyt02DaGL5jLgOqRkhgnPIoiIV5AMIG+UuwMr6ZCXZz7fv5bv8LLB/w6g9li/WT+YMlo28ugj
 o/pKroD8FAUiG9umaA/tL4357ex41Vq6risS3l5nT7v2vZzxlrZDxBlPGcEIr/jIieQnlcNTdZO
 SJvR5ELE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > state management complexity. This change removes the drm_edid member from
> > 
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages. Please use imperative language instead of describing
> > the changes.
> > 
> > THe patch LGTM.
> > 
> Thanks, will update it in next version. Since the HPD refactor series are
> unlikely to be merged soon. Can I separate out some patches from the MST
> series that don't have dependencies and send them individually to make it
> get applied? This would help reduce the number of the MST series.

Yes, of course. Please keep version number monothonic for those patches
(e.g. by telling b4 that it should start from v4).

> 
> > > the panel structure and refactors related functions to use locally read
> > > EDID data instead.
> > > 
> > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > - Cleans up unused drm_edid_free() calls
> > > 
> > > This simplifies EDID handling and avoids stale data issues.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > >   3 files changed, 26 insertions(+), 58 deletions(-)
> > > 
> > 
> 
> 

-- 
With best wishes
Dmitry

