Return-Path: <linux-arm-msm+bounces-71600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF7B400CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A8B3A2016
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640BA23A989;
	Tue,  2 Sep 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOUDiaID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DE231C9F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816506; cv=none; b=eJBba2Wq58x42CihIXNwHnVH9ELDo87IcNvPPfa58cvS3hFgyfMJM0DDY7xnXWjVP3w7GwEjRLziEQ1OqpRdU0VmeayFB9JPGyv7jMyc659K7F6nPOAO1I3pENbUWyYNS/OQcjhkG5/a4vrRkEGx9rNwram4M0LWBFkzgSbctVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816506; c=relaxed/simple;
	bh=LsELzEw8Q8N1hec1/lB7lSUYwB0wSGJsbCJHldjKkD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miKoOXUBTGjqyi2y+nUdVgk4++9cK0/5ahp+D7InuYactKcCpQn+Evi+oSXCTBTZQFTSxJe3R8jQOzcUiEMKvFvPP/KEjZb1hItrHZhGUs6ScEg4LNYSr6ehEpUw5jtPOGUqvy9SuahpztXoeMQmfEITQLyt1AB0vrKjRPBu/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOUDiaID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BIPIg015197
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4rVQpxPPO+FQPgP3B3UuvMg
	XoWmixIq4Cskx+zX+jI=; b=AOUDiaIDOm5Fthrt+eQBaDoLAMOABN3sm7UL2qPI
	aZWN6UlGTDdR/90xc5qKg3qwW1RNpaDUwKQg8b+5iXIbOLHkLElDTkD4pOZJNVm+
	I91o5Zoa6Od63CX4a0F+4hwKGx9IXX5l3BauAwj+G4KRcKkaa9TPYYIcnZ9osNeU
	4TfcMruhuwyghHnfw1F957otT+rOHSr7RqETecK1kds0tLWiwMl2EF0bLZjoV1v6
	Ffu1QKlH7D2axvr0YSaUIkGADq5HgsgYljt0ZG2wrHmgtZdeYjnld7wjA7WAWalt
	YhiinRjnYyxmreETv1UTnpD/qdja/yJt4BmoIEH7SrCeOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyys7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:35:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3118ab93aso69778981cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816503; x=1757421303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4rVQpxPPO+FQPgP3B3UuvMgXoWmixIq4Cskx+zX+jI=;
        b=JuBhmqcqaakJTjVCRyrRywdAbYYAVHyn3rXXPi3U1unOq1MfOinu43M/qm1XDTvW/6
         DOriOC3gpXsakL5WIODIe0n/EEYd+huC1+sogbPKlEi047RfSkrAX/C0K/hwXPlWOed2
         MRucwL/wiH794Z6GhNrAZlLyywFX3uLmOOCfFA7/I4gV2N2mpEwFHPkzipJpn3M8GbFk
         nhCXBNMt600RqV1rU29oABzIZCWPcn8SKGppCufP3Pvn+81hXPJS480hJ9h39Y7iLJ3S
         TeLokGt/WO/n03mvJkyWwEmhbaAdgZg2UQsASr+gzB6n1QsFI9QS1KsRYh+NadXWjdfv
         ryYw==
X-Forwarded-Encrypted: i=1; AJvYcCVhJUjrpNGMACA/SPOghxAoBKI6wQ1HNJbJwZ+vkYQvl3hGfFYRkUUxLufNUHIkCALO0sad/GPUq/sSk0MU@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDp1GZxACNxCOjDOBk44pzMxqUNZ2kheLRadn5lua/amg4deC
	gduMYTK/t135orGisqTRD5OdlprbemLIxsWzvaF7mpJi8XK2+2cbJOxeM2k/9/qWIuG4HrnW6kq
	3/zNY0jQsEEj5SdRQzQJWv7r96F89oeEVhO6fuCf9XOk+hoeqwggHkQUgrnWYOxehq7lk
X-Gm-Gg: ASbGnctpR6LK/BUWcDni6+sQ3VO3eLCEc2seyLB69xfb8pwZRHvrzu/9QngK8PAjivA
	qzFu2/1rkRYJn1a+qpYHxHj2bnkdR2aS8hWnePYTxFAqBMn0t3o1RT85xIazfRRr8qL7ztJ4Mzd
	swURX/0YytW6Ec2POS+n3hsjoPL8W/hP1ki+YokhqsV8iqADDt+/xB2DYeExkdQWPHDh4AEmUiS
	VvLCSTvrdHYQnwYFh3iOx5pDaH7YlrbEf0/kcXkpdi2Cl0rrNkcjZhTAn7BGbQz78rGA3mGHRuU
	8n5bAaTKN47SFnnrmIvniZofpzoNwd5UihZEHzo8Kc7y2AoDu2nhaG930Amgv81PJrvbFXG5n2/
	AgTN1OEGy/uYofZwLLWes2kaN8R/kTkL5V2rnlaXykV9Q6CW8U5t6
X-Received: by 2002:ac8:5d49:0:b0:4b2:8ac4:ef72 with SMTP id d75a77b69052e-4b31dcd0d89mr141080081cf.65.1756816502566;
        Tue, 02 Sep 2025 05:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU/aLTJMFsLAMJ+zNuNGOEzmGzhvygt22y0Or38v41tO37Dhmnsn2U9YWvwA5+Rbfi+EGYqg==
X-Received: by 2002:ac8:5d49:0:b0:4b2:8ac4:ef72 with SMTP id d75a77b69052e-4b31dcd0d89mr141079651cf.65.1756816501921;
        Tue, 02 Sep 2025 05:35:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a71bfsm672243e87.129.2025.09.02.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:35:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:34:59 +0300
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
Message-ID: <z3erghqmjodsqbkkzzxtdt7ca3xw2esj3jqsshouipqu2mqvx2@kwxqs6d2ntuu>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
 <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
 <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
X-Proofpoint-GUID: FyDP51h0s1CRUKTaU-3bgxzDlTYEPSaU
X-Proofpoint-ORIG-GUID: FyDP51h0s1CRUKTaU-3bgxzDlTYEPSaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5nUu5rw04c3C
 B0s+07W+v5fQRbpwZGfh46PPJabpNsVis6h8f7Vtkr/qdGJKWFpX4NNxGKXwTsHJ3WQziP3gZHo
 lJneQaKIWT/Wp80BVGRg006pnJavCp0ln6x1T7+epEScQNJ5jEnuzd4bZbP+Dne7wujBeCvHHGV
 mYRTPcwHthWbgnRDjwV9YJYtxQVgXLVVka7ndUIW0JWgs+O7jT2Gr+wn0AZS47kpJZh2QwwgFo/
 xQvXBYBNl54Y0Uat+lCPI91qMpsW0SbXSCmol4G0Y66tyXe9oezv+CxjarmqSpbJUHhqW2qfvLX
 ncG0AuSnwrxYKFgrJ88nc8RmZ6qKuDihyhiEd+FXt+1nzkkvkfLZiEOjjbZpCEnYv9mKEKHlEVb
 lnZawKIt
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6e477 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pUvFZNViTmPBewPdAa8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Tue, Sep 02, 2025 at 06:19:11PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/2/2025 5:36 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > > > state management complexity. This change removes the drm_edid member from
> > > > 
> > > > Please see Documentation/process/submitting-patches.rst on how to write
> > > > commit messages. Please use imperative language instead of describing
> > > > the changes.
> > > > 
> > > > THe patch LGTM.
> > > > 
> > > Thanks, will update it in next version. Since the HPD refactor series are
> > > unlikely to be merged soon. Can I separate out some patches from the MST
> > > series that don't have dependencies and send them individually to make it
> > > get applied? This would help reduce the number of the MST series.
> > 
> > Yes, of course. Please keep version number monothonic for those patches
> > (e.g. by telling b4 that it should start from v4).
> > 
> Sure. Thanks,  I want to confirm whether the patches should be sent
> individually or grouped into a series? They seem to be logically unrelated.
> I was originally planning to send each one separately.>>

You can send them separately.

> > > > > the panel structure and refactors related functions to use locally read
> > > > > EDID data instead.
> > > > > 
> > > > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > > > - Cleans up unused drm_edid_free() calls
> > > > > 
> > > > > This simplifies EDID handling and avoids stale data issues.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > > > >    3 files changed, 26 insertions(+), 58 deletions(-)
> > > > > 
> > > > 
> > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

