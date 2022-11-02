Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B0D616D7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 20:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiKBTKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 15:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbiKBTJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 15:09:58 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4906598
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 12:09:53 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id cg5so3205060qtb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AIkEh7BXAQ8EfVcaCpQmqvlq6Pnzwaj79KpKIFXtqKk=;
        b=D5NqaoeFxXGLhUM1iiPWsSusfvacuFdAOm6V8ErMS9WTejX9G+7XNSYvAnzL10LFFp
         qE4b9Fd5IJns9Y169x8pYIfvEM0CEQ7UlfQ5ml7I2wQplpGk93Og//KQ6l66s2LeF7Ng
         0QIQG2YvDP8l4BXttaBxEtpb+R11qglLFfU3r0tAVplqVAE9m+N5E+WLMYpPROr6YABD
         dDv1ZnUkW2HQDoRNxvZRD8RCgvwZFB7bKffmiB6fpEfwy093n055DP70XMYf0MNtGMTY
         cM6o2zeIscCb5OKxFh15wUhs+A2kcnIS8JdGXqbvwB/gsnlxMWnSn/3rzYMoDI8YAYem
         JlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIkEh7BXAQ8EfVcaCpQmqvlq6Pnzwaj79KpKIFXtqKk=;
        b=VPskykR2zCSqPSUAsYFNSXE37rw7rBu713O3My+fpc1f8kJvOE29Sv1QbyxdsFvYMu
         X3I1oNaJCrrXVlMG+odUMpeKUzI3LGteQQHwlAAjKmjEwk+NM3NX/RmzL0PBvm96mCsi
         hZJWvjf4E0rMaecdQfjM/i+gEHNimXvmAHeAYVrOKNRIrOg37Q2JoO6WN7mBkcMIA58v
         POYXBllJJvQvuRg4FOnu93bNUbUPN7NMHaqH2VUUvp0etKcp3AK4jTFL3PIjkAYJpgHX
         MsQtYYqiIKaY0+qFyFxl6FdUULw9zpxqjBZ5+/31vlwU36mmhFOSHX48izuvoo/iQZD4
         imsg==
X-Gm-Message-State: ACrzQf32aRQBODEIyfmBXvqZAlRY2TbKCuvkVTSxN9/f28Ut1YXhTkWY
        Un+r+KgD6aFOyrUD67+gEwkroQ==
X-Google-Smtp-Source: AMsMyM5rtL01pS0TQ+i5UNqkH3/BIoMq0q2RjMMZmpCfyVX3jZh1yBtxA1LpksWIIs0gVwKIiDmLaA==
X-Received: by 2002:a05:622a:407:b0:39a:836:acfe with SMTP id n7-20020a05622a040700b0039a0836acfemr20925776qtx.133.1667416192736;
        Wed, 02 Nov 2022 12:09:52 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bk20-20020a05620a1a1400b006f3e6933bacsm9098388qkb.113.2022.11.02.12.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:09:52 -0700 (PDT)
Message-ID: <1fe8fd96-7770-0bda-c970-aa38d030ff3b@linaro.org>
Date:   Wed, 2 Nov 2022 15:09:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 06/15] dt-bindings: ufs: Add "max-device-gear" property
 for UFS device
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com
References: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
 <20221031180217.32512-7-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031180217.32512-7-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/10/2022 14:02, Manivannan Sadhasivam wrote:
> The maximum gear supported by the UFS device can be specified using the
> "max-device-gear" property. This allows the UFS controller to configure the
> TX/RX gear before starting communication with the UFS device.

This is confusing. The UFS PHY provides gear capability, so what is the
"device" here? The attached memory? How could it report something else
than phy?

The last sentence also suggests that you statically encode gear to avoid
runtime negotiation.

Best regards,
Krzysztof

