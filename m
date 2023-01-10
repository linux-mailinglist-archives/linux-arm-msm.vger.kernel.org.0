Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01669663EBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 11:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238228AbjAJKzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 05:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238268AbjAJKzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 05:55:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DD567BD3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:55:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v2so286802wrw.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=steAEzh8bEsrRFaPtR5QEO7PwY+TRudVvhGkJEjyxrM=;
        b=nkM28h88WcckND4JJdWLKnwnMGI7HvjWyoei7BfOUVO5rbzPCJNQQT8oVhvU/hfkZ0
         Im4Bw75GhShlHBMIsHA9UlmLR6qIGBTYNsvGeEuxhWGQ4FEzUq86bP5bxdwhzmvHIHai
         g5hzX7u9clSMTahY9oWaa+Ly6k/sel8soNjmQxUfm8+TF/XiWUhntfKgwvYcSxodAu+L
         Wloxjj0dlecVgpgKP8vvsXNVAcIDBPMtkYhcSQvfFGWaIcZX1ymQ2IyH9HyFmZfnKoK8
         Zo32R8jVe05037Wt3Wi9GpCov4CLScu8d3FpfPTahyF6i5hfO24U+4bx9OMMyHhyO4dp
         yL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=steAEzh8bEsrRFaPtR5QEO7PwY+TRudVvhGkJEjyxrM=;
        b=UPBxHTSS+mKyC1AvsxQsO8RHielBVNagAsFlrV/uiY+p7+qUmft+i7cUw0y8FPCiUo
         ipc4YUD1n6EmCub/kFiUokovlGtal3axeatzCJ4UaKwWKDQR5LXQF9eD8+Rl/UX3juJH
         ClTfQK05wEg8GK37brbUxf1CrZb0AcWFiv6qNkGZpKE4QC1P447sgkzX4N8ktc2DI2fF
         UAcOXsMgxD4ktQ76rylvjL/7IrmwXR4vEIhcPspQfWkc8o/DNfsd1IGkT881HmSMy1ne
         T7yTPoN6Ut7mTVkVLbyEcj3vE5f8EiiZnKgjbbrYWsip41HRBXHfxQWCtLpwcwR1VU81
         uxLQ==
X-Gm-Message-State: AFqh2kq974mjPpzsZWkuLCXnxFNkBQgeYsH6BTt+j5sNdnoquTF7+CiE
        fHe2YQbFePXfGUc2PZ98Y80pfg==
X-Google-Smtp-Source: AMrXdXsWypeJy1KwetU1TKmnb3+brikmWgsmmvQUMmlaAG7xOOcZoLypIut/nX7oHHCRe/05wwxTeg==
X-Received: by 2002:adf:eb09:0:b0:2aa:1121:1b79 with SMTP id s9-20020adfeb09000000b002aa11211b79mr13601321wrn.25.1673348139731;
        Tue, 10 Jan 2023 02:55:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020adff611000000b00236488f62d6sm10703537wrp.79.2023.01.10.02.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:55:39 -0800 (PST)
Message-ID: <26589373-4ed5-10c5-9b49-3edfa78c71e6@linaro.org>
Date:   Tue, 10 Jan 2023 11:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 1/4] dt-bindings: clock: qcom,sc7280-lpasscc: Add
 qcom,adsp-pil-mode property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com>
 <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672849297-3116-2-git-send-email-quic_srivasam@quicinc.com>
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

On 04/01/2023 17:21, Srinivasa Rao Mandadapu wrote:
> When this property is set, the remoteproc is used to boot the
> LPASS and therefore qdsp6ss clocks would be used to bring LPASS
> out of reset, hence they are directly controlled by the remoteproc.
> 
> This is a cleanup done to handle overlap of regmap of lpasscc
> and adsp remoteproc blocks.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

