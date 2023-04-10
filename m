Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4F86DC9EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 19:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjDJRWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 13:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjDJRWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 13:22:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000FE26A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 10:22:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50489c6171dso1543983a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681147335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aF4gu0RaNrTTFCvcYQcWRArSpPeebO9/4yLFj3PI3mY=;
        b=fWCOpX7/SwjuHyqJLAqClg3voZ5jnOfmERlA2t3+Wdt9T0LUdPTYVjAYkiEPr99UP2
         Nx8wnItxxh0CdR0zx6rkW0veQhlk7VxWS5zTmRO0dzt7ojT1RYshEkgPSquRabUVM+Ya
         dHJ7o4zREoGZ/ccqzPge9HqhFAOi/MIsI4QoXEWtHuUxBiKXcnhN3unjMjlv356KPCEu
         PJii2cjj5EbSPOeVYME5nVy2k0DoyEcMbWlniNuwM5+ttHHgciawikdWbFw3uZUd1vlZ
         w8rE6Ep82LRdkZkdxQRb5K/92nPikFsWfYi41qGwZC1PTvf0dWBevYf8xjGNnFTdhEXo
         3q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681147335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aF4gu0RaNrTTFCvcYQcWRArSpPeebO9/4yLFj3PI3mY=;
        b=IblkJnrvS5Ko+JMlQydmrGuBEMvdKsMtHazbGPnz+X4yyeza+iMIWtwY0YXloyg5/u
         SzTvvhoMe3KRHoPZwhpcl36CtmeYT+EKoduaxYx3RM95xP79gWCqB0vHMkMsydX6To7K
         n6SHMjGURcqan2nkI8APu/RiH4xJXUIvrEnFU9rkDmz21eJ75R6mFF1Ieju3lxVUYD8e
         5dS7T05vXKTgMJSWqK3OuCzOckJmW+rWxycN+LbxEJ/jJyvLG/P13gqV5z+oypNL9oLA
         D3Tugcvcdi9K0Y3vP2Le3z/AoM/HpQFrZFOT3IddqsWHhlXMZpOuthXXPUZn01RFGpe8
         T1tQ==
X-Gm-Message-State: AAQBX9fpbzXuLwyCBgdjo6MIO4C6U8ukDvNgLAG7klQ2wc6qhf6vEMuh
        2B/VfBuhaqt+HQgSSP9DcQDNxw==
X-Google-Smtp-Source: AKy350aNsSC8fqZ/yvuVJrmsoq1jKWAOxaKpue1KeRo5d69Vg7dnLJrE0uJOHhunMzUrshZGuWOHOQ==
X-Received: by 2002:aa7:d14f:0:b0:4be:b39b:ea8f with SMTP id r15-20020aa7d14f000000b004beb39bea8fmr6554535edo.2.1681147335445;
        Mon, 10 Apr 2023 10:22:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1a6c:6968:e633:48df? ([2a02:810d:15c0:828:1a6c:6968:e633:48df])
        by smtp.gmail.com with ESMTPSA id h10-20020aa7de0a000000b005023ddb37eesm4875429edv.8.2023.04.10.10.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 10:22:14 -0700 (PDT)
Message-ID: <5d5e5030-7db7-447e-e5a4-2157171d7575@linaro.org>
Date:   Mon, 10 Apr 2023 19:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/3] dt-bindings: ufs: qcom: Add ICE phandle
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20230408214041.533749-1-abel.vesa@linaro.org>
 <20230408214041.533749-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230408214041.533749-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/04/2023 23:40, Abel Vesa wrote:
> Starting with SM8550, the ICE will have its own devicetree node
> so add the qcom,ice property to reference it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

