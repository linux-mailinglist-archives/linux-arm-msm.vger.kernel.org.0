Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BE8402F53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 22:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346151AbhIGUCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 16:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346121AbhIGUCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 16:02:33 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15671C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 13:01:27 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id i3-20020a056830210300b0051af5666070so584156otc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9Zw+ENmJBvtIj3INdZqSWHDc9XknMQ4poMiOqfGky9k=;
        b=N6kpr1y3WSumLzx9C+Q1Xl9F7ehngVdHOqu4nbZN30ggzXpYYeILncVCU3G0Le1aBF
         mtuP33EFdSOC7tJe6uW/VL2w9XgEcFrEfhB9j0J1AinEe1/LG2agZh2xqxDO7faseCft
         ppH5DeKIdxLZ7oM6qaxA4MOGLInnyiLWDqLGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9Zw+ENmJBvtIj3INdZqSWHDc9XknMQ4poMiOqfGky9k=;
        b=FV0NSxxNNhhssZrmF5qbpezOmNw2c4CjCiBxU8b/meHh+CXLAqBEh4WGndPxgnWOnd
         Nz4vhZt8MQkwWRHlhUZnGcBdIg9i8EdxE9GfjvldP2HKONFczrYEvsg6OvaQst5kBYLN
         FBY2LQnm7DM1Ibv40coBx1AvlFKBW0EWu9jNYyBBgIRH8uRZgA6gQwSBnhbRLyUOI7L8
         9gw1wFwQbuAJcyq+LZ38N/yP2zwy07RnFj5u8M7H72+p+bnVstnYBf1iPWvWl9ycvDEy
         61wDMSwC89WYlhdfuL4/cQBi3ALnq/SbLZheWOri9/vQzA9pyXWto9S6pwRMduW3eY0T
         Vcjg==
X-Gm-Message-State: AOAM532CGfrI8F91qog1318aciL5CEHMUS3f5qcUwdFw2NyrIlEAMRCm
        rFEYpoEJ34oukeXg1xqpj42H8VDUiHMiB4dlSezwcA==
X-Google-Smtp-Source: ABdhPJw6kZGLqVVN2awlrCBOX28FZkbtM+22KzHFlQj9SR7EoCtFKrTWdARqtlf13fI6bZedxgJFZTkj9lPeBVK2G7g=
X-Received: by 2002:a05:6830:18c7:: with SMTP id v7mr128559ote.126.1631044886290;
 Tue, 07 Sep 2021 13:01:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 20:01:25 +0000
MIME-Version: 1.0
In-Reply-To: <1630918485-15052-6-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org> <1630918485-15052-6-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 20:01:25 +0000
Message-ID: <CAE-0n53LwrC=fL2_p-KQXpCP_1+rwteQbb9m0ejFHYz7G8Dvbw@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-09-06 01:54:40)
> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> It requires access to an additional set of qaccept registers, external
> power/clk control registers and halt vq6 register to put the modem back
> into reset.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
