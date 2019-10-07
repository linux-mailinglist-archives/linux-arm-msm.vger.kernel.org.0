Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F8CDB39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 07:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfJGFLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 01:11:19 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36743 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGFLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 01:11:19 -0400
Received: by mail-vk1-f196.google.com with SMTP id w3so2680152vkm.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2019 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SU4sKy41X/4bHrpOr414TQRJvk9qHQ62+1JMnN0YmV0=;
        b=w4/BYAvcSVPjBT3EWXJ+581B/84p5Sty1j+9O+QiWVFGtd/qu62NsuUNvtg8Y1X9Y4
         8IQ+Uth7K14SSHr4IE5QRNlTjiZcH1vajh+ceFLadT0W7rCxrraM3VXfWGxlrOktHMN1
         cSDFxOn3aTuum05N6q1w3uJs3OkLIpEPRSGHn7oXnupMHEATfpR67gt6bzrDtMzH4K6M
         OZtY0e4ObA2VshzeSqVWZxaGqXl6qaeoLDi99mYHTaay3Yb5p3Pc7EMLWt7aomLSP2Cs
         G8i+GK3jiHOgdSNnc9JUagN12+oFoXk7fRlKPOwCyQCspzXX2xTkkMFS00aXmjMnVnp4
         gJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SU4sKy41X/4bHrpOr414TQRJvk9qHQ62+1JMnN0YmV0=;
        b=Ym1+erdJbZBhH5nNiMfOwTfD2DV7TFeE9XbIle+1FMwDkiwgV2qxCaFBxqhsbCYNkm
         wnyeAj+ICW56DEZj/9a260VfckGMTe4UbeBwlx+Xfb7QgX03clHRp7idsz/QPTklhiXy
         G6LUivgqH92vgitFDZU49H1Fpvhg0Zo5XksH0Rk9bfQn3/HVSU6rj+pMihb0/l5ZnZ2h
         yj67iu+4SldgufZdRpHC7QOIjVsLCJH2M1yTPh+mOcVhVGhafBhY7vRGyM11wi1jbz+S
         cNOGI1DNHQFAFYgH23Z8WxRz6RF9ulNySEsN52Mdxu164RFrBXCP0sRTiM97fF3wYxjO
         Usxg==
X-Gm-Message-State: APjAAAWmdTfaIKF1VoAnIrU73el2Uz0gn+U7sv7ubGzQRjDmbeuXmhV1
        2Pjb9DWeboXsP5776plZ4i6gsstRqoCHHOPhBaLUlg==
X-Google-Smtp-Source: APXvYqwuxN0/8rE8rgySIwQiD3CV2LsjxEUbAEI0rP3l1Z4H5fodDUf7Rwp8TX0CwDJQCc9aByMz/IuHg90H55sT48o=
X-Received: by 2002:a1f:bd94:: with SMTP id n142mr13925117vkf.86.1570425078362;
 Sun, 06 Oct 2019 22:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191005104133.30297-1-kholk11@gmail.com> <20191005104133.30297-3-kholk11@gmail.com>
In-Reply-To: <20191005104133.30297-3-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 7 Oct 2019 10:41:06 +0530
Message-ID: <CAHLCerMYVJdoL4m=nOQobHKKvwonTTRpUY6EPv8umxi=2SN7pg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt: thermal: tsens: Document compatible for MSM8976/56
To:     kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 5, 2019 at 4:11 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Support for MSM8976 and MSM8956 (having tsens ip version 1) has
> been added to the qcom tsens driver: document the addition here.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
with the caveat that it needs my yaml conversion patch (part of tsens
irq series) to get merged first.

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 23afc7bf5a44..eef13b9446a8 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -29,6 +29,7 @@ properties:
>        - description: v1 of TSENS
>          items:
>            - enum:
> +              - qcom,msm8976-tsens
>                - qcom,qcs404-tsens
>            - const: qcom,tsens-v1
>
> @@ -82,6 +83,7 @@ allOf:
>              enum:
>                - qcom,msm8916-tsens
>                - qcom,msm8974-tsens
> +              - qcom,msm8976-tsens
>                - qcom,qcs404-tsens
>                - qcom,tsens-v0_1
>                - qcom,tsens-v1
> --
> 2.21.0
>
