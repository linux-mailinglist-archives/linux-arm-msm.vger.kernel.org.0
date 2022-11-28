Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B9063A8A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 13:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiK1MpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 07:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbiK1Mo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 07:44:56 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CD06568
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:44:55 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g12so17162626lfh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wTo2gW+4x5gFndSLbB4s+nQn/GLvI6rLokgtLqY6ts=;
        b=WdB9AjzSRXkmVkdu6kO7Jrb98eEuh0kiOaUCU9H60cuTXUNZCHUh0Ab5sjjcynBV9c
         RiLIPLuevW6E7+/kyCB2DaRMW4ieB470W0ljDYWp2FshNFcqTF+KakV6yZHy8mN4dorf
         duigqh6VdoxRFlunLxQyed177wCDduiJ0EwfCfQMujC2uUBeiehg3irr5izYtYvPKaAL
         kao9IkvN5vNdLs00UC+Ma9O324lYwt+4QQrmMcwziL9wxKa1KkvuokXnyj7z9KASQv9A
         TAokMQ2Q345WhmSHjrzfIE/uQkIKUwzpWx381QAkmEy0hu7hoXbusEOCOONawfKfvjTg
         s+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wTo2gW+4x5gFndSLbB4s+nQn/GLvI6rLokgtLqY6ts=;
        b=uSDgJyBn9VgWq2uPLE4PuZVRLHSYXhO2QraDSsK/hi14jk3rmiIGFu/TRdKBRSgCSI
         T5JHetlQCDa0f5JZ7F1LmwOidHu8tW9Z53tc3ZdiZUFgES2xlSoQO8t8bvgOnX9MbbsV
         kCu0Y0mLpWMW70x0kDL9oK/7XnZNAp9UNzjV0xGDQSYXMRTM9YOef90UVxnZ0SKPfFh7
         XRl8xlnhYBDU/udCbBy+Z7lv0j0CiNRfS4xvVxeivypshlvQEEgHLrs91bKLQgiCWrDt
         N4yBlKWtldEz69j02jPkAgujUJOZZAAIKUFGgtBoOG314mrM0NtOqoF4nwMlr3+HzWRS
         I76w==
X-Gm-Message-State: ANoB5plrJgZn0ylMRaaQkZJ+84iVX1YIa9Ls8/qPbdT5goTGjWw5NPHB
        POdHQcmsnd7eBlHmP8ckt7bg1A==
X-Google-Smtp-Source: AA0mqf7Z4eXzCbVkXYYQfmIdxjyny47M98ynPs70FSWLXTQfQOQmGXDfEo4U5PRxNRFmMKXpnJ8e1Q==
X-Received: by 2002:a05:6512:2985:b0:49a:d9ae:3038 with SMTP id du5-20020a056512298500b0049ad9ae3038mr11795884lfb.44.1669639493946;
        Mon, 28 Nov 2022 04:44:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z25-20020a195e59000000b004aa14caf6e9sm1735425lfi.58.2022.11.28.04.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 04:44:53 -0800 (PST)
Message-ID: <30be93a3-c57f-d4c9-c154-6f12b9dc5dc5@linaro.org>
Date:   Mon, 28 Nov 2022 13:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: Add soundcard
 support
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221123104342.26140-1-srinivas.kandagatla@linaro.org>
 <20221123104342.26140-4-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123104342.26140-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 11:43, Srinivas Kandagatla wrote:
> +
> +&swr1 {
> +	status = "okay";
> +
> +	wcd_rx: wcd9380-rx@0,4 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 4>;
> +		qcom,rx-port-mapping = <1 2 3 4 5>;
> +	};
> +};
> +
> +&swr2 {
> +	status = "okay";
> +
> +	wcd_tx: wcd9380-tx@0,3 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 3>;
> +		qcom,tx-port-mapping = <1 1 2 3>;

I think I solved my head-phones one-channel problem.
This should be <1 2 3> and in DTSI:
qcom,din-ports = <3>;

The downstream waipio-audio-overlay.dtsi says:

 56                         qcom,swr-port-mapping = <1 SWRM_TX1_CH1 0x1>,
 57                                 <1 SWRM_TX1_CH2 0x2>,
 58                                 <1 SWRM_TX1_CH3 0x4>, <1 SWRM_TX1_CH4 0x8>,
 59                                 <2 SWRM_TX2_CH1 0x1>, <2 SWRM_TX2_CH2 0x2>,
 60                                 <2 SWRM_TX2_CH3 0x4>, <2 SWRM_TX2_CH4 0x8>,
 61                                 <3 SWRM_TX3_CH1 0x1>, <3 SWRM_TX3_CH2 0x2>,
 62                                 <3 SWRM_TX3_CH3 0x4>, <3 SWRM_TX3_CH4 0x8>;

I just don't know what how to trim the port config properties - we
have there four entries, but channels are only three?

Where do these come from? The downstream:
asoc/waipio-port-config.h / lahaina-port-config.h
Do do not have port config for this SWR.



Best regards,
Krzysztof

