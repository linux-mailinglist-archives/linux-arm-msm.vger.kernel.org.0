Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F373D4216B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238796AbhJDSn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:43:29 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:39582 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238772AbhJDSn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:43:28 -0400
Received: by mail-oi1-f180.google.com with SMTP id a3so22874714oid.6;
        Mon, 04 Oct 2021 11:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OaxfJ9WeAacJextF1LUh1UTApymtb9KWZSq5ZSpqAg4=;
        b=zp4s93/zFblfPwRoGAKgAriH6qrngXgtqtFluckwOdtBsci/gwhjo7fdS5HjgRjhxR
         gKmDvizCFEASCQdyfJwzoPx8vjI8zD1wmFBWENSSPchAc/1vgnIKp9kT/vLOvIQ4H1rt
         RvAM9nPXEcyLGb02mgZ8QaCjOprs1mnwKaVQBVg2Psm6QfLTe6Ln8YdgU4c5IFUd2WMG
         tEnYsXhDJEUvuByEM9/sDg7C729WU7aMStDMEpFjjIZHrCRQp9/4W8NM3buZyjTctSno
         PMX7IbTI5bOXoBIc/hNApVW+uCbwhySbtfjWJoKaHS3IYfPR7Fw0MAn4PviJjT8qAC4E
         /G3w==
X-Gm-Message-State: AOAM530yRpegWxcXgdyC7u5RG4LoalIPeH4GNxEM1nzzvLy7JMm5Q0VU
        loWbUdu2P2gp0+Udd2wNfjy8yVzZSg==
X-Google-Smtp-Source: ABdhPJxV6Ig+R8bck/wFPmkReq6uPg8Rc4tS3uq37MxmXoYN5t8+xVwGyHX6IyZYrcCBP3Jth6LTbg==
X-Received: by 2002:aca:39c4:: with SMTP id g187mr14997691oia.44.1633372898951;
        Mon, 04 Oct 2021 11:41:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q20sm2987004ooc.29.2021.10.04.11.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:41:38 -0700 (PDT)
Received: (nullmailer pid 1633173 invoked by uid 1000);
        Mon, 04 Oct 2021 18:41:37 -0000
Date:   Mon, 4 Oct 2021 13:41:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: phy: qcom,qmp: '#clock-cells' is not
 required for parent node
Message-ID: <YVtK4QsIrao/hGTq@robh.at.kernel.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929034253.24570-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Sep 2021 11:42:44 +0800, Shawn Guo wrote:
> '#clock-cells' is not required for parent qmp-phy node but the child
> phy/lane node.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
