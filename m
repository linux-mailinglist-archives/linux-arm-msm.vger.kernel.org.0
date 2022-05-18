Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948A552BD2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 16:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbiERNe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 09:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237956AbiERNe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 09:34:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA735EDCC
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:34:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h29so3692009lfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ah9AxJVzSaQ3+r9Loj2Ovb9Rw/v+KatzxO1BMfL+FaY=;
        b=nFiI0A8F+bpe92lCYMZLjOahTBeLPTF7XoP3i/HugpXGpP01LeQ+Da0HOCdk1J/fV3
         a5yB5CyBDxg1uaDGpxPC8rQgswKxkwHw7ZcV/e67uw/uONgEfI1d+AWYM0jY5iw8T05S
         3TKoSH0uqQSR+FgCmnQAWUsHrXDaM4+SNjsMVZ63+5SJWJwUhmJZ5+jz8Ewaw5cTcXiY
         wujJxKC3cjeYM9MigEjX6p8X11yvnaQd/LoAR1kD53l3HAXgMIpqhSP5DOyed5RGOI84
         Rnymh3L840T62/uX5g4OjqLFC7wACi1j1+8PNcl+rF665jt7VRbwEpHAm4Bwq5OSqaTr
         HEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ah9AxJVzSaQ3+r9Loj2Ovb9Rw/v+KatzxO1BMfL+FaY=;
        b=QSTCqff7iusYp5yd4lBqr0UDNgIZ5dwmz3wFMYrAaJfMyufNZDiE3pMseQOx/M/JZw
         r+3fpX4tRYw/WowLpqlkEhZ+6sWalBFA8J+mMq87sZR8rnEZ7dYUZbtzjmD76JPvTTwF
         7AC8nbhYFh7TQp94f+Z3icD2eNNV66obO7tfDKXsfT/2xuj1jCv5ODl6dIiEHGyIFnPu
         q6v1E8VSi+YIoFZb2Woah10l9fVRJrwmT2VbDMzESbIUMdTKz+lUYmSusAjRqKHTExt2
         h6jEM19KB+seGlo9bRGcyo/D0B/agfDz36EaUkcEGa7hiapZrH6xWICjp6r/FdW824LH
         mUWg==
X-Gm-Message-State: AOAM532r8sZiC6G51I+zEGJcOjBGAE73QMKlEhTYCVVnVtPrIAT+ryJm
        TWv0sJWxuO7NR/j6CkzSlw2DYwFRW8Gc5bz4
X-Google-Smtp-Source: ABdhPJy6a4PUHZ2TmWJGHb6uoS9F6DhW9demiYpT4UUbMNLedvB+yPMrdBxn6atjBxVouRAXtP807g==
X-Received: by 2002:a05:6512:554:b0:472:1891:a14b with SMTP id h20-20020a056512055400b004721891a14bmr20246331lfl.677.1652880865160;
        Wed, 18 May 2022 06:34:25 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e960e000000b00253bff9ded8sm219930ljh.21.2022.05.18.06.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 06:34:24 -0700 (PDT)
Message-ID: <bc13e57f-9701-80c9-8c7a-e491fbcfd181@linaro.org>
Date:   Wed, 18 May 2022 15:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/6] dt-bindings: regulator: qcom,spmi-regulator:
 Convert to dtschema
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, broonie@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>
References: <20220517205341.536587-1-robimarko@gmail.com>
 <2905b9ae-df66-eb12-60fd-306ea2d3d626@linaro.org>
 <CAOX2RU4dH-iUMY8yebEEgdJRqm37AHBMH135YkNsnDJMPZCbPg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOX2RU4dH-iUMY8yebEEgdJRqm37AHBMH135YkNsnDJMPZCbPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 15:25, Robert Marko wrote:
>> I think we misunderstood each other. Old bindings indeed did not require
>> the interrupts, although if present they should be always defined.
>> Therefore here you should specify number of items and their names.
> 
> Yeah, I think we are misunderstanding each other.
> 
> Old text-based bindings specified the interrupts, but no naming or
> number was enforced,
> so I looked into the driver to see what is going on.
> Only pm8941 has interrupts defined in the driver and DTS, so I added
> those based on compatible
> matching, the same as with supplies.
> My logic was that it was only valid for interrupts to be described if
> PM8941 was used as describing
> interrupts for other regulator models will do nothing.

Indeed, you're right, thanks for explanation. Your patch in such case is
correct way of conversion but allows any number of interrupts with any
names, so it's to relaxed. Maybe then better go to previous version,
where these interrupts were defined only for one variant. For other
variants they would fail on as unevaluated?

Best regards,
Krzysztof
