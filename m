Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B854D63B1A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 19:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiK1SwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 13:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbiK1SwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 13:52:04 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA3815FC7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 10:52:03 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id n21so28176152ejb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 10:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4onFK9mmn1PH3tAtZYrIxWVG00vIN2pNwdT/8GjGTW8=;
        b=FjWlQ9WkBv5X/hTCQYrVCCSn4D0e91YLvqgatw2uxx8/aFRvqqaC0hM6QJ8bMIuOUh
         Mpse1m7Zzo4Q57c+7dhSHpHYH+rn51LAIMslaFcyIW/8FZE7wKmVfiBmYXe45h5s9kej
         3be/0LYze6WJBt4yU3quhiiYzKWpx3klmqHEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4onFK9mmn1PH3tAtZYrIxWVG00vIN2pNwdT/8GjGTW8=;
        b=cSSPvsOLjcmlosY3jlFXsJnXJKkw+corN+EvNkWKHmF5zIUHZShpjvP4Es3euLcXjU
         NpB5ssIMgq5dqkm/sgR4/Z1gdt0jbkGdyrIDwU4abGvSdKUns7xoNAJhtNV3HE8Pf+Jv
         i9TcCPwlIP43P63L8lGcAqk8+DLksXrnnVyI2EtGVjPhDuagDDmMDSOEE6cH8wCqQsPh
         PD2XhoM8JwQzLqdic16FPqnt46Ef7WJTUAk5GI36zZ1bba4MCddQ3peBPJAthypRhMtF
         0Ot7Y/uCQW1fwvEmDtedpNdKMhM1mLnvnYTJQMEqEdw9wDreQPRNbulGTM2YktSnRwNB
         CtPQ==
X-Gm-Message-State: ANoB5pmqaGF8GcTbKUB+l3xsrNgOcA1vxbn9QrFZjaMZQGNLHQ4lenOz
        ltZ6prq8cMzQDxpQMEopPsfw08p0iMilTYMu
X-Google-Smtp-Source: AA0mqf5a1xwd/Wkc3lp0odPy/W4XFYf+7Y/c6JFmfKmVA4bCoM5kTEh/nqECUCGdHuY1LBsvTJBqqg==
X-Received: by 2002:a17:906:b84e:b0:7bc:85aa:4e49 with SMTP id ga14-20020a170906b84e00b007bc85aa4e49mr15477088ejb.554.1669661521049;
        Mon, 28 Nov 2022 10:52:01 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id q25-20020a17090676d900b007bf24b8f80csm2201904ejn.63.2022.11.28.10.51.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 10:51:59 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id z4so18466239wrr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 10:51:59 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr32461837wrj.583.1669661518579; Mon, 28
 Nov 2022 10:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid>
 <Y3zck7tPA5WFd0p1@google.com> <CAPao8GKpXcRm3PmWnv+rsr2z53r6J-ScXAq+fOi4ydQg_Gy31A@mail.gmail.com>
 <Y343IWgkli+y8HMn@google.com> <CAD=FV=X4GzCnmgnAQMzCNpCxzxkZXWONt4gNVCHniRYE_uFVyg@mail.gmail.com>
 <Y4Tq5DFoc0kWIjTb@google.com>
In-Reply-To: <Y4Tq5DFoc0kWIjTb@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 10:51:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UBQjKhqYsfd2bGe0JVQ_SsxQ8aHVqSJnjLa2oJavP0QQ@mail.gmail.com>
Message-ID: <CAD=FV=UBQjKhqYsfd2bGe0JVQ_SsxQ8aHVqSJnjLa2oJavP0QQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Adding DT binding for zombie
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     =?UTF-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Harvey <hunge@google.com>, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abner.Yen@ecs.com.tw,
        Gavin.Lee@ecs.com.tw, Vicy.Lee@ecs.com.tw, Jason.Huang@ecs.com.tw,
        Darren.Chen@ecs.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 28, 2022 at 9:07 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Mon, Nov 28, 2022 at 08:20:36AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 23, 2022 at 7:07 AM Matthias Kaehlcke <mka@chromium.org> wr=
ote:
> > >
> > > > My checkout steps as below:
> > > > $ git remote add linux_qcom=C3=82 git://git.kernel.org/pub/scm/linu=
x/kernel/git/
> > > > qcom/linux.git
> > > > $ git fetch --no-tags linux_qcom
> > > > $ git checkout -b <MyLocalBranchName> linux_qcom/for-next
> > > >
> > > > Is my=C3=82 code base branch still worng?=C3=82  Am I=C3=82 missing=
 something?=C3=82
> > >
> > > My understanding is that it is best to base you changes on a branch l=
ike
> > > 'arm64-for-6.2' as the 'for-next' branch is re-created every time cha=
nges
> > > land in one of the '${area}-for-${version}' branches.
> > >
> > > No big issue in this case, just use the corresponding '${area}-for-${=
version}'
> > > branch for future patches/versions :)
> >
> > FWIW, I usually just use Bjron's for-next branch for stuff like this.
> > While the merge commits in the the Qualcomm "for-next" branch are
> > re-created every time, because of the way "git" works the git hashes
> > of the actual patches are the same as the git hashes of the patches in
> > the separate branches. All the patches in "for-next" should be ones
> > that are fine to base your patches on.
>
> I had minor concerns that occasionally tools might get confused it they
> try to find the parent tree of a patch based on the unstable hash of
> the merge commit in "for-next". Not sure if it is much of an issue in
> practice.

It's a fair concern, but I don't _think_ it matters. I think git is
smart enough to handle this in nearly all the cases and I think the
cases where git can't handle it are cases where (perhaps) the for-next
was the correct thing to use anyway.

As a test:

atop for-next:
echo "foo" >> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
git add -u
git commit -m "add foo"
git format-patch HEAD~

atop arm64-for-6.2:
echo "foo" >> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
git add -u
git commit -m "add foo arm64"
git format-patch HEAD~

If you diff the two patches created, you can see that they both
contain "index" line. In my case:

index 65601bea0797..b5c9f39737f6 100644

That appears to basically just show a hash of the affected file both
before and after your patch. The merge commits and commits to other
files don't affect this. Specifically, you can see this before making
the change

$ git hash-object -w arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
65601bea07972e75cd1ac880bd43aa3dac62fb76

...and after making the change:

$ git hash-object -w arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
b5c9f39737f67e9ba0a115355ecf95df9a04dba7


So tl;dr is that as long as the files you're touching are identical in
"for-next" and in a specific branch (like arm64-for-6.2) that the
patch files created will actually be exactly the same because all they
contain are the object hashes. You could also imagine the files being
_not_ exactly the same. If two different branches touched the same
file and were merged into "for-next" then it could make a difference.
In that case, though, it would still at least be a plausible choice to
post it against the "for-next" branch because that should represent
the final state.

-Doug
