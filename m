Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5447072BA66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 10:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbjFLI0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 04:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbjFLI0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 04:26:31 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA1010E4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 01:25:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso7283848a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558353; x=1689150353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFeo7eqtN3fCmyQTtWielQM7xz42Mq4kjBmnboVmk4Y=;
        b=YOWZoyzVVDwbAwL7zO9aI6GFmBEBBC9wQoCY2lhIabksMfnsFMDM79fEBVPKV+HsmN
         KP6jkmqn2OJyj8qtAWTND9JWJ26XTj7+LKkwuYHJyaAOKk8ANE7ngVw9i6g+nJlGk6UA
         dlrLcSIKGHHPB7s1suaR0ebh0VXSNEKqFrV5TynNYVVa7Gl/hJaAHc0NVXxoi1YIqh2t
         B0DalHFUVBt7YQy9KFzoPnq+EeeAH17icsztVY30rfSR4USKqvANMY6cU43cUn+/eGTe
         gpOPASvTRujvdh+yikfdVZ5ugyVGzZD+jfPX+dXV8GBAa/IzPQouSbPsWM0TYB/GhhAS
         QAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558353; x=1689150353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFeo7eqtN3fCmyQTtWielQM7xz42Mq4kjBmnboVmk4Y=;
        b=gLZ14YZ9Eupw8oKd2n9vCCf0DAaqzcCax/CGyTGoZwG2yxk6WROzv9fBbc0bLZ3gwq
         85jK/yZgrIZkHLW+qUYAJJoXijpP0o1wLyqmxBUndl5/ZQZSekk3XRhRlRNQXafNQrff
         CuM2UO3pq8JD8pFUygnsZ5VnXReDlLujzrPdvlnmH/vfrDf6448Pfh0DEsCSl4l/2xIT
         pYD92lrPYL1nsgPTOO4s7Zq2cxtINSOXKwpjuTmeQM6t71fcmQHxXYLeg/Nkk5hD3UPF
         ciWbkciKMgAQDs0EIJam9S/s0wgAVBHj+osdDuj4NTNPEOhutV808WxfX7ZE5RR7/EzY
         DfPw==
X-Gm-Message-State: AC+VfDzckSYz+hFHFF2NcM/S7KaY04wKFLrqQ9Ue32s5xamaWsASv8nR
        EsRZDm4/vzy95CvrBck8Fx0h9w==
X-Google-Smtp-Source: ACHHUZ6ruFjU1gbk4CweBHpq54i0ElmXHeNzejKSJqMDXR758cQX1R+eDjjaMHhn/Wrl6GUSQpPhtA==
X-Received: by 2002:aa7:d49a:0:b0:50b:fd52:2f4b with SMTP id b26-20020aa7d49a000000b0050bfd522f4bmr5469118edr.24.1686558352887;
        Mon, 12 Jun 2023 01:25:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm4784947edo.78.2023.06.12.01.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:25:52 -0700 (PDT)
Message-ID: <ec466019-cdd2-d372-b4df-5edfe530e63d@linaro.org>
Date:   Mon, 12 Jun 2023 10:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add LPASSCC and reset
 controller for SC8280XP
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
 <20230608125315.11454-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608125315.11454-2-srinivas.kandagatla@linaro.org>
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

On 08/06/2023 14:53, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) clock controller provides reset
> support when it is under the control of Q6DSP.
> 
> Add support for those resets and adds IDs for clients to request the reset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

