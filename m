Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FF1CAB07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 19:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388487AbfJCRQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 13:16:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35125 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390594AbfJCQXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 12:23:35 -0400
Received: by mail-pg1-f193.google.com with SMTP id a24so2095095pgj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GsCH2sCVXvn0x/whcUT1R2ddQgsbWOEJIx5FENdlgs8=;
        b=ubImWPxNfzTpJvMNer0GdchXdH7z9Lw0p4Tx0wu4FFKe3xqHkOwYMTeoydhpiB8v6A
         w65tOpD+OCFR5V41lBncGE6qC4wbB8gXtzIOB+Ed0LYBDDLcCI0fplsBgGraYf0Ln6Tv
         6F9Qf6XvxLIkXTTbJ8W2ZHpy3ZnhTCuTEwlmzL6I5Ob43K1sShTwNRmTjZmdQHc4Ve4h
         LmI5zRxvc8xZBNKPg5a8bDBo+r87ePirh2h3OtYFlkTHX4OZrzfElUjHOLxy+4ZQ8m+N
         c9RpEmaR2cqklxTCm23Fb/PR3i/hNephqpbBjPAIxUEwDgAlBDNVpsFoUiYc+C9NDqvh
         zgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GsCH2sCVXvn0x/whcUT1R2ddQgsbWOEJIx5FENdlgs8=;
        b=DZST9k4bRteeQqLZxAqZS9Mz5WJUfHJ2TPtgDj8LcfMEbjd7kZl2h4h7b7l1IfLRPq
         7gAS7MF6jVu9QcJMKvNllDknuajn7gBQXqdRyiqzUJwkOlKjiR2vkuSWR7qi4LvGCcnU
         7JpOo+XN8KpAiDGbwr9QTXfAYQKrBXyarByBVdVNkYPTL0cPL95tEj3AhrP7ifWWL3xw
         taIkZO7t93E2uLjPsHnH1E5UzE0Ivvp5uZEFb/N1jg1qocJSBJBO4VT9FApEL7UwoSPb
         UYnqn/i4bEsxs5///n9pJ5U83NSBhTcG530FBgHDi8+C+ZWMSY3XKl9vl9GH/b4TPEHv
         FpNg==
X-Gm-Message-State: APjAAAXQNQCOVM6xbZ/waleUzDVWFsUHFQ/BvQK3aAdnjPmn3AzBKpTj
        pVa7tN8ooazusmCCtOOHDpsX4Se/ZUA=
X-Google-Smtp-Source: APXvYqzaNjnfD8qrCDkgVRCdAgJVcauzxVqkIePimbpwLCi2AZNfjkMQ7MzECzdQeNaKcXQsjUAS7Q==
X-Received: by 2002:a62:5c82:: with SMTP id q124mr11923740pfb.177.1570119813926;
        Thu, 03 Oct 2019 09:23:33 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t14sm2785832pgb.33.2019.10.03.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:23:33 -0700 (PDT)
Date:   Thu, 3 Oct 2019 09:23:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Disable coresight by default
Message-ID: <20191003162330.GD63675@minitux>
References: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
 <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Oct 05:53 PDT 2019, Marc Gonzalez wrote:

> On 03/10/2019 08:44, Sai Prakash Ranjan wrote:
> 
> > Boot failure has been reported on MSM8998 based laptop when
> > coresight is enabled. This is most likely due to lack of
> > firmware support for coresight on production device when
> > compared to debug device like MTP where this issue is not
> > observed. So disable coresight by default for MSM8998 and
> > enable it only for MSM8998 MTP.
> > 
> > Reported-and-tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > Fixes: 783abfa2249a ("arm64: dts: qcom: msm8998: Add Coresight support")
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 68 +++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 51 +++++++++++------
> >  2 files changed, 102 insertions(+), 17 deletions(-)
> 
> Just wanted to toss an alternative, based on Suzuki's suggestion
> (i.e. move the coresight nodes to a separate file)
> 

For the particular case this seems quite reasonable; the conditional
inclusion of this file would indeed allow us to enable all the nodes at
once.

But I find it hard to navigate the dts files when the information they
are spread out over multiple files and the current split has rather
clear rules of what goes where.

Further more this probably not going to be the only thing that differs
between engineering devices and production devices, but I don't think
this split would scale to the various other cases.

Regards,
Bjorn

> 
>  arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi | 439 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi       |   1 +
>  arch/arm64/boot/dts/qcom/msm8998.dtsi           | 435 -----------------------
>  3 files changed, 440 insertions(+), 435 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi b/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi
> new file mode 100644
> index 000000000000..eabf4e4194fd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2019, The Linux Foundation. All rights reserved. */
> +
> +&soc {
> +	stm@6002000 {
> +		compatible = "arm,coresight-stm", "arm,primecell";
> +		reg = <0x06002000 0x1000>,
> +		      <0x16280000 0x180000>;
> +		reg-names = "stm-base", "stm-data-base";
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				stm_out: endpoint {
> +					remote-endpoint = <&funnel0_in7>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6041000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0x06041000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				funnel0_out: endpoint {
> +					remote-endpoint =
> +					  <&merge_funnel_in0>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@7 {
> +				reg = <7>;
> +				funnel0_in7: endpoint {
> +					remote-endpoint = <&stm_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6042000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0x06042000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				funnel1_out: endpoint {
> +					remote-endpoint =
> +					  <&merge_funnel_in1>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@6 {
> +				reg = <6>;
> +				funnel1_in6: endpoint {
> +					remote-endpoint =
> +					  <&apss_merge_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6045000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0x06045000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				merge_funnel_out: endpoint {
> +					remote-endpoint =
> +					  <&etf_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				merge_funnel_in0: endpoint {
> +					remote-endpoint =
> +					  <&funnel0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				merge_funnel_in1: endpoint {
> +					remote-endpoint =
> +					  <&funnel1_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	replicator@6046000 {
> +		compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +		reg = <0x06046000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				replicator_out: endpoint {
> +					remote-endpoint = <&etr_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			port {
> +				replicator_in: endpoint {
> +					remote-endpoint = <&etf_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etf@6047000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0x06047000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				etf_out: endpoint {
> +					remote-endpoint =
> +					  <&replicator_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			port {
> +				etf_in: endpoint {
> +					remote-endpoint =
> +					  <&merge_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etr@6048000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0x06048000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +		arm,scatter-gather;
> +
> +		in-ports {
> +			port {
> +				etr_in: endpoint {
> +					remote-endpoint =
> +					  <&replicator_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7840000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07840000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU0>;
> +
> +		out-ports {
> +			port {
> +				etm0_out: endpoint {
> +					remote-endpoint =
> +					  <&apss_funnel_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7940000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07940000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU1>;
> +
> +		out-ports {
> +			port {
> +				etm1_out: endpoint {
> +					remote-endpoint =
> +					  <&apss_funnel_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7a40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07a40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU2>;
> +
> +		out-ports {
> +			port {
> +				etm2_out: endpoint {
> +					remote-endpoint =
> +					  <&apss_funnel_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7b40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07b40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU3>;
> +
> +		out-ports {
> +			port {
> +				etm3_out: endpoint {
> +					remote-endpoint =
> +					  <&apss_funnel_in3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@7b60000 { /* APSS Funnel */
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07b60000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				apss_funnel_out: endpoint {
> +					remote-endpoint =
> +					  <&apss_merge_funnel_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				apss_funnel_in0: endpoint {
> +					remote-endpoint =
> +					  <&etm0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				apss_funnel_in1: endpoint {
> +					remote-endpoint =
> +					  <&etm1_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				apss_funnel_in2: endpoint {
> +					remote-endpoint =
> +					  <&etm2_out>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				apss_funnel_in3: endpoint {
> +					remote-endpoint =
> +					  <&etm3_out>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				apss_funnel_in4: endpoint {
> +					remote-endpoint =
> +					  <&etm4_out>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				apss_funnel_in5: endpoint {
> +					remote-endpoint =
> +					  <&etm5_out>;
> +				};
> +			};
> +
> +			port@6 {
> +				reg = <6>;
> +				apss_funnel_in6: endpoint {
> +					remote-endpoint =
> +					  <&etm6_out>;
> +				};
> +			};
> +
> +			port@7 {
> +				reg = <7>;
> +				apss_funnel_in7: endpoint {
> +					remote-endpoint =
> +					  <&etm7_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@7b70000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0x07b70000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		out-ports {
> +			port {
> +				apss_merge_funnel_out: endpoint {
> +					remote-endpoint =
> +					  <&funnel1_in6>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			port {
> +				apss_merge_funnel_in: endpoint {
> +					remote-endpoint =
> +					  <&apss_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7c40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07c40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU4>;
> +
> +		port{
> +			etm4_out: endpoint {
> +				remote-endpoint = <&apss_funnel_in4>;
> +			};
> +		};
> +	};
> +
> +	etm@7d40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07d40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU5>;
> +
> +		port{
> +			etm5_out: endpoint {
> +				remote-endpoint = <&apss_funnel_in5>;
> +			};
> +		};
> +	};
> +
> +	etm@7e40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07e40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU6>;
> +
> +		port{
> +			etm6_out: endpoint {
> +				remote-endpoint = <&apss_funnel_in6>;
> +			};
> +		};
> +	};
> +
> +	etm@7f40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0x07f40000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +		clock-names = "apb_pclk", "atclk";
> +
> +		cpu = <&CPU7>;
> +
> +		port{
> +			etm7_out: endpoint {
> +				remote-endpoint = <&apss_funnel_in7>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 108667ce4f31..9b586b3206fc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -5,6 +5,7 @@
>  #include "pm8998.dtsi"
>  #include "pmi8998.dtsi"
>  #include "pm8005.dtsi"
> +#include "msm8998-coresight.dtsi"
>  
>  / {
>  	aliases {
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index c6f81431983e..4b66a1c588f8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -998,441 +998,6 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		stm@6002000 {
> -			compatible = "arm,coresight-stm", "arm,primecell";
> -			reg = <0x06002000 0x1000>,
> -			      <0x16280000 0x180000>;
> -			reg-names = "stm-base", "stm-data-base";
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					stm_out: endpoint {
> -						remote-endpoint = <&funnel0_in7>;
> -					};
> -				};
> -			};
> -		};
> -
> -		funnel@6041000 {
> -			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> -			reg = <0x06041000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					funnel0_out: endpoint {
> -						remote-endpoint =
> -						  <&merge_funnel_in0>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@7 {
> -					reg = <7>;
> -					funnel0_in7: endpoint {
> -						remote-endpoint = <&stm_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		funnel@6042000 {
> -			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> -			reg = <0x06042000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					funnel1_out: endpoint {
> -						remote-endpoint =
> -						  <&merge_funnel_in1>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@6 {
> -					reg = <6>;
> -					funnel1_in6: endpoint {
> -						remote-endpoint =
> -						  <&apss_merge_funnel_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		funnel@6045000 {
> -			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> -			reg = <0x06045000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					merge_funnel_out: endpoint {
> -						remote-endpoint =
> -						  <&etf_in>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -					merge_funnel_in0: endpoint {
> -						remote-endpoint =
> -						  <&funnel0_out>;
> -					};
> -				};
> -
> -				port@1 {
> -					reg = <1>;
> -					merge_funnel_in1: endpoint {
> -						remote-endpoint =
> -						  <&funnel1_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		replicator@6046000 {
> -			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> -			reg = <0x06046000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					replicator_out: endpoint {
> -						remote-endpoint = <&etr_in>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				port {
> -					replicator_in: endpoint {
> -						remote-endpoint = <&etf_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etf@6047000 {
> -			compatible = "arm,coresight-tmc", "arm,primecell";
> -			reg = <0x06047000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					etf_out: endpoint {
> -						remote-endpoint =
> -						  <&replicator_in>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				port {
> -					etf_in: endpoint {
> -						remote-endpoint =
> -						  <&merge_funnel_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etr@6048000 {
> -			compatible = "arm,coresight-tmc", "arm,primecell";
> -			reg = <0x06048000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -			arm,scatter-gather;
> -
> -			in-ports {
> -				port {
> -					etr_in: endpoint {
> -						remote-endpoint =
> -						  <&replicator_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etm@7840000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07840000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU0>;
> -
> -			out-ports {
> -				port {
> -					etm0_out: endpoint {
> -						remote-endpoint =
> -						  <&apss_funnel_in0>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etm@7940000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07940000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU1>;
> -
> -			out-ports {
> -				port {
> -					etm1_out: endpoint {
> -						remote-endpoint =
> -						  <&apss_funnel_in1>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etm@7a40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07a40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU2>;
> -
> -			out-ports {
> -				port {
> -					etm2_out: endpoint {
> -						remote-endpoint =
> -						  <&apss_funnel_in2>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etm@7b40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07b40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU3>;
> -
> -			out-ports {
> -				port {
> -					etm3_out: endpoint {
> -						remote-endpoint =
> -						  <&apss_funnel_in3>;
> -					};
> -				};
> -			};
> -		};
> -
> -		funnel@7b60000 { /* APSS Funnel */
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07b60000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					apss_funnel_out: endpoint {
> -						remote-endpoint =
> -						  <&apss_merge_funnel_in>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -					apss_funnel_in0: endpoint {
> -						remote-endpoint =
> -						  <&etm0_out>;
> -					};
> -				};
> -
> -				port@1 {
> -					reg = <1>;
> -					apss_funnel_in1: endpoint {
> -						remote-endpoint =
> -						  <&etm1_out>;
> -					};
> -				};
> -
> -				port@2 {
> -					reg = <2>;
> -					apss_funnel_in2: endpoint {
> -						remote-endpoint =
> -						  <&etm2_out>;
> -					};
> -				};
> -
> -				port@3 {
> -					reg = <3>;
> -					apss_funnel_in3: endpoint {
> -						remote-endpoint =
> -						  <&etm3_out>;
> -					};
> -				};
> -
> -				port@4 {
> -					reg = <4>;
> -					apss_funnel_in4: endpoint {
> -						remote-endpoint =
> -						  <&etm4_out>;
> -					};
> -				};
> -
> -				port@5 {
> -					reg = <5>;
> -					apss_funnel_in5: endpoint {
> -						remote-endpoint =
> -						  <&etm5_out>;
> -					};
> -				};
> -
> -				port@6 {
> -					reg = <6>;
> -					apss_funnel_in6: endpoint {
> -						remote-endpoint =
> -						  <&etm6_out>;
> -					};
> -				};
> -
> -				port@7 {
> -					reg = <7>;
> -					apss_funnel_in7: endpoint {
> -						remote-endpoint =
> -						  <&etm7_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		funnel@7b70000 {
> -			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> -			reg = <0x07b70000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			out-ports {
> -				port {
> -					apss_merge_funnel_out: endpoint {
> -						remote-endpoint =
> -						  <&funnel1_in6>;
> -					};
> -				};
> -			};
> -
> -			in-ports {
> -				port {
> -					apss_merge_funnel_in: endpoint {
> -						remote-endpoint =
> -						  <&apss_funnel_out>;
> -					};
> -				};
> -			};
> -		};
> -
> -		etm@7c40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07c40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU4>;
> -
> -			port{
> -				etm4_out: endpoint {
> -					remote-endpoint = <&apss_funnel_in4>;
> -				};
> -			};
> -		};
> -
> -		etm@7d40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07d40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU5>;
> -
> -			port{
> -				etm5_out: endpoint {
> -					remote-endpoint = <&apss_funnel_in5>;
> -				};
> -			};
> -		};
> -
> -		etm@7e40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07e40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU6>;
> -
> -			port{
> -				etm6_out: endpoint {
> -					remote-endpoint = <&apss_funnel_in6>;
> -				};
> -			};
> -		};
> -
> -		etm@7f40000 {
> -			compatible = "arm,coresight-etm4x", "arm,primecell";
> -			reg = <0x07f40000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -			cpu = <&CPU7>;
> -
> -			port{
> -				etm7_out: endpoint {
> -					remote-endpoint = <&apss_funnel_in7>;
> -				};
> -			};
> -		};
> -
>  		spmi_bus: spmi@800f000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg =	<0x0800f000 0x1000>,
