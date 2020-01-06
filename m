Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC95C130F06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 09:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgAFI65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 03:58:57 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35948 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAFI65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 03:58:57 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so20888063plm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X3dOelacYxn9KIq2c0lVVrTdMISMt6ePdc4LIZBttsE=;
        b=VeurVa6W0lVai4NQoX/XBCveJbHKCydpGkT0MM87ek4A2/ON92GZIhFYR7kRjGlgP3
         mI9lSzxhASsRXnhVBp5zcowqJuifnn8wHhtygkGWK56rKFMcAEwlSp+lMiD6yv9isTsC
         j0h1VxUfHqGkQc3TkMBrNK0gM+pYAqlwvGcEhFC5r5L5HVyjC9xFDyewXcE/xdw+3HrM
         xsFC/1ZvV7tKlL6tmawIuIXIHj4L0j3zrIluDykAZhSxG/21FSWmhTRCI+6kT2JjMjpC
         adS2xmI21vrTbvLvojEJXp50IcZCfp3PAhw5fzJlTkjs7or4Q7ey0sOiOipbzlRqyJI5
         bN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X3dOelacYxn9KIq2c0lVVrTdMISMt6ePdc4LIZBttsE=;
        b=OHVPt97sd1T7+bLKY0SG+387XO6TNuMPRASc/LF0O51aB4lZ70GiaNpEZWQtXQUblC
         5j6p5Ovfn8sFkOxAXVYaYyJvYxd96T4t42gGYHhz+giMS1ox5A9MoHqZnKFmkZ0j7Z8t
         GjUq7edrR3OLcgxNPCuWX9bw42yCvTLcx8LcWBDVu5oG4ZDYHrRMVrOz1ODk3Xy7vFZd
         Id/cvb5gLdeup8Bq0sB5DDYlhS5I8HNbmHYXW/PsfcoF50oRJsK9241d7YnJe3p8DOxs
         9Qv9ndf2yNJrOfjcSM2QaPcbkECZ19MVTFus6EZECaKrKKCGu7y4FrvUG8mEqqLGRH3u
         F7pQ==
X-Gm-Message-State: APjAAAXupMpvJZvJ9kBKYdWnxFyzUbRbukEtrt0AiIE4KGB/gb0dIW10
        NqATffAP4FbCZukWhhueT9slxA==
X-Google-Smtp-Source: APXvYqxYFVoMAFYm4ehjGUNJYrdDMBfNyD7GFNI22SJzewWug8QgdaScgHVBrSz/ICU42udSqm4y3w==
X-Received: by 2002:a17:902:6b8c:: with SMTP id p12mr88899809plk.290.1578301136221;
        Mon, 06 Jan 2020 00:58:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z11sm69219515pfk.96.2020.01.06.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:58:55 -0800 (PST)
Date:   Mon, 6 Jan 2020 00:58:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Fix VDD core voltage
Message-ID: <20200106085853.GT3755841@builder>
References: <1577785957-31291-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577785957-31291-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 31 Dec 01:52 PST 2019, Loic Poulain wrote:

> APQ8096 has its VDD APC (Power for quad Kryo applications
> microprocessors) powered by PM8996 PMIC S9, S10, S11 tri-phase
> regulators (gang). The bootloader may have configured these
> regulators with non sustainable default values, leading to sporadic
> hangs under CPU stress tests (cpufreq-becnh). Ideally we should enable
> voltage scaling along with frequency scaling, but for now just set the
> regulator gang value to a sane voltage, capable of supporting highest
> frequencies (turbo).
> 

I wasn't able to boot my db820c with the previous attempts to do opp
based voltage scaling, but this seems to work (booted twice
successfully).

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index dba3488..8cde693 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -493,6 +493,11 @@
>  				core-vcc-supply = <&pm8994_s4>;
>  			};
>  		};
> +
> +		saw3: syscon@9A10000 {

This node should live in msm8996.dtsi.

> +			compatible = "syscon";
> +			reg = <0x9A10000 0x1000>;

Please pad address to 8 digits, make 'A' lowercase and sort it among the
other nodes by address.

> +		};
>  	};
>  
>  
> @@ -681,6 +686,25 @@
>  			};
>  		};
>  	};
> +
> +	pmic@1 {
> +		spm-regulators {

This node represents the SPMI regulators, although the ganging relates
to the SPM. Please define an "empty":

pm8994_spmi_regulators: regulators {
	compatible = "qcom,pm8994-regulators";
};

In pm8994.dtsi, then add the rest here by extending
&pm8994_spmi_regulators in db820c.dtsi (sorted by label name)

Regards,
Bjorn

> +			compatible = "qcom,pm8994-regulators";
> +			qcom,saw-reg = <&saw3>;
> +			s9 {
> +				qcom,saw-slave;
> +			};
> +			s10 {
> +				qcom,saw-slave;
> +			};
> +			s11 {
> +				qcom,saw-leader;
> +				regulator-always-on;
> +				regulator-min-microvolt = <1230000>;
> +				regulator-max-microvolt = <1230000>;
> +			};
> +		};
> +	};
>  };
>  
>  &sound {
> -- 
> 2.7.4
> 
