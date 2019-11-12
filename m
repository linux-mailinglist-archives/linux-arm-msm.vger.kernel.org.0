Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC99F85BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 01:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKLA7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 19:59:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42164 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfKLA7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 19:59:12 -0500
Received: by mail-oi1-f193.google.com with SMTP id i185so13257563oif.9;
        Mon, 11 Nov 2019 16:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2wQAvhrwSH4grlalcbNwlzOvh9O9QNtpbGDCzW05RDc=;
        b=exc2VCKcWXq6POFI+A+Gk3by0sJNzCa7+kgC+dSjRaXHOuoGkXaLsgFtMAgI1dfTLw
         YwlkAlAgYYTuwKwgxMs/OF7Wq+vzhESnAO+xla7IfORk7GJG4btNyAwOIp5Ur7Qx4Otu
         gmDFEz9yJx5WybCNxLd0t+ATgyibqZRUMWzX9Jd+Z3afWdFuFoYd/xeBGsLwLgf+mTs3
         nJcyqSO1UAmQM5TRSaD9Xc6N2nvpz2Loo80RpUYulUrV7SOxGYWojyvurP0xk2AvQCDO
         K8wW3QXpuFOElbL2uxan4nmd4rsO4o7dqOZNykWErUeHHP5gUoMHbS5CGm3vuKo9sZTu
         MiNA==
X-Gm-Message-State: APjAAAWzjLeLmDyELra+Z0zcjZybYPB2gAJqGiA0ujW1ZjU2EiA37u8p
        CWayCjW8KPsJS+2GXKoUCN0Z/vU=
X-Google-Smtp-Source: APXvYqwnmudbCbHQ/NNGuxdlVyZU5l+eubsPOE6mvwuKX2Qy0j79clolAAev/cJSlWjMdiIMbme9/Q==
X-Received: by 2002:aca:fd96:: with SMTP id b144mr1500666oii.165.1573520351777;
        Mon, 11 Nov 2019 16:59:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x82sm5174509oix.29.2019.11.11.16.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:59:11 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:59:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v8 3/4] dt-bindings: clock: Add support for the MSM8998
 mmcc
Message-ID: <20191112005910.GA13845@bogus>
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri,  8 Nov 2019 16:17:48 -0700, Jeffrey Hugo wrote:
> Document the multimedia clock controller found on MSM8998.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml       |  36 ++++
>  include/dt-bindings/clock/qcom,mmcc-msm8998.h      | 210 +++++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
