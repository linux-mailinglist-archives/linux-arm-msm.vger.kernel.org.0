Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC04C6E5D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 11:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjDRJK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 05:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjDRJK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 05:10:28 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85DADD
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:10:26 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54f21cdfadbso397925257b3.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681809026; x=1684401026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sIdLuh0YsEXFhwNIbAtHDqpsY5fap9VloDpWQIFGF4U=;
        b=HosxURX3ChbwZKNn4YKQtISwq82SPHNlHvU8+KQZ1TEkHlYSdwkEaq5scPHbCl4xfi
         Bn9K+Aq8rHGOFtRfFAX/W/jNlA4OEbM3RcKWpfeQg49Tz04TjDhfAAagcTbiN+7QbE12
         axNbUDmR2CwEh2pfVHCZQOC5/sIrtY5ksZBXHQR6EXNAdOAE2jENQNQs2Nfg4u/QCLBf
         DV3HRBDBozCNC6QdYCLkYPYNkIm23y7gtAivT3NTsN50XOwrR+dWwGY9guId5dwq7gWx
         M75rPtPkAmpBcGdTABTXYhOzWmb3V/ic1+DCAo0lrFzBgv3XDlIqoLHtxpL9C6jIImma
         izPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809026; x=1684401026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIdLuh0YsEXFhwNIbAtHDqpsY5fap9VloDpWQIFGF4U=;
        b=FgrViciZh90CF9SlYZWqWmp0/1LHwWrZhIu0VTO/89mUW4zDL9lqjGuUQR+9UIjjmm
         q5zeW+vC6uFyW3QKCs1a9pWfT4p039dGrucp8JwtRW4m4CqGMiDhLZooBROWl9OwVwkU
         xRHEgypP0hxpHyFCZoHBJKpz8UR44S4c5G8ubJ8oW9tkbQWxCsZ7Ckc8JjctJzc5G5bn
         OS/Od+W926r9Giv6GlBxLRpDkFaDXicxhWYmX118gyzi5VY9+TxTTUMFRlTAgEE6fFtt
         g87CvGo8ON9e48WtXFFZMUj/ybQTIFE7dX0ibwOV0mOMWf0nYebZ38IqwC2Vbjh5Wk1B
         3zrA==
X-Gm-Message-State: AAQBX9eK2XCXCnYwUNKYBTSlhtZ1EWGRsOPWj1GZj9ibFjpHppImz//k
        Cznk0age225Ka+YA1nvzpbEFJZYXOEpl7JVEJTZ6V0chH5LFyJaU
X-Google-Smtp-Source: AKy350baYiQUbT4k6ozDbpWs1GqPpRg4luYmX8oNyF2aGUcFzmagNtslM3QDJSesiOtxgceK3fvS/HN1TDH2ygSBaB8=
X-Received: by 2002:a81:4f09:0:b0:541:66e8:d4da with SMTP id
 d9-20020a814f09000000b0054166e8d4damr16184276ywb.29.1681809026050; Tue, 18
 Apr 2023 02:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230413064344.18714-1-quic_tjiang@quicinc.com>
 <CAA8EJpoc4nn+Wr131-o=YQoDeL0t7aj9hC=8NNnJa3SeHwgJ-w@mail.gmail.com>
 <934c32ef9427464a9d0b898b843df6ab@quicinc.com> <CAA8EJpqz9o9CtAnXRE86kw-cfL=_d-c5BDAXwQLSJAyZRy_fEg@mail.gmail.com>
 <a908e04e9b7d4b97bc6b5ee3c713e71f@quicinc.com>
In-Reply-To: <a908e04e9b7d4b97bc6b5ee3c713e71f@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 18 Apr 2023 12:10:15 +0300
Message-ID: <CAA8EJprztGdP0yqV=O6P2tn4i0+iQ4rfBVY2x-3_93o3C0c-Nw@mail.gmail.com>
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Apr 2023 at 12:07, Tim Jiang (QUIC) <quic_tjiang@quicinc.com> wrote:
>
> Hi Dmitry:
>
> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Tuesday, April 18, 2023 5:03 PM
> To: Tim Jiang (QUIC) <quic_tjiang@quicinc.com>
> Cc: marcel@holtmann.org; linux-kernel@vger.kernel.org; linux-bluetooth@vger.kernel.org; linux-arm-msm@vger.kernel.org; Balakrishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Hemant Gupta (QUIC) <quic_hemantg@quicinc.com>; mka@chromium.org
> Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
>
> On Tue, 18 Apr 2023 at 04:02, Tim Jiang (QUIC) <quic_tjiang@quicinc.com> wrote:
> >
> > Hi Dmitry:
> >
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Saturday, April 15, 2023 5:03 AM
> > To: Tim Jiang (QUIC) <quic_tjiang@quicinc.com>
> > Cc: marcel@holtmann.org; linux-kernel@vger.kernel.org;
> > linux-bluetooth@vger.kernel.org; linux-arm-msm@vger.kernel.org;
> > Balakrishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Hemant
> > Gupta (QUIC) <quic_hemantg@quicinc.com>; mka@chromium.org
> > Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump
> > support
> >
> > On Thu, 13 Apr 2023 at 09:44, Tim Jiang <quic_tjiang@quicinc.com> wrote:
> > >
> > > WCN6855 will report memdump via ACL data or HCI event when it get
> > > crashed, so we collect memdump to debug firmware.
> >
> > Is it applicable only to wcn6855 or to some of earlier chips too?
> >  [Tim]  Also applicable to earlier chips , but currently google only
> > require us to support wcn6855
>
> Since upstream is not a google kernel, please enable this feature for all relevant chipsets.
> [Tim] agreed , but the title of this gerrit unchanged,  I raise a new gerrit for other relevant chipsets , is OK?

There is no gerrit here.

Also, is there any chance you can fix your email client to stop
putting old headers at the top of the email?

>
> >
> > >
> > > Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
> > > ---
> > >  drivers/bluetooth/btusb.c | 222
> > > ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 222 insertions(+)
>
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
