Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B833F3EBC25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 20:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhHMSjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 14:39:02 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:36528 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbhHMSjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 14:39:02 -0400
Received: by mail-oi1-f181.google.com with SMTP id bd1so9753428oib.3;
        Fri, 13 Aug 2021 11:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T56HoVc5Lj/B99cTGd+Cuo/dhzLwcPEymz3u7dJaCE0=;
        b=ryV7RnMjVQfnGL9jnOoeWzsMtFnwTOh5ZDBAENMtQx/LP2T5yr8a1brFPcoDsj2ve5
         O/iasGvSRmzX742TSJiYHZuvqwGDZ3hr3RIIbiuG3pFTpq6ZcBYwQUrs5HG7Go1+G2PK
         VVbH8pAQO+zPNQ76JoJ/kQXkNEm7Bpd9UAcgx194rxPsFX9yS9wmAaSSoKTRpdEphvcr
         m17uGqw/0i7Jc4PpZMO9e2i/unMpy7TOLCuOvPPhKFgvhnh0KMcC5zA26IEMpEAzB/3L
         s+Evv2mSP6B8y/D3FVYXI3qvHtec7xbYc5L4DdlMxntgJv8ZNpUhiwCAZIebTlWsQrhh
         kUog==
X-Gm-Message-State: AOAM532ZFRQMS7DclJc4cuqGPzC2UOneF0g4m2ceNFRcyDKxQPLouM9K
        /bT57KCXlShvxaQQ3KohoQ==
X-Google-Smtp-Source: ABdhPJxhc7kvlDm0J0LfFE0gYnR8SuSYA7USyLq8H6egEjHcBSEof+weM72q/1XuXequ5NTqhmUTig==
X-Received: by 2002:aca:34c4:: with SMTP id b187mr3190588oia.139.1628879914709;
        Fri, 13 Aug 2021 11:38:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j19sm510043oih.34.2021.08.13.11.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:38:34 -0700 (PDT)
Received: (nullmailer pid 3830548 invoked by uid 1000);
        Fri, 13 Aug 2021 18:38:33 -0000
Date:   Fri, 13 Aug 2021 13:38:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY
 bindings
Message-ID: <YRa8KfZ6kbMlp3ff@robh.at.kernel.org>
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
 <20210805091727.942471-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805091727.942471-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Aug 2021 12:17:26 +0300, Iskren Chernev wrote:
> Add the compatible strings for the UFS PHY found on SM4250/6115 SoC.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
