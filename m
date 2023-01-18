Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BBE6710E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjARCLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjARCLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:11:32 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1632365A
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:11:29 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 18so47704893edw.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GW7I0VrYyXDQaLR5GtSXiM2WBJ7x/cZaIN3Wwv9s2M=;
        b=TWLLN7E0rk58pAw58fgr9ZG/R++20o0Ja/Tb2x7RuRPFTEOnMn25Yp2cP+MsJrOu4h
         e5/D12SpFyzR/HPnwll6Vpd8Cr3id9qcZRzbr0l7JVlLikHMSJ884NiXPvXa02CPTTLe
         0bqoW3JI7cocGc13cUPDJzXzL4HYedJJWYAHKADBYsA1fwQ3n32uH54zPwyUAdpCOA6Y
         bbKP33LOlfnUUkT1NnH1akb1FE6xNVEFIVbLybMXw+zBDzJxXzHQiSHjm2CdjED6wHrR
         4eOJwLeD7V0bVgiPA6YRra2+CKdvkZyYW2g0nAhjGr2EIx0qD2V5vqwlRt/KdlDxcYj+
         oR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GW7I0VrYyXDQaLR5GtSXiM2WBJ7x/cZaIN3Wwv9s2M=;
        b=W5ZvFOlz/l6JtDM2Fa+Dz8e/1hOjwR306jS4SwG0bcoYBEabajh7AfCI3kwOPwKekt
         r3XPC+fB2OiaEV8TsFEhKfh2J6B0CaPlxRlsnfm62sYo2MLFDtx4NPuas2MLIOMPxsl/
         8RPbdfAVElhTKvayV/5GurRiM1HUx1F0zUgeEQxtcjzuh60anUvNxD51K7OomxwwDuUM
         B4xgKdEMm6qh/f4DM8VmBT75QKMi+2lprfdIfQ9MkiwNOoBSyQkXEPrNBqXiuDy5SCGw
         VmFqGgnA3h/OIpHOH48ydwcKod/FUkU/QHnvwbIvK6PJhJOR8lyTxpkTI93wuAI/EC2U
         WP3Q==
X-Gm-Message-State: AFqh2kp4n8pVvrQYqM+Kawb9r+18fAV205dqUdW9UwTE9jAZengsTozM
        ifeMVHiuE//l75rZaqJ6JUpsHA==
X-Google-Smtp-Source: AMrXdXuERO0vlwGdXJUCd4MNMJSTzLzLEcBV4NIgIv0IXpiTvF8dU4K2xy8Yqe2PPsl+Kdoyg6s4sg==
X-Received: by 2002:a05:6402:3894:b0:49e:45a8:1ac9 with SMTP id fd20-20020a056402389400b0049e45a81ac9mr1391644edb.24.1674007888516;
        Tue, 17 Jan 2023 18:11:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec49-20020a0564020d7100b0049e249c0e56sm2579123edb.56.2023.01.17.18.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 18:11:28 -0800 (PST)
Message-ID: <5ceeaf13-8073-efe2-7a56-370071ff8b3d@linaro.org>
Date:   Wed, 18 Jan 2023 04:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 4/6] phy: qcom-qmp: qserdes-txrx-ufs: Add v6 register
 offsets
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
References: <20230117224148.1914627-1-abel.vesa@linaro.org>
 <20230117224148.1914627-5-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230117224148.1914627-5-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 00:41, Abel Vesa wrote:
> The new SM8550 SoC bumps up the HW version of QMP phy to v6 for USB,
> UFS and PCIE g3x2. Add the new qserdes TX RX but UFS specific offsets
> in a dedicated header file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   .../phy-qcom-qmp-qserdes-txrx-ufs-v6.h        | 30 +++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  2 ++
>   2 files changed, 32 insertions(+)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

