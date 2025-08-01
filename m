Return-Path: <linux-arm-msm+bounces-67386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B7B183BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7EC166CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A001264A65;
	Fri,  1 Aug 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcaWICrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DA4A1D;
	Fri,  1 Aug 2025 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058504; cv=none; b=Wx/xi9oz0gWyenmYkdVFuW31sEqkR9P/jrTNxB/WhkKN9TCfV73g3ZnV7Ewh4XOPwKc4aKmutGTZenDc1NldTkHgJixHqFaeDHXnldL5d1Ifxi8MvlXs+EiBrvD3DmQ7QalRQo+PtEoPyhvmCjTjXX297dZdbA75EgFK7z3WeFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058504; c=relaxed/simple;
	bh=e9RvAYInnB4VZcnPQjb6wG3e8g/630/UmWIrQ0HM7Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOO55wmKPxlvkAEclROjxRXnYpCcVaGZaEm1ZV1X+5KnmRCGIKQaFNDlvdEBAdBSHurvBghtFDyLBYM581koInPaS44UrlP89PdYxBMT2hv5mWc4nHy1ckFQ2RW35FLwhTErB2GJZyadEjxB7w3hQuVnmpIhXddqd99Jf5rD7EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcaWICrh; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f2ba094dcso270581241.3;
        Fri, 01 Aug 2025 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754058501; x=1754663301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9RvAYInnB4VZcnPQjb6wG3e8g/630/UmWIrQ0HM7Qs=;
        b=RcaWICrh0BeDqfv+bq4QxWUOtEhWn9NE60fgXOTo+nWtyFHYP3hQMpsKJNO1EA1Zxh
         wbwi/BWxgisgaZc9l7rTAMTuq1i36K2OrZZupeGLjyF9nM6Qg7nszCYSxXuN18cLYBvD
         jYS/pOol9E8dD/Z0JrzvjSyQ7RyUwgAqSzV3U6uGY8VLTLI1AdVLOOwbwmoyWU+zkjRG
         mUqv2oejpVU+MgQ/3K96N5HA1DlUH9okP6xV7DlTflMXPF6jBasTTHe8mCDo8uXghaq7
         7BfvT1xgpcLGuM6NviJlRjRn9O997I9N4G6ptuafFegEfMXAR2uCKTn/PIsiiZU2ofV6
         8I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754058501; x=1754663301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9RvAYInnB4VZcnPQjb6wG3e8g/630/UmWIrQ0HM7Qs=;
        b=lN3j1Ddpknvz0Pd9J0LNp3nH0a4aw54CeU+T66xmRB0fDGZgFOmhGH0ShBou7hyvTx
         wnuSzMN1/Da4Iwc/cUkmOFziXfI6CyhnWExIv0e3EQqYdvGRk7/xtjb14kuOPiAp7OOc
         Y1oaEqfMg0/Q9aWF7Cnnzh9cYthyetTG1Oy6tLgK78MMjH/qrCiD/FWMMTAN9OhYEQCI
         3ysThZwQL7lHShdYF7fy2YOjrxgRHtqaD/5l0c5FgMdG6PWW86e2CbEElnQ3pTmxafOk
         Acc0+MlKGsMHa2BUhUNDJGJ9BvOs/CJ7o5G5I7LoCO1xDolhjaBUKQIrUEmo8jbtxxdj
         5exw==
X-Forwarded-Encrypted: i=1; AJvYcCUlMcPyH19V/tfD2B8NCimGZzD7Y3zZwzDSvS97M0QGe9TyiU8x/whkNS4fDImHug6nSkXkriy0dIIms8+U@vger.kernel.org, AJvYcCWniVIl6ZYxpIBAExfx/RVSiIvSrvJockS/CRG+qZ12ZBIVBPfYUKckQnW3teC0qu//nZ3SFSxKe/RuX5It9A==@vger.kernel.org, AJvYcCXKbUdtqaKzIb/krit0sEitYxY4h7CkOUO3OGIlRBY4KWMm+Qat1N+85V0MP2zDnEZUpCNzHKuEJz1o@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8N7N9i7AcVFD2FwUpMuuweXDdrKZ6dkNJxAzXPw7BL7Qtgxoo
	W0g/VK6LIIOq3pW1FO77Fdb42NYvSZgqdqRv/y+kW65DYGMMassTM9ldclmKWmpsMGzuV3piJCn
	u1AaqUGOAfvPpPzqEFyRiRIbe6u+tjSCf+jMex7oIiw==
X-Gm-Gg: ASbGnctoImgZrpTigSMJjTkRbToyFLcpLVNrzoROOBD32oF8MEu+nqnPW9DK7TccFYm
	g44O5CD7emU4MYMh8Cc7m4OsjZ18fOTU+FFM5YHypJd1bsid/Gb4vpchv8tHCApBBSYpdNdDLo/
	0dxMyho605zsoWqaYM/ojs2Zi75QRu9MlWwEHFfLHaYH5tguqfBtdRBGUK5LRP9GJdZZWrZ1ASM
	DCILgK7feyv3WRqDJsIJbhPwA==
X-Google-Smtp-Source: AGHT+IGzKVwecF461e12oRWQtMfBZUneuDZ4zZARyJM8PYWM9/42W/sYHaniTJyHBLbo6S9LVbl8/weTlZ9pEX5b6ng=
X-Received: by 2002:a05:6102:160f:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-4fbe877763emr6118306137.15.1754058501468; Fri, 01 Aug 2025
 07:28:21 -0700 (PDT)
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
 <0cf8f99c-a64b-43c4-a747-d5dd6fe28996@oss.qualcomm.com>
In-Reply-To: <0cf8f99c-a64b-43c4-a747-d5dd6fe28996@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 1 Aug 2025 22:27:33 +0800
X-Gm-Features: Ac12FXyf-VOm_yxJcGIhlZMls5hMGyq7EpCifUQwOh04bPyH5vkMErRs2wu34q0
Message-ID: <CAH2e8h6m6q+fq==cVGA-=iUJC7qxZvomhCqm904AtH9CceL6ow@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aliceryhl@google.com, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@google.com, 
	ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org, 
	sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 8:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/31/25 5:05 AM, Pengyu Luo wrote:
> > Linux:
> >> ae94000 20050001 000001f3 0000000b dddd1011
> >> ae94010 00009130 31211101 3e2e1e0e 00001900
> >> ae94020 00000000 05190019 064c000c 065f0528
> >> ae94030 00060000 00000000 00040000 14000000
> >> ae94040 06100006 00003c2c 00001000 00000008
> > Windows:
> >> ae94000 20050001 000001f7 00000008 00001010
> >> ae94010 00009130 31211101 3e2e1e0e 00001900
> >> ae94020 00000000 05320032 064c000c 065f0551
> >> ae94030 000c0000 00000000 00040000 14000000
> >> ae94040 00100008 00013c2c 9bb9b000 00000004
>
> 0xae94008 differs, bits 0 and 1 say that the cmd mode engine
> is busy doing something (did you set MIPI_DSI_MODE_VIDEO?)
>

Yes. I can confirm MIPI_DSI_MODE_VIDEO is set.

Speaking of cmd mode, I still have no idea why DSI_CTRL_CMD_MODE_EN
(BIT(2) of 0xae94004) is enabled on Windows.

> 0xae94024 says:
> Linux:
> ACTIVE_H_END=3D1305
> ACTIVE_H_START=3D25
> Windows:
> ACTIVE_H_END=3D1330
> ACTIVE_H_START=3D50
>
> 0xae9402c:
> Linux:
> VTOTAL=3D1631
> HTOTAL=3D1320
> Windows:
> VTOTAL=3D1631
> HTOTAL=3D1361
>
> 0xae94030:
> Linux:
> HS_END=3D6
> Windows:
> HS_END=3D12
>

I believe we can ignore them now, I found the final dump and verified
it=E2=80=99s correct. Previously, I mistakenly halved the porch timings:

Incorrect:
.hsync_total =3D (1280 + (32 + 12 + 38) / 2) * 2.

Correct:
.hsync_total =3D (1280 + 32 + 12 + 38) * 2.

Here is the final dump on Linux
# ae94000 20050001 000001f3 0000000b dddd1010
# ae94010 00009130 31211101 3e2e1e0e 00001900
# ae94020 00000000 05320032 064c000c 065f0551
# ae94030 000c0000 00000000 00040000 14000000
# ae94040 06100006 00003c2c 00001000 00000008

> 0xae94040:
> Linux:
> RGB565 (16 bpp)
> bits 25/26 are "set RGB888 for DSI1 stream"
> Windows:
> RGB888 (24 bpp)
>
> (suggesting your panel driver is wrong)
>
> 0xae94044:
> you may want to move the
>
> /* Always insert DCS command */
> data |=3D DSI_CMD_CFG1_INSERT_DCS_COMMAND;
> dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
>
> in dsi_host.c out of the if (!video), not sure if it's correct
> but that's what Windows seems to be setting
>
> The other differences are due to the current DCS command(s) being
> processed
>

It seems a normal behavior for video mode, for sm8650 in video mode,
I=E2=80=99ve also seen:

# ae94040 06100006 00003c2c 00001000 00000004

These two registers are REG_DSI_CMD_CFG{0,1}, video mode uses
REG_DSI_VID_CFG{0,1} whose values seem consistent between Linux and
Windows.

>
> Hope this helps
>

Thanks a lot for your detailed analysis!

Best wishes,
Pengyu

