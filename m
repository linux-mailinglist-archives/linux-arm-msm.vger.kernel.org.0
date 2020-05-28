Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA0E1E64D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391315AbgE1Oz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:55:29 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37170 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391314AbgE1Oz2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:55:28 -0400
Received: by mail-io1-f68.google.com with SMTP id r2so19953710ioo.4;
        Thu, 28 May 2020 07:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V9q1pziYt0m1nKSry3Jo6IofP6yHLLawIxH8HrvbkSs=;
        b=eYAGGGqR6Mh7wTfu4GebqMW/1iwZsS3J0fxs+PbJH1RgeSjgolEXffTrn4OVYZQP+G
         kSDVHLHFcXxsRcu46rKNn276I6UPdbpdwLM991yeSqDx8OOkXYGWEr7B2zVl6J6ru3v5
         IhFZkZ3JiLM12QQ337xWGG3MT5UeQGHCEEUWdwMPqUU13RvjCOtMGTC21Rtz8X4DSHF/
         7sIbO0Vkbw1gycTsuHADF+hHNSsQXnZHVWrsB6obGYFs9upFeJeANNwyoSNV3iMQn57N
         cj9VHN0j5KaHovSXW4U/XHRhmOArADO9MZY48e945ii5kqxUzKngGBHqcVA9mbFf+Bl3
         +Ebw==
X-Gm-Message-State: AOAM531CmrQVJMlwTwUi6XyzAIWow4TIUAMLEwybH1w01zRM7H2dsElJ
        xDCImTqnRE7dBsr71oPZ2w==
X-Google-Smtp-Source: ABdhPJxgsg0zCerw2qnN08IcsRx2AWNyPK9QS8PlC0mEQceT82QnF20dOb575GIlcF9ISPrl8ADfXQ==
X-Received: by 2002:a5d:860b:: with SMTP id f11mr2576671iol.104.1590677725988;
        Thu, 28 May 2020 07:55:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w26sm3482778ill.19.2020.05.28.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:55:24 -0700 (PDT)
Received: (nullmailer pid 52001 invoked by uid 1000);
        Thu, 28 May 2020 14:55:23 -0000
Date:   Thu, 28 May 2020 08:55:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v3 3/3] dt-bindings: usb: dwc3: Add entry for tx-fifo-resize
Message-ID: <20200528145523.GA51866@bogus>
References: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
 <1590630363-3934-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590630363-3934-4-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 May 2020 18:46:03 -0700, Wesley Cheng wrote:
> Re-introduce the comment for the tx-fifo-resize setting for the DWC3
> controller.  This allows for vendors to control if they require the TX FIFO
> resizing logic on their HW, as the default FIFO size configurations may
> already be sufficient.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
