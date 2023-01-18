Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E710A671293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjAREZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjAREZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:25:11 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CFD5413E
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:25:09 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id mg12so7972941ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rlq8ZUkPme8OoPapVwxYuqzeRJKR1AlfI4njj17otEg=;
        b=dNEFIdt4/udYrvDmeARVfEBQCrPK3rKTwEa3jhMG3zbuLHZlxN8ha2hwt9z0aGdAAZ
         0q1YY+T91JD8CxK4oPNmygB0QlWj6svrvhtXX9R5JfJsFVKBqNf3EoZVwWTpVW55nrAq
         yvh6eHq6Kqm4kmOdoYUM+ZXRmWw3fc785SbLUJAyr0gniBrKhe3RelHR6Oqhqig9NUbC
         EM3qUPZduMZoViYsGYqxxJc7LVM0+3vfkAcWTy8WUMt3i+esyC5i0fsszaApHKmUGtca
         BgR9S8rj2Ypa3eQWVbpl32cA8lYQssbTbukZ1GsF1AT742+PNQ5P80NXHd9ctfdVFooY
         HY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlq8ZUkPme8OoPapVwxYuqzeRJKR1AlfI4njj17otEg=;
        b=nZlddresxf8Lzssdmjl2mAnjpiNnysIoWtLJ8fpNkIxicp9f3wLX1VLFs/j2lCHM2f
         161x0heStWrEa2WDOSnzMlivptqZS5ObOC4M5g7wxql0kVXIbcT7F4Z1GJZU2HUhSUuJ
         WU+ndXhHNV6UhLlXtUTp3653k7XjUXw1VmgXJR4tIhysL8+v0lH94HYzeb7lc+duNbWL
         LgbkpUuFGtd8UjZVPL6lv24eMUtxkAbnBueLMMmvbDxqVt9uFGSsqcXOIzpbjvjOE8CI
         leQF6wYXY4sCNB54Nwc0J4jOTQ61bYAoB7HlzKIviVXNLnD9rJCOvEx6CXi3k05VZ/tQ
         Jo/A==
X-Gm-Message-State: AFqh2krcyTM0r6nRuupgPkZnWcW79mFOZgUmFDoB6aOEoXm+bhw7KMrV
        EnF3SWVTf+7ffDBpDu8G0qgZMw==
X-Google-Smtp-Source: AMrXdXu3yncy/ZyCBYWEMG85EiI1UpQFEKhkgGJaiAXT32bNHpPzTa+aaDVKI2uBDmS5LRMWOVZ2GQ==
X-Received: by 2002:a17:906:4a12:b0:7ad:d7a4:4346 with SMTP id w18-20020a1709064a1200b007add7a44346mr5474439eju.66.1674015908396;
        Tue, 17 Jan 2023 20:25:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fy5-20020a170906b7c500b0084d3bf4498csm12646209ejb.140.2023.01.17.20.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 20:25:08 -0800 (PST)
Message-ID: <1e9d0c74-a2bf-d587-dcec-44b244004188@linaro.org>
Date:   Wed, 18 Jan 2023 06:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 4/8] phy: qcom-qmp: pcs-pcie: Add v6 register offsets
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
References: <20230118005328.2378792-1-abel.vesa@linaro.org>
 <20230118005328.2378792-5-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118005328.2378792-5-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 18/01/2023 02:53, Abel Vesa wrote:
> The new SM8550 SoC bumps up the HW version of QMP phy to v6 for USB,
> UFS and PCIE g3x2. Add the new PCS PCIE specific offsets in a dedicated
> header file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        |  1 +
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h | 15 +++++++++++++++
>   2 files changed, 16 insertions(+)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

