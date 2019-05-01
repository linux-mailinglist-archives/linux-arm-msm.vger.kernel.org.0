Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B58B210D77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 21:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfEATs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 15:48:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34439 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfEATs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 15:48:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id v10so14656328oib.1;
        Wed, 01 May 2019 12:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ikJo1NEP++jN/CQZU0v1y07L/HudzlvOQM/HORBFx0=;
        b=VXNt608PdhODnru1svgmZG2uxNiN1emdJw7k4jeOclQ2xyIR0/QHPZ+ffimbz0tkYc
         f9VC4Q8FBmcsmoTI4pbfneaRreNcxkMoiVJTzrHJqIs51Yv6Z3d6MO+3d9tJCE+2uovO
         2XSpbz+R4BL1IFw1/G/G6zJJDHCWPBQBnT9rYZwz3Z1Nrko+9DSqXqu6SJAoUDW1vcXq
         F5I245YemZhna4vjmXlWSyqDRbeYsbCoanrs18IrfzzdTxyH5EA7cTASltMtfJ1ueX+H
         zhmpWGvyK5lrnMFnarLIFj2MSepwNnqjjeHVPnhdUBPmCr4Fn0yk1CpSKT1NMF8J89aC
         ajug==
X-Gm-Message-State: APjAAAWflQJ59o6pKddmPqdiid1JHrc/LBiDI8lZ6KZyRwnzugmFXosf
        tHkpbV6XC9fxCXXjc3mU9opHOoM=
X-Google-Smtp-Source: APXvYqyisfJMnup7uluBIkIszKSOr0l6ULyLaAvsXMlVi039cSIjJeTIlO7zl+QNjSx8mRgPMjl8IA==
X-Received: by 2002:aca:f004:: with SMTP id o4mr3763oih.55.1556740135900;
        Wed, 01 May 2019 12:48:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c65sm25713oih.53.2019.05.01.12.48.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 12:48:54 -0700 (PDT)
Date:   Wed, 1 May 2019 14:48:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Message-ID: <20190501194854.GA10996@bogus>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Apr 2019 20:24:33 -0600, Jeffrey Hugo wrote:
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
