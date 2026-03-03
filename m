Return-Path: <linux-arm-msm+bounces-95068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANzUHEicpmlqRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:31:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A71EACFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B5530ED526
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0A5386449;
	Tue,  3 Mar 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp7rdFLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7AQIwv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9695306B0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526341; cv=pass; b=JJWM6xyUFfSl8ILfebdLv2r2ZUFa6AYieIJ7qeHdtsY0vQq696XT2dskpG3DADOopUN5Sei4l1fbxiRzWxHagtSmEMFxDl6e+EtMo5O61ieF11oBYsyebSy1Xp2eUEPYZj8bAubxTLbnOZBnmk42wEt8StBb9NesB1QXxKYsCkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526341; c=relaxed/simple;
	bh=Oh1mu+4+owVqr63EXZMoXImf0BsscZoK+Z2wIM/aPrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6+9T15ECr0oujDSbpvqliirDw6CDO6D9QFQPDidGIqpWjsjahKzg7P0FnN3ewbtb4TFbGE3O6ZtNoiE4bRCIUDMzpN62O3wMPOtwfX8HZAr7MgPF8E63yqNGaEuXgG6VBBZdIrT/Imw1V8YJ6iSZoIwMTdySnUX8f9JAUzb/7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp7rdFLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7AQIwv3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237FjkC3614687
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KiUHV4xedGxb5dIADj/BVNVGCunNRuB3VsfYiHLKlE=; b=dp7rdFLZgfMKMIv7
	XYKobFmOl+yzb1zlS7G6srN+osVJqo6K+X9mHSZkHeVyUf9qAsnlvnwTuGv5IL2i
	kqH313QBBqfD3kXUt39KUf8valnZh5mNHWOQxabKoEm2rNmuRVuokJwvmDpdNdZA
	9IZFHcqvrALKt/ngTyMFihp782hgVkPXij2B6KE6QpsIueAGdbqFUsOHCes5pSSk
	fOU7pQvYauyQSLh0zj6/z/7/uTt5rmrMZT3UHW4AcuHL9iiq6wPLleAkAjh2gI+e
	cC8sL/KGQoe9VJskE0SgLGAKZzkLw6Kqx0DXFTTuSirjm9X67sdUYHX4wme1YlAp
	qzsGOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n8753-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:25:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5069ba5af5bso364765511cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772526336; cv=none;
        d=google.com; s=arc-20240605;
        b=aB6VX4+UnhlNmrAr5SqXu3hKs/oRIS1Pr1+icrTrjlUcSXZ1GuQ11C6IuBT04q+kii
         Uv8Kzk+Vlje+4sfCL2F3lm19N7qPOyM+kVxT3ijSLz3tTCKZ6XB1He1MrpUuofdYlzsG
         F5a5NAUWr10RNubWIotfjEp4IwmKoHCo0C4vDMbMxV1Z7pT+QQMaFm1y7dDfI+iGVGbX
         a87Gp4DOIZwf/SOFrg9ho////5ZLLBaHy33s9RhwG/W1hh5xKvm0huQXrDdEa/tSWGXb
         +OHw2R/CWbEucY5mGpDXR6cOSYt2JWPRJY72LtOC3tbLPSN7jDmJVewAclHbzIyMlmcB
         Un8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/KiUHV4xedGxb5dIADj/BVNVGCunNRuB3VsfYiHLKlE=;
        fh=u33adQ1dMQF3Y8sZWsSj/S0UP9CwXkb4UKoVmkQLRz4=;
        b=LjRrV4Ve4lx2HkXGG0sTXaE4lMq8GMk7JVKVB/XJYZJiXmu3G0XjdT+faK6dbzSe+/
         vtxwk85uGLqaKw1bKrR8iMyr/ZLjGFjB49ZeqUnYym3ElCa2LAyWE87ELFhoOJCfXD8h
         smpA0pchtT3B06vhOj2/x5Ag713fDncFKr/bIkFdaMSPpNXEdN3J+00FP6FBp9pjuq60
         84b9qH3kB3YvxvK6iIsqo6gaRTMBs3lox7oxrVZ2w63AP94+/Jq9Yk87QdCDZoGdOuJR
         DcHDhWQXUCsqKBRsLFF0C2cuBIgAugiTatY9siD6kvDZbNAer1bClvawn5NyuzB/79RQ
         fhsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772526336; x=1773131136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KiUHV4xedGxb5dIADj/BVNVGCunNRuB3VsfYiHLKlE=;
        b=W7AQIwv3Wxw9DmZtlfL58K5hLaoJBwliuqIZ0hJUaOM+f6rSp974A1hcl2YOrL5T5e
         W3DsJoLnuKbRr+oUfQjL9AIVZX0WLtmzeC2SoIyYKbK/1AjwyhS7J0aW5Gwx8i/dW99b
         C8LfNwo1ZvNaC3p8+irEP+zhes9OxrrRps/aD/aMot8vMMZgnYRNE9aoaGoOE6KaYAsJ
         TJ9DsF9//Jg9bIR+LpjAGr74Pd+78mUBG8JaIrWv1ZKYzHn+MypgfBreMZPi9pA110KJ
         jAKz3kLsqe0/t1oS2LXAnZlVQoNb0EeUBSVSO1wcLOp7SnvfoeAQEjfKRjE8PmXNBKD4
         mzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526336; x=1773131136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/KiUHV4xedGxb5dIADj/BVNVGCunNRuB3VsfYiHLKlE=;
        b=v1cXuc6EBD86Fx02US+yJtDKLwrMbbSdiL8zxIQLq4DTKElxcOCqG15Yex9NsOTgMC
         CAnMDd2MieJY3l1BGLbFyzeMndfxQ3orSrrwYDOCsvl+xaGf19ozBc7cqFvR9gfN17b6
         NjWSlcAu+Dc2Sos2Lf4oM4VPy6QxQnuYoTmWdBkCKLphbJ9394yC/YXatd1zvJUJzN2e
         ScJsgZc6+cz9zoCCUbdWmSOd/BgQvPhXYyxtfBVDl8PfpVFnuOSpKBh8I7LSwEJLgUHu
         /nm+TvQiqy53Z40QfSnkVVGzWNRoDX2CQs0XWINp+zIlyE8Y1M0t/rJCSydWrml4rVFF
         mGwA==
X-Forwarded-Encrypted: i=1; AJvYcCV0KgXVdF8LUX+QjBFHkRlZ4qmqfuw8M/OpaCgUNkedJQMa8W2X7lPyaeH0QisE+g/uU014fi5Ql4poXHrv@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZn+e1FoQLpMkX+frWGoKWE278pi7t30DTpnDEZbBYyyMjujd
	qHrFLGzIVqYWI78Ve4cT5VTAKOuhpVh3CWb0dwhHMUY0//e4cShw1NKAs6zvJ8xWv8yn/CrGroA
	GeK8ZMYMvJ5lIPrMWzxzIV9ZgsB0F4/GPYnkG0TsFmHVz7aR6doei4UpC/5B9TGZ7UQ1hzsdjRn
	wUh8H5zMGQ/9C0qehOBvhi7/UgG2Mpzd0wYCTw9L9rJp0=
X-Gm-Gg: ATEYQzwBCsio40txUNC3qO+zunXfjGYUgUZNUHfT4xoVGY+hqbg7VwG5lH7GHSzB3pA
	Q0YjPSEmI1apnRQ3f9wzZ5Aj8NeDeQq2x5wUWA2bjaQOnB9F5F80z+GNZyOGfeNxMm33djqL/pf
	W2bONX7/Aucp2ZmRe7guiKiugF+65Xd93TKKK/iYVHQYmcvnMfi2pB6Am0fbCv/ILG/q+EmrHAq
	nOLMHhR
X-Received: by 2002:a05:622a:148b:b0:502:8fb7:77ff with SMTP id d75a77b69052e-50752825caemr175051871cf.47.1772526336072;
        Tue, 03 Mar 2026 00:25:36 -0800 (PST)
X-Received: by 2002:a05:622a:148b:b0:502:8fb7:77ff with SMTP id
 d75a77b69052e-50752825caemr175051701cf.47.1772526335621; Tue, 03 Mar 2026
 00:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
 <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com> <CAFEp6-1+t+672=Oh8nvjMAEJrV_sz2SMzh1WeDNowsVzdXu8LA@mail.gmail.com>
In-Reply-To: <CAFEp6-1+t+672=Oh8nvjMAEJrV_sz2SMzh1WeDNowsVzdXu8LA@mail.gmail.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 13:55:24 +0530
X-Gm-Features: AaiRm53RdIAigjBBN4-LErO36SiesNgbw8LoldbApJ9MsTrlik_mJR9gS01nCss
Message-ID: <CAHz4bYsyZyWrC1t_osVDFrKDX7Wsc8mdcr6bMiigUDUnkOSQ9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary USB controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a69b00 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=_NEkYEqGmQKL--E2RL4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5u82kFhGhH1foo4TMV1OMZmKawa4Tsc0
X-Proofpoint-GUID: 5u82kFhGhH1foo4TMV1OMZmKawa4Tsc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MSBTYWx0ZWRfX9tl/Qdsw/ipl
 7lYWcNVw9mFw3B7xSYoXmnvvUSQ9KLW/qEhtbCsVQvm4EgR8yfLlj4ycUBpDCMd1CeLHzLGrsav
 XMR1oxlE8hh9PDqNgdlJPOGRMl821HbKFax/VAxENz961f+CjnkHmriCsy7dA8iqIsdM+P49j4y
 TpaJCRz8tn5Sr2Tr4ZN9lzjE/TUqlD5ypnxs6/+7bBVVAUtQ/t7lgXvc74HRJbzN2y27z0ZrJ+i
 Ei1Vv+2kiRfV36E8JjEPW+BCY34mrnlBWQVTkUou2F+DYzXG4C9PxdJ93v/c9A3tr9g8j1+YmzM
 nTyokoSmVJJysj8qJqUcPB7ASBEtsGgjrax9qd9JFfvK+wCfRTg9dH2mYM8HqTJOG/aYOP8sVzZ
 vEhRTpeq4VCjCSi6QNe+nTzpPgBPjxh06BNRiggqmZIWgM1O8p4L1qd6M+fvXjhKmyUjFu3ss/C
 04L8+Fv4vyYGgdbh2UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030061
X-Rspamd-Queue-Id: CA3A71EACFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95068-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,aa00000:email]
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 4:15=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Swati,
>
> On Tue, Feb 10, 2026 at 4:54=E2=80=AFPM Swati Agarwal
> <swati.agarwal@oss.qualcomm.com> wrote:
> >
> > Enable the tertiary usb controller connected to micro usb port in OTG m=
ode
> > on Monaco EVK platform.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/=
dts/qcom/monaco-evk.dts
> > index 03af9bbcacc9..e6fc6f6a52e1 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > @@ -27,6 +27,25 @@ chosen {
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       connector-2 {
> > +               compatible =3D "gpio-usb-b-connector", "usb-b-connector=
";
> > +               label =3D "micro-USB";
> > +               type =3D "micro";
> > +
> > +               id-gpios =3D <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
> > +               vbus-gpios =3D <&expander6 7 GPIO_ACTIVE_HIGH>;
> > +               vbus-supply =3D <&vbus_supply_regulator_2>;
> > +
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&usb2_id>;
> > +
> > +               port {
> > +                       usb2_con_hs_ep: endpoint {
> > +                               remote-endpoint =3D <&usb_2_dwc3_hs>;
> > +                       };
> > +               };
> > +       };
> > +
> >         dmic: audio-codec-0 {
> >                 compatible =3D "dmic-codec";
> >                 #sound-dai-cells =3D <0>;
> > @@ -77,6 +96,15 @@ platform {
> >                         };
> >                 };
> >         };
> > +
> > +       vbus_supply_regulator_2: vbus-supply-regulator-2 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vbus_supply_2";
> > +               gpio =3D <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               enable-active-high;
> > +       };
> >  };
> >
> >  &apps_rsc {
> > @@ -484,6 +512,16 @@ &pcieport1 {
> >         wake-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> >  };
> >
> > +&pmm8620au_0_gpios {
> > +       usb2_id: usb2-id-state {
> > +               pins =3D "gpio9";
> > +               function =3D "normal";
> > +               input-enable;
> > +               bias-pull-up;
> > +               power-source =3D <0>;
> > +       };
> > +};
> > +
> >  &qupv3_id_0 {
> >         firmware-name =3D "qcom/qcs8300/qupv3fw.elf";
> >         status =3D "okay";
> > @@ -690,3 +728,18 @@ &usb_qmpphy {
> >
> >         status =3D "okay";
> >  };
> > +
> > +&usb_2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&usb_2_dwc3_hs {
> > +       remote-endpoint =3D <&usb2_con_hs_ep>;
> > +};
> > +
> > +&usb_2_hsphy {
> > +       vdda-pll-supply =3D <&vreg_l7a>;
> > +       vdda18-supply =3D <&vreg_l7c>;
> > +       vdda33-supply =3D <&vreg_l9a>;
> > +       status =3D "okay";
> > +};
>
> I noticed that usb_2/hs doesn=E2=80=99t work properly unless refgen is
> supplied. It may appear to work on your setup if another PHY or
> subsystem enables refgen, either explicitly in software (e.g. DSI) or
> indirectly, such as through DP, which might be voting for it behind
> the scenes.

Hi Loic,

Are you facing issues with this patch set? or your patch set that was
raised as below?

[PATCH] arm64: dts: qcom: monaco-evk: Configure USB1 as peripheral and
USB0 as host - Loic Poulain

Regards,
Swati
>
>
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts=
/qcom/monaco.dtsi
> > index 5d2df4305d1c..59dfacbae4f6 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -5232,7 +5232,14 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >                         qcom,select-utmi-as-pipe-clk;
> >                         wakeup-source;
> >
> > +                       usb-role-switch;
> > +
> >                         status =3D "disabled";
> > +
> > +                       port {
> > +                               usb_2_dwc3_hs: endpoint {
> > +                               };
> > +                       };
> >                 };
> >
> >                 iris: video-codec@aa00000 {
> > --
> > 2.34.1
> >
> >

