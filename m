Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8803C3993C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 21:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFBTsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 15:48:04 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38685 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFBTsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 15:48:01 -0400
Received: by mail-oi1-f181.google.com with SMTP id z3so3823386oib.5;
        Wed, 02 Jun 2021 12:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2kBzbHf+t2QwClNMpCYUx+9WwCp8xziT/Ti8nd8I4XU=;
        b=Du6VGJNM9BJr6taS00B9Ozjf29zmmSjfpz0rUvmgGzrD+ace96IO3LGSUoC3ERxkfH
         yVSirPoqyOLwtekBReLE/dKQByGkgxAuunYVApMrXbSlyrxkWLBC3AtYh7ZvMmm6MK/k
         ag6QSuhYEokF26Fkgcxn/MR7ElROu/cp+s1iHRokvzxElH7knO5FfZIliFZM0bHCUJqL
         eiuj/8a4hO72zkazkt5TvkD3ChdH8bafjyGvQqqcFN39E4nKD+pp5+d183PCehzgFfxX
         qGue5x4WLGTQf1hAMMW2EUc6JaB2eOBFnbaapmFeotuxBCHxZ5NQGpXxxZGyWvexYa8L
         NR1w==
X-Gm-Message-State: AOAM530j8o7ZzLi1+4zebgIkYxtaeBl75CdAdB7oLWDTET4S7RYjIIqx
        aO6nWFOIMj5mXkSzANM+m6FCu4jArQ==
X-Google-Smtp-Source: ABdhPJy+S0VAadtTwv3K5X6cKfI4p9bsh4HO8pKRa2oJ5/0+EPOIdtF2PP4Mx+/YixuSBx61JN17Hg==
X-Received: by 2002:a54:4d01:: with SMTP id v1mr3723606oix.82.1622663178009;
        Wed, 02 Jun 2021 12:46:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q5sm190055oia.31.2021.06.02.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:46:17 -0700 (PDT)
Received: (nullmailer pid 3864945 invoked by uid 1000);
        Wed, 02 Jun 2021 19:46:16 -0000
Date:   Wed, 2 Jun 2021 14:46:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH V2 4/5] dt-bindings: clk: qcom: smd-rpm: Document SM6125
 compatible
Message-ID: <20210602194616.GA3864860@robh.at.kernel.org>
References: <20210523211556.731976-1-martin.botka@somainline.org>
 <20210523211556.731976-4-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523211556.731976-4-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 23 May 2021 23:15:55 +0200, Martin Botka wrote:
> Document the newly added compatible for sm6125 rpmcc.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> None
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
