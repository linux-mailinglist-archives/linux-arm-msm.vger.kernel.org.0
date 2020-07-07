Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355AE217BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 01:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgGGX7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 19:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgGGX7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 19:59:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292E4C08C5EE
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 16:59:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so19960970pgg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 16:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rdv9aWYxdWzi7YuZEHxXGYFHP62AjpgpR6iHCVdleuI=;
        b=E5Bv52U3XPTKQk/JUCHmdsxbrjEBV7kFdiIQaCyIgOqHSS133VrkT0uweCNwnEouhB
         D6ChoBGorNNXQRd5vuzzcx1j8GUi9ZQpXJ/p70YeFpe/j26iafcL6ByrwDGUqHuT5A/I
         RFDzv7/AV7eJ4KbBcjAjcMhpYwiZT3d6/TEnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rdv9aWYxdWzi7YuZEHxXGYFHP62AjpgpR6iHCVdleuI=;
        b=YoEIc+0c3NpVskG6r0gWEzV3aHDMz6WZcUAmDB40OL23tTCrTi05M4O+cubx0FtH00
         KWOThVimw9fXvqQ+zPi6+NEnlQBCG+wxB4TV8IDXhvf1QwmNtutGYd14HdI+3Re0C8J8
         dX7Oh2gXgHkd0TzftkTlcbrHjIJpDN4yR3jS8CTXS9T0p0Y8T9J4T4f4LucM6THcMJkY
         lqj3iEFuGrH+0HzXnQCh+UqSeBcwfqSraf6bXcCc5n8rwsmc8Bxk+mUkpch5oCCDDq7T
         SpVffBh0DKm/jg3/e4/B5nW8Cvd2dBYI35JE4YGm6qUNC/c16duEuk57mHraPl1bMfbC
         6l7g==
X-Gm-Message-State: AOAM533Yo7WDitRCkUS1YrzPyfq+0TWEC78YcUCTdp9KqzLGc07V4anQ
        ViFib0djEJDlif1EvviIXS8d5Q==
X-Google-Smtp-Source: ABdhPJzYvJrtZ8JwyO03TQIq0tpFYVl2WHcKj9p5wk7nKZXNGQu8Fct93qp7eRhs4GS/cWugEjuxmw==
X-Received: by 2002:a62:404:: with SMTP id 4mr53377463pfe.133.1594166341548;
        Tue, 07 Jul 2020 16:59:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w123sm15793025pfd.2.2020.07.07.16.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 16:59:00 -0700 (PDT)
Date:   Tue, 7 Jul 2020 16:58:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v10 3/9] firmware: add request_partial_firmware_into_buf
Message-ID: <202007071657.55C2CFA57@keescook>
References: <20200706232309.12010-1-scott.branden@broadcom.com>
 <20200706232309.12010-4-scott.branden@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706232309.12010-4-scott.branden@broadcom.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 06, 2020 at 04:23:03PM -0700, Scott Branden wrote:
> Add request_partial_firmware_into_buf to allow for portions
> of firmware file to be read into a buffer.  Necessary where firmware
> needs to be loaded in portions from file in memory constrained systems.

Just tear out the differing "id" and just use FW_OPT_PARTIAL and I think
if Luis is happy, you're all set.

-- 
Kees Cook
