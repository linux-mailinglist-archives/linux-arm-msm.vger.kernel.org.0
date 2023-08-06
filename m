Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A22771583
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Aug 2023 16:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjHFOKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Aug 2023 10:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjHFOKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Aug 2023 10:10:36 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D864126
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 07:10:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so6092665e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Aug 2023 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691331032; x=1691935832;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=EwSka9bRyZ79D15dq5B+5nLzDe2WbomQnbVHJeRZC1LzLUkYdBJsUMncT3WfK/B1+W
         jtIVi31p2yflqy03GpRThOUFpkrh9yPFVMololkiJPbiT3PvafL+TnL1wC+602kAMhiR
         wt3ZcZImtAsXI3hJmoh99iMz9SbLD4o6dhtscrT02WU1NWgv/6ctiQHWztYZU9XuZzg5
         xpQvXmyyWLnEc7kAYhVb932fyvIa/9orkLxjC3XalQzaMLk+sPwIU8/A2BLkY32ZDdW0
         v4TmHUWaRABnEql+g8Bn96zpFkQCdsT95jF4qy+qosK9iscL3P13uPuOIJOki7M89R1G
         Bsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691331032; x=1691935832;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=SUWPdNMBWeq2J1MzcV0SNfzj6RAk8Vbnhbis5pi/QzuemSQkKs2W71PJYov/KgBIA+
         n6qfHuqVzhJsyxJyCFk2dT/ewhGkR3BA4WcNgp2cNKxPE/h/ELdjYlNz6/RQwsn0ewr+
         sw3wf1UTCQSE5xgnfwoYc2Y2uzVh9UYlhstH3ZGD6tWQ8k9huvnBRbxN+XRXLNu5da9D
         4DdgUhv2IZdJYk6d8h4cclcxJx7nlHsVzJJuVnGQ+Y38FzDU9BvZ6pJZmj7WazDhnon8
         IGTVvsAUcAfb8xiBweSGUk6ubpqAzAWtXWq+PsDw3gDK/wy/KzQrGMvyAckLhK5S5Wux
         1gig==
X-Gm-Message-State: AOJu0Yyqf+2e6UWV877ingGyGqmPTxSqP4HeKcP2L8INGo2UpC4W5h8J
        5rNDKLYamCkPUB/i2YicFdUJl1oyJ/AWis9vJA==
X-Google-Smtp-Source: AGHT+IG8ng7e5htxY1czJ/JNEJh9rNbSxovFWZLoh/aADL43+mrpACzzItnq2Z0vPdiRZMmEdEIWJVyrLMeeXHHSPsE=
X-Received: by 2002:a05:6512:3713:b0:4f8:6ac4:84 with SMTP id
 z19-20020a056512371300b004f86ac40084mr3936002lfr.8.1691331031942; Sun, 06 Aug
 2023 07:10:31 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsanna62@gmail.com
Received: by 2002:ab3:7ad7:0:b0:239:3130:ecb6 with HTTP; Sun, 6 Aug 2023
 07:10:31 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sun, 6 Aug 2023 07:10:31 -0700
X-Google-Sender-Auth: fStl3cE0rajaldupjsYMfe4zEmI
Message-ID: <CABLa-dr=A7i3symM7UJO9TT+48jLbvTF07GGeRjFAuc__fSj=Q@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
