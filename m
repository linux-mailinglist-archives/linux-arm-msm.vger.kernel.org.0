Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CE6183447
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 16:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgCLPRT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 11:17:19 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40389 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbgCLPRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 11:17:18 -0400
Received: by mail-oi1-f196.google.com with SMTP id y71so5807999oia.7;
        Thu, 12 Mar 2020 08:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jzpwe77Abgtv1XYYx0fhdTAjqfD6Awmd08c56L163dU=;
        b=R4Usgqot9FMkEJa3WE/U/jhC3R34PTs6ftAqGcZY06HEA46dnUTv7VDfAnCZrD9Vsq
         /4K0WHqGJANAQR+e57yQZ9t8n0eryxoKzXOe9eWIx0iRAiXo/UQPoI6TecRWvMlhZttY
         NVq8gnobKtGeB/7gkLLOf5ubyrfFbrRx+EhJ/olR3x6V+eA+r0+N0ttIKm3m3K4YzTm1
         8wEvxcE3tYsdI5Qjv8zQ4bOy9NG3cWB6LxGzqiEG2Ehd7hBCqvhwckQpFLiTBgn0h4qF
         l24VwTvCq6W4PdgeyQHPu6Qce+JDKDDH8cP491aWltqo0I76k/7kaWc8YabWmn7LpcJ4
         UQlQ==
X-Gm-Message-State: ANhLgQ0nWGYu1FNXxXfVi1pXr2lqMhkzaBIUdwMNF2MvbaU4+ahG50Bz
        D0H+6blHwkW0v9vJEOis/A==
X-Google-Smtp-Source: ADFU+vsdmoOYjMIj0gWOrimsXEvO/w7aUb1U+jTQ6bLux3L7/gaZQojIdHDA7NxmCJ5EzsCb3gNUbQ==
X-Received: by 2002:aca:5c46:: with SMTP id q67mr3034917oib.75.1584026237750;
        Thu, 12 Mar 2020 08:17:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j5sm18380490otl.71.2020.03.12.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:17:17 -0700 (PDT)
Received: (nullmailer pid 7330 invoked by uid 1000);
        Thu, 12 Mar 2020 15:17:16 -0000
Date:   Thu, 12 Mar 2020 10:17:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v6 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200312151716.GA7045@bogus>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
 <20200311085807.21984-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311085807.21984-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Mar 2020 14:28:06 +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> Changes in v4:
> 	- Updating license identifier.
> 	- Moving yaml file inside panel directory.
> 	- Removing pinctrl entries.
> 	- Adding documentation for reset-gpios.
> Changes in v5:
> 	- No changes. Updated 2/2 Patch.
> Changes in v6:
> 	- Removing patternProperties.
> 	- Added " |" after description.
> 	- Setting port and reset-gpios to true.
> 	- Removing @ae94000 for dsi node.
> 
>  .../display/panel/visionox,rm69299.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/visionox,rm69299.example.dt.yaml: panel@0: 'reg' is a required property

See https://patchwork.ozlabs.org/patch/1252722
Please check and re-submit.
