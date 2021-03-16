Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5947B33E11E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 23:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCPWHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 18:07:32 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:38164 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhCPWHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 18:07:19 -0400
Received: by mail-io1-f52.google.com with SMTP id k2so38955544ioh.5;
        Tue, 16 Mar 2021 15:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xudP/wtMn5ameXFOG9eCHeqe2x+KQ5fsOiLucUPt0ew=;
        b=jcSRRlBVyYB6Xc+EK0amVidKpxqs0clvHAJ6TQtlRwHYT8jrEShykYhZEIkuAssO3j
         VNnuv/PLVxdlmMjmvzAViEOjcZGDhJ5LzhO44n+LcdZuqfDOLgY2SwVKLnWBp9QPy21h
         k2zrPZ88YouTyC/fXUsJnQd0JTl3JSBa4smGExYfujLWwIfAJ4/VpmdnPurMODz57dLi
         Fd2i1GbfQDmuNG+yL1fKsnqOVC8b5H8rqIYfZcd1TXJ/MdfICSVUbwKFdoFUQQFw7Vm9
         +qJRN27R9L67zGYEWe6heLICRsRNvySxdQDA+R2ZWGUSmTgHFJzN83g2frV6EhABHjoh
         aUFg==
X-Gm-Message-State: AOAM533Gmg3zdp7rGOW9Wj72Yr3sXHHxF33nHdUZBdZZsB8N8sG1SHRD
        64SrmLQpyjpShpZQiAgiaA==
X-Google-Smtp-Source: ABdhPJyutVx/ClPCwza7RSsNBjmSP5RGixTDmB/ju3r8yiC4eLWLKO93VURJRfBdjUUYqTouYsJ0Xw==
X-Received: by 2002:a5e:dd09:: with SMTP id t9mr4799637iop.111.1615932438996;
        Tue, 16 Mar 2021 15:07:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 18sm9993938iln.19.2021.03.16.15.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:07:18 -0700 (PDT)
Received: (nullmailer pid 3764810 invoked by uid 1000);
        Tue, 16 Mar 2021 22:07:16 -0000
Date:   Tue, 16 Mar 2021 16:07:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     mani@kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, p.zabel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: mailbox: Add WPSS client index to IPCC
Message-ID: <20210316220716.GA3764759@robh.at.kernel.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
 <1615269111-25559-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615269111-25559-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 09 Mar 2021 11:21:47 +0530, Sibi Sankar wrote:
> Add WPSS remote processor client index to Inter-Processor Communication
> Controller (IPCC) block.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  include/dt-bindings/mailbox/qcom-ipcc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
