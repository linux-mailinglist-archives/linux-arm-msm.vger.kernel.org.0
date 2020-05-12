Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E94B1D027F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 00:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgELWpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 18:45:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34437 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELWpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 18:45:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id c12so18750799oic.1;
        Tue, 12 May 2020 15:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H3mQbCcsv2zFTTQphH0VhCtNffeyctg9C0DFLB4zmUA=;
        b=PMSsUfX2lkQ70l3ibRc1n2wyPb6lq9xpV0vG+03Ojt3OCmR3KpDwYd7Boccdy6GnOz
         YCh1vYzH5Z85KK5v1wfWvkD7icRzdosDGNCrf4Js+73EgjR1rDgxu0QVlDwmpa2NrSG/
         giZin8Q8tJpiPFzS55dHDAFsHWGFAdk6biAFgsfCB2A2JPxWY3cGRIYl8JlzKhjBW++U
         1ZvZqvJek8l+fcPBzBzIQIDmGVNcRl6wRw0HTgWZaEGmx6J30T/aY4Yh6mRW1dKmW2o1
         3aUzgO9t8ILO7EJRk7Aq68n7/gq/PYcypvgscWTfz5noizpnFgQx9VokF1Y1B1NJEu6l
         7giw==
X-Gm-Message-State: AGi0PuZxAiWHpZHBCyLkqDmGxSgL/n/Qz2p7eKK7SLwA8MA7bhd0xLVp
        4gTHX9iZsFjjqA5+D0ZrJg==
X-Google-Smtp-Source: APiQypLOJDDoGZ4DqPxBbzEoP3owL+XvwYhO3bcaVKdd49YmtcwnOqfZKQLljrRYNcz5s0Fo/YdjOw==
X-Received: by 2002:a05:6808:24a:: with SMTP id m10mr22814109oie.178.1589323524267;
        Tue, 12 May 2020 15:45:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u82sm5727361oia.35.2020.05.12.15.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:45:23 -0700 (PDT)
Received: (nullmailer pid 13538 invoked by uid 1000);
        Tue, 12 May 2020 22:45:22 -0000
Date:   Tue, 12 May 2020 17:45:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: soc: qcom: Document MSM8936 SMD RPM
 compatible
Message-ID: <20200512224522.GA13463@bogus>
References: <20200501223232.275800-1-konradybcio@gmail.com>
 <20200501223232.275800-5-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501223232.275800-5-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat,  2 May 2020 00:32:32 +0200, Konrad Dybcio wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
