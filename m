Return-Path: <linux-arm-msm+bounces-75624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585FBAE6E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01CC81944D76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14369283695;
	Tue, 30 Sep 2025 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvqfauCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD92857C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260053; cv=none; b=Tsq/oGP0t+YzWQUEZ1kV9U78dQW9D3zTvlJkvCJpCwbLy9jOKTdp7kWlFs+bNrlTn1eL1lPhAvUWrf/7btcRhA3FAd4cx0kAA6VPjw8i+4glQkhibSztYigqsIarQlQfiet+kj2n11v7NdbHofm73zyjCO6/sd5+FkXwz3Z4xjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260053; c=relaxed/simple;
	bh=4tUw/b7NIJ5cITKTzV2ZIfg9qQkiXrTbCT2hGU5nEvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZoY5wpm7ITzBiX+JejmS+kB08zFCNkSKUACPvrFIjDLnMkAGLyUWlsPzbaUyXN2Md6wH8KH4ToHdFyNLmpsD8eSTh2dVnZkXyCK2w2qfkjJehh/xchF3C9TYC+I/DhYBZ3++AXydij22CXZD0HgaDojdey2X6ab/s9Y+QsdJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvqfauCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCAODG020474
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=; b=QvqfauCoLCsFHunX
	BW86ook4l0mDvdjjOiDOGqcsZnMBR0QjXPr5w0Fh1ir4MAaYUxNmE6N3CorKuHcS
	QKTAtV50kLvUayA/gTgxQnrycTPzg4KvRmimnmFUCiVKhAEQxjHx4tdZxfvES3RG
	oTFF1PIpdIK82Q9Z7I+5YFb272irfvWvirWb4OkSI+9/Ldi9J8ogcHCM3H6mbGyw
	K1vSOcf++D5HqneStj8qqQlRJKQLOQ18NF3asMJW1gRAIbj9R/P8vwxt2OBXCsX2
	UTiu3mKqXDwbiLQ+13xAqQqmcQTt/j7yeCJvE5wF2yAzDnBMZ6uXPiee71XLOU3w
	7VoiXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5tbrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:20:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0fcbf8eb0so71990521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260049; x=1759864849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=;
        b=k2/n0t8o2PvRacuIKNVWWWH8uANZnVF+2/Oa7HWHKYwAB0u2pzUum/CK8DaFZfiLhc
         +u2UzGaBaL3NUQmTU4s3H5AbkAeDl4MPFKgKyZ1qj0BuyScIAE3nKxrH3ldSHulaXKDT
         0ZMwypU9FfizN4OCIoY8j9e7Pj1MuSmw0y7ZUKy+huMGHU8S34UM6+Xt6VKEu4aEQyfP
         MN0HQOJcpG+Jx2AfUyvUsjzgPDOEMBNAz4aXcKA9REczv/g5PL04I/WX99GAiRchHOq5
         kpr04f6rkcyl5GrQKHg7FLEWdxhbLzIWh7iB3x1H6UljpGq4J7wxjGp3Hqw6teaR0qQA
         GCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMIjSXUHP1IWX0uLVKGsvO02eT9kgM93kNdvl2ap90wxnh9jBnP6dFbXZV2V9Wo9EXBqbh9HycrSlIqBLm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMziBlJcX6H5VtP5Do+A83ykAZVadeul/Vh4NGzvdx00TWr3Lt
	hF5bZ5Blq5VPW8rlf/QWo8URZVlmmOKvB3NLmMGNUSx3bfdnLUmsEsHUx/vQfYF5qaRXAqCQ+Th
	p8lw5KDozaUPGynVRDVUxF0hgcAhWlsGXuLfpEnxN8hNTaNJLu32XW6cng2idlm5Cc0xL
X-Gm-Gg: ASbGncs2PznvDzanEtdOOzuMOFLVV4uLZ+8ipk9bShs+IoTCuFfx6yumF1LjX4U+DrK
	OB4g2LY6FBt9gUqyp+ufSbrtDtGQ/J6unFkR+C9ds+V5hKEtu53g1NM4aWv3buy9Ldiodh2l1Qo
	QizpXQC8OeCxPirYpC0PXXCAADTO6Ob3MbHjU9p6Q/11r2WtuL3u8bniiXA5w6mitt62ab0tiFm
	5yPf5zYy9HmqtMvg63exIK5pnrQAulE7UwilXYil45YPQ3ndMHEej2o/vH08I6hJdVM7DR4G8dD
	w3W64BL1s8jXxajMnuB6h15tPk5S1tQWjuBl66nyx869KAO4PC7B9lTYvG++VNchDWNT8lv/2Cb
	BT2ZLReWhDGk+n5G/48DTirM2bYQmrTzVsgtxo/qQg94Sn52ZxBNGZE5tjA==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id d75a77b69052e-4e41e256b01mr10937091cf.64.1759260049467;
        Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlv8GouDfLH9jxcZXz4sZ9qg6O7hSAY2xOrBu+sewtGI48yKBVhvRDPT2OTQMfLyqgcLMpDQ==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id d75a77b69052e-4e41e256b01mr10936801cf.64.1759260049035;
        Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583134310bfsm5244156e87.26.2025.09.30.12.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:20:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <ftbecn7dlcp6pqtpfl5v7kv2kevz5m4yqcy7fg3atkdjabkt67@zqwwostqqfou>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
 <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
 <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
X-Proofpoint-GUID: UhfocO4E7qj2vGhAcpILQW8WeJMEWmmd
X-Proofpoint-ORIG-GUID: UhfocO4E7qj2vGhAcpILQW8WeJMEWmmd
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dc2d92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IkzWstXsGuqL4x2q7pEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX4er4vkxrFCYm
 0k0m9A/6gzsb3A0Rgo5t4TZlfFRs6hSgxs5TuDxNabvGkuuYMB0JJwRpsdyJtwbFCUKIE0gJy3/
 GteQH3rardxrRY3sSstHFQqlwIWzA4zdb4/REiX6EIuNcaWbPXt4ZzQX/mC6myLRvTCxbQ1oAeE
 34K9YvTBQLS4+fBJbEICvdzE1HZRSpvAWa3d2i9PrILwAS+QmZZkb5dNBBiaXGIUIdIEiJtFkNy
 PICDU9IsmgqveKqJK1TAOCsOqOxfT7yH1QIv0i3fQ00ffGlB7++XDOf3e5uJI21wkvrpkAx/m6+
 if5VAyBHIA6Ks/WGdaK7pnVsJ0XdBV4z/P2OEg1oaTISr35YjlH0ROr+VS8/sa4tnowiRUwIXRn
 C1Ic8oDfY9WNYym/c72b0DtLK+HI9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Tue, Sep 30, 2025 at 12:25:55AM -0700, Rob Clark wrote:
> On Tue, Sep 30, 2025 at 12:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > > PIPE enum definitions are backward compatible. So move its definition
> > > to adreno_common.xml.
> >
> > What do you mean here by 'backward compatible'. Are they going to be
> > used on a6xx? a5xx? If not, then why do we need to move them?
> 
> Newer gen's introduce pipe enums which do not exist on older gens, but
> the numeric values do not conflict.  Ie. each gen is a superset of the
> previous.

I see.

With the updated commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> BR,
> -R
> 
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> > >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> > >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> > >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> > >  7 files changed, 617 insertions(+), 613 deletions(-)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

