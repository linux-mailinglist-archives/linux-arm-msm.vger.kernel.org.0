Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEEBB571B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbfIQUms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 16:42:48 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36782 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbfIQUmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 16:42:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id m29so2623008pgc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YFdHh2t2oGEv2BeyA21GE0G/WyCi2XemObkdcdHKmyU=;
        b=WR7W/y/Vd3KVexCUb7hWKcXKdGo9sUyUYVu2m0c5AY8jg79ByRv3GU7hHtb9LbDWYB
         mZw5PChdZK7E/Dh+ouP8eUL030tx59XaE0u6AYcloT9aT1UpB8uiEb0gpUb9/mrtBw2y
         xASL8xfI9EMEr5x2EGq6/2aIOlrsPqBG7vmspnrVu6CYSlOr8SFjDbeKr/iVCCAS/L6U
         x/mza+bV99BHofVppiVRCy1wRLZG4JfkSSsRW2PBO9nil6mRs65aZ7RVwcUd7G0YWR/M
         WiwVBjcZZlk1zcITfQ60FVLP2fh0SZayUZR983vRsdU5j75DidPYRsV9JVkDbHh5WJC6
         WiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YFdHh2t2oGEv2BeyA21GE0G/WyCi2XemObkdcdHKmyU=;
        b=DW0ZF4iztJoeZjNL9MjBSgWd/uc0Oy4kGsbyVnuw12tqBBTecQwklQQg//tegtV6Wc
         OqESSRtXBUH8RJ1S5XpkAnYAY5jeNPvqhUjltYrw+DbTK76/eNTojTRt0EBHnTlJvu6v
         4T6/M6MxSAAdPO209oEoVKXKgIuVZ+P4J9wJBAKjkwgxBKq+UPla61u7NkXuOgZf/M44
         Mcl0En/xCoT7btspbhdv1cu1Xyhk/TI3fNcEU9Y/HLCMRW9G6yKW+I/K4bfi4fsj7E+T
         BIJaAL9J3hRcpWqRIrP0b79NHHOHFHj6yjIBmrXfFvVlMC9cfDGGORiR/Q1uWddjhZ37
         l5CQ==
X-Gm-Message-State: APjAAAXzl4jqENHJxqEw/D9j39yJQTcvEL6JXDj7uZfl2/feUSAywsxr
        GbbI/TeGJKNKpMFs5bZVlP65xg==
X-Google-Smtp-Source: APXvYqwiZx8dQNbqg0BmyaATr5iobMO3ZNDI3QuNtw/DOBStKSp3I8AmEvwYrUDxTWiIFPZukQRJgg==
X-Received: by 2002:a63:ca06:: with SMTP id n6mr673892pgi.17.1568752965572;
        Tue, 17 Sep 2019 13:42:45 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e192sm5960215pfh.83.2019.09.17.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 13:42:44 -0700 (PDT)
Date:   Tue, 17 Sep 2019 13:42:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH] clk: Make clk_bulk_get_all() return a valid "id"
Message-ID: <20190917204242.GB6167@minitux>
References: <20190913024029.2640-1-bjorn.andersson@linaro.org>
 <20190917203347.04BE32054F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917203347.04BE32054F@mail.kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Sep 13:33 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-09-12 19:40:29)
> > The adreno driver expects the "id" field of the returned clk_bulk_data
> > to be filled in with strings from the clock-names property.
> > 
> > But due to the use of kmalloc_array() in of_clk_bulk_get_all() it
> > receives a list of bogus pointers instead.
> > 
> > Zero-initialize the "id" field and attempt to populate with strings from
> > the clock-names property to resolve both these issues.
> > 
> > Fixes: 616e45df7c4a ("clk: add new APIs to operate on all available clocks")
> > Fixes: 8e3e791d20d2 ("drm/msm: Use generic bulk clock function")
> > Cc: Dong Aisheng <aisheng.dong@nxp.com>
> > Cc: Jordan Crouse <jcrouse@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Applied to clk-next
> 

Thanks

> And now I see that this whole thing needs to be inlined to the one call
> site and should use the struct device instead of calling of_clk_get()...
> I'll have to fix it later.
> 

I concluded the same, sorry for not mentioning it.

Regards,
Bjorn
