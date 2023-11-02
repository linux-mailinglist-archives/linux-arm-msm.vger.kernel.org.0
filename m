Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FB17DF3F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 14:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbjKBNiy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 09:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjKBNiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 09:38:52 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C65C112
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 06:38:42 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4083f613272so8522465e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698932321; x=1699537121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LKDV0c9x4kW8e+XafsUW03m+2ll3tOqbHuztuC5Z/Ss=;
        b=VDQzyUSNrnq/GAiNMVgM3ugYPkEail5HIZv4YyBKz4e0et5k9HXBU/yu6fA8ukJT0k
         ArrQKGR4lnFafbWxCMkV8QYbY7/9YDv6AKPs0BmxUaVHZMgtQvpw2GNYBV8AQq6QFKSS
         I191wgTaCDyygJzT7DTIeCjmt0xFsW0hqga5itZ/L7vaLHVIXJnhw8WYsJGFE+qu2Qod
         eaDnz/nvXC6S8CSnHAdE1aFecqC77xIp8CqmBVgwOx3g2p/h5qNQov+lSiaTXkp6r/Dt
         r1WOfEv7+4uwTnihk0pEuha/NDed9rIkplv9qM3IOymvaPEF5gqSgpYbAwFDNvenGn+Z
         rQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932321; x=1699537121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LKDV0c9x4kW8e+XafsUW03m+2ll3tOqbHuztuC5Z/Ss=;
        b=nHbK+BcHpBJZHxcQJ7NA1X5iRWZ3rznJtpLIfz8CsaqBP//Op+e1sjgiFQtUkDpUbc
         5zkXrn/jEMCIZYoLrZPIO9wJX5tBJzdXV1eBeqAl+2n1IFus0fDCajXXp/IaUHOi2UUn
         pdZ0GEOORw2oqU5vCI/98OthNdezyCcdph8hYAssQEKuGVVGYsOyIMv3z8JAbKawa4FP
         xjrkqFm5Io0rBf2gN+lrii829Q0/xDm4m2mWx6EA7+SWxp/kTZcfbt6rD378Zh1WnXuR
         72XKTZcIaIgWeTek94BN3QdC+0upMZsjF4tTCfaZ+tpn1jdsAeECErqt6JsdYoQb5VHd
         /gzA==
X-Gm-Message-State: AOJu0YwhDRwt5Kt9bUW8R4lxIIvP4fQ+4/nP4OipT8bPOX1obCsTehBF
        P5c1jk2DqdOc1kPplI7tGovXcQ==
X-Google-Smtp-Source: AGHT+IFRNrImNNZe1+UHO1+GY0jPMqPvfsNYUI5eEtG8KDx9kCdwpIB2lTgqnA/58OpXHq8OQjJDTA==
X-Received: by 2002:a05:600c:2990:b0:402:ee71:29 with SMTP id r16-20020a05600c299000b00402ee710029mr15066683wmd.10.1698932320807;
        Thu, 02 Nov 2023 06:38:40 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id hj19-20020a05600c529300b004094d4292aesm2832396wmb.18.2023.11.02.06.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 06:38:40 -0700 (PDT)
Message-ID: <d26a975b-7a66-46db-af1f-685273f64faf@linaro.org>
Date:   Thu, 2 Nov 2023 13:38:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: Add sc8280xp support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
 <20231102-b4-camss-sc8280xp-v1-5-9996f4bcb8f4@linaro.org>
 <9f088cfc-7b01-524c-1900-5acee6919ec4@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9f088cfc-7b01-524c-1900-5acee6919ec4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/11/2023 13:35, Konrad Dybcio wrote:
>> +static int vfe_bpl_align(struct vfe_device *vfe)
>> +{
>> +    int ret = 8;
> return the value directly

What's the motive for this comment ?

---
bod
