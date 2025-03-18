Return-Path: <linux-arm-msm+bounces-51795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C40A67AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F61119C10F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33824212B13;
	Tue, 18 Mar 2025 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkYC6p/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F1119F489;
	Tue, 18 Mar 2025 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742318246; cv=none; b=HE/19VquB0a2jyoPlH5n2GNtEwRk2hpgC7zr53IUbdWqWl+h2TjtIi4dBXa8DtEB7DEhTOMLuwPR3s5xAQKUKHqKN7yzbyxIT1SUzXse8Nf03bftfbR6f/CadwOSAeKzzm64Rk80SHflESFHnFzsNkJyK2J9Ur48xo+mim3kvD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742318246; c=relaxed/simple;
	bh=aT4A3050nXqlMCLfVvz8mwegtu5LKK3bQwAdCm1BcMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5rdCXeyzuW3YgrFkriwgEWteqF800VOC/l6+NpJMjxq1unizrViZa39UpwkiRPc5sw00HrEQhggtTlDvTU7wmFffI7w+ahnUQKKzG/sJYyZbcDtliFxMSbUs025+jnHYV++RBQZC8szocYuF2NC6aVF8W6ANo5Y1IWW0CGCovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkYC6p/R; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso21899585ab.3;
        Tue, 18 Mar 2025 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742318239; x=1742923039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv/Kdz6r0bC8x/tufa7dGSx3Zwa6vDB8jlK6Y1hGW4c=;
        b=UkYC6p/RhzhEpynMlfIEHb/b0UvK/hNf0umjGdefaTKHGFBvTh/Vn4cyH1//EiGE1f
         PRwOL5tEYIOFUeicyRx3yGozpJlL2Br6kqKCFU1xwrpPP/BfPy4cMnb7CYrpLM3IWdmL
         +eH7AkXMaHkRzy8khrtwOljhIPFiyLPXLaTJ2hQMBIoE1G25w3kHLmnw6djyAgG7BHr4
         ei7zxERDBSgq9hCla1f+avAFk+wI2BzK6Yvx5t52F9nVjOgALTX6ShO9SESjeOzEz7nd
         Bom7cLEu7lJzFt3x7SQmTWxJW1in/hCI3ic614goavua3JW2qSBlbPlMfiGEuwnoQeXS
         nC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742318239; x=1742923039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv/Kdz6r0bC8x/tufa7dGSx3Zwa6vDB8jlK6Y1hGW4c=;
        b=NXt8BLydTlsveUl3E0oZogg4GDgxZBPdCuDME7DPq1JJfqZWuDLBRQTnhwtr7MY8g/
         CGa1xp+NIGkTftBWc5xmQyAriqZvEn+XwqxRrvGjcXqjsxJVGY/h7qLo9+ZfoETNTVuL
         tADZX7nIf1scqgteUfgUqqh8011ic8p5qAeUxgSjPQ/da+nTXIWuxI8I2JKURqeu4ULf
         xXZgJcuamYg7G6Ty7mE+I3qfll6XaiBz13LOtt35Jrq/pTAJL9iz7YswT+SA+4GzZaIR
         97gsrMiUIpO6vktlgbOVAOA1TpIrCocw/CMqlkc681wb8aWbtDi83T05EdJaCya/wgPG
         rtnA==
X-Forwarded-Encrypted: i=1; AJvYcCV7t7Wk6zw0rpAQr6DcxGICXRuI5AlORM4paiYMeDoucfMH+ITNcllDd6XaLhkPOZ3wKaTJkk1N/QO+@vger.kernel.org, AJvYcCVY5z/4PudlxLj7LNwIDhL+zf+DAx1kFhM2ymuMByUaimJ1kyM2lqNVaJK3S4P3rrEofwFW41PDrcubHMgx4w==@vger.kernel.org, AJvYcCXoPH0G0TflyM67UE4/JNgcOO08+zobaSip9p2fETsMm8Ija6qeCMzTXEIDdxZPwpQYc3O4OWNsfco+6Cn0@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdXHC+sEXSH4dIVc6vWNDv2/Ay1ZRaoMkTNpefeRx4O+0Pjp5
	Y0OjHB8J9RH+h3g1RsoNveRgcHNX2LwDFEHpswWfIPqrx+aaBpnGrrPR1J1Tqf6kcGXECmiEb11
	jWGL7j6l+LRhlI4JX9RWrgvEs9PEO7OWz
X-Gm-Gg: ASbGncu6O6NuOHC3kXldFw16U8q6zz4MzvGtUFYfuogz4A9Cz78FuRGZoPd6+tOysEj
	Q6Ltx8DYAMa+Ribw8LWJ8reBX4jK1uAZuZ3rwwR1uvs7lCnHGL0AGpJiybIYQkcWz59eRcUDZu/
	S2YM/bNtplyaq1xr6bwY+7z0jjhP2r78GNKSL+4p6CuRsGYnuuGQK07n+X
X-Google-Smtp-Source: AGHT+IHZmCO2MIYwB/3B+Z7qdDDg2ychUh/NLXIU0blskckOkryFMxaetb6Crc0paMvPhheCIUdcelMqMsI2vl5Icb0=
X-Received: by 2002:a05:6e02:198b:b0:3d3:e2a1:1f23 with SMTP id
 e9e14a558f8ab-3d483a75f20mr204012975ab.20.1742318238656; Tue, 18 Mar 2025
 10:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com> <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
In-Reply-To: <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Mar 2025 10:17:07 -0700
X-Gm-Features: AQ5f1Jr09Pe7BHQg5T1VIKqTV-OODP6SDjHuACjq4Pv_H-iN7bY8rFcjXcNu7hM
Message-ID: <CAF6AEGv_MbP-ssR9k2TEP4Bcpyto0V3F6uXkESRT3rjg2U71AA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1
To: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Georg Gottleuber <ggo@tuxedocomputers.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wse@tuxedocomputers.com, cs@tuxedocomputers.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 8:28=E2=80=AFAM Georg Gottleuber
<g.gottleuber@tuxedocomputers.com> wrote:
>
> Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
> [...]
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.d=
ts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>> new file mode 100644
> >>> index 000000000000..86bdec4a2dd8
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>
> >>> +&gpu {
> >>> +       status =3D "okay";
> >>> +
> >>> +       zap-shader {
> >>> +               firmware-name =3D "qcom/a740_zap.mbn";
> >>
> >> Are the laptop's OEM key/security fuses not blown?
> >
> > Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> > part of linux-firmware?
>
> It seems so.
>
> Because there were no logs about loading zap.mbn, I activated dyndbg
> (dyndbg=3D"file drivers/base/firmware_loader/main.c +fmp"). See attachmen=
t
> for dmesg output. But GUI freezes after sddm login.

Hmm, if zap were incorrectly signed, the error would come after
firmware_loader.  You should see something with "Unable to authorize
the image" (`dmesg | grep drm` would show it).

As Konrad mentioned, make sure you have mesa v24.3 or later, v24.2 is
missing some needed fixes

BR,
-R

