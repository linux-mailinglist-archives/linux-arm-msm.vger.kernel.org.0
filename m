Return-Path: <linux-arm-msm+bounces-34061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5599A028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE83FB2183D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7382D20CCC8;
	Fri, 11 Oct 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0JYwjVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CC20ADF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638940; cv=none; b=AcN79q9nJDyJvKIIappJNmU3u7OlGret3een05MTgy/8h0yU/LdmgxWy5M3g53QNekbsGeo1lxZTQNSW/XJOFuHHYsx81HoTMjiltmsK8pCSlznTuOmAlE0vqs3iSd+6+/tgH0OxyUC+UWMudJlxU4gafwRfSVPionOqIaR9hD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638940; c=relaxed/simple;
	bh=DltDeVYJEIb6wjca1o7bFaNWh22hJNIaTsco4M0fMzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4OpMdiLskbQdoxKsiWKZwL++0eNwEERJ6CyAcp4BH/ALb3IUsqq81zuKS3KQrNghohy0Y4emfQ3qN3pV0UODyeKcLbJyNzRHLrRdNk3vT1/wdhBT4EjQja0wa7zSPHVhWA2YW5lS6x4ow7JA88rAbOvvcTIQo+8E9hjkeNo9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0JYwjVO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d495d217bso1445883f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728638936; x=1729243736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TCoDAR3p+NDgfps8OlJnbGKnp0R3MeEWSzHOxiQY0I=;
        b=G0JYwjVOmsppUfkGh2OByNk70IarIL6uyAStv2jEJCq8DSCJpanb7SMvPcYJ2/xyQ0
         JRkGBm9ZAhnVkqdjtlRFW65Ue4D54da5VSVwkHWjM9ueHeaZzBGKw5MvWGrPv5jvqxZE
         dmPfbKGu3x7r5btEbBttkfSncW6G27rdP7tvLJyRck0jT0yhO14Bya1azt4I/+AM4Tuf
         NfTHcdMeaWBZBgKeLiY5aPRORKuZ6Euu8oTOPRyvqQt0A6YOlYyW8Io47v7LKFi7OFBV
         gEpLGJQVY+kH6ce75Lx9tTsFe4NxwDU81okz+USANS2sEsTcAMWAD2Z7Vf9WxPczMSaG
         d8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638936; x=1729243736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TCoDAR3p+NDgfps8OlJnbGKnp0R3MeEWSzHOxiQY0I=;
        b=M5taIH6r0GeI/20s6UDUh7WvT+1549XCYEcrMqnyRqaNe0EZvKnU9gpUd0uZQY/O4h
         wmds3NHUq9lD46E6BgGE+TZhkhzoo9WLQ6wNfTEv1EEikLFJWFLIP6DVwk4SDkWj/Vmy
         1MQYIeXvcjQ4MR5+rtOnY2DBkUQkCJfpfYYkwtvkz0T7z2qX9bI/Ct2o1bobDbUpZvR7
         jwn6oVJu1KcbljKNvVbJMKSoXmGZJEtepEgVetgsjTimaL6WVmzCVcsqCt3sUoHjztjh
         AytdEQDPcrUjrHUhp//MK+ldC8YsysgeALBAJVcj/siPnrbutFqolRKH19QI3/FGd+q6
         Gxdg==
X-Forwarded-Encrypted: i=1; AJvYcCWkrh0L9IUnvi2+kYi5QUziRlrcALXLf2lYRWg/9+CXnVKAZkTx5g5XvD7ecXCnnUkT/KaBP+Igi00RK6TR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6t9A0NPSYk/jUzJ4c3uLachRSEeSo7Oxzsus3EBcKxDF6Q9V
	JCN+Oaet3j++UGAozGt8+7r47QDgCMILwbcO7UMaU29/9ouEzJ8wnhd6CSx1o1VtyfxoFVKOc4h
	8RA7lW2vBQw9Ni03HIHfYVT/tZMeF0mxK56YyqA==
X-Google-Smtp-Source: AGHT+IG8wW1q8UJWHHq4y9KQZM4c6D7AmGKumiUzVkMrFvBY3yCJMkHghO6Wg3mIMaH1uDi6/A1L+L4KOCuGGEPI4z4=
X-Received: by 2002:a5d:5270:0:b0:374:c3e4:d6b1 with SMTP id
 ffacd0b85a97d-37d552ade68mr1496679f8f.44.1728638936030; Fri, 11 Oct 2024
 02:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
In-Reply-To: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 11 Oct 2024 10:28:45 +0100
Message-ID: <CACr-zFAT9tbmH+YUBLazUjzH+uyjeKSewpd=XFr3HBd7=jaMwA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Oct 2024 at 21:52, Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
>
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>
> ---
> Changes in v3:
> - Remove one of the fixes tag.
> - Link to v2: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v2-1-b8=
25048b828b@mainlining.org
>
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f7=
0ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Barnab=C3=A1s,

This patch fixes a regression with UFS devfreq on msm8996 (introduced
with the linked commit in your patch) so:

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

