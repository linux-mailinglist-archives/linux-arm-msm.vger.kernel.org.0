Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62865B1EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiIHNWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIHNWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:22:22 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB0C6C136
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:22:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id v6so6477083ljj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fLE0KN+bsddl0QuJuy8FUkwqm9oAF9pS454vWRLeAG0=;
        b=tzOAhiaGGQXTOnylw8uUb0DZB4fb14BZI8v46ylgywkRIttiZqAiLm0Chf5/4xBKcT
         k8Ejdm4WQZT6xoqzhryRf9cWgC5gRwCr2s1BT8oq2ZOlK5cbCPC//35kzDpIyE2AbK7H
         fCrEfvHqwBnIFRqO/9sN4IdkrspJYKBxQXKtG291zFS1Difee4EqZ57rISjdPKpXOXdY
         SmAOUwPtrIna7p9uYe2tphNLliMWtdzUwQhJBPGd83axsDpGBHjfmpL8fpqaCGfT89IM
         4RwajTDRWOtrOF3w5OSrH1TZ0Sikb0zrBRPTnwZpEIhC/p4FVz3Dqwcp0vcS9oqUFjGE
         Misg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fLE0KN+bsddl0QuJuy8FUkwqm9oAF9pS454vWRLeAG0=;
        b=1IaV1aYcwlCL3hg47DNDcnBNhziy8XoW1kRaBnzFn7Cgk+hZDm4MjL2uuG6WIY9GIi
         V05aE6YOEp49AExEhKPl9GhnyotG8BAgk4+q+Ly9q3d+oNWLG33JupXutM5zMgEST2p6
         46ljp9nWNMDFPwPd8f/gCKjut/Y+r/1hJs3ZtH9y2Rr+FpdoFfAWnkW/jhMgJ+A0yeQp
         dOlD0gk+261/4oUOcVfopvFLwUpa71u3iRCmJSkLAzAu2LQJwuF3N1hyqIdESWs6AuH5
         zc5dBBE9lTt4zkaCg5tMbbac8PCMT1/AeoFPOYPFPzKjtb4mdBzN1tMSuGAzCB1YcOtl
         +5tg==
X-Gm-Message-State: ACgBeo2prVwQRiCQ43xSZbiqDjBo3QwyDzYVn3ziDfis8MVxx25qKhkd
        kPk9SG7zho61lPgOQcywIYE97g==
X-Google-Smtp-Source: AA6agR55FiMBW0OSNRvbR0bk9SlVIwvnZAztE8nQlhjnGDEx2ADlA8Bl9oRkGXqyaxryn4TX+3eFag==
X-Received: by 2002:a2e:a483:0:b0:267:982b:6988 with SMTP id h3-20020a2ea483000000b00267982b6988mr2399482lji.269.1662643338534;
        Thu, 08 Sep 2022 06:22:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p3-20020a056512138300b00497a7885f31sm1023649lfa.144.2022.09.08.06.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:22:18 -0700 (PDT)
Message-ID: <829cdeaa-a80b-96e2-da7a-8bab2b741c91@linaro.org>
Date:   Thu, 8 Sep 2022 15:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead
 of EXPORT_SYMBOL
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
 <20220906165508.30801-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906165508.30801-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2022 18:55, Srinivas Kandagatla wrote:
> qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
> so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
