Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6906FC33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 11:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbfGVJbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 05:31:04 -0400
Received: from verein.lst.de ([213.95.11.211]:58727 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728991AbfGVJbD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 05:31:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2FC9B68BFE; Mon, 22 Jul 2019 11:31:00 +0200 (CEST)
Date:   Mon, 22 Jul 2019 11:30:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Minwoo Im <minwoo.im.dev@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] firmware: qcom_scm: fix error for incompatible pointer
Message-ID: <20190722093059.GA29538@lst.de>
References: <20190719134303.7617-1-minwoo.im.dev@gmail.com> <7ea51e42-ab8a-e4e2-1833-651e2dabca3c@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ea51e42-ab8a-e4e2-1833-651e2dabca3c@free.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 10:38:55AM +0200, Marc Gonzalez wrote:
> > In file included from drivers/firmware/qcom_scm.c:12:0:
> > ./include/linux/dma-mapping.h:636:21: note: expected ‘dma_addr_t * {aka long long unsigned int *}’ but argument is of type ‘phys_addr_t * {aka unsigned int *}’
> >  static inline void *dma_alloc_coherent(struct device *dev, size_t size,
> >                      ^~~~~~~~~~~~~~~~~~
> > ```
> > 
> > We just can cast phys_addr_t to dma_addr_t here.
> 
> IME, casting is rarely a proper solution.

*nod*

ptr_phys probably should be a dma_addr_t.  Unless this driver is so
magic that it really wants a physical and not a dma address, in which
case it needs to use alloc_pages instead of dma_alloc_coherent
and then call page_to_phys on the returned page, and a very big comment
explaining why it is so special.
