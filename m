Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4E04C4B90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 18:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbiBYRBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 12:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240460AbiBYRBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 12:01:32 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD511D528A
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 09:01:00 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id b35so7031269ybi.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 09:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=SLy3oJ7ZhKb/OB3pg8+SoZvx5hyhkJnokeHXyVSdehY=;
        b=SsJteq2h+rbtUK5RGV4HkhYXsyTSRL7YvPgAggfhwtW3uoQbDTkcN+Er20ivFPrKE6
         6PiX/SQt5asufStuFBmVms5KQ+2YcU5y/p7YkMl4s1/8SGoYymmdclWc3laUwXKyYsbh
         PlviZgmlvt9XfZmmlL/ILANaP7fRQTlra/dt0kLQR3UfgYIlgTwN2WtzVc9pE1Tb0Me7
         UuasHvHH8xgy2rUjGfs5ml6rrW/Et/8IbWBYjLHWKyVnSk/DJ/YlR3raCUhokD0Wgu/3
         VMsSg3QZ61AQfKrdz5HGy3BuRv4w+KrD8ypneX8u/1f527sRsLCAqC60OEo+jQ9kxjSx
         G6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=SLy3oJ7ZhKb/OB3pg8+SoZvx5hyhkJnokeHXyVSdehY=;
        b=6Jlzj2B3WMaD4vYUsjApO11RTKabV0fgTsNXUw8EhYdCeQlRoxhNZDPqZJi3ynkqLJ
         1e5ykr0rcZ/kSvOcnprZ0FYHXB809OcH0ZhfpZIHIe639sRqe9jhkP0E5cSJhx/OBOWX
         Z0N+UVPA/ac+EK5QT5Ot+9txbLIXU+Ls5WE8DQa+7yK1/3T9YNDEXjrFCMo4oEPwOZX6
         l5RqoZxVMdmeUvci4JqYZQdscdbHgU6yacf/dErULnKlzxnED4f7hoCwQDfbXgO4cDno
         VKeIj+DHml1oWhxwuP6KbqpePm3L58GyIiLi3n+pTaiJRWvffPowiou9W3TLnEwBp2z1
         k1Ww==
X-Gm-Message-State: AOAM530VwA0LrcCODJH5fwet5Xb+jZo1Kn0VtcRqop/IwWk73qjwCERX
        d1QQzzbIhDl3Ll5UU8sriPWjv6gHJ0N9jJ/vpXs=
X-Google-Smtp-Source: ABdhPJwe8n9ZCpwMJUSDQ5PDqfR785FE0hEH8BJoxXsZj2bsNXq5fGx4ej3EJ4nnFZoH0c0rz3ZEwHaibfwzJXN0aS0=
X-Received: by 2002:a25:f503:0:b0:61a:20b:ea1d with SMTP id
 a3-20020a25f503000000b0061a020bea1dmr8157908ybe.109.1645808459341; Fri, 25
 Feb 2022 09:00:59 -0800 (PST)
MIME-Version: 1.0
Sender: maiconbilly0123@gmail.com
Received: by 2002:a05:7110:24c7:b0:16d:c5ee:51f1 with HTTP; Fri, 25 Feb 2022
 09:00:59 -0800 (PST)
From:   "Mr. Priyantha Ranasinghe" <assinmaking48@gmail.com>
Date:   Fri, 25 Feb 2022 09:00:59 -0800
X-Google-Sender-Auth: Yo3Y8-MnD1H_rNK90WdNcT-3Nk4
Message-ID: <CAAvhzfjZZVa0q=Bz0YqT7j8d=JRWUym=iQhyviyZSyjceGHaRw@mail.gmail.com>
Subject: PLEASE CONFIRM YOUR READINESS TO PROCEED.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

How are you doing today?

Can you receive the sum of EUR=E2=82=AC8 million only in your country for
Investment Purposes? I have been instructed by my Bank to present a
Beneficiary to this fund. The Fund belongs to a foreign deceased
Contractor who had no indication of Beneficiary on his deposit
documents. So that is why i contacted you to stand as the Beneficiary/
Business Partner. I will give you further details in this regard once
I confirm your readiness.

Regards,

Mr. Priyantha Ranasinghe.
