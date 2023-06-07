Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D448272618F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 15:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240433AbjFGNm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 09:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbjFGNmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 09:42:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7748A1BCE
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 06:42:22 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b02085bf8dso32053295ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686145342; x=1688737342;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec/k1wvGxGvdE4jxIOmJS63ZehuBUnWANKuZJnM188U=;
        b=ND+2sJHFW0N+8ZRVhL3D3IC3WicPhvNMz8zDEMJ/Ydif7d8D6uhW9DgAQCqKijIH7+
         EEtv3n80SiuDLddAV71PasXe7Owgl82SBkGITOOnnoCM0AjbO6ZmtSrmpQTrf/9fOaR+
         /TLO47J2oYU+9lNYN7zV4nF2idsXLaoatbiPvJrcsLjYIyTnqRKAbERGk9tWQ58KQV3C
         lpSmmqOvMMz2UarYcRVwg+WEPGIg36enf5FCN7S+gLBryK64il9lvZZCuYjiOaqwFM82
         rzMnD69nBhXrxs1osebH1brHXe/3TWS+Bb2RXnOs9fUhrvhpqNEU7e1iRGhpWWmW2tTm
         hwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145342; x=1688737342;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec/k1wvGxGvdE4jxIOmJS63ZehuBUnWANKuZJnM188U=;
        b=fHKY8inzHiSf0z04vfohLlE+VD8cUjGqTvNxQB7IdpV+c2KOap+D466x58NvUqdtxl
         T/QnlPFiuI+c3E9Ap1IpyWCP49XV32CcQl1tyhqAen60NpHoriiOKfWRQwqiS+LTrro2
         1/9PV1C1RP3U7oH6LrK6nwR6eVX2IQJUPnM8zHnzYkl6SUA56kQ2uuLP7oWzdQT0k6Dq
         IjHquiHqtGAn/Bs6Mir/X/iZO29QCu6a6YA/ZgEugfNgcYJFpUzbxLA7eSIbM6cqm55u
         lMageDvkS0hjXK/pEYPkyBb3URV6KTnzCwDidQF5qoqhPZSiTbA3fYu78qcLYBRJDqzz
         WC6w==
X-Gm-Message-State: AC+VfDwxiT3bf6xr4v2X+9v28Wj2dAwdPAQXLYmTymJviwgfdVL+wzw/
        WQ/Fc+vBal0k1eOCyftHQBFrQRNSfTGYDu/D6XQ=
X-Google-Smtp-Source: ACHHUZ71OFDzjkgVctwtWX/rX0yh2N8shRc0awXK0PP+MAoK9ZfuXu7+MCY552+jpOS5NGFRV5yncZZq6fK/mWjkj4Y=
X-Received: by 2002:a17:902:7b95:b0:1aa:ff41:31a7 with SMTP id
 w21-20020a1709027b9500b001aaff4131a7mr1849895pll.13.1686145341487; Wed, 07
 Jun 2023 06:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:214d:b0:c5:9c51:ed79 with HTTP; Wed, 7 Jun 2023
 06:42:20 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <djaliasow10@gmail.com>
Date:   Wed, 7 Jun 2023 14:42:20 +0100
Message-ID: <CAF_pCkwHT9tDQVO4Yo9jqn6u4z5=VLhrE-k8tpf06FX9w4W0bA@mail.gmail.com>
Subject: Partnership investment?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [djaliasow10[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [djaliasow10[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Friend good day? Please I want to know if you are able to handle it
investment
project in
your country because i
Need a serious business partnership with a good background, please reply
I'll discuss the details right away. I will appreciate you contacting me
On the same email?

Thanks and waiting for your prompt reply,

Wormer
