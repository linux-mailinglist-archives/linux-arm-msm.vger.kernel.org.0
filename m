Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5706A16EC12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 18:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731269AbgBYRFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 12:05:44 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33636 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbgBYRFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 12:05:44 -0500
Received: by mail-oi1-f194.google.com with SMTP id q81so49607oig.0;
        Tue, 25 Feb 2020 09:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MIUvkNpZ4/9BpxRsrF2+jh3yva+cnan5AW3vpCSNlt0=;
        b=Koad/aNnW3tuI02oldKDf8Ixbjh7Ffe1wfTSTjdriOzqemDwwFnUEK5GTLlNkDhpHG
         p10OVrMdYP7FwXYfU8uFV5qPcK6hq7N5wM6SaZLRynI6ZHAniqpdocINAPLDfcemJjds
         GUD0sNWHBIWJeQjmAs+5sEIl8JpIEK06amzwQ91XGvAql0RC4Ok0HlkivCmf7oIoULdX
         rlytDv26oT9IugnpAeZD8Jjg/NIBbxZIsYBgzydjUZApZblPwwYfy145vw2siB3fgg9z
         ih+K5lHtCvOlu4vf3QUJ875jMgRSz5UoSWT3+Klxjhu/5vVebJ7Sg7+85vT+A+7SVh5w
         yUag==
X-Gm-Message-State: APjAAAWg0/S6siV71glktoVMs7gY+xKaSNpEvuY8CYKq63zOuxAzqA3p
        2QbRx5on94gZVhufObT7+g==
X-Google-Smtp-Source: APXvYqxUftqdCZmNNSVgMwJqXatm40QiTX+fuppmG+ulElKyDpEyKa1buI+YUnzc03U4OvwCz379Zw==
X-Received: by 2002:aca:dd05:: with SMTP id u5mr4334323oig.91.1582650343127;
        Tue, 25 Feb 2020 09:05:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm5465089oib.16.2020.02.25.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:05:42 -0800 (PST)
Received: (nullmailer pid 30199 invoked by uid 1000);
        Tue, 25 Feb 2020 17:05:41 -0000
Date:   Tue, 25 Feb 2020 11:05:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: Add SM8250 GCC clock bindings
Message-ID: <20200225170541.GA28897@bogus>
References: <20200224045003.3783838-1-vkoul@kernel.org>
 <20200224045003.3783838-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224045003.3783838-5-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 24, 2020 at 10:20:02AM +0530, Vinod Koul wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add device tree bindings for global clock controller on SM8250 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/clock/qcom,gcc-sm8250.yaml       |  72 +++++
>  include/dt-bindings/clock/qcom,gcc-sm8250.h   | 271 ++++++++++++++++++
>  2 files changed, 343 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h

Reviewed-by: Rob Herring <robh@kernel.org>
