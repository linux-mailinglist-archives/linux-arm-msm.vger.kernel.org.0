Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734A746BE96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 16:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhLGPEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 10:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhLGPEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 10:04:00 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057C2C061A32
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 07:00:29 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id bj13so28208913oib.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 07:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9PcNSizbGMw2YegMGX+KEq63ckIOo2EkWnB9epQMR/4=;
        b=wo6OZc/tsL2Q6FqkG87AA9zGjAp316r9JhkLvLznsTArdKJGqGDhNrupJtuedQSzS/
         O1pLr/FrkioqNDAjhDDWYJZdEnMC6CpYCQbgZapYsB1wcc+RAS1hNNZYqXcCvl4WY+Xb
         hz4be3fuQav5oYU7ZizNDqAoHA5l26bKaDnPRkL3WxWnsdcxZbHmOiXh05fauLXdmUK6
         AJpiMXHj+XpFtAqkJw1Y6G+CF9Z969P0KKYquVSTQhjQF4w41EKkHqjMyW2ZKRbXAOab
         l5AnCoAnp1XdW8r5/t4TuNm0YIB8S9erFwqSdFTRsc6hMsexFCHAKhOVTwB9tPvFyLus
         ZeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9PcNSizbGMw2YegMGX+KEq63ckIOo2EkWnB9epQMR/4=;
        b=tYX15oIzVgL9KnVHfpESQA6H4iSo9/pjOU+QdA/O7A7lGNzDHQKvj+48v/gtgxPkwb
         IlxFiGoOyZawPp5ZX0kCt6kvzrLJwzUKs4rtbXEyCjdtbpIUiNwFEU5drHlVKoF83QoX
         ZwD4FfXi0L5+0UFFHPlhCzmt0vTVQMQDL37YNGXxYMp5jSFhCZr4QUEjLlwP96mkOmlj
         Q8cJA9bTWTieT7lDNqCIqKCKzlqWK6s7JQhHzCv6LKveL923+VojtpKdojgVKwMJZCJI
         LoetYh/XVMHprCN/6ubq2+EkIgqRmMZWzZ1sDnz6BQDKSuEuPp27Aflq3rGz6kEi1iiU
         tDZA==
X-Gm-Message-State: AOAM531R5S+6v3p3EAS1XOaeVIC5apf0hu1qUsPVjqsMmU9/40aBq6ly
        Jx8Gld+1aR3btNreRkoq4oK6cw==
X-Google-Smtp-Source: ABdhPJzTSTMkm/8aGli1JXMrmKw7lTvzRkVWM1kPOOBkMy15qpPX8ydvwW1Hst/qM9q5kVvDeaAyvA==
X-Received: by 2002:a05:6808:120b:: with SMTP id a11mr5717777oil.128.1638889228489;
        Tue, 07 Dec 2021 07:00:28 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n189sm3271744oif.33.2021.12.07.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:00:27 -0800 (PST)
Date:   Tue, 7 Dec 2021 07:01:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/15] arm64: dts: qcom: sm8450-qrd: enable ufs nodes
Message-ID: <Ya93Ybq3et5WuGsx@ripper>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-10-vkoul@kernel.org>
 <bef7e4bf-6d4d-c665-b96a-84b28ed19a33@somainline.org>
 <Ya2mdlhWCmgiAvvK@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya2mdlhWCmgiAvvK@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 05 Dec 21:58 PST 2021, Vinod Koul wrote:

> On 01-12-21, 16:18, Konrad Dybcio wrote:
> > 
> > On 01.12.2021 08:29, Vinod Koul wrote:
> > > Enable the UFS and phy node and add the regulators used by them.
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 21 +++++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> > > index 218eb3ce1ee5..3e65d662ab8c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> > > @@ -5,6 +5,7 @@
> > >  
> > >  /dts-v1/;
> > >  
> > > +#include <dt-bindings/gpio/gpio.h>
> > 
> > This should probably go to the SoC DTSI, as it's generally used
> > 
> > in every DT if you have anything more than serial console working..
> 
> But arent the gpios added in board dts typically? I am okay either
> way... Bjorn where would you like this to be..?
> Seems like we have this is both board as well as SoC DTS

I like Konrad's suggestion of putting it in the dtsi, simply because it
saves us from including it in every board file - where it will be needed.

Regards,
Bjorn

> > 
> > 
> > Konrad
> 
> -- 
> ~Vinod
