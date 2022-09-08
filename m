Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7AB5B1F3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbiIHNcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiIHNc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:32:28 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D78CFF0BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:31:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bx38so19868000ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=K8lsIXUFAXFlvET6IMdtGmpuoPDOZDFg3zMmcGfzIwI=;
        b=Z/99+K9k1Ibo1tPR+57rjDoV1qxZEgDqsG4vHdLURL6Ny+9TcaB2J1SYqWcU7A1zyk
         CyXUHCGgSKb5zWrMdM7QladzOgHyiasHGw4ND6um6GpoNPg7P71NVv3pIlhATtFkQb/4
         3+9TOmp/L40w+0ifimb7Qb/NsDhgPIfAa0GSyeJa6aTCsJG9NFaXHasCIV3YBuPi6fGL
         SNZUZwB4K+TRpdtZfBFUdis0gP3da46HfwiLA1uVLNUyIZaQy7CmwpVTyHWnpSXnMxnQ
         UZ/cAlHiYMjU++z2lZrEkqJqM1vkPXmR6c4x0MMZOX6+AvHtk/GNxOU+jxHwfpEhfudg
         mYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K8lsIXUFAXFlvET6IMdtGmpuoPDOZDFg3zMmcGfzIwI=;
        b=pVMfrW0h83+N/6J+3rr4Xg1ZJB/IsSLVsEIJTO2HAMuGp4wQY1o5I/kJKXK3NtvRJG
         b1rOjkX+YtdQ3VDySubVISs+ejiC1ti3jFVLhtuOi8dqKBSCNHgwflFCzkTLdue2w+xw
         NG89Ftbr3oJUSGtMRRM0FbRvgZ/PWkUHYdwCYfFDdNA4Bk+0IbLC6Dzvm8e4QD755LdQ
         U0Lr3w+CZOfIDyeO/jXj54oTUw55rCGwD2EQaRaPtCPzeIl6jx/7uq/uAVcsqzEUc18z
         zHOHmomlKvCa4nCRgZKZVirdL/Tlqdo0aWrIyCSHGeJAVeK5E1cXnr3RBKR02Y+mQ5UM
         QYhw==
X-Gm-Message-State: ACgBeo2kOqaRR9a4VmnmlwhFPIpX6wHkNqngJgfiJb5cP1OHQSNCWxwl
        8fe11mYtYwU6buAklOwbjHErnA==
X-Google-Smtp-Source: AA6agR7n+DhBD0AHyU4D5+n4AgxeApq7jxVuKSkPHwBfUpELv4I4hWyE5YDn2Gmno7sD/lWJlZy0Fw==
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id 11-20020a05651c12cb00b0025bfa3f0c3fmr2611062lje.364.1662643864620;
        Thu, 08 Sep 2022 06:31:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020a2eba0a000000b002688844741bsm3195632lja.126.2022.09.08.06.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:31:04 -0700 (PDT)
Message-ID: <06748378-f5a3-5dec-eba0-58123084c51b@linaro.org>
Date:   Thu, 8 Sep 2022 15:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead
 of EXPORT_SYMBOL
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
> so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
