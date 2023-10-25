Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D87D690E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 12:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343668AbjJYKkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 06:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbjJYKkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 06:40:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B094710E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 03:40:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507a98517f3so7667672e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698230407; x=1698835207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6Z1p4kKtgAXkbhWcm2d+hA00mC2LWkNVOmS2pvrIIs=;
        b=OiE+5DpllivC1t3kS6P/G9QplJqPWhgDbwtjnMg5RtU0YL++rttT2d25WEuba0H2dz
         qSqphjuNoWC3dwpY73z5iXARaaXbO9+twD2+Hl7nyfunjxrBF5T2v8Z3lu39MNJH38FK
         XhFUwZFdl+F4zw/12QLc7cHXjzYFk+QmJI2A32rBcF0HrQxz8L1cF/cxD7ZcKGKPyaP/
         7NC5xcwje0Q82YgxURxn7NUBT7DkrEndRLtZiPjkVLhSllbpM1NRMG25q7DSM1zP2dap
         6D+j9wYfx+AzMExiX29m4UgmxM+1Rwg6EkPmQzc6tbnpaYfvye7yxiGwXjh/daE72kgr
         b2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698230407; x=1698835207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6Z1p4kKtgAXkbhWcm2d+hA00mC2LWkNVOmS2pvrIIs=;
        b=wNOHM0J1PCpoCmIU76aeu5ZJJdfNR7QXx29BR/QNHnrcLdzGhsU2xFknl/IBquwZqq
         FQsrl9rHeCjBAVT0h2OFEdokxPT7Eb+3fMWUOwSDRhoWpqHTxLfOpeP4eYJXC9nQpR6e
         s7f4c3ZRhmCaEWWi4Kc96jccFPhJAmsKxCwRQYr1CZzwwnzjOFfOItlJJpNQhKy6fRSg
         aAr0+DXbHGhWPAfoJNZ4G3ujNFkcSvnhGPFbNFpBnKm1fILj+/OhLMupOkCFOk/wn4tV
         7AQRPfI9gZb+aTJRIyJQoT+NSPE6+w7FNgqy2v7fRNWhJWy8nWBZoQYkWCPHJArOTqYM
         q4bA==
X-Gm-Message-State: AOJu0YxfhDj1DlZOsfCVAeRq0w2ySpO/zSVAH6+sSzRz8ibT9CeNQvQ4
        LPf4EGW3xw8S+AqqIDSQlCcGuA==
X-Google-Smtp-Source: AGHT+IFVRmNXMEbNQPkppWpMfxB5GZ00/ir8cT0Q4jJSneFXioGp9uwFQafN49hR/A7039iEqUXmKg==
X-Received: by 2002:ac2:58e7:0:b0:500:b53f:fbc2 with SMTP id v7-20020ac258e7000000b00500b53ffbc2mr10374360lfo.26.1698230406696;
        Wed, 25 Oct 2023 03:40:06 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f7-20020adff587000000b0031fb91f23e9sm11788220wro.43.2023.10.25.03.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 03:40:05 -0700 (PDT)
Message-ID: <fdd775e5-1e43-4f65-b444-da6b83e3df5b@linaro.org>
Date:   Wed, 25 Oct 2023 11:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Use common VFE
 pm_domain_on/pm_domain_off where applicable
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
 <20231024224255.754779-3-bryan.odonoghue@linaro.org>
 <d0d30b6b-3664-4531-a71f-6faec3330d2c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0d30b6b-3664-4531-a71f-6faec3330d2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2023 10:18, Konrad Dybcio wrote:
>> educe the pattern down to a common callback. VFE 4.1 is a special case
>> which to me also indicates that it is worthwhile maintaining an 
>> indirection
>> for the vfe_pm_domain_{on|off} for now.
> Are there issues when powering it off like all the others?

4.1 doesn't have a VFE power-domain just a top level controller PD, 
however I think a blank callback is neater than

if (vfe->pm_domain_on) {
     vfe->pd_domain_on();
}

its just vfe->pm_domain_on(); at the cost of 1 or 2 instructions for 
indirection.

---
bod
