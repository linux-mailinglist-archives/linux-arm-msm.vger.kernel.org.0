Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D233146B37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 15:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgAWOZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 09:25:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:58846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727307AbgAWOZ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 09:25:27 -0500
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8CFD21734;
        Thu, 23 Jan 2020 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579789526;
        bh=Mid7wwxrormhKshzFlUiug8dVX89zkFmDSctaANPz6s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mN+Yg1bkK8s9gy4zwqCBJ33ZQ/2FjNwIuadnHyXJd8EBzcYrU4T7iJE9oDgiWWSdn
         JJ6zaeEi+gI+JiO5S/IpiYjHHGQzkhAVyMwEkAmdf1coHTLHEIfOy+jQuOADUS48/7
         djKZvBdGyBCNh14jPLQfv6YqC2y1fFrCkzZxez8A=
Received: by mail-qv1-f54.google.com with SMTP id z3so1578806qvn.0;
        Thu, 23 Jan 2020 06:25:26 -0800 (PST)
X-Gm-Message-State: APjAAAXr/dGaz/gMLQz48da6CfzV+Rl2fuJFssU7e9ts96UVt0sfbEzl
        0Ya0dbBB3NKwSAiS7Kihmd3U1Zqdoa+wfdtjow==
X-Google-Smtp-Source: APXvYqzyQ+SPWtLpn5s7OjjaW4VKnEaZWKD3iKQxa66ZmFcjyh5Fzw122sdqbgqFER2YlH8IqdmgJFsQ4Ryo7VOstC4=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr15908067qvo.20.1579789525873;
 Thu, 23 Jan 2020 06:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20200122134639.11735-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200122134639.11735-1-dafna.hirschfeld@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 23 Jan 2020 08:25:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbXr77VmNPWSN7jMt-309_YYuRp=nYV2cp=3SPihcC+w@mail.gmail.com>
Message-ID: <CAL_JsqLbXr77VmNPWSN7jMt-309_YYuRp=nYV2cp=3SPihcC+w@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: fix compilation error of the example in qcom,gcc.yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 7:46 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Running `make dt_binging_check`, gives the error:
>
> DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
> Error: Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29 syntax error
> FATAL ERROR: Unable to parse input tree
>
> This is because the last example uses the macro RPM_SMD_XO_CLK_SRC which
> is defined in qcom,rpmcc.h but the include of this header is missing.
> Add the include to fix the error.
>

Fixes: d109ea0970cf ("dt-bindings: clock: Document external clocks for
MSM8998 gcc")
Acked-by: Rob Herring <robh@kernel.org>

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 19d00794fe7d..50ff07f80acb 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -220,6 +220,7 @@ examples:
>
>    # Example of MSM8998 GCC:
>    - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>      clock-controller@100000 {
>        compatible = "qcom,gcc-msm8998";
>        #clock-cells = <1>;
> --
> 2.17.1
>
