Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7546F6C2AA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 07:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjCUGqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 02:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjCUGqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 02:46:51 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0552E1BEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:46:48 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t5so18888962edd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbW6WAMhZTX7WnxINd+j72LPEfzo1MLGZ6GMQv17NLo=;
        b=nd2EUf30Ha8guzZQeguGoOZ1uxedJlSDmM3C/DHeLd0pnss0I1EeRH94/e1glqS7ak
         7DTyb2vLUUWZlnRnUESGrKTw03BiXFv8cN/BjW3bifRXsr+MJhnM5mxqDrJhmO9FwuXg
         cks5cLJXSzsA9yFFlClT/AQy6L9ysIif5fG5oTczicCWIgI4uk7MIPHgr9RxLGLBnoqZ
         yBR9UtZF4d+BY3WmowQlf8h83zqsU7ynaF8r1JtE33mdQ90id+c9fiE0I0RdT/6/JtVA
         j4z6wexc+r+5GA/dd/1XMlLXEb2pYsJ/Zp9Ib8WvouBd8B/A25KhefWSN2q5AEJxPLw+
         TlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LbW6WAMhZTX7WnxINd+j72LPEfzo1MLGZ6GMQv17NLo=;
        b=2cuyI6Uh/VMqubY5Auyro+HuVorhhHlQtCvmutuYMOJmFj2jji+pLqYoYYYwZM/R9Z
         ykkMPsQo7RAp4bv0evg2YPJhQRPknk+KoI4bcxgYAdKr90Q5n2G+FAFh00AFtP6BPERV
         9Zac5yMAJDzkhbNpI7zdVi5/qPHxOl+6gbnH6juxlNCifb1xsZiaMXzRsQsEYLpHmH1J
         oacKtDYg00F6MvHeWotFJuWPTVvZLf0ryF/dHZUFAAQEHUbJjLJmtuUp9eM1HPhr+YlL
         tym4FJxtjmvWfA1PKOTEE7RaOEb5w7yvY0rGSLOI6bSAdaovxYKzze5dkCLwt65IYU7p
         vbGA==
X-Gm-Message-State: AO0yUKWHXzcwg1e0oxNId4oTEpMzpXW57sQs5E5hJMD+g0WAGk6afY6U
        nSrYnwVQ6ypaIF1lgtoKGnm37A==
X-Google-Smtp-Source: AK7set+GNJOQMSqsHpsaDD+hA45a1SCbSDj2lMuArq2m8zTO2J7rS3eLvgQt/d/gPzLHoo0PsaGV0Q==
X-Received: by 2002:a17:906:4ec8:b0:931:95a1:a05a with SMTP id i8-20020a1709064ec800b0093195a1a05amr1837229ejv.62.1679381206457;
        Mon, 20 Mar 2023 23:46:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906195a00b00930a4e5b46bsm5310855eje.211.2023.03.20.23.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:46:46 -0700 (PDT)
Message-ID: <68b68812-7317-bc55-7449-18912438eb46@linaro.org>
Date:   Tue, 21 Mar 2023 07:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next v2 01/12] dt-bindings: net: snps,dwmac: Update
 interrupt-names
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-2-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-2-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/03/2023 23:16, Andrew Halaney wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
> interrupt error msg") noted, not every stmmac based platform
> makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
> 
> So, update the 'interrupt-names' inside 'snps,dwmac' YAML
> bindings to reflect the same.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

