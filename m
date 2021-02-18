Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14DF31E47D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 04:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBRDWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 22:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhBRDWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 22:22:48 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D67BC06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 19:21:55 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id o30so137923qtd.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 19:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AOfFYMnuatxitiwGTdhM0Y2gSuDfhn112bMEUZiZo+4=;
        b=AF0r68QjMjeqFKnAwjPiU2wDu3u/0Y/1IMh1z+JiEgziHgReaqTy/eRQO9NkvYiRX6
         vvQqg3LTLSVtc0QKIS+QIiGE14VnH0fpbXTIRpzdhCg8cYtjf89lFRIlOl+oyCCgfD1K
         ztM4KeMNXN8JwHPSvMhV/8jdaWpSqKV6pBMv9cL2/QrSWQGMM7Ij6jba9gBEwu967KBG
         HESGBbTP1hM1PvGYcDkrxa7stgLwq2FyRXsB8lTvximVwKW52qhEfQvphyiUTK7fSN5X
         zSnr/dY2VDzl2Nb/VjnwXYmIdM5hxdcCSxwCt45ewYJ1giUFgqmxlAbToazuan8xOwNo
         PtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AOfFYMnuatxitiwGTdhM0Y2gSuDfhn112bMEUZiZo+4=;
        b=LHonty+7MHmzG+pvkEoesg6nhG0HCuWPOzyKbXktpJ/BqqHOAyQnAE3Muw4bcQwlYe
         cvM3WI3rviNryURN7j3h+sVI3UpGZFj+e7QFHwNMykase1WC+ECT0GakpzEnRfSNAalH
         yhudvOIR4kj9NbwxXGciQ8Gg4fL5eSNeMZW7YCFwv0wWX9G68BD/6Mz92+/c8LzWrmaY
         eThLjJkQizwewnveBRFCGOn1XiX5OvCUiT4+IsIwcC04MSJy3BhDDmnd3L4FYPb2B2mv
         oC2zVpx76/B8hVqMNS5moTy+0dlI6Kswb1G76aWgTcgBi6gw+dOvwAdyjfjWCu5IJ2JH
         cNvQ==
X-Gm-Message-State: AOAM530CKRJ9ls9dOfNhGSknn0Uxo3uGT5LdToWlexStwYDD9VDEy5Vi
        Au1c8dQt90AwBDHqi94EuFSTXgb7wMul2HTi
X-Google-Smtp-Source: ABdhPJwSMM9CqBRAOxpFEQHBSu7SAr6rYBCu4RfKDA1eQENDfnS2fYBzT+X7WSXo1yIjAdLkcaBdzA==
X-Received: by 2002:ac8:498e:: with SMTP id f14mr2513292qtq.286.1613618514120;
        Wed, 17 Feb 2021 19:21:54 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id b24sm2578996qtt.44.2021.02.17.19.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:21:53 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     srinivas.kandagatla@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] fastrpc: fix dmabuf arguments
Date:   Wed, 17 Feb 2021 22:20:52 -0500
Message-Id: <20210218032055.28247-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dmabuf arguments are completely broken, these patches make it possible
to actually use dmabuf arguments (in particular, the second patch).

Jonathan Marek (3):
  fastrpc: always use fl->lock and remove fl->mutex
  fastrpc: move fl->maps list removal into fastrpc_free_map
  fastrpc: remove redundant fastrpc_map_create() call

 drivers/misc/fastrpc.c | 48 ++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

-- 
2.26.1

