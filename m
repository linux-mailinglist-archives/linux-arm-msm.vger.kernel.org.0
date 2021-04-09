Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170CF35A637
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhDISwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:52:24 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:36618 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:52:23 -0400
Received: by mail-oi1-f173.google.com with SMTP id c16so6785685oib.3;
        Fri, 09 Apr 2021 11:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mvd5JTy6Fgl9rPEY9AUmh65vh1PVinT5FHriv7Ij/6Q=;
        b=k7OYyu0rAKKnSNynHJhfiDfNUhzb3Hwva68GiiCs1y33aw/yGYkM8UVF19AWvIqrE6
         7xAKH/cWobA/fUliLF5ris1SrVtzCq7LorW8Jfk9gMvEXXFPwDUvWMaW69MKgM59icAv
         a3gMH2INVqQRi8vK7Qzk26Ip6r6M/jXiusjO2Bch5LhnHezGHPhZYmtZA/NfJaTJkQZy
         hqdAvQ4pLUPGnax4rrvK3JPzuj0ZNCH4oYmc0UJk2IJhDL4nS1ubv9bYwTUdVizGaF0y
         Or28vWOeDN18cR68TTu/eshE4SFSk6nm9U6OML88cjKdW+7V8veRN2gCl/sj0SxiQRcX
         TNkg==
X-Gm-Message-State: AOAM532lRBnwtbGmEz43Xt4eoudaqz8OBG4oVYNEyZ69sV4y3FCSTm0J
        UM4M70tGEmsnWnB/3n9geA==
X-Google-Smtp-Source: ABdhPJxZrrsgcXp+5H5Y8eFxqxYi+yeFJbmckpdXdSSm9JER62gOLUuif3nNGAoPjHGiU7UyzjfNag==
X-Received: by 2002:aca:4d0e:: with SMTP id a14mr1826756oib.107.1617994330490;
        Fri, 09 Apr 2021 11:52:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j4sm627422oom.11.2021.04.09.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:52:10 -0700 (PDT)
Received: (nullmailer pid 3952168 invoked by uid 1000);
        Fri, 09 Apr 2021 18:52:09 -0000
Date:   Fri, 9 Apr 2021 13:52:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH 10/15] dt-bindings: arm: qcom: Add binding for Telit
 FN980 TLB board
Message-ID: <20210409185209.GA3952139@robh.at.kernel.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
 <20210408170457.91409-11-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408170457.91409-11-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 08 Apr 2021 22:34:52 +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for Telit FN980 TLB board based on SDX55.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
