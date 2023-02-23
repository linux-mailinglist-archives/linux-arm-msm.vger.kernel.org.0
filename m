Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA58D6A0515
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 10:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbjBWJjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 04:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbjBWJit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 04:38:49 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C3E497E7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:38:29 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o4-20020a05600c4fc400b003e1f5f2a29cso9533717wmq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43ECDPJkxGSZtfv0nSKE5iF3opRdTLPTugV4CRpGsdY=;
        b=E7EHzC1K/hGYGPyUDEQZpcnzcyNWdQ7APS51XZbIcOdeJf4TycCkXsO8rXCLT793Ri
         I8l19yEf+MZpcUiEWzhqSMEtFDkXVo4jV1YZZt52NzKn0CAaFjAOHF3/SDC2ubBkJV7K
         g24RXIUg1Pn6XJEIqwkb912tb7kF4xNpxP7csZ454strS3r80P81N2X4ZbupCpXGc8lz
         Liob+LgBqO+1uic5BQ7XLyomDGcT7/AXBqGN1vhLz7s0EaLrjqcIdhkVy22JvAeuWtBN
         gRRF9znEBo57Wb6y6BTYLeNQSbAzEn4FJw/TnWq9Tb/QMgoYdhqZ4X6viLcIPUDwnYUD
         jx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43ECDPJkxGSZtfv0nSKE5iF3opRdTLPTugV4CRpGsdY=;
        b=tY3y5nhK4659WREiwB5qxvXhmlBvR4fkxlcDQX+nO+ptKef5IMvlHXZ8gIRX5jCWbN
         46R08VMw071RIXHKRW89K0FmNZNMC7OJDCkP2hpYl9ATeeA8irMsVJcA8ftpW8AUSvOF
         +RhfbiPk6WTH2loquTXyz9+uhFEkMypCm72wzK23lH5rYep1S0dVQmFs46yW/kuqqUh0
         nHSqeu0bNVyzHX/PrOsZT+l2ARnlAXGA0Vs2vmOFyYjb6nhGzH3CIIBV0SYG6OIC+SsN
         KGUL/zCcOvC52yS3mIb+JiLp6VQo5hGnrnNWFosuBfceXXLlkoaEvjEF/T0qAZPn8OBv
         Fv2A==
X-Gm-Message-State: AO0yUKVc0OKLegrGSdmztub4GRO9AzmrlFHcdJ8gGP5DYIpBvem43Uda
        BQEsbpklwjMfSN5lwV6qRRIY6Q==
X-Google-Smtp-Source: AK7set/xchjH6Zolh1/n0p/Cu0TJQ2SzqQmuTsOj8c3e5dBjBX6CkXyexLVxKxvdxZU5Sf6U2ns4Dg==
X-Received: by 2002:a05:600c:44d2:b0:3df:f7f1:4faf with SMTP id f18-20020a05600c44d200b003dff7f14fafmr8065985wmo.34.1677145107613;
        Thu, 23 Feb 2023 01:38:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ay14-20020a05600c1e0e00b003e20cf0408esm11869809wmb.40.2023.02.23.01.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:38:27 -0800 (PST)
Message-ID: <041cfa0a-14fc-714e-54b9-a13a70f67fa0@linaro.org>
Date:   Thu, 23 Feb 2023 10:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/11] dt-bindings: PCI: qcom: Add SDX55 SoC
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
 <20230222153251.254492-4-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222153251.254492-4-manivannan.sadhasivam@linaro.org>
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
> Add support for the PCIe controller on the Qcom SDX55 SoC to the binding.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

