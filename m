Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F9B25126B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 08:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgHYGwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 02:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgHYGwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 02:52:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DBAC061574;
        Mon, 24 Aug 2020 23:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=armWkMQMHeWrynpzAyMGDG4PU5wuW/KKgxbsJRkV43I=; b=I1lZGQbd6rbpBgflacnAax4B0r
        vbN7m8CVPH8CUuLie3QdwDiSFXvWUbAcHtlfU7zS7SW3k+9g0gO2EJAEGKN2VUQElPCexSD2MXBrL
        i8q4QuNOyKwUIk1nE+lg0Fc3ezIRSTWBbRvcWgSu869Z/NyEEolBPQRGB/ZZ2msFNKoD08aLP7JQl
        SlAVnjJzH3Qv9BCndirRZWXwUMkqhY0ZMeLZqzCKNI+3tg6KP84pevsKUF9glXL93hkC7vlXeYwYE
        ae8SxS9nGxrj9V7/Ed/KT8cwErR+S2BDSGIg7QE8XuSi1xwogew3rPIu4dNT8xCNBN8DdmYE5ycQP
        hRrkDqyA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kASoi-0000e9-Se; Tue, 25 Aug 2020 06:52:26 +0000
Date:   Tue, 25 Aug 2020 07:52:24 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: drop cache sync hack
Message-ID: <20200825065224.GB30014@infradead.org>
References: <20200822175254.1105377-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822175254.1105377-1-robdclark@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 22, 2020 at 10:52:54AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that it isn't causing problems to use dma_map/unmap, we can drop the
> hack of using dma_sync in certain cases.

Great to see!  What did solve the problems?
