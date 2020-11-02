Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761EC2A2E5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 16:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgKBPcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 10:32:47 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36171 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgKBPcr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 10:32:47 -0500
Received: by mail-oi1-f196.google.com with SMTP id d9so9048180oib.3;
        Mon, 02 Nov 2020 07:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZIIR6Y93kJtDVN6OdQxyGkcBJEBLbqKHPY5lopcjGcM=;
        b=rX5++5boP73N1SgdWdrXJahDyCynmLajF5A9AtoR7w4uzW1nE0m4/l4Tee51b79XTa
         RS2DeyZBGHddOcxDNmZBZyp7YXqdaet6M9BNcZTALAvvqJdvEeTYakLpWXeX7PsZRYO7
         QLkvwFiNNrKT9coHyOjZhxGVLLJWmDZN0sjp3GuL96H5B4SsrZsFgK8jDUewWrFMle+y
         zymnTlTQaBRJJ7/lFbiNbtqXNR4VCjUiPd/k1ASR1j1PqyoUi/5Iu38Y1Y2qpHShX/DM
         q++tuRXRMFpDsKa0kmu9aju1KEl24//lNCSDxCt36jqXuxjvjrYZfk4Y8nJCicnlVyiZ
         NPRw==
X-Gm-Message-State: AOAM531865tKqrs4R5CW6GRJSbZIz/vc+sjQ+6N+oIBrDUX6bpf67v7J
        CUwlhrJfe5Pp00YzDeX60g==
X-Google-Smtp-Source: ABdhPJxVmphuk8mJdLlRvmuSLnh7cCLFj0cJ3+mKBBPbdUSY81JXWlUDkb/A41ExxACV+GqRPkRrwQ==
X-Received: by 2002:aca:b854:: with SMTP id i81mr10737409oif.6.1604331165909;
        Mon, 02 Nov 2020 07:32:45 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u22sm3414989oor.13.2020.11.02.07.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 07:32:45 -0800 (PST)
Received: (nullmailer pid 3929592 invoked by uid 1000);
        Mon, 02 Nov 2020 15:32:44 -0000
Date:   Mon, 2 Nov 2020 09:32:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: Add soc qfprom compatible
 strings
Message-ID: <20201102153244.GA3929537@bogus>
References: <20201029002827.1729915-1-evgreen@chromium.org>
 <20201028172737.v3.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028172737.v3.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Oct 2020 17:28:24 -0700, Evan Green wrote:
> Add SoC-specific compatible strings so that data can be attached
> to it in the driver.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
> Changes in v3:
>  - Fixed example (Doug and rob-bot)
> 
> Changes in v2:
>  - Add other soc compatible strings (Doug)
>  - Fix compatible string definition (Doug)
> 
>  .../devicetree/bindings/nvmem/qcom,qfprom.yaml  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
