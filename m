Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4093C6358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 21:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236146AbhGLTOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 15:14:31 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:37560 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhGLTOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 15:14:31 -0400
Received: by mail-io1-f48.google.com with SMTP id l18so19063123iow.4;
        Mon, 12 Jul 2021 12:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KOmLVKcyfUfw4sFtGCEdraGx+y/kkHEhOVZCxdXTIGw=;
        b=rohYj6iSShUh3Rd8oUydEsOpoL4Oa9/GVRCg0F4EtjQDuUU9Cq6IB7HHpf8PTS3ofM
         R11agW9bgkJFO4l9Y3VY+BTTRjxXBzf7XxfYggUHUPrJVXekr5xhiSLeea7Cqy4kkKuJ
         RLuIAEBL9TBkON7NasZQWfw83oW3Q1s64ya08WAPo2bqJNodNJR5uM+FcKtbReYyC7W0
         mmilVWpmcGyxZFFJAWmIqrdVXgVIrepPrCx6sYnREya1ZlcOtf413XA8vUdl+ohjcniX
         WaobHsT95F+D/TbGZs9LvR8yeO/DdKv7LB804i/FGjJbH0yI2nXX6mJKcYmTHgrwR8u9
         FtQA==
X-Gm-Message-State: AOAM532F8Z8nP5APtWTKbirWJqPd1ZVDbCu+j8Sl5g0UoJrWaG73Alqs
        MxO72Gc/dYT9iuPwEF06Vd58HU7kzQ==
X-Google-Smtp-Source: ABdhPJwAJrnM6h0Nr/OHl17yaP9PCMn0WdmXxwOOMqDUDjozUnbYhx/sv1LVBcYsd2wZOutFTkZLpQ==
X-Received: by 2002:a6b:6209:: with SMTP id f9mr328318iog.147.1626117101619;
        Mon, 12 Jul 2021 12:11:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r6sm8469043ioh.27.2021.07.12.12.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 12:11:41 -0700 (PDT)
Received: (nullmailer pid 2317495 invoked by uid 1000);
        Mon, 12 Jul 2021 19:11:36 -0000
Date:   Mon, 12 Jul 2021 13:11:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>, linux-clk@vger.kernel.org,
        martin.botka@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        marijn.suijten@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        jamipkettunen@somainline.org, Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add support for MSM8992/4 MMCC
Message-ID: <20210712191136.GA2317441@robh.at.kernel.org>
References: <20210618111435.595689-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618111435.595689-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Jun 2021 13:14:32 +0200, Konrad Dybcio wrote:
> Document the multimedia clock controller found on MSM8992/4.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
