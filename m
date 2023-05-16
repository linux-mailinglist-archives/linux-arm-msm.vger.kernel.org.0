Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D890705B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 01:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjEPXWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 19:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjEPXWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 19:22:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7B95275
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 16:22:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ac82b07eb3so86091fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684279353; x=1686871353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0lqRcsSsQH0bBfoyNKX+3AOqI8xO1VZEspaatlK78k=;
        b=uA7/LYKh5HNBNHXQxR6NRDVGEgME5E/5oAkzu0StP2gjzSumdlZ5g/rL//IZqzjU2A
         +gViSD7O4lfppe164q8n3Xky20BhzZGAf9iDiwAoTUlqsRsCx4UDh6Y/4F2Pbhdlqr7y
         yYeUOjhEnhKVEUFdeF5UPkS2h3e5qRfnS4HxxaJ5HaIUa+T1kYHvOhBXJczw9/U8vjEa
         hDN85Ae1svLt7wJIHQffrL0BDY/BTIN9Q+HdpgaykIIQbVNyGHRd8tDHTu7LnyBvKsIg
         aZw8IXL3rbqbK4RVyIEKRlyjXcgTXQjY6UuJ/rLJ0hPQ0Z1PI90sjmJFeIddz1YMZvjs
         ypXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684279353; x=1686871353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0lqRcsSsQH0bBfoyNKX+3AOqI8xO1VZEspaatlK78k=;
        b=F1s86oeWd/EcPnnzdufynLJ/Pn2jE5YxuNMb3sN9hFBNwmy4Db1aG5e0PA0pWFJBU6
         2e+7IT4AOldRsQroDkWOPfsXhtSMxiANzjKiOhXGxgah269B1yGrS1rxQPe/AJxMWJTd
         J4v2s7+QOvxCjmg4hDHIj/awWjUQNEW221nlrxXUDIp3jReuTvwbPLOadq11rXeBtVWG
         ME3guhAj/i5ILyX4aUXKwIu2nujrEFhd19QaBE07zMtTqyaIhXSUTbKq41oIet5Rg5Fc
         DjbqKAWLqI6H5pC9DUudkQE8UMDhgEHORF7dnosV8AgyEdIApQ0sxuuZLI83Uns/9GKa
         Ya3w==
X-Gm-Message-State: AC+VfDw97WTI/2XGCX2dD4b+vVPhNDrLVyb2nvmQNPhB80GOfB+MV/UY
        2N7GUKkKm32YFTKS3JQjpWxQwg==
X-Google-Smtp-Source: ACHHUZ6pKQ/IyOU0B/3fMGnHOQ5asgHXtu0mkqxW5VGYBRoXChUBKHyVyTbPwB9oD8Q/wqE0YYfidg==
X-Received: by 2002:a2e:8851:0:b0:2ac:8e69:c06d with SMTP id z17-20020a2e8851000000b002ac8e69c06dmr9126360ljj.49.1684279352762;
        Tue, 16 May 2023 16:22:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e9e04000000b002aecfa8c58bsm1321531ljk.40.2023.05.16.16.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 16:22:32 -0700 (PDT)
Message-ID: <fdd07b5b-a3f5-0cbf-0d71-602d0b3b9847@linaro.org>
Date:   Wed, 17 May 2023 02:22:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>, stable@vger.kernel.org,
        Lepton Wu <lepton@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>
References: <20230516222039.907690-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230516222039.907690-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/05/2023 01:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When the special handling of qcom,adreno-smmu was moved into
> qcom_smmu_create(), it was overlooked that we didn't have all the
> required entries in qcom_smmu_impl_of_match.  So we stopped getting
> adreno_smmu_priv on sc7180, breaking per-process pgtables.
> 
> Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create")
> Cc: <stable@vger.kernel.org>
> Suggested-by: Lepton Wu <lepton@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

