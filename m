Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ABF2FA5AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406351AbhARQKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406245AbhARQIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:08:50 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8895C061575;
        Mon, 18 Jan 2021 08:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8pa+bASY5k8H5/EkY2EjdUZWWNJFn5FZ30mTBXRcFDU=; b=XuWXYKzG2kDe+Sd8Pjy62BzFK
        dSOZKfmyhq1VJVpd6v1Z3BcmS4J2UmKWXUQUmhUN22pgbPvvvKnszPapyQ6KMrUOKe0CLFD2kHrve
        +Yl1qah9DoCDd3XvtTyVx4ybXlygy0vOSjJJz5uC4+l0xr5laTxTEgqqRCV/2H74xQFq73miQZq1Z
        Ly9YmqAZtFgxbdhKE7ySdNyIN8nl7mMjOO8kkESwvFwOtaHAyV4zgPHe7MVvjW9/mF28AX/mAU6cJ
        IBzBQet2Jlx9ebuq5kTSOxBMQdIfLdVlZGgmOg6j+5XuiqNn/zrPYbwtA6QyqUgqshe6EmGISmcRD
        i1EdsxS4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49608)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1l1X4a-0006ew-7i; Mon, 18 Jan 2021 16:08:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1l1X4Z-00047y-OZ; Mon, 18 Jan 2021 16:08:07 +0000
Date:   Mon, 18 Jan 2021 16:08:07 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     will@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] ARM: kernel: Fix interrupted SMC calls
Message-ID: <20210118160807.GF1551@shell.armlinux.org.uk>
References: <20210118155153.21520-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118155153.21520-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 18, 2021 at 09:21:53PM +0530, Manivannan Sadhasivam wrote:
> @@ -27,10 +29,18 @@ UNWIND(	.fnstart)
>  UNWIND(	.save	{r4-r7})
>  	ldm	r12, {r4-r7}
>  	\instr
> +	mov	r9, r6			// Copy r6 before popping from stack
>  	pop	{r4-r7}
>  	ldr	r12, [sp, #(4 * 4)]
>  	stm	r12, {r0-r3}
> -	bx	lr
> +	ldr	r10, [sp, #20]
> +	cmp	r10, #0
> +	beq	1f			// No quirk structure
> +	ldr     r11, [r10, #ARM_SMCCC_QUIRK_ID_OFFS]
> +	cmp     r11, #ARM_SMCCC_QUIRK_QCOM_A6
> +	bne	1f			// No quirk present
> +	str	r9, [r10, #ARM_SMCCC_QUIRK_STATE_OFFS]
> +1:	bx	lr

NAK. This patch shows little regard for the C ABI. You are corrupting
registers that must be preserved. Please find out about the C ABIs
that are used on ARM.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
