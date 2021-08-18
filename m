Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F57F3F0C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 22:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhHRUIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 16:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhHRUIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 16:08:13 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6587C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so5541175otv.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
        b=FiSrUv34t+HgydbQhzRo7RHOAQFm9OxrQI98LwsaMAeyJz41igKBAGF/7khk9DESSF
         2uo0zyzxy+hlRiFcu5axiGiY/bPo8RUcNImSiN3Kyq+BuI8hGe5+GFGRUA4J2mgdicgA
         OE3Al9FgiJ2bfV2UIx6fosxcF57TPy/3vdZ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
        b=Doxedt2EqU+6enkXbGxDD1iKtjdoWl8/3q6PiQ7yFcHaDzYmNZNSFlix+OzyZC5a+N
         3ImZuREZiuFXIDAqalvvhssMXbUZmJz0vGUy1RYH4BI4ldcnenh5J8sYscR/CyzTPIii
         s2srHeCTm1ggzhX1j1P0aJ0f4oaNChZBEAlK/CevmYE6JXAGAeEsgzhPY1T7vCQsLDcV
         IO1ryUB36n95FudW2RIbDzwOpa2ShaEh+iTqVaSdwdG5pPhTLEHLWznAk/RTd0Vo34Db
         PDEdxa7afIj12rm0gCf+n+kWfG6xDIlPF4NPu4/phh3eno2dIA5Ysd0chDHMPyMi8lWu
         qI7g==
X-Gm-Message-State: AOAM531g9o6FevvNrgflgOtd8iNR3HJBf6ZdTD8LgtM1mNokZBOhRLMD
        ZvRK+NvhF9Bm2A5C6KWahsoLOOpdEroTbXk+lG/3JA==
X-Google-Smtp-Source: ABdhPJyELNhhchyiGz4aTzehMCOLQwh2D+h4c08VfwqU9GfrDc66h204pRTnxTXnauLt5QAn0FSePec2ZgVpt81vPKo=
X-Received: by 2002:a05:6830:2473:: with SMTP id x51mr1798273otr.34.1629317258305;
 Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 13:07:37 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 18 Aug 2021 13:07:37 -0700
Message-ID: <CAE-0n52r-+MjLO0o3JOWCsLHHWVOYNKnSuZYTwiarpJW-M643g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: msm: add DT bindings for sc7280
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-08-18 03:27:01)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---

Please send a cover-letter next time.

Do you have the display port dts bits and driver code ready too? Can it
be part of this patch series?
