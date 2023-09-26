Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5707AF671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 00:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjIZWp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 18:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjIZWn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 18:43:56 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C98192
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 13:56:30 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c5cd27b1acso86550945ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695761790; x=1696366590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K+cA0vEenc1gqjUMM9wmqTHY3iLNBl/eCPHeoCPbd9o=;
        b=Kq/RuLeI1lsxBMQk6FTV9WLOxdyOooQs0Jb29yl0kLyXR9SBKICMctAwUj71b2pgSm
         l7Bd2Tie3PBRIhRmzsZWl4Q5kDzQuhoFiLsCdL/5p206FS+lSLbapfL6FAfzBXOc/yC5
         DK/VWMVnjYvxdWLKh7Lxf/MwA98AJBzNG4YH5uI57g8xKa3Jd1o71Wee2HNbFxiC9i5x
         S4bAbvDf70DVjeonBw77JLXtKLzEbI1rg4UyiSfPP1dLA/V+DDBmCiiAEXAL5k8t2F2T
         SkWpIclpLt8ElFDJZOamU3AMGOj2pjI7QUm9QYn4mCw6+DTCB2gEJ31l6uFT9Ke6TGW+
         fVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695761790; x=1696366590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+cA0vEenc1gqjUMM9wmqTHY3iLNBl/eCPHeoCPbd9o=;
        b=p3mg78q+6vFe9Zc0yABIQqBxXUI/aGOTu/QJ4hyRoCDf7Ua8EgiDtzvxLtJC/5MXX/
         SL51QyuzZnKSVLQ1rPncCdm/L8lb1e2RYBb91TppUTBAFUHgS/6pZLfag8C/a8ByBu/S
         8618NDNdNYSVqBlDtJrLf69CR1YiNm8WINxoL3EfeJD7r3IDgOoLLaDRT/qY+qVWA4aM
         8LC76FBAqd94BSqo3nprwPSasmeeOea6cUCRwtHvpM+ozii+aMcOZ36ejh/SrO5t2W1j
         xYKh3fiikbkDWIYx9B4LBArVOnbUIBVlSPGj8IN65TfEQlQmbdlHqbWqi6DbSUU3OLp8
         eA6w==
X-Gm-Message-State: AOJu0Yy5CGQctHC/AzrK++cpKDldNWD2RLCmzZg3y3F67jDX10oNLOV8
        yICiFiXyfchdR4Ms/IuqTOIVXA==
X-Google-Smtp-Source: AGHT+IHm1IEuFlvmqbG+rMZZJWspqFftAv9gQV/yoTCiylQnMNOAJue7sY122lWTZw0J/AV6+YyC/Q==
X-Received: by 2002:a17:902:c951:b0:1c3:a91a:627f with SMTP id i17-20020a170902c95100b001c3a91a627fmr12682196pla.47.1695761789886;
        Tue, 26 Sep 2023 13:56:29 -0700 (PDT)
Received: from google.com (55.212.185.35.bc.googleusercontent.com. [35.185.212.55])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902ce8d00b001bdb85291casm11445673plg.208.2023.09.26.13.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 13:56:29 -0700 (PDT)
Date:   Tue, 26 Sep 2023 20:56:25 +0000
From:   Carlos Llamas <cmllamas@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Elliot Berman <quic_eberman@quicinc.com>,
        Ingo Molnar <mingo@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Thomas Gleixner <tglx@linutronix.de>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Prakash Viswalingam <quic_prakashv@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Avoid spurious freezer wakeups
Message-ID: <ZRNFeXZ4tRbT7ws6@google.com>
References: <20230908-avoid-spurious-freezer-wakeups-v4-0-6155aa3dafae@quicinc.com>
 <ZRMEHb3_0Ku1UuK_@google.com>
 <20230926200238.GB13828@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926200238.GB13828@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 26, 2023 at 10:02:38PM +0200, Peter Zijlstra wrote:
> On Tue, Sep 26, 2023 at 04:17:33PM +0000, Carlos Llamas wrote:
> > 
> > This issue is hurting the performance of our stable 6.1 releases. Does
> > it make sense to backport these patches into stable branches once they
> > land in mainline? I would assume we want to fix the perf regression
> > there too?
> 
> Note that these patches are in tip/sched/core, slated for the next merge
> window.

We can wait, no problem. I just wanted to make sure we also patch stable
if needed. Elliot, would you be able to send a backport of your patches
to stable once they land in mainline on the next merge window?

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org

--
Carlos Llamas
