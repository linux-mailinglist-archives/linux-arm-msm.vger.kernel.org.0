Return-Path: <linux-arm-msm+bounces-57946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEAAB750D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC408C7F2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E54F28C863;
	Wed, 14 May 2025 19:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNdq2vHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5422318
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249456; cv=none; b=tIVqZmc78dMCEWsRyOLuQjaCaaD4oMyopgDrQNXHgCHeW6mKg29E8zNh2uEN2LY8pNJNRG5xdIzoY7nruAlMnFnjXW949Mhfa/IUHH5sGHVrC0YT4nmC1WH6fgo8WIgteryGO5b7L/k1sMyAjQ2eY1CejWvO4dcR7X0pHW2WG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249456; c=relaxed/simple;
	bh=/hjJULGfB8jWupCFIe/kgBDvtCioZqPCA2YOTh2E6X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8/ZQV6X6fRh8X37oztRbAjqtXcoV67WQElqGbGBBHWPyzGF5OZGcuDL4a8NTePTi0YrcbJyNRbEi+BaCJyd2l9gLcuyuGhCX9Bbj1oQUSmeoS5FSgq32Zf8C/HA5UUnGaMYoG0oS9otKxzlsff55dDP1Ih4EU68S0d9PLyknDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNdq2vHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAufjJ020112
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPZSuuY1W/lCvYUJRt7cqKLa
	wbwX8uiQ1760f2RdC0w=; b=GNdq2vHPVhfWAK6PbeUHRHsKrtZBokiSj1Nab4rk
	5Ozx0/lcH9cJtLSQ1MdsbKEQMwLdK4bECGNjR1LPwlmPWUZTvAav+UGyJrv5yXeF
	M9XWiaG11phSC6ApxL0u6sS5JcfFsh78mtjDUGGhDIRcIy9hA3BJIYqzTeyLTwMi
	BF9Aoo8Xr31a9ZsnvT+jZrOcqeovKOKv1LDK7KkUCCbcoRZpHIgdLdU64zuZCpHh
	UZPp0nqaTy+VumjBxJE7W6jE1j4g5f173hjVJ+R3rCXIzhhGI18iOjCQQZI1N2uF
	gyrXXTBcvjLdL2qFClDTARQXmbNMWZykHg82Gsua1hCqRA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnks1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:04:13 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3db7697c78eso2979985ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249452; x=1747854252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPZSuuY1W/lCvYUJRt7cqKLawbwX8uiQ1760f2RdC0w=;
        b=AnwwdGZn3ZFtaAS71j4fV/8Oh582EOhitrIe6XV325QjapxsQABk5oRtAq/kWByLV3
         weubqQUplvv1WvuH6MammeWdLeiqasoQWENX9rmy8Vevzuz3XL8dsDfLiQy4dj7lcdzk
         OUttqr9Ay9mCzb7oPG33PiPmAXAXcRaJYfOdQsGuoBT5WHfQ2TkR3y1uY52D6aUGRXWr
         14zDLoHo0qYfoVLgaNNPe2Rw5dTpFxqiagpnIxHhFXnGVb4T3TSFC+PDS6KlHd0lgOKe
         mzoiBSbwC613h9Sdf6mXJHyTZCHS6OIeO6Qs0UOWQSIaYbXZ/B72A8uOydzwmoYgpmvC
         8zKw==
X-Forwarded-Encrypted: i=1; AJvYcCVucyl0Ljz0lqwqnK5mI1RTyFs7fnCe0NoqG0PmMRh6+VNVSoYo+j/VIXK78D0KjOWFoSD3a88gle0fvmOY@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCyQI24LkxqH5sKskM1+yAkGZH7XYJ5Q2f478FUsejruSX5ms
	yFRiq1S2//uL1WKugZ9Q++6r3E8/laPOLQGiRZgbN2q9c9vOKgphd4UMNJAPjc8MjJD7W0BwA7Y
	AhwBxiiPmFhsBogCcN12FZSCuv0MVoK0U/lrmUN280XmWczd0djoaBKen53IbbGt9
X-Gm-Gg: ASbGnctlCGkhaCaGbWkUSOrXYNEFrGc3ws1SGQO6Xsy652PMcneXJt/Lz2KYijmpAXc
	h9jBBBqkcUo17iEnzXszjG2V0h6zG1J/cFOwUsPsfA1iZYmBhOF+oNgY9WAp4wQCBt/bkxO71Mk
	p3xIwrBIZvm8bHpeWEmajZl7PhTCBlhhatt/t/8yHm9+HxmXYVNd7Jf8XAljem854sEukPsdx9/
	bVlxvSL8cb704TJ/p7WL2Nb0hyBvgTERapcu21ScZ4izc8wsIMc0l2h6Mw5aQlDGuigHWS/CaZc
	Dq4yD8zzpRbtLORtZbBrD1KXGtX7ZrrVIU0sLCiCW9I5p+0mwh92sxo3W0gP0JENk/5OG6AbKLs
	=
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3db6f7f8816mr51919525ab.19.1747249452375;
        Wed, 14 May 2025 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XZOwFPXRq4qN4nQf+1LdGLzvGFgQT2vfouD5tcjh/PXEkQ7Sf0nUxsz+NzWLL1xiMHL/tQ==
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3db6f7f8816mr51919015ab.19.1747249451992;
        Wed, 14 May 2025 12:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64d07d8sm2362836e87.257.2025.05.14.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:04:11 -0700 (PDT)
Date: Wed, 14 May 2025 22:04:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 02/15] drm/msm: Offset MDSS HBB value by 13
Message-ID: <zrz32vlzyozool76prwmwtz3us27dubfscpdtxjoydr7jps7tq@awla4zpep7kk>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iZPj_B4f3smMebH4qFAorVoxsFQpg6no
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824e92d cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-GUID: iZPj_B4f3smMebH4qFAorVoxsFQpg6no
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX0WkLKvC1QNP1
 wlMj0LGzPR9vWx0Jn0mrpFschi8Ld73F7VNXXtCaA82vnwTMRklnXnOoAALJFA/qoJdTf94glU+
 iSUPJbfNMAe+Nmy7zuKzpDYmMMS43M1Y07o7O7QX6Oex231EHwX6In9xrbMM1vxxzP2OCHtYUgm
 qwMIMpd0wRPvQNNGC7NBE/wZsluP31QAACHX0Ymp3BItWdK6fcPACB5cElXcV1sRgSgx9okw42A
 KFz+n1DDGQVmms9WKX/9OAUPDcp9N7S3LLfqIIgimlRuZq7/ndT8ayDeNY87i1OG7MHYqlD/ugi
 GNAB7Vclvmr2lVaF8EA2JQcqMbj8QuE6Dt1WHztapDfxpwOr+ITXE8K+dHuwemhoV2moWF0cXIr
 tokQZaOVJ2knsN6uYmyCSSZsjhzFPAY3ZzK6HhJ7d0ecSLblgfDSnT7u73V0du23Iboo2y5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=752 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173

On Wed, May 14, 2025 at 05:10:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

