Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C06B1C3373
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 09:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgEDHPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 03:15:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgEDHPH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 03:15:07 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D99DD20721;
        Mon,  4 May 2020 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588576506;
        bh=AX7VLFITdaKhm6JLrBgwqJPyQNg+TIdwjdmRO3awQuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mB9JGAlYmRWmEoiutjZnODWkAPMIQuYGCva1yKA4A1DHRIBBHzMt1EKUN8IXwzePs
         dBhVkQUekJ3wMXXx55Vj6XfpCLh0GbEKD5vaOTJtGI9rKaVPwlVqXIfKW0sUfP5JCn
         FwrMX875HrlPaDz9EV4ce0ejhZuBILUtSAiSa/98=
Date:   Mon, 4 May 2020 12:45:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Add SS/HS-USB changes for Qualcomm SM8150 chipset
Message-ID: <20200504071502.GM1375924@vkoul-mobl>
References: <1586472749-18599-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586472749-18599-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On 09-04-20, 15:52, Wesley Cheng wrote:
> This series adds support for the Synopsis 7nm HSPHY USB driver being
> used in QCOM chipsets.  The HSPHY register map differs compared to 
> other PHY revisions.  In addition, modifications and updates are done
> to the QMP driver to add new registers/offsets, and to update the
> initialization sequence for enabling the SSUSB path on SM8150.

This fails to apply for me, Can you please rebase on
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next and
send.

Also, I saw checkpatch --strict complain about "Alignment should match
open parenthesis" please check and fix while not sacrificing readablity.

Thanks
-- 
~Vinod
