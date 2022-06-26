Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1635C55B2FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 18:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiFZQqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jun 2022 12:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbiFZQqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jun 2022 12:46:49 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48A8E021
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 09:46:47 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id lw20so14417174ejb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jun 2022 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3uSbsUQTtWHDDyfq7h4C4tPEfA3ZqeqwQ90k3O+YefE=;
        b=bi86anS8Rhs8OznvfEoGL3R8W3LF+muV61CswqOuU6B0jixp3sDEIvlnmXc4Ghei38
         lIQ6Oh8Ej6rC+BPpDLSiMEJY593bZrzdDeQjDN/uXThBiHginI2aWvhUOUKKWabk7zIb
         WJPOZ0AxxW1xWOPRSa2G2QJxSdicoYDOgOSYWDJnW2smavj37VN+uDENpCueEB/F0mZU
         85A1ynGpFHwIkkvX76OASipSKuIHyd+ELZU1PKVn+axAJgAPmbyFjntNlOROxYyBAKD6
         MNdRqAI33Lsb/u8ftpReIb0HQCX/oDvZvUTzb0yHQz/ov94Pux8JTYCdDiI3wzqTL1Eh
         n/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3uSbsUQTtWHDDyfq7h4C4tPEfA3ZqeqwQ90k3O+YefE=;
        b=hG+wT8n/UgUw4xv2ArfSlPlIuWs7ZIiMLyPUPeZ7TwtJbTEHlnWUuW7chm7g/4DCen
         eiFRUxNhuhcoKeLzcOFZ0KjvKF7Gnlq5tMgDtWkHL5E+5qQv05GT/GiPaJkTVjegGN4j
         ghpWn5s0HpkLOWl/lEqCJY4POdp/QL4773/n+bjBb4duTlAlES+Ady0kV01Q6rqekz7k
         47Iuz8c/mpGXgw4FXYcbIVjeLMxcN16RK7M7bYjZfZyG0o36BdgGVsj3PCtpB6ln0KZ4
         34uxQAqoMYz6K0+1b0BRgrGQ0tZQXUUtEe8bf6rmWwIiyMGt6gTSEnaENwb4EVHvHS6M
         /uDg==
X-Gm-Message-State: AJIora+mvDUeFqHKAXCSJp/E5dqE+oIYEcFnTjMzjLzARpW3wgykVwuW
        f3BXwljFEb6u2+lUMjhq4ayCfQ==
X-Google-Smtp-Source: AGRyM1uZ8viSbLJ3oHZMR5FdT5XZl9ryMTWP5UGrod3SslbNxDgZ539ufHkNOoSE6tNuWeduCMqGAg==
X-Received: by 2002:a17:906:4fd4:b0:722:f223:8d86 with SMTP id i20-20020a1709064fd400b00722f2238d86mr8792700ejw.558.1656262006237;
        Sun, 26 Jun 2022 09:46:46 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906711600b00722e4bab163sm3877785ejj.200.2022.06.26.09.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 09:46:45 -0700 (PDT)
Message-ID: <7293699d-e762-495c-f3e8-58fcc39c8cce@linaro.org>
Date:   Sun, 26 Jun 2022 18:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: extend scm compatible strings
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~okias/devicetree@lists.sr.ht, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220626114634.90850-1-david@ixit.cz>
 <20220626114634.90850-2-david@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220626114634.90850-2-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2022 13:46, David Heidelberg wrote:
> Follow scheme where device specific compatible is first,
> then general compatible string.
> 
> Cc: Robert Marko <robimarko@gmail.com>
> Cc: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
