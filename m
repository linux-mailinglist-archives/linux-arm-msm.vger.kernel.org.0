Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4756C003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 19:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfGQRAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 13:00:54 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36912 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfGQRAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 13:00:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so12291704plr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2019 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5u+EzLr3m2dLf4+3JG8VhnrFPF71nmp+9+eNA54KPSg=;
        b=edsd2MH6ydIrhIRtMBulwe3kHyXVSk3Hi6rqerj1JfFYlSD1cfrTAst0V7zvZbBjrJ
         h9eQP7zjBx3zcybbpVQZ2N9Ncxz8wJbvDEjSncgmHQXI4kY2XhmYCgrmyFCSoU9mQ9D5
         8LIzDHyBPJduVn9YUF4rbuqHROyFioD1rFcRP7ERxWf9TXXuyge/ef3hL2BBqXA2p4km
         zvpN4L/wQi3IYoqoib5D9qWCqXcN4H4o4EIm75238MmV/kkoa7EXj9U/iIO1symJwWe0
         xCAQ0LP+VQZHmx0EljRBZC95hQvtNCoTJA9J4TB+vRH/90lxlShw5UUu5Lzf5FYKPGVG
         F7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5u+EzLr3m2dLf4+3JG8VhnrFPF71nmp+9+eNA54KPSg=;
        b=WBJBJ9f+otKV3FTQLz2D9tRGmX/efT4DNtoGusLRBjqigeioMwxpWymUqGMQLdDJip
         S2kK7AdRE7sGKzKLk/kSq77tzBEbdVax/4mwbPgzTPIKo21C+2mUazgWcJf1rkfY3arD
         VNtKuJmSZV3jlPitbxuz/HDuboy/PSBho1ODnjzWErjbShxU39iicYHZl+6fJpx47FNY
         kaisSGY8sGDTdf4I2edZ/OpDwR/c1AW6xzTaWhaG2CRGGu5/DjSu6ETnaF0M6xcDWez9
         RTIg2wl1EYBUJ4Cj485P7yDeGNiMJR59qFZtfffpEw4WXdMAxNcgyQSX32cd0Q+x03qQ
         Oezw==
X-Gm-Message-State: APjAAAXkabg23C474qLA4jUxCogew2WUIMq6jtC354fMeLd8S1/jfEsH
        GkcdZG/29aZzN46Zm8Mne19Arg==
X-Google-Smtp-Source: APXvYqyVZk8bivS/DMbAu2CfzWva/LHErLO8WbRbxDYLntMHGgq5983H3x2+3E6iAW1b1A5IJiarwg==
X-Received: by 2002:a17:902:2ae8:: with SMTP id j95mr40966269plb.276.1563382853656;
        Wed, 17 Jul 2019 10:00:53 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r6sm17192938pgl.74.2019.07.17.10.00.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 10:00:53 -0700 (PDT)
Date:   Wed, 17 Jul 2019 11:00:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCHv8 3/5] arm64: dts: qcom: msm8996: Add Coresight support
Message-ID: <20190717170050.GB4271@xps15>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 12, 2019 at 07:46:25PM +0530, Sai Prakash Ranjan wrote:
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> 
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on msm8996.
> 
> This also adds coresight cpu debug nodes.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
>  1 file changed, 434 insertions(+)
> 

We've gone trhough 8 iteration of this set and I'm still finding checkpatch
problems, and I'm not referring to lines over 80 characters.

> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 96c0a481f454..8968431e772c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -633,6 +633,440 @@
>  			reg = <0x300000 0x90000>;
>  		};
>  
> +		stm@3002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x3002000 0x1000>,
> +			      <0x8280000 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint =
> +						  <&funnel0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpiu@3020000 {
> +			compatible = "arm,coresight-tpiu", "arm,primecell";
> +			reg = <0x3020000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				port {
> +					tpiu_in: endpoint {
> +						remote-endpoint =
> +						  <&replicator_out1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@3021000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x3021000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				port {
> +					funnel0_in: endpoint {
> +						remote-endpoint =
> +						  <&stm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel0_out: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@3022000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x3022000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				port {
> +					funnel1_in: endpoint {
> +						remote-endpoint =
> +						  <&apss_merge_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel1_out: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@3025000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x3025000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					merge_funnel_in0: endpoint {
> +						remote-endpoint =
> +						  <&funnel0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					merge_funnel_in1: endpoint {
> +						remote-endpoint =
> +						  <&funnel1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					merge_funnel_out: endpoint {
> +						remote-endpoint =
> +						  <&etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@3026000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x3026000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				port {
> +					replicator_in: endpoint {
> +						remote-endpoint =
> +						  <&etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					replicator_out0: endpoint {
> +						remote-endpoint =
> +						  <&etr_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					replicator_out1: endpoint {
> +						remote-endpoint =
> +						  <&tpiu_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etf@3027000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x3027000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				port {
> +					etf_in: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etf_out: endpoint {
> +						remote-endpoint =
> +						  <&replicator_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etr@3028000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x3028000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					etr_in: endpoint {
> +						remote-endpoint =
> +						  <&replicator_out0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		debug@3810000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x3810000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU0>;
> +		};
> +
> +		etm@3840000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x3840000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			cpu = <&CPU0>;
> +
> +			out-ports {
> +				port {
> +					etm0_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		debug@3910000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x3910000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU1>;
> +		};
> +
> +		etm@3940000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x3940000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			cpu = <&CPU1>;
> +
> +			out-ports {
> +				port {
> +					etm1_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel0_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@39b0000 { /* APSS Funnel 0 */
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x39b0000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					apss_funnel0_in0: endpoint {
> +						remote-endpoint = <&etm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					apss_funnel0_in1: endpoint {
> +						remote-endpoint = <&etm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_funnel0_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_merge_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		debug@3a10000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x3a10000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU2>;
> +		};
> +
> +		etm@3a40000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x3a40000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			cpu = <&CPU2>;
> +
> +			out-ports {
> +				port {
> +					etm2_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel1_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		debug@3b10000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x3b10000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU3>;
> +		};
> +
> +		etm@3b40000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			reg = <0x3b40000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			cpu = <&CPU3>;
> +
> +			out-ports {
> +				port {
> +					etm3_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel1_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@3bb0000 { /* APSS Funnel 1 */
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x3bb0000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					apss_funnel1_in0: endpoint {
> +						remote-endpoint = <&etm2_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					apss_funnel1_in1: endpoint {
> +						remote-endpoint = <&etm3_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_funnel1_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_merge_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@3bc0000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0x3bc0000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					apss_merge_funnel_in0: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					apss_merge_funnel_in1: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_merge_funnel_out: endpoint {
> +						remote-endpoint =
> +						  <&funnel1_in>;
> +					};
> +				};
> +			};
> +		};
> +
>  		kryocc: clock-controller@6400000 {
>  			compatible = "qcom,apcc-msm8996";
>  			reg = <0x6400000 0x90000>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
