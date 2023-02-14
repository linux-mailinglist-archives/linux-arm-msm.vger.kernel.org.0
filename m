Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FD5695CAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 09:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjBNIPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 03:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjBNIPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 03:15:52 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26AB2D4F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 00:15:50 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so14716222wrb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 00:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZbmrQPhObKWSihJbHyou6Fu5Yzy6RDtZH5Vv76MpbQ=;
        b=yjABTc31/aA2Z0i7h3SUyePsyazr0R3Lr0ELN3COYoBRtw1w2gH1IGsRzC3y+DtC+B
         dOg3XJHICFo1PfH8YlB2qwgdFP1Iv6R0nijutLn+6nCmzMl1xVwlDDs76jFP8kSgwbSh
         RneznyAUeUZYmH55LlUcfNlmriRRs4moZV2GQsy2ZjWuW9FAxSTcdIw1X699Kfdco4Pn
         Lln+wx8/qMy/nZUczaNYVufSlOXCh0UYzpAetAycmE3tFvHs4Ba8iOX/wb1M9a5a3Ren
         CkUUWeuYUPu4GszUx/wI1kbNSCl3ehfPmkGHr3CbuhQduchRfee9FTHw74+NSnmw5+N0
         FC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZbmrQPhObKWSihJbHyou6Fu5Yzy6RDtZH5Vv76MpbQ=;
        b=wkEokc1xrMc1R6v2F4RXE+ICqqRCyshPPG1yeySq6O1MhgQryvtXBA/1qyw0gXYAJA
         8Fg4QnzHCE1zRhhE1J0gtRpYo2i3yxYx/JRg2t5Wx6BoflrAtxBm6QBN0d3cmF15RFFP
         8dNxD5t67ckQxxxrmEc0XdJrXExxpF1SIhG9QXqmIg4gTCS1gcPzoxOAj/J58v9wdwbT
         x/FQthjeck6/cNPs1rC9HFZB8tNGaFt/NmKUEBgRe9lTwtPqed/7+sHlef/PpjcYJjdJ
         b1bmL8ePJ4HU2VurGDW8CbUDqjyWktplbNBXN/VmSFH3OoHtNgwtu5u5YPQqy1+1vgCk
         atPQ==
X-Gm-Message-State: AO0yUKWba4N7PLP5jviswzt3PgoOLK7S7a14GbX7Qrkd2GZTFs6nEkFG
        C96wpJAaN/CuvSDjqv/ByctXiw==
X-Google-Smtp-Source: AK7set/IrgsUEGkUPcOIngeLJp97Ex2JJu3bjKGVWSfRtQmQFtrcA1Pni+F5WG8SiswWyF/jyA00Gw==
X-Received: by 2002:adf:ea0f:0:b0:2c5:54a7:363c with SMTP id q15-20020adfea0f000000b002c554a7363cmr1395804wrm.23.1676362549365;
        Tue, 14 Feb 2023 00:15:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d6742000000b002c55cdb1de5sm3325345wrw.116.2023.02.14.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:15:48 -0800 (PST)
Message-ID: <88f3db62-ffd1-a810-215b-4af5a7127f80@linaro.org>
Date:   Tue, 14 Feb 2023 09:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Allow RRADC as adc@
 subnode
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230213201337.2089970-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213201337.2089970-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 21:13, Konrad Dybcio wrote:
> This was omitted when adding the RRADC bindings.
> 
> Fixes: 7ea58c951ab3 ("dt-bindings: iio: adc: document qcom-spmi-rradc")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Caleb was working on this but he never came back with a v3:
https://lore.kernel.org/all/20221017185105.2279129-1-caleb.connolly@linaro.org/

thus:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

