Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D72F436AB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhJUSmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhJUSm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:42:27 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC172C0613B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:40:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l5so202850lja.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
        b=G3z7ykO4X+E851ch43bnUaOUol+AD2Au4q7+vF6L6OnedzItcq6j+AyjMJZXgsAm5G
         4NgVlSpK4iGvkeRhMO9xAtHEGdamb8cY8PdA+i1c+0A5VFd2nzixjtDM1AQC22Rs+rEH
         bUBS1kF+LNZPPSXCD2ajaZyd0w2InOGOf1TuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9wIvFY66/uQWTspqneatru5hG7uYgyRnzp2YO0R4wtk=;
        b=egzY0hGPsSsPQpbNb/67QKPpmrZ+vF8GDYNrdV9h3VrBWgq6us41DvXJ7ih/aI5CEd
         ccaCBt2fX9uh+e3H+ggHPcylxAh3dntgDB7Uw76WBuqyWZfFhrJ6ZepfjKNQiGR2C6yg
         FRR1fHQlu50TUhfr9psl8N8HXfT8m7AqcXRF76mTN/jOUXq9NpR97DaFvUelHB4O9Eh2
         zWRNDTOMiDsREQ53UlRi/HD8mhj4vrdCuay3nvN3hh/VTE/8ClTusaIRLU8bqNcryaHC
         84nSNkXLMYYKf25Uag068HiFu39QF1uEHZSsp/rG6PRQEb2Ag82WHfrkEBsbXXuzzX4l
         OW7Q==
X-Gm-Message-State: AOAM533dHomPyAcZs3vJKF3ovr4uvz3XPTD01e06z23I83neXDaA4gXL
        oltYTJd6diRjb7D9EBVQoSMeJIFAd3OMUozprAiwLQ==
X-Google-Smtp-Source: ABdhPJxRC3Uf92k15ghzxzXlSSeSrHGQSqtbHF/z5u6aHclpYNvhUUJfMMIi/ktRjLpdoaeaGzmBSam4G9bujYQeCd4=
X-Received: by 2002:a2e:4e1a:: with SMTP id c26mr7489198ljb.351.1634841609244;
 Thu, 21 Oct 2021 11:40:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:40:08 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com> <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 11:40:08 -0700
Message-ID: <CAE-0n52Me9UkR2Fk=x7QKxNy8PdjB8xPNsp3h=gN1ubMEgyzDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To:     Krishna Manikandan <quic_mkrishn@quicinc.com>,
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

Quoting Krishna Manikandan (2021-10-20 06:58:51)
> Add mdss and mdp DT nodes for sc7280.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Rename display dt nodes (Stephen Boyd)
>   - Add clock names one per line for readability (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
