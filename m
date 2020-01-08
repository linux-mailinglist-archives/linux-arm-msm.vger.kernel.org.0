Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305FE13396C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 04:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgAHDJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 22:09:50 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42618 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgAHDJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 22:09:50 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so858290pfz.9;
        Tue, 07 Jan 2020 19:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IVKJwWRb799YarBjaEupV/+AZd6qpWqomZcRlxpziH4=;
        b=dcG67RSDeissWwWGUMFWQy0ewfmJHgoOC3cG74w15IFr0fT17shPSWD7nrkfCFFuiT
         OYJiBAb13k50XE8em6SYsm8425I1u6kRx3UyWEmm7iTRv4W7BgXl0ZKtu/BX9T9W/7o/
         +sGJSt4wJS8ZPQfN450vvdRWMGdaUwGO7uCcB2h0HwwQm1xoSia108+lD/MMWQzrjteJ
         YZ/zmMTXg+ssBumLg9xe+dIjV+ZNAmD60mSkDh94mmDcy3f9VJ1ONclIoYk0FP9N1bEs
         C9pp0Swx+2sgMygw8Fgat+ygg1aMm/dnbWMdUhf9qc+fbBhBc68NwGb46c/rulzj60g9
         jjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IVKJwWRb799YarBjaEupV/+AZd6qpWqomZcRlxpziH4=;
        b=gENpKDGJ5RS1Mc5lxiEE2zqi9cIB9aBmaZfWFvBNttnS1U3y7JrACLKOCBGJlq3rQW
         X8ghOM/skN/1//NnvFTZWKk9LmxXr2mcwPjRPWgTZwE/NBB0anEjITOYrMXdCblVfPK6
         8v7u584H31EgnbSH4ZFfMlJ0MbJsFj2DteRAxmnZwyK5hvCyms208sNEaw7im5zlJHtK
         dlEG033kic1yTJ191YDYzfc6dz0suAyDDOFNQfrjukDw7nHiZ59v8AIVQiUlR4xE5RDc
         J5yfj2AO66PW5AgWBbQesqEZuTS+JrfXmejgahg2cQ/e/j3zzsZL7eRSjFbJsdHqmVyt
         d7ZQ==
X-Gm-Message-State: APjAAAWxqxXhE03i9G85YT1xTht6+FQTvD29svPMPccwVrgC70kIkDm5
        UXWIxDxjJrHmXCy201OeVGs=
X-Google-Smtp-Source: APXvYqwF9xbyXgjqvvO4QzVvKYZABKWyI8Zx0WfWaQIdag+lwTPI2vUU7MuJFZ2og3YhAQL8z19fQA==
X-Received: by 2002:aa7:9484:: with SMTP id z4mr2756831pfk.88.1578452989513;
        Tue, 07 Jan 2020 19:09:49 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id l8sm946980pjy.24.2020.01.07.19.09.45
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:09:49 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/2] Some improvements for Qualcomm hwspinlock
Date:   Wed,  8 Jan 2020 11:09:09 +0800
Message-Id: <cover.1578452735.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set did some optimization for Qualcomm hwlock controller,
including using devm_hwspin_lock_register() API to simplify code and
removing redundant pm runtime functions.

Baolin Wang (2):
  hwspinlock: qcom: Remove redundant PM runtime functions
  hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/qcom_hwspinlock.c |   28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

-- 
1.7.9.5

