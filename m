Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7747F2FBE43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbhASRst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:48:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:47408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732437AbhASPFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 10:05:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E98F520DD4;
        Tue, 19 Jan 2021 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611068608;
        bh=eUhX6jconru4eYP48c9Tj21Rl/QwLANBQu/8bXEhkZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E3yZHBdG5Y321wwibp9thVP/l4ykzZEkXi0ROGfNWRao6YC6xMDM/NF+pi1Q9Z+3f
         MgVYMjZ5AkdjhJdf83FTN4gYEUPyCJr33qo2zQiA5jdSqBsGDy8TlMR73t2Dar4wRi
         BqPM5wg5O1yxJzpSKzmALktb7n88RJyEWSGndhqJ27d6pvoS29oco3Y7maKPnEolNz
         w4ZHtOlJtq+7bY5BplZEVXZx3+9XDCXE+/rh35sXvk/2dPClvdlESApjcwMH9Pt/W+
         UaK90JtAxuxYfdR/5ELK9sOqbinZUzpfpOvePDBB+Yjk8RADySbt1aqOLiZe5IXF3Y
         fSi06gIFuywGA==
Date:   Tue, 19 Jan 2021 20:33:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 SM8250 and SM8350 bindings
Message-ID: <20210119150321.GZ2771@vkoul-mobl>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-4-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-4-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-01-21, 09:47, Jack Pham wrote:
> Add the compatible strings for the USB2 PHYs found on QCOM
> SM8250 & SM8350 SoCs.
> 
> Note that the SM8250 compatible is already in use in the dts and
> driver implementation but was missing from the documentation.

Applied, thanks

-- 
~Vinod
