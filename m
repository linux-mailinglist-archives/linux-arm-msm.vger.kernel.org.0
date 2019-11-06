Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11DAF0D78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 04:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731168AbfKFD7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 22:59:07 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37747 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFD7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 22:59:06 -0500
Received: by mail-ot1-f66.google.com with SMTP id d5so7625898otp.4;
        Tue, 05 Nov 2019 19:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3+jUWUO/bkFGdV0o7ONSAdtw/CD/1zLOWv9k0T1s+7k=;
        b=FQ54nInJ4rJfm4Prwwap7N+gMCsGxFtHecNhV7k4NwVxs92QFCYMR0XWu2/UdlDLXQ
         CN9xg62hw+Mnei9UVm43fUWclwSh2JNeiC0nNGca77A8bQbsaQRvpmUrObNo6bpvfXFG
         vcaKT4wANN1rEa7yf+sOjlsWhLbIzisf5PKykqXU2LR2UhYTRG5fIUpO9fdwu0TPnwnl
         vmfI/wYRu2ChxyEtXptaTgl9nZWKW2gliADb3g2vDpDxw1ryfyMEAaTgfuU7KAmPe66h
         wPZvQm0ozQjdleMnWWjRtbztapwMqTxmX21cKoZKQjXN5ITvZ6sihnymOG+y5S2mD3b5
         g6Ag==
X-Gm-Message-State: APjAAAWt8Pc1rft2Uqf/7prloHCC+wWzc3MXvYDZFTEgsG3ja8lFGy2b
        qf2P3LqPKosdPDKXnPgk1arjWe8=
X-Google-Smtp-Source: APXvYqym4eHg6yJ8m7KJdSNq9SIvske3hrK1picvTYuzgQLPgCwl5Zg8oHQpbKKuZkQsSOH3aNv20Q==
X-Received: by 2002:a9d:1c8f:: with SMTP id l15mr203341ota.313.1573012745732;
        Tue, 05 Nov 2019 19:59:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm6167581oig.25.2019.11.05.19.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:59:05 -0800 (PST)
Date:   Tue, 5 Nov 2019 21:59:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: Introduce QCOM Graphics clock
 bindings
Message-ID: <20191106035904.GA2362@bogus>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-4-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572524473-19344-4-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Oct 2019 17:51:09 +0530, Taniya Das wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml       |  1 +
>  include/dt-bindings/clock/qcom,gpucc-sc7180.h       | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
