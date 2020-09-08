Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FE3261DD2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732365AbgIHTmx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730874AbgIHPwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:52:37 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90880C0612B1
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 06:11:29 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 16so5821579qkf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6PZaXfU9lSNNM5STxKLHSbdmpPO4mfVbzPzM2HEmOU=;
        b=2HYi7leTJH91BZbuOyAcGGekgns8wnQpVx1NmiD8t2s1KvGXkPdU2GaaIyofGc1rFY
         1HAA71lu4tUzVwKGXzVA8BP3rqDCZa9jJ+zXWeTc+uSdDdhb2xyZl22TPhng6UWSfUCF
         n+/NB8u/8bpw9L+plqC2Ho7/gCiLgBm28fQjdqo7+ZfKukrrYeUin0giOkSdHOE3vo3J
         sN8mCXqMRxUY+v5A00+qx3Zyx0vD/ffQY4JWuMVnjqZbjcO1526wjzMNObXMjnTCN0gk
         /rparC5vd39212atJ4ua76HwUZdqBKv+Z2IoZoIt5hhTOSmfPSWBlxCjvLB93b4yek2h
         PY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6PZaXfU9lSNNM5STxKLHSbdmpPO4mfVbzPzM2HEmOU=;
        b=MTwV8tGdMui0gN4Iwpq/PDOwKWp6xpGmY9cD+Y6X7jBRV/pr0Es3WvMoIxTFG5d8dr
         EIlgKlTj+4T2MFKvYD7Okb7kj9GpBAQ3IKyXoyrvNzckSVrNdxO3srixvW4EuYLnfGUT
         rzltqoUkCzhh31ayffQ6i+7YAR6E/WDflSsu2M1g7EMPtQ+gn0kUU75o7Dxrmqvy/g+B
         1nWYoEiKkoSEjFyYYcrDqjzrlW4ssn6GL2CcBtoDVXGwa/euOWbJUy8YTtwbm3kFUxPM
         4gMuP7/nX4SB35LRSa2gt1VV6MOTi6rU2IiWvv477mCWz+/3C50Sb5vCVhdujNstsVCH
         a58g==
X-Gm-Message-State: AOAM533TtFb3Cl8mlJm0zDWggeceN+qPOKYxljLioJ1wBqhMUZ2P0dTm
        YOt1TkXP0VwpmOIGu5bbzkUTo1tepghkUpZbE04=
X-Google-Smtp-Source: ABdhPJxIqsYRJmgOMoluDb68Y23V5yFz/PWJz14N3xZDX7JJaWWTqdlV3IIK76fYQLTTBEeS2i8B/g==
X-Received: by 2002:a37:4b84:: with SMTP id y126mr4100qka.148.1599570688312;
        Tue, 08 Sep 2020 06:11:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m196sm13394069qke.87.2020.09.08.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:11:27 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/3] misc: fastrpc: add ioctl for attaching to sensors pd
Date:   Tue,  8 Sep 2020 09:10:08 -0400
Message-Id: <20200908131013.19630-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initializing sensors requires attaching to pd 2. Add an ioctl for that.

This corresponds to FASTRPC_INIT_ATTACH_SENSORS in the downstream driver.

v2:
 - define names of PD values in a separate patch
 - split out identation fix in a separate patch

Jonathan Marek (3):
  misc: fastrpc: fix indentation error in uapi header
  misc: fastrpc: define names for protection domain ids
  misc: fastrpc: add ioctl for attaching to sensors pd

 drivers/misc/fastrpc.c      | 16 ++++++++++++----
 include/uapi/misc/fastrpc.h |  5 +++--
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.26.1

