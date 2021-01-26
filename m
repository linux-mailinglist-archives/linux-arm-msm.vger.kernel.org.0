Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7F9305847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 11:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314195AbhAZXCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405419AbhAZUMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 15:12:25 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08165C0613ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 12:11:45 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a8so24468959lfi.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 12:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8YPuJSo/Ctz3y/b9vjns8oaUIFXpJod7O95PtwVpOOg=;
        b=hf9VsxQjKXwhtOt5BE9bt4BAarY5cOZBvh16EtXohnJctrjCQdQdfrShx6AcuEHvcc
         KAlNOdM2tJUwfAI+6+GuPoVlX1MumpKq2NAz0OxRoTBZ/NMaLsF6uNnD/nmJ5WcgSMjj
         /CpRgnoe2+WsJL6gGz+y0gaDINQb7Oc2yeptmLXf/t7XZ9DRw9SloN9FwSs8B2ckvAf4
         5zH+V7COyXRV+jRtaUSffzryQwUbRA0a7HT6kwWa6rkH3RSnvT1Wg+Fsg0c8Ou1q/oa9
         p0KSGT36juNFCMfKcFEyS7cMTYeVnmPBeHbrIVFFJUYiOADq7CQdXoO55sFkKqFtDj0Z
         JGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8YPuJSo/Ctz3y/b9vjns8oaUIFXpJod7O95PtwVpOOg=;
        b=RFxEgLQRHO451JHsoDYdQUP+y8oZNCp3qzbWkES4TolOII3wn29Mm3W8dJrqoVlfB6
         7of97vZePxmjSWxNUfgcokZV6ImAFKER23EIs+T8f93+b2YFJvZPPiSbUD1LjsV9Dotf
         J6Xlm79T/vOEHBVaR1rIIRNO9fMT8RWAUozAunZdSlgD1r67XMtW0C0A+pXO6wzfmqaQ
         WLvjRwmS3vF7TMIwPoJ2qb2cCqS5l8yII72+KUpWI/rrCroAGKBMhqawo+eCgpbkPVQV
         nuWcufhmuvDaZRrXTbT2Hk3ZkaX5lf03nJdcBMg+n5H8CKtagre2pz/EvpSDIXl8tXOW
         kFlw==
X-Gm-Message-State: AOAM533JlFf/tCHfAbdsDiDSsUxkK2zMvP5Va7I+uU5Y9P9YL2628HzH
        veDWaUKcuVPXR7O+uxDkVIbHcA==
X-Google-Smtp-Source: ABdhPJxs4fHMHxtc4B4yVQwvl50X5PLLxgMZq91FRxwZxRqFFiGbXAW/cT1/bgeFBXX56rr+mQy5+g==
X-Received: by 2002:a05:6512:22c2:: with SMTP id g2mr3521030lfu.634.1611691903540;
        Tue, 26 Jan 2021 12:11:43 -0800 (PST)
Received: from [192.168.1.211] ([94.25.229.205])
        by smtp.gmail.com with ESMTPSA id g27sm622716lfh.291.2021.01.26.12.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 12:11:42 -0800 (PST)
Subject: Re: [PATCH v5 0/2] PCI: qcom: fix PCIe support on sm8250
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
References: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
Message-ID: <64f62684-523d-cbd5-708b-4c06e7d03954@linaro.org>
Date:   Tue, 26 Jan 2021 23:11:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rob, Lorenzo, gracious poke for this patchset.


On 17/01/2021 04:31, Dmitry Baryshkov wrote:
> SM8250 platform requires additional clock to be enabled for PCIe to
> function. In case it is disabled, PCIe access will result in IOMMU
> timeouts. Add device tree binding and driver support for this clock.
> 
> Canges since v4:
>   - Remove QCOM_PCIE_2_7_0_MAX_CLOCKS define and has_sf_tbu variable.
> 
> Changes since v3:
>   - Merge clock handling back into qcom_pcie_get_resources_2_7_0().
>     Define res->num_clks to the amount of clocks used for this particular
>     platform.
> 
> Changes since v2:
>   - Split this clock handling from qcom_pcie_get_resources_2_7_0()
>   - Change comment to point that the clock is required rather than
>     optional
> 
> Changes since v1:
>   - Added Fixes: tags, as respective patches have hit the upstream Linux
>     tree.
> 
> 


-- 
With best wishes
Dmitry
