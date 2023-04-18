Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E4C6E6A57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 18:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjDRQ7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 12:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjDRQ7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 12:59:46 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D744A5F7
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 09:59:18 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54ee0b73e08so468900417b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681837157; x=1684429157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I5BoHjzh5rBSSzb7StjjnexOes7wzu8euGACPMkr2GY=;
        b=eqYD/URwhX35iRgJ4a3HVzl+qMfvJwvdjIneaPqGpXpDHjiknMlVgH+VtguSmUe5bJ
         KO/Qbz9VpY2sgqP0kqRaeV23WiY7FAu+hw/w+x+GvzixUOLekfwDsQVsLLQF8rNK4eMy
         7TpRROLXR4dOFkFUvVPeqRufzp8aHV8B+CV0C3Un0cIbvoTHDXqwCRmMXEQVMNRtBDXY
         m1JZkfBLubEFxxIKibzPCJKJrqM0mE/5fpjRwXMb1fHyrfmtcrGydJzoXhSNkARvbMAv
         VizaMBgmKG9bBtGG6iDQyAOtwO4WyIlfp6R+Xc/jPl8vkgFppk6AOcuR/3T8Km1QLU4z
         pbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681837157; x=1684429157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5BoHjzh5rBSSzb7StjjnexOes7wzu8euGACPMkr2GY=;
        b=JpVxPLnCxjxlsqLEXn5hAW9+eSb1EGjOf6/d42Mx4P7AzpAuNwGwBQ504DvEh8amnw
         gMWEYENUavFZ9Y1Q7jPr5UqImWywTY48dSM6rJyXEITsLvT/E/LpQd+hqMb3jkL9tJ46
         nJ3FAXn5bpLSjr7WiihMIpOQcQdzXlenx38tFxodF0xWaqxGTWX2Dux4ajxELsJMWUHd
         LMYApoCCq8x0qGJtgWG5KExHLqXoQ0VTIOuhnpIG19uWtPbX/ZIfBS8Vsb3H37gfnOFp
         Aa0ulMyPqf2fiAwXSBhjmHK+WH+7JkiUpWnVHqV4E+/4Zns5zBqQth19HKKtSwCWy+Sl
         Zf1w==
X-Gm-Message-State: AAQBX9eszC0tY3v27/2x91nJcGltZsfeNevYY+AxnvhaY71XrYlEq8T6
        PH3K546d57F9Guxh41fS8Y98B2d23DJVtni/Qf+kGA==
X-Google-Smtp-Source: AKy350bzQ33cg8zJDJunRtI4zCoYkJITmUbI173QhQIbng9/cAwK0hVcTy57kk+qR5iL3unAXMdwlZ8T2DrdhrWHXjU=
X-Received: by 2002:a81:83d2:0:b0:54f:6f65:f242 with SMTP id
 t201-20020a8183d2000000b0054f6f65f242mr635574ywf.13.1681837157452; Tue, 18
 Apr 2023 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230413064344.18714-1-quic_tjiang@quicinc.com>
 <CAA8EJpoc4nn+Wr131-o=YQoDeL0t7aj9hC=8NNnJa3SeHwgJ-w@mail.gmail.com>
 <934c32ef9427464a9d0b898b843df6ab@quicinc.com> <CAA8EJpqz9o9CtAnXRE86kw-cfL=_d-c5BDAXwQLSJAyZRy_fEg@mail.gmail.com>
 <a908e04e9b7d4b97bc6b5ee3c713e71f@quicinc.com> <CAA8EJprztGdP0yqV=O6P2tn4i0+iQ4rfBVY2x-3_93o3C0c-Nw@mail.gmail.com>
 <11d65b0864b142ffb92255318ce70c45@quicinc.com>
In-Reply-To: <11d65b0864b142ffb92255318ce70c45@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 18 Apr 2023 19:59:06 +0300
Message-ID: <CAA8EJpog4Oqzz8MWvwwYAzH91zy=UwskhTjF7ZO5or3citA9kw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
To:     "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
Cc:     "marcel@holtmann.org" <marcel@holtmann.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>,
        "Hemant Gupta (QUIC)" <quic_hemantg@quicinc.com>,
        "mka@chromium.org" <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Apr 2023 at 12:16, Tim Jiang (QUIC) <quic_tjiang@quicinc.com> wrote:
>
> Hi Dmitry:
>
> > > On Thu, 13 Apr 2023 at 09:44, Tim Jiang <quic_tjiang@quicinc.com> wrote:
> > > >
> > > > WCN6855 will report memdump via ACL data or HCI event when it get
> > > > crashed, so we collect memdump to debug firmware.
> > >
> > > Is it applicable only to wcn6855 or to some of earlier chips too?
> > >  [Tim]  Also applicable to earlier chips , but currently google only
> > > require us to support wcn6855
> >
> > Since upstream is not a google kernel, please enable this feature for all relevant chipsets.
> > [Tim] agreed , but the title of this gerrit unchanged,  I raise a new gerrit for other relevant chipsets , is OK?
>
> There is no gerrit here.
>
> Also, is there any chance you can fix your email client to stop putting old headers at the top of the email?
> [Tim] sorry for confusion, I mean I will raise another new change for other relevant chipset, is OK ?

I'd suggest using a single patch.

>  and I use office 365 to reply your email which will adding old headers automatically , unless I delete the old headers manually, thank you.
>
> >
> > >
> > > >
> > > > Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
> > > > ---
> > > >  drivers/bluetooth/btusb.c | 222
> > > > ++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 222 insertions(+)
> >
> >
> >
> >
> > --
> > With best wishes
> > Dmitry
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
