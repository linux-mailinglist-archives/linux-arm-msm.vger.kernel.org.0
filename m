Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAF821AB55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 01:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGIXQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 19:16:51 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36015 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgGIXQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 19:16:51 -0400
Received: by mail-il1-f196.google.com with SMTP id x9so3525071ila.3;
        Thu, 09 Jul 2020 16:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GqrWMqcMLkjc0KM9yvozsbM+l0uAOHSNMzerLBO/Up0=;
        b=krgwgkqOkSSUs9OOc9eyYecMXFISqym085F3fDdranC476UyMxV+NiKVrJXobDP/0W
         eSOxkzBnBXNJq8vwi5yd/ZCsJqpZsGGlADUhBOYsGhtdx3aGjM6lpuV/YHq2pyQlVk4g
         4ljmJgG7CZJqpTJMykSTJSYCjtX0UYA3+NTW+qVQ6JL+VcyXPzuNXJTznXwZ+ZF+ywKj
         h5WosDSzRoXnKIt1bZkdZo8o9q8d1yK5UjZXZF68pyr8ff0Hpna1poay0bpupCDWgE3B
         vOGBJCLRQdRNWumcmSf6LST1lUcJzWQM85OvHiH5zTTQtRcmYwHjgX8rQdhHB/wBwfmI
         oKJg==
X-Gm-Message-State: AOAM530THvqMMWP0LUvr4Spg0Ljfs63LH6UYSdp07DT/fV8K5R6sbcPe
        jj8NEQl9qdKzis/mm6WblA==
X-Google-Smtp-Source: ABdhPJx9TWOvHo+GfifELcn/0P7+F6jrXwuaemCAN1FJkccgyExOOVXKCt5f4o0w6ho03qUqhDjkLQ==
X-Received: by 2002:a92:c8c5:: with SMTP id c5mr49493704ilq.47.1594336610028;
        Thu, 09 Jul 2020 16:16:50 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id o16sm2490350ilt.59.2020.07.09.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:16:49 -0700 (PDT)
Received: (nullmailer pid 1079077 invoked by uid 1000);
        Thu, 09 Jul 2020 23:16:47 -0000
Date:   Thu, 9 Jul 2020 17:16:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     mkurumel@codeaurora.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        mturney@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>, sparate@codeaurora.org,
        dhavalp@codeaurora.org, rnayak@codeaurora.org
Subject: Re: [PATCH v4 2/4] dt-bindings: nvmem: Add properties needed for
 blowing fuses
Message-ID: <20200709231647.GA1079025@bogus>
References: <20200622144929.230498-1-dianders@chromium.org>
 <20200622074845.v4.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622074845.v4.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 07:49:27 -0700, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> On some systems it's possible to actually blow the fuses in the qfprom
> from the kernel.  Add properties to support that.
> 
> NOTE: Whether this is possible depends on the BIOS settings and
> whether the kernel has permissions here, so not all boards will be
> able to blow fuses in the kernel.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Clock name is "core", not "sec".
> - Example under "soc" to get #address-cells and #size-cells.
> 
> Changes in v3:
> - Add an extra reg range (at 0x6000 offset for SoCs checked)
> - Define two options for reg: 1 item or 4 items.
> - No reg-names.
> - Add "clocks" and "clock-names" to list of properties.
> - Clock is now "sec", not "secclk".
> - Add "vcc-supply" to list of properties.
> - Fixed up example.
> 
>  .../bindings/nvmem/qcom,qfprom.yaml           | 50 ++++++++++++++++++-
>  1 file changed, 48 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
