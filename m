Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE733FC3BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 10:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239863AbhHaHbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 03:31:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239824AbhHaHbg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 03:31:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20B0960F91;
        Tue, 31 Aug 2021 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630395042;
        bh=58gahRqJCVkZ6Ws/NXcX/rfwRVKeEn+0OjYE684NjAU=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=YORRbvpt6ZHHPi0bEl/Amlmr7mRdYiNda3iiPdliD0gkW/E4Dyu766dZpEjA9xaZv
         4EX0RhqVVF0lx4IJ6vPWfoMcvQAMPW5+IEobZY4mKmNAAJSCmcgPagEtSEzzfE3xtV
         AmSNclUmSP43p3haiMfspUk9uzA5lN8VSTaYOPWXPgn5FcgYB68H2pVscrX/jH+FwF
         vmU6EgVmG1btuXl0kvW3Sv2rQWppfr/g7MVJ+BVnrsPCW1driRtRhQv+PlgPP1JTey
         QR20KZbrA1cMPi6CRQiG/NjlyM5aJsgiHWxpdGe+sNNinTAasPzew7Hurr4/5t7n6z
         XDuniX/irTzXg==
References: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
 <9f399bdf1ff752e31ab7497e3d5ce19bbb3ff247.1630389452.git.baruch@tkos.co.il>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] usb: dwc3: reference clock period configuration
Date:   Tue, 31 Aug 2021 10:27:45 +0300
In-reply-to: <9f399bdf1ff752e31ab7497e3d5ce19bbb3ff247.1630389452.git.baruch@tkos.co.il>
Message-ID: <87ilzmcbqa.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Baruch Siach <baruch@tkos.co.il> writes:

> From: Balaji Prakash J <bjagadee@codeaurora.org>
>
> Set reference clock period when it differs from dwc3 default hardware
> set.
>
> We could calculate clock period based on reference clock frequency. But
> this information is not always available. This is the case of PCI bus
> attached USB host. For that reason we use a custom property.
>
> Tested (USB2 only) on IPQ6010 SoC based board with 24 MHz reference
> clock while hardware default is 19.2 MHz.
>
> Nacked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> [ baruch: rewrite commit message; drop GFLADJ code; remove 'quirk-' from
>   property name; mention tested hardware ]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Felipe Balbi <balbi@kernel.org>


-- 
balbi
