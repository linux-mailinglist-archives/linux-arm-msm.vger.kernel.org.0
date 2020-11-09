Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C16C2AC597
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 20:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgKIT4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 14:56:42 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36349 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729499AbgKIT4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 14:56:40 -0500
Received: by mail-oi1-f195.google.com with SMTP id d9so11544869oib.3;
        Mon, 09 Nov 2020 11:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zq4OSZ9JaGzyHJtUxuHumtaJuP69c4e4v9Ljp+32B8s=;
        b=J+uFJwBFr6qNvmsJrszuKbMZ1xYvUdt1H1eTATavWBuCxHYE/TEurwaM3aEPf8Ux+i
         0dRk9Z2ICdsqSB/WCtP35R5TUzSUXe07jWpWUbeMLMA6yGQvWuB7gbOu+DF/0rGfCto+
         ALP63vQlNxslb64oesmDms+SI8zQaL21MBxrXEphRwFT00ocWUVqZgsCMjpOpl3cIZhk
         VMADCnN99PEJ/liw+OCGGMWHdoQDi/vw5SVRxlQxKg40jLXYgj+9tHdSdaTluHIeAoJY
         O8A88RTG4Iy+GLRPnvMJeh7F6WTQ3UQ/BUIdkpkRU7OH5REizRaFX6bGKT153QMnkcjH
         2Qqg==
X-Gm-Message-State: AOAM531cM4igcR5wWcPDAGTfqOAKyAVa4+Wb6E8E/9kQM3qJ9KNRSxQV
        I1vOeWtGCnlqwnNPWAHNpw==
X-Google-Smtp-Source: ABdhPJx/xKhy7I5CJdmrB6xRyYfTpGDYnZgs4S/SmKfdwozrx89kKQAjVaKxAM1uSefCpYD1PxCftA==
X-Received: by 2002:aca:d886:: with SMTP id p128mr565148oig.16.1604951799788;
        Mon, 09 Nov 2020 11:56:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j21sm2796542otq.18.2020.11.09.11.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:56:39 -0800 (PST)
Received: (nullmailer pid 1665137 invoked by uid 1000);
        Mon, 09 Nov 2020 19:56:38 -0000
Date:   Mon, 9 Nov 2020 13:56:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
        mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX55
Message-ID: <20201109195638.GA1665101@bogus>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105104817.15715-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Nov 2020 16:18:16 +0530, Manivannan Sadhasivam wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add compatible for SDX55 RPMHCC and DT include.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
