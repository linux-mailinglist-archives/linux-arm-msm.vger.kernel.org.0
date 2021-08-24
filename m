Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817203F62FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 18:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhHXQok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 12:44:40 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:34649 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhHXQok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 12:44:40 -0400
Received: by mail-ot1-f53.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso42671410otp.1;
        Tue, 24 Aug 2021 09:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JLSpZK5cObi0Pvz2oxVb8cWeqmhAa2jqkGYH8uir7C4=;
        b=nVlQ+HOavD0gWt1Sd/QQlqLSYPJ3pPzZ1q7ZFGT3tWNqIa0vD0PPsmIESWvFHOHgs5
         0vmSK1fYU8CQpF/D2Q/5xTgD1zHQqr3xU4wZH48D9O6uGGgAeSkgH0yKhOH0JZZ7q34d
         T/BEKk388hxTZMULCPLxL1i1fjgiZLUVWnOG5xCJFe4nmpgan6glEXF5UVrS5X0MjzL9
         QhAgapqriHMaVNbfKtC6jIguHwykaTtzG3AqvjzRwvMgeUDVA9sEqnYAdQN0AFBpEmQ5
         iQv9ZtecovzitllXo478VNeHKtTCe0oRjBomjtBrpJmtXq40ivaFPaH/MLI1s5vCPXsk
         pbXA==
X-Gm-Message-State: AOAM533V6VHdvM3fN/hC9qfxiu2pojqeTVWM9pGSAyixFRpv45MglM0R
        CF9Q9s1TJajn33RGAwfXXA==
X-Google-Smtp-Source: ABdhPJyMyaer2mndL7j/YcixmYTBgCjWKE2+wwdLP9mQV2j5uvJRXnyhsNEjEqqIqMnEJ293Cnrkmg==
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr3471539oig.43.1629823435442;
        Tue, 24 Aug 2021 09:43:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a23sm2380526otp.44.2021.08.24.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:43:54 -0700 (PDT)
Received: (nullmailer pid 602014 invoked by uid 1000);
        Tue, 24 Aug 2021 16:43:53 -0000
Date:   Tue, 24 Aug 2021 11:43:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     angelogioacchino.delregno@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add RPMHCC bindings for SM6350
Message-ID: <YSUhyQkXxT6Kl2oH@robh.at.kernel.org>
References: <20210820203243.230157-1-konrad.dybcio@somainline.org>
 <20210820203243.230157-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203243.230157-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Aug 2021 22:32:42 +0200, Konrad Dybcio wrote:
> Add bindings and update documentation for clock rpmh driver on SM6350.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
