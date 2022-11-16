Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678D062BCA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiKPLyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbiKPLxu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:53:50 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9292A977
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:45:10 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so29001687lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2JjCc/5EES6LZTOK2We5DetzE6F9MpGe75nT0iWuBQ=;
        b=RJ6T6OqI3HXczmrWaJbQ2lphPIvFwXBlce7VWh08eIUhTSOybaH5/tNNg1V6xEg/VD
         XTUIWw7aem1+Da8xntjEEMWA5ct4WZn9BfsTcSw4VazDOynieR0olWOsp/seM3F1nGIG
         ZHE4janbhY02W7CKjInbc7KVxKoPu8LmKj2LSbHJ4jXTziU9yFjdstKzKKyYV1QC2qWh
         iKlQHAmsB6BzucmgWDcVP5csA71RyT/nvja6nkEQASmoeUPTTq8nessn9K0Bi6kSXkht
         7xo3J4NYwIQj+J78CjfBc5jp1GhUlXvxjPME1G0oQzob/ahlrTlaUixSnDohhXJjFo2q
         z8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2JjCc/5EES6LZTOK2We5DetzE6F9MpGe75nT0iWuBQ=;
        b=wzLy2gwd2b/DmTk9bXVw/C4kXyN9LgCtCN7AiuHYeMD6MTSwjksmAmOZ5sVIx2rkoC
         bsq0DN4pXy0hyKwgJ62iSoNHUA85C8D8/EqlFiicRdPsOAkgo6V/gzDgHZ9vQA3lSGep
         n6PwtnyfmQ1SYW5zqe/rz1l7aORlE5H3IaLUtN9Flx9JqAuR6y+o/pQOT0hvj3RBKI77
         eVoZEBKQHNJxBReMYnSYmhe/OU9hzTZKygaP3IRi0B8A05TIWizYIW/I4HnOtjlYrJJ4
         FhH6sdmKnX4KYfVxzQsZUQiHp4VGteV1VMe1VMDehNevDDer9AOmOPBhy/uyFDaSEtoD
         IsmA==
X-Gm-Message-State: ANoB5pmGQ6+ZJ1zog/A2H6WhlIZc3xkgJxPjuwfAwTVqt+wgvkPfFzyZ
        QCqtHmY+RDMdvf1gJCmPLXNEzQ==
X-Google-Smtp-Source: AA0mqf5CjGonoP+vodq7tkxE9y0nn93sgEfKDyLHguvTOpwpqNT03KEAzY9e16cuLBxa6gRAmaZ1jQ==
X-Received: by 2002:a19:ca04:0:b0:4b1:a34f:580c with SMTP id a4-20020a19ca04000000b004b1a34f580cmr8150977lfg.430.1668599108998;
        Wed, 16 Nov 2022 03:45:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651234c800b004b19f766b07sm2576739lfr.91.2022.11.16.03.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:45:08 -0800 (PST)
Message-ID: <f406361f-4008-34aa-2376-4fb776873d1f@linaro.org>
Date:   Wed, 16 Nov 2022 12:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add SM8550 to rpmpd
 binding
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116111745.2633074-1-abel.vesa@linaro.org>
 <20221116111745.2633074-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116111745.2633074-2-abel.vesa@linaro.org>
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

On 16/11/2022 12:17, Abel Vesa wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm SM8550 platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

