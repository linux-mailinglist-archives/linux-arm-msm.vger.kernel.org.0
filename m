Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0746F700958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 15:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241093AbjELNm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 09:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240803AbjELNm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 09:42:28 -0400
X-Greylist: delayed 11485 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 12 May 2023 06:42:25 PDT
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7C7132AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=k5+VvPJZto/QysP3qavd+SjTUa8fNKadbzfeW9t/AI0=;
        b=TJqvyu4TL26/tkosYpSp/vgIA/FnUtfVPwRhGnhgjW6DjR2EqDxNEOmvAvwBfZKcH2qhe5ZzWbxoN
         vl9N5BPEmc1pURxGI8+aZmV6f9C6ritn1M5jcZIj3pPJZuA3S1AOkIjS1yiXPeErwagvShrsEZyqUb
         ny0rhwnS6Qnjv9CnpD9VVj+pZOwxypUYCAQPFM1bjrRboPXFg8JlD5LBV5U7YmMft9VzdrWrfEhc4M
         9pSWZFnApjyq/TOjS7C3GyUSHyzFO+dlUbpJhwVr2Wtr+RX9P9M4MHLSuUsUtJYPmtxSnZpjYozxcA
         YLVGdYT1rabB1SNFSz74tNDY3uxstiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=k5+VvPJZto/QysP3qavd+SjTUa8fNKadbzfeW9t/AI0=;
        b=LY1+43GjLg7g0v31ddFfMmDZLCnJlWOY0tSmLnD9XCftTZs66g2Q4BG7BWVYXydEmwapLLs/UDcdB
         BIAoQtOAQ==
X-HalOne-ID: ad59f563-f0ca-11ed-a5b2-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4 (Halon) with ESMTPSA
        id ad59f563-f0ca-11ed-a5b2-592bb1efe9dc;
        Fri, 12 May 2023 13:41:21 +0000 (UTC)
Date:   Fri, 12 May 2023 15:41:20 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/11] drm/fbdev: Remove DRM's helpers for fbdev I/O
Message-ID: <20230512134120.GA1395037@ravnborg.org>
References: <20230512084152.31233-1-tzimmermann@suse.de>
 <20230512102954.GA1373384@ravnborg.org>
 <4cc261d7-ddcd-e1a2-1067-7b8c44e7769d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc261d7-ddcd-e1a2-1067-7b8c44e7769d@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,
> > 
> > Nice cleanup.
> > 
> >  From one of the patches:
> > 
> > > +config DRM_ARMADA_FBDEV_EMULATION
> > > +     bool
> > > +     depends on DRM_ARMADA
> > > +     select FB_CFB_COPYAREA
> > > +     select FB_CFB_FILLRECT
> > > +     select FB_CFB_IMAGEBLIT
> > 
> > This seems like a hard to maintain way to select a few helper functions.
> > Today we have LD_DEAD_CODE_DATA_ELIMINATION for the configs that care
> > about size - and that should work here as well.
> 
> I wasn't too happy about this solution either as it is quite verbose. But I
> don't want to rely on the linker either. It certainly cannot remove exported
> symbols.
I forgot about exported symbols - that makes the idea futile.

> 
> But the pattern is very common among the fbdev drivers. We could introduce
> common Kconfig options in fbdev and selcet those instead. Like this:
> 
> const FB_IO_HELPERS
> 	bool
> 	depends on FB
> 	select FB_CFB_COPYAREA
> 	select FB_CFB_FILLRECT
> 	select FB_CFB_IMAGEBLIT
> 
> const FB_SYS_HELPERS
> 	bool
> 	depends on FB
> 	select FB_SYS_COPYAREA
> 	select FB_SYS_FILLRECT
> 	select FB_SYS_FOPS
> 	select FB_SYS_IMAGEBLIT
> 
> Apart from DRM, most of the fbdev drivers could use these as well.
That's a much nicer way to express it - and with this we do not introduce
the IMO confusing CFB (Color Frame Buffer) abbreviation in every driver.

	Sam
