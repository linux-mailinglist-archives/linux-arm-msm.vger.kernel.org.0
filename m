Return-Path: <linux-arm-msm+bounces-92766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENghAG0Bj2kAHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:48:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA071353E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1125B305147A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C8D3B1BD;
	Fri, 13 Feb 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2Uxi6hE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRkynYqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF7136351
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770979545; cv=pass; b=YeS2PIe4dwv4EYINrjv8V9J87Gy0yc5gPsIcfYiCHgtpv6eVvcqWEtOi39K2j0g9NIuLL9yqO7H2qdacgdQA0GSplbjqU34rTAHC6cJ95z9sMlakqqnl09rL6ctl/ymgEHAKpYhAIFemiz3cOf8/+jV1YdvpfcqFi3aE7Bj8e7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770979545; c=relaxed/simple;
	bh=VaIFWo/5AeL63ubChvk6dtQt79j3M4zCPFEGLmI0GLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1IN/FQuKUJVGlBALGXRzQ5xWq4q2GCczArGGrxgmVlxuSMBFamYH4pXPM4Dj6aKhkMLl3duyZqptFzAPCxguexVbBszkTFqhcof9+bbUs1bGT0KBSgkXHT0hMVip9W0224Xy6lf7puFwWCLvN6/aWM+W6pqBqmBTrpLbulTegg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2Uxi6hE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRkynYqV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7lnv33424059
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHbkJ4mwjReAr8K5r0hTuzwppgBVmKotCe7hoPlgduA=; b=A2Uxi6hElOqO2/sm
	OJOGhd5u3wxFApoGmXljCfKnJHpb3JVdtAlZrbFYeCfc4IbHDKcRvSu7Kc++Lkv5
	YlQ0+7TAZb3ncPwRpZY4JWeOvE9Q5Mldf8a2xN4NJjuXGFq7B+m3P+Z9xSufgB4I
	ViKfqZQvHoAQQ9aOINASiq4AjcUhW/ZgPI5CQ0yzZy+K2ktiCQWDUTWQpsqp3Nje
	XyHVDcEG1Stiy4HXoi03XOUMZgKESf340V6top3D5B26bs1GNLxHxfP2/3eHehtt
	5rhqaTnq6d17cSn4Snx0CKyVP6+4UaQmzNCTpzsNxAlIY9TxKavoG6d0IiKVRP4p
	oXNxFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9yvrrmxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:45:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014c9ee70bso33148501cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770979543; cv=none;
        d=google.com; s=arc-20240605;
        b=bh8tQMh/xm7nvxkg37GTMj4og83jdGp5OXPPZLQOsaZr+T/xbgVi2DTZ6IAjYwvlwl
         8winN2xVgZ5eaPko9PRG1jLZDMz8708bXFVNTBxSGSxn5puEdneK0/qO46Bris3OfZdz
         Wlc9ruk/oX9r5zAjkWPslcNGkavGalj+ffM505kzFsjHY6UfggWAe7wB7pp0coLMvDcU
         SGkWR+m8uiCh8N97wXt6kPrWNkzRKwKthoolTDbkQnVYq7lzDdAsK7X6FLdjG3e7e3qI
         mGRoLODCdnxg3etM42IL2ETBVXkFKG0q81ZZV3g0kgDaKMasGYPmGOkg09a09+NMjRV9
         jzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHbkJ4mwjReAr8K5r0hTuzwppgBVmKotCe7hoPlgduA=;
        fh=S/l9P4wgtrh1uMib5UKzZeshE+KFtyk2TbdvpkQeOR0=;
        b=hSwoHdm8/iCUaQuAp2+LuZNXQNwfKbahL7oMfJn7uEKFM7ulZBo8DJmkUzIzybCYdX
         KOlHIYGFui2FzNZlMwAkobUY4VdClBdtQQsDYX7IFVi2aXOjikJiMufvhUuvlUibOT5V
         Fg2O0DbiM4dcFQhQ0mIGzmZBu0i1ZCpcLAVg+ZrNNQvSo8cWGmAXa+2f0m3wNzwigcmY
         vjR1AxI1kvS2/mmXoUTHfOKUhmrtVay78ZCuJw5SnWxsS4aXJGn0fNUorXqzNzRlEf6F
         /q3dn1RmUbEeUm3eu28EbS+40ZYYJIDdPTJsNQj5VMoMCoUFgyji8Pbo9i5D751r0s/k
         VT2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770979543; x=1771584343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHbkJ4mwjReAr8K5r0hTuzwppgBVmKotCe7hoPlgduA=;
        b=dRkynYqVRNMimRWEpPMWD88w1m8idP/bWqityXvCOdzdhPqYoDlRmmoQSZNwZz1sQg
         C8Vug2yqW1NLUMx8eGrKmbjfKIAdcqTj5uDQOCIai8xu/G1nJztxGSxFIFvEezNS+69u
         onQLq3+2/ikhr2oM2gDsgpENMDAYtVE1MiOXjcBYe66vMeBQQSLg/OJQC7AATK2Sktxo
         U9jFx/zg9R5O8xiubZQVNNa3zesDWZeDjrZItVj5rltzZz3v9pjzHl8ggB0o5PE8MliP
         G/BFUX4+MzWTmGtCzOrS3hFX/ngk7823QH0iB2Sd7Y/GF+g9y+vdmpHjNXQHkRGQc8qc
         fwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770979543; x=1771584343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHbkJ4mwjReAr8K5r0hTuzwppgBVmKotCe7hoPlgduA=;
        b=RUkOTep9+gRvx1euv4upIydp8O4XKX93Tx0HxabtBmiIrXNp5jjqyA2Wr1gXeLu85s
         OrHeHnlR2vfpiYhHovdkxYJ/Te0OyMPZgM0AhlxQfV/Vya/tRZe9i5QoqxmIKwpzwJ3H
         +N5rfLsQruryVef7UYORLhp/8T3dwHxIqtShfWd05Edx/esKD0g/YpBk4mR9l49DBEzs
         fCQtiYLlQDcgz8MDGJ/lmjnVc672uXzF6oG7OF+i4x42IKpTWV59FI3oIRI0w1Z7zqlD
         emNwTuksEMO5O0tG5otsDJMOxyW9aesmAZrJF33WcU85xYxXuYZN3ZpUKzDPgXl6mLbF
         QJ5w==
X-Forwarded-Encrypted: i=1; AJvYcCXTu6U0n/KNFD5cE9Zc5AdowD0I2Ks9Gx63ir+gC7OpBmV0vJAK86x6rIQQLsztmRrKQnL5VHi5uRJopgKX@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5rd/mz4O6VsChEJru9JCv8FY1nBSUVfxs+PzJXz0QwmFXnvP
	gNxrKMKvP/uF7NGNTnayTRqXwNh0ixu3xKghj6g8MODejZP0ZoRHBl95gXJ+EcoKkwbc6Zijr5v
	w907iDs6N+I4RN/TQubVoq5De1u+iFeU+0/jxRC5cJwEEOLvjWKQqvtRlDj+kkY6mPqOf4ylpoA
	kmCWTz6Q5z0OJoEqbBJGNonI9BCQQxKDKM+24QSYqv1lQ=
X-Gm-Gg: AZuq6aKt84IW3x+6KbwK0kAeefXnaDB8CapN9k1uXk28sJTP/tKV7SbJXnNgcROuhki
	JgoQtNwJdhAGp/TR7+XoWCiyMHdp0vpTjgcu3uNkGT7+V8HhoJ8Pclyg0C84VjdL7cr3lVq8Cez
	rnaXWE//T1J5o8CQFKIK89Kvb1Iu03QXsRSDbbVNaFEwbdEP14Y8qBvoNC2uSp6iTRnoY/Wh9wW
	C7yhHJdOrj+zZvbw4ZW6rRiTieZV6h8/LUuDLUI
X-Received: by 2002:a05:622a:1102:b0:4ff:b231:eea8 with SMTP id d75a77b69052e-506a8270c34mr16914731cf.14.1770979542802;
        Fri, 13 Feb 2026 02:45:42 -0800 (PST)
X-Received: by 2002:a05:622a:1102:b0:4ff:b231:eea8 with SMTP id
 d75a77b69052e-506a8270c34mr16914451cf.14.1770979542172; Fri, 13 Feb 2026
 02:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com> <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:45:31 +0100
X-Gm-Features: AZwV_QiDDnm1FbieQKwSe5Yp76O1orCTXZtH7qVPGaGAFAhJxpRfLJ0dp7Bs-HE
Message-ID: <CAFEp6-1+t+672=Oh8nvjMAEJrV_sz2SMzh1WeDNowsVzdXu8LA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AbzxcWYv8nVcbCT3chYBXFBS_gOgpS4U
X-Proofpoint-ORIG-GUID: AbzxcWYv8nVcbCT3chYBXFBS_gOgpS4U
X-Authority-Analysis: v=2.4 cv=LNZrgZW9 c=1 sm=1 tr=0 ts=698f00d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=kk0ejG7X_djWhqAOcHcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MiBTYWx0ZWRfXz0GzscJYh1mj
 EaRaTLi5Bcd0Txi1fRgaCVclwJN6tsPM2wT+vvPPNHAs3OYYpkMbUEqhZVl9fof1SgBQ0xmRl/K
 qQ0jQGhZTk5Zuw8Zx2OsYy9wpwe3z51bdfEccdIGfkzr+qK0rTfsT9Z9wA9IgGNXL3i3Sx+N/dI
 nLlIGDFhBzi8N94lNzWUrCuo5RhQDiRZzpU/SfGFzEdh3aDlNU9uYIZ1flrfZjNw/4Rc7qtAA3o
 oE6uB2OiCjeiGVi6Vs7Eoagn/XZONVNKm4KFgcV3/7CfLNLvPmoCSGzEvkk1BJ2GJmI+dM2Kgre
 6G3yzol9jOqUnH+t3+IZnAnP5ztx1FSsoW+DCIiHl3DEPW8w6uTB4xA0jeHOFREIuW5U2c8YhNX
 XtcdzVfSeW860axLssTs9hdBtiWyCtPDpYCaUAKs8vCTO9dSbtc+EFSb5PUvMIt/Rfa8BYEYRDu
 DkA52e+VY5uo9jXoW6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92766-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 5FA071353E2
X-Rspamd-Action: no action

Hi Swati,

On Tue, Feb 10, 2026 at 4:54=E2=80=AFPM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> Enable the tertiary usb controller connected to micro usb port in OTG mod=
e
> on Monaco EVK platform.
>
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> index 03af9bbcacc9..e6fc6f6a52e1 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -27,6 +27,25 @@ chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
>
> +       connector-2 {
> +               compatible =3D "gpio-usb-b-connector", "usb-b-connector";
> +               label =3D "micro-USB";
> +               type =3D "micro";
> +
> +               id-gpios =3D <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
> +               vbus-gpios =3D <&expander6 7 GPIO_ACTIVE_HIGH>;
> +               vbus-supply =3D <&vbus_supply_regulator_2>;
> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb2_id>;
> +
> +               port {
> +                       usb2_con_hs_ep: endpoint {
> +                               remote-endpoint =3D <&usb_2_dwc3_hs>;
> +                       };
> +               };
> +       };
> +
>         dmic: audio-codec-0 {
>                 compatible =3D "dmic-codec";
>                 #sound-dai-cells =3D <0>;
> @@ -77,6 +96,15 @@ platform {
>                         };
>                 };
>         };
> +
> +       vbus_supply_regulator_2: vbus-supply-regulator-2 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vbus_supply_2";
> +               gpio =3D <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +       };
>  };
>
>  &apps_rsc {
> @@ -484,6 +512,16 @@ &pcieport1 {
>         wake-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
>  };
>
> +&pmm8620au_0_gpios {
> +       usb2_id: usb2-id-state {
> +               pins =3D "gpio9";
> +               function =3D "normal";
> +               input-enable;
> +               bias-pull-up;
> +               power-source =3D <0>;
> +       };
> +};
> +
>  &qupv3_id_0 {
>         firmware-name =3D "qcom/qcs8300/qupv3fw.elf";
>         status =3D "okay";
> @@ -690,3 +728,18 @@ &usb_qmpphy {
>
>         status =3D "okay";
>  };
> +
> +&usb_2 {
> +       status =3D "okay";
> +};
> +
> +&usb_2_dwc3_hs {
> +       remote-endpoint =3D <&usb2_con_hs_ep>;
> +};
> +
> +&usb_2_hsphy {
> +       vdda-pll-supply =3D <&vreg_l7a>;
> +       vdda18-supply =3D <&vreg_l7c>;
> +       vdda33-supply =3D <&vreg_l9a>;
> +       status =3D "okay";
> +};

I noticed that usb_2/hs doesn=E2=80=99t work properly unless refgen is
supplied. It may appear to work on your setup if another PHY or
subsystem enables refgen, either explicitly in software (e.g. DSI) or
indirectly, such as through DP, which might be voting for it behind
the scenes.


> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 5d2df4305d1c..59dfacbae4f6 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5232,7 +5232,14 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>                         qcom,select-utmi-as-pipe-clk;
>                         wakeup-source;
>
> +                       usb-role-switch;
> +
>                         status =3D "disabled";
> +
> +                       port {
> +                               usb_2_dwc3_hs: endpoint {
> +                               };
> +                       };
>                 };
>
>                 iris: video-codec@aa00000 {
> --
> 2.34.1
>
>

