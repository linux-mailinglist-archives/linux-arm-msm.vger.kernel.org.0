Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5866F57F116
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 21:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbiGWTBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 15:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237167AbiGWTBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 15:01:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC538183B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 12:01:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id e11so8852316ljl.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5cZiAIwF42WuzzYH7769NdS95yeAGltP/YgWORq01O0=;
        b=X8moCnNI000cY4kj949JeEcLs/WDwlw2sQx0fpcGTLPdHwMTLiEUX9cwVb0AVEHJK7
         1Yoftr7xbW9WyPIPYZPr+4n1yzqhZxbJHsjLmNAEcu5jkHthpLvPE7SDl1YpdSmyH0vE
         73VRT35PTV/xDe0lxSKSwvuAr8+aW+ICDpqSw1bilb0gk3UUvrr0O9SPwD6dSsfEzBJm
         BjUxzdrcKYPQfFsDKYmvUIATsrGMot2yYI26ZeBXyilGfnDj81WtLek2ppLpzTgGH7yK
         51a2mrdj/9jlWI/gPgevfqrUJO+Z8WIiXm27I+pGiQ7CzBiDAr7XREklhRIeiwGRW3hv
         ALIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5cZiAIwF42WuzzYH7769NdS95yeAGltP/YgWORq01O0=;
        b=pv0JyBOzIBB1nRtqmWXcOl607rQBVu4MunFP+GZ6E0AoWwxH3BSuViwpqZtgAY5iPk
         kYG14VMdwUvuFL1ZZh91JIIfof/jTAn4PLFqyESTU87ZVdAew3Oazs2x8RNxFX0l9/x+
         vlWKOj+B+4o6XPu39hRhbz9GaSUGdxy4HOlmvYOEe4KfGpr+0VxRGe9mWoaO7mdtoX5Y
         Fef/9c1Ey1mRnHS/jhEBMPzRAkUepzhrKur1a8v3ZCII3W1YUcTDDgqcdL0JfHsg5nea
         WvR6kZo/tgpGjsdBJjLQt4dmhMN7WYEVoo7Kslc3SOl1GnZrPmpb8/EUvR6wmU7d7WsI
         2d2Q==
X-Gm-Message-State: AJIora/uI5WWTW3jTnTaODXpfaW/+PxQPti8XYtRPoKvaIlQVV57WwS6
        o9Cu2RzWkm9VxdJg7sUX4Ux4JQ==
X-Google-Smtp-Source: AGRyM1vjQpBfuapdPZgbzVU9siQjY7xYEwbnErEnuIZaOWWeAfJ0aW3bsDJT4q7YVVzm+7j7SPe0Tg==
X-Received: by 2002:a2e:7a0f:0:b0:25d:eb65:fb67 with SMTP id v15-20020a2e7a0f000000b0025deb65fb67mr1744824ljc.250.1658602909893;
        Sat, 23 Jul 2022 12:01:49 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id h20-20020a2ea494000000b0025d4599d738sm1792090lji.54.2022.07.23.12.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 12:01:49 -0700 (PDT)
Message-ID: <29b97160-7b0c-ff13-bf22-cc408a2e96ac@linaro.org>
Date:   Sat, 23 Jul 2022 21:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/5] dt-bindings: qcom: Document bindings for new
 msm8916-samsung-e2015 devices
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20220723185424.203340-1-linmengbo0689@protonmail.com>
 <20220723185845.203622-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723185845.203622-1-linmengbo0689@protonmail.com>
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

On 23/07/2022 21:00, Lin, Meng-Bo wrote:
> Document the new samsung,e5/e7/grandmax device tree bindings used in their
> device trees.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Again, this is not correct tag. You did not receive it like that. Please
paste it as you received it, without adding any changes, customizations,
addons or anything else.

Best regards,
Krzysztof
