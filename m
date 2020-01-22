Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77869145977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 17:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgAVQJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 11:09:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44069 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgAVQJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 11:09:14 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so6687316otj.11;
        Wed, 22 Jan 2020 08:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NicELhRH97phufI5K+uhmipswu42ZkrWjRlsnZOlQZA=;
        b=pRUNvgoLQAOgog3zi4AKICD1SXvhd/maCEJJz+Bo7ppAet0yNLa80Si7kDTbNoIg1l
         F6DENmWkxlQ+kaex5bEGgoXgoT9cSOfGIJnRuF0TYuy4ToOWosTbysqxBdfxMPvKe6QR
         Ox9lMxhLWOpc2BhZVVbZ7dwu32U040+r2hVoBnUhGwOAdBhPsTK1ZvCg8iH7gs6D62+5
         SmPJrzQ5GYHM6dyB75l+xQpHHKnoEYujefwljRdweDFh/L3Lk6DZjw7Q1ATIwth30AML
         7JebSpjgQYEXf4W/nGm5pAjVKMKHab+Ipa/rSPKqLfQGu9y9/B2iOvcrJgdEP6nQ6/Yg
         kFCg==
X-Gm-Message-State: APjAAAWK3t2mTgIrOpWTO0PRshNBixYbA3fWS0XDDOE6MZlhyM+4BBPC
        tgElg9QDB3GVGOVeL01dKg==
X-Google-Smtp-Source: APXvYqw21Gi0ZiYsrMeofTeccP/C6CiR5RfOpcCRRQzj/Uy0gPrukIylWs23kLSl7jRdEPaPfq1MEg==
X-Received: by 2002:a9d:e83:: with SMTP id 3mr7856299otj.218.1579709353640;
        Wed, 22 Jan 2020 08:09:13 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm15135155ota.27.2020.01.22.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 08:09:12 -0800 (PST)
Received: (nullmailer pid 16612 invoked by uid 1000);
        Wed, 22 Jan 2020 16:09:11 -0000
Date:   Wed, 22 Jan 2020 10:09:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add RPMHCC bindings for SM8250
Message-ID: <20200122160911.GA16555@bogus>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Jan 2020 15:39:48 -0800, Venkata Narendra Kumar Gutta wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add bindings and update documentation for clock rpmh driver on SM8250.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
