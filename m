Return-Path: <linux-arm-msm+bounces-36307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 989EC9B4A9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA36E1C224B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB48205E17;
	Tue, 29 Oct 2024 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypGWqM0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8CDF78
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730207282; cv=none; b=pFC+0T3xtv6lDeHnaDGT500sJirau2Jha1ZrQhx/LfcP9f3snNT+YguH+9POSHu60AVhU9sov0IirO3yEcGQZEhDPJn220zHpeFeK8dvlDTr3V8PsvCr5uF3kWIl1YkzQeMXLvUZ13E+HpgmEY2yPvUdtat98AI7+IaqOK/XQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730207282; c=relaxed/simple;
	bh=85Ye0r9TZOBVlQMo4R1ybVd4JlhVObsGwckkiekjpnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVVDzf3SXBLkD3KYrnr25YzjJ4D9GSJbHii70zZ4Az8UFa5opX/kXXAWEP9+G9YdquuhsW+5PSnvr18Au6MN2sfsnbAIugfGyI+tzZjTER/TvcjSVp+wbgjtiqMgKm5lbqBWnKK4kw6nNzALZk+9uOsyD6TjHA3+xTdnLF/ihOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypGWqM0X; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2e444e355fso4816116276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730207278; x=1730812078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KXHekSwgT6SRlnWvXoVmeTYgjWGAZcjIx97S+vgepj0=;
        b=ypGWqM0X/r6N9XIEbO8nAzX9LxzWTJZ5r3QZ8F72pI/0qhlx2sh26kzvz4NFNpOcts
         gQVwkNROD4du3bvfYAFb7v/xLHd0OKRKKMziqjv+G/E+zmT5yJBY46SqhZiED5MTtszT
         aGMW6CSNnk8dWBbrCdPu5L9Cn4y4jiGd0a1iAsdghVtLWSLWfq5oSiI1H97V9cBxS6qv
         e4dD3KJMd6ZuOjA1Zvj8k5CCN1S1edOYpNjfcXEU9GE3n7ccnEAuODgSraa/z9Hp/zf0
         u+MttfZRf5AOVxQrO3++8MFwpNsBz0N3nRUdrM5k8CIQ/QHe0TodqJOb+RpF7aFX0p8g
         Ce/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730207278; x=1730812078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXHekSwgT6SRlnWvXoVmeTYgjWGAZcjIx97S+vgepj0=;
        b=FFK4wEUFsl67/fAhjS8FeLKd+oUpwtt0HWUgF5Ny7rSaMRdW2FdFtCkjJe+RHXjPaB
         MIk5Q+9dIGkctD4AX947Q41LaCtFWZjyRWm986nrmN51DyFcIUuY7FXgvdOLhgwe3EOU
         OW5NWn8i2AnzOCFtJx9qhvqWo/o3Svj/l8CP+35iWripwsNZD6rCfXq6dhnVMkkCyv06
         vBG2lznb3Lj8s/vtoaZ/lASy2ClQ6FbkyUQoVZFIa024EQyQcf5Vtz/eT4IXhinyd2rQ
         nA9ddWEMH0irfNFlcSBtquP8lTSwP20QeW1tgHhskLSgUjL157dT1JidPjBC4BJFMD9A
         mM/w==
X-Forwarded-Encrypted: i=1; AJvYcCX6OIuP/AlYeBKm/xcsUux6NdH0rzUFWFAyKIpHIpmQHMh17j/xq/v/tKwRNkicZs5H1+OIbNdQGAHLjA6a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5NvhdKrcNBNg7XTFOxUEtulN/fhpi0ybHF5HoEAxikV76Dzd/
	xxcQToNCUpsQv0mz09K+0cfF5/TeeJEWrU6vuWUWsPPUXsGFCZQbvC+fESvUkIjfN8bymiLCIdj
	1jaEeBVdE/yWIXKLj49bfaxw9x5OL7/7dE8eOpw==
X-Google-Smtp-Source: AGHT+IHj9OTlxdJR8GjjT0lj9iYWjEfWV85e5BvOY8AhmVekrLVQxaevX3rMPvyJoLnemY99zIOi0kIpjYdxeNaL9eA=
X-Received: by 2002:a05:690c:488a:b0:6e3:c92c:1d57 with SMTP id
 00721157ae682-6ea2b66687dmr12809857b3.2.1730207278483; Tue, 29 Oct 2024
 06:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
 <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com> <ZyBF3ygQnIdr/k/N@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZyBF3ygQnIdr/k/N@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 15:07:47 +0200
Message-ID: <CAA8EJpp27RJa=6s2W6ks0aeaDONkYXq6xetSbepF7zR4zrFnWQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Tingguo Cheng <quic_tingguoc@quicinc.com>, quic_fenglinw@quicinc.com, 
	quic_tingweiz@quicinc.com, kernel@quicinc.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 04:18, Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> On Mon, Oct 28, 2024 at 04:40:36PM +0800, Tingguo Cheng wrote:
> >
> >
> > On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
> > > On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
> > > > Enable PMIC and PMIC peripherals for qcs615-ride board.
> > > >
> > > > Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
> > > >   1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
> > > > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > > @@ -6,6 +6,7 @@
> > > >   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > >   #include "qcs615.dtsi"
> > > > +#include "pm8150.dtsi"
> > > >   / {
> > > >           model = "Qualcomm Technologies, Inc. QCS615 Ride";
> > > >           compatible = "qcom,qcs615-ride", "qcom,qcs615";
> > > > @@ -210,6 +211,20 @@ &rpmhcc {
> > > >           clocks = <&xo_board_clk>;
> > > >   };
> > > > +&pon {
> > > > + /delete-property/ mode-bootloader;
> > > > + /delete-property/ mode-recovery;
> > >
> > > Why?
> > Because boot modes will be supported on PSCI module from another patch,
> > reboot-modes are required to remove from PMIC side.
>
> That implies that the reboot mode implementation is device-specific, if
> so we should probably not define them in the shared file.

Most likely. Let's collect some more data points first. It's probably
not worth doing that just for qcs615-ride, I'd like to check how it is
really handled on the SAR platform.

-- 
With best wishes
Dmitry

