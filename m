Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7258F1D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 19:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732462AbfKFSU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 13:20:27 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:51328 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbfKFSU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 13:20:27 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 09A036090E; Wed,  6 Nov 2019 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573064426;
        bh=5ypWavDEVtsHt7SQ/MbY2KLvgfwcyST2KUyItV5eUyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BOKMWt3F9UIqUcQwNg2qE01VXlHm1tMR9AT1pKPy03j991Uv10/AeaH8uHmAsE36N
         PBihNoiay4HFor4Pgrt2bSi8xuNY7NEhLx3sH2rg5ZelCsb1dRFMusi9GDhLZETJUv
         5v8hJDbhCBKGtIGBrJJYUpk2hKpcjwaVhpEM3DWU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 233F26016D;
        Wed,  6 Nov 2019 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573064425;
        bh=5ypWavDEVtsHt7SQ/MbY2KLvgfwcyST2KUyItV5eUyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKT6wkNtnrE1Co/LI8pZlL2D5sNj3PxXYp8Bk1UNk6tW14XNze+qEZMIAIpyiJjPD
         Rtip5KKp5zp8E+2SzG7Ui6S/uMckr5g8MwQBAPY97arb9ReMTCFMdZTpSM7b04Ochu
         3afxhsWXpzHM8lies5w+KdfpwIKSpcf2f/MfhL/8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 233F26016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 6 Nov 2019 11:20:21 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 07/14] drivers: irqchip: qcom-pdc: Move to an SoC
 independent compatible
Message-ID: <20191106182021.GF16900@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-8-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191106065017.22144-8-rnayak@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 06 2019 at 23:52 -0700, Rajendra Nayak wrote:
>Remove the sdm845 SoC specific compatible to make the driver
>easily reusable across other SoC's with the same IP block.
>This will reduce further churn adding any SoC specific
>compatibles unless really needed.
>
>Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>Cc: Lina Iyer <ilina@codeaurora.org>
>Cc: Marc Zyngier <maz@kernel.org>
Reviewed-by: Lina Iyer <ilina@codeaurora.org>

>---
> drivers/irqchip/qcom-pdc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>index faa7d61b9d6c..c175333bb646 100644
>--- a/drivers/irqchip/qcom-pdc.c
>+++ b/drivers/irqchip/qcom-pdviewed-by: Lina Iyer <ilina@codeaurora.org>
>@@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
> 	return ret;
> }
>
>-IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
>+IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>--
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>of Code Aurora Forum, hosted by The Linux Foundation
>
