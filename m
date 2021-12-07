Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEDC46B32C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 07:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhLGGuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 01:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhLGGuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 01:50:18 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB4AC061748
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 22:46:48 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id i6so12798383ila.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 22:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IGse4qKU4JLBH1S45luocRcV6GpeECgK5A2GIqwAdmM=;
        b=aFjcUtIzgMWchPz0h30lkgbHE9UNQ6tx4At4hHXsKpbMdn1ckj+QqxXw5CncyOI2qU
         hHUUi25j30e32DQwfM5/CQ3D4n9Odcv4tWW5T0xIJFuPZfwxFNTCDyvIceF0YBjEtBlU
         +sIv5CG0iTGFfyHe4TUMFiOYknZCa7VsU2gQZQ0MzZ4cPjUO6OX7d0kvT5RGiOHOtm/u
         pIpXVkwwjvcel0MIzTJ81anjiRgieFPX8BIZVAZ2MZYJ5CF7Eh/i0pwQc4L2kvqfDsBx
         DyUctxfKFyBQdOtICKLrOAiQ/SOmsZVyEsetw7/tbNm0wyP85yrxySXL5rYkbKeUA0Y9
         /lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=IGse4qKU4JLBH1S45luocRcV6GpeECgK5A2GIqwAdmM=;
        b=5IMllmTfbcihUpLaWN0s4L1cWE+S9H9PfB6rOJI5GC24tQrXqplN5B3/nUfzAEpKvG
         ixomTAUQFTOxU8HruUrTfnseubkYMYuQpet5qEwyWf5G4c5cFZMy8zhnVj1JqpGiZ+MX
         L/6Rc+CtDqT2rK3KOmqen8oIt1yg+Z6pd9h/O/BfbJMvj4uSFhrcYsY8++7H3uYtz/Oi
         PgcYZBjo6u1BBOVucYC04eIMh9OxZ9ZafNnvyjuTQSh3MLQqVEa2LMqB57SPXnWx5jxr
         trBhG7zrOcBMeuSMtAIu8ss1ObkCvw9C+DLOCJVtNROIV+QcKBS/pfEFP512PjgeISSe
         qHqA==
X-Gm-Message-State: AOAM533PkTyRnXBou9c3ztl/HFZ4ZeXshjpip7SMp4tMeoAAA7Be/Xnk
        2q+7JahikNwSvV0x9UHZV99aaqDO8TDrJWrkivo=
X-Google-Smtp-Source: ABdhPJytc9F6dXp2+k2yAONhaVGr1N2ks6MfeLlNJBJpFswsNdIotnB87EOY0798xa2raPs0duPVsdQpiHUk0FsVUa8=
X-Received: by 2002:a92:c56c:: with SMTP id b12mr36695262ilj.255.1638859607941;
 Mon, 06 Dec 2021 22:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:964a:0:0:0:0:0 with HTTP; Mon, 6 Dec 2021 22:46:47 -0800 (PST)
Reply-To: sgtkayla2001@gmail.com
From:   Kayla Manthey <jjeanne149@gmail.com>
Date:   Tue, 7 Dec 2021 06:46:47 +0000
Message-ID: <CABz=e+SZmiL+eR0kuVz9HSxgN-wM6nucdiyyy-OQGP=cX1ev=g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

0JzQvtC70Y8g0LLQuCwg0LHQuNGFINC40YHQutCw0Lsg0LTQsCDQt9C90LDQvCDQtNCw0LvQuCDR
gdGC0LUg0L/QvtC70YPRh9C40LvQuCDQv9GA0LXQtNC40YjQvdC+0YLQviDQvNC4INGB0YrQvtCx
0YnQtdC90LjQtSwNCtCx0LvQsNCz0L7QtNCw0YDRjyDQstC4Lg0K
