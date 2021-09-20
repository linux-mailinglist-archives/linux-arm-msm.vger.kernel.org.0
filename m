Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A107412A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbhIUBlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhIUBjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:09 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D202C125F8C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:38:30 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso25074952otr.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2nAPZIc33kiPf+D3p/HvvkkuNN6MaBwMfpKFBvifbpU=;
        b=U73VrNhTASgYc+qCjSToZWr9V+pLQFAgNy6G5Ud4R9KE9lhXRx6J9MvIM6x+GHHO3r
         Him9gfuiCGuGiWZWrz2grj9zHwZI2s8vt7XROhoVXdbk1qN3MePkdh9mkGKNu5w6iicz
         joNwr7wpNjqlGKemztb/8JAvk3YRfrPfw+uhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2nAPZIc33kiPf+D3p/HvvkkuNN6MaBwMfpKFBvifbpU=;
        b=hFNpUJwYAKsOgVzPowqyC9krcbBBAdjJXD1qA5iTGtQTfl/VzSr8Q3pd1Z7JTnPfqI
         Pl+ADUKcUnlbDg3+1Eo+yO3+kgFkCHb47vLlMj2oZrRCKWWFesH6v+wLF8q+fnCjDRia
         /gQMco9IkAZFebPc5UgfoRJYjZYUbuCNsSGknFgH1sNKh49rT7YB9xYGqzk8HjBVT7/m
         UJmk4w1VijkHwycDmioOknkgpTLa65D/9asOH42ikwm+/PudZ9ltwb7TuzyYft+iLUU+
         g9Xyh31XRSqG7eLk8o459UBLGsPr2IHobQXRu+oocpYb8EAvH+JafnqHrZvvwoTdCtPv
         M7fw==
X-Gm-Message-State: AOAM530ObEu33NIEEX30ia6lsex2yK4wvAaWs01I3CmG8HBR9qPWNR6J
        amNolBCQXL8bYrfN/Y6kcuiLs4wgBtdUd4SbSerJdeIk4o0=
X-Google-Smtp-Source: ABdhPJz199QzYRol0amHS+2uyQDKUWIPiIHADROCwjkvyqiqksLXurNnrkVEqszybt0CWHthxGCC0Gy2sETBJStWB58=
X-Received: by 2002:a05:6830:18c7:: with SMTP id v7mr22395512ote.126.1632166709805;
 Mon, 20 Sep 2021 12:38:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:38:29 -0700
MIME-Version: 1.0
In-Reply-To: <1631872087-24416-3-git-send-email-rajpat@codeaurora.org>
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org> <1631872087-24416-3-git-send-email-rajpat@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:38:29 -0700
Message-ID: <CAE-0n53cv0sSASPDCeUaAaAudiHXvg4RjO-XWoabDbc2nibNTA@mail.gmail.com>
Subject: Re: [PATCH V8 2/8] arm64: dts: sc7280: Add QSPI node
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-09-17 02:48:01)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>
> Add QSPI DT node and qspi_opp_table for SC7280 SoC.
>
> Move qspi_opp_table to / because SPI nodes assume
> any child node is a spi device and so we can't put the
> table underneath the spi controller.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
