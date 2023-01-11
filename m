Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174C16657F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 10:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238480AbjAKJrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 04:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238405AbjAKJr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 04:47:29 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4D1B4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:45:34 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso13896979wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wWIW61CZB/vxYsqF5McKIEUW8wQWfFLBGnoRl2r3g4=;
        b=QguNZ3AYn9in0xBi5rvw6eS1DCNUvH+vHez+dOi+3DDRE45hk/4PDbuSn45J90c/he
         j9k7ueMNy/fKnOW3aTx0YQ7yCOLxZrYxw2P6CfoRNM9EbcIobYhVXvmoQuxtmug6pXqo
         VxKJCD0aS1ADMeueGAEC0rXJA9e+QVd/68mGb43OS6xg2hph7591FLUISbJsWuh7bBPw
         f6sGF5hw76qmQjoswCmFm4MeKOfRKGwndK9neQJiIg1GATDMpou+XvO4GZJ9iU6zNBUS
         +zSGI6qnV7CEz7JMMoqP8qDW79VPIRhm63ChyeueuIbzSqxwZJvnkoOB2FtE3D6pXVsY
         Pcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wWIW61CZB/vxYsqF5McKIEUW8wQWfFLBGnoRl2r3g4=;
        b=VVyIgtLEO8ubkfWCaLD5ato8LeFdkKioQxHY7SMpUr8Yzasolr+0pHho79P8Hl2FhW
         kKDLqKP54ZCsyOTTp2U40NVgVXG/vKavtvspTA4/rQLK6SnDB/fkdps2SLz0pf6zQQBI
         XqI5az8m/mPfI5I9PLRstz+IKhps+HRzk7CBLN6c9fwNcC4bd9TF/JEEM04PFNO2s4f3
         pzPqaEgj459YQGVkxfhffZy4NtyEY9xb2TX31SEa9BYG3/n9NRndSO4eSwRWdiL2b6iE
         6ToQELsLF7NDLfnV/jdWrPe3GaBCj/ay9OQy0gYiKLg20RGLOubRymiCGONPANNFkk8P
         M0DA==
X-Gm-Message-State: AFqh2kqyO1gOmEeMTHr9SWBvuC8hciXezw7mZnQ2pKOfqhYhCmU45EoE
        LRv+k3bZ19FBorhk5plYmBhUHQ==
X-Google-Smtp-Source: AMrXdXs3iRR5hbQRbV2mNc++Pv4HJQCPNW9Qxhph9zZkqzpQCh6C2nt5n8RG3k3wja/pppBlAUQdrQ==
X-Received: by 2002:a05:600c:3ca8:b0:3d9:e8b3:57fa with SMTP id bg40-20020a05600c3ca800b003d9e8b357famr10283292wmb.30.1673430333549;
        Wed, 11 Jan 2023 01:45:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003b492753826sm16653155wme.43.2023.01.11.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:45:33 -0800 (PST)
Message-ID: <e5383b73-7026-ede1-387c-5847535438eb@linaro.org>
Date:   Wed, 11 Jan 2023 10:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] arm64: dts: Add ipq9574 SoC and AL02 board support
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-7-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> From: POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>
> 
> Add initial device tree support for Qualcomm IPQ9574 SoC
> and AL02 board
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>

Don't use CAPITAL CASE FOR NAMES BUT Camel Case. Although different
languages might have different rules, but most cases when transliterated
to English (or Latin alphabet), the name Start with capital letter. The
same in your case.

> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts |  69 ++++

One more:

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

