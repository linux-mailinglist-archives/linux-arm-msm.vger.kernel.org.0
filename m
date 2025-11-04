Return-Path: <linux-arm-msm+bounces-80273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0848C307AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 11:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12CD188A848
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E565C314A7F;
	Tue,  4 Nov 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZNJVbTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1UdCRh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7C2E7635
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251833; cv=none; b=JPuQ4D/9aYtywMtiH4zmr05pG8Pw9eOJPL/pXDs3g614Xmz3sslFQJHJTXpM1VC5emgEQ/qzXsljQ048K89e3jkdeeFG7Xs+EypMGFeaCWB6oVWifvkAM3X1AprXo8aYtSJ1CGz2by3H1NVCXz74ihtvsBd6aCFNgoWLdSIFNR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251833; c=relaxed/simple;
	bh=q9qMwtZAW3c5DEh62FrkMbn/ep1+A9tNPWjOVBB6hts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbh+cF/huYnuIAjdgw1oXWES3ErvfHNb/nZ0ph+fa5/LhOZaOTn/K70n5Qyf42kSJ+BC82eeIPS78lYgE6aHwCxxgRXpWVVpn/ACCk+LJr8EqnoVFzYKh2TJZKxszg3D1+8aSrIIGYTxNj9N9CZzhplC/wN4QLwjM20YCjgsYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZNJVbTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1UdCRh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49dXKs1659026
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0wnieTQYd6PlV/O1fzaIWKTEzufNimegl24CUN+lIQ=; b=RZNJVbTo/qH9HL5l
	HY7kiVKnn9eV2jhZ0ZrAiu2WiY2kZd/yJmPYdK+EvnnrZd+hbtvu3aNMTPIdsXGz
	7PsXYQlTVOJ7JJzrg2q955vwYdDTDfKTh1fFGrwXs+P0RMKu+gWtsrk2DOXooPm+
	Z0ZznG+TPLAR9kGVo/6f+Q8XhmcOvGcCFqsUO7YYs1WzzbcDPcuSufddKllid9Gs
	tGsO8BMMaQDhR2Mu+aenzM0dZOVBeEErzB6usmrDVJg0BjlAfZRvFyZhHTE3uW+p
	1ollgjg/FeVeM0EVdJu0UKzF1hQ/2Cok+b0ophxfx9YV5oTsD68ZgdCaUsqW0kXk
	BN01Ig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f2504b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 10:23:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8805713e84fso52081416d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762251829; x=1762856629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0wnieTQYd6PlV/O1fzaIWKTEzufNimegl24CUN+lIQ=;
        b=G1UdCRh3riyrCSm04DTRvbfI3g/Q1Nd3AskmqEHY+SNSnXnW+hDgOG7KeGNXNytC0N
         hfw6JyRDFfjUaPnBkZqcnZiAgzhEAMCCN3uB5tbo9e7kBt9s/WkIXmBk/x3pON46yaLJ
         q/42mXbmBjjescTunYORv+VIPTEBd2fg10IgPc4k9fnGb4geuxC4vP5juM6GmWPHjp/c
         GlR3V3FAsTC7WtiHhEINfVh88A66jZiBOjDwFxk0WUIhu4AoZzQCC58MM6U+aNoyuAgk
         Av5dqYlCpRCAV52oqVyyMBhVhEWhFSSx9/CwvtFsCQUVYNIFx8drdvMhg3kvC7yAysX6
         OJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251829; x=1762856629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0wnieTQYd6PlV/O1fzaIWKTEzufNimegl24CUN+lIQ=;
        b=KE1pCzTnsHXEB70wj57pesoexU1kIUqt6jqG2gGdT9Ps6aoRWeF0X/vfScku6rHDYX
         yYlhyUro5R9sTiGyYFyPO5Lilrp0+M8fo+gQX8n4nDgHc1xy3jpu+zO2KyfFr9H57y8m
         y8tS80EkCx4Zj+S/ao+5qJXKj4iD8mosyrI0TJCQvBtmpcGLWso/LT1JCc3Zz9MbXFUH
         Ru6od9ZfGYi82MaI5XXMQCtTwkNmKpiZVgFfymHhdmjtHXYeJUAjLr5bnAGAr77uLZeu
         Jvhi8929RYQPv8dmCCNMPzqZL5vhoIJVzNnFK1GLWI4OcPDs3CQOZ3zoOCeT2oZaiZvw
         kWJA==
X-Forwarded-Encrypted: i=1; AJvYcCVHxcpIzuGCm8tGOiL17cmEx+MpdEfG9e2z0t3Ga12n07iey+YiLyCeMrot2Cm6cMNyGDmALwJ9Gr7ycIGz@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjmgUPaa5jlGuATHq8ehw2mnDDJAdHBaf/F/ZJAYDQmjm0tEQ
	1lHpS/jpCRW4x6ZG/50Cs2RCbPCVzL0MKF6DjxQv3i4R8KGAAS5TkfgX45hRaFi5PUNPnAZz0eb
	zWzVpRaupyLjzvPfEGLIMH2Hwn3QRW+YXMMxuNCtedD8TJJoD8amraut2W7js5ySAe2YmASiQja
	ddfx74R/ElTxLfnpbn8A29Fgga1WY44zhUGBOoRFppvaI=
X-Gm-Gg: ASbGncu1BWLf2EolhrGkr0hnIf1xyuqTGYX/tMcBGGt3a2039KT0OBkwhXaPYT7UDRP
	1VIAtLfzkdO1Y+IVTl9LbJlLtrlz0xzZm29VIH1fKBo0dJRonMXcWeqVtVJVT5Z5V0VwkTJ+rB4
	WD14f+sNdUfzB8dqD0komhQzFnuk96Nb7D6AOPGkJzEV2iGoZcYd+cdZfS3zI6EMmDjKsGw3Twv
	baV1ZS2GRtLCOchXIBmHuVtb3nG55RiE0CEZOwUx1Tl3Q==
X-Received: by 2002:a05:6214:55c4:b0:880:5edf:d0fc with SMTP id 6a1803df08f44-8805edfd4b8mr53734036d6.44.1762251828952;
        Tue, 04 Nov 2025 02:23:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr0sEwyaZTxY8f2vag+J7tTIiWriKsoGBuIGWjz3ofTb3smc77gquWEYnErheDN7hvnseToMwJKSJE12/vppk=
X-Received: by 2002:a05:6214:55c4:b0:880:5edf:d0fc with SMTP id
 6a1803df08f44-8805edfd4b8mr53733796d6.44.1762251828526; Tue, 04 Nov 2025
 02:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-6-loic.poulain@oss.qualcomm.com> <z3uy3kx6qx7tcca3psfocrlkrrtumlqyzivrstyxfhbp6lkxti@eeolpv64365x>
In-Reply-To: <z3uy3kx6qx7tcca3psfocrlkrrtumlqyzivrstyxfhbp6lkxti@eeolpv64365x>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 11:23:36 +0100
X-Gm-Features: AWmQ_ble8Tl0B0RAqyd55cThaECsBG5SDXp953QxAOWK8e0Ojn_seswjTiNG6sc
Message-ID: <CAFEp6-2N33RQ8fTPDqx5qvbfALPBNbkLBcvGuX1v-9CYUDw9vg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: Add support for EDL reboot
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=6909d435 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FaJMSaSSDYtpzwamVtwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: KaAjLNFUtOwwqou5TGzdXBnGe1osa5j4
X-Proofpoint-ORIG-GUID: KaAjLNFUtOwwqou5TGzdXBnGe1osa5j4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA4NSBTYWx0ZWRfXwbHyjVcvNvrW
 KBX2+wVHWiKRGFgdNJXYSNIofddvJAGOUcHw1kR220k/Qblht/+WwRecImvA+rRJ3IRdgeTSXHT
 DyD4zU92BbQBWGwArrQSqmxJLfAZtoQzV963wVrfZREIIHTvA+c44e7HramYCYafWq1KKmWJJNA
 yQyIjktTfWVSDLhU2n6jSHjzxWNxXMldzUHIwAyctePkl20hWjoNKYu2Tf60pmSh+PMm9j77e9y
 ZhS8VrOqfOUUVdIOsKRYEOpzdhT2Mt2ANyGs4mVITSyTUBc/Un0eT9jQfL/s4ogm/v2Vg6FSt0e
 tXPuVBrLAijFaxV/r2vnDmK3re1pzfRMhUFWGiwbGLR/T+lApyqWXpaWy622ADMoVsGOLtkNRRL
 n8HBjfbs5hdkc6OaJ6j5j6FfGPhXTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040085

On Tue, Nov 4, 2025 at 3:20=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Nov 03, 2025 at 07:20:06PM +0100, Loic Poulain wrote:
> > EDL reboot mode can be configured via qcom-scm, enabling the platform
> > to enter Emergency Download Mode for recovery purposes. Additionally,
> > we enable PMIC-driven warm reset as the RB1 platform's PSCI interface
> > lacks support for warm reset.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm4125.dtsi     | 2 +-
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 9 +++++++++
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts=
/qcom/pm4125.dtsi
> > index cf8c822e80ce..5d84a3250481 100644
> > --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > @@ -15,7 +15,7 @@ pmic@0 {
> >               #address-cells =3D <1>;
> >               #size-cells =3D <0>;
> >
> > -             pon@800 {
> > +             pon: pon@800 {
> >                       compatible =3D "qcom,pm8916-pon";
> >                       reg =3D <0x800>;
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot=
/dts/qcom/qrb2210-rb1.dts
> > index b2e0fc5501c1..70c6c929bbd3 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -322,6 +322,10 @@ &pm4125_vbus {
> >       status =3D "okay";
> >  };
> >
> > +&pon {
> > +     qcom,warm-reset;
> > +};
> > +
> >  &qupv3_id_0 {
> >       status =3D "okay";
> >  };
> > @@ -510,6 +514,11 @@ pm4125_l22: l22 {
> >       };
> >  };
> >
> > +&scm {
> > +     qcom,dload-mode =3D <&tcsr_regs 0x13000>;
> > +     mode-edl =3D <0x1>;
>
> Why are these a part of the board DT file rather than the SoC DT? I'd
> assume that at least dload-mode is generic to all devices.

There=E2=80=99s no strong reason, it=E2=80=99s firmware-dependent (ROM/XBL)=
. But
indeed, this behavior appears to be common across all QCM2290-based
boards as far as I know. I=E2=80=99ll address it in version 2.

Thanks,
Loic

