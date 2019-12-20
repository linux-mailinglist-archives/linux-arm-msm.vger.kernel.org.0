Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B123B127602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 08:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfLTHAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 02:00:05 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41216 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfLTHAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:00:05 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so3687369plb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fC3JoLkbnwXvlpi7t/a7WSOC0sr7d5AZj1xh2J+UQWc=;
        b=fgUzCoxZIrK8T+zhBZBxenZpkETpNWuij5YvgiDRqexvZ6DuCnw1A5aHv48ouQ77ib
         CtIfZpOF1PzVz0Ozn9aVjnmio8aK2cITR3+NmlKwRzHxk3SV/A4tUMcWEKWON5GHCFCV
         xBCpkJb17a3FBh88qlrJmml4whEOSaX4p4BxufL66ZLSqT2Cjy5aLgp5so+es+pM6Duu
         VPEKZOxMj5VnJllBsku7+B26djfOC4Qx+xfNGAp5l+ZQGmEVsie1Fd1WEZFHYCjVYPOT
         Qi+DwE7kqGOpvV6VIxgnQPRa6Rchh/wS6XogUPvc3JpRVNMShUwgK9VdXy7g6gqRqSjP
         3oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fC3JoLkbnwXvlpi7t/a7WSOC0sr7d5AZj1xh2J+UQWc=;
        b=U5iJDtuxaYYyere2k5Qbvp/dgL9X68qLzw4oN3//uLUc1aXNqq5naS4L+j8aSH5jHD
         73OJS5HvoehhmRBanBJrhhJPAoyUTUkQGIiQSt+Ua1t4D7OZ9d+q1XCirYM6zF/49IYx
         lOFPns5LU/4sqHx1ysi5Nhnu6Qp1RzCpu78403F+nZgrr1WqjIkr9KqNmStDmbdgtbmk
         wpAA0JhoUE3xKX9u9uD3i/bXjdyl0uMUrSR6AZHkY56VwitcilXoYYQ9cFybUTsP7s1C
         GF+EuOriX4KbZmUHsbaFVMbqNEV05Q47QhVv1Zwhfd5jPYC6rGU+2lL9Bjq5ctA7Ht5N
         nowQ==
X-Gm-Message-State: APjAAAUgGzbqW1wGwumFpNcKlGiqj/9FSaYILSO1Zo5GG6NnZUqZW5xG
        fi5tMTw4ndicX8uigE2AEPQCHA==
X-Google-Smtp-Source: APXvYqyvF8WqOEnDOKkQl2mto0QI+sqGXOJYxmZaqRoa8Klu1NtQWWmTfOdd/Szh3Agx5Dhifxokrw==
X-Received: by 2002:a17:90a:2467:: with SMTP id h94mr6695795pje.79.1576825204473;
        Thu, 19 Dec 2019 23:00:04 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v4sm11046290pgo.63.2019.12.19.23.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 23:00:03 -0800 (PST)
Date:   Thu, 19 Dec 2019 22:59:54 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     jhugo@codeaurora.org, robh+dt@kernel.org, ohad@wizery.com,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8998: Add ADSP, MPSS and
 SLPI nodes
Message-ID: <20191220065954.GA1908628@ripper>
References: <20191218132217.28141-1-sibis@codeaurora.org>
 <20191218132217.28141-6-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218132217.28141-6-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:

> This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 6db3f9e0344d1..e87094665c52c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -312,6 +312,14 @@
>  	};
>  };
>  
> +&remoteproc_adsp {
> +	status = "okay";
> +};
> +
> +&remoteproc_slpi {
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 8d799e868a5d3..014127700afb0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1075,6 +1075,61 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> +		remoteproc_mss: remoteproc@4080000 {
> +			compatible = "qcom,msm8998-mss-pil";
> +			reg = <0x04080000 0x100>, <0x04180000 0x20>;
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended =
> +				<&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack",
> +					  "shutdown-ack";
> +
> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> +				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> +				 <&rpmcc RPM_SMD_QDSS_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;

RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...

I did pull in a patch from Jeff that defines it, but when I boot the
modem I see the following error repeatedly:

[  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own



All the qrtr services seems registered nicely, so the remote does come
up before it goes down.

Also, adsp comes up nicely.

Regards,
Bjorn

> +			clock-names = "iface", "bus", "mem", "gpll0_mss",
> +				      "snoc_axi", "mnoc_axi", "qdss", "xo";
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			resets = <&gcc GCC_MSS_RESTART>;
> +			reset-names = "mss_restart";
> +
> +			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> +
> +			power-domains = <&rpmpd MSM8998_VDDCX>,
> +					<&rpmpd MSM8998_VDDMX>;
> +			power-domain-names = "cx", "mx";
> +
> +			mba {
> +				memory-region = <&mba_mem>;
> +			};
> +
> +			mpss {
> +				memory-region = <&mpss_mem>;
> +			};
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> +				label = "modem";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 15>;
> +			};
> +		};
> +
>  		gpucc: clock-controller@5065000 {
>  			compatible = "qcom,msm8998-gpucc";
>  			#clock-cells = <1>;
> @@ -1088,6 +1143,42 @@
>  				      "gpll0";
>  		};
>  
> +		remoteproc_slpi: remoteproc@5800000 {
> +			compatible = "qcom,msm8998-slpi-pas";
> +			reg = <0x05800000 0x4040>;
> +
> +			interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> +					      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			px-supply = <&vreg_lvs2a_1p8>;
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> +			clock-names = "xo", "aggre2";
> +
> +			memory-region = <&slpi_mem>;
> +
> +			qcom,smem-states = <&slpi_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			power-domains = <&rpmpd MSM8998_SSCCX>;
> +			power-domain-names = "ssc_cx";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				label = "dsps";
> +				qcom,remote-pid = <3>;
> +				mboxes = <&apcs_glb 27>;
> +			};
> +		};
> +
>  		stm: stm@6002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0x06002000 0x1000>,
> @@ -1880,6 +1971,39 @@
>  			#size-cells = <0>;
>  		};
>  
> +		remoteproc_adsp: remoteproc@17300000 {
> +			compatible = "qcom,msm8998-adsp-pas";
> +			reg = <0x17300000 0x4040>;
> +
> +			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			memory-region = <&adsp_mem>;
> +
> +			qcom,smem-states = <&adsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			power-domains = <&rpmpd MSM8998_VDDCX>;
> +			power-domain-names = "cx";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +				mboxes = <&apcs_glb 9>;
> +			};
> +		};
> +
>  		apcs_glb: mailbox@17911000 {
>  			compatible = "qcom,msm8998-apcs-hmss-global";
>  			reg = <0x17911000 0x1000>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
