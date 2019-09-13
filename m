Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2853B2345
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390929AbfIMPZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54495 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388354AbfIMPZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id p7so3211428wmp.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5yU3rghmAwN9MxI/i5JDus3MW7CSOhhz7L0A/VGfFA=;
        b=zRXRlbz0H6w40kJ5AeH9lKO8XkNrQt9ggCrnpQFdy/UDo+Wctu4pYReuEaFyNnBoxO
         szc/J2Zpv9FxCkEdC2Lq/Pyyt6ME00V6EV3atcyX9+BMRZiZ8Cd/R4ymDBtskrsMbPBU
         Ft7xE39tsOMfe3mvI6l3O7sA6eK5ysUNR6j89AzMVJi4vjn7Fl5MFs2sQTRawZE+8PfM
         UIlic3eYp31eqbvYcQLSS6INpc1WTVWHDDF8tPuPPPg3ByEDL6r2rqR0sgU80CeoBUEP
         LA79I//LlvtAm7u016Dx87HPod3KOqNCnKdnMysbX7Oax0XLbXUuQ8mLL3fLIQ0a82kM
         hDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5yU3rghmAwN9MxI/i5JDus3MW7CSOhhz7L0A/VGfFA=;
        b=DUMAPVB7tqXDTbtB20Hf4uNMZju/H3gSlIiTN6A3F7yujUTt1fohGckKi/T88yDTNy
         m5yzu4Qzy5/6JCSvO0Sueuemj/Lh5XxM3BW4RxKi0a9x4HpvTtKAXnhw8H6a/fG6uLpg
         Qv7kJ6DzvznTtNWVa9MLSraBIjwuiMDrFTAT8LRKBn5tQDSb7fgsS41s0JtN6eZ716+i
         2amEcY+OSpJvoupdkshLrIOgR3jx8WqYEWHqw80Od1KNyDMhjC50eEA6VN/3xi0cgK+4
         dAmEHZR9EiKMoQOysoP4/b2tO3ozKRlhAhGrPpK5Wx3+8ZU6ivdrdas9yltLAvD12D+f
         WhDQ==
X-Gm-Message-State: APjAAAUE3cSSPE8He7Zk8tUcD48lnoWGd00C7sI4pYDyoHz08Z6ePFHW
        kD/bwjfmiHAZm6kFvB+oSSjE9uV72K8=
X-Google-Smtp-Source: APXvYqzXzTQZgybNMkXGYzw52JEoAUdNUxrVU+VZECFsG/Vil6v52cxi0e+tjHjldZTQxZVfM/DBNg==
X-Received: by 2002:a1c:f519:: with SMTP id t25mr3807183wmh.167.1568388336647;
        Fri, 13 Sep 2019 08:25:36 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:35 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] misc: fastrpc: fixes and map/unmap support
Date:   Fri, 13 Sep 2019 17:25:27 +0200
Message-Id: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg

These patches implement a few fixes identified while working on the
QCS404 ML integration plus we now have support for mmap/unmap of
buffers (so the process can be created with less initial memory
requirements).


Jorge Ramirez-Ortiz (4):
  misc: fastrpc: add mmap/unmap support
  misc: fastrpc: do not interrupt kernel calls
  misc: fastrpc: handle interrupted contexts
  misc: fastrpc: revert max init file size back to 2MB

Srinivas Kandagatla (1):
  misc: fastrpc: fix memory leak from miscdev->name

 drivers/misc/fastrpc.c      | 209 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  15 +++
 2 files changed, 213 insertions(+), 11 deletions(-)

-- 
2.23.0

