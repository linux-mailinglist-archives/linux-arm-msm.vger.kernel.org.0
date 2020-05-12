Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806621D0015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 23:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgELVE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 17:04:56 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35532 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELVE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 17:04:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id k110so11719629otc.2;
        Tue, 12 May 2020 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jDEABMbUCOrmyaLLdMYoJYNT1l5JID3d7JkoMsunLvI=;
        b=F7eh0jn6f2PaOomAOHWGp4X378pT4fejVDE2mJ/x4Mkb4U8oOhl/0ssXlV42mvp9xq
         /pRDbHMGCqgofGFzWAn0bHRkaQVHyKKgp5snjDaK2wWrEQTreDrd+dID0IdhR4zEYr/H
         pUFSqNpZg0Rnl+Lug8SNQmm1h22y6nTC1lFLp3GBev68RMaKQ3q0AifSNYXK4mufz4nJ
         9ZHsfk3uZe20UhS/zXhdwpQLE4Bd0bX3LZsLqyTve9tYB83jy7LrHyiphfQYvThF9XdE
         s6EbMYJoRPPwIcD4tFQO12OU6z9MmJ6KeBlwBcCAjEQgVfRJ03Bzo8ErnqQyXs6BmlAq
         ywNw==
X-Gm-Message-State: AGi0PuY70Ry5tajtUIddW73xZLWhsFsWFsYwsug8+ndX8w+Ke0ZeWBY0
        ri7dES38XXsBzuA/0c5v9g==
X-Google-Smtp-Source: APiQypKftJxqUm21+bNVWckPQB2WL9oBxBSfPqK6hJlCXeBF0AcfmKp+aWWi/4AXegtFnvIZ8YVckw==
X-Received: by 2002:a9d:6295:: with SMTP id x21mr18022599otk.291.1589317493971;
        Tue, 12 May 2020 14:04:53 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m11sm3692657otr.79.2020.05.12.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:04:53 -0700 (PDT)
Received: (nullmailer pid 26353 invoked by uid 1000);
        Tue, 12 May 2020 21:04:52 -0000
Date:   Tue, 12 May 2020 16:04:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: rpmcc: Document MSM8936
 compatible
Message-ID: <20200512210452.GA26278@bogus>
References: <20200501223232.275800-1-konradybcio@gmail.com>
 <20200501223232.275800-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501223232.275800-3-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat,  2 May 2020 00:32:30 +0200, Konrad Dybcio wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
