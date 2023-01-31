Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE36834EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 19:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjAaSMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 13:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjAaSMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 13:12:44 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCC22BEEF
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 10:12:43 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id q8so10969001wmo.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 10:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xbXSQ6OEtMqbrzCaCH+4CFKzV8kb7O6knKTEHEwxtg=;
        b=pTdC4hTapnxGjFfDnLIGWrTWsC6CVb06DC60foFPyJHxkCKuhMiM6BCbcwZNFm8UFO
         wWANXR1cIOGxUiio5fiEXaMha8KKX1fkIWQCDKaMnBfVOkKvmg546TfIPMFFrk1hYiaL
         IN4cqgpvnm03+0fGH+4vf6dCZrgL6o9JRUgHYM+0mp4mwcNksjgVfO+jhP+qWZRS08/K
         v78o32sLc3MN/0KrnaXdkLeA+g1ESbm+L9Wmx9hqNoxamFs1/1HOxCf9MRmJ8zrYHJo4
         Sxc5d6orqhEsEQF2fXSB1TMd+BCTnUGTbkmtYzAhBUmzDxAqO7pqraoKp+1BkGGNVA5v
         1mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xbXSQ6OEtMqbrzCaCH+4CFKzV8kb7O6knKTEHEwxtg=;
        b=18mqdNAf1qx+rRm0uIGhVTjkz/waIzYPAneQV8C6BjQPgZ84jhEGQbWD1zG4mHbKgA
         MObJt5sQirkUDkQ157OHeqTLZJXKjuDJq2ZOvxxfDxsETsI6TiRWtL2rsY2zRNnOgHZw
         iyC/HwwQTODTppBsX8/8o6y7/rSowpn6J7zozQ26rn6mt3AcdATgbm6d7Xhz0ahvsulk
         ActqCyMS2XO8/06L/L+lppsb2uZjJqu9UbtpPbza5L5+9OHr0mrnJOfjd691hYPx9ROQ
         rY1rVmneRPpAeB8ZIsLRBviP9ZDYGGiVazIgdh8PSkjwab4VK3H8mJvQpBcqF4nPQgsW
         KPlA==
X-Gm-Message-State: AO0yUKUc+zyryWecxai2XeLu1/p7uqLNiFScrHvBf+lKREd8Nw36B0Pn
        sA0p8OE+E6lUqeAvsv0exYV5RQ==
X-Google-Smtp-Source: AK7set9KJluXNhz3WBawAdWPggaQHQLGOM3f1IrglogXOBQ91b8jUJxQJ31dYOyzOhsHMoM+hTNSOQ==
X-Received: by 2002:a05:600c:1c9c:b0:3de:d9f:3025 with SMTP id k28-20020a05600c1c9c00b003de0d9f3025mr1059012wms.0.1675188761932;
        Tue, 31 Jan 2023 10:12:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b003dc1f466a25sm20886882wmq.25.2023.01.31.10.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 10:12:41 -0800 (PST)
Message-ID: <e7b26499-baed-d2a2-0113-04b9de375404@linaro.org>
Date:   Tue, 31 Jan 2023 19:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 3/7] dt-bindings: pinctrl: qcom: Add support for
 IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230130125528.11509-1-quic_devipriy@quicinc.com>
 <20230130125528.11509-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130125528.11509-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 13:55, devi priya wrote:
> Add new binding document for pinctrl on IPQ9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

