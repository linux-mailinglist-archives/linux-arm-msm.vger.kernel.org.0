Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C64A35002B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbhCaM0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:26:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235289AbhCaM0E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:26:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF7E6195C;
        Wed, 31 Mar 2021 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617193563;
        bh=ZR5P2glaJuzqdi7xvnprsAnU8fByBTG5/hDGcSlFFPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqnHa8JtMOzCp+jw/yGJFqouYZ3faCYz6APNZ4JA3dqwQayoxsNUXbDowISfD8Udo
         /KYfionaqlfr8365gV7cJfySOgzVIL+Ci8ZoQNRDmMUieeU9PHq3fw9QgkbTFtus9y
         kGFrIVG5UaSQBiQYK86aTj5gKkYITzX44/0yFLffarzDaufHWNNCH34kOb1EkjT0XP
         Er0Qisap94IstdIIBLhPNBXvoULMky3bZOMQGk4UEwmrSU0sSAwAK2HojtbFX7P20A
         wtmhgtMvAEF0ium39Ce/AyyoJ+ABCx6wgLJZNJM8HguXjm8/52Zs0l/zV1GooFwZeC
         S0OjJrz21zPTA==
Date:   Wed, 31 Mar 2021 17:55:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/7] phy: qcom-qmp: provide DP phy support for sm8250
Message-ID: <YGRqV5pQ3Fj8Nk5s@vkoul-mobl.Dlink>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-03-21, 23:52, Dmitry Baryshkov wrote:
> Changes since v4:
>  - Fix typo in the qcom,sc7180-qmp-usb3-phy name in the first patch
> 
> Changes since v3:
>  - Move qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy from
>    qcom,qmp-usb3-dp.yaml to qcom,qmp-phy.yaml
>  - Do not touch qcom,sm8250-qmp-usb3-phy compatible
> 
> Changes since v2:
>  - Drop unused qmp_v4_usb3_rx_tbl
> 
> Changes since v1:
>  - Provide dt bindings
>  - Split register renaming from sm8250-dp-phy patch
>  - Add respective changes to sm8250 device tree
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

This should be based on phy-next. This fails to apply for me. Can you
please rebase and acks and resend

Thanks

-- 
~Vinod
