Return-Path: <linux-arm-msm+bounces-70764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D687B34B4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB97F1B21126
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2243628C87D;
	Mon, 25 Aug 2025 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjlo3I6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8DD28D8ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756152005; cv=none; b=pavD6A4p7c5wpyffMHcG6iunjZIQUK+l4CDsXsKNJGY2dxq4rREwk1jyjWR9V2/9o4gX6W6fsNyTTaG2VeqFR0x5hfnwTeL3sluKp3bT2PZH0AA+BbM/7GQweHYZLQKYMB0w7rbj6hJNyqi5TA5eeMgaL5XGUGgoTo3l1vOfC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756152005; c=relaxed/simple;
	bh=GgVblSA1zMM7t1gvgP3tTk6jx+onVRa+IGzUAL14PZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl4i49tR9ircOlgwgyaubZo13dr9iE+qA/QNcshCGobGIhyCNR3OOLWgze5aQj9B+W2C7Jnu+k9Vyvkt+yjSb5fo8uPvlMXNU+NatXEF7c24u2SgMJVoZ07SOVTz0X3lTzT3NHzSXdnN7QsjK1hTFPYn6/LobimtH0ZqgMwJVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjlo3I6k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG4ALK025091
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=; b=cjlo3I6kOhBPZA0p
	cSlGSa5xmLkswO5obuRr3lT6JCUurIBNg29AZt1dNny5CZcBaCf76N4y2nuELyXf
	ncRqJZeHIPP5OcEcaqOMOJYxu/au6gGmi/qrz6pXyz97bbkWG5tLYmRs/XeiF+yD
	jTVcBDyJLiedm65n8oeOgMwmma2GdCDn2L3XAa1xrrUMtfdgOIo8jzytvoZ0xPSe
	3zOrnvWB0JqyUALi0IcShbU8z5qgIs8jonUFjLPaq7uNGFHGz++Aqzqhla827Nbc
	y2L+7qzuNqSvXmUm7IfSuGfmSBEIXVfB1drY7hXAnmBqR+AHxrx30Ia8vLPriTww
	heiRVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6ddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:00:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9f5bdf6aso67100976d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756151986; x=1756756786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpMXjjOloTbOcv7VKi87DER32XX876zK5UxtTO2ua/w=;
        b=n8aBnABMULd3RHsDM6WpdnX9ST+Fm/E1U0HOhpbUcyqruIJVfMhtySEp5qvJchomrc
         Fp1a3ESli4LgqMuXT3oC+UIncFujB0IxewS+cF3Sw4HI2NueqljNuES7tHBD+7Y+5ba8
         pkCw72yB+Ak4T/pLcNb6JRZQhB2GVV2ZceKdGwlQ4Dn1nr/OSwISLqQD8kzYr+LPrkBZ
         tGf2fd9tKdCWLqi8yw1VS5Vm809zixFIkD2S11m4B1zI2VG6QqNWi9IGK0qBCcRtqhuW
         YH+VgZvyZ5e95fB2aDj8DQgQWMgT4N3BOYNvHMavY8av2uyWpsn6QVtGMnfMUSbBFIEU
         jL7w==
X-Forwarded-Encrypted: i=1; AJvYcCXqP8pBoSBjX00rUMzwlekJanzRBLJn3dK5d71mW9MUOb3EyFgrpD+9mVdoT7FGHpt91CF0hWoBHt5AlRy6@vger.kernel.org
X-Gm-Message-State: AOJu0YzbF7sQjGAlb5LUQKLVIIpaNYkDmGXsFEIbkThB2z1ZcMQbrWNn
	cbxJDbczFXtcubEGtJxrnm81euMMehC+Zxds/3/nRm1hEFkU4mg1FA/ISWV8EjC7aSbUfIEfDeR
	OfE4HLyQXdZSwz7PWkO5s3YvsLyFI6HnPpRbdNlAKTN1OnB5r28+aFbwE+bAyvY3f+PA3
X-Gm-Gg: ASbGnctNfbXtrHoH1QfyWk+5la7zXCCVPiUYHcpwzzNDA6BNL3PfwyiAeVt3qTbtaqB
	81k4YL1TMbforfmW3CiNNXnkaHrpFiWyNzzdjQDaVdiD4pydggHpNW+hcNohB1MmyLU/zWo/hjl
	hmTXMitMcdCKuB9U/YMyWeUHy9WvZm6D1pesrkxDlrUuG1L+6O4PBRITkJo+CU1v+xAuXyHjGW5
	uwMoRZdUSZV/oWLrkGVPy1KP7di3P/PuC5p9ALc0mhWIU6UpN5b0WSCy3055TxGKTtT5x1i8jER
	he9ndaPtsADlK3fLRU2jZ08G3AxM6Ka5gpb2gXcCCB0APajirD5tIk0Ufzyy8Viz7RP6OCJPRte
	sOJcRXlbeC7HhiEeS4rA7JNnsiZk0BlA3GPvW9fFvb5kGx92+xyPA
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id 6a1803df08f44-70dac6c152cmr97978746d6.17.1756151986347;
        Mon, 25 Aug 2025 12:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJCEWzdMqyTuDrQVNON3NoBMK6mCKwkSCCF09YR8Rv+ULva4lyyz7WmxFpfIfcvr79oPndg==
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id 6a1803df08f44-70dac6c152cmr97978436d6.17.1756151985824;
        Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e2687acsm17787781fa.32.2025.08.25.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 12:59:45 -0700 (PDT)
Date: Mon, 25 Aug 2025 22:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <7w522k6vkngqw2tfbmrhuvxxcdlby3wwzueaqw75pxud2y7puw@2rjhjl5ikn6c>
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
 <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
 <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03y1s+EdkNm0nWFL7yuR8y=YuBs-OJaKquOh4izwKc_nA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68acc0c0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=ogmizbzjsSRwc_UF5_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX229mywZ4YVjk
 5gfqtpEYefqU2Gaq71Lm43czLNJnDaGS8ixf7fkH3N5yfgsQdQYA3N1+7v2OhFEdT8au2/80LxC
 w0i5ElX4BR5/Zf+UqxID/uWugm30McrGLPLG2PQB62sLXJXknVyo3fGstmv0jXY3pZqoDwXjGKU
 Qf8SifKbdKvPgqZn55KCNPhn8ajrp1rBoxi6MFsE4rOn3YZ1OMnaqyHBB5J/nByZS4pRNXaBZYo
 R2yJ9gmJ4oE5IppPU3zwoOoqDQX90WG0lFGyk6tPgJtrBnKlc+QsnILk0gsFUI927JjuFmn80XY
 PmouO+8rUFX/q3lyJEfXqEBP/DOw5vcINnzJnmlsCsD3QgonVH68FCEyINySqK0RV2cRbzVsPlE
 GCDa4B0U
X-Proofpoint-GUID: 4JwLsQv9_iPyyyZGuIs-9LOy_0EbC5PK
X-Proofpoint-ORIG-GUID: 4JwLsQv9_iPyyyZGuIs-9LOy_0EbC5PK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 10:48:06AM -0700, Rob Clark wrote:
> On Mon, Aug 25, 2025 at 9:23 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > On 8/23/2025 7:46 PM, Rob Clark wrote:
> > > On Sat, Aug 23, 2025 at 6:49 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> > >>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> > >>> before adreno_common.xml.h is generated in trees that generate Adreno
> > >>> headers at build time. Make msm-y depend on the generated headers,
> > >>> removing the race.
> > >>>
> > >>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> > >>> ---
> > >>>  drivers/gpu/drm/msm/Makefile | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > >>> index 0c0dfb25f01b..1a918d44ac48 100644
> > >>> --- a/drivers/gpu/drm/msm/Makefile
> > >>> +++ b/drivers/gpu/drm/msm/Makefile
> > >>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
> > >>>       generated/sfpb.xml.h
> > >>>
> > >>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > >>
> > >> I'd say, no. The idea was that msm-y should not depend on
> > >> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.
> > >
> > > probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> > >
> > > In the mean time, I think we were going to drop this patch from the IFPC series
> >
> > Yeah. I will drop that patch.
> >
> > Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?
> 
> I suppose _technically_ it is, but the split btwn msm_gpu and adreno
> really only made sense for a2xx, and only if we tried to upstream the
> old 2d core, which never happened

Granted that there seem to be nobody interested in OpenVG anymore, I
suggest we forget that Z180 existed. I think it would be wise to
simplify things for the GPU cores (merging more of the msm_gpu_* into
adreno/).

-- 
With best wishes
Dmitry

