Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6CCA39A3C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 05:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbfFHD16 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 23:27:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45759 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730348AbfFHD16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 23:27:58 -0400
Received: by mail-pg1-f195.google.com with SMTP id w34so2102225pga.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 20:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=73rlx0Al8Bi2D+T3uFyrwNuDhtIRdfkSfNSwNdqApLY=;
        b=vZnuo1omaf1ebaOYnIivvcEKMipbWLSXSetiJzjAuMDkwFvEejTvw/LERyGnyTtTFD
         Ut/KBH2OgucYOakJ3plFjqVP2fvA4EA6KgyKv5PHmzdtl7dSUlO7jVHUCmNAk4zNViXh
         pKGSg82xwCrwAUhhUNdijgGe48Eal15iGLO+rrKF3pUswZcPEdRRUXAa7WX8c4x90r2a
         ibzcUYjSYhTrrD3IDphUlAXAX9JJvjekdKspwLeNpKUjPyFbTFB57z13q+YsY8RTEyW4
         djtelDTKb5XyY1rK5bbAxOwrhja/IYeH4U5HhA4o4Pu9+b9HFxOAh4wtCClptpI3FMnd
         CRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=73rlx0Al8Bi2D+T3uFyrwNuDhtIRdfkSfNSwNdqApLY=;
        b=R51liE9rHZDLX63UKFShOjQY2LsR4+Co8b7iFVYYsmN49c8t7MjcEKm6xsaknqoPpA
         rf58B6KI8R5G49Pae9xpPrIdFH3p9Zn4y+LWm9sgAqflGdhnCW3RXc+8/bDyDIEYp0Nj
         5BdKBX1vWT8wTpNs/QHxFcCgFnVBcw8nDgNilh3drhJ4XwQC2nPTHkA+P5AVPbCdzFpv
         V3twmm2ocdsO40XhThEMkLCAnchy+tDoiw5tQbpvFszzEfzUPgP8yID1DrrL5/y4qjP7
         xocZFcvGTYEKXB5czajr6lFae8210qFqNDXMLis1HDoFeGkuT0s6jdWQlCfUMp7ugjx4
         FWfQ==
X-Gm-Message-State: APjAAAWlFXielGWBLsp1qbhYoOkFgqF92kRToIK7QOQXdfwJt1r1DZMY
        C2Mm+48nXTSwZd0WJkwi6X/poQ==
X-Google-Smtp-Source: APXvYqzoWjPhd12ySZSr68F6QXinc6DRO2r16B7jrtAvC5fo2zqsmgssrm3j46hlC4Q0mg/vp7bIdw==
X-Received: by 2002:a63:1650:: with SMTP id 16mr5875706pgw.164.1559964477334;
        Fri, 07 Jun 2019 20:27:57 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j37sm3189251pgj.58.2019.06.07.20.27.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 20:27:56 -0700 (PDT)
Date:   Fri, 7 Jun 2019 20:27:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: qcom: Add ipq6018 bindings
Message-ID: <20190608032754.GD24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-3-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559754961-26783-3-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:

> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: speriaka <speriaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f6316ab..7b19028 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -36,6 +36,7 @@ description: |
>    	mdm9615
>    	ipq8074
>    	sdm845
> +	ipq6018

It would be nice if these lists where sorted, but as that's not the
case, please sort it wrt the other ipq at least.

Regards,
Bjorn

>  
>    The 'board' element must be one of the following strings:
>  
> @@ -45,6 +46,7 @@ description: |
>    	mtp
>    	sbc
>    	hk01
> +	cp01-c1
>  
>    The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
>    where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
