Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55DF33E174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 23:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhCPWdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 18:33:20 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:38888 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhCPWdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 18:33:08 -0400
Received: by mail-io1-f50.google.com with SMTP id k2so39014776ioh.5;
        Tue, 16 Mar 2021 15:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b+euWy4WVr1SVJdj2VBm7OzPgUuY7Q9wvCXwicWf3TI=;
        b=C53X00dz3BGvHp1WTrAD8LTP5x1DEo8JtiKYd/b6B8yZ8xzccoLRvaiNN5kpUULwO9
         ja1SAcV5GLFKQnm9i/aI98DIiwp5o/2JZa6U2XijXMB7W+zYzFToFzBAgKCYo/uBW7T+
         g3NaaBGrU6Z/dlVEGaCfyoS+qs0R5k6LYGUHwKJPlj8wC7oR5oPLnPRKXyZ+YlQi7w+B
         DUXo36spFVrYXFzrNzmbNTMJegRULTIFRMX75vvX0RAqa/fMm5Z9i/QSkpgYRw9BvuIu
         kTLs1TDwFRkeV38g/f8WBoFVmDK+Ys/vijg3+y1DKuvt89fVtJZ971flPfmszBVYA24J
         HLDA==
X-Gm-Message-State: AOAM531+p568oPpkVOuh2Q3vuHTHNb9bD0Zecwq55nQJwlSV8fUJasoo
        FMUp1czu7jms9i98jYX5X/cM3nYXWg==
X-Google-Smtp-Source: ABdhPJwK9EkoZm2zhnMJLQ6MhhalNj9fXzeNOwRkZvGpKlE3CkKajjRPLMmyTq5nX0YQ5Vld9GmKjw==
X-Received: by 2002:a5d:93c2:: with SMTP id j2mr5106188ioo.166.1615933987869;
        Tue, 16 Mar 2021 15:33:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id g14sm9176897ioc.38.2021.03.16.15.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:33:06 -0700 (PDT)
Received: (nullmailer pid 3806232 invoked by uid 1000);
        Tue, 16 Mar 2021 22:33:04 -0000
Date:   Tue, 16 Mar 2021 16:33:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        mathieu.poirier@linaro.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <20210316223304.GA3806198@robh.at.kernel.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Mar 2021 12:58:09 +0530, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 ++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
