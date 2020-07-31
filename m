Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66E4234A8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733194AbgGaRxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 13:53:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730069AbgGaRxr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 13:53:47 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C28D722B43;
        Fri, 31 Jul 2020 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596218026;
        bh=YYLcZCHdY4A4VUdOJs2UDmzQcnxwkeaqns0wcevhtAM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C4KlEpSgXN7Aaj5tK5AZK6HQgoKDrS1Y5tm93AImK925+eQz4jLa8x1freHiv91iy
         trNbZb0ODUR0u3Ys2IIHU5SsTJ3li9svr87VFNlz00CqttOXC5wo9p1agzLKrJEoY1
         gDZgK56jQ26VX0e0sURXYKuezY90OPwUEQzOcufQ=
Received: by mail-oi1-f170.google.com with SMTP id v13so10804587oiv.13;
        Fri, 31 Jul 2020 10:53:46 -0700 (PDT)
X-Gm-Message-State: AOAM53074Ku4jzcI6M1QdgwTzYz5S7CbVqNLo98xGNWs6fSIsXUZ+BeN
        APndfD/Ihl0CM6cib7nDULt0py3AQ0Y1wux/Ug==
X-Google-Smtp-Source: ABdhPJyak9HSVsNL8SbsIPvigrG7TnsIRtLgH+VAaGhZvk5l27JI1wNfmLdXy63nRSFcEJbEIC19SD99QW9FiZu87tw=
X-Received: by 2002:aca:190c:: with SMTP id l12mr3893214oii.147.1596218026159;
 Fri, 31 Jul 2020 10:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200729004757.1901107-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200729004757.1901107-1-bjorn.andersson@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 31 Jul 2020 11:53:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKQmLNwQDVJDOQdVZ9iYb4DXDCnfzsBE9q32jaRcefCg@mail.gmail.com>
Message-ID: <CAL_JsqKKQmLNwQDVJDOQdVZ9iYb4DXDCnfzsBE9q32jaRcefCg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwlock: qcom: Remove invalid binding
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 28, 2020 at 6:48 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Qualcomm hwlock is described in DeviceTree either directly on the
> mmio bus or split between a syscon and a mutex node, but as noted in
> [1] the latter is not valid DT, so remove any traces of this from the
> binding.
>
> [1] https://lore.kernel.org/r/CAL_JsqLa9GBtbgN6aL7AQ=A6V-YRtPgYqh6XgM2kpx532+r4Gg@mail.gmail.com/
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/hwlock/qcom-hwspinlock.yaml      | 25 +------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
