Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823D55BF039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiITWfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiITWfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:35:24 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A5E606B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 15:35:23 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id c81so3555229oif.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=9oUhhe9WhBbu4JoH4Pz+I0OHBn3Qr9dI0a7PR0a2whk=;
        b=A8ZNIErc7hAyohDKLrZy2a1aLY/pkjreoGGL7QlgMd01XeACtYb9zd5XXn5joFz/OY
         k51Nv0pfmsI8dFU9sj73gXKP+vPt80INdfVlLdP2AJgeFx1+7llaYurK3W3JvmlBBsLN
         lASSgmi0+0d2Zjm2nh2BffJM829PWIzrI7e+/NuUqDGQOW6BbZzx9zVxZF3UDAWvHZZq
         mNr/djH8y/Nw2VRy+Yil4n76lpnGPvy6sM9BJTAv/R8TfonrUuFz4tRSSa6TSkjV3ZLG
         WGwLBEz+N+XRvSs2xA4RW9G4wLvb+ks/NxQ5Ui4JM4GDOStNSH+FDBr1iwwsjjN3SHpr
         4Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9oUhhe9WhBbu4JoH4Pz+I0OHBn3Qr9dI0a7PR0a2whk=;
        b=oIXQJ6LGwWpXGlCBP07rSoq7WnfLs7H//w+wlX9nT84yUOfdKJPc/sm9Or8F3FQdMa
         PzzDa7H1TlPXXeB82hwDzZKh68LqIWkBu9Z6BjieLciqmHjNRQs0g/mxpc28k8Sd+ZOn
         M0GwhPf36FvMIVsL5WEW+EjhR8MDNZMvZb6SH0nc9Yuy125qAYmYSR5YPJk4yL3dfeFP
         Ma6LMZVxT5eIwzXd+VjJBgucc8/3VL+8IPovqSWEXIKQxkOh5Ucqy51LjSeJiHWdjJ0m
         TlBHOXtbzkfWmTH+ep7FQMGgs2dhQzM2wHZkWQmAew8w2+mjsGCZoQ76DOCOmPvqo5NP
         PmiQ==
X-Gm-Message-State: ACrzQf3cMfGnRexdfiCKL03W1VnYm4bce2O/3RRy6KFdppkIy/xqATC9
        1/o/pNvdbzjw1/DaCkDsq6zATO0Issb2mJk+OgU=
X-Google-Smtp-Source: AMsMyM75aP1QTLaMI87JzDr6G4+G5GBHi0S0hXAdlFx7Z1gsuhV1keP/XPHSB1Zm6lNvFhJrBm+f287bf886nKJWS4A=
X-Received: by 2002:a05:6808:1524:b0:350:1965:8a1 with SMTP id
 u36-20020a056808152400b00350196508a1mr2569572oiw.211.1663713322788; Tue, 20
 Sep 2022 15:35:22 -0700 (PDT)
MIME-Version: 1.0
Sender: badagbocamillo@gmail.com
Received: by 2002:a4a:2553:0:0:0:0:0 with HTTP; Tue, 20 Sep 2022 15:35:22
 -0700 (PDT)
From:   Miss Reacheal <reacheal4u@gmail.com>
Date:   Tue, 20 Sep 2022 22:35:22 +0000
X-Google-Sender-Auth: 7VAK7gic8Db0ZmKP6TngoAytytA
Message-ID: <CAEU_3uB6K98rYYM4gK5s+uYP=Gb2UKr3By9i_+74xR9XfPkqyw@mail.gmail.com>
Subject: RE:HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

You received my previous message? I contacted you before but the
message failed back, so i decided to write again. Please confirm if
you receive this so that i can proceed,

waiting  for your response.

Regards,
Miss Reacheal
