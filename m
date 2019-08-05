Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D43581213
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 08:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfHEGG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 02:06:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55674 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfHEGG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 02:06:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 29E32608CC; Mon,  5 Aug 2019 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564985215;
        bh=ktVD02BcXE+HLZRKFPfw+gQviyMJgu1ejEKfwVh3mng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fl9CUnf9ZxYQiJT08h5HG5SSXur27bgh2qCzqGrcelIG+5bPwSHtj4D3VyoubUS7/
         V2Qsyce5R0FUeI7imxrJMvA5KwutgYE7q4VML8ssuHxFtc/3k6H30T0ENDc9ZY8xRk
         FEnrYeHN36B3ZRjx19HqnpBWu4zJTDInBIrKPjVA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60730607F4;
        Mon,  5 Aug 2019 06:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564985214;
        bh=ktVD02BcXE+HLZRKFPfw+gQviyMJgu1ejEKfwVh3mng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aG1LzNNUJV9oj5ztU6uTHP7smcVXmwvlmb2fskrtaFOXYjc32OR99TTJgnPYVUcV1
         4EjjrYAZbOkmj/7RnCyqMxIUqtK83GwQdhUqKM8DVwOQ0MK4b4iMuDmuRlT6YL5unr
         XlzERhkOtRnNoLN/nV+p9Y/pNwsfBIu4ZzzZt4J4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60730607F4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f52.google.com with SMTP id k8so77501436eds.7;
        Sun, 04 Aug 2019 23:06:54 -0700 (PDT)
X-Gm-Message-State: APjAAAXvtKVwRS/b2y8CUkoxkO93YKR0Xsu9iDCkXz213d7OgFYkYVzq
        zcWWDsgmh9qj+SdLyYvnRtCfLJOjBo5adq7eCY8=
X-Google-Smtp-Source: APXvYqyHeWIMQVWkYsv0f42miwy/sqy8EM/fSMGDzgYt4fdp13rlsYiET5rETi6Iu0JYtozFD3S2JRft2Vzy+ZDHZWI=
X-Received: by 2002:a17:907:2130:: with SMTP id qo16mr61519114ejb.235.1564985213057;
 Sun, 04 Aug 2019 23:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190804162420.6005-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804162420.6005-1-nishkadg.linux@gmail.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Mon, 5 Aug 2019 11:36:41 +0530
X-Gmail-Original-Message-ID: <CAFp+6iE0BN9+BA-9hozs0-0LDCA+-LLZPdZfebaRAi9nTRV4xg@mail.gmail.com>
Message-ID: <CAFp+6iE0BN9+BA-9hozs0-0LDCA+-LLZPdZfebaRAi9nTRV4xg@mail.gmail.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-qmp: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, kishon <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 4, 2019 at 9:54 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
>
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 34ff6434da8f..2f0652efebf0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2094,6 +2094,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>                         dev_err(dev, "failed to create lane%d phy, %d\n",
>                                 id, ret);
>                         pm_runtime_disable(dev);
> +                       of_node_put(child);
>                         return ret;
>                 }
>
> @@ -2106,6 +2107,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>                         dev_err(qmp->dev,
>                                 "failed to register pipe clock source\n");
>                         pm_runtime_disable(dev);
> +                       of_node_put(child);

Nice find. Thanks for the patch.

Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best regards
Vivek

[snip]
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
