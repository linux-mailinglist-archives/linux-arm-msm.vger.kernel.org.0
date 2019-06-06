Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1743036D50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 09:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfFFH0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 03:26:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39766 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFH0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 03:26:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4DEEE60A50; Thu,  6 Jun 2019 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559806004;
        bh=NDsCQMTGQ/205TvP8GN/bfYntCpZX3vSnLmqhd7phZU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FJuXAdBCAyIr6a5dicjbm+9nCUzJ5rZ5rs1MuZXE8IGOyXz6d6Ton4CdUGm5a9mGB
         AxV0HgLck2MWvIMlNRzziMbk9D72DaD+804BKZAqwigTq57KMNnICh6KmQRBIQkLRo
         ZQ2s3q/7XYNrf92bdOBV9hXWPnR4Lz0LwTYfwqX4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B47026030E;
        Thu,  6 Jun 2019 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559806004;
        bh=NDsCQMTGQ/205TvP8GN/bfYntCpZX3vSnLmqhd7phZU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FJuXAdBCAyIr6a5dicjbm+9nCUzJ5rZ5rs1MuZXE8IGOyXz6d6Ton4CdUGm5a9mGB
         AxV0HgLck2MWvIMlNRzziMbk9D72DaD+804BKZAqwigTq57KMNnICh6KmQRBIQkLRo
         ZQ2s3q/7XYNrf92bdOBV9hXWPnR4Lz0LwTYfwqX4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B47026030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f47.google.com with SMTP id h9so1893626edr.0;
        Thu, 06 Jun 2019 00:26:43 -0700 (PDT)
X-Gm-Message-State: APjAAAV9gH1y+zWVyrLixCxkRgFPUzaQRdW9p3UTkjB55vY6iRVbP5rQ
        ZDkw4a7yIDhZaP6/hIbforLxWorT7SkWThcB6Yc=
X-Google-Smtp-Source: APXvYqyMq3bs4ifWOpS2YPWjKkNYwVf2WG4sbHxz909RdciIk0qvBUaCxk6b4HbsrDV2PXnemFBIcDPA2cuVtPEjle0=
X-Received: by 2002:a17:906:3fc8:: with SMTP id k8mr1736996ejj.2.1559806002530;
 Thu, 06 Jun 2019 00:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190606043851.18050-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190606043851.18050-1-bjorn.andersson@linaro.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 6 Jun 2019 12:56:31 +0530
X-Gmail-Original-Message-ID: <CAFp+6iG66C-6ySw81bVsxbWqP+qCza0+QxuQ4Z-MXqB6DV2KZg@mail.gmail.com>
Message-ID: <CAFp+6iG66C-6ySw81bVsxbWqP+qCza0+QxuQ4Z-MXqB6DV2KZg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dragonboard 845c
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Jun 6, 2019 at 10:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), microSD-card and Bluetooth.
>
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the board to reboot. This can be worked around
> using:
>
>   fastboot oem select-display-panel none

This works well with your SMR handoff RFC series too?

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Patch looks good, so
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best Regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
