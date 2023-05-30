Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6A9716E7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 22:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjE3UPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 16:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjE3UPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 16:15:03 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BDD125
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 13:14:31 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-565cfe4ece7so46613757b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685477670; x=1688069670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n9PhFw6EqXKj/DjQH85Ps097cPd6lOxV2adiWzAyXMY=;
        b=RYm/9b5PO6rQQSGtGQZOBLzeWtNFbyYU77EJ7fUmDuVmOQ4XLHnBRwHZZK16Mby/So
         YUfoRAamjnl8byEisFFSkGyyS8IhIQVBDgt7uNkbfzyOyTuKE6pxUTpCspj+k5/uaFMi
         KIKjLyTalqP+S8LS7YQYbJqrxnD08AC9MpgZkUbEQ3OX0jb3m/6o3EUmrEeX0wVLoluP
         4shKvphiVSoP6CScSqnB4EtBFKhqCyZC5fLxZgbRSV5XejWLoFY7FWC2cce5o1Vm517l
         b+nYX75hfRm/pAi05Wz3ve7u6N1u+jgbwfmituJUm/+Os+LYjHeCbWIk7Eh0Bnp3vHqp
         tvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477670; x=1688069670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9PhFw6EqXKj/DjQH85Ps097cPd6lOxV2adiWzAyXMY=;
        b=SqcXdThj7Z4JrPeJABlV0LlKzj/YigMI01k8k/45Ej+/6RFhdEKCr7+xbr17IbclxP
         CdQpLzXwOvSAbDfu01x/YhOnOAJMDT5m+zmvE4BhA+WbABdzJvFkVNouZnGt6jM+3SQd
         rak2TZU9L3AcIeVcZRmtOXjsSa5hlLleXXd2QeXQ9zROAzGYfQg4W1EmDKdQzAZ5Oq4s
         DGQb3k4tlEYjh36nWRgVmvv1hFf3ZJYXtL6K248AGcwoZHSQcn/oO3SSM/OyvR65tb3s
         BoRr2+tdgapMqpr6oPCtPwRUcffdoE9MA/HavApvdIKVwADxdEpoIOZrH6mnpiRZQm0n
         /6oQ==
X-Gm-Message-State: AC+VfDysLkdodq9H+cWtAWVVNtJwhurEjEezWSKLbIeFEgRsasf9zc9U
        fBy9pSyL2cZ4+5+fSVS+nmwGgTgcUKRavGPuYeTbTg==
X-Google-Smtp-Source: ACHHUZ59cFtiwvOV4dMWsQ/BceJCxYHiJSRU7xd4rWZLxQAVVu325eR1vgGEksuIHWnmsEl+0Yvy5dpYVHm9Y/ZjG3k=
X-Received: by 2002:a81:c310:0:b0:561:7351:f56f with SMTP id
 r16-20020a81c310000000b005617351f56fmr3759086ywk.24.1685477670706; Tue, 30
 May 2023 13:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com> <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
 <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com> <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
 <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
In-Reply-To: <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 30 May 2023 23:14:19 +0300
Message-ID: <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Tue, 30 May 2023 at 20:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/29/2023 2:36 PM, Marijn Suijten wrote:
> > On 2023-05-24 12:18:09, Abhinav Kumar wrote:
> >>
> >>
> >> On 5/24/2023 2:48 AM, Marijn Suijten wrote:
> >>> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> >>>>> Drop SSPP-specifig debugfs register dumps in favour of using
> >>>>> debugfs/dri/0/kms or devcoredump.
> >>>>>
> >>>>
> >>>> I did see another series which removes src_blk from the catalog (I am
> >>>> yet to review that one) . Lets assume that one is fine and this change
> >>>> will be going on top of that one right?
> >>>
> >>> It replaces src_blk with directly accessing the blk (non-sub-block)
> >>> directly, because they were overlapping anyway.
> >>>
> >>>> The concern I have with this change is that although I do agree that we
> >>>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> >>>> times and it works pretty well ), devcoredump does not have the support
> >>>> to dump sub-blocks . Something which we should add with priority because
> >>>> even with DSC blocks with the separation of enc/ctl blocks we need that
> >>>> like I wrote in one of the responses.
> >>>>
> >>>> So the "len" of the blocks having sub-blocks will be ignored in favor of
> >>>> the len of the sub-blocks.
> >>>
> >>> The sub-blocks are not always contiguous with their parent block, are
> >>> they?  It's probably better to print the sub-blocks separately with
> >>
> >> Yes, not contiguous otherwise we could have just had them in one big range.
> >>
> >>> clear headers anyway rather than dumping the range parent_blk_base to
> >>> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
> >>>
> >>> - Marijn
> >>
> >> When I meant sub-block support to devcoredump, this is how I visualize
> >> them to be printed
> >>
> >> =========================SSPP xxx =======================
> >> =========================SSPP_CSC =======================(for SSPP_xxx)
> >> =========================SSPP_QSEED =====================(for SSPP_xxx)
> >
> > Yeah something along those lines, though I don't really like the `(for
> > SSPP_xxx)` suffix which we should either drop entirely and make the
> > "heading" less of a "heading"
> >
>
> I wrote that "for SSPP_xxx" to explain the idea, ofcourse it wont be
> part of the print itself.
>
> Without that, it matches what you have shared below.
>
>
> > ========================= SSPP xxx =======================
> > ...
> > ------------------------- SSPP_CSC -----------------------
> > ...
> > ------------------------- SSPP_QSEED ---------------------
> > ...
> >
> > And/or inline the numbers:
> >
> > ========================= SSPP xxx =======================
> > ...
> > ----------------------- SSPP_xxx_CSC ---------------------
> > ...
> > ---------------------- SSPP_xxx_QSEED --------------------
> > ...

I'd prefer this format. It eases grepping.

> >
>
> sure this is also fine with me.
>
> > Either works, or any other pattern in the title (e.g `SSPP xxx: CSC`)
> > that clearly tells the blocks and sub-blocks apart.
> >
> > - Marijn



-- 
With best wishes
Dmitry
