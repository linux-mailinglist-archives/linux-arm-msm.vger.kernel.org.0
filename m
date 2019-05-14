Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8091CCA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfENQM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:12:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44190 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfENQM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:12:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id e13so14835151ljl.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zfQddiOq+yGGXgJWvgghz1ralncjsTYvFgLd2q9NqWE=;
        b=nNZvEWx/rFjfVThvl7XDlvrse2Tx/2cWqc4X+mp+jVlfV3qf+s7ufqbSaIalYSrw80
         0eA0gHN629gImnlapJQJFp342J9gRE4yv7EZBFHDV5MZjL0x9RqlDFQP/irmJTLe88aS
         //Cfoia50oc2JNU0LsOPP1pAv53HFseGLC1k3oobOzAG043Q62ylR8CVyHmPTpTHFRuo
         w59D2+URas9X9dCu9eRGIS8+IV8S62UvBUuwtHZrWbX3vGDeyJLEsePQwbno3ovBkbCT
         W8WeBULQUWutSOpvNwxljTy0RLBP0AX0rCFicu+qf3A2r5AdFhXmjM5PkBCgeaxklOPB
         8CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zfQddiOq+yGGXgJWvgghz1ralncjsTYvFgLd2q9NqWE=;
        b=Mv9gLiciWgEKFzA+/v9zt3Y9iFCDfkSkcK+XQy3g6QSJehr+BcxJY6m0Cb8TpChrBY
         Iwozbwp6Gv7+nxNhYqdeY5jY32Es5ysNVaeFM5nO9tK9PlTyMmdW8sWZVkbTbCkZPtGa
         B6gfwtl6JB7MQ5FeIvsOurdXGKSXBT7GEtuod4zYSxGKFPPsIXfcBDuXb7VycItrNTMv
         CscilcfKH1ieT+MwvNmq7BNiZKldEJOPXsPVDhfyZldSCBjNSUgQbWRPPkQmm9SMa9FK
         Fp9yaiRs1/SmZ9cf0kJKrz9iHCe2iPa36+9Kd07TQ47p3GSAKv2QzoxfMi2IJyzC7z3v
         nEFw==
X-Gm-Message-State: APjAAAW/IAukHDKAbDj7JS5GcEhwJtS7HDNqt7bpMX4v9avT9XyPh280
        f9JAZ4sU+jJVFUAQMGb59tRIng==
X-Google-Smtp-Source: APXvYqy2E5MlY+OvjuCOEAWZdqfDU3RAdwYwk3Humcsl5K9EzCU3UbbxjastyVsuoCXvxqGsQookgg==
X-Received: by 2002:a2e:9b92:: with SMTP id z18mr7595076lji.190.1557850373861;
        Tue, 14 May 2019 09:12:53 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j1sm799183lja.17.2019.05.14.09.12.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:12:50 -0700 (PDT)
Date:   Tue, 14 May 2019 18:12:49 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCHv1 6/8] arm64: dts: qcom: msm8996: Add PSCI cpuidle low
 power states
Message-ID: <CAHYWTt1ZiX4mC01PRwVHU7417NC2tHY-_Cd+fwn1EyY+shKW-g@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:44PM +0530, Amit Kucheria wrote:
> Add device bindings for cpuidle states for cpu devices.
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index c761269caf80..b615bcb9e351 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -95,6 +95,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x0>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&LITTLE_CPU_PD>;
>                       next-level-cache = <&L2_0>;
>                       L2_0: l2-cache {
>                             compatible = "cache";
> @@ -107,6 +108,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x1>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&LITTLE_CPU_PD>;
>                       next-level-cache = <&L2_0>;
>               };
>
> @@ -115,6 +117,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x100>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&BIG_CPU_PD>;
>                       next-level-cache = <&L2_1>;
>                       L2_1: l2-cache {
>                             compatible = "cache";
> @@ -127,6 +130,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x101>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&BIG_CPU_PD>;
>                       next-level-cache = <&L2_1>;
>               };
>
> @@ -151,6 +155,30 @@
>                               };
>                       };
>               };
> +
> +             idle-states {
> +                     entry-method="psci";

Please add a space before and after "=".

> +
> +                     LITTLE_CPU_PD: little-power-down {

In Documentation/devicetree/bindings/arm/idle-states.txt
they seem to use labels such as CPU_SLEEP_0_0 for the first
cluster and CPU_SLEEP_1_0 for the second cluster.

Please also consider my comment in patch 4/8.

> +                             compatible = "arm,idle-state";
> +                             idle-state-name = "standalone-power-collapse";
> +                             arm,psci-suspend-param = <0x00000004>;
> +                             entry-latency-us = <40>;
> +                             exit-latency-us = <40>;

Where did you get the latency values from?
Downstream seems to use qcom,latency-us = <80> for "fpc".

(Sure downstream also defines "fpc-def", but that seems to require
additional psci code/calls that doesn't exist upstream.)

> +                             min-residency-us = <300>;
> +                             local-timer-stop;

Are you sure that the local timer is stopped?
the equivalent DT property to "local-timer-stop" in downstream is
"qcom,use-broadcast-timer", and this property seems to be missing
from this node:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n158

You could try to remove "local-timer-stop", if it is really needed,
then the system should hang without this property.


> +                     };
> +
> +                     BIG_CPU_PD: big-power-down {
> +                             compatible = "arm,idle-state";
> +                             idle-state-name = "standalone-power-collapse";
> +                             arm,psci-suspend-param = <0x00000004>;
> +                             entry-latency-us = <40>;
> +                             exit-latency-us = <40>;

Where did you get the latency values from?
Downstream seems to use qcom,latency-us = <80> for "fpc".

(Sure downstream also defines "fpc-def", but that seems to require
additional psci code/calls that doesn't exist upstream.)

> +                             min-residency-us = <300>;
> +                             local-timer-stop;

Are you sure that the local timer is stopped?
the equivalent DT property to "local-timer-stop" in downstream is
"qcom,use-broadcast-timer", and this property seems to be missing
from this node:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n247

You could try to remove "local-timer-stop", if it is really needed,
then the system should hang without this property.


> +                     };
> +             };
>       };
> 
>       thermal-zones {
> --
> 2.17.1
>
