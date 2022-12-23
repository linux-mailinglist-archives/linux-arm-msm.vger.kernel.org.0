Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96647654E36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 10:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbiLWJQP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 04:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235712AbiLWJQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 04:16:14 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87D136D52
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:16:11 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p36so6321783lfa.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BAXn7WRycNRH5XCyQmakEK/X0wSaThgtq8QydfTvChg=;
        b=FpNsM2s7PSNkuBlNl/27Jb0pSGF8PYGWUUZJQ1sLpfldxx2E1MElUJkE4cjABD3rc6
         JIxqsRshWSzl+/LBTV934JwGkh+S4oyiTenmtbyYDlHMG5zQMeYaFnjwfh1JmJDzDTUd
         Gl8d4WO3j1LP6Yy3prEzV5xp0UfeVmSJ4+y6eE0ovZksBvSvvfObricrz40MfGj1rfjy
         mom3fllbtFaP6cagYc/ihRk66PAxMz6CwS29y76GopzXLSMmdEtXAgMHIbTaa5FKh6ou
         31dNIdjJShENRcDs2URxIWSFqRfFz5NEAFPlf6WWETHI1QtJ/ZCTaSTZktKkHSo71Cbf
         0/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAXn7WRycNRH5XCyQmakEK/X0wSaThgtq8QydfTvChg=;
        b=Z1R13nthYsunDWhjzq/c1I8adReoMHUvyhry238MYQ+f3eP6BhWfsG+ZB2LKRKz2hu
         44tq9pbn5dZxUUdaNFkg7//F4Fmbh3tSNT8A8CDtPfW8TQDcTLIpx3o9NETEeMB969ZP
         z5mIEjBaTgosIMOmQd9J56yXE98ImRL3nQ2lSt8yQoMnR3w3BKG//9rVv6MPF4BgZQlj
         I/nTQ/TRx3ag4F7UAM5YfPsGjQDoel9Kmd+lu3q1G3inzByHVH/mIGd/enNbhEgKjdos
         KH5a8rv6g7T/GU0nD8VC8WmiRSx8AhqHM8Q+r9eLG+XLNCWIeb7cqiVElM7sbqyF7fzC
         9ZpA==
X-Gm-Message-State: AFqh2koMGeP05yrO2ZfH7Xot4u13OqXC6QqaaWN265XN0COYsw+lglki
        juat+BkgBMiiUGjanCBPzChmEg==
X-Google-Smtp-Source: AMrXdXs3vf/tFkUoxRpr8jN1nvzAYJ0GA8orgeu0gdH9DNTsNxZIdi2j+AfccZfXPnQnqIf7uLmkxA==
X-Received: by 2002:a05:6512:2213:b0:4bb:7028:f6b6 with SMTP id h19-20020a056512221300b004bb7028f6b6mr3188013lfu.49.1671786970274;
        Fri, 23 Dec 2022 01:16:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p23-20020a056512139700b004b577085688sm449822lfa.82.2022.12.23.01.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 01:16:09 -0800 (PST)
Message-ID: <f4a4b090-0b13-1597-c080-b1cb36bc9571@linaro.org>
Date:   Fri, 23 Dec 2022 10:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sc7280: audioreach: Update VA/RX/TX
 macro clock nodes
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        konrad.dybcio@linaro.org
References: <1671702170-24781-1-git-send-email-quic_srivasam@quicinc.com>
 <1671702170-24781-7-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1671702170-24781-7-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 10:42, Srinivasa Rao Mandadapu wrote:
> Update VA, RX and TX macro and lpass_tlmm clock properties and
> enable them.

No. You need to describe why you are doing. Not just "Update".
Everything is an "update".

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index ce5d69e..a0061ef 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -119,6 +119,49 @@
>  	status = "okay";
>  };
>  
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +
> +	clock-names = "core", "audio";
> +	reg = <0 0x033c0000 0x0 0x20000>,
> +	      <0 0x03550000 0x0 0xa100>;

1. Why are you doing it?
2. Why here, not in DTSI?
3. Does it pass dtbs_check?

> +};
> +
> +&lpass_va_macro {
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +
> +	clock-names = "mclk", "macro", "dcodec";
> +	power-domain-names = "null";

???

This code looks like not taken from mainline, but some odd tree. Please
work on mainline. Do you see anywhere names called "null"?

Best regards,
Krzysztof

