Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A72944EFB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 23:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhKLWuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 17:50:25 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:36801 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhKLWuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 17:50:24 -0500
Received: by mail-oi1-f181.google.com with SMTP id q124so20618146oig.3;
        Fri, 12 Nov 2021 14:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eTgYIwFl7GF+A0xd5CEjA8jObkWvFKBdWdtM1OplMAk=;
        b=HuqQpyBTYXyuSaF8YVnRWM++N7szW4l3MB1bes+OVrFEocSAsz1lU/erpA0piqbvkP
         3UuO/torRkoyNZbGGnU9JeZ5bfepIckx2l+wX9xsh706f218i+mrUDtKi6Cc/iYgm9u3
         xEOWm7iz3QH7bemlkvrTMg5/yN16LHgn6tQj+FWMpINEhhS8gbBRbZwYR1PTNYW+pdkO
         SS65cFlaCuZ+eXmaOYgq9Jzd6Y8+cmwBYqvuQtN5dkVmgVZKnPMLoOlE6ha1HMQw3PfJ
         FpYW9sxQnV3HfiOaf2bZWE/JbqSxgcH58nMziRquc8DBB0HP+2ReEVWwpyXKrBNHh5EG
         w7Yg==
X-Gm-Message-State: AOAM533bUhOFh3LCVN8D/ZfZnwD1AuH3AOoKatUuI5rEMQRZMiZbx8FM
        5Hbg7/uz22FOZHmRMMuxWA==
X-Google-Smtp-Source: ABdhPJzlBn+pD0U4Zhwhz6Gm3eIJmgaSk0lHB4+hwpApwDna/3XgUoc7EKD+wzRzaz3mwfUrIHHlSA==
X-Received: by 2002:a54:4482:: with SMTP id v2mr15664977oiv.61.1636757252741;
        Fri, 12 Nov 2021 14:47:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d25sm1524640oti.9.2021.11.12.14.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:47:32 -0800 (PST)
Received: (nullmailer pid 3517647 invoked by uid 1000);
        Fri, 12 Nov 2021 22:47:31 -0000
Date:   Fri, 12 Nov 2021 16:47:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: usb-xhci: Add bindings for
 usb-skip-phy-init property
Message-ID: <YY7vAzxj9aR/zBSB@robh.at.kernel.org>
References: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
 <1636353710-25582-2-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636353710-25582-2-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 12:11:48PM +0530, Sandeep Maheswaram wrote:
> Adding bindings for usb-skip-phy-init property.
> Runtime suspend of phy drivers was failing from DWC3 driver as
> runtime usage value is 2 because the phy is initialized from
> DWC3 core and HCD core.
> Some controllers like DWC3 and CDNS3 manage phy in their core drivers.
> This property can be set to avoid phy initialization in HCD core.

You already know if you have a DWC3 and CDNS3 controller, so you don't 
need more data in DT.

> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 965f87f..a64d29f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
>  
> +  usb-skip-phy-init:
> +    description: Set if the phy initialization is managed by controller
> +    type: boolean
> +
>    imod-interval-ns:
>      description: Interrupt moderation interval
>      default: 5000
> -- 
> 2.7.4
> 
> 
