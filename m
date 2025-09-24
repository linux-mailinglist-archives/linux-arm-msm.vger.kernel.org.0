Return-Path: <linux-arm-msm+bounces-74622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5CB9ADE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA41219C4FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D415313558;
	Wed, 24 Sep 2025 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0YFVFyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E183A14
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730992; cv=none; b=XB2bxStieIrqK2JEkPrMnW2iKTZsePn+SnM52+ZgUgYZegNaBJKJgBxFYirSU6T4XbPHSEVpjqNDxcOpQX6TiP0LgTmN8NHSn+2GozboL205gDzM39B18LP51rYIfxYCJhjrF9S2TyH38fNofmxKwbI2oCPKLLEt+WzSDQzVY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730992; c=relaxed/simple;
	bh=zUueWCM8ict+rLozoOxPbbm0q8MBoAPzg0bpGPz4sDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bawu3qBbKh+6Hqqm/BR3Iowuq6LjD6ed0m3n3GK9hTYx5Dlj0lUADmJzdexFH8rrL6A/uh4ogYeAmK7v5lC7AG6r5bihB7W44TE/eU2nw81pUuPlOc3hiGR/+nl+CyeY0bmXl/NQ1MfAr7RNG1QenziU9zM8y4Tc1SIQW51/h6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0YFVFyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODdFmw017430
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6coObAzgNCI/EcrDoNSkY1HJ
	fP/PJs9gN8G0/T8LMk4=; b=U0YFVFyzKuzqOZOobuRKZ6cXyT18cbYwhjcenIxv
	WvI8zAFQLMPg2bEPhLbJY97VcAzHV1k27euX5ePrKoxulbGyKykaVS49wBUbXImX
	QM3Vb75vu99f5FmG1D0Xkf8PIVNEBjZibY3oJ8sPw4zEUDwUSyG8fJ9ieqXlyIx6
	70YEygTVHRvfYbYwWBiDkBYjLP16xswZCrNi9Vl/pVi1pwtagsgW6yqF9L5VxhWI
	kEYuPIQ3jA8shwB61Y6dFHj+EMO6mlubF1hBDRsNkZTIz2rYaGTyFLYwxgIecnP9
	z++7fxxl0p85bbwzeYiyFxaSZBXMPAa4xsxHoOd/5e503Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjxbhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:23:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d59a4c23a3so424141cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730988; x=1759335788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6coObAzgNCI/EcrDoNSkY1HJfP/PJs9gN8G0/T8LMk4=;
        b=NICsn40AmTIqO4hkD5DzdwhjBldNmi171zUUEM4uEG/qdNfmndpv5oCmhQx96cGlz5
         IMXvAuP0EohpkR5aImmwk8QM1F7x6pPpQhl3Gx9lCb7BelKZHLEJLjxVMC/9Sn2pzVP/
         FFx/4NarSWKkiyRRPtVUJw8VZ2qY4hZ84aTioJmyC5Bw0syWTVaS1WenJhFIPbyXTW2k
         dYn1UbmJzGe58sbBGz6VPupIVSx8fcNWtTjqV4e4yDestRddC32DExM6Qbx3P2/poPXN
         XoDbjnTbercHtTAnU5bxBI+VLOVV613G6nYkHbIwD/Hbrx1OkHjLs8pRbFHraSlWwRuG
         jT+A==
X-Forwarded-Encrypted: i=1; AJvYcCVKTAdhqgQ76BDmsbgL1nqU1iOZwcscZP8xaT1ZhXgvaHGojrplOcIbfGCy88eMFGyNQV+Rm9MpmuL94iGR@vger.kernel.org
X-Gm-Message-State: AOJu0YzgIeSP7fs+mEM1zLtwJqEN0pLtdCwe2lshx7e/lWn0Xmvq+J5E
	50gJF5fZka8OqCU1mdryT9A8GtWAjqzmWg9c8ajqVYNpyq/Pt2EjHOwROhvkricMBHnqVWZIQeZ
	9Wn0QkEr/DYf4wv1kYDP1nfYhdKXas19mcGqlSe8UFyDH4M5u/RM8HJcip5K5v2TjlVWHBrmW5v
	nSYRw=
X-Gm-Gg: ASbGnctGP1qz8RFNZ3nCtjrTKCrXR735aOVRVjXLoYZwvua9ExFVJwv3/saIGlmj09d
	Z3DzLHWbf+20qq1eYp7AtDy/JWwJosdMG8SLCFEud8e5abfD+FG01041rGlxsEZ23c18NAkBjRY
	sTdcgvYuu5N2+yYu069gPqhtYfmKGTVBSoxk+1Ls3LqoKiBrofvtveI6kIW620sHu3LD08THER6
	NzkNJb4ykBLPerMEibpOAwfhLpHbNQ81Q3Mj0j76dz07YEcB2Pvgf21ddvUDpOZd7l7oFGbRZGd
	agSxLaZSZa4JqCD51Mptnjo2f0pXn4qR8w0oxOovl1xPgmTzUylBQ+QlXVs7H/rNgXxJmL7Gpe6
	G1zb/hF/ThAFaJhmzs+qvxrTS02kHqGGUpzhjsmH3e259WAJKbQKB
X-Received: by 2002:ac8:7fcf:0:b0:4cc:87b4:d3c8 with SMTP id d75a77b69052e-4da4b42c98bmr6065651cf.41.1758730987799;
        Wed, 24 Sep 2025 09:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ3sVN2Q4IouFn/l1phqaVapcGnG+wwiXU4CXRgU3gqt/Vwdm/CaF7/6E2XN/vz6pVrShJ+w==
X-Received: by 2002:ac8:7fcf:0:b0:4cc:87b4:d3c8 with SMTP id d75a77b69052e-4da4b42c98bmr6064891cf.41.1758730987087;
        Wed, 24 Sep 2025 09:23:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57f504e8bbdsm2212455e87.133.2025.09.24.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:23:06 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:23:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Message-ID: <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
 <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CrXLqo-Kvxg98pVq7Uw3i9MpWZ5gAK1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX83eKy96oaKZL
 ajtONYzklxdMJO5MaC0ELhlbX7eMnjedXT8CFsmH/HhQzcUVCo4qkvLxUz+tD8ioIkrB51gr3dl
 +E+s+A4pjYJmCZHkmeos+j1Ev0Tfjs+OS/wPxdnaFdW/gW2xbvM1OQhuDdwnkeEyrvngPiVXqAM
 Lyi1Etky9vEYnIQyJH6eekFhRjef63olN2qfpA/8SMLbXCOQRWhww2CdavEEOPJy/2QCqCXZqNm
 r8fuhDf54YDpie4NO2n5aBTBdLexGOxx+w/RsUjvZv5cCGAzHhmGkfMTaEaX+TA5rrLX9YQlbQq
 iT1x0lNZx/AZIn8cz45LiAZe+HeTG0tJsL6QuhElCQzUOWt7Yp/+pOS71zRhj+ZTk1r1o/eZK90
 wybI3Mr3
X-Proofpoint-GUID: CrXLqo-Kvxg98pVq7Uw3i9MpWZ5gAK1U
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d41aee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=iYGp-hpNWl0ZV_AQIN0A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 04:24:07PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/19/2025 10:24 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
> >> Introduce handling for the QC08C format in the decoder.
> >> Update format checks and configuration to enable decoding of QC08C
> >> streams.
> > 
> > What is QC08C? Is it supported on all devices?
> 
> It's qualcomm specific compressed format, it's defined here
> https://elixir.bootlin.com/linux/v6.17-rc2/source/include/uapi/linux/videodev2.h#L820
> 
> And Yes, it's supported on all Qualcomm devices supported by iris driver.

Is it going to be supported by all platforms that are going to be
migrated from Venus to Iris?

Is it just NV12 + UBWC or something else?

> 
> > 
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
> >>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
> >>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
> >>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
> >>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
> >>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
> >>  8 files changed, 89 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> >> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> >> @@ -15,12 +15,17 @@
> >>  #define DEFAULT_WIDTH 320
> >>  #define DEFAULT_HEIGHT 240
> >>  
> >> -enum iris_fmt_type {
> >> +enum iris_fmt_type_out {
> >>  	IRIS_FMT_H264,
> >>  	IRIS_FMT_HEVC,
> >>  	IRIS_FMT_VP9,
> >>  };
> >>  
> >> +enum iris_fmt_type_cap {
> >> +	IRIS_FMT_NV12,
> >> +	IRIS_FMT_UBWC,
> > 
> > UBWC is not a format on its own, it's a modifier of the format. Please
> > come up with a better naming.
> 
> Sure, will rename this to IRIS_FMT_QC08C inline with v4l2 definition.

Ack.


-- 
With best wishes
Dmitry

