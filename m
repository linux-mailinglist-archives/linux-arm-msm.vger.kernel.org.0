Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287075FCCFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiJLVUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiJLVUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:20:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F9210C4F5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d6so27554579lfs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdDbWhvoiJRG89BD5dE2gVDakK8t1fMBln1UzYwcbsM=;
        b=QIIPhmOR/ygXMIlgJKv1RuIjMiW0QVo+qOldxt3dYn6YfH/uOsahG0nDfESM2jriMo
         8drnuM3MOXyum9THyjIu7veysUnCsToKz8VnC7v3QCtdTfjwfJjni+j8RMW2uhCCyB8W
         m5lUOdQJmkgUaDEnt62rpti39zBvz3cwMSQUDrOqjI17ys1vzt77gy70XkAXJ0LQ4JuL
         gVT/2PbHfKHaxYG2I0fYFwmYKEZsUveDvgPNLF45sxgdcFyYDtdtPqF7TeT6A0PZN5o1
         WZkLujmzkG8tx3k0zpQJNQel74D/bqHS/z2coTyM+KOBez8yL1Mrswzb1vcG++gH/1FL
         3JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdDbWhvoiJRG89BD5dE2gVDakK8t1fMBln1UzYwcbsM=;
        b=eDuH7QHsSvLv+7gDBqdpBnsBcm++y7cGrswf840WpadXfDqe3hFeGmukTPvnKAR1UL
         Vy4+LtxaqCsD6HwgPQAREyGaR7hxLphFzmlKIjp67iUlQvqC+dH84zUbu9OQb5rN0Z6B
         SYzI9Cn1tv5utrReaBr4fHueT52Oq7KGmRck4YxBAveWCct+cYlo7KXE+lHOqn6Hf8+M
         TvsvqRrCVxM4nKrcdlpmDq1udTsF7nZwQJbYLCxh3+acEscbooaCJSJNWSwBSAlWB5Xc
         +S80BfUfjXlHhO1bhvORWP/6mqAviAzgV1+Z+m8Ss0FIWfS0J9gQ5Bzqrr2Hm/daOAkQ
         o84A==
X-Gm-Message-State: ACrzQf0t/aRB6oGK60u4DUyG2kcHOyNgp1U6mBDQWUPs1qlbkExQxIgH
        RrIbhRPkFSueLVxGgj/pSjLAKQ==
X-Google-Smtp-Source: AMsMyM6gMXeXdtMfzBlcF8fU2oRLxtql7KgnWMY2cxlEp3jUEhl8SDun4CtifQhqEFJ4HRDHOohcAw==
X-Received: by 2002:a05:6512:3e01:b0:4a2:5c6e:d88e with SMTP id i1-20020a0565123e0100b004a25c6ed88emr11830475lfv.431.1665609641863;
        Wed, 12 Oct 2022 14:20:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a056512200400b00494978b0caesm100867lfb.276.2022.10.12.14.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:20:41 -0700 (PDT)
Message-ID: <e21fbd16-18ab-ffad-2bb0-618acd1d4843@linaro.org>
Date:   Thu, 13 Oct 2022 00:20:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 18/20] phy: qcom-qmp-pcie-msm8996: drop start and
 pwrdn-ctrl abstraction
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-18-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-18-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:50, Johan Hovold wrote:
> Drop the start and pwrdn-ctrl abstractions which are no longer needed
> since the QMP driver split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c    | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

