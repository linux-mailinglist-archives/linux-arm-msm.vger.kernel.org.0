Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D16221534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 21:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgGOTgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 15:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgGOTgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 15:36:44 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AE9C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:36:44 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id t198so3133673oie.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rR8gIS4VQXCjAcXSb96e3TYhEFgbcxFTF7+lqvB96Mc=;
        b=XY4/njUigM9ia2/yktoamaYQAG98PZrAmqAG1v7JZXdzlb1/ESpHjDqq0eKQPM+lk8
         G0WIhU2Kel+ShVX/qcF9VFrPlG9QsMhi3qrUJwtnoCYmIXofkDF2fvkINZFZSuQe7dt1
         P9ZxduaVAGjWE9wZymXly/Z3FU2PN+wsDBdDT4lunmBJ+k3Nx2OpHNUQOndrWWrLouwG
         vwpV9CrKs02HDW+u/UyVnAsaluvznfqwagXAOO5hsvufcOCSzZjnBLEVaHiJVRdmoDRi
         X2xfLU1jJaTHx72bTzKBzoPAllsLUCBpwwpAUTstgE+urPI5/dylyUNXZvmtF3zL5Co4
         AIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rR8gIS4VQXCjAcXSb96e3TYhEFgbcxFTF7+lqvB96Mc=;
        b=QWvmk4uE6XSpjYZ0pLHJhnC69/9u/T3a06M4fz9jkh6yLP0KhER41s8ad6w+hscQr9
         gpTddP8udfk885k/B9BAsSOrzj4paP7PhLRQeXAoQr/1MVumDUsT/H/YxdPkfSPTIOvZ
         c0QnDKzV6A+8Sr6aKPixZcsvOgC5M0wl4jyL9cslBrIQUQ3g0FuzcEUXo5IGB/36S/wA
         QIYsDm99xklCLW1mY7+XNkP8y5T8v5CSexN4OSjPBrNpnCHGntV282yDKKiMlKcowcZc
         BCGRCJl7C1SuOzk3CBVaA9r6mc3VSd14S1TxO8G304O0ngOjCBrPh18S0dMyEfGR8nlF
         Bc8A==
X-Gm-Message-State: AOAM530b1kM07IzmHFJtpj2anHq0BfaxZDK2jnGRbaO9XE+RA+/Y6B8j
        3Hiw0q05/DHi+hqITs4nJdWkuuX1/WOLLzL/HRsMz+NQtdo=
X-Google-Smtp-Source: ABdhPJxiRGfd0eoaoROgXUN9uWZUGskblIlhMLdmnnt1Ctbn9jndJMJXv2b3Wfretv7Kef+W1jIxo86dAC31T7EKRgs=
X-Received: by 2002:a05:6808:8c4:: with SMTP id k4mr1126990oij.177.1594841803655;
 Wed, 15 Jul 2020 12:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075956.171058-1-bjorn.andersson@linaro.org> <20200622075956.171058-5-bjorn.andersson@linaro.org>
In-Reply-To: <20200622075956.171058-5-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Jul 2020 22:36:31 +0300
Message-ID: <CAA8EJpqEXcb2DvA+pr=6PmoG1fVQ5kcH0k0VY_jC_Diu_SK=jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 at 11:00, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Now that we don't need the intermediate syscon to represent the TCSR
> mutexes, update the dts to describe the TCSR mutex directly under /soc.
>
> The change also fixes the sort order of the nodes.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
