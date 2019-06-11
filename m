Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946F1418A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 01:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407930AbfFKXIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 19:08:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42151 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407929AbfFKXIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 19:08:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so8361141pff.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 16:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vjl9Ns8qTRMKP0J+iO0hKqMC3min1EiwS3qQ6sVNS1c=;
        b=YN/UgLNkyeTM1qoFucU0AJFUxeziYWrhUCibHWCA/qlMUN6spFPO8C0Kvv+zJFiWDC
         zXLmuybO9JFifvUo0mmqfj9igpjzb8fqlzcAz4+Yx47Sy3EhpPa2HK9x8iDXoDHBOzRw
         wBVo3r4//Gkv25xlprDkXizA7UxjgB+dzDQWPxtn0DwKTAGgkmLq2+RiOvUfT6vva2B1
         WjN23HAl91P5GutP+gJ9ynAWNtTOWJm11MBQHdpYh4QY6CW5KrXtCKBLV1zqh2z6R21S
         ++xN7LRProkA12fmgeIpexQ9SL27ncDFGksdFy/T+a3GvZ8I33Ej4FpjvxShMCxflUdd
         7GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vjl9Ns8qTRMKP0J+iO0hKqMC3min1EiwS3qQ6sVNS1c=;
        b=VeAsiNi4wT7ASgVsTyGCe0WFmLDd6WZ1/bLeQJ2hV/t2DrrGP3/YFz/lf80VzH5RS7
         X401k1Q3IoYvV0d66P5hQhZ5aLP4qwWIT4keK6PYPvF3uQmnJzmOvFImPbGCJzqJkDWh
         qtTlq47Df8CWpu/pGcI+keLUsbItAH2YaqX/0V2myiSdkpwY36fnRk3llBJyHzanwRY2
         G70yrAGyOmt9mKBWLn4dNdiNJHqF9PgMvPwFB5BPcCsgHh+nqZ2VyBSN8hzm54QsWh3h
         5gp2z4wq8wvMujmYnpWimFNxpj5VUoWZyzbtJi77raAwsquw8Kja1q0BeRGaMbL6H2P2
         ndJQ==
X-Gm-Message-State: APjAAAXrmTSBiK7SyOofoFgcen0gMmFLv2BTYw3c1Eqv1ZfAd5zt8eTP
        3CtlkvNohVWM46zw3fkOLKYi1A==
X-Google-Smtp-Source: APXvYqynsWTp0wdQaNa3lyxkx2tbF0tlUWrRe3v1z2Eum8yVKB/bjwEiZ8XB8FqYlwWcOT8gSLV1Jg==
X-Received: by 2002:a17:90a:25e6:: with SMTP id k93mr8367124pje.100.1560294501786;
        Tue, 11 Jun 2019 16:08:21 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c129sm29717844pfa.106.2019.06.11.16.08.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 16:08:20 -0700 (PDT)
Date:   Tue, 11 Jun 2019 16:08:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: interconnect: Add Qualcomm QCS404 DT
 bindings
Message-ID: <20190611230818.GT4814@minitux>
References: <20190611164157.24656-1-georgi.djakov@linaro.org>
 <20190611164157.24656-2-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611164157.24656-2-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 11 Jun 09:41 PDT 2019, Georgi Djakov wrote:

> The Qualcomm QCS404 platform has several buses that could be controlled
> and tuned according to the bandwidth demand.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v3:
> - Add a reg property and move the interconnect nodes under the "soc" node.
> 
> v2:
> - No changes.
> 
>  .../bindings/interconnect/qcom,qcs404.txt     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> new file mode 100644
> index 000000000000..14a827268dda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> @@ -0,0 +1,46 @@
> +Qualcomm QCS404 Network-On-Chip interconnect driver binding
> +-----------------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +			"qcom,qcs404-bimc"
> +			"qcom,qcs404-pcnoc"
> +			"qcom,qcs404-snoc"
> +- #interconnect-cells : should contain 1
> +
> +Optional properties :
> +reg : specifies the physical base address and size of registers
> +clocks : list of phandles and specifiers to all interconnect bus clocks
> +clock-names : clock names should include both "bus_clk" and "bus_a_clk"
> +
> +Example:
> +
> +soc {
> +	...
> +	bimc: interconnect@400000 {
> +		reg = <0x00400000 0x80000>;
> +		compatible = "qcom,qcs404-bimc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +			<&rpmcc RPM_SMD_BIMC_A_CLK>;
> +	};
> +
> +	pnoc: interconnect@500000 {
> +		reg = <0x00500000 0x15080>;
> +		compatible = "qcom,qcs404-pcnoc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> +			<&rpmcc RPM_SMD_PNOC_A_CLK>;
> +	};
> +
> +	snoc: interconnect@580000 {
> +		reg = <0x00580000 0x23080>;
> +		compatible = "qcom,qcs404-snoc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +			<&rpmcc RPM_SMD_SNOC_A_CLK>;
> +	};
> +};
