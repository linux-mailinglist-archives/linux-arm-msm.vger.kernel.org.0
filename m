Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C425BB55C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 03:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiIQBfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 21:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIQBfW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 21:35:22 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A60866101
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 18:35:21 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-11e9a7135easo54554242fac.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=dmQ9XKJfChmsPIu86m8JjBcrt6ehVCRM1Vo83PzNbxM=;
        b=P/cnvPmXjsGXjEzEvO4iJ4xNAr0ndzmuID2cN+GMJd5BA4dDGRXtwsfsCuGzm9PEA4
         bG464HVkAh/sme7YHpcoXQXfPvoIas19aO7uM6X+hF+pc7OPHxE7V9ujHDhDn24tNCa2
         57DYR2XWXNZV0UFL1c68DsVIqrULrvhoZqas9CWdUTBfJe1htOG/4ySq0GdlH0bAgimU
         SicpZxc+faR6/F06H8HgRm88Llcvma8fjnBs6G6JYDZfHB+SzKaEFpLHcIKkl5H2AdjY
         Qggu+pm8SU5wRWtSwxNmK+12DRx0Xos0yed3YNjkCGQSqfLVnmB6x4PaOX5Svp+a86f0
         8jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dmQ9XKJfChmsPIu86m8JjBcrt6ehVCRM1Vo83PzNbxM=;
        b=jXvBsbDa0LlEfhqwq1sslv7vPunP2sDRSjsc13OrXXElQ42JFl37yrbX6vMQ8Cja0p
         40psYlE1SDMktiB57wzAyLmpkbmNJlGJ/cYAKMTWgj6tFnOgvNoYQQsrmzrCPICG+Xsl
         fjLWdsO5xhmYsYmhAkZo086vyxsj8NdXQDa3ndzBiWlVlPCF8fdyDZru+Sq+/qT5zXM8
         qTptsoDofyyyjd5oK9pDHFV6rKGzG2xOPVLGJ5J7n9SVrma5bmfB+i5M+tqf8FDErS8i
         4h2SJpAFUAQfHSciqm927G95uTqBuSZa9eQ6kCxuXQWKjAbQZn9xjEHnZEDKyWPsY0Uo
         3E6g==
X-Gm-Message-State: ACgBeo1nfRk628yR31OJY5s+Cs0c4LEDmDpCGOFWCP41U55c27B+GXoC
        EZgvSqjCjR+rqVCi3YYLo88asZ38KCDNshAuCcI=
X-Google-Smtp-Source: AA6agR4hZGOogsZ7/cAzo5EVDUr5b8XsxcqRXTIgmlY5sUF+N/75QgIMzp2hj+USGJAwPfek3gcWgqfRSQLln1xxhZ8=
X-Received: by 2002:a05:6870:7394:b0:126:6f7b:15a2 with SMTP id
 z20-20020a056870739400b001266f7b15a2mr9537079oam.227.1663378519750; Fri, 16
 Sep 2022 18:35:19 -0700 (PDT)
MIME-Version: 1.0
Sender: luiskane20@gmail.com
Received: by 2002:ac9:2f4a:0:0:0:0:0 with HTTP; Fri, 16 Sep 2022 18:35:18
 -0700 (PDT)
From:   Mrs Aisha Gaddafi <aishagaddafiaisha20@gmail.com>
Date:   Fri, 16 Sep 2022 18:35:18 -0700
X-Google-Sender-Auth: QQ3ZIYPsKG5ciI6CVvFyEgtoIYs
Message-ID: <CADDFH=Z27T3fBOTJFD8Ls7ymYLOuFLwWFtrh7pF3Wqj6R77WYg@mail.gmail.com>
Subject: ATTENTION PLEASE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORM_FRAUD_5,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MILLION_USD,MONEY_FORM_SHORT,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_FILL_THIS_FORM_SHORT,
        T_HK_NAME_FM_MR_MRS,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2c listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9874]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [luiskane20[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [luiskane20[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  1.4 MONEY_FORM_SHORT Lots of money if you fill out a short form
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
        *  0.2 FORM_FRAUD_5 Fill a form and many fraud phrases
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

May i use this opportunity to create a mutual conversation with you
seeking for your acceptance on investing in your country under your
care as my  business partner, My name is Aisha  Gaddafi and presently
living in Oman, i am a Widow and single Mother with three Children,
the only biological Daughter of Late Colonel Muammar Gaddafi [late
Libyan President]  and presently i am under political asylum
protection by the Omani Government.

I have funds worth " Seven Million Five Hundred Thousand United State
Dollars" [$7.500.000.00 US Dollars] which I want to entrust to you for
investment  in your country. If you are willing to handle this project
on my behalf, kindly reply urgent to enable me provide you more
details to start the transfer process, I will appreciate your urgent
response through my private email address below:

aishagaddafiaisha20@gmail.com

You can know more through the BBC news links below:

http://www.bbc.com/news/world-africa-19966059


Thanks
Yours Truly Aisha
aishagaddafiaisha20@gmail.com
