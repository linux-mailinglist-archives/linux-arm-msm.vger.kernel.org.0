Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F0657954F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 10:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbiGSIgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 04:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbiGSIgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 04:36:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B326E140B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 01:36:08 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m9so13888571ljp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Ih2Fy5cmAbEG8aUeZ5+zEsRAma5SiCd0h+PRnEnInBQ=;
        b=x98MUCTYJFJ9Z26jtehRzVhXFT+bVTlVx7ka32+gC4lXF/vFCQFBbQqSJ1cvCpCcR6
         dnTj87s1W25Bl/RSlTWhxMAFk/DWZMDUPJHGEgRozZwWQa1Gzxay7b5NeYjnbvHCQiC6
         f/hmvGA6c0feZCV4UeLRoLeNZ0YdsA72rOR4DiKYbVK+CJG3llNXhfqI9FjwKH+ci33Q
         OvDMcRDL41Y8/ZZBB97qbHz2wReWnGpxo+15X+3IhTHfj4K4J+Z7bC3k0M2GthbRMe2Y
         /iZLhgmG/xGrDMamO41V85rE2pRJrUAe9lt9EVsNXc/gydePXGVZQnkaHhci5HOxvPtO
         RAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ih2Fy5cmAbEG8aUeZ5+zEsRAma5SiCd0h+PRnEnInBQ=;
        b=rDAGkajWtHQiAkcpaKSJoPgJs4AB/fwgKBaGxxhffHN1iH+rrbxMjWHFti1Q6J8EHB
         OvnnAQV4VoLpwE/aKyBKbKL4bymXXi1s15YFP4zi4rfK4QvQSkdwvZfYkt/u6j3QsRKV
         o0albOOPGfaH+nmuDuT8X4wpXTbd7VpPLPwzAxxpC25zKT99efvnS21Gl7UpXgXDDsuG
         WS0btf87ic8N1uu2oUpTYn5nwqPFxmsP00VjlhrCsx1H0LlXM3WaUBQFnHjtee5ivfuq
         SvHzUDmAT/ZmibcZ70v/YYDU8sBUS+W0jDbtX3pCIfdHM370CUSsW29M/C8z+7K1Bu3f
         xSfQ==
X-Gm-Message-State: AJIora+QwvyJsjYTr+WrjZ0dfvu81hm1ElB4+69wqL7TJf3saQhCg7Lc
        QGkNpARV7Z2S9shbXmpiOPbJSA==
X-Google-Smtp-Source: AGRyM1vV+5j0ZPlFEmdIh9COqsj7+E+TRr0bBKPc2QSCAnmyySjYW/ahXyifHPU75ZwOUj6O4xi1og==
X-Received: by 2002:a2e:8004:0:b0:25d:80c0:1e93 with SMTP id j4-20020a2e8004000000b0025d80c01e93mr14006416ljg.210.1658219767106;
        Tue, 19 Jul 2022 01:36:07 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i28-20020a2ea37c000000b002557c48cc4csm2534638ljn.95.2022.07.19.01.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 01:36:06 -0700 (PDT)
Message-ID: <472e5d12-9faf-4a8f-1cfe-49f5d0449560@linaro.org>
Date:   Tue, 19 Jul 2022 10:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: arm: qcom: add
 google,blueline
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-2-caleb@connolly.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718213051.1475108-2-caleb@connolly.tech>
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

On 18/07/2022 23:30, Caleb Connolly wrote:
> Document the bindings for the Pixel 3
> 
> Based on https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/

Thanks for mention dependency. However this should not go to the final
commit, thus please put such references after '---' marker.

With that change:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---

Best regards,
Krzysztof
