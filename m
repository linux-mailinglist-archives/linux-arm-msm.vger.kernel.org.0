Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A156020E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 04:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbiJRCIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 22:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiJRCIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 22:08:06 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E2BE3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:07:40 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id w3so8904977qtv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ki58ImVVG7/5jd2KJXq0LfVHplTUM1bcydE6+ueyNM8=;
        b=SkCUX1dvMbwf9/jk88x+peH2lwBkEaNWowWIERkGdVqHzDsjCfEVMtvCrmD0KXvDXc
         6boHd8um9mwoZW6bgC+NjKSOwVGgjCrOzfAixiuZaSZeTPPmWyoYHuGbfyeNmVugt24N
         CATt9Ih6YEqIoO5XJbStvQ5Sl+VK0tB961Nn73Hn1wpBttJfsbBIZJDaHiG68qfG1dAT
         eLx5GIOoNNNjmMK07Do/hKkV56Bq02zDcfuP1RrAFqAeTGJe+b23ZeewhWj2avcfIm+S
         PPzNg4G1RCw0gwLKZuSDBTCdqRRL0NC/oyF3krmQ+QouGDoRbUnTP17Gz7R2VwiKACne
         W7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ki58ImVVG7/5jd2KJXq0LfVHplTUM1bcydE6+ueyNM8=;
        b=voU+CDeaVhJB3/FgHtI2VmdRHnQ78sRb5iWoNAUXG29qOyXVxOs0WoWRoiSZM8DXa0
         NevgAZ45nzoup41YatUb1gIsNpJ/9FqWCjRbE1vWv1qSfWKfJNvRCuf2ONi5fbVflDZK
         tPCMxdrz8OgHWrc3h+HCZS/OWcrT0dTMFxUzI6zJZWUrjlnUU/heC6xmrQQuP2IfRvK2
         1w5vBIeEukYSopfeTPCh7kn2vBq1s1GbtEb3QMWNBXobHVWWf+puuMRrZxxRhCAOE5rN
         ciT0sdnBih0SsalR52x9BPpc78DfN4e0AShn5rG/sD9O1CnSYtfSQbJyc4WCS31bDe1g
         yLdQ==
X-Gm-Message-State: ACrzQf3j1sCRsz2w350Fldj8ujb+C1vgtW2jUM9BCr8mKIv4nLsYey/J
        OVEbUm+4IQ3NG43zAOlrSym85Q==
X-Google-Smtp-Source: AMsMyM41cGPLr8iVssJt8a5/zAUf18VOrrq8AC6Fm9wd48YCE4aklOl8d26gJZvGsS72wcv7DGzY6g==
X-Received: by 2002:a05:622a:11cc:b0:39c:d274:6a25 with SMTP id n12-20020a05622a11cc00b0039cd2746a25mr453517qtk.686.1666058803861;
        Mon, 17 Oct 2022 19:06:43 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m15-20020a05620a13af00b006ee949b8051sm1190668qki.51.2022.10.17.19.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 19:06:43 -0700 (PDT)
Message-ID: <b6f62f0b-1280-0ac1-e00d-7bd5618571dc@linaro.org>
Date:   Mon, 17 Oct 2022 22:06:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: qcom: smp2p: Add WPSS node names to
 pattern property
Content-Language: en-US
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
 <20221017125346.3691-2-quic_mpubbise@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017125346.3691-2-quic_mpubbise@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 17/10/2022 08:53, Manikanta Pubbisetty wrote:
> WLAN firmware uses SMP2P protocol in order to talk to the application
> processor (AP) in certain cases like WoW (Wake on Wireless). WLAN
> firmware runs on the WPSS Q6 processor (Wireless Processor SubSystem).
> Therefore it is required to have sub nodes pertaining to the WPSS Q6
> processor and the application processor in the SMP2P node.
> 
> Add WPSS Q6 (Wireless Processor SubSystem) node names to the pattern
> property required for WPSS Q6 processor to communicate to the
> application processor and vice versa over SMP2P protocol.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

