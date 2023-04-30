Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023166F28D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 14:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjD3MPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 08:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbjD3MOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 08:14:45 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6473C1B
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 05:14:22 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-547303fccefso1285219eaf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682856862; x=1685448862;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx1dtfCg5LdAW7Qp5E1vgS8Xq+Rma2uSPIHiasEwQVc=;
        b=gtjOP/V3uabHUu0DzgxoKnuvW8+P4w6s5us2Rz2zQJ5ytKQqLrNS65b+bgfacboufr
         Gl9htvR+ojX5Gs9uZiT7Zyutryq5eJRlJ4A6IUgJmoI0f6gWSudh/S8cFH1yA1HXwyiW
         r+X4+go6a/2o+uY3Ew1lJJun/o481bMMttUyuFEu9q8Hm6QjpaspLqbsFhz/4P+CzLQT
         bTjEd9giDPvBn4GVLclmcy9/Hq5qAoltXMQAXz/+lJLuZ4Eza9nb3UXeYMFfOG/O08yY
         VOkTsEwoHNfGsEt+FvBZsigzi0FHMnEwc1EAdMqu9Xk6Ji+GpLY0zRMqHei2bAv8DhPo
         pG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682856862; x=1685448862;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx1dtfCg5LdAW7Qp5E1vgS8Xq+Rma2uSPIHiasEwQVc=;
        b=KrvtIW3hXhcLALgkXY66gs1GK2lg10tT71FmGORHz1izzGzgEYu1W0HZIoiiUD6xqS
         E7ZoMbbt3DmznlsSvqf6ve3azDcc4mENbAZkZTiDWQqWfNICUHywb8aOMJUK38lh6Xw3
         B7ulXqsTN3FquLtUp4jmg0WyS4jaGdwB6xyvTAerQwvLBmLf/Ty3nInqMuOUwPy+OsDh
         KwrchYnGZcww8XA7nMfa/VprpN4X1GrDQkRwoUjdrxsL5BVqYMTw8hHc8okULt6hB8AK
         EqDQqSVKKfZJMmiJTy+F64sKx3SrdZbNoNSuwtalbPJ9hqYvtSLaVaRywSGJ3bVDH7w/
         9odg==
X-Gm-Message-State: AC+VfDxmjiegibPlc4J3RvYhBsyiaBrC2739I7Ppit5cyXzz6I9DqDC6
        DNf4VsbKkp9/TdB73KUB9rtL3LfpDwmeAG1eSLo=
X-Google-Smtp-Source: ACHHUZ5aTygxS2tRYSS6fZUUii7IdvFO9ob6oJAZdf0bXo+GdqpOMUk+TSTVraZnguH7Tj8EFF8viDS8QNi8cXOePcI=
X-Received: by 2002:a4a:2c45:0:b0:54c:49d:3b4a with SMTP id
 o66-20020a4a2c45000000b0054c049d3b4amr4802996ooo.1.1682856861618; Sun, 30 Apr
 2023 05:14:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:5bd5:b0:104:721a:818d with HTTP; Sun, 30 Apr 2023
 05:14:21 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <alassanediop995@gmail.com>
Date:   Sun, 30 Apr 2023 13:14:21 +0100
Message-ID: <CAEwTc0656k8F2VDURzGY4=z1y1M9p4tgrDfxsXnsR7dss_2ynA@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sir/Ma'm. please kindly want to know if you're capable for business investment
project in
your country because i
need a serious partnership with good background, kindly reply
me to discuss details immediately. i will appreciate you to contact me
on this email below.

Thanks and awaiting for your quick response,

Amos!!
