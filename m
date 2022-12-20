Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B311265218F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 14:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233191AbiLTN3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 08:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiLTN30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 08:29:26 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1AB1AF25
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 05:29:16 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3b5d9050e48so169224807b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oSclea5t/EHK831/eF1SrpTE7OWI2NY6v81C77Yofd4=;
        b=f46lShXy84IxgyYF2vHTjL6qsCkkxy1vWCjsdPNZic65rYaQvXJLtOt5Bz4mBCeC5x
         9aQLk6Nal4p+JV+OTbnsKIlKrNhtkdexFui3haEZs0Z/XDUcY8KJGQI9BYqM8Z1wpHtD
         1Ll9L4tUVkqh3Ta8yMBBnlEmWfakx5sL/ZoH8JosDnjBWUb03exbzacffGN5e5ZT1/8N
         Wmf25PmRGheEX8o3zqajCMCj6V0ilcsOExbQHRSyQtoXdT0Ku14PkNJnECGgUBX0Myrz
         dFwMZWUnChHZFC2UfZ2ZpTr3gQkSyyci96BvqQPjFcgJf8wQnHrx7ZhKjE294j15Hxge
         8o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSclea5t/EHK831/eF1SrpTE7OWI2NY6v81C77Yofd4=;
        b=r03AUsMOez9N+3mrq5Wq3JX1lIUCuicp/tN9Se0AifUmWq6ztNM01l2/gev3A0xzU/
         CyxFh2sdu/OuGy7bUoJTWH2bCa6Nf+GW0D+PkpsUCmqHpyrrdQozQvuy3/0YAl60zqiI
         HFns5gg9MBZKkdYPVIPpI70o5gvUaqC+pWusfOlrd85IzZbPrJo2McCPXOlhWCZ05DH9
         PtCEnPuC9Jxmc712LCMfUQHM2M8eBtnanCH9ruZE0yiMPhOOkD6gahndQPoMtSZVJkoA
         sFg4MHML8ZldFfUSS8Y0aucbcapjIsk1FGD1EBzLFl8O+dd+6AujI0Jcqx2zToXKgswb
         gZog==
X-Gm-Message-State: AFqh2kqMYzRl9pOVCvQN1d7qVQo4T+ZoF9zUOyIWSacJmyIPcLLllWQY
        IDbpVUQvbso3/2P7u89vcyFivzI9BP3mSBW2Lx6rVg==
X-Google-Smtp-Source: AMrXdXu10DMhqBX/4ZfrloHoabKd1riMpcrNEFyueUml0ffOGBeLAy+i49BhV5SAwdLzvY+/gPhP2PhFVcJtXGoRgi0=
X-Received: by 2002:a0d:e081:0:b0:3d6:2151:4038 with SMTP id
 j123-20020a0de081000000b003d621514038mr2104778ywe.418.1671542956095; Tue, 20
 Dec 2022 05:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
 <20221220024721.947147-9-dmitry.baryshkov@linaro.org> <78fd7174-9aa4-f067-72ca-514c8fb09ee5@linaro.org>
 <d0a6b9cb-f321-7d5b-5767-acd12cfd78f1@linaro.org> <5bd2c0cd-741c-8865-5f35-25baf6787480@nexus-software.ie>
 <5f4046df-906b-5673-81b9-ab37294ba443@linaro.org> <2ddd32c8-b69c-0da9-af5c-22a8cb8eaaf0@linaro.org>
In-Reply-To: <2ddd32c8-b69c-0da9-af5c-22a8cb8eaaf0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 20 Dec 2022 15:29:05 +0200
Message-ID: <CAA8EJpqDDi+U4QO9_B=gChbZgXT8hs1QeTtxAY2z3iUtekz4aQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] thermal/drivers/tsens: Drop single-cell code for msm8939
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bryan,

On Tue, 20 Dec 2022 at 12:34, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 20/12/2022 10:32, Konrad Dybcio wrote:
> > Mainline does not and will not (for the most part) care about
> > out of tree code, so cleanups of parts like this with no users
> > are wholly expected if your DT hasn't landed upstream (or has been
> > stuck in review for a long long time like it is the case with
> > various parts of 8939).. Keeping this old iteration is blocking
> > progress, as the other similar ones (that*do*  have mainline users)
> > are left in place just to be backwards compatible with old DTs
> > that may have been pulled from torvalds/linux by third party projects,
> > like U-Boot, *BSDs or something. Trimming away this now-duplicated
> > code will shrink the driver, reducing bloat for everyone that
> > compiles it in and doesn't use the 8939-specific path.
>
> I entirely take your point on duration Konrad but, I think we can be
> just a little more pragmatic and hold off on dropping working code and
> land the dtsi.
>
> We went to the trouble of upstreaming the enabling code for the 8939,
> the right thing to do, IMO is to finish off the job.

I'm pretty sorry to step on your toes here. It's up to the maintainers
of the platform and of the thermal subsystem. However I'd suggest
getting rid of this code.
Would me doing the dtsi patch for you to test on 8939 help you in any way?

-- 
With best wishes
Dmitry
