Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC7A70E12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 02:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfGWAVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 20:21:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41447 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfGWAVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 20:21:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so18172419pff.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 17:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P2jEpwGpnd2dP73asPYYWzs20ZqCHZiPzV1J2BDG/FM=;
        b=GK/SXbvV1Wr4pf7vNg3Pxg2AZOAZ2PQr0KDAiEQohcxjlEhg05Y19+//vNZ4xM6+7z
         jubrtTlH/DLGGDJHi9lqywuS9zv8WwTAV+0JLL/wkH1ZQJuBNYQ8099vIYZN1q2lHybo
         n8nJcMtxlQuyn+jP3BC2/Y31PmkTFIMJQlW8+roC/guCjBRhc2F+r/PQKv762R0xxTyp
         z6khMVNYg0QMSnumu6aqcf6tQCbUy/HqcA+aKQGJRIZN3yw6TEL2QEvjvyxU+xXAPaPM
         D+kmGuwTFeWket9xNOP1+F3knKSiWW4GnDJQR8X9NgnhMdVHDFcpa17XpKOPmxPsI3IU
         vN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P2jEpwGpnd2dP73asPYYWzs20ZqCHZiPzV1J2BDG/FM=;
        b=PGtD1Rr2gNlxcx8AhQS8ktsTuL7MYDbOIKH3mYGuDZlS9Ic97kyXBfSYbze75UpdhK
         7AuhOk4OqmxGG9rEU0nm/K+aJRGaxvQ878TUggmXdCpXvKunWhXgtwRDY8uHmQan2TTg
         NpbOuZpvYD7bMHBFFF2qN2p0nULlqVwvNumj3zmG0bROp/FQVc6rVWIL4nR9xO5wsOlc
         fD3Xq0kreRPnN1OW2xByJaYOGfE+INWfv1C9kXs8p7iu6B0mHiNnIhLbIJtlwQw5SFEQ
         BUNH24ieaezE58eOrnib7bc+CG4n64z+JwucUVNLgUtusPyXn0+igkA9XZEUe9InPhAm
         wTew==
X-Gm-Message-State: APjAAAVrnaWPIi4nUVf3f2/7lgr6EVroduRMFeHI0lF7hTkcd3zMciWN
        K6sYInTayRHjE+E6tz6niDbBZw==
X-Google-Smtp-Source: APXvYqz69KfsjPqZi5pU8mg3mc+WpiAvmeiznQoHXLdW/4Mc18ndLJOVa/fhWg2UAYXvlSiPScoojQ==
X-Received: by 2002:a65:690e:: with SMTP id s14mr60618843pgq.47.1563841292767;
        Mon, 22 Jul 2019 17:21:32 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x128sm71062102pfd.17.2019.07.22.17.21.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 17:21:32 -0700 (PDT)
Date:   Mon, 22 Jul 2019 17:21:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ian Jackson <ian.jackson@citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: Re: [PATCH 2/3] firmware: qcom_scm: Cleanup code in
 qcom_scm_assign_mem()
Message-ID: <20190723002130.GU30636@minitux>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
 <20190517210923.202131-3-swboyd@chromium.org>
 <20190722232719.GT30636@minitux>
 <5d364f2a.1c69fb81.e3ed.7bfd@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d364f2a.1c69fb81.e3ed.7bfd@mx.google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jul 17:04 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-07-22 16:27:19)
> > On Fri 17 May 14:09 PDT 2019, Stephen Boyd wrote:
> > 
> > > There are some questionable coding styles in this function. It looks
> > > quite odd to deref a pointer with array indexing that only uses the
> > > first element. Also, destroying an input/output variable halfway through
> > > the function and then overwriting it on success is not clear. It's
> > > better to use a local variable and the kernel macros to step through
> > > each bit set in a bitmask and clearly show where outputs are set.
> > > 
> > > Cc: Ian Jackson <ian.jackson@citrix.com>
> > > Cc: Julien Grall <julien.grall@arm.com>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  drivers/firmware/qcom_scm.c | 34 ++++++++++++++++------------------
> > >  include/linux/qcom_scm.h    |  9 +++++----
> > >  2 files changed, 21 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > > index 0c63495cf269..153f13f72bac 100644
> > > --- a/drivers/firmware/qcom_scm.c
> > > +++ b/drivers/firmware/qcom_scm.c
> > > @@ -443,7 +443,8 @@ EXPORT_SYMBOL(qcom_scm_set_remote_state);
> > >   */
> > >  int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > >                       unsigned int *srcvm,
> > > -                     struct qcom_scm_vmperm *newvm, int dest_cnt)
> > > +                     const struct qcom_scm_vmperm *newvm,
> > > +                     unsigned int dest_cnt)
> > >  {
> > >       struct qcom_scm_current_perm_info *destvm;
> > >       struct qcom_scm_mem_map_info *mem_to_map;
> > > @@ -458,11 +459,10 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > >       int next_vm;
> > >       __le32 *src;
> > >       void *ptr;
> > > -     int ret;
> > > -     int len;
> > > -     int i;
> > > +     int ret, i, b;
> > > +     unsigned long srcvm_bits = *srcvm;
> > >  
> > > -     src_sz = hweight_long(*srcvm) * sizeof(*src);
> > > +     src_sz = hweight_long(srcvm_bits) * sizeof(*src);
> > >       mem_to_map_sz = sizeof(*mem_to_map);
> > >       dest_sz = dest_cnt * sizeof(*destvm);
> > >       ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
> > > @@ -475,28 +475,26 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > >  
> > >       /* Fill source vmid detail */
> > >       src = ptr;
> > > -     len = hweight_long(*srcvm);
> > > -     for (i = 0; i < len; i++) {
> > > -             src[i] = cpu_to_le32(ffs(*srcvm) - 1);
> > > -             *srcvm ^= 1 << (ffs(*srcvm) - 1);
> > > -     }
> > > +     i = 0;
> > > +     for_each_set_bit(b, &srcvm_bits, sizeof(srcvm_bits))
> > 
> > The modem is sad that you only pass 8 here. Changed it to BITS_PER_LONG
> > to include the modem's permission bit and applied all three patches.
> > 
> 
> Ah of course. Thanks.
> 
> BTW, srcvm is an unsigned int, but then we do a bunch of unsigned long
> operations on them. Maybe the whole API should be changed to be more
> explicit about the size of the type, i.e. u64?
> 

It's a bitmap of vmids currently with access to the region and the space
has expanded since I looked at this list time, so the now highest
defined id in the downstream kernel is 42.

So it sounds very reasonable to expand this to a u64.

Regards,
Bjorn
