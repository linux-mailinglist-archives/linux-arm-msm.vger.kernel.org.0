Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5781E6020E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 04:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiJRCIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 22:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiJRCIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 22:08:30 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCEA7436D
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:08:19 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a5so7866200qkl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZ0/NnZ4eRh7FEd+hu9myA28IkggkeFAlGJ/8G5KLbA=;
        b=iBSfeHwX0cYihSQlFme+7TQ7NDTPCJQr+D0RDlMLYZarBR2XREvSzjH+Oj5xOotmWs
         fQPj7yGzNxt9f7UkvY+bls5CkPQ2wsSrncHeIqj9JSgtqDwNpSd5+34JAn7EJDPrCY1t
         lr22DRsBN4L2/4ZeDNyOX60idfpSPtXSNLQKLrCNhKb4//9GkynBF9OUBOmViy+qhniW
         ZRHjtEaLcgxe+XY7yv76NmUbdCIdzid854IeY9xbFilD5QbSyjD49UIenO1yfZnJBz41
         AHFdwO3rNVfa5K5CB+knhzTdyOCOvCXy3E5kyVuOZmBqrwsgROVuGDkqVhBTCJxMEQuF
         qQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ0/NnZ4eRh7FEd+hu9myA28IkggkeFAlGJ/8G5KLbA=;
        b=5S2KO4+Q6ynK+OEHJ7m3ojk/ZWAopP4kBelT1Nhfza3MryGXYkooJz/GR01CmYlfbl
         cxp3a4eNw6jEW5YmswKNi8UFsePY2UY7hFUQcGaTciVvLQMWYB7K8gcEEyf9t4Lwypnx
         qCqOkIiZI988l6BvVgf09n3urePC7f7R7phwZmrq083qiaMUj2Ab6SPWwl8TITA6poAb
         QcqK3BrIjpvZNXmrY/6psByQ9jy4oCg35zJpuI1iB/OTmNpOXPKDhkRngeDYGz6QvK2A
         hq0Wa8AY0YL5lnuFiAHWEX0Xjavp6xA7ZWAqCGiYQaArXhcfsiVaB+BfFSu2MwlXVYfC
         hnog==
X-Gm-Message-State: ACrzQf3oYCqnOTDzrytWJXvFhx+eExWoblFbwr9DKWVyCr5iLHbfp/23
        aDgn2ZydndU+hxTUYVFEbSt5Bg==
X-Google-Smtp-Source: AMsMyM4ufgjSTFobBJ3ukrxW4y+rVVxuE+aEL6G4TrT3959jzeLWgCAjO+Hl/uFfpyNgoiz0EdYgTg==
X-Received: by 2002:a37:6905:0:b0:6ec:a669:2802 with SMTP id e5-20020a376905000000b006eca6692802mr388324qkc.740.1666058863638;
        Mon, 17 Oct 2022 19:07:43 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bs6-20020a05620a470600b006eee3a09ff3sm1300491qkb.69.2022.10.17.19.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 19:07:43 -0700 (PDT)
Message-ID: <fb57676e-749e-985c-9ada-596323227f87@linaro.org>
Date:   Mon, 17 Oct 2022 22:07:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: qcom: smp2p: Add WPSS node names to
 pattern property
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
 <20221017125346.3691-2-quic_mpubbise@quicinc.com>
 <b6f62f0b-1280-0ac1-e00d-7bd5618571dc@linaro.org>
In-Reply-To: <b6f62f0b-1280-0ac1-e00d-7bd5618571dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/10/2022 22:06, Krzysztof Kozlowski wrote:
> On 17/10/2022 08:53, Manikanta Pubbisetty wrote:
>> WLAN firmware uses SMP2P protocol in order to talk to the application
>> processor (AP) in certain cases like WoW (Wake on Wireless). WLAN
>> firmware runs on the WPSS Q6 processor (Wireless Processor SubSystem).
>> Therefore it is required to have sub nodes pertaining to the WPSS Q6
>> processor and the application processor in the SMP2P node.
>>
>> Add WPSS Q6 (Wireless Processor SubSystem) node names to the pattern
>> property required for WPSS Q6 processor to communicate to the
>> application processor and vice versa over SMP2P protocol.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ah and I almost forgot: thank you for detailed explanation in the commit
msg. Much appreciated!

Best regards,
Krzysztof

