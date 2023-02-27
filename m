Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28806A3C19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 09:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjB0INx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 03:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjB0INv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 03:13:51 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E9C1ABF2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:13:48 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so6439334wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkVbUWuqip1JKVeXjBIarnPygYYkbu4JQXFrp3pg4Ck=;
        b=dnUzXxbFZ8n6GJ635hbd32kwPg2fY/rR0vl9WgnJrKg8uMy+x7PTaszAkj9M2moObV
         P0vWpOCzhdjh3Vedh/MXSVWzsZII8MxnIRWNu5GuLpWDAfex5i6ZfBil3QZ8iFQRhd2n
         HEYiuxukTvDiLfeQi/eukJ3rBXLkDJQvY6UArTK/uZFKFkyk7Up3cC7RXQfcLqHGgOrY
         7sCuisjfqj1GnOGuGioOFjyFY9pxqgsxc9z9W95vd0pW+jImuXAw7zWdKzea6gnv6FTD
         rXtqyTfEo4ladzd3bFMhHw2gXTLq/QyJfxrmxuKxtsYc7FkxhHwAbdQubua34JH86D2P
         Ds8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkVbUWuqip1JKVeXjBIarnPygYYkbu4JQXFrp3pg4Ck=;
        b=T2GQUsQykhjQY4TRpisSSJZ+wmTXQsJsEdNsVPIuIFWBZ8lt/wnGgQqljOo2cGL9iP
         IF8hIrR37k39kZgfRsQBSeRaeE+q35bCX3gLqBHb09HNZcizpeUQNVTwkVh/LnLv9toH
         yMKHZ0TbgpbwDXOzIfsMz+06RR2WtUJxbgsysE7/ZaYWsui0zKZ8mbtKSsJHWFCkvVf5
         A3b7V6nxfP/VZ77E+J4pgHk6+jHsxlmk8aGl/dOrA1jWU70BvZybQhs1WywLaxK8cKkn
         +zw5EwSFNiACS5YsMZ5nakOCbZ4Vu7ObGiSrbwLVkUGNwup8VoLpg3kDqm6PbUNhW41n
         v6Ug==
X-Gm-Message-State: AO0yUKUbD5xwTeVvaGkmU4yEfLhysKXxNbfipkInDdKkIL036DHJer+R
        1ixCKmfGnHvmSyu68e2UOs0A6IHYzINTErRR
X-Google-Smtp-Source: AK7set9GOz42ORl/l51MyaUDHOxw+vpO8tpY7GwqfIjGKaGWmWQoXDU9XzKvRbWYOFG7trq0PocKlw==
X-Received: by 2002:a05:600c:3b8b:b0:3ea:ea6b:f9ad with SMTP id n11-20020a05600c3b8b00b003eaea6bf9admr11191889wms.31.1677485627060;
        Mon, 27 Feb 2023 00:13:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m15-20020a5d6a0f000000b002c707785da4sm6283227wru.107.2023.02.27.00.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:13:46 -0800 (PST)
Message-ID: <6edcd92c-876d-0610-037d-51a1b5c1f662@linaro.org>
Date:   Mon, 27 Feb 2023 09:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Add SM8350 Adreno SMMU
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230217111613.306978-1-konrad.dybcio@linaro.org>
 <20230217111613.306978-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111613.306978-2-konrad.dybcio@linaro.org>
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

On 17/02/2023 12:16, Konrad Dybcio wrote:
> Document the Adreno SMMU present on SM8350.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> - Drop Krzysztof's ack, as the patch was out of context..

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

