Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575E864DD8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 16:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiLOPPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 10:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiLOPOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 10:14:45 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A37032B8F
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 07:14:20 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id l8so10188469ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKBX4dCAGxM9FIuN9j+5uOON5e07EkYesLemjwlfmRc=;
        b=jqn4qm5AQpP3pXvXfNliwLe7ReHlO3yIHYcnTzDqLfHZgOwC6WadMZBme+JdN8Gkv6
         /vxPZyh2V3v9oYIFj3/3kwY2F9FV0aO87kSiQ6MTjUbP41o2odJf48YT0QN6+hKZJavQ
         iIZ0Qo3q1fa1Skc5gFObSpyjXV40tVK1zBX1OAUgcRzUU6u7swwq2uPqxpXGRYzOpRHp
         uSs01A6CQyZAhyrWmYlbjhs2edJRSWNSroK9l2tqX57M7PQKZMn17PX4XBl48dPyQa9B
         dfRkOdAouTe1CGXiJhlfozBXWe+xweUJvhIcG/xMbXqKi1jiVwE+7D1ZHeeQr3HAc+dw
         omQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKBX4dCAGxM9FIuN9j+5uOON5e07EkYesLemjwlfmRc=;
        b=bblNu8GONTnQZP9FX0y9KoCQldcGldXiJelKzB3ApOc4qocwZPExKGUD3l+SA+LsQz
         foMGOjAiU0pHcjJsNCVNCwGIMD0sNs07SyYrZHnl4L3creRBSm3QVa8tLg8eL8taZeHp
         TW8zFtN84iM/oFjrHLLC3nt1OAWrmc1Uv3r61SH7xBQt9JadEYU7F4aSoqgk3lN9m+7n
         jgIpvS0jhvYhJG5Ocexa7ekz7D0RLWdMgp+pFS0U8JJbIGrosfjUVfkWX80g7nNM+lVI
         sgAJCaq8GfdFIe3yL976+X5Zc13hPwVsd+0oFrvzzIGy24jgxPEy0Mlu9pJ5TGM3lE+r
         O5cA==
X-Gm-Message-State: ANoB5plVJyjLDlsSBuAF5Yow4+VtgTZMk5mammo/XhJTMrH5MyAGxTyA
        /UECqtbsH8tnc7q3ZMe6TOVRqQ==
X-Google-Smtp-Source: AA0mqf638NFbBfGyPPGUbiWU9jAZwDUrabmGYbZxWlmgWMVwFUJj7vPxpXSFyFHzx/HqOpwBT5wIvg==
X-Received: by 2002:a2e:a809:0:b0:278:ed26:60e3 with SMTP id l9-20020a2ea809000000b00278ed2660e3mr7180275ljq.25.1671117258550;
        Thu, 15 Dec 2022 07:14:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a2eb4b2000000b00279f213302bsm859063ljm.57.2022.12.15.07.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 07:14:18 -0800 (PST)
Message-ID: <3134ba66-27bb-7015-8988-6c8dec046b0f@linaro.org>
Date:   Thu, 15 Dec 2022 17:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 5/8] iommu/arm-smmu-qcom: Add SM6115 support
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Adam Skladowski <a39.skl@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Emma Anholt <emma@anholt.net>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
 <20221030094258.486428-6-iskren.chernev@gmail.com>
 <9e94c0b9-f901-5ac9-2abb-40e958cbe5a2@linaro.org>
In-Reply-To: <9e94c0b9-f901-5ac9-2abb-40e958cbe5a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/12/2022 17:10, Dmitry Baryshkov wrote:
> On 30/10/2022 11:42, Iskren Chernev wrote:
>> From: Adam Skladowski <a39.skl@gmail.com>
>>
>> Add the Qualcomm SM6115 platform to the list of compatible,
>> this target uses MMU500 for both APSS and GPU.
>>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> 
> This needs to rebased on linux-next (or 6.2-rc1 once it's out).

To add on top of that. linux-next has the following comment:

/*
  * Do not add any more qcom,SOC-smmu-500 entries to this list, unless 
they need
  * special handling and can not be covered by the qcom,smmu-500 entry.
  */

So, hopefully you can skip this patch completely by depending on the 
generic "qcom,smmu-500" compatible.

-- 
With best wishes
Dmitry

