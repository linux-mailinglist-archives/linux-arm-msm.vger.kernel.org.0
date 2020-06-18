Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2503B1FEBD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 09:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgFRHBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 03:01:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14921 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727055AbgFRHBl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 03:01:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592463700; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=mKnfwSJZJmpEpaixsgLf4I8u4hOTMyn+oOvDxaMsXq0=; b=YU28S6H5SeuQJaU/fk7zCo0M6xxg3zRpqGzGa/26YSvPv7QwQ4b9TFNA7jWhel0zZCnKsDXd
 TEQvZd/cUF2rhMnuSekyUp1ydhdvWHPp6IssMp4N+qtaAk05jm7FwxadICTDANmFV3RLkRCT
 UIye3KEa7ih9eY6ac3OgCieyW1U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5eeb1130a3d8a447437b0c6d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 07:01:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7256C433CB; Thu, 18 Jun 2020 07:01:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [49.207.137.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD204C433C9;
        Thu, 18 Jun 2020 07:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD204C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V7 0/4] Add APSS clock controller support for IPQ6018
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1591440907-20021-1-git-send-email-sivaprak@codeaurora.org>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <852c7804-b1b3-2d78-00f6-b67b9fd4e720@codeaurora.org>
Date:   Thu, 18 Jun 2020 12:30:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1591440907-20021-1-git-send-email-sivaprak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ping!

Hi Stephen,

Is it possible for you to review this series? We have regulators and few 
other patches

depend on this patch, it would be great if you could provide your inputs 
on this.

Thanks,

Siva

On 6/6/2020 4:25 PM, Sivaprakash Murugesan wrote:
> The CPU on Qualcomm's IPQ6018 devices are primarily fed by APSS PLL and XO,
> these are connected to a clock mux and enable block.
>
> This patch series adds support for these clocks and inturn enables clocks
> required for CPU freq.
>
> [V7]
>   * Removed dts patch from this series, will send that separately
>   * Addressed Rob's minor comment on the binding
>   * Patch 1 depends on a53 pll bindings
>     https://lkml.org/lkml/2020/5/4/60
> [V6]
>   * Split mailbox driver from this series, mailbox changes will sent as a
>     separate series
>   * Addressed review comments from Stephen
> [V5]
>   * Addressed Bjorn comments on apss clk and dt-bindings
>   * Patch 2 depends on a53 pll dt-bindings
>     https://www.spinics.net/lists/linux-clk/msg48358.html
> [V4]
>   * Re-written PLL found on IPQ platforms as a separate driver
>   * Addressed stephen's comments on apss clock controller and pll
>   * Addressed Rob's review comments on bindings
>   * moved a53 pll binding from this series as it is not applicable, will send
>     it separately.
> [V3]
>   * Fixed dt binding check error in patch2
>     dt-bindings: clock: Add YAML schemas for QCOM A53 PLL
> [V2]
>   * Restructred the patch series as there are two different HW blocks,
>     the mux and enable belongs to the apcs block and PLL has a separate HW
>     block.
>   * Converted qcom mailbox and qcom a53 pll documentation to yaml.
>   * Addressed review comments from Stephen, Rob and Sibi where it is applicable.
>   * Changed this cover letter to state the purpose of this patch series
>
> Sivaprakash Murugesan (4):
>    dt-bindings: clock: add ipq6018 a53 pll compatible
>    clk: qcom: Add ipq apss pll driver
>    clk: qcom: Add DT bindings for ipq6018 apss clock controller
>    clk: qcom: Add ipq6018 apss clock controller
>
>   .../devicetree/bindings/clock/qcom,a53pll.yaml     |  18 ++++
>   drivers/clk/qcom/Kconfig                           |  19 ++++
>   drivers/clk/qcom/Makefile                          |   2 +
>   drivers/clk/qcom/apss-ipq-pll.c                    |  95 ++++++++++++++++++
>   drivers/clk/qcom/apss-ipq6018.c                    | 106 +++++++++++++++++++++
>   include/dt-bindings/clock/qcom,apss-ipq.h          |  12 +++
>   6 files changed, 252 insertions(+)
>   create mode 100644 drivers/clk/qcom/apss-ipq-pll.c
>   create mode 100644 drivers/clk/qcom/apss-ipq6018.c
>   create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h
>
