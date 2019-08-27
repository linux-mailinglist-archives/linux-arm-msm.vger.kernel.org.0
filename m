Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA029F2A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 20:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbfH0SvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 14:51:01 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46005 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728972AbfH0SvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 14:51:01 -0400
Received: by mail-ot1-f68.google.com with SMTP id m24so143876otp.12;
        Tue, 27 Aug 2019 11:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oPoTdeqM0P75hcFYgSTuxBhxtUvuWZSubw/9Hs6o4sM=;
        b=hfZv55F3gBCT67v8xux5lJuZ6K9c3tT9TpYQhsxclu54VeDEZZVUvsYiJQ3+V3ONCF
         JDWCngSVT7UlOAYJCZWR3z0wGoW0rEOuL1T4DZy3dSzqa9AeoZQwyJ2Rl4qs8+5lXzcL
         1mUURzzyNtBDWcKi4cRc/kExZaNRhY+hU1WNPfCRKvykIEvHC2CWLfhoJP2FvFwUhNjC
         oqC4Z7LX/Gb3mO+uVsASBFI823Z0z8FFq81W7p7q0CZN4EH/CsGijdrThaGCCOMqbbvb
         AlfuEoxxrPzCoGhj+kkgMg+81DOsHUXkQsGTXjcCMKu2WA5QGpbrZEmXYXi8FSJGiMBM
         90dg==
X-Gm-Message-State: APjAAAUIWd+rNBKk51YRXdr/ELwu0EtJfwX11lkX3lborCMhcvZS0cUM
        NcuuNvE7inS4Tlb58p/SdA==
X-Google-Smtp-Source: APXvYqz+bG5+fGhyalD276cK1+3QAQWF94WLq9FkbYF+Z7WGgBVskS5GVp+KAEL1cRVAgHYj9mupgQ==
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr50587oto.250.1566931860502;
        Tue, 27 Aug 2019 11:51:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d27sm59836otf.25.2019.08.27.11.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 11:51:00 -0700 (PDT)
Date:   Tue, 27 Aug 2019 13:50:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: Document the parent clocks
Message-ID: <20190827185059.GA18373@bogus>
References: <20190826173120.2971-1-vkoul@kernel.org>
 <20190826173120.2971-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826173120.2971-2-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Aug 2019 23:01:17 +0530, Vinod Koul wrote:
> With clock parent data scheme we must specify the parent clocks for the
> rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
