Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECE35F2B8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiJCIS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJCISJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 04:18:09 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C481786D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 00:53:13 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o59-20020a17090a0a4100b0020a6d5803dfso4499053pjo.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=onBRmGQGRem5mSOB7ipee32TVAFlgEGI1f6Ci/ml3oQ=;
        b=d1a3FOgMz0ggs792qsxMc8fYdhkp9vRnLbRJ6wtKKx2Wbr/X1fXz88Zyy4HL/OadeA
         hGYgKYBWIRYqyfBfD7pvMdcAKwuR5Td6iakQijYWRHW7MaVTbfe6jgH3M/zilUaEFems
         hBkIxb/ZWdNvAJHeUQliFG5Ck5HGvvWDpdY4fbYrpx6jyhqfLjWqorgReIz2QyrSyJsh
         gvcXFZ5v61M13COvwz2sg2fL7/i8KsL2zBbhxkzuhtDonBEWioJ7U7UL8ehLngUu8YvK
         Q8mwLCCgm81PI7H3+I6hdtkt62aHHS6Zj43YT2LgNvdg0SQa7YhPdnjJ4Ze+BITaq2KY
         Q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=onBRmGQGRem5mSOB7ipee32TVAFlgEGI1f6Ci/ml3oQ=;
        b=uRpN12VUbXndCjvTNJs57t9B1ZxUi6319JVtWPxUhZc9m+wihDoyM662Km8iqxuJXJ
         pQaKwYr/mUwd69kQc/6ruUM6zk6TcHNpSTT1T/fC3zQZC7+cTbBNA7bdodJwhM+vs5lo
         Sdz6252TJNK+B6xBLf+c7VBy5CGsWIXIrLmmvUhhGRGOiTCBO2vr9hnjRQWXtkkPuTM2
         fMmeDJmKk+WrBEVgxH5xrya6wRDgl2UVoaFU6zBVYBsRPn9pe0BFgwBgtkSSk84Xwueq
         7NNRosSPnl7guRkiO4OmW24aVlZ+5mIIsRklikTkR1GmmqJmx627wM8fz95EUth+jKGs
         jqZw==
X-Gm-Message-State: ACrzQf2dkwGcxT3e0Ks5pFD5hb0tSPk5ttVA5ahYqc2E6Fdb4BIdzov4
        Lkq0v5G7OJ1k8ZsBGDjZNRpBw6yLvSEBrwyHH+I=
X-Google-Smtp-Source: AMsMyM47BAUl6lMfqLFcrHBk3+WeiM1CnHFjvqqmye/o9VYlblSmc0PLbLW78iiYN+6HacEQv3pdWULgLNQI0/AV5Qw=
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr10869040pjb.147.1664783529723; Mon, 03
 Oct 2022 00:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:ed93:b0:79:8b21:ec23 with HTTP; Mon, 3 Oct 2022
 00:52:08 -0700 (PDT)
Reply-To: mrshestherthembile580@gmail.com
From:   Mrs Hesther Thembile <mrshestherthembile5782@gmail.com>
Date:   Mon, 3 Oct 2022 07:52:08 +0000
Message-ID: <CADULXr501j4Cdnu8sO1YJ+03mOxHw2ZhXjguLBdGCXkfsM0+0g@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1035 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5003]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrshestherthembile5782[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrshestherthembile5782[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrshestherthembile580[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

-- 
 A mail was sent to you sometime last week with the expectation to have a
return mail from you but to my surprise you never bothered to reply. Kindly
reply for further explanations.

Remain blessed till I hear from you again.

your sister in the Lord,

Respectfully yours,
mrs. Hesther Thembile.
