Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCD966148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 23:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbfGKVjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 17:39:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35750 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbfGKVjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 17:39:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so3558479pgl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 14:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hN7B8WFgbqERacE3IYOfjDfi2Lnw5rUXxCTjyYNVNg0=;
        b=y6k9SG6CbD6cDUt9w3faCzDY41MjHi1ofuFcnSoPHwpygjpAIEzuM8BAYgIlQDSixx
         WiNjtp2ZVShJSSxViBDywPgygDU5vmkrKB5iJ2vAdiUx1KsXCchYLPCxySK9xBcvmORS
         HYSK7+BrQo1QyrEqeVnetfrV5JOPxjwiUqbq9T45uOqbzGnuTt8EXgmpul7XrkybKaAJ
         aNnslKHEAU7ixWp/2h8zSgOc8cD7vC7+1hXwhmmAmNZ3GEIRKDM7FbeTIVPNyXVQ2NSS
         YWI6973/UslklFCWPQVTZkUAqxtgzjdlswBjrQ9HpSMNjTuEQrKhIAjLBIp4T4dPas4c
         b38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hN7B8WFgbqERacE3IYOfjDfi2Lnw5rUXxCTjyYNVNg0=;
        b=s+c5Tk9QkBHHs5nw9rYnVszApG2mUdVktHptoXM/Ul+0a45GQxeTLkTuFf5x2bCrTW
         brSk5sedYlF9ZpUlsynBijeQ6ruDC/EAqDwEy5CAeNX5xTjFeh5s/c9wR8rvQi2d/NAa
         HOC5i4Vp82lk3/Pvb3+tG6tBmW5ylupe1de4XeJwpYKXTNMOrCjIdGhB9X/xdNF7cDKc
         pj1eOfRWTAdUjTSSWgYPgHRATQlryAOgugsF4RuDZvsITVapZ7h4cd+Z5tW4h88tFOiC
         CeT1dE9Evxr0v9MZ9VFiFlZ6scduo5dl7h87jsZ1AD8QNjqhqvkf749c3TcZ/i1FaTp8
         1Xqw==
X-Gm-Message-State: APjAAAWy+6Ja3upqANUSpSjydn2grp5rwxX1ehwi+inZY/FkyZc/p6Hu
        VxRFQ9/xvF+S8gifVWRF15G/gQ==
X-Google-Smtp-Source: APXvYqwO/qoRqMR7KW5Hqj+kJmxD1WculQ0AOIFkYECuq3ZtLW3ZsWIkD8ihV642dt3FmZRSpC2L6w==
X-Received: by 2002:a63:4f45:: with SMTP id p5mr6766087pgl.326.1562881158410;
        Thu, 11 Jul 2019 14:39:18 -0700 (PDT)
Received: from localhost.localdomain ([27.7.91.104])
        by smtp.gmail.com with ESMTPSA id w3sm5709795pgl.31.2019.07.11.14.39.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 14:39:17 -0700 (PDT)
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
To:     agross@kernel.org
Cc:     david.brown@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        Vaishali Thakkar <vaishali.thakkar@linaro.org>
Subject: [PATCH v5 0/5] soc: qcom: Add SoC info driver
Date:   Fri, 12 Jul 2019 03:09:06 +0530
Message-Id: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds SoC info driver which can provide information
such as Chip ID, Chip family and serial number about Qualcomm SoCs
to user space via sysfs. Furthermore, it allows userspace to get
information about custom attributes and various image version
information via debugfs.

The patchset cleanly applies on top of v5.2-rc7.

Changes since v1:
        - Align ifdefs to left, remove unnecessary debugfs dir
          creation check and fix function signatures in patch 3
        - Fix comment for teh case when serial number is not
          available in patch 1

Changes since v2:
        - Reorder patches [patch five -> patch two]

Changes since v3:
        - Add reviewed-bys from Greg
        - Fix build warning when debugfs is disabled
        - Remove extra checks for dir creations in patch 5

Changes since v4:
	- Added Reviewed-bys in multiple patches
	- Bunch of nitpick fixes in patch 3
	- Major refactoring for using core debugfs functions and
	  eliminating duplicate code in patch 4 and 5 [detailed info
	  can be found under --- in each patch]

Vaishali Thakkar (5):
  base: soc: Add serial_number attribute to soc
  base: soc: Export soc_device_register/unregister APIs
  soc: qcom: Add socinfo driver
  soc: qcom: socinfo: Expose custom attributes
  soc: qcom: socinfo: Expose image information

 Documentation/ABI/testing/sysfs-devices-soc |   7 +
 drivers/base/soc.c                          |   9 +
 drivers/soc/qcom/Kconfig                    |   8 +
 drivers/soc/qcom/Makefile                   |   1 +
 drivers/soc/qcom/smem.c                     |   9 +
 drivers/soc/qcom/socinfo.c                  | 468 ++++++++++++++++++++
 include/linux/sys_soc.h                     |   1 +
 7 files changed, 503 insertions(+)
 create mode 100644 drivers/soc/qcom/socinfo.c

-- 
2.17.1

