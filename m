Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD42518389
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 13:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbiECL4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 07:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbiECL4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 07:56:02 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438D025EA1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 04:52:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p18so19539130edr.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BMjaOxeLvfbAQKL4fJy5lLSzZMNC58W1jnLqgU85Jog=;
        b=K+c+wJI5HfSExS64NoDAjfANKyor8AYu/r8F5qacXGToOMqrc+g8zGQdBRVPhixbyp
         tBJ67sdbujQaCXAzZOhk2/NZCFM86f+Urh4n70gji1uu6UWqdZJWw6ELroFo8qW+QiYe
         +M7GJLsT4iOYXeH6f7xzRbuc8/fSfou/JxUz54W+JDE86+gVmB7+7IyQ8eRikX93KU2B
         hPEvL0FF6EprlUqqhkZ+BuZv/KNeu6XVmHJMC/++zNTpxvL+BR596hJKwQxq/8sRtR0k
         HmZ2BtDxd8LfsxNPJeFRy6SrgQQSyirU9lrhvHgcg9EYtgr53bC6HVmMUMuMoNoimqpg
         HPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BMjaOxeLvfbAQKL4fJy5lLSzZMNC58W1jnLqgU85Jog=;
        b=Xtnd2DYD/2ZobzyT9lY9+tqEacVk5K/F2ggKyRcCdVJxUBEFlVSmx1kWZdWPvYECJI
         GGirGXx3/PHgT6k3ghikezo26QVQViNZzby/6fOHdt3O1Uw9dmEl1sZLgnYXqJeH+f4o
         drY4pdzIkxFK863sPMN5wJVnZLspUwtBRDejBhuWq0PHXTBWlIRka9OKYvHsenwg6lx8
         IFHUUWqCsQn4gdlOi7alvMzZ57PrhLmoDfQEWGh3gCuNWzGiXYzYWeywo4yTsH0iM6kJ
         BeFxUZEFiJfHAZioyTUhfXnKL5u5dLOhHdz1quLSSb5oHW/r2xBoiPXDwykTKd8p15Ea
         pT6g==
X-Gm-Message-State: AOAM530wioIMisuxLeRJ/iYboFrs99sgeod7wYY7zbmkjEQu5ziMtL52
        8olVmKhFcMz7v5yjkIaHAVUsnA==
X-Google-Smtp-Source: ABdhPJxq19D2Ptf3D9Rscx6BrmIICbLZQxt0F5O6lwAkka0hw//bMvCuFjYKo29efvjaHSsD8ydwvQ==
X-Received: by 2002:a05:6402:28b6:b0:425:e137:e31a with SMTP id eg54-20020a05640228b600b00425e137e31amr17729400edb.215.1651578748820;
        Tue, 03 May 2022 04:52:28 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w24-20020a056402129800b0042617ba6388sm7714160edv.18.2022.05.03.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:52:28 -0700 (PDT)
Message-ID: <d2268fff-1c47-5dfa-313e-7c0d5a218899@linaro.org>
Date:   Tue, 3 May 2022 13:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: qcom,dwc3: Add binding for SDX65
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1651482395-29443-1-git-send-email-quic_rohiagar@quicinc.com>
 <1651482395-29443-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1651482395-29443-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2022 11:06, Rohit Agarwal wrote:
> Add devicetree binding for SDX65 USB controller based on
> Qcom designware IP.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
