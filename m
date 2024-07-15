Return-Path: <linux-arm-msm+bounces-26145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503F931271
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA04BB229E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC810188CBB;
	Mon, 15 Jul 2024 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCV/9iMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83F188CBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039947; cv=none; b=WGNVVeLg+0AS95VyhPwDiG45exCoiiM8RsBRsjqcfokcqbpHQZiMF/4XAn7dIp0OsgXcJv+oKATKcckRQ1sSYe2/bt69MeRqXyuj49j75nmVAujek7ey7MAx/lm2dHXL1LnvS+5PpHCHRe+7bIEZaiwoiz12ETwiGUeMxcN9NZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039947; c=relaxed/simple;
	bh=JyeGYP/ZqmeeeWwzcT3g655wsRPG9J7YFW5ADKHPBXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bha5aSoRwOJfmIS+HvTGlRGFlB2NJkCDUPoqkQsgvJFO53uXk5dff3oJKkh8GcdncqiVt+zfTt9ZrGOCoIrfvLZvcoAn22LTivQXeJYLWANcGm7XL2iGwZDcRayeRCMCDSNYZyUAntgX6PWvrAldSpJ/gE6/hJbZymuzOgqdh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCV/9iMS; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-65fcf21002dso14904257b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721039945; x=1721644745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INSejsyLjcpJev/T6jffsbe2dFNdxfyo5iJxSvSQsa8=;
        b=PCV/9iMS5T7MYDiCb0gW7J+jvq57dWn67M+QP6D6qW+pDsn6y4qO2LLDQUZvZIXCq3
         +r0N7Ix9IGo/oCvQmXZhDY19fI7qoTzj/kwEivhZHysKZQO+KhF+SBXQuyJOlwX9ktmi
         8S5cN4oPxUDcUNZyt1u89iE694XlaTwjDZRxIG3atSFByk/ETHyCMA4Tb04oDau9m4XA
         uFtBGoOPxb2a8igYPchVRW59bfXzexO+DVNbu0zSYJms9SAJdmAMyCWyipeSDYgLXH8w
         JAJEyqxQf2T1EB0ByozBA1qdwz+CG7/LS0R1JXCmqmYehgovCx3H3IAT8a2APDcfmHbh
         +Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039945; x=1721644745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INSejsyLjcpJev/T6jffsbe2dFNdxfyo5iJxSvSQsa8=;
        b=bHYo1//ic1XycnYH9Y56cBsmXBqyvKDJHzuTK9Qn9EbCILZzgYtncnlL3g/aGt8LA3
         TudfsakXwpreRcD8Gr1elQzNxB191VzdSSEXv5RMQGirznNWJtbUIbJtcxY4KS3XrTFH
         WG9kFTaxEGiyhvA2QEiMRuLy7liERX4a0a8t9dJxyFrC2hQXlYvu98hPu6XSvLra5o8K
         F9q/PnBJg/UV4RX0sHsih0NGdVZNwdvzd1PE45sBJXKH+ewUQJ/O3P+ihuiGexI+TL3n
         40bSSAKsLOAb0rVpUd8fwfWYyJ+888rRwIkTfQoc6xLkCAlgnGn9s8l5lm0eVcHIJ/WW
         vfaw==
X-Forwarded-Encrypted: i=1; AJvYcCWrvyiMd2ACAr2K1L6oAz8GmdkdAmIoEvXhaAMTpdtKwUvD0J0mSEO+VwBvzdgflyFGs7ML7kmQ/pcfylawLsyIhngzRU4Ks+1B4i9m2A==
X-Gm-Message-State: AOJu0YwACoGNk5v4ZDmVX2UD6szZNAYvesgw35yYLiwW3TMH5K8wqGto
	PVznKkkAZMfwi8jCv33JEETsoWLvsN+jWCpLIg3UoyYqkOrLwrhUIreY/UhVSDNmz9xjzdEjC3o
	G00JTFYfdr/ZM7n12KIVg9ZUg3VqiOqXY/erQyg==
X-Google-Smtp-Source: AGHT+IGOwT+AJq8LsaDGCWG5Q4MU9/IwYMNPN0Zgh+Q4OFSYBHhvH+Ltseygw8r5Q9tSpvN0xXJHRjC6YpdwCplZ/aM=
X-Received: by 2002:a05:690c:7442:b0:64b:9f5f:67b2 with SMTP id
 00721157ae682-658ef24c009mr224085457b3.31.1721039944774; Mon, 15 Jul 2024
 03:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com> <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <e235f19f-26b5-2cf7-ebb7-36e4dabe9b9b@quicinc.com>
In-Reply-To: <e235f19f-26b5-2cf7-ebb7-36e4dabe9b9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 13:38:53 +0300
Message-ID: <CAA8EJpob5Qov78JfNN5BE+c1WyvnuBcQLYENHL0c1GTS+PPfSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for SM8150
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 13:23, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 7/11/2024 3:40 AM, Dmitry Baryshkov wrote:
> > On Tue, 9 Jul 2024 at 13:53, Satya Priya Kakitapalli (Temp)
> > <quic_skakitap@quicinc.com>  wrote:
> >> On 7/3/2024 3:50 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Jul 02, 2024 at 09:20:43PM GMT, Satya Priya Kakitapalli wrote:
> >>>> Add support for the camera clock controller for camera clients
> >>>> to be able to request for camcc clocks on SM8150 platform.
> >>>>
> >>>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> >>>> Signed-off-by: Satya Priya Kakitapalli<quic_skakitap@quicinc.com>
> >>>> ---
> >>>>    drivers/clk/qcom/Kconfig        |    9 +
> >>>>    drivers/clk/qcom/Makefile       |    1 +
> >>>>    drivers/clk/qcom/camcc-sm8150.c | 2159 +++++++++++++++++++++++++++++++++++++++
> >>>>    3 files changed, 2169 insertions(+)
> >>> The patch mostly LGTM, several quesitons:
> >>>
> >>> - There are no cam_cc_sleep_clk and no cam_cc_xo_clk_src. Why?
> >> These are not required for camcc sm8150 hence not modelled.
> >>
> >>
> >>> - Why is cam_cc_gdsc_clk not modelled in the clock framework?
> >> This clock is kept enabled from probe, hence not required to be modelled
> >> explicitly.
> > Yes, I'm asking why it's kept up enabled from probe rather than via
> > clock framework?
>
>
> >>> - I see that most if not all RCG clocks use rcg2_shared ops instead of
> >>>     using simple rcg2 ops, could you please clarify that?
> >> As per the HW design recommendation, RCG needs to be parked at a safe
> >> clock source(XO) in the disable path, shared_ops is used to achieve the
> >> same.
> > Does it apply to SM8150? For example, on SM8250 RCG2s are not parked.
>
>
> Yes, it applies to SM8150.

Should the same logic be applied to other chipsets supported upstream?
If this is the case, which chipsets?

> >>> - RETAIN_FF_ENABLE has been used for GDSCs for sc7280, sc8280xp, sm8550,
> >>>     sm8650 and x1e8 platforms. Should it really be set for sm8150? If so,
> >>>     should it also be added to other camcc drivers (if so, for which
> >>>     platforms)?
> >> I have rechecked this in downstream and seems it is not really needed
> >> for sm8150, I'll drop in next post.
> >>



-- 
With best wishes
Dmitry

