Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7772637B80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 15:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiKXOdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 09:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiKXOc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 09:32:59 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1C4776F1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 06:32:56 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j4so2865437lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYPcwuN0ixxBPz8vi1NczLJaDfU7Jd6IdhNMvi6HWb0=;
        b=D5u8AgJcYgd5joOZvehXrdY4ax0HefmPst5qs2Ll24ByNjMvjqsM24UzcM0L+o2bid
         P4VCmAsFX1QmnRolJ1Tg+FTWF4GbcWeyKmUZvi0vz0cIfhO/z1HjrwinN/QH0DAJfCq7
         eFFtorRUmIZ54wbGWkjBY8derySIAwdBDtB67k8k+xo+b9gcMpbUETbsTLXR+3/g2/U0
         6Wc+XqlOUCs3t8AbW7C3kt7N4uVgdurS6xudUx46ATHi2J0GXrw3sxBBNIKNqMrc9TDF
         70lhe03Q/wiT1N/TpkFdcSKgVS8TAwtOYVWkEh8P+D1AO/IyZSTX4QG591EtepYD8ET2
         97CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYPcwuN0ixxBPz8vi1NczLJaDfU7Jd6IdhNMvi6HWb0=;
        b=TM/dld700svXWOBiQBJ4LZm6Mpd+2uwrFhcYl/FlIiojOYJaduPaPJQNNNocgX7Vqj
         T+j1cbMf/9J1HN8ZJ3DL8BjOFG3KNL+BT77UbyZEqxHMGG3IN782MlsMFK4JITNkuzk8
         1Or2kc1uAJsWcWCc36pWR+JN3s+/lER5uDupfAmTHCA+v7h8Ns4AXjaxBr4s8jfaTQc3
         7jWkmheD6jGQmE6EVfe8bP+Y8B8Y6UMsbRRaKMCplL+0lKskU1BYcAZjeXGcducSQ6+l
         WQDrpadnH6D+0dd5NEbzV9kzOebfxk1IrsbL/MitJGgaSc8xIxABOq6+Ju9X6xZIBTL6
         whVw==
X-Gm-Message-State: ANoB5pkfjwp+UwelvcmBwLCxNS0+Pom+SVD6gm54Aue9mMzV5gtqNrLl
        QSjFJQ8Nfi96uZQPOJxVoU0a/w==
X-Google-Smtp-Source: AA0mqf4bKcysvolziy0EL4RTYdY5BJl7S8gZPvthaVbhBr9/keBrnI2vpdR0tAfaU7q/p4iv+lD0hw==
X-Received: by 2002:ac2:44ac:0:b0:4b4:efec:b4c9 with SMTP id c12-20020ac244ac000000b004b4efecb4c9mr1963916lfm.276.1669300374556;
        Thu, 24 Nov 2022 06:32:54 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id e8-20020ac24e08000000b00492ceda336fsm133145lfr.278.2022.11.24.06.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 06:32:53 -0800 (PST)
Message-ID: <9016a729-4c7a-4252-a667-3c6536eb2038@linaro.org>
Date:   Thu, 24 Nov 2022 15:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix PCIe DMA coherency
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221124142501.29314-1-johan+linaro@kernel.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221124142501.29314-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 24.11.2022 15:25, Johan Hovold wrote:
> The devices on the SC8280XP PCIe buses are cache coherent and must be
> marked as such to avoid data corruption.
> 
> A coherent device can, for example, end up snooping stale data from the
> caches instead of using data written by the CPU through the
> non-cacheable mapping which is used for consistent DMA buffers for
> non-coherent devices.
> 
> Note that this is much more likely to happen since commit c44094eee32f
> ("arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()")
> that was added in 6.1 and which removed the cache invalidation when
> setting up the non-cacheable mapping.
> 
> Marking the PCIe devices as coherent specifically fixes the intermittent
> NVMe probe failures observed on the Thinkpad X13s, which was due to
> corruption of the submission and completion queues. This was typically
> observed as corruption of the admin submission queue (with well-formed
> completion):
> 
> 	could not locate request for tag 0x0
> 	nvme nvme0: invalid id 0 completed on queue 0
> 
> or corruption of the admin or I/O completion queues (malformed
> completion):
> 
> 	could not locate request for tag 0x45f
> 	nvme nvme0: invalid id 25695 completed on queue 25965
> 
> presumably as these queues are small enough to not be allocated using
> CMA which in turn make them more likely to be cached (e.g. due to
> accesses to nearby pages through the cacheable linear map). Increasing
> the buffer sizes to two pages to force CMA allocation also appears to
> make the problem go away.
> 
> Fixes: 813e83157001 ("arm64: dts: qcom: sc8280xp/sa8540p: add PCIe2-4 nodes")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Looks like 8450 should also be like this, good catch!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 27f5c2f82338..7748cd29276d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -854,6 +854,8 @@ pcie4: pcie@1c00000 {
>  				 <0x02000000 0x0 0x30300000 0x0 0x30300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
> +			dma-coherent;
> +
>  			linux,pci-domain = <6>;
>  			num-lanes = <1>;
>  
> @@ -951,6 +953,8 @@ pcie3b: pcie@1c08000 {
>  				 <0x02000000 0x0 0x32300000 0x0 0x32300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
> +			dma-coherent;
> +
>  			linux,pci-domain = <5>;
>  			num-lanes = <2>;
>  
> @@ -1046,6 +1050,8 @@ pcie3a: pcie@1c10000 {
>  				 <0x02000000 0x0 0x34300000 0x0 0x34300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
> +			dma-coherent;
> +
>  			linux,pci-domain = <4>;
>  			num-lanes = <4>;
>  
> @@ -1144,6 +1150,8 @@ pcie2b: pcie@1c18000 {
>  				 <0x02000000 0x0 0x38300000 0x0 0x38300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
> +			dma-coherent;
> +
>  			linux,pci-domain = <3>;
>  			num-lanes = <2>;
>  
> @@ -1239,6 +1247,8 @@ pcie2a: pcie@1c20000 {
>  				 <0x02000000 0x0 0x3c300000 0x0 0x3c300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
> +			dma-coherent;
> +
>  			linux,pci-domain = <2>;
>  			num-lanes = <4>;
>  
