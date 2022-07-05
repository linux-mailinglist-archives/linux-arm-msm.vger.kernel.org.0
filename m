Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F55C56674F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbiGEKDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbiGEKDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:03:47 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F79E4B
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:03:45 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s14so13890925ljs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AT5njUHvAH3QuRjtRgqJZ6DlL3/SnvHEB2jL0WRqjGs=;
        b=MGliCR5T4Dfn2uYgt2awymKF6EpzY3ieiIzuuU4lb2g66COYzA8R4EAVt9R3hrOPAt
         23nwgPcEXUB+izaw0hTfrCj73bIo9xVR9j/NpqOXcasAuQllLw2JGAdTcmmpB/nLyreg
         huX0EpE2OMhoLg37d4bAmbQ2OXbNKPumo94qXe1f6gCOFpJgw4rTfUqCOw6bNOkojUzz
         mI2NtLGLUEZJDPL3CtE36nkf6Q2JIyHERiYO+tKxdZvSxPsLSRmGqgOxmb9YdrVlQxMI
         rEcwHEiw8DxNrymaQK7EXS4zunrruIkRRxTNzhOx1u6xyjOZfYSFr40GoipuTrnyMRHy
         rbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AT5njUHvAH3QuRjtRgqJZ6DlL3/SnvHEB2jL0WRqjGs=;
        b=jMkBW4adM5wELXXPBlLC4CwnAFMumoEvCRtmqCbUdptEJBknt5v4nHTqoaLSh2x0ey
         TO7eaNu/ZtI9EiQO6qqjsOpBDEuUs0EtgQjl1pKuT9bErO6CpKytWMSeX7DPjeVjwneD
         NVQxH713hHDg8C4fpeRvfOCxxvIxBrGHitqkXXgyhf2qHthiLztEPIJtHr0bFhgniTpu
         PyJkQZKxNtgDulLI5DnZ5aw+Hq7eVDP/D7Ke8IME9uxdLqlmP3SDYeO/yZhFoSC1ATwS
         lUhvmxfV46oKhGvEP8eQw6zlE1AP5L6QelDpWiOugs1qs2D0wSgeS3gJrOUJYYU5l3er
         tSKg==
X-Gm-Message-State: AJIora8XTUqPtpekNmL/xithCWRrrvsiAOo0/1XT80d32NxlxUxkJANF
        cKDePmH4sP8nU8dSODX3Vdrt2Q==
X-Google-Smtp-Source: AGRyM1vaUT16FirG0zj63n29nYtA5g+ywxCOAUfbxGzN8iBCZwBFGnEMJerkNTN3y6GT5xmVmcYOMw==
X-Received: by 2002:a05:651c:101:b0:250:896d:f870 with SMTP id a1-20020a05651c010100b00250896df870mr19923072ljb.235.1657015423816;
        Tue, 05 Jul 2022 03:03:43 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id be37-20020a05651c172500b0025d19a2677asm1558356ljb.76.2022.07.05.03.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:03:43 -0700 (PDT)
Message-ID: <1c916a09-8703-21cf-23af-5235c14ca188@linaro.org>
Date:   Tue, 5 Jul 2022 12:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/43] dt-bindings: phy: qcom,qmp: drop child-node comment
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-6-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 11:42, Johan Hovold wrote:
> Drop the redundant comment about child nodes being required that was
> copied from the old binding documentation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Could be squashed with #8, but it's also fine.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
