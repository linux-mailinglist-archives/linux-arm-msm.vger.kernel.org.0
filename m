Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B93F2134784
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 17:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgAHQRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 11:17:32 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37399 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbgAHQRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 11:17:30 -0500
Received: by mail-ed1-f65.google.com with SMTP id cy15so3045790edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ixNLloMM7MEsta6mQM3CnnoI5zVcxQu1H3iGtxld7Kc=;
        b=IYN11j2i2b3yDnBf7f+iDcswMuW/81T76Q/ozJTLIk0XuvyeDwwSw3JwBU6setSBRD
         M4c1qsBA5BaTA+pUkJsOuHyJG1aegZXhnzDCpNvdaeH6L8tysTVA+ymH53FRFXXCzHiU
         2n23JOOooOkuOKHvlQG7bnkvczZJRKZzfhG/9rjU5yNi33ZDxgUk+NO6iCTaYA+wRK0c
         cbjaYWyjFQPc3lcQTNCdiE/v9XIjEb7FFN61NZj9FrPgxiYQgO0Y3si9ZNMp7reKiNoz
         w9To10GYO48mMyUUwaCuHFt/lwb30c2MJRScrjk+wSHxdPfQ1dEvmurQW92dEbBsVYfC
         nqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ixNLloMM7MEsta6mQM3CnnoI5zVcxQu1H3iGtxld7Kc=;
        b=TflnP68SCAk3Bj/iAVjfQhVoYMVK3YKAh5GIxhwL6s+3ESbWisNGELTJds9WTkNp91
         7U2CvhDeKyFF2ePOzsBdh5VYhLgexb0p44p6o2hT2NMUUlp2DokPqrtzltjJbtEkxU90
         YgOExXHdw/3m64tGt3mwEhhcAYUw57he9V6zuyd1z5+6GA2U8g6PBwEfL3vuQFHf0Oo1
         IC2p7jmt88baFchtxDPl0uT6AzHHO2Nrg4vA/2QK8qc6PfwQQU5OdAj2x7h48Wv6WGvS
         4/3mMwHMj0H//tLWU+iNP3mFxEB5cef6XWU3ShhVKtR7DUhgjJLo99MlGhWTDmM3yENI
         dMRA==
X-Gm-Message-State: APjAAAXKwXTunGk3UxQbHjYcO7yPCBDw7usuaVFIl+OdfCrTfmgAvv8a
        F2381HOGTP1uySP3IkpFUTrWyg==
X-Google-Smtp-Source: APXvYqyNCsBoBb6b0+/VFgEFHT6BCXMQhc38kBy0a5iYr3sUoeSElD5NnXUq55ySz//tov60JWmR9g==
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr5692899eja.21.1578500248323;
        Wed, 08 Jan 2020 08:17:28 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id dn12sm89884edb.89.2020.01.08.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 08:17:27 -0800 (PST)
Subject: Re: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to DT
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-7-stanimir.varbanov@linaro.org>
 <20200106220414.GA10744@bogus>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a224bad9-2eee-a906-80ba-573c1525afb1@linaro.org>
Date:   Wed, 8 Jan 2020 18:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106220414.GA10744@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for the review!

On 1/7/20 12:04 AM, Rob Herring wrote:
> On Mon,  6 Jan 2020 17:49:23 +0200, Stanimir Varbanov wrote:
>> Convert qcom,msm8916-venus Venus binding to DT schema
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

I guess you are agree with merging dt-binding patches from this series
through linux-media tree, right?

-- 
regards,
Stan
