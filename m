Return-Path: <linux-arm-msm+bounces-77250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08355BDAFDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 21:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322DE19A11E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 19:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56A126CE3C;
	Tue, 14 Oct 2025 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op5ZR0bJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD1238C1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468697; cv=none; b=fWAE8mga1L9P85/l/5yDDLD5pXN4782tbnBetBNEgDEcmASPvBCjGircTGZsK3mnHDrhhe95kok1mYYE9glPPCIARtKjl01S3VP7l5lhkl4eqPVh0xWHhxn16Bq7MP4w9I/k32EzpjsTi9jP8V8TkKlLaLydwzQ+2nWLYV3sGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468697; c=relaxed/simple;
	bh=N0AeLKKkCbDWNM2GHj2h68g3QkP1HDjh2+4qJG/csDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEUt3p9Z8KgfTB0ZIR1Yx5dXzPqGRslOO84oXyNy9ErPrQp/HOp0Zz6SFHjb7dG+vIkwstr3LgJDBqLMNYhqQmJKeHIh2YOCNlxBbH1HOVjVq7lI3DHkO93pAYWYIUYEUbETnOQrjAbwbvT48T4syFqcjL4n2Qk4Cs/6ajYjwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op5ZR0bJ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7815092cd0aso10363327b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760468695; x=1761073495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LFWIwNcJTb0LbxCmM/QhGZd9SB3ddKyXhVeoMfh/Zo=;
        b=Op5ZR0bJrteLhX5O67vCItpxZDTwSSOtkbnvcjwLkSeyv3O+jsTvH4rj8yUv9PESCX
         brGiAQoO8PQcWo/Ky6KlmN0+tNi9XRA5F1tTe4UKE2b7NLfHGmdENrF9lhBVW0EKIkAA
         axc3S7g5lvRTvCs6m7X1tiy6Ojcn/nUCyVAJkLicQt241pzYVZkOCTruKA0IPCQdgOiC
         maUdKcELwKS5wv7JxMQDV4z3YjcMDkfj/7/KFYPrIqFRI88SzUpGieR4Dq2IiPu0V2Hs
         qjrwd2m/PrldMC4aX1Cz+kXvCG53wAYevIV5bMcfBZbW6qJHVjkXxBTZNeZnyU9MSsx/
         AVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468695; x=1761073495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LFWIwNcJTb0LbxCmM/QhGZd9SB3ddKyXhVeoMfh/Zo=;
        b=a7ox7X2vJd9x866mN2vbov7lwoyHXODaxPgtY9sT+jdIOb0bpknQXl5yneGnToQqtv
         p5/4Fy6Pnknla190L4GoVb+w5qB0O752sa1nWDQukjei8NYh3LpyVALLgSOC9kgLRqgR
         ZoOOrwF9qqrtvMeEU/FrJwhkfmVnp9LQIkV4NpiUCRiTNA9pZVa7tcNvGr54jZF+SC1p
         S8C/1GTmNvZEal1Q7XuDtafvw3fLL3KqijQJh8eP4smbpeR4WthOG61SvevXk65712M+
         SwmohYnx3Ui/NvHyKjIPAoCUYpghINSdlzkfucnohoCV6bj47OSUcjfsHxlNPAc8Z9Ov
         dGOA==
X-Forwarded-Encrypted: i=1; AJvYcCWUl6IsGVqKxKedIXpgm1b+UPMXkMBvYn9OrFzW1HiJ69Xx27elhF0X3EK/HEb4e+FoZqnH1iFlMP1YNUYr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqf0/GDbNqHIp5Ge9mlxCk8DBVhlEh5hCPgmA/MNO/29P5gFtP
	IacngqaytU975CFYPMYIpLopkRBqSWmADjLd4Dux7GDqFMWPDXvh66CIxXX3QQH5/3JVRXhaqbG
	G6kdBots4x7Z3TobNbSBD8juDTaCin1A=
X-Gm-Gg: ASbGncuA4osQMsIoQ7Z188kXYEYah/iKV0BleP9rgY0fx2lBJHoZ5dUxSXduvyp0u0C
	6KJCA71vvn3lu0m8aVX7MQQ8mIH7Gi1HckD33MMn981gKoFv5wr36A5FO5RcD9U9ZADg6qM6ZW9
	5pLfLLYBpYwMvpj8h/LvF95EyCWC0hLlkeTIAqkH0Qw+YHivKT7MPSjw5sNbZ3rzoSqGzuLP3gu
	AQj1NXEjq+bjovZTlDudXfq
X-Google-Smtp-Source: AGHT+IENp8MGH0xB25fjWT8oq2mwyBPcuUqJct7YWr59h/VAdp+CaWyYdVq+xLcQfadKFc+RgdG15n4qfGSudatVgQA=
X-Received: by 2002:a53:ba85:0:b0:633:a326:3b07 with SMTP id
 956f58d0204a3-63ccb8d82cfmr16411233d50.24.1760468695058; Tue, 14 Oct 2025
 12:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014044135.177210-1-ghatto404@gmail.com> <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com> <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
 <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com>
In-Reply-To: <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com>
From: Ghatto <ghatto404@gmail.com>
Date: Tue, 14 Oct 2025 15:04:44 -0400
X-Gm-Features: AS18NWCHVKoCQ2wy6kKDp8pC-T3MMcjTx0pmcrDz7hEAH7pvV2HDWmC4HnxPwl8
Message-ID: <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:18=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/14/25 5:10 PM, Ghatto wrote:
> > On Tue, Oct 14, 2025 at 7:01=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 10/14/25 6:41 AM, Eric Gon=C3=A7alves wrote:
> >>> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
> >>> depends on "Input: add support for the STM FTS2BA61Y touchscreen".
> >>
> >> The second sentence doesn't really make sense to be included in
> >> the git log
> > I'll keep it to the cover letter then
> >>
> >>> The device has an issue where SPI 8 (the bus which the touchscreen is
> >>> connected to) is not working properly right now, so
> >>> spi-gpio is used instead.
> >>
> >> Some Samsung devices used to use spi/i2c-gpio intentionally, also
> >> on downstream. I'm assuming this isn't the case for r0q.
> > It isn't, the device uses fts2ba61y on the spi8 bus - I hosted the
> > DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.dts if yo=
u
> > want to take a look.
> >>
> >> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
> > The driver probes, but it fails to recognize the touchscreen device
>
> Could you post a complete dmesg and the precise DT diff you used?
https://pastebin.com/QkYa8nMp (android dmesg) mainline dmesg doesn't have
any relevant information other than spi/i2c probing, however, I've noticed
both on deviceinfohw.ru and the dmesg that for some reason the touchscreen
is on spi0.0 (even though DT says 8) and I'm not sure if that means it's on=
 SPI
but on a bugged out bus or if it's really just spi on bus 0
@@ -85,7 +85,7 @@
         * is used instead.
         */

-       spi8 {
+       /*spi8 {
                compatible =3D "spi-gpio";
                pinctrl-names =3D "default", "sleep";
                pinctrl-0 =3D <&spi_clk_tsp_active &spi_mosi_tsp_active
&spi_miso_tsp_active>;
@@ -106,7 +106,6 @@
                touchscreen@0 {
                        compatible =3D "st,fts2ba61y";
                        reg =3D <0>;
-                       spi-max-frequency =3D <5000000>;

                        vdd-supply =3D <&vreg_l8c_1p8>;
                        avdd-supply =3D <&vreg_l11c_3p0>;
@@ -120,8 +119,7 @@

                        status =3D "okay";
                };
-       };
-
+       };*/

        vph_pwr: regulator-vph-pwr {
                compatible =3D "regulator-fixed";
@@ -134,6 +132,10 @@
        };
 };

+&gpi_dma1 {
+       status =3D "okay";
+};
+
 &apps_rsc {
        regulators-0 {
                compatible =3D "qcom,pm8350-rpmh-regulators";
@@ -280,10 +282,38 @@
        status =3D "okay";
 };

+&spi8 {
+       spi-max-frequency =3D <5000000>;
+
+       touchscreen@0 {
+               compatible =3D "st,fts2ba61y";
+               reg =3D <0>;
+
+               vdd-supply =3D <&vreg_l8c_1p8>;
+               avdd-supply =3D <&vreg_l11c_3p0>;
+
+               interrupt-parent =3D <&tlmm>;
+               interrupts =3D <46 IRQ_TYPE_LEVEL_LOW>;
+
+               pinctrl-names =3D "default", "sleep";
+               pinctrl-0 =3D <&tsp_int_active>;
+               pinctrl-1 =3D <&tsp_int_sleep>;
+
+               status =3D "okay";
+       };
+
+
+       status =3D "okay";
+};
+
 &qupv3_id_0 {
        status =3D "okay";
 };

+&qupv3_id_1 {
+       status =3D "okay";
+};
+
 &tlmm {
        gpio-reserved-ranges =3D <36 4>; /* SPI (Unused) */>
> Konrad
Resend (forgot to reply all)

