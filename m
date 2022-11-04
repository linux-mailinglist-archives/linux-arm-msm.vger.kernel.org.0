Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB54B6199F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbiKDObE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiKDO37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:29:59 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01739317F8
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:28:18 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id x18so3134715qki.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDe5FnsGqMiSUHT8xjVTQX0gUqCD71tboXETOMhWS0Q=;
        b=cSk588Z5mcVSu4P6zDWyUhKJmjBecXaNiogvbIgbd7pOTpWm20OPWYHRZcPxVXHNVX
         gYa0F5pwgzE3clAzhWDDfQQODlk4ARtiRs1xA69ptDuWvqsFuzbMgv1OJ8jSBnSMSOFR
         0bSk7ChKNWc50lsNb2erLIK0efXkbf4Vu96uxiFm7frauOVPVyq1I/iQkSUmKQW1unSY
         saI6cL54spN2yLwHHuaw0RO6FpFm1f9DzHR2t80pKPCdGlGG9WBO+afbz7FHVwr9IiIn
         nlHXguBrXSCdOK5JqkySO5agWOLmhOgLrnE67P/cNY7ZM61/8EKuKS+yMiEJwN6hQOUk
         vDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDe5FnsGqMiSUHT8xjVTQX0gUqCD71tboXETOMhWS0Q=;
        b=KAiw+ERykOrBNIEMc9zo2jFuAZnMg4oHcG72en7UFkK2vmfCNkLr0KoVwzpY59778E
         Zkjk6Udrq3H2055PEvtNCSYmpXlFwQR0/lbte/MfdhJq5SU5gOhPOJXAFeaxvHmb5sid
         DmOuAb1BS5ZSpL5ra/+Fnn8KAOcUghxM4xsxr4mk0ndozNlpz1kJDf51Nz+9xwewLvRZ
         LAgvKvVPCoTby0uW4x8dW6Tfa4Vdqp9ou+YCrz0R0954NybUJXPUe+5O4Dd7uKwum4VD
         +urM6j4zm8F7breGDW6Xyif9aMVh2M7dl5oYynXnCqMLYBxwvx1g+a0POCLjV4z3hDoI
         GTZw==
X-Gm-Message-State: ACrzQf2lyD5ghEFZzXzVzQIcgpAEEWgjLceDXFQWelHwVHhFWjfUlyUl
        YM9K0WOnMA1yxlwXsAmoSSzqQw==
X-Google-Smtp-Source: AMsMyM6YFJR9mmVcf/J9vJatvtusRIVugFCSRBfqvji9luHwungWB91cAlARiuz5V70mA/nHD62xfg==
X-Received: by 2002:a05:620a:2891:b0:6bc:5c73:9728 with SMTP id j17-20020a05620a289100b006bc5c739728mr26014035qkp.178.1667572097131;
        Fri, 04 Nov 2022 07:28:17 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id m17-20020ae9e711000000b006e42a8e9f9bsm2898015qka.121.2022.11.04.07.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:28:16 -0700 (PDT)
Message-ID: <1cb84436-c4ba-7972-175a-729645573ecb@linaro.org>
Date:   Fri, 4 Nov 2022 10:28:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] soc: qcom: spm: Implement support for SAWv2.3,
 MSM8976 L2 PM
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20221104133452.131227-1-angelogioacchino.delregno@collabora.com>
 <20221104133452.131227-3-angelogioacchino.delregno@collabora.com>
 <8671f237-5b18-88c3-aef4-9acc46cfcbad@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8671f237-5b18-88c3-aef4-9acc46cfcbad@somainline.org>
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

On 04/11/2022 10:25, Konrad Dybcio wrote:
> 
> On 04/11/2022 14:34, AngeloGioacchino Del Regno wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> Implement the support for SAW v2.3, used in at least MSM8976, MSM8956
>> and APQ variants and while at it also add the configuration for the
>> MSM8976's little (a53) and big (a72) clusters cache power management.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> [Marijn: reorder struct definitions to follow high-to-low order]
> 
> Weird to have a name without an email address in any of the tags, but I
> 
> suppose it's not much of an issue?
> 

This looks like missing Signed-off-bu from Marijn.

Best regards,
Krzysztof

