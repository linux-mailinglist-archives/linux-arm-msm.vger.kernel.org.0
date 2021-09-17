Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170F440F669
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 13:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241734AbhIQLDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 07:03:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62426 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhIQLC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 07:02:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631876498; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=c7UEzZMoyPV0biW4tjuusRt/TSLYLwkVKbXHuqU1ZrI=;
 b=CwtQX/SB1VNYyHiUGOie5APNZkvejkIBTXE+ea2q+RsUgKzv7pWD9tghfPfAggKi8RXYLNVW
 m3rZXa8pLbcF66sllasq9v9UlzmqCoxQVP5S64qzTnf2hNglUXkPDGNB7xGW6NQHM2EqT+Vg
 eiMs2V4wJ4bXw2GfBrn5Hd5oF4w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61447591ec62f57c9a9b06fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 11:01:37
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10A56C43460; Fri, 17 Sep 2021 11:01:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EDCCAC4338F;
        Fri, 17 Sep 2021 11:01:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Sep 2021 16:31:35 +0530
From:   skakit@codeaurora.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm Technologies, Inc. PM8008 regulator
 driver
In-Reply-To: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
Message-ID: <6cde0f4eac5f436b38123b7f55c48540@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-17 16:15, Satya Priya wrote:
> Satya Priya (2):
>   dt-bindings: mfd: pm8008: Add pm8008-regulator binding
>   regulator: dt-bindings: Add pm8008 regulator bindings
> 
> satya priya (2):
>   regulator: Add a regulator driver for the PM8008 PMIC
>   arm64: dts: qcom: sc7280: Add pm8008 regulators support for 
> sc7280-idp

This dt change depends on [1] which adds i2c1 DT node
[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1631872087-24416-5-git-send-email-rajpat@codeaurora.org/

>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  24 ++
>  .../bindings/regulator/qcom,pm8008-regulator.yaml  |  76 ++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 103 +++++
>  drivers/regulator/Kconfig                          |   9 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/qcom-pm8008-regulator.c          | 441 
> +++++++++++++++++++++
>  6 files changed, 654 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
>  create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
