Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF8B1CE59B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 22:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731682AbgEKUdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 16:33:00 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36060 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731629AbgEKUc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 16:32:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id x7so15395997oic.3;
        Mon, 11 May 2020 13:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a6YPwZmJFjG49lGJQwBd34jDW6NDhel0dDtnmyJD+2k=;
        b=SjGj/1f7907Keimh9DleNcm5Lip0uJ7hXTPzYv+Yz6uky5jx+gIt+9YuZfY5I6wqBh
         yb9zxCQ5mfGdgQLsZIZZSVMQm0ztJuJwbeNuuelGC0HyCuzMHDja9P07t/81KtxjHxQv
         Pds/vxLoDfzAZWbFUF52t76D/Ho0TVrrTtDldJM3BzyvHgITI9h1soDqv+yrVooF77j2
         v0QbTUn3DXMSjN9Tz4s4VoRqXfp0Wrvsoy0rQTcM8FDrx3I96gta/cBFsvl/JgoMnabq
         SFUQthfCjRMVO1L5fzjHuBeos9ELOSiA4wXrswDdPM2K4OOBfdkoj/7Wky/7K2xfvFfL
         mXkw==
X-Gm-Message-State: AGi0PuZde04ZKhqd+WsBdkOfTqihNEbxo846I7Zgzq1p+H8ZQyg3O7Vt
        PT2J3iaohmAwNnoXeoJOVA==
X-Google-Smtp-Source: APiQypIECrLwAVbFA2uqA0bgrAvQzHKykDpPlW0mQVGIxzWpcKvOunKb9trmsbK07B6dYFQInw4OQg==
X-Received: by 2002:a54:4795:: with SMTP id o21mr19645785oic.150.1589229178480;
        Mon, 11 May 2020 13:32:58 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm2921595otw.66.2020.05.11.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 13:32:57 -0700 (PDT)
Received: (nullmailer pid 29430 invoked by uid 1000);
        Mon, 11 May 2020 20:32:56 -0000
Date:   Mon, 11 May 2020 15:32:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de
Subject: Re: [PATCH v3 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
Message-ID: <20200511203256.GA19068@bogus>
References: <20200423103406.481289-1-bryan.odonoghue@linaro.org>
 <20200423103406.481289-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423103406.481289-2-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 23, 2020 at 11:34:05AM +0100, Bryan O'Donoghue wrote:
> Add compatible strings and the include files for the MSM8939 GCC.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   3 +
>  include/dt-bindings/clock/qcom,gcc-msm8939.h  | 179 ++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-msm8939.h  | 100 ++++++++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index e533bb0cfd2b..ee0467fb5e31 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -22,6 +22,8 @@ description: |
>    - dt-bindings/reset/qcom,gcc-ipq6018.h
>    - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
>    - dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
> +  - dt-bindings/clock/qcom,gcc-msm8939.h
> +  - dt-bindings/reset/qcom,gcc-msm8939.h
>    - dt-bindings/clock/qcom,gcc-msm8660.h
>    - dt-bindings/reset/qcom,gcc-msm8660.h
>    - dt-bindings/clock/qcom,gcc-msm8974.h
> @@ -41,6 +43,7 @@ properties:
>        - qcom,gcc-ipq8064
>        - qcom,gcc-msm8660
>        - qcom,gcc-msm8916
> +      - qcom,gcc-msm8939
>        - qcom,gcc-msm8960
>        - qcom,gcc-msm8974
>        - qcom,gcc-msm8974pro
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8939.h b/include/dt-bindings/clock/qcom,gcc-msm8939.h
> new file mode 100644
> index 000000000000..e792ef049fc8
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8939.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Okay with GPLv4?

Should be dual licensed ideally. Doesn't matter much to me, but QCom 
might care.

Acked-by: Rob Herring <robh@kernel.org>
