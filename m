Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3628226D702
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 10:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgIQIrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 04:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgIQIrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 04:47:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF9AC06174A;
        Thu, 17 Sep 2020 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=C+7L0kBf5vT20wz34mllVkq7HYHnfYdvtH4WX3dFn8c=; b=pMJM5QKEfOaH3+/fuVBg1P5gXv
        1bp2sGNkLiK/yuJu+BvtKRDIlLJKreKlzgcBmpWdM04x1JgMznIfi+sN2HcCvTTrqrocx9xdVnLC/
        LpgClnppKKkgCJuy5gfFvLoGF00JuIY0rno7WZ7bc+hhHaqMLOdjLdWF6cLAGuuMr6LJH5dWxiRx7
        sqZBKpfXYkPbq1fP9bbHcfLcRbXqAxdAflYgrlfcl7YImJhArBNgMXxe/lC8lmLKw5vs+k6BrlNyg
        mKjKzhCKkcn+ejkTbMtaAytm0+a8O52Xf2mY/pWawB8egUathI2GbfT9CFN3E64JY3sBiwu9GIx45
        HQ840w7g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIpZU-0002YE-QX; Thu, 17 Sep 2020 08:47:16 +0000
Date:   Thu, 17 Sep 2020 09:47:16 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v6 0/4] user space client interface driver
Message-ID: <20200917084716.GA8227@infradead.org>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"user space client interface driver" is a very generic and there is
absolutel no explanation in this cover letter.  What is this supposed
to be?
