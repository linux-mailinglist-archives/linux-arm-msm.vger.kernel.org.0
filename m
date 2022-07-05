Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0195056679E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbiGEKQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbiGEKQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:16:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B383914001
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:16:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z25so2168719lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b+6rgPwFe0tNl/NgxJ4pfhsoXmLTVZo2+aHYzP/37tA=;
        b=HrPe8TcKTH37Go/o2X9x8G18AE8aCa8pQANYkhincCYfHWu9j2+stwjpFIGVXvNgtk
         WgKkrI1+MRRRYcsRyX/uwMs91tpa9mbFKHoElk2NjLSgxti1yeCz8lp/2jEt2v3EOKeQ
         xHht6qCHzdzXxnv571QycFaxMGvAN+8xbdCWMJWy1M+mMAr0/6xEye45xTcfJIUJFQz+
         3lVib2MQMsyZJRNlT2tL94vGr7tLagzLuxHlW/qj8UuOMm4pqI+9rn1uckwMj7jP/7as
         1M1vLxfpbmMir+8hMFoyMKNK0V/E0PLltBOcCp+KwAM6GUvVh/oBPqtrvzezsbaSdOa9
         LZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b+6rgPwFe0tNl/NgxJ4pfhsoXmLTVZo2+aHYzP/37tA=;
        b=g0YSIQblmql1Nzae0WyT6sgS6As9lr/wkPoZC24LCfRnUuDfsqfLeakEdwjKTZsawe
         fo5rFUs1swCekHNq0AEwhBL2PDBwSefthIDEe/GmcT+ECWrrb7A9BmFsV7vCqx/5xwNj
         7IE9oWfFrz/Po+Pfc1gYGnBjWn7yYq6ZONr/mYxw7Ujgz3fEkdcANz65BWcQRK3n7N4R
         6iP9jCp/v9Nn0JMkvUT+vGuddczE6UXt3Ma1Pk0KWP6uj4T/0LpQ1AfPNqkcKDN3xjyt
         Utuj6NBh7Kx0rLh3vzPTGb9Nd0ggswxsA29SNaPkoXkljT6W5MDmkknyfUJspakcYJ2y
         suIw==
X-Gm-Message-State: AJIora+UTHe0HmHwlZVlSsdZYsyp2/C/671NtUga8AJiv/uVIoF2gN9U
        E20XxTybStAp6NqtGKuIpdtwYg==
X-Google-Smtp-Source: AGRyM1u2b+yi68OrYN6oZPBOKqn1kUsf6PZrDo4vaj7TdvAbPYg3ZsB5o6Xploz+F/eIOLJA/b8vTw==
X-Received: by 2002:a19:ac09:0:b0:480:6a10:4c39 with SMTP id g9-20020a19ac09000000b004806a104c39mr23692141lfc.115.1657016196146;
        Tue, 05 Jul 2022 03:16:36 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id p6-20020a2ea4c6000000b0025be5d48ae7sm3617093ljm.79.2022.07.05.03.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:16:35 -0700 (PDT)
Message-ID: <d3a49c05-0fd0-920e-bd0a-f821e8e27b8b@linaro.org>
Date:   Tue, 5 Jul 2022 12:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 16/43] dt-bindings: phy: qcom,qmp-pcie: drop unused
 vddp-ref-clk supply
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-17-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 11:42, Johan Hovold wrote:
> Only UFS PHY nodes in mainline have a vddp-ref-clk supply. Drop it from
> the PCIe PHY binding.
> 

That's not really good reason. Either the hardware uses ref-clk supply
or not. Now it looks like you copied everything from common schema and
clean things up. That's not how it should be organize.

It's okay to copy existing bindings which are applicable and then in
separate patch deprecate things or remove pieces which are not correct.
But all this in assumption that the first copy already selected only
applicable parts.


Best regards,
Krzysztof
