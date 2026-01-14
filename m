Return-Path: <linux-arm-msm+bounces-88909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8FD1C995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD69230CC536
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF37357A30;
	Wed, 14 Jan 2026 05:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkSyw4M8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JrBakHxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972036BCC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768369254; cv=none; b=oPs4GIeiKQ1kl2Rq9gLOvRnIogBODtiiV5yBwLEpYIiYAulND91ootd3c9sRufuQBfKwCrNCiX3POzKJtHVJaG/61T+ciu0jXspZBVzdzxgWdXlJg2LkRyFvjqcmghFhmJDwQvHYSHSPJ/GlAGcjceuogjXYE8U187nGd7ANI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768369254; c=relaxed/simple;
	bh=a4WsXzZWoNjdg0FfAqolDc7/Dwwielkku9o9g6uKcQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwX6Mk+CAXS3oGZ1Y947s6l23Hoay3384DIogF0cLPTSDJF5fLH8lphMO4ge5q8nVUd6fIKY5KDR8ug7gSdyn2qYpSxsXUMBxQ2PHob+vwkn344d6HcyIlUCPWhgBabKn5AGhaeRcrz3KhYZwjyOPVJvo2eC8VlGlajb9QUXlbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkSyw4M8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JrBakHxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E5EUoO2172614
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=; b=hkSyw4M8nm/XdsIo
	bEdd72AoWWkJb9CaYG+R40/+NCSF3mAeKKZDDPtKY3DX4i1kBZQ7zebb7juQmVbx
	K5o1B9jNCrVNU9zZSQ6AB55ksRKg2t4P2z7giRRJPS5iFCeyVEQYUsxXQonfaXTy
	nz8LV3rqLqg90Sr43GJIfOWhYnAfWXC1GeNzuljYRhF+eyMUHoZgR1lVs1iXqgrY
	j5sS0/ywqudIPj6BUpZKFw9Vvp5JkFIyrIR1KlimVSoTJv6DtoSktEJXd1YwmPz7
	1c7+KOUJtGYvMz/YjQ2Tp6vHp1HDeFEYVsnBnjSyT5AVDuJNGiC7z5MXdgD8bDpK
	VQemaA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x0ucx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:40:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so11881346d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768369239; x=1768974039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=;
        b=JrBakHxnI4oT823tfbTkBhs9gGH7Mss7kUmlMgonm1yInke3qqj7p9XZ1X1FURD4lT
         i1nYM53PWEJ5gjyLwX1fSoGG1ev5hPJKNASEGCZldgvsQGcJvR/+woU08Yvmkg5lf9uR
         8s/vMPgpfvZ3HO+erSYdgYC6FW7uYnpqRilcb6CEM0FfKTh2zAF+wJ6V0usjAe2AR4Fe
         CQrncdN5+7aoJ/KzdiRymJ8+VB/RQshBFmOO2ZzvW2QBi2cAw4/O7FS/z4kVJxUK0SvB
         Qhp2Z+5i9YJzTyWezcsOKmaF/pSpiD+7bYL0CU9IMNPoE+uBG1zHI/N4raQbbCepmbdB
         sAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768369239; x=1768974039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=;
        b=eflFijKKourB4YnKef3GUnCbu2Z9NLHKn36iWxrHuviOclsHLYsJ47xEX3Wb1wIV69
         SinTEl3EhnY5hBgOwjQ3ityQr1fsyIkjH9ta8VhIsowogGzKM5XHjiY9qD1j/QGlOOJn
         okk/VgUQVnK/bKffrs1bQ1Pme5T/lhtH/6cL0m+Yapg+wR2bKuyjGFAwFPdl6EH9vFW8
         AXkMVvE6SN4zRR5XZuVboYvBxuFE4tSDiojLHjuSrzXV3q3QBFwBACvo2O7FtjEoa2aO
         aUN9FNePAilpW550oGrGjg3S23VXNLM6rM3tAJFYMFyE+SI4v++txncKDkSz/3Tpk2MM
         7ZLg==
X-Forwarded-Encrypted: i=1; AJvYcCVFihdUIXkm5I0VI9a3Xns1CPKx0WrTymyQPC99wFp5x75YNFzGQntoLCEdb8WyrVdYoR+ZaivuYckLOIuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bCTPWLKsnhuRjQa3JFQQSUulE0VLL9hj3t501UzQAoZS8WxZ
	H2H1cKGEk//o6pdVEsG5xtQu+zVSCrMKm1Rep3VnB5tOzAwDnmoqRa3c+Alv5mL/TrjCnlhffYV
	R1RAEY3vxsTxf3yJkaZtCQaFgwxHAF6gLm3OnR128wWFgCWeAqd0m3vMtX7rSkFwL9U9ya4igCg
	hfFNjaM+z0bsFswUqlw7PZ1Nvmc3glNhFD9LrwDMnnjVc=
X-Gm-Gg: AY/fxX6W91xMIWIHULSR5K7hCU6fkSD3ee0FXBd1G1ct3wMcSGw7w1vnT4RW041RjHK
	QW69put4AXZQgA3PbenplNYWmdnmscAG7fwwlK1SUEc1EZQco1x4SdlHDQ2oDKzJjeC/SDC2XG5
	pEnMGVnBTZnpxUbFUH7pPO981sCNSu3Mkx8lPNUUdhdbkTCiqM7O7UjuGkA8z9G9spH5E=
X-Received: by 2002:a05:6214:301e:b0:888:4930:7989 with SMTP id 6a1803df08f44-89274188cedmr21693466d6.36.1768369238489;
        Tue, 13 Jan 2026 21:40:38 -0800 (PST)
X-Received: by 2002:a05:6214:301e:b0:888:4930:7989 with SMTP id
 6a1803df08f44-89274188cedmr21693246d6.36.1768369238047; Tue, 13 Jan 2026
 21:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com> <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com> <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
In-Reply-To: <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:10:26 +0530
X-Gm-Features: AZwV_QjHwh5ovf5EN6Tyl3Ug9Cf5imbrDy6Du4j2KN4SYA_3sBdnF4y6Nbv7fyg
Message-ID: <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kCHO5LJp8IusNvTau8-BtDi2BEWM2t3O
X-Proofpoint-ORIG-GUID: kCHO5LJp8IusNvTau8-BtDi2BEWM2t3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0MSBTYWx0ZWRfX9I/s+n9hW72O
 pXszNltSdYPI8NztpG98aj4UPlo1VgQNzxwd7P4QiBrgZmXXOqFVHK6jiior/nkrYqHWpRbkbsR
 JwpBjI7hZJIZxry7LaCmw5YfVY0mv5h4UmP7pzWcvvYfgoXOF7LitSz3nQjfB02HWW2Fp8ndmER
 fREqMg7Tw+N2CQvhlFMSKjZz20sqQhbpNaXmg2zgzFrVj3gNbxH6MePZrxcoaNsvJMH6X96n8tx
 9eQJXzdeJyfAtGmrmXBeFIO5AjoDADtHcsi4kgKUkIpqiBbjM5PaFWvAuNfnRMhL1lJEa/42cIi
 2AgYLd3q4pcaYwRxpxhH+b5Jy2Y9OmnWSQlWC/UsU4g2UMg5eM+vKYQ5rm2a+vIq3eOZ208LmLM
 8njStNA3tq+u0oz9k5Ms76nz6sBi6cHrh2BJOj8MpuVp/GGiDo3sTp9eaKslGsjjdQ7dMBX1lKw
 heQoeBLly5OmnmNxlsw==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=69672c57 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=d3pjDsmsH-2TaDM6u_MA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140041

On Tue, Jan 13, 2026 at 4:59=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > On Sat, Dec 20, 2025 at 9:47=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > Enable secondary USB controller in host mode on lemans EVK Platform=
.
> > > >
> > > > For secondary USB Typec port, there is a genesys USB HUB GL3590 hav=
ing 4
> > > > ports sitting in between SOC and HD3SS3220 Type-C port controller a=
nd SS
> > > > lines run from the SoC through the hub to the Port controller. Mark=
 the
> > > > second USB controller as host only capable.
> > > >
> > > > Add HD3SS3220 Type-C port controller along with Type-c connector fo=
r
> > > > controlling vbus supply.
> > > >
> > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++=
++++
> > > >  1 file changed, 158 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-evk.dts
> > > > index 70d85b6ba772..d72639479d75 100644
> > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > > >               };
> > > >       };
> > > >
> > > > +     connector-1 {
> > > > +             compatible =3D "usb-c-connector";
> > > > +             label =3D "USB1-Type-C";
> > > > +             data-role =3D "host";
> > > > +             power-role =3D "dual";
> > > > +             try-power-role =3D "source";
> > > > +
> > > > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@0 {
> > > > +                             reg =3D <0>;
> > > > +
> > > > +                             usb1_con_ss_ep: endpoint {
> > > > +                                     remote-endpoint =3D <&hd3ss32=
20_1_in_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb1_hs_in: endpoint {
> > > > +                                     remote-endpoint =3D <&usb_hub=
_2_1>;
> > > > +                             };
> > > > +
> > > > +                     };
> > > > +
> > > > +                     port@2 {
> > > > +                             reg =3D <2>;
> > > > +
> > > > +                             usb1_ss_in: endpoint {
> > > > +                                     remote-endpoint =3D <&usb_hub=
_3_1>;
> > > > +                             };
> > > > +
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > >       edp0-connector {
> > > >               compatible =3D "dp-connector";
> > > >               label =3D "EDP0";
> > > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply=
-0 {
> > > >               enable-active-high;
> > > >       };
> > > >
> > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "vbus_supply_1";
> > > > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > +             regulator-min-microvolt =3D <5000000>;
> > > > +             regulator-max-microvolt =3D <5000000>;
> > > > +             regulator-boot-on;
> > > > +             enable-active-high;
> > > > +     };
> > > > +
> > > >       vmmc_sdc: regulator-vmmc-sdc {
> > > >               compatible =3D "regulator-fixed";
> > > >
> > > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > > >                       };
> > > >               };
> > > >       };
> > > > +
> > > > +     usb-typec@47 {
> > > > +             compatible =3D "ti,hd3ss3220";
> > > > +             reg =3D <0x47>;
> > > > +
> > > > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYP=
E_EDGE_FALLING>;
> > > > +
> > > > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > > > +             pinctrl-names =3D "default";
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@0 {
> > > > +                             reg =3D <0>;
> > > > +
> > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > +                                     remote-endpoint =3D <&usb1_co=
n_ss_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +             };
> > > > +     };
> > > > +
> > > >  };
> > > >
> > > >  &i2c18 {
> > > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > > >               bias-pull-up;
> > > >               power-source =3D <0>;
> > > >       };
> > > > +
> > > > +     usb1_intr: usb1-intr-state {
> > > > +             pins =3D "gpio6";
> > > > +             function =3D "normal";
> > > > +             input-enable;
> > > > +             bias-pull-up;
> > > > +             power-source =3D <0>;
> > > > +     };
> > > >  };
> > > >
> > > >  &qup_i2c19_default {
> > > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > > >               function =3D "gpio";
> > > >               bias-pull-up;
> > > >       };
> > > > +
> > > > +     usb1_id: usb1-id-state {
> > > > +             pins =3D "gpio51";
> > > > +             function =3D "gpio";
> > > > +             bias-pull-up;
> > > > +     };
> > > >  };
> > > >
> > > >  &uart10 {
> > > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb_1 {
> > > > +     dr_mode =3D "host";
> > > > +
> > > > +     #address-cells =3D <1>;
> > > > +     #size-cells =3D <0>;
> > > > +
> > > > +     status =3D "okay";
> > > > +
> > > > +     usb_hub_2_x: hub@1 {
> > > > +             compatible =3D "usb5e3,610";
> > > > +             reg =3D <1>;
> > > > +             peer-hub =3D <&usb_hub_3_x>;
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb_hub_2_1: endpoint {
> > > > +                                     remote-endpoint =3D <&usb1_hs=
_in>;
> > > > +                             };
> > >
> > > Are all other ports disconnected? If so, why do we need a hub?
> > Hi Dmitry,
> > I didn't understand your query, can you give more context to it?
>
> You have described one port of the hub. How are other ports routed? Are
> they connected to outer ports? To some other devices? Unconnected?
Hi Dmitry,
I would like to put it this way, USB HUB has 4 ports but only one port
of the hub is used between SOC and Type-C controller.
Remaining 3 ports are used by other devices.

Regards,
Swati

