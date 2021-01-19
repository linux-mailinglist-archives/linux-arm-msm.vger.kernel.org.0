Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5C2FBE40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbhASRsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:48:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:47022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731918AbhASPDw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 10:03:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB9A207B1;
        Tue, 19 Jan 2021 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611068574;
        bh=dZST2z3zdhC3d3+vZT1xghuXsRnYONAPhxzobtNNEXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bAPTk0z2dNr0o6iBUWXlIKiIeozZpt1A5TfBdwYXGiAqRhokwPhq6d4VGpDZShjB0
         tsaFQeB92I6tnDB1wGM0MhOSsH8ypmGa/3qmrx8gVdp/qPhCXPpRMhIZdwQVoAUR9z
         zMeFDZ8TBpA59R9g7SalT5R1toWvKGv0kzwGKBdRVr5OrDrkEAYq+CA5TdGHfQDjV/
         0kIouCmcm/Lkptjn++EQ5odDpQ47VYxMuKZ8j/t9d9bO4/Apj55wQS6JKcNHZH6nRE
         ALOU59V75ZWRqhfWXwi1uz+nSCdiGOfJK613XBR7OtjjY1B+i4B7ysthcpO2QmUf2g
         Khk/UkK8G1CJg==
Date:   Tue, 19 Jan 2021 20:32:47 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,qmp: Add SM8150, SM8250
 and SM8350 USB PHY bindings
Message-ID: <20210119150247.GX2771@vkoul-mobl>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-2-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-2-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-01-21, 09:47, Jack Pham wrote:
> Add the compatible strings for the USB3 PHYs found on SM8150, SM8250
> and SM8350 SoCs. These require separate subschemas due to the different
> required clock entries.
> 
> Note the SM8150 and SM8250 compatibles have already been in place in
> the dts as well as the driver implementation but were missing from
> the documentation.

Applied, thanks

-- 
~Vinod
