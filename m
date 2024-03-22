Return-Path: <linux-arm-msm+bounces-14903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D18778874DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8EC1F20FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED6C82C6C;
	Fri, 22 Mar 2024 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EC1n8Imh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D158289E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711146802; cv=none; b=rO+QCXEwGX06ud1G564plfj/U4AtlqqSvm9hnSQ7Fqqy/oamG1JHtKIWnDlnMed9wWF3OSx3sfamXqVyLFucHM9XiS0nVHNYhBcFztHgQB30r65B+gVbTnk6L6uInL2S7s4p8u3eNdDEtSSRmosk19bpRBLptz7GRgmLtiCgKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711146802; c=relaxed/simple;
	bh=eqf3ihHx9YHmHJuuScJ0QnswcC+loLOYogzQd1XaHpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9gUbRTs6hHe/FRYhs/Xm+4+w1SSFnizSikW8f6b+CBrZlNAWnkoLt5e/jKhErN7c6VdKNttCXSMLvYQC1kAThJiAdNMjEPIy0AIxdPAVLyEn2lhL9YQ3LNQr8pC0EXTBVo2hM7RoneVBzq0ZBbROqCpPHoh75le7OGG8+sUEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EC1n8Imh; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2611110276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711146800; x=1711751600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ9F0pY9n/+igvd/03ZLKYicj33ULltRkxaxHp9S2Mk=;
        b=EC1n8ImhTItkTN4PavZIK4BRpWnuHsMjukmbTREwhMfKuGkMbUU1ObIvXhzPgXskFf
         Sjk0TPxH4Msq4lGSTPSMmSfpPwJGzLbTvg5OM9lG/fhQ+93MrO522fxc+UFfIEC5Vg4+
         SQ3RaqAwpUi0urIseuKGN5JY10a7dm6ZeugrnBdltOaXS+bt15yg6YmYdyu5T7ilBk5k
         p+d3kYZ3h75c6vnkv9vSwZqUCEy4oASN4RxFnrTgD98YdBh4OGXIX9DhJMm3v6+Cr4YC
         CNScVUlHIjpbZzz1kWfm9p5RUfuMFfuWLQ6/xImSDi+z79q59NzUPdQ1dhKZP3OBgPw7
         ajVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711146800; x=1711751600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ9F0pY9n/+igvd/03ZLKYicj33ULltRkxaxHp9S2Mk=;
        b=WECTyx0OYT7NkHcNTREav+82n6a36XbwDLKuROVmmyKQLDqJVluBLAs0B/BeSveOVH
         VBHs93CP1Ai1k3ZGzwWChdeVg7+ZLjUcyUwZHqUUdOk82cpu0zNgwguL/ZIk1BfdJvVm
         DdWukfj7w0namunTs+fddrTs9JW0FWILFknr0AwpP4sMEZ/FMjLGVjAzB7qlIejcdarT
         umrbAL5kVQYLbzJaYOmovCJnvE7n3YJix3/2Hllo6Qt+DmfUlUIP34JmA0gHlASZ2Ehf
         CHUG0wFraKa4MsYpekfIvsIH1a2zawVpi6ZYiOvWkSrTbkQ+SE+BoJjzpfAj1QdcGnvU
         3G+w==
X-Forwarded-Encrypted: i=1; AJvYcCW6XZvDH7U9+pErv+HqHt3k4gz4Y28PPF1/lEkxVuaE4FI0E6/9Xq4FoqPf8MVRS1wlQ/BHZzSJ44N9kCy+AoWvLMSsZLPjJDXIZXXOZQ==
X-Gm-Message-State: AOJu0YzlrnfNTA7wj7LDEBLDXiQ9Fns++jJJmVElbGrC2ntBctyAH16N
	CYCqbQpdzqOaAePlioppX+seW99dbo0J6AG1exa0MUujU4/DAkMQrYbnkyVRhfzGh82vbp7Y8m9
	TK8zPSaCWOLFn+aZb6sNxHGj41S/QuNTSj+YEyQ==
X-Google-Smtp-Source: AGHT+IHeqHvXyVTz47o9FkA2GJ7YHmI3n1DCfYkliY4NJgtd4mhyutbc3aVWnftbGu6jfh1yTN/kdnyTxaqt4ddPtJ8=
X-Received: by 2002:a25:1941:0:b0:dd0:2076:4706 with SMTP id
 62-20020a251941000000b00dd020764706mr576713ybz.31.1711146799824; Fri, 22 Mar
 2024 15:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com>
 <20240321-apss-ipq-pll-cleanup-v2-3-201f3cf79fd4@gmail.com>
 <CAA8EJprr4E1CM4f+eBzdRN41nm33xY-hRPQDn3peR94vLyJsYQ@mail.gmail.com> <ca4d85f1-397e-4c43-8548-436b9238e85e@gmail.com>
In-Reply-To: <ca4d85f1-397e-4c43-8548-436b9238e85e@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:33:08 +0200
Message-ID: <CAA8EJpp9jyCHgMSEBMumSz7xXUkMRm3wapjUdjzeOuJSpH5g5w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: apss-ipq-pll: remove 'pll_type' field
 from struct 'apss_pll_data'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Mar 2024 at 22:59, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> 2024. 03. 21. 11:37 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
> > On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
> >>
> >> The value of the 'pll_type' field of 'struct apps_pll_data'
> >> is used only by the probe function to decide which config
> >> function should be called for the actual PLL. However this
> >> can be derived also from the 'pll' field  which makes the
> >> 'pll_type' field redundant.
> >>
> >> Additionally, the CLK_ALPHA_PLL_TYPE_* enumeration values
> >> are meant to be used as indices to the 'clk_alpha_pll_regs'
> >> array so using those to define the pll type in this driver
> >> is misleading anyway.
> >>
> >> Change the probe function to use the 'pll' field to determine
> >> the configuration function to be used, and remove the
> >> 'pll_type' field to simplify the code.
> >
> > I can't fully appreciate this idea. There can be cases when different
> > PLL types share the set of ops. I think having a type is more
> > versatile and makes the code more obvious.
>
> I understand your concerns, but let me explain the reasons about why I ha=
ve
> choosed this implementation in more detail.
>
> The driver declares three distinct clocks for the three different PLL typ=
es it
> supports. Each one of these clocks are using different register maps and =
clock
> operations which in a whole uniquely identifies the type of the PLL. In c=
ontrary
> to this, the CLK_ALPHA_PLL_TYPE_* values assigned to 'pll_type' are only
> indicating that which register map should be used for the given PLL. Howe=
ver
> this is also specified indirectly through the 'regs' member of the clocks=
 so
> this is a redundant information.
>
> Additionally, using the CLK_ALPHA_PLL_TYPE_*  for anything other than for
> specifying the register map is misleading.  For example, here are some sn=
ippets
> from the driver before the patch:
>
> static struct clk_alpha_pll ipq_pll_stromer_plus =3D {
>         ...
>         .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_STROMER],
>         ...
>
> static struct apss_pll_data ipq5332_pll_data =3D {
>         .pll_type =3D CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
>         .pll =3D &ipq_pll_stromer_plus,
>         ...
>
> Since it is not obvious at a first glance, one could ask that why the two
> CLK_ALPHA_PLL_TYPE_* values are different?
>
> Although my opinion that it is redundant still stand, but I'm not against
> keeping the pll_type. However if we keep that, then at least we should us=
e
> private enums (IPQ_APSS_PLL_TYPE_* or similar) for that in order to make =
it more
> obvious that it means a different thing than the CLK_ALPHA_PLL_TYPE_* val=
ues.
>
> This solution would be more acceptable?

This looks like a slight overkill, but yes, it is more acceptable. The
logic should be type =3D> functions, not the other way around.


--=20
With best wishes
Dmitry

