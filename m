Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3924734CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 10:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjFSIEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 04:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjFSIDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 04:03:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FEE19AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:02:35 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-988883b0d8fso179810266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687161754; x=1689753754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGo8sNIcWdwlye/Tjma0GcxA7jjrG7wyO5+aiw9b3wA=;
        b=um+kjDu7qlbBwzw1ImLyQ+5W2xlJnQ7OJwm6Ox1TBquBCWDQ4Um/vsrtRc4B6SRUwW
         ikAyyeVE4eZr6FjGVZrMpTy2AE5QC7vVYP0L4qG+345cv84WFDJ395sUD2R8BQ2fDQie
         b3AZCWaDjERn8diHkHAXlyuANBLwQ79ytCJPkuxxCdTf/LSCp545K5lhNyMXkCYSWM4t
         lCYYq6wh+A0Rigj+h8w+H2yKHmEgGEqkEMKTsUUcv1ONX2PjD8RoTcjLYAxBSv2x06pC
         AWvIqBoyTdbKr1V3eshbeLQy5yP/FMK1Gi5a2GUl9kjuQG90o2SBRq59LgzkgijqQG/9
         UYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161754; x=1689753754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGo8sNIcWdwlye/Tjma0GcxA7jjrG7wyO5+aiw9b3wA=;
        b=JjdEKXt2KQuNv5vIUaHuYOlpWXecM1UCx66Ohaa+Ko6M08iYMfatTckp5XlhMIP6q8
         CpmyZjWQ2DX3t4gFC8puV7nQS0OnHuDbWFZVgz1UiUIYSqYq+63mlvhdr/2i29sF4Rmd
         +CoqqE+37FFcaP0/A0QG658kPuHlkHL0fGW/Qt5abZV5B11TIFcbx2BKvaQpHNqhJ3U/
         D60N8iF/NDImnMYqI+GPog6o6q82QAKuDAWqybDAWkawhZ/wLZHAZm3Fe9qyIQWPzY2H
         49rKbjRU0HEAB/FjyL4KyA5U+iiC1BIXD7cjNHmnei453EninIqikGxaFZrVYwa5f0E7
         Kd9Q==
X-Gm-Message-State: AC+VfDxjEaWjKLo2LmqQo0HijEFrZLW39u5vg//MGhZ7hLuC9DBUW+K7
        Bx6ylYirmiehzVgG7CfVrCY4Mw==
X-Google-Smtp-Source: ACHHUZ7VLYObAYEXOpmyo7L55eHtpCgSxMS8A7slj/hRoh53KjjXvu+sAw04xOSaq2eaN5UvqtjH5w==
X-Received: by 2002:a17:906:974d:b0:953:37eb:7727 with SMTP id o13-20020a170906974d00b0095337eb7727mr9082180ejy.43.1687161754462;
        Mon, 19 Jun 2023 01:02:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709064a1300b00988955f7b5esm1412804eju.157.2023.06.19.01.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:02:34 -0700 (PDT)
Message-ID: <f687638e-1c62-ee39-4c09-5783d98ca8f0@linaro.org>
Date:   Mon, 19 Jun 2023 10:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sm8550-mtp: add pmic glink
 port/endpoints
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v4-0-eb2ae960b8dc@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v4-5-eb2ae960b8dc@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v4-5-eb2ae960b8dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/06/2023 09:58, Neil Armstrong wrote:
> Add nodes to support Type-C USB/DP functionality.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

...

> +&i2c_hub_2 {
> +	status = "okay";
> +
> +	typec-mux@42 {
> +		compatible = "fcs,fsa4480";
> +		reg = <0x42>;
> +
> +		vcc-supply = <&vreg_bob1>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;

The node fsa4480 not take ports, but port according to bindings.

> +
> +			port@0 {
> +				reg = <0>;
> +
> +				fsa4480_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};



Best regards,
Krzysztof

