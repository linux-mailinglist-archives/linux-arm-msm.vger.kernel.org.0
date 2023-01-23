Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6620A67806D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 16:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbjAWPt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 10:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbjAWPt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 10:49:26 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C144C14EA5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 07:49:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so11217717wrv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRrlO1y0MQCgeVJ1C8FCZsk1QyUHS9Bge/H7XBbj9NE=;
        b=swDVpyA/cOqgd3BzwtL9dhxt8H4pjMIL0rkk6nBLIs34KHHA1zYpIAqLXYNFxrRLhn
         VWjyFKwr33BcWOCn2AcobEf1bcI1u5v+3/KQqdD9uTIn6jyX/uK3VdIYAAxov0Tv7HOA
         fLi9bCDGGW8azvBu5b075KGms0op8mme1Jhm0BBUY4ndfcThuVLAMoZOQ5+Zw4IK3w+Z
         vCA3PD4QELkUITjrC/cnvYHRs4/9i03RpTGOmvscyHjuWSNlBEcbmAgcPWSwlwrrwBBg
         zOSCOWyKzS2u4qgUXHE0xwXQQ/PbW+ev8hLSlz5HCUAjRF6kLSUJWfcuFw8zGu0gO+Eg
         rZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRrlO1y0MQCgeVJ1C8FCZsk1QyUHS9Bge/H7XBbj9NE=;
        b=H2P2MDn1Im90bS0zQpVNz/Y35PcsoEkoWpH9yOgaJNSfnX+EOb99Nk3pSki5FBRELN
         3189m1paZEEJdiM0OgKgsWfmIAAPp+TXSe6omOKXuXYn38lWT5QuiuvHQTVoJ0kn+PdQ
         FPw/SyY6DwzOehiPdnvefgM1jPXQ9TjQuG65yVauOvq8Cb7Pl7iGo5uXwjG2peQkHfVc
         STMd32oKBEjKcZXzXamH1w39adtMw6vP7zdQeNWWWDDgEAgns3G2hyIrofDQGpaCsl9y
         AuqYIoaYdjtBFharUvEaZ63SlGTxyviBx1Lnx4Gm72apa2lPcEAqvGbWutu17eFyHpyc
         O7Uw==
X-Gm-Message-State: AFqh2kpVvsJn0fTG86gi1dkulwCRoKmvahUNaNFX2GWMXerP8NLN6gh7
        JzJb8h52B/Xnu8sTypiKSA10Aw==
X-Google-Smtp-Source: AMrXdXvj7CKw9kx7uw6aIqK5wdSyxxpICiQJ8Y8+j8LTwjVqZp2eJmwSRdZfJ2o5Nu3o2AvA1xlLSg==
X-Received: by 2002:adf:dd84:0:b0:2be:4fbe:42d5 with SMTP id x4-20020adfdd84000000b002be4fbe42d5mr13917911wrl.5.1674488963364;
        Mon, 23 Jan 2023 07:49:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w5-20020adfcd05000000b002bdc914a139sm35089639wrm.108.2023.01.23.07.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:49:23 -0800 (PST)
Message-ID: <ee531a81-8ba8-b436-ddee-44a512c7be17@linaro.org>
Date:   Mon, 23 Jan 2023 16:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] dt-bindings: arm-smmu: Fix binding for SDX55 and
 SDX65
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, will@kernel.org, joro@8bytes.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, dmitry.baryshkov@linaro.org
References: <20230123131931.263024-1-manivannan.sadhasivam@linaro.org>
 <20230123131931.263024-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123131931.263024-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 14:19, Manivannan Sadhasivam wrote:
> Both SDX55 and SDX66 SoCs are using the Qualcomm version of the SMMU-500
> IP. But the binding lists them under the non-qcom implementation which is
> not correct.
> 
> So fix the binding by moving these two SoCs under "qcom,smmu-500"
> implementation.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

