Return-Path: <linux-arm-msm+bounces-16061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B38950A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 051C5B22ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A0758AB4;
	Tue,  2 Apr 2024 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4tCu6Gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0D5EE67
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054902; cv=none; b=Vh0fnrKHK1LbvYkHydAzsVRww408EKwPt/wXrYN11ARprpMOBtSdS+TC1C2XnRK4ItgKvmk2tJCHQkQP3OB1rGTNaJvgrnv0kXQa0uIcrhgyCnve3NnGU+VFLPYe0CGGvxAr5zR0dNxThzkQJm37Y5msBt+YJ5qBuQ+J3TcAr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054902; c=relaxed/simple;
	bh=qqkptkwBB5jmETqLjS63zlxdb+z5eD6/k+FZmoOcCP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKtCk++RRf7I+WTFOOrSbPRt6SCkbA7Ls64/vIoQ01LCceYL/PNORbmLEaT8Qn7vBYhq+gA9xkXYBk6DJjAL1cK5F4ZJLv6fSsstYBIBEjbsTommQtfGa4bLaUIO0dYM77iFc4s5+Xj9ZdU3m1Q3CRxljjo9evITPZ8me3VlPnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4tCu6Gh; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso4837453276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 03:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054900; x=1712659700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+xPQyCvLo53dq7pKGpQQof9V6YZJuIofT5TTwfg8858=;
        b=u4tCu6GhOY38sRAviEV/tKlL3V3tT2l3fvAV59tynf3dKBVNSfO/RXTM5iS23pXu+7
         0qvMqTLkTyQqwMB0XwY4ciDrt21N1kbM3QG6YvCZtCoYUGcUiffQDKuSH56LkBwHUhES
         hOJVE4POJfo4e+7Q02ODEDCgG+/dky/Z1jpgk3nWT99mwem8H4e/cyAPXocjN0ZyW0sG
         w13myAXscyDancBhQqgM4ply80ZcqpNRp8MWGPTKaRGQfIPjRRBObK7u5Op3wtSAukId
         c/hAdLOzFkcrrQmRwa+TtxBMj4R5WToq8vDsSc5h3taODFEQh29ntK/JvlLU7IbLeikt
         sakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054900; x=1712659700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xPQyCvLo53dq7pKGpQQof9V6YZJuIofT5TTwfg8858=;
        b=U1caaewJLzypJz5x4NDgRo97tmVtRxmYchCgV/F/8H0eSneYRSlO/kAPdHgowVYpF6
         ZtWsVBaInqvW3xMfNifQ6CbBvvK5Si5mUuKRdda+mVKgNJ7MyaqvlbEQGOjgB5WiP1j4
         uN1nonIEzqQ/u98p9p/zDHFvQ+vQ3wXeZVIXHCHM8o7MJ3T8LhvylnUU52XI7UXzVTig
         6s8IWLon9z4UwkgJZgVE0KkogKwSLagh6Bq0MFaWdSRHiIcqr+RoygP8KSNKUKUVIAws
         hu1pF4i9wvHQafdvm+uy2DHntcJwiKBSTmP5uyMyl1/qd1XHCzyc6A1p0FyroHZ0w8Cl
         F5ng==
X-Forwarded-Encrypted: i=1; AJvYcCXP/qz0p/updEi9H9C3U3Z0lFjenCMHnsDsMLAvHqcySZ2DBiYPLN5C+5K1FoaUEd0qJflCtyS6PPs0GThpv/uHv6Q0IG3zD2Pj2whapg==
X-Gm-Message-State: AOJu0YxyLnGcWbXzm2HYjgvE6mkjibt5egCBUL6Ha1gUeE/TP67rEr7W
	tzK1VLQCU0ByvAwXuHzpBhQ1HA3vDIJ2K0Wf8iW4q1dksX3V/trlvotL9LFJXcCWs3RsRmxnSEv
	9eoaiwgO2C1tQEcfNxOqo12nz1yVRF2Z02W24vQ==
X-Google-Smtp-Source: AGHT+IEdThI7DXVCE+YtsqVQ5FfgA2JdRwa/suM7w9m6RjmrZhMB+jlS68lFUGN2ID6qPpnpew/nE9vA5K+Hs04awQo=
X-Received: by 2002:a25:9a05:0:b0:dcc:9e88:b15 with SMTP id
 x5-20020a259a05000000b00dcc9e880b15mr10209955ybn.41.1712054899681; Tue, 02
 Apr 2024 03:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-4-quic_varada@quicinc.com> <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
In-Reply-To: <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:48:08 +0300
Message-ID: <CAA8EJpo=TMhu+Te+JE0cQzmjLOTDPi-Vv-h5Bch0Wfr_7iVi2w@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:40, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
> <quic_varada@quicinc.com> wrote:
> >
> > Wrap icc_clk_register to create devm_icc_clk_register to be
> > able to release the resources properly.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v5: Introduced devm_icc_clk_register
> > ---
> >  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
> >  include/linux/interconnect-clk.h |  4 ++++
> >  2 files changed, 33 insertions(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Wait. Actually,

Unreviewed-by: me

Please return int from devm_icc_clk_register instead of returning the pointer.

-- 
With best wishes
Dmitry

