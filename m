Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DA141015E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Sep 2021 00:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhIQWin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 18:38:43 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:60449 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229594AbhIQWin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 18:38:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id C9D7F2B00BC0;
        Fri, 17 Sep 2021 18:37:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 17 Sep 2021 18:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=nhWXDSFKhC1b4KAXA4XjlcmTpL5
        dZ6T2058p8Og7JQU=; b=GpzZ1qRpFwidQCCXZq88JTv0+uc9A9uiDWB+coAc0Rt
        v4qYbRrGIivtwbSUIouGbUyss2shPTXGLS1iDTfGveq+BUo5NhujQ6XEkIqVBkL5
        oh6mT/86ZQzAjEhrSjwGnxPQ/4bZku3W3sf6C6iy2XU2zEL7je5njTH74hnWnj4r
        2ILH9Ag0DNjlw3JG5vticdChUCRNhOgJraOGQoZ7LUcNsFvK8HL2pjou0zr8Nydx
        2xvlFdCPU/1QT6dZST2PGbZNuUHCiNyIqMzYealPoX2RoCCoUW3j5PoWB3YneBk+
        AH6GA0+oP+Jc7sIPqheHgyhE3WX3ppe68bhnV3/ve+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nhWXDS
        FKhC1b4KAXA4XjlcmTpL5dZ6T2058p8Og7JQU=; b=Iqst6REPYZrVgxFoHUXdgf
        LpiPLwYcccINEr87/9MEGzuW1AYZwnegEHwhnHrIHZg28qcVWgbNTEMUsWdUUVXI
        rHcUan8miONe1DM4+/8zggxmJTBCJDYvy4Qx2hEvMcvLeBACz5pTk/LuabCg0sjf
        tnseWz9MpNmPtSGX3WIrQuHtt5Xp4g1K+di67P8TaXKDwqak6qP9XUSdNCoQHp5T
        ndeCs13S0ppwD6hNQhy/v7jVCp8nbpO3Rw9B+8jP75pB+uK3J+wmpG/+I1pLaSzq
        OIXzgTKI4qQK2wRPKVHZnzZt/yR/A5nibfCPAKYKHtxxCj9Db912HHCgu1QwmXBA
        ==
X-ME-Sender: <xms:nhhFYYFF07RmDkJJGGFYvTE0IHZWTMtV-kZzTIEOdImVwxC2tPCksQ>
    <xme:nhhFYRWaSAfV1zP92NdwP4NLA3dfp5t2D8qmx640v3QcOcDtEexwxvb_RqwNklkYM
    -OscQ8wBjDL7GwnuA>
X-ME-Received: <xmr:nhhFYSLRFI0r8M6YhfvLZY-d5hDZDJlRO9vKPgYPYLeYeKDkKZCVb_jxOcgkedIC3dbUbGNr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
    nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
    gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
    heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
    gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:nhhFYaED_VGyce_lQv2tWIhSKOQbFHEuFtMk9iPtGm2zWrSGzWMQdA>
    <xmx:nhhFYeX1rGy5XtLNApe-qZKkEwA4JoW2yZ2G4kb4mmF1TsQ05sQcbQ>
    <xmx:nhhFYdMMk3B6SqrLqJBCXrc1x48hmb940d8OhMiMIUw7K89264XOKw>
    <xmx:nxhFYaROTu3iTGp1HgObGRZWx0s6_YgwlNi1QhgwuyEEYzqah2_lNgLiJ7E>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 18:37:15 -0400 (EDT)
Date:   Sat, 18 Sep 2021 00:37:13 +0200
From:   Fernando Ramos <greenfoo@u92.eu>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/15] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUUYmUPT9AhizHpc@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
 <20210917154136.GJ2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917154136.GJ2515@art_vandelay>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > -	drm_modeset_unlock_all(fb->dev);
> > +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
> >  
> >  	return 0;
> 
> Return ret here.

Done!
