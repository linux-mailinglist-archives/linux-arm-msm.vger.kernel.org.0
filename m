Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEA21347E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 17:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgAHQZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 11:25:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41700 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbgAHQZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 11:25:25 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so4110033otc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 08:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yz35zFP2aSNw0+gIRfSaZMhcsEm+gudXf2tyLjffdvY=;
        b=SL7mT+MZkpZvA62bHNthgcmmfZnpdqUqNaEcjPfzsCw94QidfgENIcD3pJ8CtPBa1L
         McpngcFsMXqWDtlUh5qePyHV81mngQP61NO3GQMjlRvDXsgv+ySC6jvx0dljrtRZqSbu
         WNLZfHW2OnGdi02luaQB8ZV7u+mbqReYySJDRLK0Cf+7/pD6VCCTnad3WVqXN97ybCLm
         TsZQ71qVStup8lXyzUz+vO7rYBs8UX3CY3NlkHfr2TQBisRChEIV0uedsJc3L4GsHaHm
         mxcZG25BvxBNhYOzlWX+nlfrOQg86hYzupA8egGtSy8T3a+3+YJI9dlOKhVR77ck1u25
         I5pw==
X-Gm-Message-State: APjAAAUGqGYN4WqBLobqbhG/zQ3woZ/in0N77kbjETOu3G09vg+jGQ/X
        R2EMEJiDGDl07LAC+EJ8+6O82Yg=
X-Google-Smtp-Source: APXvYqxoj3/EkKPhn5zxkFlO0l+FVsob0zFPmsvpTAk+Mu+nTzVIIO/8KbWfaVWWhy++IGwdP78fuQ==
X-Received: by 2002:a9d:7c91:: with SMTP id q17mr4902762otn.293.1578500724266;
        Wed, 08 Jan 2020 08:25:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 17sm1245982oty.48.2020.01.08.08.25.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:25:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:25:21 -0600
Date:   Wed, 8 Jan 2020 10:25:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org
Subject: Re: [PATCH 1/2] ath10k: Add optional qdss clk
Message-ID: <20200108162521.GA23484@bogus>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <20191223054855.3020665-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223054855.3020665-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 22 Dec 2019 21:48:54 -0800, Bjorn Andersson wrote:
> The WiFi firmware found on sm8150 requires that the QDSS clock is
> ticking in order to operate, so add an optional clock to the binding to
> allow this to be specified in the sm8150 dts and add the clock to the
> list of clocks in the driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 2 +-
>  drivers/net/wireless/ath/ath10k/snoc.c                         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
