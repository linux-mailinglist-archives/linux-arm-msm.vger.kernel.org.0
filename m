Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDBFA3DAC56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 22:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbhG2UB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 16:01:27 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:39601 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhG2UB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 16:01:27 -0400
Received: by mail-io1-f42.google.com with SMTP id f6so2822582ioc.6;
        Thu, 29 Jul 2021 13:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9mXRgqEkwH5IzmZQcUUqmh41kQujKR1NIPDWZ2+NcSs=;
        b=aJrzRON7YRL5uqE5u4x7598xb986NzzX050B28EH/Q2kxAKMHzXWKDW4lADrksopbn
         DJQenMs5k4Tj41E7LdNLa7Zut1MnJ9FNntTq1pXAUBK5ej/IVvL5gvz04Tm8QZak4daP
         KhkARivRiGKaP6bMOgtbhoqZJ85LrFDX4GAjZOJVUCddBfbQZoXC2ab0+mPK1qsJh4Po
         Pumbr1a+KvNPRQjAnecahZWUe7mLmKxN7xSYVH9xI5pdF9YI7n382TMFT0S+N9FjwAoc
         arKTkENNFFWWBas18sM/A0AJTECOzdYk2aKAzj0yIQR5GdmeF7cPtPWq19WKQ/ok2hYF
         xElw==
X-Gm-Message-State: AOAM530LW4cPTgwQCKaPvJS60cj7snicCB7i4mf8YxzbXxL2WfWGqkzw
        oT9UHKe2JTU+L8SpEtCQwg==
X-Google-Smtp-Source: ABdhPJw/RZBnQQMmMvZA/bx5FDeEPnpYyYC0b/N21ZlzG3TSnS5qzaO6XZ09g3XkhqWfmvPwhEH6ZQ==
X-Received: by 2002:a02:c94c:: with SMTP id u12mr3553879jao.54.1627588883194;
        Thu, 29 Jul 2021 13:01:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c8sm279693ioa.51.2021.07.29.13.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:01:22 -0700 (PDT)
Received: (nullmailer pid 787218 invoked by uid 1000);
        Thu, 29 Jul 2021 20:01:21 -0000
Date:   Thu, 29 Jul 2021 14:01:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for
 sc8180x
Message-ID: <YQMJEZFEp/Ms77BS@robh.at.kernel.org>
References: <20210721225630.3035861-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721225630.3035861-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Jul 2021 15:56:29 -0700, Bjorn Andersson wrote:
> The SC8180x has two instances of the QMP USB/DP combo PHYs, add a
> compatible for these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
