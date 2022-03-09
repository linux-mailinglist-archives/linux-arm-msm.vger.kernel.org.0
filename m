Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252644D2FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 14:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiCINUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 08:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiCINUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 08:20:50 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239811786A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 05:19:50 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id h30so2226908vsq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=LnejyCzOIh3SXgKZDqKBcMT1XI5Awxa7srTgbnEmmaU3IVJMCeMLrOAsOkqgzwv/vM
         HF/+XvQc6v3QxDDKPBIEPSDGgQM7LFHgv50Ua1iOJsFLooxHJW79Dc0UgwYgTO8f+EGM
         lrU5+jhBT2WBo16pAcDXccfeH0uckvC5sDIjayQq3YJFO3MRwUHVtb4sIyGVnidt4QlC
         V+mkcEiJsdi0uibgFMP7uXqRfp15Np0tQFZuwllTfZyK8dvrshYy+7ZKNaOs1rmLdAAJ
         mGuVO2gYFz39kyV8go5x2HuIuZApPQ1gydwElpCkYYV7yjQztSa1vvHUHCy4i6vA34GW
         V/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=1NC5e1wKyQS7eNBmau5INnrfLaizW8Pc/ASMMcmiZrtbFXML7Y88Z0NBVwA1PKENj1
         oLHtU+fcJvfgQZGpXuW2QOzH6WWf8hbX8qFEcoqh4ogN1ltyAI+yheKYk26t1CMCNDjv
         0ZLoxfiu58f9mpi4CMyAAJvFGwyJFwD6K+M7NPzYT61UYw1oNHTv9MBSFXlv/71E53TB
         fqi+0kMu6v2YGi01GC0fjdlOWvSE5N16Lvt8eTgSgGka1hua0nCJl+LouZngFGKIYaNL
         uAxAZNn/0TnOdnS9eCfuEev5x5hGZCVFqenxtE/Tv0YQgYvngH6h2aPA9d7IIwUNNOpl
         7uZg==
X-Gm-Message-State: AOAM530gCWljzu3AnBDDEB/fOaT7QDdppJxlXt9IKan5060q2B7SCmxj
        5t2jtG7ilgWVyy1TffwHMJi/Av4GEu1mSmZrKfo=
X-Google-Smtp-Source: ABdhPJyRRilmzk1/yP3S+eFkDi7pZv3nfFeyCoiIEWipOIxZVdy29AunsgJKCXwMk58ueKa6J2IYmLNwzSFsc3T9Pvw=
X-Received: by 2002:a67:1dc1:0:b0:31e:650d:a7ad with SMTP id
 d184-20020a671dc1000000b0031e650da7admr9589738vsd.85.1646831988680; Wed, 09
 Mar 2022 05:19:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:3ae:0:0:0:0:0 with HTTP; Wed, 9 Mar 2022 05:19:48 -0800 (PST)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <tz649296@gmail.com>
Date:   Wed, 9 Mar 2022 05:19:48 -0800
Message-ID: <CACC2Mgh-e2Lth55ZiWiLNm+d1V1Dxv7VGv2DzVxDTf2h=5+uuw@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4957]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tz649296[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tz649296[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

-- 
Hi Dear,

My name is Lily William, I am from the United States of America. It's my
pleasure to contact you for a new and special friendship. I will be glad to
see your reply so we can get to know each other better.

Yours
Lily
