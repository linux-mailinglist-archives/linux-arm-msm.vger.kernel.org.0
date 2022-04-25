Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0DC750E25C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 15:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbiDYNyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 09:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236292AbiDYNyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 09:54:15 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA1952B0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 06:51:11 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id k23so29783176ejd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lvDYSVLEz6MX8jn1qsRIcUfd4zctL5et+HotZrSw3M0=;
        b=EhmAHgaqMcUtOkQCWSIa5Xd116fTJXJndx2rktXEooY6DDZmZpg7Wm/a/CMfNnHfuV
         Z+z9qYDHosYITfbwuKxdfe5XgZlwBDhaR7+95loiPp7A9j6tqNNaF6t7VnYZW2/Ttnlw
         MGoYu+x6mWvpe6Jr0iMXRPdPvLGLy/1G+ISxkzCGajaiqLRWlSTQgXrflJBbBMUlZOD6
         MEH79Ike6ZF/10okvCRs9raLPrRzqiGyRrj0lMkHXHrNUhRMSs8Qm21HN7Dq0C2hbcni
         BtFyM8efGtf3wPGvdUdVtST0SxurCv9fsuqmpt/aMxXur2LcNV8VoF+ISazBucKV5Lql
         kg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lvDYSVLEz6MX8jn1qsRIcUfd4zctL5et+HotZrSw3M0=;
        b=lVRKlOuA/rgsfaMN46d4j47Ow0Dw70VvLNF8YJhLKJ0KWC1ZUh9lxpz8fRmxzd0Ujp
         T4COBS9ttRbnV4Zwm4+t4jo1B7FvO+F7cJFWOmpdB2yWXEf4ODNCC6q/YXj67epah2OK
         QOVct8Czw46+sw8ItQAJjHCj57vo3Jq9N98cPUJRo9S55fLpSmvAlQBIvOh0zMix/XNV
         oEa1HQubeCXMaaHy3CYgI/ocNG/eyxUbakutXTSIYmMGjq2hByal9ogPEsz2ghk1e+Pt
         X215Cnq2px647lW28qK4MGOEeO3d6l2GFlAFY7dXSFuPAZ23PM0+Cytw2PhZ3OgTqI20
         Jj5w==
X-Gm-Message-State: AOAM533MwmzOj+yU5SYEowjFE3ADsrcD8GthrCp8MgBpi5VxOuXgf8li
        NHIb+G0sYDduBOWVnMqiyNTnhg==
X-Google-Smtp-Source: ABdhPJydFSs44O2Kkt0lcMAdPRY7IBSg6911ApfPUGfksHn2Esd3ULG1Yvmxdqz9S8NKIffTCKFwqA==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id q24-20020a1709064cd800b006db0372c4bamr16160386ejt.57.1650894669737;
        Mon, 25 Apr 2022 06:51:09 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v20-20020a056402349400b00425a5ea1bb7sm4755800edc.57.2022.04.25.06.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:51:09 -0700 (PDT)
Message-ID: <6f72be3c-c907-bc7a-6b64-6becfc76934e@linaro.org>
Date:   Mon, 25 Apr 2022 15:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: qcom-ipcc: add missing
 compatible for SM8450
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220425134717.55418-1-david@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425134717.55418-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 15:47, David Heidelberg wrote:
> Adds forgotten compatible and update SPDX header.

You need to explain what is this "forgotten compatible". It's to vague.

The SPDX update lacks answer to "why". There is no reason to do it, so
please explain why it is needed.


Best regards,
Krzysztof
