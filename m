Return-Path: <linux-arm-msm+bounces-24250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C312917CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 11:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C10D1C21984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469A616D331;
	Wed, 26 Jun 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DR8oqrTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78B16A92F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394895; cv=none; b=RppHuPPYdBeG+1iuf+29j3TBQ7thefI46NyALm00sQXr5TwdoBuSLzL03U9RpQHoZe82vcIfStA41147pr6ErPTCjQc1ksO7oWBewGn3XIy9mzHLq+c41GKYnTjlukjQSpofP81qovazgHqxDMCCpCBCdiHyJTWwDmR8Go3evxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394895; c=relaxed/simple;
	bh=rAi8qWvLGUjfPNObkbt1FS51k5c7kFTbL44EQ54v/so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFKGk45t04KpZ5tjfGESnvqBRbDEstzUq+11NMvEbVfGS7WvVB/u6R4d+pZG7Uue07F4yZntxAOmQYft9lOsD4RpCW8d/OK1/f0/8lmlVenzE9nYP8HRjaDgrRYNxov8g7uO5daLYxc08FyZddFBh4C0hid06cJettw4vxDxBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DR8oqrTR; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63bce128c70so2941627b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719394891; x=1719999691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3D1uEZ7yDMJQpAzPHDTpqijG7botuCb/3+xVwtXeK20=;
        b=DR8oqrTRlxbWYmaH98GFS1fFN8IxQVBmsIQZXCdClgSVu4fA12WkUY/UUZmm3I28Lw
         dpHW7KJE1sirdB2CbJ6QX+k0rEX6TfHsbukI8YaWtxALaDrTVBBvXS6BxeIAPeWwSrQ3
         qwnWhBCY8OSwGOhCRPlzzlc/iitlbi9ETVkG1SgLAWljlrq3TqR9mWxlVsnWDf1QQDhF
         2XMwJ7Qyn7FIzrNqjaFMmvo9U8xwsnxdBnVOffZqWu8FDGJcEmBsdx1rkUKTy/VhIm0z
         Qv2YWEfKIVHNWgL9iNfy94FOIacZDKl+FCN5vq/k+4Tiev2p1j7dM03EJ9bTTRW5IDRG
         r2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394891; x=1719999691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D1uEZ7yDMJQpAzPHDTpqijG7botuCb/3+xVwtXeK20=;
        b=uhwJsNZzPMRzw0tRR32Kcvd7WcWehaDGg0RZRwDc/rESO3eCZcD6amLkC9Y9qXVWWQ
         SdEDhIgOZDo3EDs2x7peBomVXDS2BwCO86eXa1+vUoaf6TkgmO/LjLQ6HJ1A35CmMpnw
         qR3tB0Tsf5stGrgwoz1FwgY1G6dbZQexN/I6xIfXITeSrmXJDsXl6AYw0ymNeWvHn3qU
         poAqomnBRfR6GjKeoHEew+rJkuv/Nn8aKdA9/+StkWU56e/aBy9c7KtCEWlunnqZ1Ivk
         6rg0XWSNMh5jj+cfm2laG8DUdAECAWc4ABX3+ne0ayXoxuEjKOngXKccUf0OzVlS7094
         aUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6TOKcQ4X1LbhymN3F+rMKsgjZ/rNX9dGszTC2JdF4jZ0xaxQ5aoAv+kNO2FyrzcnN3UhYRgnowgN84U8TZtnxesh/6qYsWVC2LalBiA==
X-Gm-Message-State: AOJu0YzqY68s4VfMvzWExOEV0RPoTMYYeauZcQ463EqXqrh62jrYc1VA
	y3XS3yuwcm7Gn+AyXkqzk1Upp/DP0R/jC1Ymb45UEIcMhLW1eglmuxvEJKLqK8VdsUrUzlnrDST
	v1IKL5m+/IR2GZAgjevJWNKrGw9u6zKjtgXhilA==
X-Google-Smtp-Source: AGHT+IGFtI1Yu/G+tNmb5mf0Qqj9/Bd2JZr2+OgHviJF5LW0auUzYGFFKOol+aUhRJ3nRI/my/M9CM/QFT1YwdlLRhE=
X-Received: by 2002:a05:690c:4905:b0:62c:ffb9:bb87 with SMTP id
 00721157ae682-6462df2b681mr50366767b3.4.1719394890962; Wed, 26 Jun 2024
 02:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625-pm8916-tz-v1-1-a4c1f61e92dd@linaro.org> <61070233-5f51-4cac-bf30-816a8bcf58dc@linaro.org>
In-Reply-To: <61070233-5f51-4cac-bf30-816a8bcf58dc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 12:41:03 +0300
Message-ID: <CAA8EJpq_1wj_1TATJBoEB6d6JCuFY0jz8EP3YQp5Us7pwU5B3A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: add temp-alarm thermal zone
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jun 2024 at 12:40, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 25.06.2024 10:16 PM, Dmitry Baryshkov wrote:
> > Define the themal zones using the temperature values in stage1 for this
> > platform so that the spmi-temp-alarm driver becomes active.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8916.dtsi | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > index 4b2e8fb47d2d..2def48f2d101 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
>
> hmm
>
> > @@ -4,8 +4,37 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/spmi/spmi.h>
> >
> > -&spmi_bus {
> > +/ {
> > +     thermal-zones {
> > +             pm8150-thermal {
>
> hmm

Will fix in v2..

>
> Konrad



-- 
With best wishes
Dmitry

