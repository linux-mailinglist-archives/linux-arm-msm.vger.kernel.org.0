Return-Path: <linux-arm-msm+bounces-9287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDB844F74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 04:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C15E1F2BB7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 03:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5583A1D7;
	Thu,  1 Feb 2024 03:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="peiXCw02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88DB39FFF
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706757365; cv=none; b=eMUcf5aW5FFmfIPSwsJHPrRDtmt+Sm5AyBZaS4lauTwxf4FPRXneRZ4pI6mH+DPW6CG9DnCSXfZqqr4y7BxLUGXtLR6cg3AdJWQ1ALGGsPnxMv7jkKWu0gZ5cSNsCaXz4jqtmO6WMErGKqAYXMQH5VHyg1Rg6B79UzsueKSdRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706757365; c=relaxed/simple;
	bh=USfJhqFmZ3yrsa898v4BZsVQ7dzPpLsAqmreXrQ3fZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCxEJxoGnxg1h7QSNe0svpS+A0RGBqFdVGx7E3/XEP2eWOScvPkr93fWwPL2nwV3W21S7S9HzMfQKREFu1wzTapjF6Pl02mU12asAT6qGEOrvZ59XClTqPKl+2nbrnJsPGMILeZBW9szFHc2ruYX+Ujplxa3mqCtFvZaxzPYj1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=peiXCw02; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6041c6333cdso2375777b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 19:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706757362; x=1707362162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ySMnKqaStIfd+gO/JecJswbCVZ1hpxvBLcFq3H3GbP0=;
        b=peiXCw02zpl40Qmhc+cMhVPtOMElABe9RFPXlQ4U+AOq6rJsfzN2BPvTcY0Wo91UoA
         ewsqdsgMJwg3Yal3HUCjkmUlSorT5g6uMwekMSpRKb+tf7NIwgOPEVJgHF/1pTKXw5kA
         xZBoTMF61Lfnz/dCQZYxp8YNwni/WCnd0ifiWz+S1kCxvJ1P8A12gJe9WmqcxaTEw9bT
         4U+ubw5iNCAouto1TWgLx3tA4mdEaS8qgu2//FvCLpoWOlZl/Y55r0ujXIA/8PIVVZzz
         lPQrAhuHwfMS9/Qjnfs+FKO2PbF9W9opbNB+lB2bC2p7cGKNmo9cvdHNdy3NBeFKsJYa
         P/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706757362; x=1707362162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySMnKqaStIfd+gO/JecJswbCVZ1hpxvBLcFq3H3GbP0=;
        b=ZvW3XuY9yv3ssZNAXPsXZXjsTq2C5BvwDYcxZoI0ZH0xIEw9PN3foZ/aepwjTYh6EX
         1ETv1kJYmQXwkhxXlxIRi6jDIyXECSlJlxy2RQOzmNnT1UOfktY+SSGE5CLU/4g4MICQ
         5NznlRWZsx/s3CtMmbUv2zsPxo34y3TxnoV3E45t9cXkI+03S0a7bDz9fChCe35qf+Lx
         kiCQs5gTGP2meDy5azh2V1lXphc6UHZlXgZwA/Ao0mXAO47T9GY9flwloK47iJRMxUet
         dAVW3owQ97KXKzYawD/8JQ/EKPjX6zH/YXtQN+9PtKcmwyJgURdJvbm8kt2UG10AbNGK
         xQpg==
X-Gm-Message-State: AOJu0YzQEKjuK8ceXTzh4ipIWO1B+IwD/2S4/pyDiMrDj1mOFk8Hjcr7
	ELblDS0omzMGV/It6z7Tgr0y0V2nnV5AZCypq9Wjuv6PFYourc6h8js9MNCFxSDDNZ4vx5JP85C
	bTQBLg1JiRfNfuC7joug3upeZmNT2q+nfaAHU3BsvtgLL9s3n
X-Google-Smtp-Source: AGHT+IEL1JBFAvnwKqmlgQqAa19wqbd0K9EGqGaaOWn6zsX2P8KDMBibxSIw3H0972y4b4IEDsIRrGQdTwH0DgNQMaA=
X-Received: by 2002:a05:690c:806:b0:604:ed9:9f49 with SMTP id
 bx6-20020a05690c080600b006040ed99f49mr1072363ywb.41.1706757362557; Wed, 31
 Jan 2024 19:16:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJppDQAdnceYhL_=Di0n5j3W0F2+7ntpNMxpXBXgnYoh_uQ@mail.gmail.com>
 <20240201030828.12515-1-amadeus@jmu.edu.cn>
In-Reply-To: <20240201030828.12515-1-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Feb 2024 05:15:51 +0200
Message-ID: <CAA8EJpoMXkAd3EBf=p+nig8VWzY9tiUAWhfGJn3XOX1uSa=22Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq6018: separate CPU OPP tables
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 05:08, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi, Dmitry
> > I went on and checked ipq6018.dtsi. It will need to be reworked before
> > we can continue with PMIC-less devices.
>
> > Obviously, the PMIC is not a part of the SoC. So please move the
> > "qcom,rpm-mp5496-regulators" node to the board files together with the
> > cpu-supply properties that reference that regulator.
>
> Thanks a lot for your advice, now things are clearer.
> My idea is as follows:
>
> 1. Add all frequencies supported by SoCs in ipq6018.dtsi
>
> 2. Move cpu-supply and mp5496 nodes to ipq6018-mp5496.dtsi

Straight to the board files, please, no need for additional includes.

>
> &CPU0 {
>         cpu-supply = <&ipq6018_s2>;
> };
> ...
>
> &rpm_requests {
>         regulators {
>                 rpm-mp5496...
>                 ipq6018_s2...
>         };
> };
>
> > The SoC itself supports all listed frequencies, so it is incorrect to
> > split the opp tables from the ipq6018.dtsi. Instead please patch the
> > PMIC-less boards in the following way:
>
> > #include "ipq6018.dtsi"
> > &cpu_opp_table {
> >  /* the board doesn't have a PMIC, disable CPU frequencies which
> > require higher voltages */
> >  /delete-node/ opp-1320000000;
> >  /delete-node/ opp-1440000000;
> >};
>
> Thank you but no need. The CPUFreq NVMEM driver will give the CPU
> maximum frequency based on the cpu_speed_bin and opp-supported-hw.

From your patches I had the feeling that you still want to limit the
high-frequency OPP entries if there is no PMIC.

>
> Thanks,
> Chukun
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

