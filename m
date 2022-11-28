Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0DC63AE77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 18:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbiK1RIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 12:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbiK1RHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 12:07:54 -0500
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561851181D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:07:52 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id h206so8061033iof.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igPdFyjO35ZpKO+vYdPwkIUVgK4YYNs5Tn93PDEG5qo=;
        b=1kV/CGZkA6SEkoiCdpthX1jfoDqdmatvFTAMCE059d8XmuD7ZYaPfbwEXohkbp6a+r
         3hTyHByCfdUCX7S+MlPFFJGvmt5aPVjNJmKkowK3gESXO/RG3rON3+Jtq0ZwlCHB10Fp
         KmKae83usPpMN/8dpuda4dYSj4oYVg+U+IkXtZGqmf4Q3S3B0EFdgRgdofxJsWRse+Ol
         zT35/tTNivm3wD2GDgL96lE7+H30amAFUpDmljULYPDUNphBmqBM9NcNdyXyhucgRb6K
         5li7xcrngTl4AvXSGRCswYTQx98wYOgeA1cjmsGToBoP5hYeT91wRzNdEQ9CZrd/xnzN
         GEDg==
X-Gm-Message-State: ANoB5plDw7fciIH8GjUSd09DtADPBuFW6nU5PxgUq/KXdvZn8q6xRmzp
        nZEYCYc+OmhB5siCxh8ffGQzKg==
X-Google-Smtp-Source: AA0mqf6dZyZDdW7YMXoUdCdKsv4wcvFxNrCZ9SnWjpdxJctmmOaXVtUYw9WlNujpMLLqsz8mrCy7XA==
X-Received: by 2002:a6b:f616:0:b0:6df:2c14:f642 with SMTP id n22-20020a6bf616000000b006df2c14f642mr10368857ioh.43.1669655271371;
        Mon, 28 Nov 2022 09:07:51 -0800 (PST)
Received: from google.com (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with ESMTPSA id p7-20020a02b007000000b0037fbfe86e77sm4540557jah.3.2022.11.28.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:07:51 -0800 (PST)
Date:   Mon, 28 Nov 2022 17:07:48 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     =?utf-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Harvey <hunge@google.com>, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abner.Yen@ecs.com.tw,
        Gavin.Lee@ecs.com.tw, Vicy.Lee@ecs.com.tw, Jason.Huang@ecs.com.tw,
        Darren.Chen@ecs.com.tw
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Adding DT binding for
 zombie
Message-ID: <Y4Tq5DFoc0kWIjTb@google.com>
References: <20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid>
 <Y3zck7tPA5WFd0p1@google.com>
 <CAPao8GKpXcRm3PmWnv+rsr2z53r6J-ScXAq+fOi4ydQg_Gy31A@mail.gmail.com>
 <Y343IWgkli+y8HMn@google.com>
 <CAD=FV=X4GzCnmgnAQMzCNpCxzxkZXWONt4gNVCHniRYE_uFVyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X4GzCnmgnAQMzCNpCxzxkZXWONt4gNVCHniRYE_uFVyg@mail.gmail.com>
X-Spam-Status: No, score=-9.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 28, 2022 at 08:20:36AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 23, 2022 at 7:07 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > > My checkout steps as below:
> > > $ git remote add linux_qcomÂ git://git.kernel.org/pub/scm/linux/kernel/git/
> > > qcom/linux.git
> > > $ git fetch --no-tags linux_qcom
> > > $ git checkout -b <MyLocalBranchName> linux_qcom/for-next
> > >
> > > Is myÂ code base branch still worng?Â  Am IÂ missing something?Â
> >
> > My understanding is that it is best to base you changes on a branch like
> > 'arm64-for-6.2' as the 'for-next' branch is re-created every time changes
> > land in one of the '${area}-for-${version}' branches.
> >
> > No big issue in this case, just use the corresponding '${area}-for-${version}'
> > branch for future patches/versions :)
> 
> FWIW, I usually just use Bjron's for-next branch for stuff like this.
> While the merge commits in the the Qualcomm "for-next" branch are
> re-created every time, because of the way "git" works the git hashes
> of the actual patches are the same as the git hashes of the patches in
> the separate branches. All the patches in "for-next" should be ones
> that are fine to base your patches on.

I had minor concerns that occasionally tools might get confused it they
try to find the parent tree of a patch based on the unstable hash of
the merge commit in "for-next". Not sure if it is much of an issue in
practice.
