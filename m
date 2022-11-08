Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775AA621133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbiKHMqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbiKHMqC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:46:02 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7298B51C2C
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:46:00 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so11616857wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIQ3u/huOf4z9jf0jf8kWSgTP1/QU5AOGn1ARoDQeg0=;
        b=fWDgETyypYOc1gL0Y4RbTqbIiUZjuIhpIKjNKu4S+sZcyvPAKsmZV6mh+gKWcbWauE
         2+U+9kYLsqPF97ahGm2w2l8rqq+RxVjS+aIOpe1i/rfXGdaHCPpv25jJxBogaQQgJmFv
         TW2MGPQo4ArbQvCCu7c/X7UiWcdHHTwx5oXHE+kibb/5WHpGYOqBv164DWKWUPxEF2cG
         bdSCcC4aYsD/2yOfkgKqsdRehjDYK8/jvylQp9T87ZXnNRBplvuu7KKaE8IKrmRv8nsT
         2WMLkggWxVgV9wGE3495gzdDeDf5Q8H98e1hU3ebvAIu/9VuScQ6cDyVzMBCfMNHlJM6
         bI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIQ3u/huOf4z9jf0jf8kWSgTP1/QU5AOGn1ARoDQeg0=;
        b=oBXDpjupKGJf/jMMrXuUazuFltVPZDp19jijAeZY4kx2kPRJnqfX6w596UdcOWVaS2
         c+m40W8xW3Hp9UwG+itlSNuOh/VMaef1zcdOKh/yX0c/oaMVZ4qGnuuVSVJqJRXArrKn
         G0yzgsJMIZb0fr3PCTlzwf7aKq9w4N4w7/2wh0oPpseq/rdWxmWx5W8V2N9XW9/NA5BN
         P6B8eS6E3PIbHZhhhlEZhSzZaB0RWoJpcYelRsEtprwfxhVUtPhLGxeXbrhWEpPo3Tp/
         JZgZdS3At8NcR0yNrLtFzrwv78mj6843vMjY5zukWJVCxz6v7gRLjW+97Dr/vlFeNGyg
         N/YA==
X-Gm-Message-State: ACrzQf0Esp5KVQeavYAmgjuInKXncD5fmbxPUX31E0qRgyhJL9RU5N4T
        tXTOVH8nx53ZP4nKKyFq+bQwHQ==
X-Google-Smtp-Source: AMsMyM44z2U/h+ehijFYZ/5qViV4YPBFnGfwbHys7xmuID6S4pCbrFGbASlzwGGFG0zW9x1S5a7Bsg==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e78:8e89 with SMTP id 26-20020a05600c021a00b003cf6e788e89mr33447753wmi.46.1667911558976;
        Tue, 08 Nov 2022 04:45:58 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q24-20020a1cf318000000b003cfb7c02542sm1937720wmq.11.2022.11.08.04.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:45:58 -0800 (PST)
Message-ID: <162823f6-9fa9-1d69-5421-d77d37b6a0d7@linaro.org>
Date:   Tue, 8 Nov 2022 12:45:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
 <d10bf67c-c21c-5096-d774-ff924bf1dd41@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d10bf67c-c21c-5096-d774-ff924bf1dd41@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 12:43, Dmitry Baryshkov wrote:
> I'd prefer to have this part squashed into the previous patch.

NP.

Actually I'll add you as a suggested by here since you sent me a patch ~ 
similar to this.

---
bod
