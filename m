Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBD5523D33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 21:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346682AbiEKTMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 15:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345686AbiEKTMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 15:12:40 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E13E77F38
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:12:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g23so3614181edy.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
        b=eCbRkCpG+1uv8o7qRy4S8ofMtbzrfrNObimViXJYOfvi54JNTAr6JFhhlnpgtpAcS+
         VN1OH3CnIDFz9Ap8QJJbmVusIA88+j05i4dmbpolhuHRtJjOf6pV7NrV6W8AIKtloJuO
         Epo1XPPLAfd3d4t/rIpKYoMleVpcQa62xi+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
        b=LnBA14Azdmfg9KRbxX+hcTYkKOfMoJKk4UblfZQwJjtIaS3VMiyx+57k7HqCUQWzbV
         ViH9ws/AHCQHgvpNn0pBB9EXRj/6IpECG7L5LO8TZoyztRWqUjE645HzNJV4ezWznPrV
         gbDefEEo3m9D2s3cLy5kRB3dJWqhfsUm6r2Hl2oi/tEzOpJrxTeWNJT/CijD2ZvPaIzL
         pYmAc2Tuuhs/QLukN1J6CrSnKjkzZGJAIgIljFoy23QzorhRK504nItMynw+QIb1JNUk
         P3XRg1wDYEeGb0Ky9f7QJZ8xPihyot6BVf6hXcrNa7Bquch0oe+pz3B9qsi6j9OsmPcA
         lHCw==
X-Gm-Message-State: AOAM530hvqkzHt2RgpJDlCPzyFpVdh0s9qGDpDjEM/zlPjqxAeEMog+i
        lp64+Wt+8wuSyjTUI2V5r02oC+oxjg+Zumlc8SY=
X-Google-Smtp-Source: ABdhPJwfJekXwKPQ8d58XJMzlXXduToQ9wOqy19e8fvf1kC4HOexIIPvnH2W4n29/Y3X+Ty3tIvu+Q==
X-Received: by 2002:a50:9ecc:0:b0:428:73bd:4667 with SMTP id a70-20020a509ecc000000b0042873bd4667mr26852475edf.165.1652296355905;
        Wed, 11 May 2022 12:12:35 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7c149000000b0042617ba63a8sm1493892edp.50.2022.05.11.12.12.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 12:12:35 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id t6so4304017wra.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:12:34 -0700 (PDT)
X-Received: by 2002:a5d:6dad:0:b0:20c:4dc1:e247 with SMTP id
 u13-20020a5d6dad000000b0020c4dc1e247mr24044515wrs.274.1652296354621; Wed, 11
 May 2022 12:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com> <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
In-Reply-To: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 12:12:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The kernel tree might have just the expected *failures* listed, if
> there are any. Presumably the ci tree has to have the expected results
> anyway, so what's the advantage of listing non-failures?

.. put another way: I think a list of "we are aware that these
currently fail" is quite reasonable for a development tree, maybe even
with a comment in the commit that created them about why they
currently fail.

That also ends up being very nice if you fix a problem, and the fix
commit might then remove the failure for the list, and that all makes
perfect sense.

But having just the raw output of "these are the expected CI results"
that is being done and specified by some other tree entirely - that
seems pointless and just noise to me. There's no actual reason to have
that kind of noise - and update that kind of noise - that I really
see.

                Linus
