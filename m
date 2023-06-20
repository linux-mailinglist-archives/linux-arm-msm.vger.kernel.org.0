Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE33737686
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 23:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjFTVRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 17:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjFTVRQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 17:17:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98F4198C
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 14:17:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so7031383e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687295829; x=1689887829;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPcRbyzrPBTxh5e0r2I/sN2Nvc7Urb0kOMHV0diZqdw=;
        b=CQu1w8pkgs9sLq8smHD+VkuObwIGFEAjr2b99lVsxujqz9UxgJK098Q4X5ecR3G2Pz
         MjIUXRHLNKoFjiXm6XG3zXBu5o8h/wsYVeXkUyqU0Jpf1VriwLVpqyR1JKe84dGKEacU
         EYYi8iMjSwg2DiTDa90Fw/k7Tl35mTSkxAycNaOrfP7wtivCxQz3wAjA6AxTM2IOAn4C
         mbJKqlGWzPPBDTrTx7ycQ3Twex/1igeDbkXsKnzuC21jDYckP1mLz1So81N+bv62WbL3
         ovIXu2Cjq4FnFRyqoXE2HPOL/N7HNF5WJmqfUwVWCb29yV2PQ8vrSnHFNMfbvM8zV80p
         hCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687295829; x=1689887829;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPcRbyzrPBTxh5e0r2I/sN2Nvc7Urb0kOMHV0diZqdw=;
        b=gMyy5bS6e67ueNuN6VzTdq1CO6qli1PdTCU1kBeEikbHpP8bwwJY+Bbi+ZOWT7P1Un
         A/T4XfqluXi+CrpZkgXFFU67a12jorVbgMaE9O+T35HdKw+hwbhZM/SQgDDV4WRwRBBI
         re4ME+wvikxbRQqaYEMWb4U/IywsO1S4M3dyiuBU1z6G7hzKVu2s+1ps6pzSZNUKrQwv
         cxkJ2PR/amqc6jx+Aa4ojO+4sxix9texPJ7YH55iqzWGJB/XOJ5oImxseIMWqG8NFM9/
         0w8Byr8uaS948gHdNB/is224smD6Md7D39iyV0oKfAT/Yb/Sbn+UW0CO07Xa2N6JPKCF
         bvFg==
X-Gm-Message-State: AC+VfDzXIJRFDuvLlH/FzpdyIWGUkLQahBh+AtFjVwJz6VBjazK5VX2t
        4JcFudqbRhjYeiWckj0LFtGhBs1lDUHco8c5Igw=
X-Google-Smtp-Source: ACHHUZ42zuQ97fKC1z95oyBm6krHDvkPqn4sSbYoI5MZhT61I0o8fPqGcaEblpMLxK2Y+Kx4OTdYeUtjLOOAhSbFoa0=
X-Received: by 2002:ac2:465a:0:b0:4f9:569c:54b3 with SMTP id
 s26-20020ac2465a000000b004f9569c54b3mr884197lfo.58.1687295828438; Tue, 20 Jun
 2023 14:17:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:b015:b0:6c:542c:ce3 with HTTP; Tue, 20 Jun 2023
 14:17:07 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <claudiakhaledyahya02@gmail.com>
Date:   Tue, 20 Jun 2023 09:17:07 -1200
Message-ID: <CANcjk_AX62_4-6ooC6SF_Z8mFMS7cC+HgBwah3d0eRbNL10Uvg@mail.gmail.com>
Subject: GOOD MORNING.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:131 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [claudiakhaledyahya02[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [claudiakhaledyahya02[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Good friend. i kindly wanted to know if you're capable for investment
project in
your country. i
need a serious partnership with good background, kindly reply
me to discuss details immediately. i will appreciate you to contact me
on this email.

Thanks and awaiting for your quick response,

Wormer?
