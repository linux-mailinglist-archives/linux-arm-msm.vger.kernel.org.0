Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108D75E5650
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 00:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiIUWi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 18:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiIUWi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 18:38:28 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D50A2A84
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 15:38:27 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 129so8366970vsi.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=SngjRcaZ/bSuKXs04fuqMfMvv1nHUqSUUMqTISFCqs/YO79T7YuBvzCys2tfdCVr8z
         ycl6JyhsHWFJjVosaMg/RNZn6IhXV/x+9TX2Hu+CYuP2cAW2RTYx3tk3YouBuHi+xEWY
         juREyuBfq+Eex5fa+9ZxlcHYIrZ0LDAdB04Smikl4KL90mS95V9gV7TyT+A5kKeVvRIa
         Sw7j/Y+YuzUfxJBSBpBYf/H2WdGve+EL/WzELpxEfx3wnSa84Xa8lxMLD/x1Hx399DAk
         BKpZpoDIudeDEiHeyTPJlmmJt9eA4leO8n7Zrm2kCP4L7+S78fPjauFbEBydypjf369M
         R8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=zYuXFZgfeJQU4I1Np3nXi5AVCgH5jxN9rpt1ZCmum2T/YEayWipbSGtO4vt9k5nWkN
         wkqRZgt+YdBrw/RuPh009kByHousXOVTQb6Xfpy3SKzVVBcnGCZeU897i1oM7M9TLj5P
         BAv287+GxebDEzwFRmdoiG/pfxTNzJdA+GTKZIKsoKn9ch70/6GOUFXY6rlnUnrurxbx
         Mx5ijJByPQCAyG+qHImNsSDpssh2ZhV+5W20KD956GxN2NVBnH6tQNKafctD5rTi4gAN
         djYevDjsK80BbHYrh1r8pnGqCj63vtggz9ukfKNRixNVMd+10/2mqRPqVQbNAkEFxMJr
         9/Eg==
X-Gm-Message-State: ACrzQf2sTVD83qKB6cfQPAK1Xhdyuv4JhpM9ykT8Ddt/E1hEJVpJ8NWT
        c7SzGzGzIvtQ9dmHOW4EPrKNDWS/VXxFg3eipH0=
X-Google-Smtp-Source: AMsMyM4PuqiNqg44pvBvXXUilX7HAasxCprjYr1onTqMYCR3FYELqUD9ISqF/r5B8K8yhbSA3OTkgIjpc2zW63ghpE4=
X-Received: by 2002:a67:a449:0:b0:39a:e60c:858a with SMTP id
 p9-20020a67a449000000b0039ae60c858amr219267vsh.56.1663799907039; Wed, 21 Sep
 2022 15:38:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:f6d9:0:0:0:0:0 with HTTP; Wed, 21 Sep 2022 15:38:26
 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <alassisidemion@gmail.com>
Date:   Wed, 21 Sep 2022 23:38:26 +0100
Message-ID: <CAG8=QahW7Z3VKm=ycWRGvEDjFNAddJ0QOykmB_DU9TUh9RRUXg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

-- 
Hello,
how are you?
