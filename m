Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56750412A6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhIUBlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbhIUBj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:29 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBC1C0430D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:53:42 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t189so13843597oie.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1DxHtYBh4DzHUQ01KgUFLlooV5ZfuLGGb9gtdlSK5T8=;
        b=oVUzKPQf3Dx+Ish9YbiDA6rmx4JK8gznqZ15XRqd1dK66S42rpOkuLnHCip24bG6tN
         Kb6ll0czgwMocjwN/yauCrFg3hlkqytUJdDVSc2+K7mFNXl4WjdfUAW4gKt9ZqFbvQRO
         YfV+Ey0wR+Ut7axwjG/USkB+P5lf6NBtOqqEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1DxHtYBh4DzHUQ01KgUFLlooV5ZfuLGGb9gtdlSK5T8=;
        b=vqVJQUwqhIv26hMsAL/VdKsVSYwf/jirgBWMkq8mNYW682swB/hVIyDO15Lr7bN6B0
         o/+wTQxeLWOVsurlcYmav5XFL1hrgNeKmk09pkVC1COKTA+hE/eVybTzdRvOnmcjSu26
         RgNyTwYsKvi7Z8vmCgd2hiTDJU9rkXq6KOV32yVg8R48KYlzN0Je41jsTz/fVveqNjqA
         Y1tzqb/RPCjeaSmkp8wtyJA/I+RAtyxOlEg9N/+ycNYbM1Cscmk5mcNNIRs+n6jDwDAH
         fJLoNpA4M3ZPKtr+BRyHRcgqRNp3Fi2CAF9hMb5SpeLyPXzTAYAKCj+5p9x69VU9Uag1
         yt/Q==
X-Gm-Message-State: AOAM5317UrQv4/sZ/UiyHREAZ1PBptFZNDJEmSNumMWlQO2Phgxy2f00
        4121KiuvxBH7SazdsUS8B911m8J0k8ZEnt3zs/LpmQ==
X-Google-Smtp-Source: ABdhPJzJSN3Q2nCHPr+PzZnQ71Bc+cOTt8uQg6u8yZOdsf4zxwJFblSLVn5oUvAQ1oeCgPIlgC/6LUu0BqWU3Rk4sjI=
X-Received: by 2002:aca:1a11:: with SMTP id a17mr639799oia.164.1632167622190;
 Mon, 20 Sep 2021 12:53:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:53:41 -0700
MIME-Version: 1.0
In-Reply-To: <1631898947-27433-5-git-send-email-pmaliset@codeaurora.org>
References: <1631898947-27433-1-git-send-email-pmaliset@codeaurora.org> <1631898947-27433-5-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:53:41 -0700
Message-ID: <CAE-0n53d9wjc7-U2M6i5MzjAqOxu8oNUcihrxJv-HJnRX0TJHQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-09-17 10:15:47)
> On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
> must be the TCXO while gdsc is enabled. After PHY init successful
> clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---

One nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> @@ -1488,7 +1553,9 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>
>         pcie->pci = pci;
>
> -       pcie->ops = of_device_get_match_data(dev);
> +       pcie_cfg = of_device_get_match_data(dev);
> +       pcie->ops = pcie_cfg->ops;

Maybe worth failing probe with if (!pcie->ops) just to be a little
nicer here.

> +       pcie->pipe_clk_need_muxing = pcie_cfg->pipe_clk_need_muxing;
>
>         pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>         if (IS_ERR(pcie->reset)) {
