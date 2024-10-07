Return-Path: <linux-arm-msm+bounces-33455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A351E9938A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 22:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D60061C23D81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020841D31A0;
	Mon,  7 Oct 2024 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjHCyCMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB51DED51
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334614; cv=none; b=cNX60b/Ub+Lnl2/3yb3iY39JY3GTzlANyLWkEYIb254OaLxSXFOclCj9ThEyMd5C4JB/ygJycnN0HGGjhoK8RL0nE7v9TMpwhj/cekOIVn4BHG6a/lCIl5ZTrjYNmg2rzeGHT/UtAidklTd5xyKQ2EthEhdrh//yvByb+zQkFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334614; c=relaxed/simple;
	bh=xZJAFpMouvWG6zS3+F4DbW+1vh6OgnwW9o3CxkImSwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6XWa7av2G1s5xe3KRl6n/tZ4rMqnusX5zHAPGK1ElHqXEMKtKLPNK/cyUxtjOF2tExv9MY6C9PiQmRTf78X4kVYBkX5zBDE4dWnzWpZWrjXNKzJmsw826jYwba/rSNApb+sq54qqLuEn5CLD9y/GQKN0xnfWwljS6isg/ubH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjHCyCMX; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e25d405f238so4253090276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728334612; x=1728939412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZJAFpMouvWG6zS3+F4DbW+1vh6OgnwW9o3CxkImSwE=;
        b=fjHCyCMX5q/ZJeayPkuDoq7xLTx0OwEadqnMJ0oT8KgCfa8ygc785xLeToU4/VREOl
         +J1Gj/Q6WsjpUinvu9dby8zSU8tzWMTlLdv0pvLPbt6QXOJYcGhFCm7Q1+JnNvpQYmaU
         rAP7IWicAsVwJFblcjsb5BJGExU29CEpT1jhkGQC0TL4WbiiNwRrXCeVmmGef7SEUBBQ
         oVJBrUNSmVNwMsdK3N8U0kB7yUZzf/mkmdK/NAVXJOCZV2nKEjZ3do2lCOmQldDENDBD
         TUGFmQFNwmc3ht+zbyXUxbPEmBqmFQvhiR7QMI0mmjMXLqzMSK0UVaJEkjaOMmHZ+RAl
         HTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334612; x=1728939412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZJAFpMouvWG6zS3+F4DbW+1vh6OgnwW9o3CxkImSwE=;
        b=UYuKVG94iv9RwkkIdG01ngc8O9A/Hy7H/6WQxK++Yp2bWsq0235F9gl6SFHzMi0rHd
         lT4BJyrYbYs9BeyiJR9a8mK3rm07DdROzqqilw+iT64pJ/hJXX3Yi2qifvoC8E39f0fh
         5aoMqYXww3Mxg4uIZsu0Bf4GGsNp8H/oYyX7wWa0P/W8rN8J54w9f+fB3fegSpd2j2sn
         LIHIjouks22n0+iP2/I5zFdgPhLT6QH3xN6lB+UcepbsxacWEA70JFM+G2DoadRwj+Cs
         hewhpxYwHOT4rOAgiX3EGb5Oc1GbluqmzUWc9Ss+G/vdHTp7a8KIfw+YJMnFqrdeU25g
         HvkA==
X-Forwarded-Encrypted: i=1; AJvYcCWUk7hJMh1SkUWlKOnQZXnRRhK41OJgQs5JJO0oIytRIZo2/uKbO6aihNsypApLGaIKGReFxy0rQqGq80Lh@vger.kernel.org
X-Gm-Message-State: AOJu0YwilIs2RdBpP5lf3705tLcxBEbB0piYB21EgqwWFqdL/H9glMBl
	u73PtTPzP+gGg9wo8ARto8HHSb5Q0a7iuthItsNzzzhT1kzGT2i24eZ56cEd9f/CB5PoAe5a0H4
	xS9ao8Y3tfFSCqhzTVCbzV0f9WMv1J3cGlUJwlg==
X-Google-Smtp-Source: AGHT+IH9JibtRn7hWF2aIVbPOxqpOoKC4zASzFHmnvgWSHK0W+0r5Z5oJL2SC0hZy1ZdJPUSNaYWkN0VZ/4nZ1grcd4=
X-Received: by 2002:a05:690c:2904:b0:6e2:145e:7733 with SMTP id
 00721157ae682-6e2c723cd67mr82791877b3.18.1728334607481; Mon, 07 Oct 2024
 13:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com> <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
 <2eb53ea6-848a-48bb-8c31-83a118bc5a73@quicinc.com> <CAA8EJppEQKJ=oQh=TeFaP0z1sXDQhz=LN_TC4YygiLOe_EX6Tw@mail.gmail.com>
 <015c697f-5842-4797-89c8-7c6cc68ced49@quicinc.com>
In-Reply-To: <015c697f-5842-4797-89c8-7c6cc68ced49@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 7 Oct 2024 22:56:36 +0200
Message-ID: <CACMJSesF1tQyG85uLNbdsGqqq4xY39-KKwW=3QRMOcvpOCNsxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Oct 2024 at 22:44, Kuldeep Singh <quic_kuldsing@quicinc.com> wrot=
e:
>
>
>
> On 10/8/2024 1:43 AM, Dmitry Baryshkov wrote:
> > On Mon, 7 Oct 2024 at 21:17, Kuldeep Singh <quic_kuldsing@quicinc.com> =
wrote:
> >>
> >>
> >> On 10/7/2024 1:00 AM, Dmitry Baryshkov wrote:
> >>> On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
> >>>> The qcom_tzmem driver currently has multiple exposed APIs that lack
> >>>> validations on input parameters. This oversight can lead to unexpect=
ed
> >>>> crashes due to null pointer dereference when incorrect inputs are
> >>>> provided.
> >>>>
> >>>> To address this issue, add required sanity for all input parameters =
in
> >>>> the exposed APIs.
> >>>
> >>> Please don't be overprotective. Inserting guarding conditions is good=
,
> >>> inserting useless guarding conditions is bad, it complicates the driv=
er
> >>> and makes it harder to follow. Please validate return data rather tha=
n
> >>> adding extra checks to the functions.
> >>
> >> Sure, I=E2=80=99ll remove the redundant checks.
> >> Please see below for explanations.
> >>
> >> My intention here is to handle erroneous conditions gracefully to avoi=
d system crashes, as crashes can be detrimental.
> >
> > Please fix the callers first, rather than adding band-aids.
>
> I see your point and understand the emphasis.
> I'll submit v2 as per suggestion.
>

Just to add to what Dmitry said: when you see this kind of checks in
the kernel, it's typically because it makes functional sense for the
API. For instance clk_get_clock_optional() can return NULL and it's
considered a no-error situation but in this case clk_set_rate() must
check whether struct clk * is NULL and it returns 0 as if the
underlying set-rate operation succeeded.

On the other hand there's no such situation where a NULL-pointer
returned by kmalloc() could be considered successful and so we don't
do NULL-checks whenever kmalloc'ed memory is expected as argument.

Similarly here: there's no chance qcom_tzmem_pool_new() will return
NULL so there's no reason to check it and if it returns an ERR_PTR()
then we have to trust the user to check the return value and not pass
it on.

If anything: you could add __must_check to the relevant definitions here.

Bart

