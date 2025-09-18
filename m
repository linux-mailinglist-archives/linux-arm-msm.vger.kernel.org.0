Return-Path: <linux-arm-msm+bounces-74097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EAAB859B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 17:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A4E18847FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405DA30FC01;
	Thu, 18 Sep 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjahQ+gA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F030EF94
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209173; cv=none; b=p/xzmIkDBQPlbLU/bS+ViH3vW2BeNVr5loahYyqRI5rNQQfwZ7UVsxm5o22qpLQvREP4yQhldLJosaywQ9Ge8RbAYgUtCjBdCxVmX2sRlzlCOwoql0Q57x+OSSr7j2wLNHpyBCskdarktOfpsh/RCWRy5U3sW95muMMU1LPWICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209173; c=relaxed/simple;
	bh=LSJjLwsIF5CpKkBeSaRORvvRm8oeMNJmRTmPfm7BIHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohMYdMueQncPrOIARMFYE0SmWkPPO4CYfXdNXljqJTJwFCBaMawoAPcpPHT5zrVCgVZIgJXjKTDLeelh0Air7oCpNsrBBsxIjr5FySaP7MwRBMJ63Gtzu4an/8GvKkAjBV9zS3EK/kW8anaUwimmmZH8eG7QiZMFnDW6+hvCCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjahQ+gA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBCsmL029503
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoMtgD1Q0r9h/Julw1Wk4QHV6mO2jve0hQwvodqc3Ug=; b=YjahQ+gAcuWBUGks
	Q6WyymOj6aHT2fjdFg9eG9iwri1wbJ5moKZuZJhOVDuTW259RcAbIbKh52t9JN4Z
	X6RSQ67WUxKBhvjJxFrv7phK0x9/vY1J+f5tcAy62fE0OZ/RyT9ODYkMcoIKm/fJ
	MG3vXY80BwlaMC5Ct3no/Ppopx6FF0sgm908RmfKWrFP7h7b2qPn57hWv5wUc50a
	WdcG7FJL8Qq9Z1MlfY7bRwhVVzGkbEH7yPX+0bPbiRrmCcdeq1viEJtnQaCIuaDA
	COtjc+2OrjbEgvsvMzIGIyn0TxgDexpJIEBSFoyf8EfrHA0Ef7k0+V64IKO4Mpod
	oQCf3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0xvkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:26:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8163f552e5aso268265085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 08:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209168; x=1758813968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoMtgD1Q0r9h/Julw1Wk4QHV6mO2jve0hQwvodqc3Ug=;
        b=TfLpVIpuyZ2Km+gAa8dyuS07qySQhx1KNuyJ4oGg8HLCYmst2ooyyyf/rSLOxY2le5
         xymh/OzFc9lUj2E39x+aECP1fUW1pwPmjX1cbF/0RZPbqWcmXozyLz+yuwqJqD+uHAwJ
         yVuDYKyfiZCamOmx4CIwe8mkPMdcjtshi/+bAMmTc1wbrjjWaIFNwwNIKyDs7PVmSNfZ
         6zyKyU2WDZdWo7reSWEVwTP/+YRCfL3IrtkLZ5wFEG0hvTxkFUq15jAXlypLZ5uH3mxw
         cIZQNDC7rNgoHGnWtqYenznlBED6BC95lKXpMSYYQGexfbIKFh5AFcpgwbS0zZiBBc4e
         Nbjg==
X-Forwarded-Encrypted: i=1; AJvYcCXS5wvkZx5CAV3uFtGQtAFuQMkfM273PkdJXdm8MiQUi055If/ja0v0WlK7t6e6EQkwBMr03iWJpdBYk70j@vger.kernel.org
X-Gm-Message-State: AOJu0YwjVgYiWFHCR0k33fLHEjCe/zmT98wiGcQKYqEprB+k0SGO9bbC
	e/+UBNU7Wfk7VV0d75bMflsUIxcYuo3tz/yCn1x0kIh5R3fhB2LAQvpPu7LGz04634Nt+lLd7r4
	DciKgFqT+wnmvnxcOqezO+54IFyzOcy2oqxr8A8959CuAWhUjf7dhFF0HAN2jpPj/gApbPrvI3n
	kcJRiFyB/Xglux1GLaTCsBgbKsfsITeFaMqSctFoXvaZI=
X-Gm-Gg: ASbGncvJi81dKpBmtaauRpxt+9O3LMERWla0+W+k98kvOyG5oGwSIkyqvKPgKoKZClo
	pL5+uhE9Cf4wBINY5sIesRn2+owOk4lcoM6ci4QFN5gV2Ck6ge2eCigSIkx9Ta5CIW4kmYNsJPj
	OiS9OXMAqvqnjAagkd1NxZPQ==
X-Received: by 2002:a05:620a:a507:b0:835:918f:2c16 with SMTP id af79cd13be357-835918f2c44mr331743985a.21.1758209168271;
        Thu, 18 Sep 2025 08:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFelAWo4gqvC10Q2+J82cVZeQdo5O8MehbopgHQpAwHx4gzMd1TL1bkOux2yxZfGHr0yyvG/XUc2FWCfMYhjtc=
X-Received: by 2002:a05:620a:a507:b0:835:918f:2c16 with SMTP id
 af79cd13be357-835918f2c44mr331739385a.21.1758209167573; Thu, 18 Sep 2025
 08:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com> <946d409a-de3a-4408-b1b5-5cc13a71c0fc@oss.qualcomm.com>
In-Reply-To: <946d409a-de3a-4408-b1b5-5cc13a71c0fc@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 17:25:56 +0200
X-Gm-Features: AS18NWApVBma90DJIl8sLUjYoLKEKxlfNkJGkABA1xd9yArNsTdzk2DmlcXqU8k
Message-ID: <CAFEp6-2uDduzb24k2KkdAe_PtQMgpooH66vd-GcHrGpWMKK_0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: neI2oXq9Cxu3yBzS0NrjdZ8XD3PrRbhR
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc2491 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=RiHSq_zTawvb0B6aIh8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: neI2oXq9Cxu3yBzS0NrjdZ8XD3PrRbhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0pGhrT8GvKD+
 DDGOKIsA6Be0I6nYK5HHbe4yldqu/qUoyDzb9wH3CBZ25rXfWAL5sFNrMl1W5SLWV/rZpn5qcEJ
 VrJ711h+JEWYIEJFb8OGjT9+eNXX2muyWXQXgHCSdXoRxqTNdVXiMmKk2cvrWBZ0xfsqBG6p7jf
 Hh1mLYvMRNUcn9qAGBcWCqfGg5Wf5j5v3ZNxeGlGOK63vle2Wb+5EqwBDCyXkFW/w9IS9bpRQ3c
 iWK2vYUOgFc9BRvTKCLXgNnyL4sPNPQ+QwKGRLVggxPIXDmNCEbmTYUyVKJMacwrcQwxwiExiz4
 viSsahsIZMpxylumStks/p+1mTOTZTgfS3ZfsR2ekKeaONh3avg67sLCbk9WGI2bYeiaoVP9lKr
 8ekz555w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 6:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/17/25 6:35 PM, Loic Poulain wrote:
> > The PM8008 device is a dedicated camera PMIC integrating all the necess=
ary
> > camera power management features.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> Is the PMIC on the mainboard and not on the camera mezz?

PM8008 is on the mainboard (core-kit).

>
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 81 ++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot=
/dts/qcom/qrb2210-rb1.dts
> > index 67ba508e92ba..cc0c53fec1af 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -220,6 +220,87 @@ zap-shader {
> >       };
> >  };
> >
> > +&i2c1 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
>
> nit: a \n before status looks good
>
> [...]
>
>
> > +             regulators {
> > +                     vreg_l1p: ldo1 {
> > +                             regulator-name =3D "vreg_l1p";
> > +                             regulator-min-microvolt =3D <528000>;
> > +                             regulator-max-microvolt =3D <1200000>;
> > +                             regulator-always-on;
> > +                     };
>
> I doubt they should all be always-on

Indeed, I will remove.

Thanks.

