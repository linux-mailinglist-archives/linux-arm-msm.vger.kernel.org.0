Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D332B6E2FCF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjDOIxc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 04:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjDOIxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 04:53:32 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8121340E9
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 01:53:30 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gc14so6371111ejc.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681548809; x=1684140809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOyFQ2wFGtSd8qaPjXT+9Ch8QWN9JK4V7LI6iLKCdxk=;
        b=KkL4AGpMgpNBq83/uaElao2EPAjn0pkvMThOd8qWzeji4frQNXEIOAzf2Udim43+eZ
         YBNVcGInTyrCgxWf7mmxEdfUTOPqTXDxBfHRjKQ005wWWC3bqaEK6heJYR67Ftuw0GDw
         TQitN2A9iA/cGk8jdJ4yAYeREuQk0HN7QMFytVtAcCAOFe3by/QyW6n7oomKTF97laqq
         yvx2LEza1inDiaSbdIRyeULiC715JlZK3XkIcQz7NR4a2+2GDqmw64LDy/i00rM1mQFr
         UzuNBC+3pS3iD9dtR1YiJ7FvSIWk3GkkVIwapICUtvm0K8k2V3LSctQKv/ExTEgyInMh
         Sz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681548809; x=1684140809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOyFQ2wFGtSd8qaPjXT+9Ch8QWN9JK4V7LI6iLKCdxk=;
        b=fGGxqH13Hi5rz/KqHRifDjZesb9Z0UFwO9wvNRb8xV5NxZ7HW7TRehSgkMK+ArWQsC
         wwaX+qbp9YOo/xwBzIORaTxKg7UazcXXtzmGplQc07hG+3Bgxj5ADL60UK0idOaqcfiB
         xrVNgFQF47dmYmyIQlAqYg6j+gstcEhcP8zua+k9EO7Ssqg1iYLV75xQ03S+mvGnxFJE
         QC2oWp8mGILOhelL5fyNyJJ+14Lrx2prWsi2vW/OGHdqLdWJOX7FjqQ6DL9tic7KZBpN
         2Yw8sn+vS1vxZPn39ga7BLfERpn0jnnDlJTgEEks0+GO3jXIK3AYLrVV9KYtfOy59Cnz
         lAUg==
X-Gm-Message-State: AAQBX9eSCBRqsvde5Oh0SAfEjWT2HkmP8KNm89v/NhD+FZDVmGBotUgi
        X6My6JBrwNiJ+Q8BVu7N8fk55Q==
X-Google-Smtp-Source: AKy350ZVKdn9XyFdxnaJQ81W2jGronzMUZ8Zykc6G0YKNLnZ8O0zBY9XHC+PhWEvrcKlpNB6yYKxiA==
X-Received: by 2002:a17:906:6a94:b0:94c:a08c:3be2 with SMTP id p20-20020a1709066a9400b0094ca08c3be2mr1364721ejr.63.1681548808988;
        Sat, 15 Apr 2023 01:53:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b0094f2d38896esm193732ejc.65.2023.04.15.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 01:53:28 -0700 (PDT)
Message-ID: <cf45c33c-0604-0a37-3546-68ccc518c6de@linaro.org>
Date:   Sat, 15 Apr 2023 10:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: qcom,spi-qcom-qspi: Add iommus
Content-Language: en-US
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_msavaliy@quicinc.com, dianders@chromium.org, mka@chromium.org,
        swboyd@chromium.org, quic_vtanuku@quicinc.com
References: <1681481153-24036-1-git-send-email-quic_vnivarth@quicinc.com>
 <1681481153-24036-2-git-send-email-quic_vnivarth@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681481153-24036-2-git-send-email-quic_vnivarth@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2023 16:05, Vijaya Krishna Nivarthi wrote:
> Add iommus binding for DMA mode support
> 
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

