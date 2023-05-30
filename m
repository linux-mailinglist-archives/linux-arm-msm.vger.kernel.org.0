Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3426D717187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 01:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbjE3XS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 19:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjE3XS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 19:18:56 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2A5E40
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 16:18:27 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-52867360efcso3252628a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 16:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685488704; x=1688080704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ch+QGZuDvVPqFvut3Fm3+Q/Pf0opluuawwoMyLnyLA=;
        b=CTfNkSMXbEuK4v0Su6woV8ktAXJIQa0eTx8ShMV1zqZYDaGUCjkWgXoC+I5KwLCiK4
         z4XtcGo2+1Dr6TPHsdz70M/hGLkKC/EEBRHBrsnzVukFWrelsdajx1aHIosqntKkhD8f
         dBXmMMZP2oDxGKA0lIrgm8sZVo9Y7M5yRS9o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685488704; x=1688080704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ch+QGZuDvVPqFvut3Fm3+Q/Pf0opluuawwoMyLnyLA=;
        b=RffIxiJBnmR1EmM29pYMwtUFHz8LgIaLxdf5CrwOuV8Q+v29yWpcS5x85FxCv6bHG6
         Upk4xQiUTGcGt0e8vd6L89+XGCIuOyk7CELR84kr1eY7ypR3N7u7S0R87bqDKHtyNWEr
         dSurXsspL4SsYy/Ag+8oAIIcn/wxvrKgGHX67iIYS06jO5zFK+bNjkIoNrqqy7kcDELr
         T6c4Gi2lhTN+SyvyA9pkPBPay3jMTpHYLNwkMyJSUnFPCF1k1f2BgN8vzHoffNbSZO0W
         imiYK051/3YxDk6V/YQfbIwRnTgKDXRhZTXNVSzTk0fJa6o9RQI9QZtKZb1pgyfoLBK5
         mIRA==
X-Gm-Message-State: AC+VfDw/aBsBGGElUEi9TYh2SYVsx4KTGNgm6CVVoYpz/pk2PS224MZ1
        KBcj6VQ5/ZPXue/jozJdLD+5kxvgpbrNGPqgY64=
X-Google-Smtp-Source: ACHHUZ4sNV8/Cu4fg7LbHNMOQJaXy+dGJJoOgpGk7rq+5bd5EcGtaOkMVMSxm44jUL2Odl7n17M/iA==
X-Received: by 2002:a17:902:ce81:b0:1aa:86a4:37ed with SMTP id f1-20020a170902ce8100b001aa86a437edmr4226230plg.55.1685488704705;
        Tue, 30 May 2023 16:18:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b00199203a4fa3sm10866444plk.203.2023.05.30.16.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:18:24 -0700 (PDT)
Date:   Tue, 30 May 2023 16:18:23 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Johan Hovold <johan@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] lib/ucs2_string: Add UCS-2 strlcpy function
Message-ID: <202305301617.4858B5672@keescook>
References: <20230528230351.168210-1-luzmaximilian@gmail.com>
 <20230528230351.168210-2-luzmaximilian@gmail.com>
 <202305300820.9B2154B@keescook>
 <3255010d-82d5-e8e8-2e11-7de25d538d72@gmail.com>
 <CAMj1kXGy1hfEyHBNmPkBFeGF9W5zx=+8z5deH3E7usdsHHB2=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGy1hfEyHBNmPkBFeGF9W5zx=+8z5deH3E7usdsHHB2=A@mail.gmail.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 30, 2023 at 06:17:35PM +0200, Ard Biesheuvel wrote:
> On Tue, 30 May 2023 at 18:15, Maximilian Luz <luzmaximilian@gmail.com> wrote:
> >
> > On 5/30/23 17:25, Kees Cook wrote:
> > > On Mon, May 29, 2023 at 01:03:48AM +0200, Maximilian Luz wrote:
> > >> Add a ucs2_strlcpy() function for UCS-2 strings. The behavior is
> > >> equivalent to the standard strlcpy() function, just for 16-bit character
> > >> UCS-2 strings.
> > >
> > > Eek, no. strlcpy() is dangerous in multiple ways[1]. Please implement
> > > strscpy() (i.e. use strnlen(), negative error on truncation, etc).
> >
> > Right, make sense, thanks. Somehow I missed that the kernel has a better
> > function than the C stdlib for that...
> >
> > > Additionally, it'd be nice of the ucs2 helpers here also implemented the
> > > rest of the CONFIG_FORTIFY_SOURCE mitigations (i.e. checking for source
> > > and destination buffer size overflows at compile-time and run-time with
> > > __builtin_object_size() and __builtin_dynamoc_object_size() respectively).
> >
> > I can certainly try that, but I think this might be better suited for a
> > follow-up series, given that we then should also add those to the other
> > helpers.
> >
> 
> Agreed. Let's log the followup work as a kspp work item, no need to
> make that part of this series.

Yeah, that's fine. Can you please open a KSSP issue for it so we don't
forget?  :)

-- 
Kees Cook
