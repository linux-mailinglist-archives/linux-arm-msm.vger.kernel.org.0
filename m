Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E955BE278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 11:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiITJzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 05:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiITJyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 05:54:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E350728703
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 02:54:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k10so2877356lfm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zaiJOfQLVu73Ck1GD1MriF7Mol9UFK9xKfuzOqaBT4A=;
        b=Jw/wO21Q4x/c5PtqYlxbn3TmvK1FXUJ7IayvEGytXCzNYKIVa8dlgeGHlu5l5ABHBl
         nLCCNMdTPTpCDoL4ENYZ+mZl4nHu6cy2TIZDpx1ragarQdDHKmkjzZ1k2+ARO6YpLVRY
         DzQaI0pxVkB05BXs5iIpatov7KhC1j+MaZKnNRx6MKfLIURTfMb2falryKInaCaMbZIh
         8wsU3hacgoyCqPHcoWD0E0sKTN+5P05WnwvvEURHnxAUJI7ZsFDUi3yttSGeZEHaJV8I
         4OPjhANihPng/LHLZQPi6AUfND/yovLT42sUAdw6rhA0VKwl0Kgj/4IDwAI51RYs72RH
         vjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zaiJOfQLVu73Ck1GD1MriF7Mol9UFK9xKfuzOqaBT4A=;
        b=NT64McktMECgd1MXNM8JgpkUZd0jYOL5LZtYqfXCEfn1443blcvu5zX3Fv7GUdQuWt
         AWv1d307q/vytLlY4Xl8eoFXJRFDc0Am1CPH9LAbV6+ZDPxt3jyMv1E/AagjHg1DnYiy
         Q/xhDTwYdOx+ifEBz/otXhDXgHOymTwf+01tXaGIid85Tlv/WjD7sDFETK4XKw/Uqwt4
         6topLlZJYXeWZy2/Tis/ZSd4HuvCwrPa7hRr7CM8xNVE1A7M6vfmGbBHl8NH7XUs6Kud
         6Dpg5NlCn/jM7KIz9PAAfQIa4YLQJoVfQ6OibeGJ3vNS89F3KGbNGF0w/qubR7xfJVwi
         QAUw==
X-Gm-Message-State: ACrzQf3PB9HqC4CobC2xipKF9qmv2Yk2Q982Hw4Dc2ubn/n36TC8FNbo
        71+BCjA1ELuL+Yr9J+LiISxv3g==
X-Google-Smtp-Source: AMsMyM5CfftZngElwySLO5p8IGXRjK+YA25ghlxdDuiuHKTzdzeUgn57EGrNlet0OGabjvK1lKvOCA==
X-Received: by 2002:a05:6512:234a:b0:49d:3155:45a7 with SMTP id p10-20020a056512234a00b0049d315545a7mr7259519lfu.245.1663667690971;
        Tue, 20 Sep 2022 02:54:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t2-20020a2e8e62000000b0026a92616cd2sm184276ljk.35.2022.09.20.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 02:54:50 -0700 (PDT)
Message-ID: <a047f284-9af4-d5f3-4cb0-5c9955237fbc@linaro.org>
Date:   Tue, 20 Sep 2022 11:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     andersson@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920030316.1619781-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 05:03, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

You did not CC me on cover letter. There is no changelog here.

Please resend following Linux kernel process, so be sure that people
receive relevant patches, changelog and cover letter.

Best regards,
Krzysztof
