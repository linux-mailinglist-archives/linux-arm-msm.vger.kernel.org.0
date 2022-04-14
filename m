Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACFA501C05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 21:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343922AbiDNTi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 15:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245647AbiDNTi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 15:38:28 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5358EBB8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 12:36:01 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g16-20020a9d6b10000000b00601ded2a06fso1011987otp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vrx4+YHpwTNJHX0W7SZLGfsxXelpnrIdbXIV1qMsRYA=;
        b=FNCvhrKZ1koxe+nJvUVWxBru/9GyuOY9b8E8r0hf3n6ON6kfTimDW8le8lByjEtFtf
         +iSMxE37vrLmZovEZthCxMCxydpaBLkCjsaL7Gg9n5h4kHGhvCdV5f90FAXSNkJztpKL
         hY2D9Ka5RScPq6D3NXh9Y6FzeYd3l7H1w8mKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vrx4+YHpwTNJHX0W7SZLGfsxXelpnrIdbXIV1qMsRYA=;
        b=fWSktRzJ0Yho4KZDlNwWqkukmSp7at3kSfJhOI3AFL14u4PK8fV5YzO/Zk0t/e9WiA
         qKYRw1VXmwZj58PHRBLPmAGbxGj8AQvE0fhJyQi7tvd5e41mOIu6H17Zd+dNFxui4Br2
         Zk2KI8jJM4KheL8ENbY/vnPaVJvtoxQ5/r7uRXSFwIuO5MV5fYZSItuXtJXUqVPUYGgp
         SG0dwarD5iMORYv2vTLJLzf8/rA4RoBdfQuqFmEWu1SKBRGJPfv5ptDIoNQtoDOALDTu
         cI3S7zeW5bzwgnaqPIg+QxsKOpmh/+cV//1l7560EfP1K++0wT6T9QzTBGuLY3qRGK3I
         klCg==
X-Gm-Message-State: AOAM532FGBMkCMbjXhIEaQtg5nUOCIvVO/OutwKigeAFgbR+P49kcAXI
        HcZmf0lxnm++xTI6ue8uc+t83kpV8igAqYqCrFbg9g==
X-Google-Smtp-Source: ABdhPJzt7HXp3rGjm2KOxE4dqJ4CxfML+6PKKFDBEfBgmm0z0ihv0HjSSno3vFpnFtInHjukfDeWcWRfYkmMAkW928k=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1451061ota.159.1649964961126; Thu, 14
 Apr 2022 12:36:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:36:00 -0700
MIME-Version: 1.0
In-Reply-To: <0d8a0716-c8b8-a4f6-3e9a-924245dd97fc@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n511nbPrRCMx3E2De-htmR79vZr4ezSj13Gm1PbTGasC4A@mail.gmail.com> <0d8a0716-c8b8-a4f6-3e9a-924245dd97fc@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 12:36:00 -0700
Message-ID: <CAE-0n53UZf1sOjegMOSC_m-DiGtDxC-m=w1=9ZbW++J8zK9Omw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-14 09:34:55)
>
> On 4/13/2022 5:02 PM, Stephen Boyd wrote:
> > The subject is still misleading. It is fixing something. It may be
> > enhancing it as well but it is clearly fixing it first.
> >
[...]
> > I'd prefer this part to be a different patch. It can come after the fix
> > to ease backporting.
> >
> > Also, is there any response to Dmitry's question yet? I haven't seen
> > anything.
>
> Sorry, since our internal review does not like this approach.

The internal review shouldn't prevent you from responding to code review
on the mailing list.
