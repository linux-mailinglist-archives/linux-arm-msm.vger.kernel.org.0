Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1926A050B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 10:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjBWJiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 04:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234117AbjBWJht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 04:37:49 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A05553EC1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:37:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j3so6254554wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3m6S3L9AhnPNqrpJklFrakPE0HUtIHdZQC/onec6F08=;
        b=r/Hx+IUzELZk22hHOadZyhiv/xK7N7AYFz+cq0ApRK99wV6hgkZXPnpasvw5PL/lR4
         jmDV88cLPZfD37+hUmtr54FO2l+mRlM7Z5QehmcNH4sTCt+MV8/k7W3QsF8gGGivauvf
         +tGYRDEUQzdYM5t3bw46K+VFZMCeJUh3VP9beS+Lo63jRWKpgvVUsr372wyQiTWBUc5z
         9uRqrTBql1ZVMWYt6wI2QPNVgRMWZcX6eaRPPnf4ouuiSMhqzbo0avz1TUHZagX9CVVJ
         Tam805Q4BaurjVgSqnhfOIJjTLKH657P1lGErvMWqvds8cqTBnyTI1r87gIYdOOo2KJa
         eGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3m6S3L9AhnPNqrpJklFrakPE0HUtIHdZQC/onec6F08=;
        b=Tuq9t6o9pgZB5OGP4DgO6BkEy4Wvzk/PaGgpdFnycOFpp0K8clAqBrU0Ut5Xma1Vma
         u1nHVvsNE5+OoUfGhPCGy/UDfgbrsTv2QlHGdevQhLxu2JaYqhkB1BjxCUQh5uK28Qcp
         +yihwVp8uT5SUHFGM+ssqCK4w5d/hWHRyB6NQJfRfTuNpF7T5HZrTB6BLRpMkiefT0dE
         MVxq3sm9ZWK0DcNyC2jwGuo4KdPezi+iVp6zj7NK2bkkUoxHHuRIRYwdoteY4NYUYIJd
         CiElxWunr1mAjssAx842MZw0C/DXOOGYsaiHe0BLGensftySgDn11C56vtPddrh5Csls
         frJg==
X-Gm-Message-State: AO0yUKXDLa66ZZOC02B2kLB1/c93cWyCQG6GDLRwzHDxQd+xouwlCAEI
        Ippvk5iij+wYUy/qV1JO+NLU5w==
X-Google-Smtp-Source: AK7set/N8XA1AjFOy0uRc9/mKLRwAuG5dD11cQeljvb6oImng8f+3zsLRH5Xdo1BF8jluino6GjHGQ==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id g19-20020a05600c309300b003dc5c8612f3mr2799265wmn.1.1677145050863;
        Thu, 23 Feb 2023 01:37:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c210500b003e00c453447sm10569614wml.48.2023.02.23.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:37:30 -0800 (PST)
Message-ID: <896e047a-9188-de5d-d3fd-197b3fa208da@linaro.org>
Date:   Thu, 23 Feb 2023 10:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] dt-bindings: PCI: qcom: Add iommu properties
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
 <20230222153251.254492-3-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222153251.254492-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2023 16:32, Manivannan Sadhasivam wrote:
> Most of the PCIe controllers require iommu support to function properly.
> So let's add them to the binding.
> 

If most of them require iommu, why not adding it as a required property
to respective (or new) "if:then:" part?

Best regards,
Krzysztof

