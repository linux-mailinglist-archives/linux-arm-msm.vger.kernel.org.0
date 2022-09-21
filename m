Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1424C5E538F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 21:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIUTGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 15:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiIUTGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 15:06:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCAD9C221
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:06:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h3so8215599lja.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/FepknvQ7aP+dGlBZxaN3qXLmKSyMGJLpHjat/ze7zc=;
        b=snJellwtW78O+aXgv/3ooEcqlPEuBbnGXshkN/XJGfPwvPKZKcF8Fmct3MurjOl0Al
         j37XpwIraNQBF6IiUzfuEr+zJbsq1jrz94MyORIz/7XmuI/OgFXFNz0I9ddVPOVov1Cc
         UdF8BLGzBae7+AWr5EW+nNJQd8ljHmyvn+nsby3EqCSKXVh0GU06aTR+jB+/xOKEVCup
         jwDVHndK55c1N38vplpSVz4ZCIcAtVc3RhrxBW8Os+KsmP5Oz572Oie7bJmdzQARzpFn
         Nqi6KTPGa7px5J9/vhdtQMz6QXggkHFQ1ngK0HyZNudu8vNqBZ21iFeKb8ESmrnSvU/r
         BX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/FepknvQ7aP+dGlBZxaN3qXLmKSyMGJLpHjat/ze7zc=;
        b=HlxXyejJb/ce/bIiVWk1fgEQxzbpoEpovFloucvI1X6JE3wxK7ovK/2ep09fP/FJtF
         +IHtnIikJ+i6OFZeUQmeYfSW7GWid7ylNtPijhoi/djnkN3YCW3fWnPbQocjFb29HOhl
         rsCQLvQsUOwExrHpdRpUmKjByV4xlyjstumAuzcplrGNCiGq6ror52D9xy44lq8lCzbj
         xXhWfH0ovld4RO0MVj6r792PAutMUZbLHy4gW2Y4GJK0HQaetuoQQH55CBo15N5/WWq0
         LW3El2IdTtEl2imu+3R66dJ9upGhR/B9HkBrUKcXEAgtrKQN7cpassvYmHvW1i90dKbZ
         8aeg==
X-Gm-Message-State: ACrzQf1+jYXu6hr+c0IGLc6VO30gOtphR6PscE0I54zMZYtydoyGnOqa
        ehA/I0MPxKCqjgaNnsZvlQRifw==
X-Google-Smtp-Source: AMsMyM7wdhR5Y2dKwP0pIC3G/MBb6dp0JJzKp6NVTpYoi7Z/zfYJ8Kh7IHkBaoHfy8jHkzrKnfrrnQ==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id g3-20020a2e9e43000000b0025dd8e97b15mr9618284ljk.234.1663787173534;
        Wed, 21 Sep 2022 12:06:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d14-20020ac24c8e000000b00497a41b3a39sm559170lfl.93.2022.09.21.12.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:06:12 -0700 (PDT)
Message-ID: <f997cd3d-95c6-972f-032a-7646855371e1@linaro.org>
Date:   Wed, 21 Sep 2022 21:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: firmware: document Qualcomm SM6375 SCM
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220921001020.55307-1-konrad.dybcio@somainline.org>
 <95fb2bfb-6eb8-012d-88f8-c739d229ef70@linaro.org>
 <8faecd72-0cfd-18eb-d07a-53b3a23ed05a@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8faecd72-0cfd-18eb-d07a-53b3a23ed05a@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 20:43, Konrad Dybcio wrote:
> 
> 
> On 21.09.2022 09:07, Krzysztof Kozlowski wrote:
>> On 21/09/2022 02:10, Konrad Dybcio wrote:
>>> Document the compatible for Qualcomm SM6375 SCM.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> ---
>>>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>>
>> allOf needs to be updated.
> Does it? I did not define this compatible in the driver, so it does
> not consume any clocks.

It's about hardware, not driver. Hardware has some clocks. If it does
not, then you need allOf disallowing it. Otherwise what do you expect in
the clock entries?

Best regards,
Krzysztof

