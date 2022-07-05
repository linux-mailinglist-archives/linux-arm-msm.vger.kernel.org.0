Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B196B566711
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbiGEJwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbiGEJvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:51:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D334C13F56
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:49:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a39so13812486ljq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=shv90DwYEPdUFHu8Cga4VYHWdDzItCMFq4BFSIFK8MQ=;
        b=EXpa8/uKwzMzew+mn994GeiCVEwmKgmDVTf6C4LdMJ+ZQk8cTCli0GnR60hardY+1E
         2hGVWntRvgBDlPyAcsp6OQmj7N/e6M4Hgxcw2fGTKTC+Bp/oiCKS5qzJnItCTn061LOY
         SQBUqDi0P6GjkiiiFsahsD72ZRMFwmTOclakEWI5oU4astCcgkNAWbgv8BUbiASLsHdq
         v0F9vGkr5cQkHGf0Co0+dum4XqEwgsLrwyR2DiFv49zAN+Nj0zl4f0Bd0iPx0+VGi8n5
         el0lQ3Jms5CrugPf8sk6t+R+imFv9o7yHunVrhaDThCfvdIZmdhrQCd3g3oho3cSS0Ox
         KXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=shv90DwYEPdUFHu8Cga4VYHWdDzItCMFq4BFSIFK8MQ=;
        b=cVpycf0U5ESTfPYmsjRHLlcdS/19xxfKcmOVXQNeGY+qUvTUsat/0UkeIkS0kw1qZk
         X+WfTgaK/7giwQda2DTRgAqEWLy3WNhKI+qEpdXNHzRnuoDnr0YyyByV9CYUIy+GL0o2
         aWDy//Cispw/3tIEpN70MswiKrw6Kaa60zg1IeeE1fDni/Z1TGhRJhtc1sPnMmjmLqss
         u5dgp43P5b8HF3wX1qpAFnQSo65ePpRgU9aySLEb7wTOirCPNKidR28fVvJQwMEONDmx
         CILk02PDnhoM7Hr3jTc1+wCqAUnO70t9E9v1xqol/+f4NvTLTbbqMVRTEQw9YCgMGl5Z
         22tQ==
X-Gm-Message-State: AJIora975WIPACJQqVFAHvvGu+ftvdOzmiOdfP3vQUms1rxWtZgNU6BL
        psaqwwlobbMMaOJRCn03gq/UNw==
X-Google-Smtp-Source: AGRyM1uoZPMckUe4fDIWlkcjaMJ+OIVVYuinLeVA7VFD6UQOGHcf0Ahl4PkuVPIUrYneNnB79zWC3g==
X-Received: by 2002:a2e:a54a:0:b0:25a:7010:4aee with SMTP id e10-20020a2ea54a000000b0025a70104aeemr19678705ljn.245.1657014592229;
        Tue, 05 Jul 2022 02:49:52 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b0047f665e2df8sm5591179lfo.257.2022.07.05.02.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:49:51 -0700 (PDT)
Message-ID: <42f8f46f-e5e3-8e77-22e1-07fdbfb6d96a@linaro.org>
Date:   Tue, 5 Jul 2022 11:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/5] dt-bindings: interconnect: Update property for
 icc-rpm path tag
Content-Language: en-US
To:     Leo Yan <leo.yan@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705072336.742703-1-leo.yan@linaro.org>
 <20220705072336.742703-2-leo.yan@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705072336.742703-2-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 09:23, Leo Yan wrote:
> To support path tag in icc-rpm driver, the "#interconnect-cells"
> property is updated as enumerate values: 1 or 2.  Setting to 1 means
> it is compatible with old DT binding that interconnect path only
> contains node id; if set to 2 for "#interconnect-cells" property, then
> the second specifier is used as a tag (e.g. vote for which buckets).
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
