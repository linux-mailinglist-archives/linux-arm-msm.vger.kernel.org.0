Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDAA3EBB7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 19:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhHMR31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 13:29:27 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35465 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhHMR30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 13:29:26 -0400
Received: by mail-oi1-f176.google.com with SMTP id bi32so17003148oib.2;
        Fri, 13 Aug 2021 10:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4RofNjGEe960PbaFNWYB7a4HQj4cS5KJsEJM/sPypSc=;
        b=Y7oVqk/jDKn5vjacLNfP8A2bmYQ8IDIIB2H+VLZUIkdjtV0D4cS7bwbv19tk6sbuFh
         KMf/NcFK8sTD6cSu/P7ghjkqSpsx2779/kz1U1mQ3nh9yMmBPibll6SshYsFVOYYo8+k
         fONwChlGKdQIGsTOOnjU9haPBQtfb1BgWvoVNRWtNj/NgcN2MOBnf1eUIMsITSsEa3WE
         ke/iwlXgzV4iw714iw6coVLkgFAXEqEYKjKWdaJd5kUlSEoezb+qsexJdLMs+UuoXwZF
         6mwRnSqkpjlnTCtGYiAzNW/rbQoxcqrn1rQUXI5+0qT/6OpBKyTm4wWZ9pIkVPJwjc1s
         z7mA==
X-Gm-Message-State: AOAM533pQvTg5jqx4yO4AvHERzw4h+EpHwCE9kzxMOwmR6SlhVb7hbON
        HWAekVETclUjFI2LRpxsBQ==
X-Google-Smtp-Source: ABdhPJyLy4Ez8nPnFSd97CTZG/oHHrEYX8RwINs6TSiyZlzIjEMgjjqiYVRys8ape+Woj9mvsQvBdg==
X-Received: by 2002:a05:6808:1803:: with SMTP id bh3mr2886419oib.104.1628875738880;
        Fri, 13 Aug 2021 10:28:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s184sm461309oif.20.2021.08.13.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:28:58 -0700 (PDT)
Received: (nullmailer pid 3716573 invoked by uid 1000);
        Fri, 13 Aug 2021 17:28:56 -0000
Date:   Fri, 13 Aug 2021 12:28:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: usb: qcom,dwc3: add binding for
 IPQ6018
Message-ID: <YRar2LbE52HGr8J3@robh.at.kernel.org>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <24ce7c1258790b35a08e14a1e79a9447c3fed354.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24ce7c1258790b35a08e14a1e79a9447c3fed354.1628085910.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Aug 2021 17:05:09 +0300, Baruch Siach wrote:
> Add compatible string for Qualcomm IPQ6018 SoC.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
