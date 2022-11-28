Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201F763B097
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 18:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbiK1R6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 12:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbiK1R5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 12:57:41 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B122CE1B
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:46:15 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j16so18542142lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEOQc33dh/AvjD98uU08ScRRQgB0t4Sl60gjFCfdd8U=;
        b=yhQe2+hZGfKl6Eo7WYzGcxfG3vjSEekJKA7nkO4rCuvo1+vY9HSx7lTw++LjKu/T/q
         oGUXqhJeeq5zkrNXRdMIXEFvx25L9KApHsNm/KXgY0St375VrGNtLItCRFyN29hplOG6
         9gc1TkStI7/j15OBs11Mxh9rYZyPpUVHBhF5knolHECXFL5+3duh5oHFGVTX0TJZqCY2
         0BJY2g5+4peU0+TLiFM8tpUkUUinQ3YyvZAY2e5+mZWFJ+hkAWMBIXi4Dwl0uIXDo4R2
         C9RP3oO6WQ6L7MTO7JCOcqg4KnvKi2GPBqUPL+ljPwNKtpXPJ7tbsnyXLpyeNVrQ1Nxu
         pXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEOQc33dh/AvjD98uU08ScRRQgB0t4Sl60gjFCfdd8U=;
        b=zArTMY6VsYGQ7O5NwqJYi46Gh91/qVDel+qpyhxy+4kf+jprZspx7EtEru7AC9GkYl
         NaFsr/VB0R/hGG5IVE11YWopMpI5/H6gb04SWyPucSd8CPkToefl8TcBUvFRh4NBQ6qi
         YQhHQJG2XGSWXzl2b8xrQq7RQ9+0UPRewiwFfJoIQ3GpN5zdl2UgL94MhtDxfgsISVlC
         zk/85B0Cg9absumDCfh/sqzaFaSljr40L8kAJnYmpWwUD4S8VAC/ONeerrPq325B0zpE
         kKurFZ654QbG40pVoSall1I1E1yP9twL6qqVyec6hl1VIX6PCkYN5d42FzRu8sc8Trgv
         4nhA==
X-Gm-Message-State: ANoB5pnpqHr0fImJa/h2047rmAaBEKCLQ0KOJL2DVKIirxKN1Qqy/8cX
        4nPGqrXNEQiAjpmy7hPEKr///Csrl0uwnrj5
X-Google-Smtp-Source: AA0mqf7Y8q4j5Qp8K52/Qdd96mqJajrlcpd3UQv1lIPTFAuR7uwCLpQ1Ju2x51BwH5f5CeII2zXU/A==
X-Received: by 2002:a19:4901:0:b0:4b4:e3b8:c6af with SMTP id w1-20020a194901000000b004b4e3b8c6afmr11777772lfa.291.1669657569898;
        Mon, 28 Nov 2022 09:46:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b12-20020a05651c032c00b0027741daec09sm1252772ljp.107.2022.11.28.09.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 09:46:09 -0800 (PST)
Message-ID: <dbf8082b-679a-b2d5-6568-3f9a93e52501@linaro.org>
Date:   Mon, 28 Nov 2022 18:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RESEND PATCH 1/2] dt-bindings: nfc: nxp,nci: Document NQ310
 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128173744.833018-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128173744.833018-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 18:37, Luca Weiss wrote:
> The NQ310 is another NFC chip from NXP, document the compatible in the
> bindings.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> RESEND to fix Cc


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

