Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE48E3C92A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbhGNVAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 17:00:06 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:34731 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbhGNVAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 17:00:06 -0400
Received: by mail-io1-f52.google.com with SMTP id g22so3843403iom.1;
        Wed, 14 Jul 2021 13:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9LS8fKQuOgmkNfETWUyNRS6P6FD5jXpwPj5qUOt7Pyw=;
        b=G/0sA4DmgY3hpoJNg87b3Jx1nlS7FhHAcP59HZzHjopQTNEpR9w+zMH6p9rYQ+6t+W
         QBpFdvguP99gwdEPfnuhS+z3Y98N+6Kb9xuPWKsy/tVix/UT4mF6WCigd+s5+6fBLP3x
         kUPRxBcCUUIRzOTIMI/5KWat4SVTiLvbAQQif+WI8oqcaoqVQhiNm41BFNtXpurHgIXZ
         WIHBNG3dN2/d6kbLQmXFSNSKeWROV19TfAqk/oRDeidrmyOFl1SPqvCh4+x77WlkdkMJ
         sE9F6mvVIvhOQI2Zaa0QGKEHhYbzaJ60bVdREzF9RAkOm1c2JarUikspjmt7UEY/Xhre
         Hi4Q==
X-Gm-Message-State: AOAM530eocxYn7Uy+K87nlJ8pXIjFU8SuFVooE3MVc8d0AbrlE/aeH0I
        YmQD/ZdWSOIBkQRqOzKOCQ==
X-Google-Smtp-Source: ABdhPJyxGysiXjud+pQe2JRzci8UiWpphXPQ4Qzkq404XV4K3iV7FbqhnKSJ4KLrpCUnDWTkzdAzqA==
X-Received: by 2002:a02:628b:: with SMTP id d133mr159620jac.27.1626296233896;
        Wed, 14 Jul 2021 13:57:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g22sm1776087ion.10.2021.07.14.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:57:13 -0700 (PDT)
Received: (nullmailer pid 3509125 invoked by uid 1000);
        Wed, 14 Jul 2021 20:57:10 -0000
Date:   Wed, 14 Jul 2021 14:57:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add sc8180x PCIe
 compatible
Message-ID: <20210714205710.GA3509073@robh.at.kernel.org>
References: <20210629004509.1788286-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629004509.1788286-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Jun 2021 17:45:08 -0700, Bjorn Andersson wrote:
> Add a compatible for the sc8180x PCIe PHY.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
