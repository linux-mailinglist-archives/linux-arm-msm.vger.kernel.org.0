Return-Path: <linux-arm-msm+bounces-7519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0585830E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A681C21604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758EB25545;
	Wed, 17 Jan 2024 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MO3CwRkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA225540
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705524493; cv=none; b=LIceOrti/B8ZgWSX1xZ+59gcjDfmgP2E5c4TFn7dTj5dgUFun0VoBmafNVkwvWEA69KKPziXsOhbTqWEppHrVzmyedN+pKWiEKddtwdxd1FqdD83MVfEDCBmOgEamRTqW6beU6LtJ3mFp93/H3FSs+ubuePt49Vd6IpQrTT4gYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705524493; c=relaxed/simple;
	bh=nBSMqib0vx/t6LIPdWb68W3eBAp9SDyqSB85Ypn6WZo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=JGi5uRV9LLtyeO0hpNYVlgmqf1S24jOagNGF8t5EUfJCyp0RHtS/4QwEvF3E4rw1S2MBAON/dI6gN7+/Dw958Ox/w4hcR6D28liFpav12UPBFa7m/coEekdHZi0cDGhddyIQZMzhP5K7E03hcMe2hvFpW9h4wPJ9+bxA9xYr1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MO3CwRkw; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ff6d3504d5so9041377b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705524491; x=1706129291; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8C61/CVBZybL4d7jDWa4SEthmuklcb9ycEMool3g1U8=;
        b=MO3CwRkwB87dV/GiJbY/21JYmD53/MioyY8fPruE2sVvgTPUfBUGD76RujJNB7oULU
         A5CdixGRaO8t6xKoLXVJ+kQzF/tyfVbloCkJ5ijV5eXVaT5z3ZVaCssp8rlFGf5X3KTz
         w1iSai/oWTkh5jJhEXoq1H83TgU9T7TUvCJaiFnwuWkyu8KnlJYxFwvZMcyyXtlr5tGZ
         kdl5zwKvkl+iFz6skkvSj70CEFKrW5vPIqqbaLZ1dKXK0TDykFyVEAp5NvdcHKGmai4C
         PYI5ZqVmP1jE6neROwiOZ3NDeGQbHyGnpDbt+FCNuMO2TuZmM/vOs10BBZxSBRPaHmW2
         j+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705524491; x=1706129291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8C61/CVBZybL4d7jDWa4SEthmuklcb9ycEMool3g1U8=;
        b=kQKrCKvDhz1KwvvRLFpoFi0yJMEOkbrnYeQa/uiuYvjBG4fI3sbRfCMI472TJk3uP2
         genp7W9vHrzkaS7IBmlxyCgLQRr5KAkSLRvyGKsZZWkfugTwf5nJxIK7BdMI2ia05UkB
         +55LM911PIg2/iMmGPL4aPU1/8T+30egLwCjee0gqawoVkhvzg9DvoGHtjm97hgL+ZCG
         /i87LgSiIOBBHbGxZBVVxZ6hp0V2JQC3VEMEF3+JphmDCvg95gEYZmjoWeqSSNIyuKQA
         9qLxNUh1ZwYyQmiJ2k7+Dgu9Q01Wa84Y+HD27IezoqKGhn2HuZgQnSLrgVmGNxQVWaD0
         6VrA==
X-Gm-Message-State: AOJu0YxqsB4C95XDIjYmZbeCahgzpDVQq7dOPWXN0dkvde2Q9ydh6wYV
	cQccEEarTcS/NQE/nes34cIKC/CJhoKa4gZ4gmA3KQYKvCNVOQ==
X-Google-Smtp-Source: AGHT+IFH9aLIollE5z7rcJcIrH0LLrrTJJh1FWfQ583YbLbX3/A24BFq7vRO+v64P0FgvpJ1Pg5F4vCYZ+aUakfyk7U=
X-Received: by 2002:a81:8d45:0:b0:5f9:f9b4:2f20 with SMTP id
 w5-20020a818d45000000b005f9f9b42f20mr6262366ywj.96.1705524490901; Wed, 17 Jan
 2024 12:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117173458.2312669-1-quic_sibis@quicinc.com> <20240117173458.2312669-8-quic_sibis@quicinc.com>
In-Reply-To: <20240117173458.2312669-8-quic_sibis@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 22:47:59 +0200
Message-ID: <CAA8EJpo5F==whKMVFgPAM+=DpB+=KzPhKt-poGXuHxy-KSxe8Q@mail.gmail.com>
Subject: Re: [RFC 7/7] arm64: dts: qcom: x1e80100: Enable LLCC/DDR dvfs
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 19:37, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Enable LLCC/DDR dvfs through the Qualcomm's SCMI vendor protocol.

Could you please post DT bindings?

>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 48 ++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 6856a206f7fc..3dc6f32fbb4c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -329,6 +329,54 @@ scmi_dvfs: protocol@13 {
>                                 reg = <0x13>;
>                                 #clock-cells = <1>;
>                         };
> +
> +                       scmi_vendor: protocol@80 {
> +                               reg = <0x80>;
> +
> +                               memlat {

This doesn't look like a generic node name.

> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;

> +
> +                                       memory@0 {
> +                                               reg = <0x0>; /* Memory Type DDR */
> +                                               freq-table-khz = <200000 4224000>;
> +
> +                                               monitor-0 {
> +                                                       qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;



> +                                                       qcom,cpufreq-memfreq-tbl = < 999000 547000 >,
> +                                                                                  < 1440000 768000 >,
> +                                                                                  < 1671000 1555000 >,
> +                                                                                  < 2189000 2092000 >,
> +                                                                                  < 2156000 3187000 >,
> +                                                                                  < 3860000 4224000 >;

These tables should be rewritten as OPP tables.


> +                                               };
> +
> +                                               monitor-1 {
> +                                                       qcom,compute-mon;
> +                                                       qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
> +                                                       qcom,cpufreq-memfreq-tbl = < 1440000 200000 >,
> +                                                                                  < 2189000 768000 >,
> +                                                                                  < 2156000 1555000 >,
> +                                                                                  < 3860000 2092000 >;
> +                                               };
> +                                       };
> +
> +                                       memory@1 {
> +                                               reg = <0x1>; /* Memory Type LLCC */
> +                                               freq-table-khz = <300000 1067000>;
> +
> +                                               monitor-0 {
> +                                                       qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
> +                                                       qcom,cpufreq-memfreq-tbl = < 999000 300000 >,
> +                                                                                  < 1440000 466000 >,
> +                                                                                  < 1671000 600000 >,
> +                                                                                  < 2189000 806000 >,
> +                                                                                  < 2156000 933000 >,
> +                                                                                  < 3860000 1066000 >;
> +                                               };
> +                                       };
> +                               };
> +                       };
>                 };
>         };
>
> --
> 2.34.1
>
>


--
With best wishes
Dmitry

