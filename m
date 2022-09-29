Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B36F5EFB78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 19:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbiI2RBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 13:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbiI2RBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 13:01:36 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 29 Sep 2022 10:01:34 PDT
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711AE192AE
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 10:01:28 -0700 (PDT)
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id C904E4405B7;
        Thu, 29 Sep 2022 19:53:44 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1664470424;
        bh=436Uuabr1UgFs+4h2U77K7F0dRJkSRY+sV5JdWmbtNc=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=a0XUExdFQx8ak4Y7R9AuZ+LSR3fwyPj/6BUKxRiLCGYVAeLL0Bg+vvMnwBYCfBe/W
         3nCZW2iqpVoGOKJRbd6ReByhVwZ3jBHRmr6K5nXbnBAFfrkMBVfkHBty3LkZnNHDwc
         Ic37DWHYVaOjKtvM4NAd0jfl2771VM0JvVNKr5UOTl2NN0J0kFV3vQuPJfENEjZcqk
         NQDIKEMs9Htwc1mf+zZ9flLasqgs78ADWwmATwf7dimrOBx0/noI2KXuwdzXOwRJig
         i0rGBSB5AcbRYLSqmUmeyRKU1pNAO0hkh375+zV2nZKaFba8QDmLXZM/bPa3dYs+eY
         HfPzS9dNJGYRw==
References: <75bb4a68-f47d-1de1-a900-789e365be41e@linaro.org>
User-agent: mu4e 1.8.7; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: ipq8074 USB PHY
Date:   Thu, 29 Sep 2022 19:52:14 +0300
In-reply-to: <75bb4a68-f47d-1de1-a900-789e365be41e@linaro.org>
Message-ID: <87k05mm875.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Thu, Sep 29 2022, Dmitry Baryshkov wrote:
> We have been looking onto the QMP PHY programming in the upstream kernels. I
> noticed that the ipq8074_usb3phy_cfg uses usb3phy_regs_layout for the regs
> layout, however the Qualcomm's kernel ([1]) defines offsets which correspond
> to qmp_v3_usb3phy_regs_layout. As you seem to be working with this platform,
> could you please doublecheck which of layouts is correct? Thank you.
>
> [1]
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/tree/arch/arm64/boot/dts/qcom/qcom-ipq807x-soc.dtsi?h=NHSS.QSDK.9.0.2&id=894e56082ca89638c68b7cee039ac1b2a6cb4863#n1237

The platform I have access to is IPQ6018 based. Only USB2 signals are
connected on the board. I can't help with testing of USB3 PHY
initialization.  Sorry.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
