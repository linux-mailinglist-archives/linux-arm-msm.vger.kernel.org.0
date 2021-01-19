Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A93B2FBE42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387470AbhASRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:48:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:47636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387587AbhASPFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 10:05:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D4F72312E;
        Tue, 19 Jan 2021 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611068633;
        bh=lFNvwMoS44xPuND8hAXpFGgbwYW1tdRWP6FoJWKsQUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LLmzoaGtosEcII5VD7qkRAUk+qdR+9RqhY68zH+MoNAtULxPguSHtMejiI93WpJnC
         pEcmhEzub8cZVx+hCpk4bfjgWtJ93mnFlrXhxts88Rty+4pkkpyVxXOTls+XjjU1r4
         tQJoNa1jvjgb6eeali3gs9bc9J1XRkm60Y5RrxHtU96bYZJqj6ZojMZo2Tco5uOX3I
         W12X2MrbLUvLKchcrkP7Q8XX+MQnKgH8bbhxn8mLBC6NJcEpyEsc28TjeiiWBL7SJA
         V8gwUOko5SVKL4mDxeNEzeKCS6KSTxRrTMz3zpJxerO6HoAwQH2x/cYTn78Az/kKSZ
         tVMPAP9TeEEPA==
Date:   Tue, 19 Jan 2021 20:33:47 +0530
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
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: qcom,dwc3: Add bindings for
 SM8150, SM8250, SM8350
Message-ID: <20210119150347.GA2771@vkoul-mobl>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-5-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-5-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-01-21, 09:47, Jack Pham wrote:
> Add compatible strings for the USB DWC3 controller on QCOM SM8150,
> SM8250 and SM8350 SoCs.
> 
> Note the SM8150 & SM8250 compatibles are already being used in the
> dts but was missing from the documentation.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
