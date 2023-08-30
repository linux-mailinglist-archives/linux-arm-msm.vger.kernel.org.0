Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706ED78D919
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjH3ScU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243034AbjH3KJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 06:09:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAC01B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:08:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-986d8332f50so700005266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693390137; x=1693994937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a01//fw4C/o1Ax6ZZd2xqsEK3Vj5eisKt7KkBfMjlv4=;
        b=neNK6eWeGTk61TdEJq6/56WDSi98uvh86dqK2+/Se+2XemxK8T6i+2QPysJ0XyR//Y
         r+iPr9MTd2uEcnaeLdW/DEk++MaIJ5X+10G2vWY1qFrTvfjWqtOf/VYj7huFjRgOVdmV
         JChIHuTX5ts/dzjSTUqzvsa6gl5NaaHIb2YOJLint53jUNZBJIu1ds0ukyOxU/VzMJ2m
         wSJtt5S8ykIiaA3SgFgKcU6h4qz14uKeWHkvy5QNWqq4jlRz2dA9Q3Kuy8qxiK3YFW/V
         AlFcXtrEFR2k05WdKpC8BEPRVmuG7KczW7ZgmUzFrHcXq3bexSxh8QwEUVRBjiUw+997
         NFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693390137; x=1693994937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a01//fw4C/o1Ax6ZZd2xqsEK3Vj5eisKt7KkBfMjlv4=;
        b=P/QCdnp9D9w2C8yJgnXAQdZLSdm43ScJSzrFXj8TJGzVJ+oWfMMSe0J8f+tPwd9Fb3
         HhQcV24V2u4+uTAF30XvtpLzS0dxUHuZkXHho4fwY8LU39EjOgM0RAXeFaDfN3bjMoOW
         iebLJRiFZMplZztMjUWw4AH3eJHzVLVGJqQVDoO/aEfhH2mkA6F8DQkM5SwkbQ8zJ21P
         GFOVPw4npknwSvP6N14ZBFBrF21x4qtBHicpUzuk6/SPIeGonbq0WJfNlyh5mB5B8IEJ
         LOZU33caRbyLQveYm/vubdgMN5xiT89L3ncInWTHKBSYlBHwj2847mWJE/PNFIJ2QmcP
         5h3A==
X-Gm-Message-State: AOJu0YxQ21GSX8jIRpIjplYFNCEqOyJwPpxyU4lCmbBmypyMuja1xhGQ
        5ZMPyGpCZFxEu5QFRijzWWuKHQ==
X-Google-Smtp-Source: AGHT+IFUObuijfTAqYpf5OFv3XkT14r+q5WT8p2VJy471qW5Z6XW1Gcxtic0L8+1lZWXjo/qcqBvPQ==
X-Received: by 2002:a17:906:cd1:b0:9a1:e011:1a62 with SMTP id l17-20020a1709060cd100b009a1e0111a62mr1204136ejh.38.1693390137090;
        Wed, 30 Aug 2023 03:08:57 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id s25-20020a170906bc5900b009a193a5acffsm6951329ejv.121.2023.08.30.03.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 03:08:56 -0700 (PDT)
Message-ID: <23d32e4f-ce08-b89a-fc5a-c5ec0cdb6b9e@linaro.org>
Date:   Wed, 30 Aug 2023 12:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 07/11] dt-bindings: arm: qcom,ids: Add SoC ID for QCM6490
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-7-5a954519bbad@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830-fp5-initial-v1-7-5a954519bbad@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2023 11:58, Luca Weiss wrote:
> Add the ID for the Qualcomm QCM6490 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

