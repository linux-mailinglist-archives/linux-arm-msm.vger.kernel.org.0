Return-Path: <linux-arm-msm+bounces-67515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B4B191B2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FA934E0316
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598D31F4615;
	Sun,  3 Aug 2025 03:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZmL5PNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FD19F12A;
	Sun,  3 Aug 2025 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754192220; cv=none; b=DlV94g2NHmrWZc6zjC3l4yM/XU3p6eTMBAJv2fJzRQUaLX7nDVqSDVylRmogWQoe66yBSgNyELOXIVmdcfOAYxkqXQtLU5YVvsj9M8bEeB4x4qjdGSAwNeQdMxEnMouSOlFs5OVM+zOrhNrtJKk6GF4GYnZXnwYnTIR3p/GZubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754192220; c=relaxed/simple;
	bh=NBUzMqNLJI5hO+Q0ct5dTkWMq4OCLDRMJmxjTyC3ccY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mmq2w9/ZdBDcaAwgvfoiO2HFEV7oB8tvH9tLv3KQ7Tkts6HNuHgoKYzobjEXg6Ku6pUPmlZi4E0Sb2vv+dDzMFz2/XhhFw0Uj7iairSiRvMOZX/T9Wdrm7geDDGS2lLNqKvxD7mfsCg5dcBscBkf5OokEyY8Py4EdHYXL+QRrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZmL5PNs; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-539329de448so2500331e0c.1;
        Sat, 02 Aug 2025 20:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754192216; x=1754797016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goqU0AWS84aQxcO5Z7IrmPTxY4Ao6SZVD0LuCk91VlM=;
        b=HZmL5PNsfIoVa7ZpwARoB6g0plcciTDK+COiBeiDFTBR8bW2FBIxiGpjj2dOG6QSh9
         uEIuCCGlJnGIxqKByvKzBe9AOqMC46YAcL4I4iK5tlcd2rS2pSDqyUlaz6RqPbzcp3gp
         yMBVhcEmX+MLhGxpWnUynz5iRRpZOSeLOg8bwM51QK5O+Z7o7PE+XKb+rrGPoOP17X0E
         zy6494Mb6coGl7TC1TZqvzY8Xa7BY179XhnMSQrMESQRJQR3pkniGsScRRmQlWs+yYsd
         GL+pTsNmKO9JxGikCztsnq40yTbJ/Nj2eUP45qOQClqJ+QS/XxfwJa0Bt8aJdvEZ5Xv7
         MOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754192216; x=1754797016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqU0AWS84aQxcO5Z7IrmPTxY4Ao6SZVD0LuCk91VlM=;
        b=ajfpo27IIoeRlEv4LwcruSjXEWPBI7JUbJxislE0DoDNOl0yv9nQ0D0KMddftAwcr1
         8xW1JliU4eFf6WPgiLtMyfyuj+6X6+JBb+LS0z7Ux7cc9nH6DG+ZPBoCsiKRns2rXctY
         hXiN0e5XWA0AWvmHQzSUV9sjVrDBPHxISN+rWvz0EH/5U/N6bl4QWMlmZOqAEpwiv67r
         YfUiv1mjKS7Dt8N8QYGdRXu+RfiQ7tsj5RMCUdXNVpepKEhs6KK8NQQf0RWwlQzNeSeM
         CpLDw686UxCZWYNtxzpHuKpNXxIBJiGADovkrc7xsUmtfzxB88A9AO6QV66ZmmKcwkEx
         g+yA==
X-Forwarded-Encrypted: i=1; AJvYcCV5cZEWelGLAO9RNp6JXktutAoMk5vPlCpcpCBPeSA1lkuTPh1X0AmMbGVRy1QNXf4Bu/spSSQMgem0@vger.kernel.org, AJvYcCVrOq+OVQaEqJ4WkENz7AYh7m4sENZo3dtVoqgN6+Ld7oUCrhKZ6nfPIZPVU9hb3Zc+LL80LODOzVdi7A10QQ==@vger.kernel.org, AJvYcCWzEBfAsv0nvbr7nai8nxPM4xrcyHt39TcVBtpCk0s6sKzTj3lRcL6LiwuczyZEGAz+xOK88N6ou4l96iz4@vger.kernel.org
X-Gm-Message-State: AOJu0YxpW81HXkL8w7hIrvE+W5dmPwOML/9lqUAeEhWagegiOIroFsrz
	CKBMibwOFbKLo4BpxBzrK4pjV3zyTHJ5g+GUFgwMBqh/iRtzpx8a/0uLmtgYrbyNVM6nMLdZCP5
	JoXR+U7QrOWd0We8Ng7oe5tWb2rOND5CZzEG1SlryFeWt
X-Gm-Gg: ASbGncsNPbKMdVcPQxHRnbVagEue2e7M7m7Dkkky/BqqAYaDJP76/YQocu4t+LH/RrY
	NvxDkj8oKuAtAtoWeTW/ZESdmOuh0NzpsxsJX+iwm35n8vxTDckmMNN2xIrjGUst5MLeZUH8qoB
	qwzRfpqyP/AK/CFbbhFnNYV7AnR0WpMrLUDzljJO7FiygEsW1zu8AuguvQvCsH04xJJ7dy/Iorn
	Mbi4JrNRV5jX6ihykTSVZhQ4dubX8mzUFHS
X-Google-Smtp-Source: AGHT+IFxQ680ymJ/Dgv7xkeonYThdx1143GJKD6h2r5rJw8UOZoVvBJazRmw8GPuTbvMfKS0K9RGNTfKP2uj0D8Q7jc=
X-Received: by 2002:a05:6122:62ca:b0:538:e454:ea8e with SMTP id
 71dfb90a1353d-53938905a99mr6213579e0c.7.1754192216483; Sat, 02 Aug 2025
 20:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com> <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
 <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
 <9efafa16-e6db-4227-9b47-5803f5933a7d@oss.qualcomm.com> <CAH2e8h5Eov+827X3W_EZSHRoaUHgP119fXJA+WEUdmdJ6f3gkg@mail.gmail.com>
 <0cf8f99c-a64b-43c4-a747-d5dd6fe28996@oss.qualcomm.com> <CAH2e8h6m6q+fq==cVGA-=iUJC7qxZvomhCqm904AtH9CceL6ow@mail.gmail.com>
 <t7fbgze3hnwbget5nkf3i2rd22pk5vufyimiiec5i7rblzb7x4@rtiuwnyfbmtb>
In-Reply-To: <t7fbgze3hnwbget5nkf3i2rd22pk5vufyimiiec5i7rblzb7x4@rtiuwnyfbmtb>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 3 Aug 2025 11:36:07 +0800
X-Gm-Features: Ac12FXxaMPDjcFH_ikXFCpRLSv3WL_j4288oH9v5u20Jqo92XCOn2AM2pLeGTXs
Message-ID: <CAH2e8h6oN1VYevLe1NPpvcAjDjUNBrGUtEWy9y3pDhboCjabMA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, aliceryhl@google.com, 
	andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	ebiggers@google.com, ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org, 
	sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 1:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Aug 01, 2025 at 10:27:33PM +0800, Pengyu Luo wrote:
> > On Fri, Aug 1, 2025 at 8:29=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 7/31/25 5:05 AM, Pengyu Luo wrote:
> > > > Linux:
> > > >> ae94000 20050001 000001f3 0000000b dddd1011
> > > >> ae94010 00009130 31211101 3e2e1e0e 00001900
> > > >> ae94020 00000000 05190019 064c000c 065f0528
> > > >> ae94030 00060000 00000000 00040000 14000000
> > > >> ae94040 06100006 00003c2c 00001000 00000008
> > > > Windows:
> > > >> ae94000 20050001 000001f7 00000008 00001010
> > > >> ae94010 00009130 31211101 3e2e1e0e 00001900
> > > >> ae94020 00000000 05320032 064c000c 065f0551
> > > >> ae94030 000c0000 00000000 00040000 14000000
> > > >> ae94040 00100008 00013c2c 9bb9b000 00000004
> > >
> > > 0xae94008 differs, bits 0 and 1 say that the cmd mode engine
> > > is busy doing something (did you set MIPI_DSI_MODE_VIDEO?)
> > >
> >
> > Yes. I can confirm MIPI_DSI_MODE_VIDEO is set.
> >
> > Speaking of cmd mode, I still have no idea why DSI_CTRL_CMD_MODE_EN
> > (BIT(2) of 0xae94004) is enabled on Windows.
> >
> > > 0xae94024 says:
> > > Linux:
> > > ACTIVE_H_END=3D1305
> > > ACTIVE_H_START=3D25
> > > Windows:
> > > ACTIVE_H_END=3D1330
> > > ACTIVE_H_START=3D50
> > >
> > > 0xae9402c:
> > > Linux:
> > > VTOTAL=3D1631
> > > HTOTAL=3D1320
> > > Windows:
> > > VTOTAL=3D1631
> > > HTOTAL=3D1361
> > >
> > > 0xae94030:
> > > Linux:
> > > HS_END=3D6
> > > Windows:
> > > HS_END=3D12
> > >
> >
> > I believe we can ignore them now, I found the final dump and verified
> > it=E2=80=99s correct. Previously, I mistakenly halved the porch timings=
:
> >
> > Incorrect:
> > .hsync_total =3D (1280 + (32 + 12 + 38) / 2) * 2.
>
> If you halved the porches... Is this panel using a single DSI host or
> two DSI hosts? In the latter case you need to assign parents for DSI
> clocks (see how it's done on the sdm845-db845c)
>

Two dsi hosts. I was using your OOT patches for dual dsi cases until
you upstreamed them. So I have set

assigned-clock-parents =3D <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
                         <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;

as you did in your msm-next repo.

Best wishes,
Pengyu

