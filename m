Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA953519D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235888AbhDAR4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhDARxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:53:11 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399A4C03116F;
        Thu,  1 Apr 2021 09:56:56 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id k25so2428177oic.4;
        Thu, 01 Apr 2021 09:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ETBgH6qj9LbHFgemlBLsoBYb8gAvxD3wu+gkwcIGQv8=;
        b=XUmSHU3R5xWAUWeizs2kUIUi4r1CCyEd8zAkvvEAZnAgaPpEKkBUa7EwNpFRi1PheD
         d8Im4pG2YD3sPb/CoAJB1eZutvTnNhx+hGEgidm9lwpfKlZiwUY/1HSbpyhSCl+U/eXn
         +31qmqKO7D2/6h2wi+nOaWKtZs4jz9LBcfqJz3hybvz079WZHMAw71hHk7YBrSV8Jefe
         JIq72QcZNoou2bnXzWlXmcLchRfqIxxdAmUFI9NGg0hoBXEbVMAs7gXrkZN1p00N22Rc
         dSeq9Lw5ZW8oZVCbqjT66Pnyl8GAtNKDyejaLI2EdaOeaHjy1twSgToQf0A5iAAG0Zou
         soLA==
X-Gm-Message-State: AOAM531yBVpHHpSArKCVh9JI51QF4OaG0dLKUjqv3+Ze5NSK8ep9oSLB
        b2MKSYiUp3drhfB5gj713w==
X-Google-Smtp-Source: ABdhPJyhXXKpBRxxtJP1yNigaZ96XAIF3twPdChuHy58h8DxT5BQe1kCb38lXntHjEwtI39n/HI/0Q==
X-Received: by 2002:aca:4785:: with SMTP id u127mr6371919oia.163.1617296212860;
        Thu, 01 Apr 2021 09:56:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w199sm1134579oif.41.2021.04.01.09.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:56:51 -0700 (PDT)
Received: (nullmailer pid 602233 invoked by uid 1000);
        Thu, 01 Apr 2021 16:56:50 -0000
Date:   Thu, 1 Apr 2021 11:56:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V3 4/5] dt-bindings: regulator: Convert RPMh regulator
 bindings to YAML
Message-ID: <20210401165650.GA602181@robh.at.kernel.org>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
 <1617192339-3760-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617192339-3760-5-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 31 Mar 2021 17:35:38 +0530, satya priya wrote:
> Convert RPMh regulator bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Mark's comment moved this patch to the end of series.
>  - As per Rob's comments,  added flash and rgb bindings, dropped allOf and
>    unused labels and fixed few other things.
> 
> Changes in V3:
>  - Fixed bot errors and also changed commit text to specify RPMh regulator
>    bindings.
> 
>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ---------------------
>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 180 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
