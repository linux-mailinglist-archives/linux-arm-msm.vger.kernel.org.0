Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A796B27BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 15:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjCIOv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 09:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjCIOvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 09:51:12 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA323EE77D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 06:49:35 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id n2so2574816lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 06:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678373360;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IEW8M/aeCm2sE5fVkmadnoct+8r+q1Vjruu3SWPyz4=;
        b=JDGWw6n/bGtww37vqF5bJEUF5OLuzOGZoRY3GeMOF0jknYjbBC4WV51Qe3htdU4oB4
         KaLBMDzhCwVC1vD/kxoF9lGJUtnE5u9RZAARdJu54kZLN4L7lguTv5XkyzR4DIMedS5Q
         Ap20WlP9mnwSWYVuPLalJo9WTO8CD9m7xL5G6OGu3zbvNlbJwxJObleGQzMx0LQj1lnL
         mvtoBMcRwu9mXunuhwdrZmg/Pl6oyYiRpOrBKxM9rnpXgsVVsaNAd54Er485w13aFkM6
         56iKRoSCedVc1svUs20og8E0aK1MCoF4yv96W21egG58IzZlEz+8oE3O1mJuBR1QQJVN
         +L5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373360;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IEW8M/aeCm2sE5fVkmadnoct+8r+q1Vjruu3SWPyz4=;
        b=aubLjUhK9/RCZgqaV8K8U/8eYrVfYDObFxHUu2oPixQHKaakG3qpzHCMY+Vfy7c8Wo
         y3ctliJMI/r2FDDSjGX0IydfgdDV2mNoe1JmpHCUpmgKGSCt4QHTUg5m27wIfE4FPnbD
         9VEUTPjgQEfE/QLAWIUQ0Kf2lNe1U57m6Ig15Iyq8TzNyyNsLj9ct2XH6mk+hNtfGKZZ
         Xe9QXTr/C7wzDcurZcl9hrwNj0QAQDV4a5MfMVpKxuDwPbvtGOSjoD1IKcuXGLO5+JGh
         rVncjVt4GS6HlU2mXLqV6wojkFaj04SNcY4RbmFvbchjT5uk6FpaFWWkMf0OAAv9JdUp
         tPBQ==
X-Gm-Message-State: AO0yUKVNm4eLhAmLwGOXe83IPHfpriG8tZ/kiqNuzvInm3f3FNmkt3bs
        dlaMjxe0Vez8FtPbR2tAgSlLHWjZO+QHtZ2P6Vk=
X-Google-Smtp-Source: AK7set+JGAQzKxmezNd7RQx8YEGiJc1RmAtTo+6cEJpQm6vgJINCoqE/RuqNP6OEM0zj+lk2yqH0G8QsAxMhcjQgxSI=
X-Received: by 2002:a05:6512:281f:b0:4db:1e7d:5d42 with SMTP id
 cf31-20020a056512281f00b004db1e7d5d42mr12673495lfb.0.1678373359921; Thu, 09
 Mar 2023 06:49:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6022:9116:b0:3a:4b9f:4650 with HTTP; Thu, 9 Mar 2023
 06:49:19 -0800 (PST)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <devynurmalayousef01@gmail.com>
Date:   Thu, 9 Mar 2023 15:49:19 +0100
Message-ID: <CAApZ1XwamMYRdqTQ8KLsA3my=iG4wuCoyrDWKFTX791BLZNPbQ@mail.gmail.com>
Subject: CAN I KNOW MORE ABOUT YOU
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:144 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8967]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [devynurmalayousef01[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [devynurmalayousef01[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear how are you? Are you capable for investment in your country. i
need serious investment project with good background, kindly connect
me to discuss details immediately. i will appreciate you to contact me
on this email address Thanks and awaiting your quick response yours
Amos
