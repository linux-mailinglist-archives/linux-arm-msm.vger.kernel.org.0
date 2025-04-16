Return-Path: <linux-arm-msm+bounces-54531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE03A90777
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 17:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452203BACA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 15:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091831C5486;
	Wed, 16 Apr 2025 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyeiFnLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89962A55
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816598; cv=none; b=cW0zj8C796k+K+q+Ol76i7JZ0vl1grV1uLHNPDAR4JpqlQcKh3EyU0tKGxfUkwnqlsbBhuIqMK8syYX7NRW6o6TFRhSFnfKBFIjbgAfxTuxbfV+UJv6JqWJ7dqREuT9pd9fGAvyxdZGdl4MtpLwXEm4QX5G9PQJlnkW1djgNfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816598; c=relaxed/simple;
	bh=i33BTY4c5w832/9tCBpynmnyN4TzRbYUFJi/aJHDcdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7T8wYXPMGt/OUgiDq/d0Kiltw/EGDwQ+pKJVDkFqd6jv+jrNquizg1lO5iAONbor6YnovHecnVRD7nMqJTZzGlHspeEmsRrQHNn527e9NeDXaRaGBV/XZZ6WJ6jcYAHKH+K06MZTOtCgh34si2wj+l/+BITq/StPRDisyz6oLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyeiFnLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mElv007060
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJUIUc+VYHH2fy8e+6Mln7Q0nf+79VtcQUiDij9Fk48=; b=kyeiFnLq93bXltmG
	7i5WTenqMr88BNIylFcu/snbT2qXRJGL46x0aFsVhDA35hPodFJZGvMCxA7BXGop
	cOtTEG2P2GpY3s/YARLLnK4NGoxy06tavXxP5AFbt1fSbM0SeoqoVob0uzoRV2oR
	IZwtW0wFrEuzP5GJW7ILeA2nYxmh1uER5bJzIYE4w11WzYwYyZ8PPeITathcBsoA
	+CaNR3u9tN8E1569DLHDp/c0zrGhju0jJBCtYCsU4tyOcfX846SUuAbF+YuBQKxL
	2z/k79WjIG2+UJYh1elaWaHCRji1ji0GLIa15xplpsJGQenkAB1dzt9rf0i/fOHw
	snHp6Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6m0ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:16:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8feffbe08so157542586d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816595; x=1745421395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJUIUc+VYHH2fy8e+6Mln7Q0nf+79VtcQUiDij9Fk48=;
        b=ryALNnMffi8tTjONlCbIcTdXyQRpv0TvzVA7Ajr/VUTzDvnnKX+g0Yut5N44YOGx5a
         0TjEMg6UKT3B7E9KIvEaNUB3r87gcdWJFtZQztXKBVg2GAV1ZHEKK152uhrAPwrEXofJ
         JPoPjg8p0xkNtuZXnDIOzgCMIemIIvdK3StSjd1GqC4ZCjtwq4FD8n97RMtUjcxbQaiL
         t0Nu5KsBml3pW+KXvyb0dWYPS6fodk8eA0S4nAuMdzHe/ZQlFvZAoHFC5lt32isRl2vW
         2lyhFgVNN13kd4lZl2GlMfO9XRXjwcpuwH4UjFFRWz7Gl0t7vMjU0Gd8puSziqwL05CD
         yqMw==
X-Forwarded-Encrypted: i=1; AJvYcCXaCC/xF2ARPWOJmeaCjAnKMss2URV8C7dX0iHLJYQcBaR4T67jrkYBf5GqOJZ6ab2wVd9hKlVpl/1xZ9DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyztqY2QpKfV5hJZ7cqsQ+U/sNq8/OC1gePhJSw4lg/tcjBTo
	fm3qBz8Ela/Mj918+BIZtycQBNeFiuF3Njc72ZPSSxwpGpdvTGaR0FkTO6yo4aXf/IemHSjXnbL
	DCW0DaU+FMCWwIVJ+JJsZdZBI/4D1zKMZVHQ4lrxnCdG57DT1xIaFQ97BfDSqyyRVLOWvy4Kd68
	ChshpKYBDAHezVq5UseoWJRRxV1mY3KnMJwbCB/zA=
X-Gm-Gg: ASbGncusBfO3vVki7r6244ipWGGy9lo7/HY9dzvwsoA9hr7GWDb7mESkHxYFi03gm+A
	mNaZ8cVeKOE/05es3OHA22OiRrRLoa30OM61ltNNg3GBsxCUFwTqyy6CUyTp6KS8OVrcB+yI=
X-Received: by 2002:a05:6214:5292:b0:6e4:3eb1:2bdb with SMTP id 6a1803df08f44-6f2b305af5emr32590136d6.43.1744816595289;
        Wed, 16 Apr 2025 08:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFS2D2RzT33SDbeqzFkoDov17qPZrZjXwTZGj0nCYs+GaNNpX7EMTVpJzYVpkCYyCp43VnxkS6zg9elAzZSHY=
X-Received: by 2002:a05:6214:5292:b0:6e4:3eb1:2bdb with SMTP id
 6a1803df08f44-6f2b305af5emr32589656d6.43.1744816594755; Wed, 16 Apr 2025
 08:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-4-loic.poulain@oss.qualcomm.com> <391e7a1a-ea7f-4299-86df-cb1600428d90@linaro.org>
In-Reply-To: <391e7a1a-ea7f-4299-86df-cb1600428d90@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:16:24 +0200
X-Gm-Features: ATxdqUHElH-y0Qdjtr5v7dVielMm7TODKS3uuHY9Lg43SNNwKRK-B1Ns-3IZU70
Message-ID: <CAFEp6-3bdazujwWLh6RqWhP3ZufAGtX8PtvtM7JN0k-VWc-C4w@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: qcom: camss: add support for QCM2290 camss
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: g9o85PgFIlFwtDVjtGucko9q2wcOlvif
X-Proofpoint-GUID: g9o85PgFIlFwtDVjtGucko9q2wcOlvif
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffc9d4 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XvfFUYa5IQhs_SHw49QA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160125

On Wed, Apr 16, 2025 at 2:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 16/04/2025 13:09, Loic Poulain wrote:
> > The camera subsystem for QCM2290 which is based on Spectra 340.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
> >   drivers/media/platform/qcom/camss/camss.c     | 146 +++++++++++++++++=
+
> >   2 files changed, 148 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 4bca6c3abaff..c575c9767492 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
[...]
> > +
> > +static const struct resources_icc icc_res_2290[] =3D {
> > +     {
> > +             .name =3D "ahb",
> > +             .icc_bw_tbl.avg =3D 150000,
> > +             .icc_bw_tbl.peak =3D 300000,
> > +     },
> > +     {
> > +             .name =3D "hf_mnoc",
> > +             .icc_bw_tbl.avg =3D 2097152,
> > +             .icc_bw_tbl.peak =3D 2097152,
> > +     },
> > +     {
> > +             .name =3D "sf_mnoc",
> > +             .icc_bw_tbl.avg =3D 2097152,
> > +             .icc_bw_tbl.peak =3D 2097152,
> > +     },
> > +};
>
> I think you can get better numbers from downstream for the above.

So I'm not sure how to get the 'correct' values? I've not executed the
downstream driver to get the output of aggregated votes. The only
clear references I see is: `CAM_CPAS_AXI_MIN_CAMNOC_IB_BW
(3000000000UL)` as well as `camnoc-axi-min-ib-bw =3D <3000000000>;`
in the devicetree, which would give us 3000000kBps.

Regards,
Loic

