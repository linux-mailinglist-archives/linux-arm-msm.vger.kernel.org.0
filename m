Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3284C6B8CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjCNIQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjCNIQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:16:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09CE311D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:14:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ek18so27345360edb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781664;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hILwsYVguO203uGlv5ZObTtNO9bpsD9SoplrKAiLSj4=;
        b=mNt963QXVOEeTKIWvCmogNQDr1hdrDZ/GX7PSmYFI/mqB0ktUR1WGV7d1km1ezeCJE
         yKmVI++RIkVyskIlMoRhHJz1pXG8q7VwypdX+sky2kjdGWYoJ75NH8h8pG1mL05d0Z46
         kOciv3qXMKYysV8sNg4H38oz53GV3y4/+GOQfFwOxaURujp9zDQBYdYg9Aa21XtQg3+q
         JLlPa1BCYCWqW9mXyy92zWyBWwOeambNyQ2UxwgTQ5bFk+8fm3sfqI1DPYtl0iHzvUlB
         ic8nfauSiJRXl7zSYUOer6dFSA7tkrnH8zX28D8jspXXNXkxtmKeSUJEVGuoJvpOHh+9
         PGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781664;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hILwsYVguO203uGlv5ZObTtNO9bpsD9SoplrKAiLSj4=;
        b=sNfRI9ElOZKJ0gPuE/VAq/iA1RGpVx3LeIUn6O2dWqqxP20qw/AxDCJXBLGXF123qC
         3w7HGFLR4vBLBdpCQ+YAPWNz96A3hsB0lJk3ftiXw+AMZGu2yS964JxJ4H97CR3B5ZzO
         ZYM//QjGZLYaT5ah6lR1HioyyMjUZuvztLc3XEZ4h7t105DPxhOOpq5qMp8IPKqe+DpE
         DTsr8RtBIyn874Tzawkh8gf+YJmylz5rC5jsC16Ks4KGx+jHmrc9+mEueBVeoWQvQ2WZ
         OmIkUwcGvfZaBXfU+pWvW3oY3iz199NlqjelxLV4DRMfrfdVcqsSQmoevoyLNsGi25M1
         DoiQ==
X-Gm-Message-State: AO0yUKXsGAMTmaAxMAKqz2+GRSQgtyQ2uEYc8r2Ayv1750ZwZcFFyo4R
        XwuWaP6KXK58tiR8DXaRKkIx1A==
X-Google-Smtp-Source: AK7set83ai8ey1Xq8cs8WcX16ZIX8AaH/SsmCPzB7yBaz8hJWmIDplCbMayvPOAKSgDTQYigdYI9Mw==
X-Received: by 2002:a17:907:a649:b0:8f2:62a9:6159 with SMTP id vu9-20020a170907a64900b008f262a96159mr1778957ejc.2.1678781664671;
        Tue, 14 Mar 2023 01:14:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6932:5570:6254:9edd? ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id rn22-20020a170906d93600b009245ba892d6sm791368ejb.103.2023.03.14.01.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:14:24 -0700 (PDT)
Message-ID: <37cff42d-d6a4-8784-c70e-f0184ee84698@linaro.org>
Date:   Tue, 14 Mar 2023 09:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 1/3] dt-bindings: mailbox: qcom: use fallback for
 IPQ8074 SoC
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230314050005.10409-1-quic_kathirav@quicinc.com>
 <20230314050005.10409-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314050005.10409-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 06:00, Kathiravan T wrote:
> Since the IPQ8074 mailbox is compatible with the IPQ6018, lets create
> the fallback to ipq6018 compatible, so that we don't bloat the of_device_id
> table in the driver.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
> Changes in V2:
> 	- Fixed the dtbs_check warning for IPQ6018
> 

I responded to v1, so for formality: NAK.

Best regards,
Krzysztof

