Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB49F1FC682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 08:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFQG4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 02:56:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:29435 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725846AbgFQG4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 02:56:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592377013; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QDAPNg4/kJBIPrrC24qiYUrNEkN8hgr7WOxOCGbJ8R4=;
 b=lTlCwy2TBuL+PBHoML5eNsbz1zBbzxSSJr7y2XqOe7/p6NyQ1hH/Tbg0yAc8wJ7gwnM1Sscb
 r6bV2X0OOpCJJ2clT4Lh6bkKaFoHNLpRof8BrYHxgHquUHPH54dsf8iM/c8PjoGBv3mFKRz0
 B1W2L5sKbF4GnG1ikvDUFNu7C7A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ee9bea7567385e8e7c84e22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Jun 2020 06:56:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 892ECC43395; Wed, 17 Jun 2020 06:56:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BF65C433C8;
        Wed, 17 Jun 2020 06:56:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Jun 2020 12:26:38 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 0/2] Convert QCOM watchdog timer bindings to YAML
In-Reply-To: <cover.1581459151.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1581459151.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <c2b8fabcf82b27c7334482bd53ebba62@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-02-12 03:54, Sai Prakash Ranjan wrote:
> This series converts QCOM watchdog timer bindings to YAML. Also
> it adds the missing SoC-specific compatible for QCS404, SC7180,
> SDM845 and SM8150 SoCs.
> 
> v1:
> https://lore.kernel.org/lkml/cover.1576211720.git.saiprakash.ranjan@codeaurora.org/
> v2:
> https://lore.kernel.org/lkml/cover.1580570160.git.saiprakash.ranjan@codeaurora.org/
> 
> Changes since v2:
>  * Add missing compatibles to enum.
> 
> Changes since v1:
>  As per Rob's suggestion:
>   * Replaced oneOf+const with enum.
>   * Removed timeout-sec and included watchdog.yaml.
>   * Removed repeated use of const:qcom,kpss-wdt and made use of enum.
> 
> Sai Prakash Ranjan (2):
>   dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
>   dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845,
>     SM8150
> 
>  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
>  .../bindings/watchdog/qcom-wdt.yaml           | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 28 deletions(-)
>  delete mode 100644 
> Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>  create mode 100644 
> Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml


Gentle ping!

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
