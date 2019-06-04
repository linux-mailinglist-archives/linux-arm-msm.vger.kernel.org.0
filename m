Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E5935470
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 01:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFDXgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 19:36:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43596 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFDXgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 19:36:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id j29so3809032lfk.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WV3sJyKzvv2hglik5laJLi6zk95U7YCGm4MZG0UbbBM=;
        b=doTgsxvdZv8uU0x8XW1L0hFFxk7NVRCh4EcK48wmJsmGLsH6XMlLAb/m9hX5yAKfq/
         mpAOXL47upaREgDMBi3qMSM8JV9L1dBVgYXWkO08XRJIh04mvW8/RphRVPAe4EgWjIYG
         dOxwWXAQNwFnvP+7LdEIctpkg0tJPmm6BMtrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WV3sJyKzvv2hglik5laJLi6zk95U7YCGm4MZG0UbbBM=;
        b=Gwc2pyQx9EtZc7QN8KTQCXjsRFXVXqrtuGcDDAet9oz28bppyFnc6RrEzj0kSX+WT8
         /AMPsR9i1nWddnTSl6UYILJJIc9ftgSptUPlHEqxY4Xs+jdf5HYeScoKXHmMlGyJd+oc
         PAKYXVigfQOTfREBvZBxaOQh1MqzDy9Cdj3HBtTf9ZoPelYM8/riycNgUFq3nxP7drQY
         zx7d/s9lwTGmG6+KREyWmpO0Mk4hpABv+Qz2r5a5CUlkP9AccpdwBuv/0IjlzsSnzMpg
         1SUtbKIHkQs7sJOX6WWOooQerKqaSHV1Bs/ogRGt/TrUNoeupQHUMz3qlHKoe4D4CWUp
         wlWQ==
X-Gm-Message-State: APjAAAUvXdZxRRwVGQxSIc7mQkOAtabM/HK9KGX1jQBshl4rKFU0p1FD
        zixBwW/f0f0buvFZ1S+mCd0WKSHOv4w=
X-Google-Smtp-Source: APXvYqyFL8zWfE3T78NXc/UgjRYeoUT9ldVJ4BI8sqfo0UunXKnhbll2fv7ldPE3hu/DhnPvJsnZ5A==
X-Received: by 2002:ac2:5ec6:: with SMTP id d6mr19437182lfq.131.1559691359985;
        Tue, 04 Jun 2019 16:35:59 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id x19sm1975970ljb.6.2019.06.04.16.35.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 16:35:59 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id m23so3111075lje.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 16:35:59 -0700 (PDT)
X-Received: by 2002:a2e:5d9c:: with SMTP id v28mr18287829lje.32.1559691358483;
 Tue, 04 Jun 2019 16:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190604232443.3417-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190604232443.3417-1-bjorn.andersson@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Jun 2019 16:35:21 -0700
X-Gmail-Original-Message-ID: <CAE=gft7nZNLykioozOJUDitXWc8PgFjDmCucmoz-3wtxzg_4CA@mail.gmail.com>
Message-ID: <CAE=gft7nZNLykioozOJUDitXWc8PgFjDmCucmoz-3wtxzg_4CA@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qmp: Correct READY_STATUS poll break condition
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 4, 2019 at 4:24 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> After issuing a PHY_START request to the QMP, the hardware documentation
> states that the software should wait for the PCS_READY_STATUS to become
> 1.
>
> With the introduction of c9b589791fc1 ("phy: qcom: Utilize UFS reset
> controller") an additional 1ms delay was introduced between the start
> request and the check of the status bit. This greatly increases the
> chances for the hardware to actually becoming ready before the status
> bit is read.
>
> The result can be seen in that UFS PHY enabling is now reported as a
> failure in 10% of the boots on SDM845, which is a clear regression from
> the previous rare/occasional failure.
>
> This patch fixes the "break condition" of the poll to check for the
> correct state of the status bit.
>
> Unfortunately PCIe on 8996 and 8998 does not specify the mask_pcs_ready
> register, which means that the code checks a bit that's always 0. So the
> patch also fixes these, in order to not regress these targets.
>
> Cc: stable@vger.kernel.org
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> Fixes: 73d7ec899bd8 ("phy: qcom-qmp: Add msm8998 PCIe QMP PHY support")
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Nice find.

Reviewed-by: Evan Green <evgreen@chromium.org>
