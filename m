Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4668F68B6DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 08:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjBFHvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 02:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjBFHvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 02:51:35 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E5A1D93F
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Feb 2023 23:51:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so8043053wms.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Feb 2023 23:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gomtfilXlU/uKrZlY/UhpaMP4jyyR/oCyHkG8/L6Bes=;
        b=bbQarXqh65Ijgfmc3piYqXR5BvvYUpnYTQK8FbTJF6RqEYa07HXUUapdT2yUBRo02O
         hqs0+OjZnWzEa5A424ejFyoMwhk+x+Qiw5Uht6Htejt8XhlmutgEpNsu88V5Ybo1hTmG
         IO95ATSDD1rz579sJeDtT9PBjKx9z3gVu+SOpeBrLuOnuwwHQUc9Ta3GFJbDODCXikSh
         TI8vDE1bHCl4XOQ26nrLIX4HipYQaI/UQ0kOwOCflGJlsv7YDaYcBE/s34MrmDPJB4t/
         22A9itS+R2vPepvQ6cSpn/+N2m1ha+5SjLYQxO28UWOmztGPBld1lf3OfaGFhB9F0DmR
         pQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gomtfilXlU/uKrZlY/UhpaMP4jyyR/oCyHkG8/L6Bes=;
        b=rQYgaRyn0q5cRhsViMUch5jysY7U8kB4sEGioPdUpR5mLBbUINc34L2apjqzqnY0Gs
         L/QMTW30nHxNFueGKw0nMO6KKVGSBZGPD0utZrtPE4LnQGefbP9GIysmCFCOMBRsqYDP
         HkX/+MjMRAjVIseSbOnIWbWDtyzj/NQzW6VFQJ0Vxu+zx9XDHwF5YxmrxNdHWoqJUXDM
         Bpyp2zeVnw4ivC1rBFsxF89LbM/xZxDx41DshkFbCss5GhGVX/VddVGG5Yv5ZfbvRwOr
         WZDIc6h/BVgORj34hJG1pwY5oRrJuOpCLG2kUMdAT3qLm+fCuwO2/7zaXDKoQW5Q+ZfZ
         kDVg==
X-Gm-Message-State: AO0yUKWYWr6gvuYd7NLP2JPfQbb6DCSMxCelrbrxPwiyrWKF7/zBMfyd
        z8b010N3xmPK6TLoX0SK4lSJUfNDkyxnKdvi
X-Google-Smtp-Source: AK7set+BCCqNZBY1jKut0KGQBui6vrI4GsQI/jbaVVdvjyjT7aVhug27PeIP8ty5MYYIpukgpx5KVw==
X-Received: by 2002:a05:600c:358a:b0:3da:fcb7:39e5 with SMTP id p10-20020a05600c358a00b003dafcb739e5mr18330564wmq.23.1675669863472;
        Sun, 05 Feb 2023 23:51:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b003dd1bd66e0dsm11109022wmo.3.2023.02.05.23.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 23:51:03 -0800 (PST)
Message-ID: <6da08e9c-fc8b-9dff-7c91-b31a6a0e1484@linaro.org>
Date:   Mon, 6 Feb 2023 08:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add Square
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, djakov@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org,
        stephan@gerhold.net
References: <20230206012336.2130341-1-bryan.odonoghue@linaro.org>
 <20230206012336.2130341-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206012336.2130341-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 02:23, Bryan O'Donoghue wrote:
> Add vendor prefix for Square (https://squareup.com).
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

