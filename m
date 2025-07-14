Return-Path: <linux-arm-msm+bounces-64871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F6B04845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC80016F351
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BFD25A645;
	Mon, 14 Jul 2025 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mx1UGOQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045123643E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523755; cv=none; b=XSN3AkC8c/Tu8oENWwsvpoC9tFQKuVQ+X/2prdY5L5U34De2kiBiCdAJJo6lAXI2JHEtALhpK46eeMzKDGgFlykHoFH37jcLBFVz9gR8HhN9ZrvZS06GCBewa1yBDyDX10Ws907DfDvYxvRi5lQZ0ISckB18M7ShMeL0Bstu2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523755; c=relaxed/simple;
	bh=lgd7QpvOCyceSJfIrVyc3olWEXMmHMBdr7ZhBn1fnsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTyfpF2lg9npLrnxTrJW7dr+yovfPMrLghrEqMubtaZWqLJ9VRTVvuxpRAi3mpNUTt6cadny9jS0s4Ctxgnn0YLTmkkCI+ERxE1QRJHxEilk0Y5V1tEvMgJS/Aq4fdvuXPTLUHZE7d2nLH3HvHPSbAqGq0Y5bFNnUjGuU2GxDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mx1UGOQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHAu1N006286
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LR7DJLBr371ZvWFey7V16qQwMz2IBYn4TcJ7HsIZaCY=; b=Mx
	1UGOQyjdVLYLElOWQ+tzUpkAXc1Lcx4OjwDz8UDlJAP/UyqmILxL93zDgAwNExV5
	FGYzsqYYDwTwvOxEedA3c0LtCLDxJwJFyy4KsNvZlWrx0v1seknmx2Pn2ob32G0h
	X246PaNdBxEAXH9vA6r5p9cdvhFUz6VdT6T7qpCArzau0IDJf8zBoeDnrgAMBYaH
	o3XQ+jU9lhI34yUUh7FTgGBtAexbwTkIz8QuMnNTAuJScsGoDLMaO2EAMe2dbONB
	ip7HCgbHUfE7dsRlA/Qja797gfGsxUAgIa6BziXlsW3l2gZC9z5mDhJlhv8VPwyw
	KHhppZXBcdeLnellWzHA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37wvx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:09:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-41b916dca69so102532b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523750; x=1753128550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR7DJLBr371ZvWFey7V16qQwMz2IBYn4TcJ7HsIZaCY=;
        b=hSly/AsZsmXalUI4WFN143R3EqPdgdMmz3Pch1DJUd61QObOFPWzaQG2LUuSfDQ4Ws
         PyM5lk0WTlBqpTW6CZ/jNT7iPibqmDemvLBFkcarGak4BJ1c533iCIwaN8jb3CTQhE3I
         1LwaWKpG3BaQu07EoUQNUBVHsevQDstJKT2+CXohgjuwc/Mq9wrxhbI/aiaFGI4w40AY
         iARPzSnOc4lQ92Bao7iWypl6SUJeohol0GynzkqxoKv0GxVkSNHK0dimIiFTWoLsOC6S
         Z7Fq/JxJkgPreK7mPIAnSEJoo+tCYgbxosabaUkRoKBtKgMay6hLLP8lCsja3tBasYos
         nTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyJ8/KMOH0/VMMW8uYI2l/3OrhQfWHMsrETTzYwHOs4GcLKt08kRD1CDQAs8PT4uhyLHD+Ns5RB+i4P9y8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbuXz68c/8mR35dwOGlYlKQnOLff3TxRZLK/OSXb6WAmjjpQn
	iqB2Wbm3NhijCQsb0dSU244DN7YsK2vaeDLAMqUX2pJOLjrE/eAT83TSeJop1lXexkw3vFz9e8m
	kyREDlgmKs8N/GLS1eTp+T2aqFeeOzmmp+Gv12vyD1sejjGkQsGfeboHPfWYCMmriOyIcGY9cH6
	0eFGkH1whuaGGGj5Gtl8LluSyCvM8XQ50JgQ70pdZvhlY=
X-Gm-Gg: ASbGncuA8CizbAtY7d7SbTO4H+R/aJXwwOOXTRt/vE9EtVHT0WnLDPek65O7u2V7S1e
	KPoeqvfnmaUxnrYOmMzxZTX4cu7DKBDHv33qZ0RdMqIDxcPIJHvDxC/P5zCdO2eDDgxxW/vodp1
	65JTmdiMIl5BRMbJvhxyTWCw5RoVyJJDyFqvwjfY9W4h8xiItDzPdx
X-Received: by 2002:a05:6820:5209:b0:615:73d7:1714 with SMTP id 006d021491bc7-61573d78d13mr4217627eaf.2.1752523750283;
        Mon, 14 Jul 2025 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeaOzmnBuIkphxKtr/iO5+vCVTpxEKvoFvIUraxopA2iAaj7ZDVHmxIEqZWTXVIp2qr1osE2m2bD+9zxzjPlE=
X-Received: by 2002:a05:6820:5209:b0:615:73d7:1714 with SMTP id
 006d021491bc7-61573d78d13mr4217599eaf.2.1752523749868; Mon, 14 Jul 2025
 13:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com> <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com> <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
 <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
In-Reply-To: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:08:59 -0700
X-Gm-Features: Ac12FXzhkgltGmhl09vK_3sIIje-U-wWELebiK9aDQ0FYeQT8NG_-WoOB3au0iY
Message-ID: <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Doug Anderson <dianders@chromium.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzMiBTYWx0ZWRfX3q9otgLGJ/VF
 qncy8YnwuUnvEKrv4rpQhN1sXPXSg5P9A07jFlwZlEPlKkKS0enigwyhS0FMnGAFAN7igpxG7+V
 4rmwkv6Uobb7gNvuFShFKOT4vTW0AUjQpT+chhxHwzMkLLEInYYvkW1cCiXzGcg5LZl2sxwyHX5
 EA2eWYyumMhAmRnfW5SresBN6Eh8Yb6bhZBTyAdn2vUxKE6RFAZAo1ROnnnb6Rrvgby1DfWIL9h
 GThw0Asj4gS4ma/t1nP9jQ1sJlXJkB4Fa7OwaDdL1wTkPOjj1EdTRRL63ICs9nFfAsbTKtRZf8I
 M7QKPi3k4dcEcvtxlRE5WtvsA1uKJz2KYoRHOoFwriAHfvDkFRXWkt0lgeVW9AMcm1tn84TjBry
 G1J8BTJb2ByN6bvhzC6O1kB0rYqRofzXJ38vSgNhZO+cviwzJbDVNHjWQERrlZDlHfcJxGHQ
X-Proofpoint-GUID: wuJDjvs_bbQ44GPnQWWzooJEeOr1pZZY
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687563e7 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=dRXE1jWJAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=nhpro71emhRR61KsPv4A:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=I84_JwFgYcz8Gf5-qaVM:22
X-Proofpoint-ORIG-GUID: wuJDjvs_bbQ44GPnQWWzooJEeOr1pZZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140132

On Mon, Jul 14, 2025 at 12:56=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Mon, Jun 30, 2025 at 9:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> > >
> > >
> > > On 30-Jun-25 15:46, Rob Clark wrote:
> > >> On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
> > >> <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>>
> > >>>
> > >>>
> > >>> On 29-Jun-25 15:58, Rob Clark wrote:
> > >>>> These runners are no more.  So remove the jobs.
> > >>>>
> > >>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > >>>> ---
> > >>>
> > >>> Do we have anyone using cheza at all anymore then?
> > >>
> > >> Probably not
> > >
> > > Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> > > get rid of it upstream, as it never made it to the outside-outside
> > > world..
> > >
> > > Konrad
> >
> > I am not aware of anyone using Cheza boards within Qcom. So it is fine
> > with me if you plan to remove the DT bits.
>
> As far as I'm aware, anyone at Google who had a cheza gave it to Rob
> to put in his lab. If Rob says nobody is using it then I'm 99.9%
> certain that nobody at Google is using it anymore. There were a very
> small number of external developers who were given a cheza prototype
> but I can't quite imagine any of them still using it.

If it helps, this is what the batteries looked like when we pulled the
cheza's out of the CI farm:

https://photos.app.goo.gl/Eh8EJhqBhKUuYfiH8

;-)

BR,
-R

