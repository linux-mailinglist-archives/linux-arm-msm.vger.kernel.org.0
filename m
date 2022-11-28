Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B579963AD88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 17:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbiK1QU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 11:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbiK1QUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 11:20:54 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52F0B7E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 08:20:52 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gu23so8945114ejb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB/MDsAyrTfDxbfwFpi7v9ob1ZeS88uoag9SCGEyi0g=;
        b=gap6/PEMlSFVcoD4M7/mMeS/+FbnSLroHAsUDRxbASrIxWgYTUKUihwqwoFmpHzXw+
         5GjFf7cOp03rcVcNkGNUZoIPqtNbHPx8hJX9bo5rxlYcSnVOgGrKltlfYrny0pFctp19
         NSzPfKVoXE4Dh/eSjDPUFqii3IYwMoCQbjbnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xB/MDsAyrTfDxbfwFpi7v9ob1ZeS88uoag9SCGEyi0g=;
        b=arv0qgO7mORm7WXznxTRPQDMdf8hYGdUIeAHodBdcnHodByEPJlQYVP/1xx4FNZsca
         VqKQvh2uGFj+OUydCUMpjT+CnHrT/b6qMP4yBEdvwj1c1AGRp+2R+iwS+pq3mIlgqKEa
         tG9VvneTEoWhwDAAgkzGYtulnVph09yfbUFTohCbGG3Eq4wWg93NUFYQkAu6kq2D6UEm
         qZ8kwb7oBULBOecSQeuwGkARhn4Ewjhx9Vi9P4HhQaz5bkl4D/aIF7brvjHWGns/mfUN
         xLQIw+XEg4aq8DrNeeITu+W99ye3TO5l40ZpgyUkQr1srKjEXQT73SGSdj75ZB8UhCD5
         1AYQ==
X-Gm-Message-State: ANoB5pm7A9dqoxA5jAbx+/dQ68PftQFEPMgHk1Kt8BrPKV8xF7wU0yTj
        uQ8fgvuV5GBYDbHieU916UKyeMWp4EZTDeGz
X-Google-Smtp-Source: AA0mqf72NmuKnO3J8ZORKIQb4E5QDgqOinFhMHNGYlOxsvHGFMgW0S1uT/9qnhupeN3jLh0pALk8wA==
X-Received: by 2002:a17:906:914f:b0:7bc:4d3e:66dd with SMTP id y15-20020a170906914f00b007bc4d3e66ddmr15539636ejw.624.1669652450488;
        Mon, 28 Nov 2022 08:20:50 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906328f00b007bd9e683639sm3302566ejw.130.2022.11.28.08.20.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 08:20:49 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id n3so17707674wrp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 08:20:48 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr185921wrr.617.1669652448598; Mon, 28 Nov
 2022 08:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid>
 <Y3zck7tPA5WFd0p1@google.com> <CAPao8GKpXcRm3PmWnv+rsr2z53r6J-ScXAq+fOi4ydQg_Gy31A@mail.gmail.com>
 <Y343IWgkli+y8HMn@google.com>
In-Reply-To: <Y343IWgkli+y8HMn@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 08:20:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4GzCnmgnAQMzCNpCxzxkZXWONt4gNVCHniRYE_uFVyg@mail.gmail.com>
Message-ID: <CAD=FV=X4GzCnmgnAQMzCNpCxzxkZXWONt4gNVCHniRYE_uFVyg@mail.gmail.com>
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

On Wed, Nov 23, 2022 at 7:07 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> > My checkout steps as below:
> > $ git remote add linux_qcom=C3=82 git://git.kernel.org/pub/scm/linux/ke=
rnel/git/
> > qcom/linux.git
> > $ git fetch --no-tags linux_qcom
> > $ git checkout -b <MyLocalBranchName> linux_qcom/for-next
> >
> > Is my=C3=82 code base branch still worng?=C3=82  Am I=C3=82 missing som=
ething?=C3=82
>
> My understanding is that it is best to base you changes on a branch like
> 'arm64-for-6.2' as the 'for-next' branch is re-created every time changes
> land in one of the '${area}-for-${version}' branches.
>
> No big issue in this case, just use the corresponding '${area}-for-${vers=
ion}'
> branch for future patches/versions :)

FWIW, I usually just use Bjron's for-next branch for stuff like this.
While the merge commits in the the Qualcomm "for-next" branch are
re-created every time, because of the way "git" works the git hashes
of the actual patches are the same as the git hashes of the patches in
the separate branches. All the patches in "for-next" should be ones
that are fine to base your patches on.

-Doug
