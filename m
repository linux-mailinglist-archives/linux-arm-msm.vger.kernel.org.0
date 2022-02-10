Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241A74B10C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 15:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243177AbiBJOsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 09:48:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243170AbiBJOsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 09:48:22 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8E1D84
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:48:23 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so6595710oor.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=y8L6D09oyDfYgwjLd8NNF83N1gzGF1wUPPtkfx3XZVI=;
        b=Yz2H8KJy53ICSCEZXr1I3rj+EZgdmww45658jW9z7hOVEYZlLREbsl3IWRp6XroyLl
         bjKED9NyeDE7z/MsCNXL4xHx3IlDAuN8xEFqO9e1Wta49qmoVj7HY1gXtS+1oNah5bDA
         IU4pnCkTKHU9EoUQYCnuow5mBJp269e+mCdD3rcHR2lzzGqoRMGRiX7ayJuwbEUDy72S
         cIk8FsIbsAzF80Uz5Tn6iYB3HoaYe3XvXZq+Z/PFCdeKBIUwxY6N4yYra5r0r9gO9BKh
         2jETZHqbDAi17Ea0qm9lCKoEDf+/fkFtS1946pTvmSVMRfqRf0896ht/K/2DDmFTjzm8
         dh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=y8L6D09oyDfYgwjLd8NNF83N1gzGF1wUPPtkfx3XZVI=;
        b=YcCMzSQeF1WMn97uK2U6DAVLzM6t4x0LleHfjG+sizvDoRDnxnsJ3k0ezMmPa7JTPq
         NzHUj1qWvF00CXtEWzj6nSBIKCXa9VuE/o8/ntlRfdChf218BJBdC+p08GIaWieSNZ47
         rjeAGcKTV40zQbdSIgv5Up5QGhTvWD3PtEOlkr8sz2aGQG2Rof/Zz/LgjWsOVbElwOnO
         1DpyM6/FqrgvvCovNdYVxQJ+KCJXf/yf+NDfV1TLea4aUa9Ne4pdsS4DtJiXw41yat1u
         /QZcPzGmM1b9FyX51/hH4lIFtd7zXuAbe+NQ9yRMlp0nuPShQw9cbdjbhtnlFPdPp8IG
         iGVQ==
X-Gm-Message-State: AOAM5333lfjNFY7ZNZRYbRdTONGKsgpwZXN+EecQfvX4oUQ0x+K170iT
        ZLyWZS5ty+fVsWJYFBsuaYE01A4wMJ6iUcPoS+w=
X-Google-Smtp-Source: ABdhPJyWfn2w/9INbj+KirLZzE3lITYuIDHKR/pl+vpDZ9MC8lZBoGlc8zc26FOJvbzuyKpyw6JB3kvwulmJPLIz79w=
X-Received: by 2002:a05:6870:4512:: with SMTP id e18mr896807oao.122.1644504502777;
 Thu, 10 Feb 2022 06:48:22 -0800 (PST)
MIME-Version: 1.0
Sender: lila.lucas112@gmail.com
Received: by 2002:a05:6830:4387:0:0:0:0 with HTTP; Thu, 10 Feb 2022 06:48:22
 -0800 (PST)
From:   Sophia Erick <sdltdkggl3455@gmail.com>
Date:   Thu, 10 Feb 2022 15:48:22 +0100
X-Google-Sender-Auth: AlIaJAwqBJTbMx26yhFiwkI37w0
Message-ID: <CAAGLdM4B8rTRbCn7BgkH_bBMNzm+kuPjgjMG6WJzLunRNZs2kQ@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 FROM_LOCAL_NOVOWEL From: localpart has series of non-vowel
        *      letters
        *  0.6 HK_RANDOM_FROM From username looks random
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c34 listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lila.lucas112[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lila.lucas112[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello My Dear,

It is my pleasure to communicate with you, I know that this message
will be a surprise to you my name is Mrs. Sophia Erick, I am diagnosed
with ovarian cancer which my doctor have confirmed that I have only
some weeks to live so I have decided you handover the sum of($
11,000,000.00, Eleven Million Dollars) through I decided handover the
money in my account to you for help of the orphanage homes and the
needy once

Please   kindly reply me here as soon as possible to enable me give
you more information but before handing over my details to you please
assure me that you will only take 30%  of the money and share the rest
to the poor orphanage home and the needy once, thank you am waiting to
hear from you

Mrs Sophia Erick.
