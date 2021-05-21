Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4EC38BAA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 02:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhEUAF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 20:05:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:19657 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231628AbhEUAFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 20:05:55 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 May 2021 17:04:30 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.134.64.25])
  by ironmsg05-sd.qualcomm.com with ESMTP; 20 May 2021 17:04:30 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 3C44720F18; Thu, 20 May 2021 17:04:30 -0700 (PDT)
Date:   Thu, 20 May 2021 17:04:30 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Add Qualcomm Technologies, Inc. PM8008 MFD driver
Message-ID: <20210521000429.GA19541@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620690653.git.gurus@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 10, 2021 at 05:27:05PM -0700, Guru Das Srinagesh wrote:
> Changes from v3:
>   - Addressed Lee's comments. 
>   - This patchset is still based on regmap.git's for-next branch as my
>     regmap-irq changes have not yet landed in mfd.git for-mfd-next or
>     for-mfd-next-next (please advise which branch to use in this regard).
> 
> Changes from v2:
>   - Collected Rob Herring's Acked-by for the IRQ listing patch
>   - Addressed Rob's comments for the dt-bindings patch
> 
> Changes from v1:
>   - Removed errant Change-Id from dt-bindings IRQ patch and gathered Bjorn's
>     Reviewed-by
>   - Fixed up YAML errors using make dt_binding_check

Hi Lee,

Could you please review this patchset when you get a chance?

Thank you.

Guru Das.
