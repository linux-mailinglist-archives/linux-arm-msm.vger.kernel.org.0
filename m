Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917ED683684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 20:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjAaT1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 14:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjAaT1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 14:27:41 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE2813D61
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:27:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8639010wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTJLn6oKGjnxYf6846RHISTL5/yy97eFOR4if6Wt764=;
        b=Ybz7qM7wsy7z+XRk2O1Jumca3deQCM001JjyM9GsECXb4koTdOwHZfDd/k5/4knG13
         OmZyy7mov5+LzXNDLg2vkCbxAyQltxkCrzGNt+rl+U/u/as98PUoAWJZrEcDPJoJO65A
         TJVDSe/jYlkqp/ajmt6hd5IdlqlLq/MawkZkZYMZyrDmLxK375DJ0p8mlnJHNCTPeSWH
         u+5U7JZCT6bFWZojUJzwn6/Xzzr+j6/sVrpXCnkcDVfUIqqg/pDyYFZEY+ZIKDmIktwu
         M0oBlEq7KMHmfhINCX8jtdyUPMlW4UwFLSjNwIs6ilfKbjJlwTkbARVNuihiHqJ3iu/N
         n8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTJLn6oKGjnxYf6846RHISTL5/yy97eFOR4if6Wt764=;
        b=yofimm62ORDHqu1JGtzVt4d9dC0pEAXOpKjnCHnj/G5bMA6A7TA3OIaFDTHZxSe1OC
         GxKKTBB4b+nXOJXRBD40Zc9nxUzVkpYFbwjlRthqq/nC9s0kx5S8kDKBxHwzoDdyC/GR
         jSijnB0XliFPNWmJv5EpggOS0fWaZKpR2mMIIqdIHtCsFiZismervuWLIlG4czNiAj8c
         HjC7541ajkrDrXSS9huWMlZY8e6GICB8o2zmZjC8oHWFqtbOGXISfi+AluemVZvv2WOT
         4v8u+cAa2OOnKTHrQ73iyLKvqMlnUdIRH78/psR3mui4qtmR6fV635iTskoJkytaAlBk
         fhMg==
X-Gm-Message-State: AO0yUKXBz3dmWTQsbu8St/rXtkZpMtADb/CHoOSR3QBvOyJqZkTrTfo0
        wgMiUdsLK67SXBvxw1nhEiJGIf3k12phU2gs
X-Google-Smtp-Source: AK7set8qAivzV4CkzlekJFT9+K/5k+Cxaf4lWIq5ZUq+KrMCH/wnQSbQIvNPS6BvHRZ15jT3UbDGTQ==
X-Received: by 2002:a05:600c:3c8a:b0:3da:2a78:d7a4 with SMTP id bg10-20020a05600c3c8a00b003da2a78d7a4mr165351wmb.21.1675193257782;
        Tue, 31 Jan 2023 11:27:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003dc0cb5e3f1sm15860139wmp.46.2023.01.31.11.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:27:37 -0800 (PST)
Message-ID: <cf41cb9f-e633-c0e5-95cc-98b2a4312886@linaro.org>
Date:   Tue, 31 Jan 2023 20:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 0/9] Add minimal boot support for IPQ5332
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-1-quic_kathirav@quicinc.com>
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

On 30/01/2023 12:46, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> The IPQ5332 is Qualcomm's 802.11ax SoC for Routers, Gateways and
> Access Points.
> 
> This series adds minimal board boot support for ipq5332-mi01.2 board.
> 
> Also, this series depends on the below patch
> https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/

You sent it even before answering to me in old thread, so even before
giving me a chance to read your answer... Don't send v2 before we finish
discussing previous one.

Best regards,
Krzysztof

