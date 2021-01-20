Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1692FC9CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 05:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbhATEPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 23:15:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:47094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728955AbhATEL5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 23:11:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AAA82312D;
        Wed, 20 Jan 2021 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611115876;
        bh=U9Bt6Y1Dx4zEFVfCGSu8/p74QrHbV6nn5xm0mPuectA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GEr2KSzZykqwP7QHvisu0VFFoDLfIAJWqIQd76XXmsbJYiCLjZ5tJzUUU+8ZF41dZ
         sZ8FyBYsiUKknSsI2zNUroR6nJAuU0XGLBA1pRDl/Rdr+Wv4NNc71l+RrUp73TxuoJ
         WkVE9v+qTZe4TL31Uo8yRw4/N6mm0UJ6ZkENt9VkJ994S8JONNOBdicAbXfPVCwWWi
         LZeRPZ8i0AwT329dJrVdMAflI9t8GYm7ECndBOt3uSZxECNqmYKLQOiwvL6vBi+Bsh
         /HJGeHHyrMX9PuuI8IUuDcte3HCIKO0XXVc6m7Kv4IYX1gM8xxBkgTlYEWnA4hZT8X
         qpvcxtgEwfW6A==
Date:   Wed, 20 Jan 2021 09:41:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: usb: qcom,dwc3: Add bindings for SM8150,
 SM8250, SM8350
Message-ID: <20210120041110.GF2771@vkoul-mobl>
References: <20210119173748.6729-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119173748.6729-1-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-01-21, 09:37, Jack Pham wrote:
> Add compatible strings for the USB DWC3 controller on QCOM SM8150,
> SM8250 and SM8350 SoCs.
> 
> Note the SM8150 & SM8250 compatibles are already being used in the
> dts but was missing from the documentation.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
