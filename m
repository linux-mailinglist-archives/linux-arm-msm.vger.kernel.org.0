Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7662A62869D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238152AbiKNRHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238147AbiKNRHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:07:53 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B1B2CE31
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:07:51 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id u11so14019408ljk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fM40YsHG69XSps9sYkKuoIaYvYZTcDub0ndtXX1Pvw=;
        b=kjSmJdC6Mfa9wOoKRy+htVdYDPOpvub0TN6pbQE+j8u4+a+UM/QFiVHrLsrjWUNnbD
         UHDvGNmiHaesMZ50QWLs3OchlpqHvtTPMTy7DpM0P170FKAQMhlRlTec/Vi7rb3hwN3z
         zhMyNmte5yxkxqAODU9OtCXZW8QiisaWfz6HgA90DbUYs2TQ9T7dc1aOJZ1znOVIPQZ0
         LeHpQl7HWNM8ycNYI/70mYxKICSUeBDHh7RA4tsncsLBtwB8+TnxotIJpjVXxRpv1zLh
         y8sIxJTperHHwqKIeTLjLkSMDM0k3akxb5oZfUKI58WjMu6CyDdQoUaOUtbux+/bbBas
         s6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fM40YsHG69XSps9sYkKuoIaYvYZTcDub0ndtXX1Pvw=;
        b=yGTRPdA1NZA+G2rKAMc4J9av1u8L6rT2VLbrKs46CpYEnRXBjTNHoT5RTlo/vdnS8n
         nJwye8XV7T7h4Zp907ie9GWgn2Sb3kX4dS+FJnIH6ZvN5Htqn6pAb4eXDRIkoKYp+i6Y
         0gRNVyNPi2douk1fVuhw+VKTa+8Kny9kODfeOR9Y1US7wtVv/28f6PFGj1XU+RiULzRe
         oJjth078RDsIKgrKof5uDEu52O+iWlotHtPlQbmqJb0LmJeE5QSIoWjllKsxMhdBHN8t
         XTLLD3OEZM04HEtb7gM2DRy+OcVEOfpgZvtNYZaQRdCh+YWp1pDZKkQ1HCeb0kYe8YGp
         sa+A==
X-Gm-Message-State: ANoB5pmu8kNntekaIdUDPyCBSHIqe2qBwWCGzgVrY7MiUIgJusCNaWur
        2B9Haw2juyA9+LXYCSpMvtYNLQ==
X-Google-Smtp-Source: AA0mqf4lEIKNad99guFwwYc4jeiWore22u9FDVNQkYDR6JMjsV1sTvL7Q9zluHk9OLGTXJjxMQr3LQ==
X-Received: by 2002:a05:651c:210a:b0:277:1295:31ca with SMTP id a10-20020a05651c210a00b00277129531camr4422149ljq.280.1668445669605;
        Mon, 14 Nov 2022 09:07:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512070a00b004948378080csm1886391lfs.290.2022.11.14.09.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 09:07:49 -0800 (PST)
Message-ID: <47ff366c-c860-e9ad-c5ad-485eff6f649b@linaro.org>
Date:   Mon, 14 Nov 2022 20:07:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 00/11] iommu/arm-smmu-qcom: Rework Qualcomm SMMU
 bindings and implementation
Content-Language: en-GB
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221114142326.GH30263@willie-the-truck>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221114142326.GH30263@willie-the-truck>
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

On 14/11/2022 17:23, Will Deacon wrote:
> On Wed, Nov 02, 2022 at 09:44:09PM +0300, Dmitry Baryshkov wrote:
>> The main goal of this patchset is to define a generic qcom,smmu-500
>> binding to be used by newer Qualcomm platforms instead of defining each
>> and every SoC line with no actual differences between the compats.
> 
> Thanks for doing this, I really like the cleanup and the possibility
> that we can stop adding all these pointless strings every release!
> 
> It looks like Bjorn picked up patch 1, so could you please rebase the
> rest of the series onto my SMMU bindings queue:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/bindings
> 
> and address the minor review comments you had so that I can pick this up?

Done, thank you!

https://lore.kernel.org/linux-arm-msm/20221114170635.1406534-1-dmitry.baryshkov@linaro.org

-- 
With best wishes
Dmitry

