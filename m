Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FF036DF2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 20:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243753AbhD1Sua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 14:50:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32276 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240641AbhD1Su2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 14:50:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619635783; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=N/dajtlHUGmV0bs/qmyBU9Z9YVX9qd8QVrSfTOAJZuY=; b=CkfXab7hFZr1dp4oOF80QERTa22TemOu+r/f3vMcNqekTugXhigw8JhUfYByjQ/qPmsVBYfB
 OIZtJo3Q694cGJEcodJs7v3JJy+sw7PslrVqifxnn1oNN6t1xuKncKyu89/niHmQjCrZa1Zf
 cFAGnMSXqlWFPgU4sAADi/F/jck=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6089ae462cc44d3aea5e1c16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 18:49:42
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E7C1C4338A; Wed, 28 Apr 2021 18:49:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from subbaram-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16B83C433F1;
        Wed, 28 Apr 2021 18:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16B83C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     aghayal@codeaurora.org, collinsd@codeaurora.org,
        fenglinw@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, subbaram@codeaurora.org
Subject: Re: [PATCH 0/2] Add QCOM PMIC PWM driver
Date:   Wed, 28 Apr 2021 11:49:37 -0700
Message-Id: <1619635777-2872-1-git-send-email-subbaram@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20210428155422.GL1908499@yoga>
References: <20210428155422.GL1908499@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>> Add PWM driver to support PWM modules inside QCOM PMIC chips which are accessed
>> through SPMI bus. Normally, there would be multiple PWM modules with adjacent
>> address spaces present in one PMIC chip, and each PWM module has 0x100 size of
>> address space. With this driver, a pwm_chip with multiple pwm_device individuals
>> is created, and each pwm_device individual is corresponding to one PWM module.
>> 

> Exposing this as individual pwm_chips will prevent us from enabling the
> LED related use cases (patterns and multicolor) that most versions of
> the hardware support.

> I proposed [1] a while ago and think this is a better approach. I'll
> take some time to respin this and send out the next version.

> [1] https://lore.kernel.org/linux-arm-msm/20201021201224.3430546-1-bjorn.andersson@linaro.org/

Hi Bjorn,
Yes, we came across this patch series but this driver (leds-qcom-lpg) is a
combo one which provides support only for RGB LEDs (or TRI_LED module) along
with PWM/LPG channels allocated for it. Say, if we've additional PWM channels
on the same PMIC (that provides user-interface support) or another PMIC
(non user-interface) that has multiple PWM channels that are not used for LED
notifications, it would be good to have a separate PWM driver to support such
channels IMHO. There are couple of use cases we've come across recently.

1. Using a PWM channel for controlling external LCD backlight controller
2. Using a PWM channel for controlling a haptics actuator

Thanks,
Subbaraman

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
