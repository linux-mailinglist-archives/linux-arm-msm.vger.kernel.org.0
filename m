Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F6A1347ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 17:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgAHQZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 11:25:52 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42412 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgAHQZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 11:25:52 -0500
Received: by mail-oi1-f196.google.com with SMTP id 18so3107006oin.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 08:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eh1a1EgozWErHHqGLEoauZ/x7T61NxvHf+uJt4V80kQ=;
        b=YKJgTfKF9q5EjBPvoXfLacSHvp/aG5brpMqV0nJbx88BwWtN4mmze4T+zwdA8jUtZy
         xKpQU343ErrScqpY+g0PBSqO6MLIUKIHnDjB3dQWcAI0kECa/INDHv9frVnDcxThbz5J
         YE+yl9q9HhmxWX9kg5zIs9NnXhJ2eiIGCSpQco4k8LCAeAnR4ioL0SEIfUer7vf4Ob0y
         Diz6YpNu1o1eqgB7Wt59xuUVRltSmQEnR4GRPRKEDv62ftLw4ezj2bQtha5D4DZBIsF0
         ufVQPenNQJUJD1kXSu46/vWfs+OvXeqNitYpRvnFtvVKzkDme1+Km5RlaxNNUQxf/5oN
         1jDg==
X-Gm-Message-State: APjAAAUkl+mBcvlHiCO0MsdsV/e0kxCftssMy3fVRI/WQhFXAUJgfvfh
        CczKuIbO0hX6daJrPiSwJ1Gkpqg=
X-Google-Smtp-Source: APXvYqztOCggxFoLUvFtGmnPOIUxcOecmgV/09j/uM9xDItNCwfTRZ7jFobyTZPAjlPkyPTEJhtcpg==
X-Received: by 2002:aca:5d57:: with SMTP id r84mr3842206oib.42.1578500751182;
        Wed, 08 Jan 2020 08:25:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r10sm1240794otn.37.2020.01.08.08.25.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:25:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:25:49 -0600
Date:   Wed, 8 Jan 2020 10:25:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, sivaa@codeaurora.org, manafm@codeaurora.org,
        Rajeshwari <rkambl@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: tsens: Add configuration for
 sc7180 in yaml
Message-ID: <20200108162549.GA24298@bogus>
References: <1577106871-19863-1-git-send-email-rkambl@codeaurora.org>
 <1577106871-19863-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577106871-19863-3-git-send-email-rkambl@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Dec 2019 18:44:31 +0530, Rajeshwari wrote:
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
