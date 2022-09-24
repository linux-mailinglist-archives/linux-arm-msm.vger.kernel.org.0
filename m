Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9A65E88F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 09:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbiIXHJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 03:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbiIXHJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 03:09:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD329132FC7;
        Sat, 24 Sep 2022 00:09:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69FF5B80D5A;
        Sat, 24 Sep 2022 07:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299F7C433D7;
        Sat, 24 Sep 2022 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664003361;
        bh=AJt4zk93LVa4vecHkex6IL/BxdunkkrtiUumB+OGOmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QeXCkrbT8j663DS9Fvd2Jl0nGwXEJLvAQJV2hjUF0rrmABKRVesPRssUN9xfFM4zY
         cZXY/kzupnh/PmAh8Ip0g08lrCxtvGPzhWHvE8d6bW9B+3fBa6OEie0hK3n3MNjGnW
         ZqosHgnEl6ZCeeeug9op1kQw2GPnfO7GXRX7rxX7tFAw0dA/fRy9hISYCrjy4aH1lH
         voiSAIUOljzqxN3dE7nxADZIBWiPAoUAsaZMO+4bqCaK53upojuq8p/omnCQD0gtb3
         gSvV1oy0UpRqBLzcwWjlHe5Nee7h5JWPaapl3aVR70eU+gg6ZwvOGSMhvemM9CvpUM
         EC66dv0OMET+A==
Date:   Sat, 24 Sep 2022 12:39:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/2] SDM670 USB 2.0 support
Message-ID: <Yy6tHE8VZ2v347Q9@matsya>
References: <20220922024656.178529-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922024656.178529-1-mailingradian@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-09-22, 22:46, Richard Acayan wrote:
> Changes since v1:
>  - drop driver patch (some maintainers might be excluded from v3
>    recipients because of this)
>  - add entries in usb clocks and interrupts
> 
> This adds compatible strings for USB 2.0 on the Qualcomm Snapdragon 670. I
> have no way to test USB 3.0 because my SDM670 device doesn't have USB 3.

No driver use for this?

> 
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 3 +++
>  2 files changed, 4 insertions(+)
> 

-- 
~Vinod
