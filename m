Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2187E6F69DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 13:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjEDL0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 07:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjEDL0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 07:26:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1596459C9
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 04:26:20 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so16087298a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683199578; x=1685791578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zmyo4G6LovsSdZQtuaHVKeOOOrmhmVrTkT5aOfQ/+Y4=;
        b=HVpNPPuaEKdoUXO+6kfA9OIt7pF/YKpDs15LiZYdzFhJrYDQqzxn57qlw9fiQAClnv
         XRKX2et87KmKv5iG9fY0ikfS2JY6h0whYh3dzuQmb48kkiePI9U+PpG4T6HGo5YUs07s
         EyMdf26Mew9WXd05xFdMOG9iXAkvM45aKZnGAk/ns0TZr5cezCfTmf4Xr+tSCRiUF/HX
         IAreRrRl4+r1Xzf0Y+7M4FRi7UffgOxSpjLDN/tRNhLQ9wu793XIeYiBTvBcOFpXpDLR
         cxRu4lpZ84xRkNO1TXjK9P0QJPHMR58EyNuBXb1Y/DVJAZKK63QLjGF/hfb6xRytQlCb
         yOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199578; x=1685791578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmyo4G6LovsSdZQtuaHVKeOOOrmhmVrTkT5aOfQ/+Y4=;
        b=gggUQqX5vq5vQSAgGyN7x2w3DTb5S7fR9bzRN/C3mSqUVK2DFyBEZc+8v/l2nwfT4z
         SvrjUmAN9u3FfLIV9iy7t71k7OM7rGlWt3m0+dN0aLtsuNghV7p46M8qjSsrH9XVePiB
         /rbJxrEbXB3P7aFrhazpfwgM9DDtYzddX1UyN11zgdXS6Fz+/GYxpQIjrFuREWMK8EAS
         9fxy/XYPpSZM9CAnHnHhculKNp9N5pzQSarGRe4ESVDeen3ed+BZS68UFsdQdqWL1Tdo
         JAyLm0jShfUuiYA6uOHotVD58i1hZboPucTJbOl9Ik7BMKmQkucYQjYVgUea0uKqpWyx
         3b/A==
X-Gm-Message-State: AC+VfDy4TuUFd6geEUGg3VqIqRI+TwtqqQnI4Ttmtgig2khLrHL2Bojc
        OGIwzq1dHjddAB5Yd7fpo55yOQ==
X-Google-Smtp-Source: ACHHUZ64m1mvreL/nPay7MR395goTxZZUC9gB4yz0Hu5sHdV4GKpzdJ3VrldZdKfS5ra9BA8uFJMeg==
X-Received: by 2002:a17:907:1c8f:b0:94f:705e:d9e4 with SMTP id nb15-20020a1709071c8f00b0094f705ed9e4mr5139003ejc.31.1683199578546;
        Thu, 04 May 2023 04:26:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id gz9-20020a170907a04900b00965a52d2bf6sm855411ejc.88.2023.05.04.04.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:26:17 -0700 (PDT)
Message-ID: <ac0555ff-b294-e3ea-5aa0-15e8206c8013@linaro.org>
Date:   Thu, 4 May 2023 13:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 00/18] Add basic Minidump kernel driver support
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 19:02, Mukesh Ojha wrote:
> Minidump is a best effort mechanism to collect useful and predefined data
> for first level of debugging on end user devices running on Qualcomm SoCs.
> It is built on the premise that System on Chip (SoC) or subsystem part of
> SoC crashes, due to a range of hardware and software bugs. Hence, the
> ability to collect accurate data is only a best-effort. The data collected
> could be invalid or corrupted, data collection itself could fail, and so on.

You organized the patch in a way making it very hard for us to review. I
see mixed remoteproc, then soc, then defconfig (!!!), then remote proc,
then soc, then bindings (! they must be before usage...), then dts
(which should be the last), then soc then dts then... You see the point.

Bindings, docs, changes organized by subsystem. Then DTS as separate
patchset with a link to this one. If you have bisectability issues then
it's a hint something is wrongly organized or done and must be fixed anyway.

Best regards,
Krzysztof

