Return-Path: <linux-arm-msm+bounces-36134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23B9B2BB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CFA11C21A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5A51CC16C;
	Mon, 28 Oct 2024 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QHglcP8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D3193404
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108518; cv=none; b=MPDLV5yprxwkbHVJb60diiZMCtHpdSOSGWMELfjinoEsQZYbny6Jbyawri4XOUM6pFNjN65LhUV8RXg6jKITIB3PBlG1tQq9wQMq/eB1UVte7elVb/czXcBR04TI5cqTOHjFJYJwTSIdlznouiRCywQ7ykwz8rcJZopdbh8PskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108518; c=relaxed/simple;
	bh=Xv9M5xfOc1wxGZrwaqn1SfRj4pgqlBBcSc1XElq37/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRiVCxfoJgIetn+7pT4qBlMPIS/sYSRMMCnrhoTb+UO3BZVvVnZvjykmMfn7cLs9PlMo7C/mre8DXCz/UJB5hywdun4xgDUYXEpKtXX8ng6X4APLtdwyw8HsWzIOR2oBGjWDU0TJqINUyt56GqUoiJH0L1ervZKQbGyLdBBbMFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QHglcP8V; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5e5c43497so33556177b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730108514; x=1730713314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oiX/iT3MGW/8gbZHj00AjboGGe8ICnr6A2PFnCy1ZuU=;
        b=QHglcP8Ves/5ssZORq/LhM2Iw/l47GOe4idmUx8D9K6RvdQcRUVcWoQmuZGHVZ1J5A
         Bop8yZLMV6cmyuaMlnamQ7tNL05i23saEIbK4mYw1AVX78/N3DR0foLW7QvGwltRFLDc
         w5HH52L+t0AFoeSXARNwP3wjxpzu23xL4hF+OP6+mQNPKbJM8rMVCTMFttWEjHe+5mni
         /F/ST3uCNJX+YSzIv45W4v+U+hcVDe7ObDJBVwvAd5tpZAQRpT9B/Auh6V9eKA5gSdjr
         8fU9b9g23rgbibJjZ6wLqGTta2d2nOViTX0FojO2+BSi2baqdtCtu0o0pYqOsPXumRGR
         x4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108514; x=1730713314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiX/iT3MGW/8gbZHj00AjboGGe8ICnr6A2PFnCy1ZuU=;
        b=UiGiM6MVHcK89ITUYjXJyHJ8Ex6kInanG6U+sm/41Tk7+LWowAHvYHDMb170GG7Ld3
         FOoITt7Xt94jOZB9Ixr9F0c+ZLaSwKfuuxdUCYZiTg0IdK+rp6KvVtHcHJagomnRfrDO
         o5G3ehMTJNDSUw+SIQg9wHBbKl218/orEhFpdk//Eje5XH3jxHdGil53LaMwRgp44v/y
         yfoAdRwPg2Qx9pSSr76E193ustMozR2o+HU8ozRH3VOqGCVUsjWU2nXck4mZ22sfNm69
         RUGWcZxb7EB7CLZEf5LWSFiTR2xSUkuL6O1gUbIvudQGIYl4SCYq21e2oDt/Ofui6Ij+
         NYdw==
X-Forwarded-Encrypted: i=1; AJvYcCUrUhEk23raf77qfIvHg01VGNXhEUPduNKUVGTPVJvG9bU0p5J2vgtfgOuWTjU/s21ZTz0VuwubAGRXMZC/@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9pkLQJvd0D6LF63aOdZeHkFVtKxQXGN6wgmU4Vc+Y6iXHAsD
	v6+cUjLphC06HIh29trLmZymu1CtJauky2GE56r7J0jKRtWT6nJ/+1Jl2dLTNGxhCHIXA7t9S7v
	rCox3JWrKSCixXJZs4uZcC28sHPToTIkgZ9oxhQ==
X-Google-Smtp-Source: AGHT+IHrOCxCyJ8ThUv82DKoxK74MLXsAExLltokn+0bupLwZqHCYVLbaaRKX5qboWle+dvaUBIdAPCllC73pA7SJH8=
X-Received: by 2002:a05:690c:6c04:b0:6e8:497:49d7 with SMTP id
 00721157ae682-6e9d88e765dmr69472497b3.2.1730108514314; Mon, 28 Oct 2024
 02:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry> <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
In-Reply-To: <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 11:41:43 +0200
Message-ID: <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, kernel@quicinc.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>
>
>
> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
> >> Enable PMIC and PMIC peripherals for qcs615-ride board.
> >>
> >> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> @@ -6,6 +6,7 @@
> >>
> >>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >>   #include "qcs615.dtsi"
> >> +#include "pm8150.dtsi"
> >>   / {
> >>      model = "Qualcomm Technologies, Inc. QCS615 Ride";
> >>      compatible = "qcom,qcs615-ride", "qcom,qcs615";
> >> @@ -210,6 +211,20 @@ &rpmhcc {
> >>      clocks = <&xo_board_clk>;
> >>   };
> >>
> >> +&pon {
> >> +    /delete-property/ mode-bootloader;
> >> +    /delete-property/ mode-recovery;
> >
> > Why?
> Because boot modes will be supported on PSCI module from another patch,
> reboot-modes are required to remove from PMIC side.

=> commit message, please.

> >
> >> +};
> >> +
> >> +&pon_pwrkey {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&pon_resin {
> >> +    linux,code = <KEY_VOLUMEDOWN>;
> >> +    status = "okay";
> >> +};
> >> +
> >>   &uart0 {
> >>      status = "okay";
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >
>
> --
> Thank you & BRs
> Tingguo
>


-- 
With best wishes
Dmitry

