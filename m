Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F19C60B386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbiJXRIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbiJXRIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:08:22 -0400
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D7A3B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:43:25 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id f37so17336003lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+pnhwW99cTw7scNFOxjgNR2d5xs/7m7uEnUqhN6l+s=;
        b=jDOalpdueUOmeUwnu05qGLW/y828Wm+sQZXntgc7GyCmERl6bIu7J9N3+Q0pP0Y4LH
         lDcH8cFf8hmRTHgWxtMNU5PPoWhJc6/1A6O+J+yWIlhnvAmqlYJvIzME0XhaJKxwMV3+
         VhzejqBagdAit3133+yz9DS6ia/53neLcDW+z1wX0zv5HJUO7MQQaD3um5k25GWKgDEx
         kVDXbWl0cLqXXjnwZiMgCe6jxSJF8KE06RqF66/i73jVZbeRJe0FsHFE7lfyjYCYKDL+
         PcNXPaHgPW6gGOU6MjxLaj4QMafnyGUw6k/T1siKnfWq86023GwT1jBUpfVjLJdorMdS
         jDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+pnhwW99cTw7scNFOxjgNR2d5xs/7m7uEnUqhN6l+s=;
        b=hylutlLgA2Gd7UhZ+v0gOgcn5J05kxT1B42EPKY9MXbub3VlvD9cvrJZl0KmMEVT36
         6Qm20Iqpf2S+/PJ27sg2OsFh8E7BHKld6SlwJ4uitv/ajVEqP8NJwePeGdEzK82pfdZS
         90LstqRDVfh3fqdvITCJOWHsP3M1v9XRm4MUyaoyUB5r+czZfJ52FVLrfAfrQxXcv1xH
         YntK93zQPUfQS4BUXQBFCdOLrvhMLQCN6Hk2V2hYsQPsqNAv1Jq7RccLbnPXDB0JlDWc
         trPCgxlKPBT5QbQh3CY53iWcYrIUlsNklNproA6E0yZbFnWlHG+AbJaKZgFHMJ/ssb3o
         SRTg==
X-Gm-Message-State: ACrzQf1VtgqwaFMEmwYRetiOP0prP1zYStKwZ1MebNwhJ5LbIo6qLzrH
        jvk69N0VL5G0F4q+Xv+GYKk+kl8ehz+sYBno
X-Google-Smtp-Source: AMsMyM6ssdpW/5qZIEpdjhMs07kRdaLgDzCuGJsaVvkv5NJYgbzyQY/Bj+vUQy/fvFwJY4dckcj+9A==
X-Received: by 2002:a05:6512:3b10:b0:4a4:74c5:de39 with SMTP id f16-20020a0565123b1000b004a474c5de39mr11178530lfv.626.1666618289806;
        Mon, 24 Oct 2022 06:31:29 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k22-20020a05651239d600b004994c190581sm1246769lfu.123.2022.10.24.06.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:31:29 -0700 (PDT)
Message-ID: <fc904679-d82c-7da7-5146-e964980551b0@linaro.org>
Date:   Mon, 24 Oct 2022 16:31:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 06/10] phy: qcom-qmp-ufs: clean up PHY init
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 12:00, Johan Hovold wrote:
> Clean up the PHY initialisation somewhat programming both tx and rx for
> the second lane after the first lane.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

