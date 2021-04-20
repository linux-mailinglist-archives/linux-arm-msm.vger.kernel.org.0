Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4656E365DAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 18:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhDTQrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 12:47:31 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:44974 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232473AbhDTQrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 12:47:31 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Apr 2021 09:46:59 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 20 Apr 2021 09:46:59 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 6773219D9; Tue, 20 Apr 2021 09:46:59 -0700 (PDT)
Date:   Tue, 20 Apr 2021 09:46:59 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add Qualcomm Technologies, Inc. PM8008 MFD driver
Message-ID: <20210420164659.GA21665@codeaurora.org>
References: <cover.1618278453.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618278453.git.gurus@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 12, 2021 at 07:00:24PM -0700, Guru Das Srinagesh wrote:
> Changes from v2:
>   - Collected Rob Herring's Acked-by for the IRQ listing patch
>   - Addressed Rob's comments for the dt-bindings patch
> 
> Changes from v1:
>   - Removed errant Change-Id from dt-bindings IRQ patch and gathered Bjorn's
>     Reviewed-by
>   - Fixed up YAML errors using make dt_binding_check
> 
> This driver is dependent on changes that have been made to the regmap-irq
> framework that have currently been accepted [1][2] in regmap.git upstream by
> Mark Brown but haven't made it to Linus' tree yet. For this reason, this driver
> has been based on the tip of regmap.git and not mfd.git.
> 
> Those changes, and this driver, are the result of a rewrite effort that was
> promised a long ago [3]. The framework changes and this driver have been tested
> and verified end-to-end on an internal platform.
> 
> [1] https://lore.kernel.org/lkml/20210318183607.gFxO2hoTO274vl3jUuxWbi19rq9wQELzN-y3B4jvO10@z/
> [2] https://lore.kernel.org/lkml/161726943419.2413.4844313396830856637.b4-ty@kernel.org/
> [3] https://lore.kernel.org/lkml/20200519185757.GA13992@codeaurora.org/

Hi Lee, mfd reviewers,

This new driver depends on three regmap-irq framework changes that have
been accepted by Mark (please see above) and hence will land only in the
next rc-1 release. I just wanted to make sure that this patch series was
on your radar [1]. The dt-bindings has been Acked by Rob already, and
I'd be happy to address any review comments while patiently waiting for
the dependencies to land.

[1] https://lore.kernel.org/lkml/20210419072229.GA4869@dell/

Thank you.

Guru Das.
