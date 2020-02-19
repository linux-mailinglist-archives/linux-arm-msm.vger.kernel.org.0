Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50C165266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 23:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgBSWVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 17:21:07 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42530 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSWVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 17:21:06 -0500
Received: by mail-oi1-f195.google.com with SMTP id j132so25478243oih.9;
        Wed, 19 Feb 2020 14:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kgnszcGIgx8eKrYcFzUwT2aC+nFz0K5SNNaYzo9jGEA=;
        b=qr3LvhZ6+dz08hO4i00YzKNK1XsbeiHacXLtSCDBk3CDeAgcowUTzkArGcAn8lkYKa
         W6Z5/e9FueQNTEfasPONvEUyveFbOk8zg21ZDnivcBDCOPWLSSNGXO6deMNXnAYV8K+n
         4IU3P/shD8au7tqGRJpaCm8mbR58djh4ZmNAYtHbwxuUyKm5hG5nuxHoBo+4ehwpJ8ra
         5fW+YqD64/cSQwqfnCuLvuBoJ1Uyu/knukgeAVnbawoeDc1JHrf9DgmDpsxKJ5DkuBdY
         OGXId1otT5QcBXhzyrTP/PzEYl5Ns0YTDXARXczAYR0lrjCJ9KDdLG1vB9PbBxGh0ohZ
         wHDQ==
X-Gm-Message-State: APjAAAV+FsWt9vL5e8GYkyrpt3rsIIiTrB7nZh6whCiM11s2Jh5vSm9c
        aeoRUNT0wNFlfqUD739SIg==
X-Google-Smtp-Source: APXvYqwLrlFcY4JuHilf0viUQ4JVawi4WxKwhLmGNJRu5pesDPyJiFwhX6oeNPnx4cXKDU+JnUCO5g==
X-Received: by 2002:aca:5303:: with SMTP id h3mr5864795oib.109.1582150866258;
        Wed, 19 Feb 2020 14:21:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s12sm412573oic.31.2020.02.19.14.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:21:05 -0800 (PST)
Received: (nullmailer pid 10416 invoked by uid 1000);
        Wed, 19 Feb 2020 22:21:05 -0000
Date:   Wed, 19 Feb 2020 16:21:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: arm: Add kryo260 compatible
Message-ID: <20200219222105.GA10282@bogus>
References: <20200212170916.7494-1-alexey.min@gmail.com>
 <20200212170916.7494-3-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212170916.7494-3-alexey.min@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Feb 2020 20:09:13 +0300, Alexey Minnekhanov wrote:
> Kryo260 is found in SDM660, so add it in list of cpu compatibles
> 
> Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks.

Rob
