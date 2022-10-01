Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCA35F1B1D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJAJQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJAJQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:16:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0DC169E7F
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:16:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a8so10133301lff.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=W0EnAohfnj1QSnHddmWikcojkSGbOlP/GTWK7+JiSBs=;
        b=VCqUvvmklBIf2Dnv7hBig1IEStqAT0zZUMqRv3e4GX4SsckWYLwUv45CPzL51w6BFy
         ZyoNxEddPPGaI6jKNdRYwdI+KgnOGzMqFHbf7PrM6CrtYsH/Ty1G9skD+0FbeDi+zOQU
         Pc/0aU2IAX3kq1I+4aK5lElGqLkni7IKn4SeyZ6Vpo2pBl8944N9Wo2+6hQpzVvXb1gE
         1OKB1BqWLupwB2Kb5ZEMKkZ9v1iKRVSDTxBzj8Th/ffTzcV3qlQ8hUdKdg3HFWUtTExT
         X4uCS2LJKATpUGqnlffhGyOBxWioxUvLwCXm/vS6cbvmWuissauisxY8+HMOq9uGqAns
         gL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=W0EnAohfnj1QSnHddmWikcojkSGbOlP/GTWK7+JiSBs=;
        b=YzAPP9syl7Gxrpm/Wo6BlmtHc+7+Beu4HTNMlBNAw5VnDxkXSgtVJn0w+AtHAGV080
         yVUGkhbe1kY2CjZTRlsRWdSRvai3VK1Du29RwUhyZvuaHvSAzQMyHWSICEuei68huWey
         t7KYuZwoMI88SgRfH40Hx5n9po51yuSPOJY+VVi8/IKjxKJhywajidcvDALbMQ1Cx/Ro
         BfNSrJzW3+6nuHMF2Z7tuofW0Fsj+hSpO04te8hsoGVdZfqrzMm8BMmuhLEpg4vKejFa
         LbMU/wZnQ75KHtpbslZMA5zu46AF8pJ79zClUPDshojCGPGQbolZHS/BU009X9N+F96x
         LfpA==
X-Gm-Message-State: ACrzQf15MYA2i1B9UApsc5ql6DkCg4P8Z+owyuIvau87FcUemwigDYoo
        0msNwC1ULSGT1wDDWMXQ+23UCQ==
X-Google-Smtp-Source: AMsMyM5UN4IrBvaEt4tvcihyzYGOioRhc/bCoBcnmhaxvrlYxgvfaMsJ9drljhQzXF5IMyRxpGElLA==
X-Received: by 2002:a05:6512:10d6:b0:49a:1fc0:cc62 with SMTP id k22-20020a05651210d600b0049a1fc0cc62mr4977757lfg.138.1664615811564;
        Sat, 01 Oct 2022 02:16:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j2-20020a056512398200b0049486c66140sm699271lfu.119.2022.10.01.02.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:16:51 -0700 (PDT)
Message-ID: <70d2538b-9d6f-8443-0afc-655fe60f5dc2@linaro.org>
Date:   Sat, 1 Oct 2022 11:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 12/19] arm64: dts: qcom: qdu1000-idp: Include pmic file
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221001030656.29365-1-quic_molvera@quicinc.com>
 <20221001030656.29365-13-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030656.29365-13-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 05:06, Melody Olvera wrote:
> Include the pmic file for the QDU1000 IDP platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 1 +

No, this must be squashed and on its own does not make any sense.

Best regards,
Krzysztof

