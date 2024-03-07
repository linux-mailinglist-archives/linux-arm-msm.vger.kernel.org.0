Return-Path: <linux-arm-msm+bounces-13578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF608748BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48EA1F22B6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 07:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D935B5CD;
	Thu,  7 Mar 2024 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRZaeLCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38E63101
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796802; cv=none; b=E+ZgrEIR3TjPnjODLHB4pjDlt6yyeAOaMNEqNvoyAryWcY0siGhYMLi3yPitWhLDX44tTWlncOZH5A8CgLfiZB491J+aUtsXSMIiDm8KkhCwaSp36GJQfGnNPdv4Brvm+o1uJ/MwxJbRZAZt7G/0BmI17GNA4dZKs7AslnxIhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796802; c=relaxed/simple;
	bh=4lyRma1uLd4YSSr31ZCXdxndtYtwYTtWos3+LVAQ/aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8BUyovlDQAg14Y45qY70ircVKa9aDQEMCsJn3EuVaBIEg63EpS9+o70I1lF0tGjfQMuS/abqsxTgfhfyKOq4Wn0SkEB+n4O8toCMl1UGPhKdlGyGEIiyr/frd69gMKEG6+BBgIFimgNO+PfXyDHDfpJnb1UZyh0w4BMUDI3rhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRZaeLCe; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-472967264e7so163656137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 23:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709796799; x=1710401599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P+NdDsuxIrkXv5XnsTlmmzQGzW5mgIhW3Bs7pzDi3m8=;
        b=yRZaeLCeDpGZ0AbnmueHb+/SfvFgfAwsElLidb3M6ku0GHkvDXhy39dLavjcFmDM/a
         vyxDVxFAzUUhR94rd6AsQA4aMGQJVxyjYKAfwS6VdtBKVzyViwZfFg1YdTqLCzWL4VrD
         GtiM1ds4b95qx4PjOScnAAM69Ke+JZ0BCw2KYzj8U0QxDzLs3Dj37iCHKnAZ5uNl1bgV
         Z0SbdQAEfuoy8ZIV/9EhQuY9Qtv9/MqJZCi4/6Y73rzNT28kqP7OMc9BNFu3VkhrcGo6
         24qtjo4Jrl2Bp/nKYxWY3nOTSsr/6lF19U5f7aAMI/8EuN1LPuTh2SrhEHLS7ay3CDbv
         v4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709796799; x=1710401599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+NdDsuxIrkXv5XnsTlmmzQGzW5mgIhW3Bs7pzDi3m8=;
        b=PHuB/bkrUesiFki9OqB3yaJUUt3LOFVneASppbMP9yRinivH2SkVWx31qt/Hvw/RUx
         I0pzP3gGC+GIDknse6BgSofClsKOYaWmUfst8g9uuseZ/LZ/U6KG5/puS1QkJwSi51ZY
         OQ+7j8kWEKU4Y3FM3RfKB3p5RaLd5j4IejXol6AQ46PdCUq6NvLD+5YzzN0HdsyhUoCx
         8ELmqh8wnQ+me1t2sEqoVrbcg6jEDXpqM086g75mSc8pRZhXr+NnCMiXyDTor4U76xZG
         q/CzGJfnexgZLZpwNlAE3kIyBpaselKBiHw4Vbcx4O81Jt9U2juFV6xCNlDlJzSjpwPx
         8sQw==
X-Forwarded-Encrypted: i=1; AJvYcCVyr4Kw1NeX2tV09cF1OTOw2Odbkjq4cQwVvVW71H9rJHN2LcE4jQaanX7O9bfTelZJxDqVoMRLil73ISAykqyhdlc50eNs2MHVCHqoHA==
X-Gm-Message-State: AOJu0YxVGzbDANg0ObGEfTtO+TKNWVj5/XBwtAT8yXQiw10wk1dw3zy5
	GC3gJyAn4uNgyj2eLJQUuMqAX3Y0dI1H3+iRcnzaF9Jrwms4qHRA4KA39LqAvhxmVG+oz3HZBWK
	tKTXNl9G7XXgReCcmr6LG0LOzYBQaDZB+K9a3oQ==
X-Google-Smtp-Source: AGHT+IErqhjT7m+g7AMO2yjp+bi5cLjRTdmlc2HXNLwm44fPoWslO51y1z0/0q+kUXwgX1Mk0XXHS+XW920Jap5xRdw=
X-Received: by 2002:a05:6102:1994:b0:472:ee5f:9124 with SMTP id
 jm20-20020a056102199400b00472ee5f9124mr3979019vsb.19.1709796799107; Wed, 06
 Mar 2024 23:33:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306200910.2732835-1-volodymyr_babchuk@epam.com> <CAA8EJppNopEF0DmgjCAJyxe8HRebD26Q8heKKLKbPstdfBOv6A@mail.gmail.com>
In-Reply-To: <CAA8EJppNopEF0DmgjCAJyxe8HRebD26Q8heKKLKbPstdfBOv6A@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 7 Mar 2024 13:03:08 +0530
Message-ID: <CAFA6WYMvtNbAMb5bAuH=as01wxACbjs5XcyPrvcSH4YpGGHhpA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: add reset name for ethernet node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 12:40, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 7 Mar 2024 at 00:22, Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com> wrote:
> >
> > Add reset-names property to the ethernet@20000 node. This patch does
> > not change behavior on Linux, but it is needed for U-Boot, as it tries
> > to find the reset by name, not by index.
> >
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 761a6757dc26f..c2e65d6a2ac62 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -951,6 +951,7 @@ ethernet: ethernet@20000 {
> >
> >                         power-domains = <&gcc EMAC_GDSC>;
> >                         resets = <&gcc GCC_EMAC_BCR>;
> > +                       resets-names = "emac";
>
> According to the snps,dwmac.yaml schema the "emac" is invalid here.
> Only "stmmaceth" and / or "ahb" are permitted here.

Okay, it looks like earlier the Linux kernel on Qcom SoCs always
assumed that the EMAC reset signal is deserted by prior boot stages.
So I suppose we can reuse "stmmaceth" here instead of "emac" with a
corresponding change to U-Boot driver as well.

-Sumit

>
> >
> >                         iommus = <&apps_smmu 0x3c0 0x0>;
> >
> > --
> > 2.43.0
> >
>
>
> --
> With best wishes
> Dmitry

