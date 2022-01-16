Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B998F48FC72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jan 2022 13:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbiAPMCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jan 2022 07:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiAPMCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jan 2022 07:02:50 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73DFC061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jan 2022 04:02:50 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id s22so19349200oie.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jan 2022 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MQugVzR0HUW1l8YQ855U1R3u4rbB4xlEWOyDYT7TwoM=;
        b=s0yHRZxkpbimGufWxMOVBXxk5R6yRG83z9/XZ9iOTsE+YGZA1cWYi0Zi8fRs2kNaN0
         eIVgSWV8wxFPOSX1u5DZCLWjSJyhP4NPoY0s9tQfCMq+D3JErlR6sez3A8q8Idu/Zbob
         pLbqeWLXwGP419yPkutzyTfQf6IauG1pPSExJPOoFOkAhlo6g8wB8BnWbiG9nu/o/H5Q
         DICRotGEhLY18p8HIWkHifxmVMSOWm9CIMLIVQDzQpwMsV1UCzusUQVI8jiyzOZlWmpy
         DoMxEqLo1X3LqktlT2cmTUjQEE3a2bB3/Ea1AGr3lCMuusNLXyaNExyDhBQ9mRl/b+CL
         mD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQugVzR0HUW1l8YQ855U1R3u4rbB4xlEWOyDYT7TwoM=;
        b=R+BKp8Eba51DmkfGRykRcEMRdRSIkZ7qh3yQNV3KTKa8aZ91L61tJQOgIRh6QKae25
         kkSowKVG9VUEzKgsBRo72dd89T7Qc7SNOKr5dX2q8oh4I3YoI96wpqZmXSjbq/xHrHnw
         jkxZy+pAM1eefE67Jqpfqm+dQfogXW56KxzK31x8clc2ck99Q4xBErDvnhX8AtS+b0gx
         1wmiaFXy9b+RLdEt+voM+BDlolpHhchi59RAjoSHChnfP0zVev7PeIzdWGh70gMh6ZQb
         a7E71gl9Tk9lH+h3qZ5OvIF58G1cbJtRT9QKXnkAPEpeGEc1zwpLDnlsNtuQcMG7guOi
         TElA==
X-Gm-Message-State: AOAM532zH2jtH8VgZDTU+eWZI2bfj+88UeduZSF6whrZW5jL2xGvYWAF
        zPfTmEnSsd3xbtOUc1IWKHtzB7c5IQoRVrTw1S7ck8v9EDE=
X-Google-Smtp-Source: ABdhPJz5Vivaiqv+f1v9kMNzZy+LxZx0FYcqZ8u6a+PsYoKEcQKvQ5CcKRTey5EKw7ysWPJCtK7HWm3FeghHnLp48DM=
X-Received: by 2002:a54:4613:: with SMTP id p19mr13356731oip.162.1642334569955;
 Sun, 16 Jan 2022 04:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20220113162617.131697-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220113162617.131697-1-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 13:02:38 +0100
Message-ID: <CACRpkdYraGHxYPW5JL49RMg3Wo8wQgRP8d29VYGqHg4Oc=7Lbg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Return -EINVAL for setting affinity if no
 IRQ parent
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 13, 2022 at 5:26 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> The MSM GPIO IRQ controller relies on the parent IRQ controller to set the
> CPU affinity for the IRQ. And this is only valid if there is any wakeup
> parent available and defined in DT.
>
> For the case of no parent IRQ controller defined in DT,
> msm_gpio_irq_set_affinity() and msm_gpio_irq_set_vcpu_affinity() should
> return -EINVAL instead of 0 as the affinity can't be set.
>
> Otherwise, below warning will be printed by genirq:
>
> genirq: irq_chip msmgpio did not update eff. affinity mask of irq 70
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied for v5.18!

Yours,
Linus Walleij
