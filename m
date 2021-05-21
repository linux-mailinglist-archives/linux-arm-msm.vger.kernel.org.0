Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC7838CF5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhEUUw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhEUUw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:52:57 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3032C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:51:31 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id d21so20843936oic.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=l3rd5AGI0TAgU4dtT99rPSZ8nP9k8iKog4797AOuSyg=;
        b=BvqrmKhXYuSofPpie5wCq1uz0GOh3zVoi+zkwMXzyCc1/ZumnWykKUQcPuUQ7k78IZ
         1mgXbD7C0AswJZfNAk6Ep/GcnyG8oSwA+ySHdMg8R57kGPfEhIFjzEW+Mrl1RV4kkkQh
         S5FesVuR9gRmM8T0fihLkf3blfyX90vsRUUIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=l3rd5AGI0TAgU4dtT99rPSZ8nP9k8iKog4797AOuSyg=;
        b=uA/MbQeVNU00LCzoA+nYYo0FiLe8BnLm+iMX8yjtqnw86nXuOMcOAfFg2IdshcsfGf
         zQEW31poQpKwQjoHFfv/gnlfLoGJ8qpfYZ3uU8QKP+iceqPvcY+OdL6MMo5EoDXdJaRk
         xSprOK+IP+G6+OYsPaBBXchmbBP6CCDyD6nILrqg5fTO4OUIARoUG5Da+jjxf0Z121n5
         HNRTjCOw1xl9Ded8ZoJrTQLZKD3iXBLMhW5fcaiBATFPCmVENbVPwE7e0OdY/9i8SF2c
         8hrk7Cl4jmJtTQ8TxTPSOvZ91ly9V0/g8wGmL8B2atnM9mTITGefSZTkTOddr4vMLKUK
         XBQQ==
X-Gm-Message-State: AOAM532hR9mlYfkcXdBbJp6+AeUa81JlJjuhpsTcjIEwIoGYN6sA6YU9
        3ntHHPCCAuJkGg2uu73mqFU1kHer+r7dBb//GmRk5Q==
X-Google-Smtp-Source: ABdhPJy8yyDStkfnRUcpaPHXw8vmuuF1l+lnjun1dIZYi3XPD6IA6ZpnNyOOiz7CIUPzpV6TIwk8LLzDT0k/qiDtLHg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3622784oiw.125.1621630290832;
 Fri, 21 May 2021 13:51:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:51:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210521160029.GA2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org> <20210521160029.GA2484@yoga>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:51:30 -0700
Message-ID: <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, vinod.koul@linaro.org, dianders@chromium.org,
        khsieh@codeaurora.org, robh+dt@kernel.org, sean@poorly.run,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-05-21 09:00:29)
> On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> [..]
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +        description: |
> > +          Contains the list of output ports from DPU device. These ports
> > +          connect to interfaces that are external to the DPU hardware,
> > +          such as DSI, DP etc. Each output port contains an endpoint that
> > +          describes how it is connected to an external interface.
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: DPU_INTF1 (DSI1)
> > +
> > +          port@2:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: DPU_INTF0 (DP)
>
> Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
> translating the two ports that are described are 0 and 1, representing
> INTF1 and INTF2, or DSI1 and DSI2, respectively.
>
> Further more, I have a need for somehow describing the pairing of 4 DP
> INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
> controllers.
>
> Downstream this seems to be handled by adding cell-index to the DP
> controllers and then matching that against the numbering in the driver's
> INTF array. But rather than adding cell-index to map this, can't we
> define that the port index is the INTF-number here?
>
>
> This would obviously break compatibility with existing DTBs, but we
> could start by doing it selectively for the new compatibles, fix up the
> existing dts files and then drop the selective application after 1 or 2
> LTS releases.

I requested that the existing DT not change a while ago when the DP
interface was being added to this binding. Is it possible to figure out
what interface it is that the port is for from the binding? It feels
like the problem is that the driver wants to look through the graph and
make connectors for each one, but it doesn't know what type of connector
to make.
