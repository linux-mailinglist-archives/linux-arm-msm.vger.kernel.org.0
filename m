Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D8D673A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjASNdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjASNdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:33:16 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3200C78AB1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:33:14 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r9so1880027wrw.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6PeiBNsTffvX/+4lco6RlfjzIGjTxljWE9nlGGQ60s=;
        b=u9CLrJA58gIJ7sWycV0DKTP4oJj5TQqH5ZpZF6mne+zMV/Amze+sz05Vm627nA6l7f
         W7W6Jorg0uzHv9qA90odd7XDydVt4meLs1HgjZUSbbCLSp97FjwdnCkRKZtQcniqhgX1
         f/9XJYTjXPDnBoV/Prnfft4b9RKWK8zd5sHmn0I/t5pbi04eQc+ePtOkzq7+zx+v+HK+
         gemTi+gJNzg56DfmuI1iCTmuKZ9CJHydXwaygOCYmaXOovt/2AMrYuSizXHjR09YAbOY
         n0s7odIw6Gf4RQXzXN8eNJi8dzHv5zt90aJEL2Pdm86dukdKnyhTRsWP2WeHQaZSxObn
         pjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6PeiBNsTffvX/+4lco6RlfjzIGjTxljWE9nlGGQ60s=;
        b=nmwuXEGAPYUxu9Te/IlySMhwOUh1ans2vQeQBUxfjAxIRr7czog9X4qIcFCyx9qMZW
         Q11JaAwrVaPF2ZfJWY0cYmi2dPgMl/u4pv7feKdrxS1bI0SYC09k+aXxqgwb6wYK3bJw
         Hb8RCo2CrfG/PRLs0fjvIz5nkdC7rMfdLVmRJIcjEr3rtLDwmaQc8L/ULLDa0ir1eO+r
         sLRaGivlBFI5RuADwc2l8dAHo0cW+vWLkdXQKWA7M/mZhuVcQC4866TvcLkGWtL22c5w
         ziBAeNEvRC00z+02UWakrCXOFUk0xAEFoikNJdrCdQujNH093ZVDFruYWDPr+ETzelk5
         eSwQ==
X-Gm-Message-State: AFqh2koeDKrKVFhwMmntVz2PhQ1Z9YvYKuFcnek/saWrWLCnaeP+tVR7
        Z00Wq+W1kKv5KHYbHMknttdbvQ==
X-Google-Smtp-Source: AMrXdXtpARPAFImaw2quJx+/Q2zAHbUDSbv0xp/JTokBa7EhBS3eWwexKNtaG9aCwUtv/pIP/LpQvQ==
X-Received: by 2002:a5d:66c9:0:b0:2b9:d6ba:21ef with SMTP id k9-20020a5d66c9000000b002b9d6ba21efmr9518068wrw.65.1674135192733;
        Thu, 19 Jan 2023 05:33:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b00268aae5fb5bsm34369555wre.3.2023.01.19.05.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:33:12 -0800 (PST)
Message-ID: <ffa9e555-f351-d05c-0524-6bc81b88120b@linaro.org>
Date:   Thu, 19 Jan 2023 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: sc7280: Update lpass_tlmm node
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-6-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Update lpass_tlmm clock properties, as different clock sources
> are required in ADSP enabled platforms
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 674b01a..232e1dc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -167,6 +167,15 @@
>  	};
>  };
>  
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +
> +	clock-names = "core", "audio";
> +	reg = <0 0x033c0000 0x0 0x20000>,
> +	      <0 0x03550000 0x0 0xa100>;

What is the difference? The length of audio IO space? You need to
explain this in commit msg.


Best regards,
Krzysztof

