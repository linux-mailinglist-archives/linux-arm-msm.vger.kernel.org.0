Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC4A190387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 03:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgCXCY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 22:24:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbgCXCY2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 22:24:28 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 057B92073E;
        Tue, 24 Mar 2020 02:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585016668;
        bh=DAaK2CbfWck+/J2Me5QXKEU6aJw7PhWMHcWs2jUL4TQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AftW/VPtFgDbbyF9CKB1G09fKVvYmMq7RBK2tRVCT3sHD652GBmyno3XpVBwhJ7Jm
         +On3J62V2oI4oMWCHIeSXkESXq9sKYBdjYhdVxbMoBZ5njp6JkdbqBWPD6Kwu4J5ER
         IFWItX8FhNOJWb2KdjrO8xjQ3ky7SnHMKeMr2HE0=
Date:   Mon, 23 Mar 2020 19:24:27 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next/-mmotm] bus/mhi: fix printk format for size_t
Message-Id: <20200323192427.5903a6224ec85a07bd976c13@linux-foundation.org>
In-Reply-To: <20200322044952.GA17141@Mani-XPS-13-9360>
References: <c4852a82-cdb9-6318-70a4-96ccb4ba5af2@infradead.org>
        <20200322044952.GA17141@Mani-XPS-13-9360>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 22 Mar 2020 10:19:52 +0530 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On Sat, Mar 21, 2020 at 09:17:52PM -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Fix printk format warning by using %z for size_t modifier:
> > 
> > ../drivers/bus/mhi/core/boot.c: In function ‘mhi_rddm_prepare’:
> > ../drivers/bus/mhi/core/boot.c:55:15: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘size_t {aka unsigned int}’ [-Wformat=]
> >   dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
> > 
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks.  I guess we should tell Greg, who presently holds the offending
patch.  I shall add 

Fixes: 6fdfdd27328ce ("bus: mhi: core: Add support for downloading RDDM image du
ring panic")

and send it over.
