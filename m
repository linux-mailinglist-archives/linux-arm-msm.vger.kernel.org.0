Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7721E1F9EED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 19:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgFOR7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 13:59:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42585 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgFOR7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 13:59:30 -0400
Received: by mail-io1-f67.google.com with SMTP id x189so9817143iof.9;
        Mon, 15 Jun 2020 10:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BHgT2mx8xkJ6dyh2wGvrPbLyiW7OY04S9iTFYV1Zgpg=;
        b=rw23SjXGskCZ3jzGz9JQt9PiV/TagMMnIzG29tJPnjvWpFqEPrB/+gbmRNZCrUiA8H
         aedApV2zvWHKFwJSPjJZ9skm6FIsTLA9WFYEFPBWI6jkKr734j6QH4QbM0QMGKMKj9vc
         QvkQkMJyXlpBSHG5wl27QO3pXAfPlVe8neMHk4WQHctnjKnpLniy1/70Aqn9+jCwFRYq
         J5SzJHD7lAN/fa8zhXTHYASCHydFtU3cZa2DSNfpPWOSCRL7p2FtrqjVo94tpyyWgO7U
         SFtgjXudNhsxez1gRFx+FmGHtl4jjoJVcCm7TSGrXsg6AB1vaNKnF62LV+p0QQZNOy0n
         YMYw==
X-Gm-Message-State: AOAM531+dQvZqIbs7YnBb6/mY88nNgxm1FbhG47KTVAsWZcp/9QzfSzS
        MHw4Cmve7vSTSPuxXvxwG3wCstQ=
X-Google-Smtp-Source: ABdhPJzcQSDpOkBhHJENl2D/pzMbYPzaQ2yaqC/lvyTGhRDc0VY48ge4XqLEln/oOi42VvZqeG5+Ng==
X-Received: by 2002:a02:ccb3:: with SMTP id t19mr23072149jap.20.1592243969677;
        Mon, 15 Jun 2020 10:59:29 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g15sm8288584ilr.5.2020.06.15.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:59:29 -0700 (PDT)
Received: (nullmailer pid 2045960 invoked by uid 1000);
        Mon, 15 Jun 2020 17:59:28 -0000
Date:   Mon, 15 Jun 2020 11:59:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        agross@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V7 1/4] dt-bindings: clock: add ipq6018 a53 pll compatible
Message-ID: <20200615175928.GA2045909@bogus>
References: <1591440907-20021-1-git-send-email-sivaprak@codeaurora.org>
 <1591440907-20021-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591440907-20021-2-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 06 Jun 2020 16:25:04 +0530, Sivaprakash Murugesan wrote:
> cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
> pll found on ipq6018 devices.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V7]
>  * Addressed minor review comment from Rob
>  .../devicetree/bindings/clock/qcom,a53pll.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
