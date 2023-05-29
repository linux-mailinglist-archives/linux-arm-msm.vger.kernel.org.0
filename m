Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD56714FAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 21:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjE2TYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 15:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjE2TXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 15:23:52 -0400
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BB493
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xwmlMtqlVAbaTkC5KPIaDaFug1I9apRWf/wLMNoERFk=;
        b=RcvTikbxSKYdsW5xUhTUWIYAnvCYFScqJry5K5MWANzd6G1RXDDas7mhH6lm7w4qQOiTHFht4TzLz
         5js/9j+NZ5n9fWjTNTqIAmGB+fdH5q6Kif5YlXpY/tufSsGjZH4SS8NURBpK0ToLSYxfnqJN0v3Wsq
         tI5Gn0rVa9orxKzI78akiccpOrIFBsnEaFJUOhf0SH/LC7w1NiZ++FY+1E6/bW9KH/YhuX2J0R7w4X
         Jerh7acE7tx93xyEw5ekP3Sa0FAexJ4c2WepNQNjkNgRIUf3uZSPQ0gtkPxK5ehinEkj65T2v8Kqcs
         Tb6Oo5QVKjkFNqIRuTJwrVu7lteW87g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=xwmlMtqlVAbaTkC5KPIaDaFug1I9apRWf/wLMNoERFk=;
        b=AnuLEmPdR4hRTdwshvfNg+hztUBftoiHcgOILegLU4HYH/zFHvMHV9HwFw03/fy7/qoD+85f81dvA
         6KfesBwDw==
X-HalOne-ID: 54b70415-fe56-11ed-8e9f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id 54b70415-fe56-11ed-8e9f-b90637070a9d;
        Mon, 29 May 2023 19:23:48 +0000 (UTC)
Date:   Mon, 29 May 2023 21:23:47 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 02/13] fbdev: Add initializer macros for struct fb_ops
Message-ID: <20230529192347.GB1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-3-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 24, 2023 at 11:21:39AM +0200, Thomas Zimmermann wrote:
> For framebuffers in I/O and system memory, add macros that set
> struct fb_ops to the respective callback functions.
> 
> For deferred I/O, add macros that generate callback functions with
> damage handling. Add initializer macros that set struct fb_ops to
> the generated callbacks.
> 
> These macros can remove a lot boilerplate code from fbdev drivers.
> The drivers are supposed to use the macro that is required for its
> framebuffer. Each macro is split into smaller helpers, so that
> drivers with non-standard callbacks can pick and customize callbacks
> as needed. There are individual helper macros for read/write, mmap
> and drawing.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
I am not a fan of public functions/macros names __something.
But I see it used in so many places, so maybe it is just me.
And everything looks consistent, so OK.

With the white space issues fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
