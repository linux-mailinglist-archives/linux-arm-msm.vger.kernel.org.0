Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDAD0421BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 03:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhJEBTp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 21:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhJEBTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 21:19:42 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B045C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 18:17:52 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v10so24000637oic.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 18:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
        b=j+McTh5xfKHvrsJdmlG/yhTupZ+rcdzKeHReBzcH/jlLl72oa1rOvM00PCQWPaVdYC
         22ECc8DMmYf7ZlrCGWGnmIpgW32iKqfbiL6qfO36V02wstCKYAEyFe1ZgDvVxkYOA9ZX
         Y2m+6bhS0klquWQRUC50h15O86r7fipHYxmrJP/7mT6Lz7/IolgDCX9jTX10842uDgPQ
         QJutAmWSRoZ6Zjgx4NT0hmZxnR73+PqKgIgcw/u6yMe5yKz5zbRDVLI19bItUwCBptBn
         iHKEiHYMPd6EyUaoDDEa9gPiB3dKx96Nh7ue9kGfvDGRuvz2X5wWQTCYXsRAWgdpayHa
         +VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DyHwOCOA8BVm3fIYmBKTBAquJnq6mmMC7RLAt62EphM=;
        b=HXdhJRMvKbQBxf/SdiQiDZD7V4HOaxYeOj23zlbUy39okncuu4wEe8dHTPceaPf/uF
         8GAPa+gwr43Jm8D3noSA1Lb3tPArRPODRTEteaWHFi35uE6ZbceJIpNFy0sfHql86+dn
         JNcyp8LBRaCjjAhKDdAdEgpAkjGjoUfd4S1zlIrg6CdPUk3jqpgkyEGuDhZ9ZwSMmsAW
         cmHLTCYoBTfiav0VuGvjE1C2NcLxv2ruX++E448XiY4zt2wTaac5aEKK2FUbDcpc84/N
         f8PSZUCsMN0BOjD5c14sIoowela3Nn+MrGtIzPieQSb7qbN0w6jJx5g5S4ff+MurkuCB
         cX7g==
X-Gm-Message-State: AOAM532EG4LFjCNwtWp2bw/2Zmn0vvgKFn72e8WRKq/DkIJ0SJP4vNih
        8UQDSaLq1INMYXtp1mWyqdrkJA==
X-Google-Smtp-Source: ABdhPJwmQ7OVkAOxHeWgbzi4LvP7Fh8PsrcgGBo70cF0RyffToZ8fe55VvlWng17Yi5qBj2+JaHZIw==
X-Received: by 2002:a05:6808:2128:: with SMTP id r40mr279140oiw.24.1633396671777;
        Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id z10sm3263522otq.64.2021.10.04.18.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 18:17:51 -0700 (PDT)
Date:   Mon, 4 Oct 2021 18:19:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
Message-ID: <YVuoJgquTnCYviRo@ripper>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
 <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Oct 18:04 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-01 10:43:58)
> > In order to deal with multiple memory ranges in the following commit
> > change the ioremap wrapper to not poke directly into the dss_io_data
> > struct.
> >
> > While at it, devm_ioremap_resource() already prints useful error
> > messages on failure, so omit the unnecessary prints from the caller.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> I realize this will cause some prints when we use old DTs. I suppose
> that's OK though because we'll have more incentive to update existing
> DT.

The use of the current binding is fairly limited, so I think that makes
sense. Abhinav also requested earlier that we do that and drop the
fallback sooner rather than later, which I would like to see as well.

Thanks,
Bjorn
