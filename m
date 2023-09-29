Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963A67B2FAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 12:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjI2KHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjI2KH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 06:07:28 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35669C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 03:07:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3247d69ed2cso3333848f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695982041; x=1696586841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saeVjZKnNIdT5X2zsR9LIVhUYqk+dCAG4klu5qT+Ffg=;
        b=lRFS8YZw2YXxaLiLUcmc8FelgGsR4YKETDVJ/Fi9XKvFK06VD8bHY2wWojQ65gEfx5
         7kapsYcNlWnnZh7hmAs8sSu3pPfzSMrV50oa9na/IMavd8nvkRGxvx1Rph0nfyaMPk5j
         xMNTg1Gcq8phChu5zytFNilTmC5jnOdXyojyglIR7UBLPnuzn8grk5/IykNEO8S5G3/w
         seWsx0Y4z8oouBHIwO8gy9Ypag+4hQtoETPPrfIJTzm7CcyH7VEZJVI3UvVLxp8FaGzG
         V8gx+19FQ59FsmOPM55ALeyhHlCJQ2Q7qx9dRV05Q8LtTk+7jo4aDiGn36FiTB8nE3Pu
         QdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695982041; x=1696586841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saeVjZKnNIdT5X2zsR9LIVhUYqk+dCAG4klu5qT+Ffg=;
        b=pycHaSTxTJZGMEMCIlRsa2Ke1hcYAgNiR8vAYX7wXz+27BCxbJbCQ9T1pelmWM+Mcb
         8Gm1FMnSsUWeH1GaCkhonx2saui0f/vcTqNwzJ5PtAGspxaJQWwWuo59my2MBuZxnmUu
         vfy/s/XCc5mx2nzVPUEw6HjjNgvODe94o/dLh6cWpKioVt4puI/VgQUodt+SEhUxot26
         Oetnb5iw0qp8PDBrIBKKgmMUiTWv7I8g8QTfVEN7fNplJ99MzoyhAleqIJrdA5guwPe9
         WuEpERoWPUTQ+gOZqd8hgH/vl0mpeXiFMKGP9f542nNUoqi38czRTKa2TpC/zOh2Iqjb
         6jhA==
X-Gm-Message-State: AOJu0YxbvR4RntcqFrwzGgFHjBCHogEUOOmqKZkcxuZcT3Gc9H9SnUMm
        H52Atu83QXr3++xvPkbj6pPqDg==
X-Google-Smtp-Source: AGHT+IERNMlExukG/RveR36j1SNOU9On3l/LWyUL6FUPZWyOQjBBFEni+g6TLCYEFZZRLr9PU0SzYw==
X-Received: by 2002:adf:f08f:0:b0:323:1d06:38e5 with SMTP id n15-20020adff08f000000b003231d0638e5mr3438326wro.55.1695982040734;
        Fri, 29 Sep 2023 03:07:20 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id m4-20020adff384000000b00321673de0d7sm5852687wro.25.2023.09.29.03.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 03:07:20 -0700 (PDT)
Message-ID: <ae6d5f5b-bd06-c55b-b970-f1f7e39fd749@linaro.org>
Date:   Fri, 29 Sep 2023 12:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: tsens: Add sa8775p
 compatible
Content-Language: en-US
To:     Priyansh Jain <quic_priyjain@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_manafm@quicinc.com, kernel@quicinc.com
References: <20230926085948.23046-1-quic_priyjain@quicinc.com>
 <20230926085948.23046-2-quic_priyjain@quicinc.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230926085948.23046-2-quic_priyjain@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2023 10:59, Priyansh Jain wrote:
> Add compatibility string for the thermal sensors on sa8775p platform.
> 
> Signed-off-by: Priyansh Jain <quic_priyjain@quicinc.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

