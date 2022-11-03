Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71B6183D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 17:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbiKCQJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 12:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbiKCQJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 12:09:35 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AA91D0D5
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 09:09:08 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id ml12so1465322qvb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdupXZP9IFvwGILZVl/bXkxyiQBrd2eY1VoR9aqF3f8=;
        b=kU9c5IXpOAFVRhtLb9VD0DkbGRRrvofFv5ZaV90ha/Z5Pjkds75ssplzse/sexzY2G
         t4ryGbivPIq5eSqm2hV/0dAwUzPEMCCIJ7IJRnzOREaD1PNNjDgXONaIUuG5SH/QjqQR
         3dv/jK1oPs2gFsxHCbY/35BjVKfQcu1hH2SrX4u02/Pgev80Go7zikIubUdilCydjnb4
         uS+ZTwvF+YU7OOrP+9J53OwRZvWgphfr/OKoqL8LwDCAjuNGqCtpBaTKOeVQdumMuMzl
         DuT9fb/j515nbCluQBt4Ica6G2qsI6tmDSlLeDAcXAD2dMbVsBU2/uToc6o34YF6j2Zl
         38WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdupXZP9IFvwGILZVl/bXkxyiQBrd2eY1VoR9aqF3f8=;
        b=ikGTf5GSwptFb5gvU+LWnb5VB8pYDNcRGIpAt5iXwW00o99OP2u1KVZBVAupWPrSRm
         66z+pOaW4MH0rPJAaKbA3qgzNbfV5sngeniajDDGlLNBJ4qZUQLVypH29Sz8MEoLjTNK
         nv7EEl7vYWRekemxLeuHZ9XrvYbw/FQPT2lW7VJTXvIO7ZPKfEzBj+G1OjuOgLXExzyu
         CuHHcRpe4AaO2X5R85c33sxZyy0rEL0jS6XpNLlN/guCVvmd7nUkksmp6x3MRGPHFEuW
         b5Na7r2HOHPq8MCnRQbU545QfL8knyOXmvtSS8IgWUg9//Rw3u3I6V0h9ZKVXOSGagHr
         Srdw==
X-Gm-Message-State: ACrzQf3pLVM9PzUCKKRQOwIxlb+qDAYSlZXMK0U/q3R5ps2wfC1o3vuM
        IvgDdSpChq1QM3+pgJiparjNzrjCtUpYQw==
X-Google-Smtp-Source: AMsMyM4Na22MQCEkYmNGL/H4cHE5jOAZx/Jxn3T2uL4LmjrXMvv/w3qjaGdleg7s97ZnEYStiL1OmA==
X-Received: by 2002:a05:6214:194c:b0:4bb:6d2f:3e7c with SMTP id q12-20020a056214194c00b004bb6d2f3e7cmr27602892qvk.4.1667491747673;
        Thu, 03 Nov 2022 09:09:07 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id h18-20020a05620a401200b006ee8874f5fasm1018291qko.53.2022.11.03.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:09:07 -0700 (PDT)
Message-ID: <287a41ec-b004-54a7-1ac3-07cc4db5fbbf@linaro.org>
Date:   Thu, 3 Nov 2022 12:09:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/3] dt-bindings: qcom-iommu: Add Qualcomm MSM8953
 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221016161554.673006-1-luca@z3ntu.xyz>
 <20221016161554.673006-2-luca@z3ntu.xyz> <5615419.DvuYhMxLoT@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5615419.DvuYhMxLoT@g550jk>
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

On 31/10/2022 12:26, Luca Weiss wrote:
> Hi all,
> 
> On Sonntag, 16. Oktober 2022 18:15:51 CET Luca Weiss wrote:
>> Document the compatible used for IOMMU on the msm8953 SoC.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Could someone please pick up this patch?
> 
> Looking at the file history, there's not much but maybe @Rob could you take 
> this? Or maybe Bjorn?
> 

Use "iommu:" in the subject (dt-bindings: iommu: qcom:) so IOMMU
maintainers notice it...

Best regards,
Krzysztof

