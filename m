Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44A3379186
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240278AbhEJOz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 10:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241761AbhEJOzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 10:55:14 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B421C0610F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 07:12:56 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id r13so8350603qvm.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Av5G5AtpNBFjVAfcDwTmlHxxluTGjzJzs3MnaFzHsps=;
        b=T79MGoIwVjFaUXAtxA5sY7QeJvP3+Ng/RqHMyV3t089p7vRVag6XiYWxPu59vVaMsV
         HoIk9rGlkrOOLhay6SU5WaQkO540Z/sgFEnflx3AniDZLt0y4LBAKkBh+HFrp5OvdHS9
         3IMLr/tRvyViYmvMdhlkGqbxgaPKJP1D9nAAy5NwlUDECoJrdfAooY7zUKbdDa9sil9C
         AYU97x0C4eZsPxY2H8f8HkfBXI4F6R1FdZubPKU7KIx333UW1JOVa73jGiTj4h6riG3S
         GzULbzi7Gy+i72RhXGtYY76MhEsEtVxGvRRS7sPsSkX1NuYcQ+vNWPMTm7wqmaDBMay3
         tMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Av5G5AtpNBFjVAfcDwTmlHxxluTGjzJzs3MnaFzHsps=;
        b=EzCVgu7fvtoq2QXNFHW3zCXd/jiuf8WUgXc3K3zXFG4L5WZoiT1UnWnyDyERLTMJGo
         2fOyVGJ76pnwAdbnJr1tvL8JA4ihTstk2BLGwuG9JBG6ljIZpa5sXWWxxD1FmEjp5jKc
         0ZcnrcRRYGHvO6iAiZuc6DGW1thP1Py1qF8tK16dPcIhbBMbcMQppWeIkOwZ0hwZfVuY
         78OAXD2IfazCdSH+dqHoRC51uRESHd0br4xzIH6AbmiUL0C/vPWn0Znwxl6/+ad2MUxW
         rvlbfJR/zXaKxEcsSzTiYZ42DC59ECkjtzrBcnJWj1S2O3NkjpEIlO36DvHlnePq4CTN
         Bz4w==
X-Gm-Message-State: AOAM531GLqW90FtZchFa10APD/8B3frD9o7yTZ6p6cXn0JEnUQAEzMMw
        mQN12qfgmOD5VMgT1iRcR8j/NuvPcItYufHndeY5PTPHekY7BA==
X-Google-Smtp-Source: ABdhPJwktsI3Vo9g942G/0Agv5Dh9dilurs92+SlJTlJZu9ssbfoIGr7dFuMDuBzdYq7Uc8j2vcwNBHJ39xAViG/x9M=
X-Received: by 2002:a05:6214:951:: with SMTP id dn17mr23979949qvb.27.1620655975447;
 Mon, 10 May 2021 07:12:55 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Reinoldes <rafareino@gmail.com>
Date:   Mon, 10 May 2021 11:10:54 -0300
Message-ID: <CAOZB5GGeSvBiGrwoM7wP6hr2zVJEKp-QcCpQAnfQ6PzehqJpEg@mail.gmail.com>
Subject: 
To:     linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

unsubscribe linux-arm-msm
