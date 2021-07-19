Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219503CE553
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 18:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347452AbhGSPsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 11:48:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38438 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346196AbhGSPqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 11:46:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626712055; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0IX0cVxa2i7vjg48zuOCkM8MQPeVf5ULa5JqRGdLPGA=;
 b=jUmETp7jpbA+4eJkQiBtLifPxFanhLuBHf1SWIUozQuaVVNyn8moZG5lN2870eEESD4ftYnI
 v+BLOSj+pY2yaNfgZKsy1vfv0dcnNXxjOCwuCtEbfJt31CI99KhVxfP0/8C0rGjmp3uhlV+q
 cV3NJyywJ/1yqGvJoaPo+slY8Nk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60f5a7eee81205dd0a92a47c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Jul 2021 16:27:26
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38DFCC41630; Mon, 19 Jul 2021 16:27:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 800F8C43146;
        Mon, 19 Jul 2021 16:27:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Jul 2021 21:57:25 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Subject: Re: [PATCH v3 0/5] Enable miscellaneous hardware blocks to boot WPSS
In-Reply-To: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
References: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
Message-ID: <19cc1c3cceaedd1e899732d874e6160a@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-29 16:21, Sibi Sankar wrote:
> This series enables miscellaneous hardware blocks to boot Wireless
> Processor Subsystem (WPSS) on SC7280 SoC.
> 
> V3:
>  * member placement and style changes [Philipp]
> 
> V2:
>  * place resets and num_resets adjacent to each other [Stephen]
>  * drop incorrect useage of tcsr_mutex_regs [Bjorn]
>  * Qualcomm is expected to drop master/slave naming from its mproc 
> nodes
>    in future SoCs.
> 
> Sibi Sankar (5):
>   dt-bindings: mailbox: Add WPSS client index to IPCC
>   dt-bindings: reset: aoss: Add AOSS reset controller binding
>   dt-bindings: reset: pdc: Add PDC Global bindings
>   reset: qcom: Add PDC Global reset signals for WPSS

Philipp,

Can you pick the reset bindings
and the reset driver changes
through your tree, Bjorn has
picked up the remainder of the
series.

>   arm64: dts: qcom: sc7280: Add nodes to boot WPSS
> 
>  .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
>  .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 138 
> +++++++++++++++++++++
>  drivers/reset/reset-qcom-pdc.c                     |  62 +++++++--
>  include/dt-bindings/mailbox/qcom-ipcc.h            |   1 +
>  include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
>  6 files changed, 201 insertions(+), 11 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
