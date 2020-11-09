Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8482AC60E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgKIUlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:41:15 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36672 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729599AbgKIUlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:41:14 -0500
Received: by mail-ot1-f67.google.com with SMTP id 32so10322190otm.3;
        Mon, 09 Nov 2020 12:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y6HZO7jP6c7BF7SUht1RlV0MFshBv51INskr3Wu1OLo=;
        b=ajRwGOCmP5+vUYqPEnrF/vUlivg+l9Bu9q00OjRUJLKJtVcsjqpQq6UzsCh5DVXfwD
         Fsx+ixLjOTNDbVujq7pSjPrSnT3YLQVyhBkGRTG0vXaYgZOYKHNAduAfolttqZjFPfgJ
         zafIiD0mtaFdT7GiQTVyBmK9pV8jntL6mcpseiwV4HiXoWHl7Vf49VeVvBXGZndPuUDh
         Q4YWvKkB3WX72DgqenKvbl2kTG++huteW2aC1rsHU0VydJ5D5SoCZHNeA2Ecu+1ar0M8
         yJ8rdODW2/jbR3t8tsa6T6SJDs/HTOXwkQWpvdTZ8HkNx739qgpbyFZSnxsIQ99gPa5u
         9hxA==
X-Gm-Message-State: AOAM5311KxMj5UfsafLBrPnJ8GkuHInZ+r0tpBdkbS75TVisUsltN/or
        AmtccoefcNmDu9ee65Wb9A==
X-Google-Smtp-Source: ABdhPJz2+VjudVKMD58sQr7OAQeP43oiVi9jf++q43tMEXvFXPHXzsh1M+C1qAmkP1SrUDfMRz231A==
X-Received: by 2002:a05:6830:22ef:: with SMTP id t15mr10861443otc.146.1604954473902;
        Mon, 09 Nov 2020 12:41:13 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o29sm2792939ote.7.2020.11.09.12.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:41:13 -0800 (PST)
Received: (nullmailer pid 1724608 invoked by uid 1000);
        Mon, 09 Nov 2020 20:41:11 -0000
Date:   Mon, 9 Nov 2020 14:41:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Andy Gross <agross@kernel.org>, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
        dianders@chromium.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 1/2] ASoC: google: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <20201109204111.GA1724579@bogus>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 06 Nov 2020 14:14:32 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml  | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
