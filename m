Return-Path: <linux-arm-msm+bounces-14429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1587F461
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 01:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E0DE1F2157A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 00:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE74363;
	Tue, 19 Mar 2024 00:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhJ45GCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AFB3D7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806990; cv=none; b=dwIjdI1VIiCMWMFON8zNIXO1oZ8uIoyR0Khd3NVsD1TKV/II3dMw+fPvp9ZDRdpFNvK4mjru4cdd2SLbtaFI2EwaqqVsQs7ap3gWmyJhOgWlyXuC+dpyoDOUbRWw+rOFSC+g1qEJee+9Vnt5INCuUtliKLPybk2/Hg1ucpoonZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806990; c=relaxed/simple;
	bh=ZkryvYHfhOSYdw2tF4GlFSpiTUyA8Rs2/YBQ7EUbLn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Dzij1/khoLAsVZtNw+rYgonGRPz2i+ldg47HNtnGG/4D7bPKYwir/AOghDNVsG6yY/LOVmx6erO4LY0n3Hb4IZDn2GJfnX3lDQYLFBQeI3YSkpmidqG/RJoF8O3aWKmcqIMzOjy8S4+3atwvI0FXqnneUwaVdJ4hZP1PZ5mZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhJ45GCc; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a0599f6e5so46235557b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710806988; x=1711411788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fys+S9pk0Mj+NPz2xMHtozxNN5zajv+q8g6ODVq+MHY=;
        b=NhJ45GCcjPZ+Y3/GEqpvClbS62XxzfUNAIbW506fVaGdSJnGtnizOJsz3tMqJ2SaTu
         EjN/YJToRebs3GWpEsxX1vwuNsTC6VZ+o5H1WWO6HqSQPpLF0QqihUbIkwueT9tTCc/2
         6puFWX8tCRqFaK3VjgFvyNRt9YGrxi9YpObtQjQd8iK63EhVwK2moKHXz5wJ2IbsyKKS
         fmWdfrAngpmpJluiDlt0OHolwllk5kGM+CtipzSdbDhOswYMX1/buVdefBnoVT7MLqK/
         Nm87ilgJWW6JDu2F8ntKi9SU3ogyqtzRCfKx0hiEtrxvmssX7TzejdUEw0FO+m3d/JZX
         H5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806988; x=1711411788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fys+S9pk0Mj+NPz2xMHtozxNN5zajv+q8g6ODVq+MHY=;
        b=NvNxN576DDB6LuPuHGcB40BjLhp8MJ1jn6H4s6WKno+3otILydZt6p4MIsiAg9S09U
         f7xeJt4GkWDF5VPAr4aXOLarm1Fk+9p2ncIti3lIqSfz21JcMwmApmBXQh+Ch5TE+ysB
         +ax93lHykVgXlDCjnG4ZxjoOFhU9cyRQfqgpMhjuf/2l8ZTRWzAMFtxJOadXaofCG9kn
         jjE2+He8KrfzZOx54dCDMCMWrJGUK3CRzjl0PAmL5v6B5Bro5FeJDwsXhlx6YeNKVcu1
         ywAzUqWhq2u+2v2vV4PNEKqYmxTlihlyvxoe+v9BVslLC0AwYHYL1M0ZGMlDoEyY3/Z9
         NpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrOKnlPXBC6TFEUWgV1W/QCKd/BZGx8QQw93cLhjsY7XQneyx+KKyamQdV02uJj5FFXHqcARRm76Q9bNf9HYZVAla2fW/+CWsMYE8SNA==
X-Gm-Message-State: AOJu0YyLAlXWKNFlC5PcchdgRv40PcwVPFtlYb4iw0MRE9Jfc21DATnp
	Seeg7sNr2acOF3wxhLCCiFujveuoXD/55CXgM2Rl4Ky09m3NYKuG3yRyLF30hmcUA8Buzu1pZZc
	gbKVP8L/xGP4dgXtb8/vB5oDOPL46FzDp7aCn2Q==
X-Google-Smtp-Source: AGHT+IFUYNy3nqPWMFhyeAEEOgz59hN/rjXpDhVqxQJfYXeOZMQXyBfEq4Imb4IL7qF0eBO8bT0npSGQAdC6hzcbEjA=
X-Received: by 2002:a81:8147:0:b0:610:caab:bf50 with SMTP id
 r68-20020a818147000000b00610caabbf50mr5157049ywf.37.1710806988056; Mon, 18
 Mar 2024 17:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-apss-ipq-pll-cleanup-v1-0-52f795429d5d@gmail.com>
 <20240318-apss-ipq-pll-cleanup-v1-2-52f795429d5d@gmail.com>
 <CAA8EJpo2Vo-XqstNk69dWW8pqNkGi0tz3UmHY7j6LLKd-yH22w@mail.gmail.com> <09c91419-8bce-49dc-86d1-3ed1b9f28ee6@gmail.com>
In-Reply-To: <09c91419-8bce-49dc-86d1-3ed1b9f28ee6@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 02:09:36 +0200
Message-ID: <CAA8EJpq+PUavezxAwpStm98_3uW7HQraFyUdr6uwZCNHJ4yU5w@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: apss-ipq-pll: use an 1-D array for Huayra
 pll register offsets
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Mar 2024 at 23:23, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> 2024. 03. 18. 15:16 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
>
> ...
>
> >> +static const u8 ipq_pll_huayra_regs[PLL_OFF_MAX_REGS] =3D {
> >> +       [PLL_OFF_L_VAL] =3D 0x08,
> >> +       [PLL_OFF_ALPHA_VAL] =3D 0x10,
> >> +       [PLL_OFF_USER_CTL] =3D 0x18,
> >> +       [PLL_OFF_CONFIG_CTL] =3D 0x20,
> >> +       [PLL_OFF_CONFIG_CTL_U] =3D 0x24,
> >> +       [PLL_OFF_STATUS] =3D 0x28,
> >> +       [PLL_OFF_TEST_CTL] =3D 0x30,
> >> +       [PLL_OFF_TEST_CTL_U] =3D 0x34,
> >>  };
> >
> > Can you please move this to clk_alpha_pll? We can then drop it from
> > clk-cbf-8996.c too.
>
> Sure, I can do that. By any chance, do you have a suggestion for the name=
 of the
> new enum value to be used in the clk_alpha_pll_regs array?
>
> CLK_ALPHA_PLL_TYPE_HUAYRA_IPQ seems too generic, and it would be a bit
> misleading using that for MSM8996 CBF.
>
> CLK_ALPHA_PLL_TYPE_HUAYRA_IPQ6018_A53 is quite long and it is also mislea=
ding.
>
> Maybe we could use CLK_ALPHA_PLL_TYPE_IPQ6018_A53 which is short and uniq=
ue
> enough and we could add an alias for that like CLK_ALPHA_PLL_TYPE_MSM8996=
_CBF or
> something similar.

HUAYRA_APSS ?

>
> Regards,
> Gabor
>


--=20
With best wishes
Dmitry

