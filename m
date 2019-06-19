Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0ECC4B1B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 07:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbfFSFwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 01:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfFSFwJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 01:52:09 -0400
Received: from localhost (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB91920B1F;
        Wed, 19 Jun 2019 05:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560923529;
        bh=ZkuAsgequni95HbNK6ONBqjvUgeSIKHzcp8y3cXEKz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MWH4DBJfxrXWzAFsqaWAnBOD2tH+jkU0ekX2LD7Z3/LcYKnoODJ0/ScFaGDx0YCEd
         DBbDYukz3hvGCkGRlVb7osPPAHbwx6kCjoZM2lMrTmz2Q+SgBrCvGNFkSqJGpDyAC1
         NY8t6HUR8T/k9LDqdHZEecD6DRxa5VVYh75tiJZQ=
Date:   Wed, 19 Jun 2019 00:52:07 -0500
From:   Andy Gross <agross@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 1/4] soc: qcom: geni: Add support for ACPI
Message-ID: <20190619055207.GA14273@hector.attlocal.net>
References: <20190617125105.6186-1-lee.jones@linaro.org>
 <20190617125105.6186-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617125105.6186-2-lee.jones@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 17, 2019 at 01:51:02PM +0100, Lee Jones wrote:
> When booting with ACPI as the active set of configuration tables,
> all; clocks, regulators, pin functions ect are expected to be at
> their ideal values/levels/rates, thus the associated frameworks
> are unavailable.  Ensure calls to these APIs are shielded when
> ACPI is enabled.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Applied.

Thanks,

Andy
