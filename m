Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8DD1B24EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgDULVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 07:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgDULVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 07:21:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727ACC061A0F;
        Tue, 21 Apr 2020 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=O7EX3G4leSXAdSVi0QkilAVF09SQ9P0JWv1IzyQNsJU=; b=h5gDfCj49aoEbBu9ZJ4lHd65T6
        FDv1uS15ExHUVIk3Jay9BrCDj2SEnyddluEqxNi5OwblnYm30D4L0Yj5uePgy8aU7Gx8YZaOMt1qW
        g2N8zv4mQ/pCQNl6PiWZstcmHKj1MQkMx/wz+oX+LAKPqwQtSyqrMkhfcLRhGkN6obUFrypEyWJnU
        Fkbyy4VlDJG4ZvKdK5s4Pn/fgHatNqe9HCElT3XVQ95jZI/vwXMGejInOyypkojFW1k7L+lZZFoER
        s0F9VBqoFzQK1W+CGLsCW456z0hrfpcWkioBT0ef+RfTF+dKSKtIP7rQwXQ/MY+q2Zqetin/KcDbQ
        4xjaWiuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQqy2-0006DO-NW; Tue, 21 Apr 2020 11:21:30 +0000
Date:   Tue, 21 Apr 2020 04:21:30 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] Revert "drm/msm/a6xx: Use the DMA API for GMU memory
 objects"
Message-ID: <20200421112130.GA29925@infradead.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-3-jonathan@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using VM_IOREMAP outside of ioremap implementations is completely
bogus.  Don't go there, especialy with such a horribly bad commit log.
