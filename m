Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD301B1507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgDTSqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:46:12 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34405 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbgDTSqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:11 -0400
Received: by mail-oi1-f196.google.com with SMTP id x10so9784772oie.1;
        Mon, 20 Apr 2020 11:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i1mtIpawmUDhZPAqhy0kb7QS/Wj9qW3K436AJI7YPHg=;
        b=tbU6dKQjsZZdvQpRW5EGoJdU85FjzNKXLeMDSLjtw49pGEmNw8pJ72xDHvLT10i4OP
         IJUTOcPb5/T/UX23//WZGtqU1/VqOMtdIYVMZ9COF2YrzbraNx9K0Q8QP1j0h3umKkvS
         ge+t8+B8jx4a/m7WuhSB0JsZZ2cNER3UOubLutRIyX4KAqTyzB+Fi6eTcX85Vxt6tcOE
         ebGu1Xwl5KMAvkGdfATq8gbi38ZPuAykaqBXLDgplgygDWmdHyoLP0xB41jVERfAURbE
         gk++KpWCqqWM+K54DenYHuf8lT7LkGKrVPteTzf4XwwruJGTbY/u1gyffp+iOJItC64/
         3ZPg==
X-Gm-Message-State: AGi0PuZZyDO7gD8Jm3Fvu4hQPlG0ZDHSPrT6amKc5JRUzeWdW+MoFD2V
        dLYRPujMB7MtChaU/ziU4g==
X-Google-Smtp-Source: APiQypJ+bzru4tS7dzweDo9wBO++FAsJtUDNNEFMi6WyZXxqmOC1SZ4F/P9lyBgGX0lB6tiMzTnivw==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr572619oia.146.1587408370858;
        Mon, 20 Apr 2020 11:46:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 69sm120113otv.8.2020.04.20.11.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:09 -0700 (PDT)
Received: (nullmailer pid 26611 invoked by uid 1000);
        Mon, 20 Apr 2020 18:46:08 -0000
Date:   Mon, 20 Apr 2020 13:46:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V2 2/5] dt-bindings: phy: qcom,qusb2: Add ipq8074 device
 compatible
Message-ID: <20200420184608.GA26579@bogus>
References: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
 <1586581352-27017-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586581352-27017-3-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 11 Apr 2020 10:32:29 +0530, Sivaprakash Murugesan wrote:
> Add ipq8074 compatible in QUSB2 PHY for high speed USB support.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V2]
>  * Added new compatible for IPQ8074
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
