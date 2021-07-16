Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D323CB205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 07:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhGPFqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 01:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231961AbhGPFqm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 01:46:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15494613DF;
        Fri, 16 Jul 2021 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626414228;
        bh=7Og9mjRr4RSX7ScC1qJ9LPTfU/5gI//bIxkmkWSqya8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YIGzgdq2eluPDfXbLPWrg9avmjJFWDeLtMKeNtqcKBHEs4h+/+mDsCZByYG7gv90O
         iI+7XASE2W2lm/HU2lsLEf9yr6160MWTdLM2OzLItd7tWvvHiBKQsK+y760tID4GAu
         clDQ7LM1KkkcUi+jRueVYL2GiSZ7x0ZEtnBSHYnPQUP4zy18Obm/xXfVkOFv4g3Rp9
         6Ridp6GSM6YkCpMsYJOgDxg8/kmRnU9mP7jTYMwFDk4UYRO0ShwZzojhzlx+11spoj
         R23P3Bm+OKimN1w7Ja4tDL4q1iNqENarmFpdDgsnaD/I5wumx8pPX8ewyyLDg3Wv7k
         HVIMnPhEv08AQ==
Date:   Fri, 16 Jul 2021 11:13:42 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] bus: mhi: Fix MHI on big endian architectures
Message-ID: <20210716054342.GD3323@workstation>
References: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 03:53:55PM +1200, Paul Davey wrote:
> I encountered some problems getting the MHI driver to work on an Octeon
> 3 platform these seem to all be related to endianness issues.  The modem
> interface appears to require the DMA structures to be in little endian,
> however the MHI core driver was assembling them in native endianness.
> 
> Using little endian explicitly allows the interface to function as
> expected.
> 

Please add fixes tag and Cc stable for all the patches.

Thanks,
Mani

> Changes in v3:
>   - removed change of doorbell helper functions db_val type from
>     dma_addr_t to __le64 favouring doing conversion only when writing to
>     context wp fields.  
> Changes in v2:
>   - use __fls instead of find_last_bit in pm_state conversion patch as
>     requested by Hemant Kumar <hemantk@codeaurora.org>
> 
> Paul Davey (2):
>   bus: mhi: Fix pm_state conversion to string
>   bus: mhi: Fix MHI DMA structure endianness
> 
>  drivers/bus/mhi/core/debugfs.c  |  26 +++----
>  drivers/bus/mhi/core/init.c     |  43 ++++++------
>  drivers/bus/mhi/core/internal.h | 119 ++++++++++++++++----------------
>  drivers/bus/mhi/core/main.c     |  22 +++---
>  drivers/bus/mhi/core/pm.c       |   4 +-
>  5 files changed, 109 insertions(+), 105 deletions(-)
> 
> -- 
> 2.32.0
> 
