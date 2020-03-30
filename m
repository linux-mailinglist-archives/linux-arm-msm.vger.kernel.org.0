Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C95E4197772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 11:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgC3JIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 05:08:09 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35782 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbgC3JIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 05:08:09 -0400
Received: by mail-ed1-f68.google.com with SMTP id a20so19818810edj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBfZUA3Ue04SNaNjIZbI9Q9GTKiTiLsqF41qopeumkI=;
        b=dt32BAoHu9GoJYKoESUHVeABNyH6w2lRqp4VaFNbRqhLaC6j9w9egbO4jl4XaZEIx+
         8zcfAVXuYsi0EM0VrT4p2tfAnXNrRRK2FvCByoRDjyG9NmUScF0FPmjXZfE5IDFZen1+
         zvbHyUcNeuM+3LtmfPvMWFI+psRdwt4e7d/Hp+H+BwjWMX5iDTkckQzHD6HaQzineZn/
         dhBCM5nDXXR97TXcuuraV3uV5gcaJCbTWmw3h2ob/7z7BWFtZFyMBn5x5gmCnd272G50
         bUazJJrRwv/9rbSLa98jrRM1UyRqGtw/stwXwGWWsUSln9sff7FAJSnye1gsir9W9zfL
         NTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBfZUA3Ue04SNaNjIZbI9Q9GTKiTiLsqF41qopeumkI=;
        b=oznjZqrDdvoh6jRvhL1M8tG6oFfaY9KlXxCUa7AaxTXO8E4UDRT8/lxhcwMOlA2yC6
         1I5HvVnC+vqhrtPeo+RnJow15pVEmwDHABP3Zkunvd/OShUFvEh73DBf1Mf7EBUIn9sv
         0rigbLjQmJ4mxZU+EkF9i+zueDP4CC2DCxtWhj/2OwrSnD0aPfZLMhASOk/1v4V39gHR
         WFzVDmuwUZjEHzABlHfnVZGkPSNlLkTlXZ9OL6p8EWG8p+6eexYz014/IDxCE4kYcoVv
         3Meg4nnW+hl40rVq3c2leOKQQ+lRMLwVFH5+bzW4Wn/JtfjSp8nCW8EQ4PChQtgGbR4A
         oZnw==
X-Gm-Message-State: ANhLgQ2SCUkZyAJQxgEYBDlmh9s2tfLzqbuWGO5eGlPpvfDNZe0LQuJb
        InrDxPh7HDl+7SOGoHDRHX3ULWrXJwyfUldkbrqM4A==
X-Google-Smtp-Source: ADFU+vvI5+4zWFwNRaiSUVTSAykaV3rTKvG6GrKxC8T0xaJwOzpUM715vIIVfPuIzsUyjRQDmL1jVdM1D7tN6CGWUfU=
X-Received: by 2002:a17:906:3410:: with SMTP id c16mr10254113ejb.304.1585559287665;
 Mon, 30 Mar 2020 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 30 Mar 2020 11:11:33 +0200
Message-ID: <CAMZdPi_psRiy1FG338N1=9F+o4b=0ANLdc3UiCTB=UoMS=CH=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Reduce vdd_apc voltage
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Mar 2020 at 06:46, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Some msm8996 based devices are unstable when run with VDD_APC of 1.23V,
> which is listed as the maximum voltage in "Turbo" mode. Given that the
> CPU cluster is not run in "Turbo" mode, reduce this to 0.98V - the
> maximum voltage for nominal operation.
>
> Fixes: 7a2a2231ef22 ("arm64: dts: apq8096-db820c: Fix VDD core voltage")
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Don't see any problem with that change, tested with and without
cpufreq (db820c).

Tested-by: Loic Poulain <loic.poulain@linaro.org>
