Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C683D19F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhGUWKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 18:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhGUWKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 18:10:08 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9555BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:50:43 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 42-20020a9d012d0000b02904b98d90c82cso3590460otu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=5xM5LC3DBMWzVTMMqFAn/LJTjsxukGbXpBFfvyuIhlU=;
        b=dDf0YyKO/nEbuOsDRdxBOgatG10uRUjazTXhhknIx+mEF54w5XR/oqiAGZY9QXe6Kc
         7pbPMihun6D3VLm+R6e1yBYymeNrfZaZJlIY7AshNgyIqht1A+4ZDKFI/vDLdTxF14rW
         Y2zWkYvnXzfmMi67JpO7ziqtZT7qz1Aq0qTx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=5xM5LC3DBMWzVTMMqFAn/LJTjsxukGbXpBFfvyuIhlU=;
        b=NFD6bsxJEHkeVpPzE5NHVuIRw3qSuql+tbROZBgNCpFzsBTcMDIgJGnj/cyvloEx5S
         nykyP2JUL3Q39lEicCyikntOZw0NrnnWFUXfWQ60mpOO8rbcRaEuXaQmPCWcIWvTJaZQ
         4N8llrXi/XmcDT2B2Gu3Rv5BZfpj+oY4uvplmdTN2mGuaE79QhZ5EDTo+SCrOZK2l51+
         rtXLponjN6/aUL8tvBOCoCRB/pmMq8Qt/3hhnSNW1oH5ct/38jay5vSIr4uT4/v1jrjQ
         wgkIMezlRWRsb+monHtfOoWiekkGjM02DL50EzOQF/1C2IiMDI7TXRmEUYNOjApDW0rq
         eH1g==
X-Gm-Message-State: AOAM531iGlFEIcmSauWSXPOUevTqyX8d5dgHS/m+CiVvoqBLEJ0l4i9o
        LoNdXh8k7mnTMAS0RqpYOTzFXVn3ggqEYSiaiav84Q==
X-Google-Smtp-Source: ABdhPJzVfIaBfEdnFWZgfS1UtIImHipxZJcc5EzVSfrdE7wsv99QD/sxbtvoCTbEdGJYQhN7Qq2zjvGW92OrsMAltzI=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr12625333otl.34.1626907842775;
 Wed, 21 Jul 2021 15:50:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:50:42 +0000
MIME-Version: 1.0
In-Reply-To: <1626800953-613-1-git-send-email-sibis@codeaurora.org>
References: <1626800953-613-1-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 22:50:42 +0000
Message-ID: <CAE-0n50jTvX1vVkv-UqNaX7O9AFj9J-qAiKkz7pKLf=wPcT9PA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, tdas@codeaurora.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 10:09:13)
> The SC7280 SoC supports a 4-Silver/3-Gold/1-Gold+ configuration and hence
> the cpu7 node should point to cpufreq domain 2 instead.
>
> Fixes: 7dbd121a2c58 ("arm64: dts: qcom: sc7280: Add cpufreq hw node")
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
