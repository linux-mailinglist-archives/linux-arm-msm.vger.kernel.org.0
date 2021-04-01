Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EB535193E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbhDARwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236431AbhDARtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:49:21 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4928CC02FEAB
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 09:16:28 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id m11so1792747pfc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T0rYie3R/Ll/Af9JkBaLcz+s5C8Xgvssk29GDuQKtVo=;
        b=hZTs4t39HPYJt8nFN3+uw+fFkJwWZQ+USL2SvOKmRHoMWJYlqMgchLE/jdrKEQcQm7
         gG67zb/7GhmqoLrWGHg/Yppb1uBDzTF4+FiwMtt71zoxlxDEOpkE6h66XxFp9l4QDcdE
         pOik5kwxa6cfUCHP7d0vnJwUPTSuG6/ydSUHmYcQwMtYti/RPWW9m9F1HQ+cvqZO7y6g
         vcsd0I9j/k/SQfuOIP2v5L4FHaNZcKbdeDIEDHbOc22oisyz2nLQzXyvKa9bg65dG5Ar
         m2g128D1RWoAMw08JIBItzjtBpzSKa6iZmzUxG1MYB410HY9xC1t9vYZnw8gRJJ3KZju
         BFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T0rYie3R/Ll/Af9JkBaLcz+s5C8Xgvssk29GDuQKtVo=;
        b=R9TcF9iqC7bMfPE0/2H3J28uKIlfdC1MhecJvGdzz90T1BDEi8ib0CwmNz3rlzwQ0w
         qJWEeOQ0Pfd7M7sUAjreik0DSqeGveGLP0qxhQsL7KsJYmVCtanJbmCVoW9IU+cQU7K0
         yxsniI0JJfUFJu5Q4Kr213fxmOQDNGDiWkJAHDvtJN7d072QIRzf3ZC9AvC69cwPwwrJ
         WeUmbYvGBNcrEqUZxyWU1OekspSyDLoRbZyUfdKvJ/QAIHiUpdFciEr4eYOJh8wZ3/7I
         thO/VwwKPPDK20BvRCFwgFN3SXk6UMh16BhfEGX8nXmqV3Lbz1q4mSSlkDrhSvFbnwUb
         GCkQ==
X-Gm-Message-State: AOAM532v5l5vn8HA6QHgFRLWPtqPBzTiFXPpme6wpAygzA8AqkdP9RfV
        ZiJukMslj6sIMfTy+bd8IJto
X-Google-Smtp-Source: ABdhPJzRfPJ4ww9afESIc0EdZwAUVJbhKldoXwCOD5bB0LhtoJSQ3txH5Jvp0nJUZlBjYBX4u6rxEg==
X-Received: by 2002:a63:c741:: with SMTP id v1mr8045403pgg.207.1617293787509;
        Thu, 01 Apr 2021 09:16:27 -0700 (PDT)
Received: from work ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id t18sm6174736pfq.147.2021.04.01.09.16.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 09:16:26 -0700 (PDT)
Date:   Thu, 1 Apr 2021 21:46:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v10 3/4] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401161622.GH14052@work>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
 <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
 <20210401175421.65db63bf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401175421.65db63bf@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 01, 2021 at 05:54:21PM +0200, Boris Brezillon wrote:
> On Thu,  1 Apr 2021 20:49:54 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > @@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> >  
> >  	if (!chip->bbt)
> >  		return 0;
> > +
> > +	/* Check if the region is secured */
> > +	if (nand_region_is_secured(chip, ofs, 0))
> > +		return -EIO;
> 
> That would is still wrong, you should never pass a 0 size to
> nand_region_is_secured().
> 

Size doesn't matter here, that's why I passed 0. Maybe 1 would be
appropriate?

Thanks,
Mani

