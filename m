Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212D63E085F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 20:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239697AbhHDS4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 14:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239656AbhHDS4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 14:56:42 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C47C06179A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 11:56:28 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id a5-20020a05683012c5b029036edcf8f9a6so2581942otq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VcqvjU1bhq3QLbhM94VyWBNxMowkTRxB2SS37S2YMHU=;
        b=eow6uihoHcyolO28gBNzCMo+OcLJeolWeLIfML7V5HBkrGBB2+RPREORTfmPViraQc
         Utis+pBR22PU8tP3USQ7Vn4auPnVqU04uhgMtRgeHLloRRdcMsaJTc0wdBSyOIf7hiW0
         jA6mZMzCH/w9Oczg1HXmHbHAvA4Dl7a6lj8Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VcqvjU1bhq3QLbhM94VyWBNxMowkTRxB2SS37S2YMHU=;
        b=knYsiP0FnKKp6zz1X9/aydwLGDu/+JR2/2M+1Wj7FafhnNsDNq5+S2P+OuCQNIk+U2
         qusuSll34UgEdYJU5M4A6+e9kX3YWi+EZvRu02mMocuhbhI/dD+O1OEqOKEFGh+Uk/Ah
         +Yhvk295nbjaQN8yWw8ei0GxUZau/ULaa4zaW4k1VLfEvW/4vMJcOT8BS0q6KWuMoAb6
         oYv04VwZOBer3vPgs1LnrELoxGpJh7w2B3g1quYoDk08NWNMRf6GyNyNkMbMIOAYtUni
         jj8la3oGOfmqUGpH7NM3Nls7bua3K9gYZfnTufGYItMyYfl0curCY+EuElO1IzqypCmz
         yWfg==
X-Gm-Message-State: AOAM5337XY7yirGepI8AK7kGPBC2SP0up/rshTl/Bh8yM2sxhVCHyiw6
        dI1D3pfX7FQfFuTRxwdnX6qW7fdTmUorzA08IzX/LQ==
X-Google-Smtp-Source: ABdhPJzr7nO7f94SsRcOCzg0xCQZV6WBYtk8lxSr4M4jRgk8usQPXYX9eUO1QierzYm6lnMFOVeugytO9vsj9NDOexc=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr850033otq.233.1628103387954;
 Wed, 04 Aug 2021 11:56:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 11:56:27 -0700
MIME-Version: 1.0
In-Reply-To: <1627581885-32165-2-git-send-email-sibis@codeaurora.org>
References: <1627581885-32165-1-git-send-email-sibis@codeaurora.org> <1627581885-32165-2-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 4 Aug 2021 11:56:27 -0700
Message-ID: <CAE-0n53YRQamHMcb1T0oRkSO0_Shhskzpr4oX60UpiEB8ZY63A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: cpufreq: cpufreq-qcom-hw: Add compatible
 for SM8250/8350
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, tdas@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-29 11:04:42)
> Re-arranging the register regions to support per core L3 DCVS would lead
> to bindings breakage when using an older dt with a newer kernel. So,
> document the EPSS compatible for SM8250/SM8350 SoCs and use them in the
> CPUFreq-hw driver to prevent such breakages.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
