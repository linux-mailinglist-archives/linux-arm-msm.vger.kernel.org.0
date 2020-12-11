Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6F32D6EBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 04:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395151AbgLKDho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 22:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393948AbgLKDh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 22:37:29 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5DBC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 19:36:49 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id g18so6258364pgk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 19:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0kXG097tjTZOeXf28qBfkphbrgBF+6yR+K3YV68E8e4=;
        b=Sx4a1EREH3oE+dvkx0O1/Zb5T5N3E94woXcu1YfbISqOfqiF88E7RKpzEiz3DOxRYG
         nJmJtJGx9CcsmpewVZg5vk8hH3m218mUoCCHLMRHr1iiLx5rlIpWAT1YM22rNf54nSxW
         tKxEv1Rn64m9v2knpvmhJab/yKSEPtTWmkJwSPq8gysqid4+8shWlC1cnxYD2jY2vJcZ
         rdzKHx20ZAqhkx8AfgY9uAys3y2KwsCpQXx2Kn5hrxY3CiTb6TjkWVo1NFjBDtSwT1JG
         o4sQRl+f7puM7UuCFsbke9zyM5D3RemUg68fu/83s3dLykJWkeSbesdmSGnHgEicaBUJ
         aXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0kXG097tjTZOeXf28qBfkphbrgBF+6yR+K3YV68E8e4=;
        b=c2zOPLNvqY79DyghTkL1Ltw2dQ7V7ho/4opRcVHqitHEh2J+456gOUN4GpnxwYrx3h
         69EAzN58mhdXoabXJ1sSB4ou0MoQRc2llARgWQubP95bXCqylvllnYuKw1ONwp2tG45F
         XQ2nIrm49LGyYJEaZnv0HF8Im8QzNmPSnUi1OH4onOzNVDpI/MtiZw8X3qDNP8PmP4wV
         1cjRkFGGMW1m4TyB9X+0WuBEvYeCFR/uxXHxSEaF8nHFeUG3m0afXZDP+66jbTnvoQsK
         PAA6z12AhSYHeH3x07ZVq+BJbSTWpUUVe5BneWY+9O1rG5L9vcNf5yKnb/htx0UR3bsE
         j1DA==
X-Gm-Message-State: AOAM531ive5FqNKWgCT8MEHIJiPuZCYBRLHC4FeE6oCAwmkvmmq4p00A
        CAECBJI6ryOZwOuUAujGbXzL
X-Google-Smtp-Source: ABdhPJyypndPLLXiivE66gKjwk0SbMbdFhGFl9Dz8GZ9VdGE006UX6d4yjE1u9cfmH1LymD6X98AhQ==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id t84-20020a6278570000b029019dfe6a3069mr9745917pfc.3.1607657808979;
        Thu, 10 Dec 2020 19:36:48 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id l23sm7846056pgm.22.2020.12.10.19.36.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 19:36:48 -0800 (PST)
Date:   Fri, 11 Dec 2020 09:06:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
        vigneshr@ti.com, bjorn.andersson@linaro.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201211033642.GB4222@work>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201210040942.GD6466@thinkpad>
 <20201210222447.63f5dbcf@xps13>
 <20201211031048.GA3552046@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211031048.GA3552046@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 10, 2020 at 09:10:48PM -0600, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 10:24:47PM +0100, Miquel Raynal wrote:
> > Hi Manivannan,
> > 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
> > 10 Dec 2020 09:39:42 +0530:
> > 
> > > Hi,
> > > 
> > > On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> > > > Hello,
> > > > 
> > > > This series adds support for parsing the partitions defined in Shared
> > > > Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> > > > Current parser only supports V3 and V4 of the partition tables.
> > > > 
> > > > This series has been tested on SDX55 MTP board which has an onboard NAND
> > > > device.
> > > >   
> > > 
> > > Any update on this series?
> > 
> > Patches lgtm, I think Rob's Ack is still missing, let's wait for his
> > review.
> 
> Perhaps answer my reply on Dec 7.
> 

Sorry missed that... Just replied.

Thanks,
Mani

> Rob
