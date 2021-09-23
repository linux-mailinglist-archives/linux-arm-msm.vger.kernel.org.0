Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C987F416771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243301AbhIWV10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243233AbhIWV1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:27:25 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161D2C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:25:53 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so10482375otx.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Restf9zT8cAaYgA0J31xbfdLMRV0x0h1nlmAtnjCHSU=;
        b=aONsfuO90FUY1hmYf3Ayk6yFCw+fzLOIJfC1MOl152Ufg2DI1SyDtYQ6vQIBFVwsUF
         68jIOowSHXMJk04LY+uDdKrcv+AyToyBRtvmiZosmcr+nE5KuzhhAnbGV2OXySgTOvO0
         WrJx8+PttIlgzlTShRGfJ9IonEOI9TMCLssBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Restf9zT8cAaYgA0J31xbfdLMRV0x0h1nlmAtnjCHSU=;
        b=aquW8Wm4HwoLL3kVqQW/I5ZoQw3ky+E5b1Eu6+W+onkpWOBaKkOlYt05sHdPS/ppHb
         +UM/UBZcSbXzCC2EoXdGmltSQPm9lnbDCCO3ks1kyF19oD+Ea0hIgCYsZ4YWESR4sqf/
         23k9UG1NtMC8aYFVLfPjmXdZOqCEMp18jSezNP1tgJCHCdcyo9xXzEB3mVQqBIOvEm9A
         VFlUpDPau4bQMaYyFmJvZsQiY/0tubhmyh1ES0XEbwqbGIlhyWGfgR9nSzuhf7Qbn3uB
         3IV0/ulDq1tUlmsnYbxL+jHmo1G4wOG4nHaR7cewO6cSusKP3Lrb0JRfkMsHebndOVZR
         7c0A==
X-Gm-Message-State: AOAM533r2ROQ5s2jSii6p36Qak/ze90wRDbp0lCB8+ERwKp3xTxp4V0V
        N8WNPJDQuOc75g/Q7pLZDb35xLWunJwf5tH0/4mRhg==
X-Google-Smtp-Source: ABdhPJxysXYeinQ9CMF70tkcQiTjG55VvRHubq670S5FtDoyjDEGxZN054WTAk46nAOJ4o0qnVXwtvVXqq24hr/gqFU=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr726841ote.159.1632432352480;
 Thu, 23 Sep 2021 14:25:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Sep 2021 14:25:51 -0700
MIME-Version: 1.0
In-Reply-To: <1632399378-12229-5-git-send-email-rajpat@codeaurora.org>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org> <1632399378-12229-5-git-send-email-rajpat@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 23 Sep 2021 14:25:51 -0700
Message-ID: <CAE-0n50+yU263qVzAVKApCB2EfX=85nrYVkMoLnr4gFvo71Hjw@mail.gmail.com>
Subject: Re: [PATCH V10 4/8] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
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

Quoting Rajesh Patil (2021-09-23 05:16:14)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>
> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
