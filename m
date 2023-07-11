Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3351174E699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 07:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjGKFzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 01:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbjGKFze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 01:55:34 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195FE5D
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 22:55:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so81326361fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689054932; x=1691646932;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fh/Hj+VgifP6XR1WxgnEYxiVOSsRTM9GTn5O9uBOvoo=;
        b=olsTaEWh4Tlm94Az0tuOzR2rCz3+7JbcQs7HDPXxxnvHGuu72Jn7JLesiKoc8tfUA0
         LpoI3IfHJDbIF+f7xLLxAWpPSEbCeBPY38zaH4ivs1eGLJwATUk9jrkrYBG/xbvK3fsB
         6LMmFQbYUEL5H0H+b0df+iRs7OD8rV+KHM965BHgPm64j2QsleLL0y7lWoJ1fdJr9AxR
         kGG4sjigcH2H0mfaiw2drm2OQUyJR8wYMnOcYgscD63o4xXIoshEAkn7+WUJXksZxV20
         pQKMZd4Lb970sKJMvUO3dU7bEh1AddyfnZdCJ7A3eYVplD7p1CyTDih4aYpE+XN3KCTw
         GDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689054932; x=1691646932;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh/Hj+VgifP6XR1WxgnEYxiVOSsRTM9GTn5O9uBOvoo=;
        b=HRnQwK6y8eyXaRgiJcn9veSC+TGvMlIh2DquXBoYANDwsss8TOudYsrrOy3tkHrxtu
         uJeLJdmE+Pn3Vcxso4tIb7b2d6Br4Nh/4uPri7PERZ1l3MVb7CA4Jsm0XfIOzz6y8Ea3
         HbXo5hMbObzM/3jZwYu32ClF61djqhztFnCAloelyZHeduvNJ5XTgHQv1nWZJ1ipIMv6
         qxFnC2h5WMXhkop/f6Sum0bW5ZXzkDTsEco9upFpe6IbmfkX4Zu1UpzUP8jJqpjRZhB/
         Re5xWRVgAi38YOI7agcFYAWePlfabnIe8eSSjMfjPon7ws7TX5Z/ElD7D1lMjBnTtaPt
         S5Yw==
X-Gm-Message-State: ABy/qLaTpvUexGkW7bmAsb1j0RKj+umSbIhHzzgJKE5zzuDsER8rs0o5
        /NfIvnFSm52aZj8ExeiWv1vawQ==
X-Google-Smtp-Source: APBJJlESVa8ZL7gK7vFKtLvWeHxy/ZtEGf7Cxqx8738zdtY4w2whVGpdMmweVYl9vqa8HKhKS50kIA==
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id q26-20020a2e969a000000b002b6dcdeb77fmr12857419lji.35.1689054931787;
        Mon, 10 Jul 2023 22:55:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906390a00b00992b8d56f3asm656577eje.105.2023.07.10.22.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 22:55:31 -0700 (PDT)
Message-ID: <0060bd2f-3884-ba12-08a6-ae7975d22e65@linaro.org>
Date:   Tue, 11 Jul 2023 07:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] dt-bindings: power: Add compatible for sdx75
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689054169-10800-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689054169-10800-3-git-send-email-quic_rohiagar@quicinc.com>
 <afbab9c3-ae67-1a30-6fc5-e031f9f30286@linaro.org>
In-Reply-To: <afbab9c3-ae67-1a30-6fc5-e031f9f30286@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 07:53, Krzysztof Kozlowski wrote:
> On 11/07/2023 07:42, Rohit Agarwal wrote:
>> Add a compatible string that can be used to list PDs for sdx75.
>>
>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>> ---
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Ah, I forgot: you miss device name in subject prefixes. You do not add
here sdx75 to all power bindings, do you? This applies to all your
patches and commits.

Best regards,
Krzysztof

