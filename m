Return-Path: <linux-arm-msm+bounces-26320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E893248F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04301C2159B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C233B196C7B;
	Tue, 16 Jul 2024 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0HwTnN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AA1CFBE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127819; cv=none; b=S7MVRjsbNp81LRfIsuM7MhVb5QKNlWJSBfaZKD8s+Y73BnSD2FgfPI6rt/Cx08WeKZSqmnymXe0BAtO9i0ZjNBQj89GEIEZw3qfv/4D4UWXYFnnOqiNqeh0kflWQXtS9DnKkTqAhpEXb4YvXpGG2SoZvELGvK2WezezoXO/Z+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127819; c=relaxed/simple;
	bh=0IiKw3P7n9ea+EHSibuWiGAbol231bzGQi1ipj/vWqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVPGwE/+3H2g8nLgouYF+aEknf/JaIksf/qB4ESMAZIYgWCohcmwxz3BWu18FO+XgEjOP5wvDWUW7EZiM/pcjXglU0m5+tVjyInoBZT/LI+bMN6Tmg7TceK9qvvy2dohXpMYIpUp5a21cmlnTOAKEYmLlUZuA5a/CiacABzJKjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0HwTnN5; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05992214f9so3592960276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721127817; x=1721732617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESXugLMn1ZeeSJRsgklvu9ye6fD2GXrcaAUx8jiFFn4=;
        b=h0HwTnN5BE1+ktOLBXpNYpzpJrhFyrNcNs5LD8sU6ZMPksJnvkvd8nakv+7L98ZBxO
         jGRhWI4y3tpaC/3ihK/cbmAULRVR8+ZL0+xt3Z5AHK7jhJFScV7IHBs/cu5UWwOAuQau
         ATu03z6BCjs7ujpIM6PpoMuG03Z4u2e83gwjAJufZlGW9Hj9NieG079WA/+Cs1FqS7If
         DZE64tYLjLH4PeU+ZmDcJN1VMpH+JxaAv54KTYfQ5Md5BaPTqQSszJ6BkSpW1pm+Yaxf
         mustCgoJOwvFz5SpjctJsQkAV335WVy+wWMTuhQRbJHb4eh7Ys9ovyPeY58W8HRJW5Zb
         lrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127817; x=1721732617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESXugLMn1ZeeSJRsgklvu9ye6fD2GXrcaAUx8jiFFn4=;
        b=JS8xdN2ltUkTUnaCJqi8Wn1bqHzSaK/3I7nUDtMPzJN54S+kKXAt/G6gd7MWBmCGbG
         lDgHAvopr4xslKvBmxPzNZwTeKDxXNSYSArN0cMm88bUuDLUOJ12/WK+0yrJjiMiY7lL
         RR350TnafjEiMd0Mx5T14xhf0Xl0ayB9fxNgB92LCaQ0kyTE7k2QRvrdmcfPAKC7zM7z
         c0+KwiA5MbJ3IGrROANUJRHrknPMk9UztoUhJlWQL0kLDaE7LtwyLWXl4igVqZhVpiG0
         VtGHZDDv0RNLdM6zU+fRnBjGCHefxC1U5RAXYkzSAmXNhGq6qvIOlTdKHiGl11wx5sAb
         SPEg==
X-Forwarded-Encrypted: i=1; AJvYcCUB76dtRr4VQcYvpiI/07RG7AA1Siq2uaSciZRuW9YCiE7+TO8HXciUvlNdet6Aao879z0TY5Dsrdfk0J+VJKFOlf02xJF5WhCiTsCoVw==
X-Gm-Message-State: AOJu0Yzxbcv3U7Gr2/SN1dgCSFrkaZVW6TPn0PHqEzK11iqfAsPdXZeK
	f4t72Z0BeByDqBaukXkxNNqBRlU58Bk1UA3esJF9QkdRAuKmcaE7JdaJuiHqzBRD8FRQk3m7Jc/
	O96fPpA3ARX+pT0AbX0RDCCk4eFSMRpOTCYnEaA==
X-Google-Smtp-Source: AGHT+IEVxHn6Ap4SPTlWx+byHu29obsflmFGXwp7s1cPBRfp7TXM/kkjJMmx/DKgGYYY2Vlx2JDNjhK3pJBe/M9xXJ8=
X-Received: by 2002:a0d:cd41:0:b0:62f:aa7b:7075 with SMTP id
 00721157ae682-6637f6a4369mr17721667b3.25.1721127816951; Tue, 16 Jul 2024
 04:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org> <20240715190108.vjctytyntxlottgt@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240715190108.vjctytyntxlottgt@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 14:03:26 +0300
Message-ID: <CAA8EJpqzhEotdVsW3EudR9cqSOm-djjKSgRaqKRbEtJ6wTBZKQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: disable GPU on x1e80100 by default
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 22:01, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Mon, Jul 15, 2024 at 09:18:49PM +0300, Dmitry Baryshkov wrote:
> > The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> > file is signed by the OEM keys and might be not available by default,
> > disable the GPU node and drop the firmware name from the x1e80100.dtsi
> > file. Devices not being fused to use OEM keys can specify generic
> > location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> >
> > The CRD was lucky enough to work with the default settings, so reenable
> > the GPU on that platform and provide correct firmware-name (including
> > the SoC subdir).
> >
> > Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> > Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Keep GPU enabled for X1E80100-CRD (Johan)
> > - Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >

[..]

> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 7bca5fcd7d52..8df90d01eba8 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3155,9 +3155,10 @@ gpu: gpu@3d00000 {
> >                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> >                       interconnect-names = "gfx-mem";
> >
> > +                     status = "disabled";
> > +
> >                       zap-shader {
> >                               memory-region = <&gpu_microcode_mem>;
> > -                             firmware-name = "qcom/gen70500_zap.mbn";
>
> In general, why not keep a default zap firmware listed here? Anyway we
> are disabling gpu node here in case of platforms which doesn't upstream
> secure firmwares.

Excuse me, I missed the question before sending v3, however the answer
is still going to be the same:

First of all, we don't do it for other platforms
Second, we don't do it for other firmware. Each DT declares its own
set of files.
Last, but not least, it's better to get an error message regarding
firmware-name not being present rather than a possibly cryptic message
regarding firmware failing authentication.

>
> -Akhil
>
> >                       };
> >
> >                       gpu_opp_table: opp-table {
> >
> > ---
> > base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> > change-id: 20240715-x1e8-zap-name-7b3c79234401
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >



--
With best wishes
Dmitry

