Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B8F6B8346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCMU7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjCMU7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:59:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B67011EAC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:58:26 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id d13so3271374pjh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678741102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2U9HWf+sA0AVg4GQ6mhyf88FiJRsJOROsFvX9o9iAQ=;
        b=qiMZqhnHJoEkAcldGIp5VLSoiJ1HoRNLJpTkAcL606wau+CZ5F50xtoQNfzoh+Dr20
         WQAVwPVtZ+h5JR2HZO9NZ44x2WFz5D/a73+Nh1NbnEH0cmfu9nOrIbA47XAxgNBndD7x
         Ile+yocu1jqQxeD6M/W30bU3Lmkjur6lr3OTjHIQqg9ZHg37GoeVi6dLCcrUqtSs3neL
         rKLieywLiDBp/ey1kIVLiL0wO2K2Y5722s3ZFR9bxXNH/rcPIGf0va5LkklNxksQ4/yR
         bbxYRKKZbTjsNGiycvaTAiFP8TbOXgDnLhwMidTchh82UtZPHCGTFo/mzRaN9AxA866K
         jWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2U9HWf+sA0AVg4GQ6mhyf88FiJRsJOROsFvX9o9iAQ=;
        b=WodCoIsvF/iW3yh23nNDqP6QD8ISMEJCcXmUvqMsI3GR9KpEYyGb9d8wwqDkurjE9R
         Av0JaTMEGLvmqr2gw9zVxFrdMS+sg89OV0lbpsNTaRd0wmXgX4YaCjxHhWXl8V954dUf
         dP+ye+6+4wR+gqzpa0Qcf111VyLPUYewbhuR7Yw7x8CzC1e0q3gjLFZ+5oRj0YAhfIYL
         fp8SzC7WWR6s/UBcH1BZD3OgmctWpJdZkH8GatmHRGWjeuxTKqEu0tBxpBRM8WrumaEt
         yxLm0sph3EwuN7lB0QUmiBpg2Q6MVzKdnyEMz39hqXHlbxpslMw9CCvFfTP1JKh/SaTr
         phFw==
X-Gm-Message-State: AO0yUKXt09a3uzoNib8thdNuVFCs9TGcnEXWvtdhqjs8t/G3coKv75Bf
        YuOfyegu0KSy0TCidA1+z1Jd7baX2+7z9WOyiH4=
X-Google-Smtp-Source: AK7set8T/NTAAjk73Imef5Nz7v59fZZ963ggOdpW0Lw4pjUXEgdffVMNaSKrNZzqy9OcJFcuXyfHvQ==
X-Received: by 2002:a05:6a20:7f8f:b0:d0:15c9:4e67 with SMTP id d15-20020a056a207f8f00b000d015c94e67mr31698886pzj.19.1678741102356;
        Mon, 13 Mar 2023 13:58:22 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e? ([2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e])
        by smtp.gmail.com with ESMTPSA id z22-20020aa791d6000000b005ac8a51d591sm163626pfa.21.2023.03.13.13.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 13:58:21 -0700 (PDT)
Message-ID: <5922cd55-060c-d1b1-0eb2-0875439e4268@linaro.org>
Date:   Tue, 14 Mar 2023 02:28:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add remoteproc nodes
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20230128054256.2100501-1-bhupesh.sharma@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20230128054256.2100501-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 1/28/23 11:12 AM, Bhupesh Sharma wrote:
> Add the adsp, cdsp and modem remoteproc nodes to sm6115.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
> - Depends on the dt-binding and driver change submitted via [1].
> [1]. https://lore.kernel.org/linux-arm-msm/20230128053504.2099620-1-bhupesh.sharma@linaro.org

Gentle Ping. Since the dependencies (dt-bindings and driver changes) 
have already been merged into linux-next, this patch can now be applied.

Thanks,
Bhupesh

>   arch/arm64/boot/dts/qcom/sm6115.dtsi | 184 +++++++++++++++++++++++++++
>   1 file changed, 184 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 3c66f998a81b..3540cd24af5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -1309,6 +1309,39 @@ dispcc: clock-controller@5f00000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		remoteproc_mpss: remoteproc@6080000 {
> +			compatible = "qcom,sm6115-mpss-pas";
> +			reg = <0x06080000 0x100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover",
> +					  "stop-ack", "shutdown-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmpd SM6115_VDDCX>;
> +
> +			memory-region = <&pil_modem_mem>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +				label = "mpss";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 12>;
> +			};
> +		};
> +
>   		stm@8002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x08002000 0x1000>,
> @@ -1921,6 +1954,157 @@ funnel_apss1_in: endpoint {
>   			};
>   		};
>   
> +		remoteproc_adsp: remoteproc@ab00000 {
> +			compatible = "qcom,sm6115-adsp-pas";
> +			reg = <0x0ab00000 0x100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
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
> +			power-domains = <&rpmpd SM6115_VDD_LPI_CX>,
> +					<&rpmpd SM6115_VDD_LPI_MX>;
> +
> +			memory-region = <&pil_adsp_mem>;
> +
> +			qcom,smem-states = <&adsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +				mboxes = <&apcs_glb 8>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x01c3 0x0>;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x01c4 0x0>;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x01c5 0x0>;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x01c6 0x0>;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x01c7 0x0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		remoteproc_cdsp: remoteproc@b300000 {
> +			compatible = "qcom,sm6115-cdsp-pas";
> +			reg = <0x0b300000 0x100000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmpd SM6115_VDDCX>;
> +
> +			memory-region = <&pil_cdsp_mem>;
> +
> +			qcom,smem-states = <&cdsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
> +				label = "cdsp";
> +				qcom,remote-pid = <5>;
> +				mboxes = <&apcs_glb 28>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x0c01 0x0>;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x0c02 0x0>;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x0c03 0x0>;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x0c04 0x0>;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x0c05 0x0>;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x0c06 0x0>;
> +					};
> +
> +					/* note: secure cb9 in downstream */
> +				};
> +			};
> +		};
> +
>   		apps_smmu: iommu@c600000 {
>   			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0x0c600000 0x80000>;
