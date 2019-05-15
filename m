Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10071FC61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 23:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbfEOVnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 17:43:32 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42358 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbfEOVn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 17:43:29 -0400
Received: by mail-ua1-f67.google.com with SMTP id e9so468536uar.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kjfknf32vTN6dOCTbKM2s4UhXiubagFxAlST3GyPe/4=;
        b=GR//cp3pkBQCdrHCiA7U78cbGHrhAthjeR/dCjmIIoD5qYQZuteM3NaBSy+HNbvY48
         IvgNM0VAE85ycebNJSfBDPE3hfaZSJCDQ23VFwYM5vosvYKqaPXIMso4VLQPi1wCqPof
         nH2b4nPE7GE05LNfkK8yd9VHThgjZlNPDOpZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kjfknf32vTN6dOCTbKM2s4UhXiubagFxAlST3GyPe/4=;
        b=f9pVJXwQLrGZ6ICR6ndyLcMm3gEWaabW0iwmxkZlmhVT87sgc0wUzUoEqfeu+KgX9C
         +yOgIMYt3blD8NDXfYMwMyFwzGN61v2mB3hkHv2ZEKa48qSOfWigd3dad0Oii5DihloC
         4A65nUylW7FW3Lfoo3XfjK32tgusnSL9aLzaGAmD4G0WUuVy/5LxrggRJL9ag/qufF2h
         hxqMUcxAU+US/SgYiUERDorI5yfia3fyYr79zR8l3drGci13pU0wUgOTrQcUH+Bo51qp
         YzHnWRIsWiQ7+c+VxOu6gVl/LW2rX77CkHkVrBRdZ+KFbU1KJS4rppi9UO9Ccmt5Tr/k
         rMaw==
X-Gm-Message-State: APjAAAVg/zB32emnhp3i21ODKKYttJwQ22e+a0MhTAdVVjsETqKoF76n
        TXoZC8VSYKtuuYP4BLKEqhyTQNOxJLw=
X-Google-Smtp-Source: APXvYqwcHHrsnp24cHrNZ+7aA938jMqTC/u3l9RtQFaF6nJWgmASfqV4UxwUpKLuxneRLcVBf7q61A==
X-Received: by 2002:a9f:22e8:: with SMTP id 95mr13561170uan.6.1557956607543;
        Wed, 15 May 2019 14:43:27 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id c204sm1443212vkd.14.2019.05.15.14.43.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 14:43:26 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id d128so925859vsc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 14:43:26 -0700 (PDT)
X-Received: by 2002:a67:79ca:: with SMTP id u193mr20557958vsc.20.1557956606068;
 Wed, 15 May 2019 14:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-4-robdclark@gmail.com>
In-Reply-To: <20190509184415.11592-4-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 May 2019 14:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xa0kAReU7CFvO8QiCRkNxGaQY_JohK+psykqeN9e+QJw@mail.gmail.com>
Message-ID: <CAD=FV=Xa0kAReU7CFvO8QiCRkNxGaQY_JohK+psykqeN9e+QJw@mail.gmail.com>
Subject: Re: [RFC 3/3] arm64: dts: qcom: sdm845-cheza: delete zap-shader
To:     Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 9, 2019 at 12:08 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> This is unused on cheza.  Delete the node to get rid of the reserved-
> memory section, and to avoid the driver from attempting to load a zap
> shader that doesn't exist every time it powers up the GPU.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-

nit: up to Bjorn / Andy, but personally I'd put cheza and non-cheza
changes in two patches.


>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 8ccbe246dff4..28c28517b21a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -175,6 +175,8 @@
>  /delete-node/ &venus_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &cdsp_pas;
> +/delete-node/ &zap_shader;

nit: I'd probably move the delete of the zap shader to a slightly
different place just because the rest of the lines here are deleting
reserved memory regions.

Other than nits this seems OK to me.  Not that I know anything about
the zap shader or why a zap shader wouldn't be appropriate for cheza.

-Doug
