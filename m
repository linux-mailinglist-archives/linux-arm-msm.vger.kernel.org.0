Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C79D0CC5C8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 00:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfJDW1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 18:27:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46994 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDW1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:09 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so4497471pgm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MdgTtpJ3Fb1crDWamPJ2nMkskfT7oSxSe5O6OdgdxZ4=;
        b=ZL7TYe6ZIkKRam213eUarR6XVUZ9Z2pHkS0ETE0nwysjqnhcx4HvOaIh+KMQn6YsLq
         mKjtX2s1h3GN9lPCu75hOOIGG2YwV1kcO/oG3NM0MAGjNs6z5fuRscsGNynGgq4zk3aV
         2VBnpXHocWNZNNfgr8YUWQAm7VnCZLzKa0jC0DYYOquebKlujr4X4Jzy3pYoXyy6+oqG
         6EoXtVug7wgGjGw8Khr+CZvWQ0DT77ILwk4rvg8GREyipXETKPvkdepKtOurm3ynl8aC
         nnyazBw+l7iJro52OaxOnd+RknOcZ3lkI6PxLDL232PF6dH04WcfEnnThwiQ4qKsLcsh
         7FhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MdgTtpJ3Fb1crDWamPJ2nMkskfT7oSxSe5O6OdgdxZ4=;
        b=Grbp9KONxIKPj6b7oFxqKB9HC4r9ayEihPm+0KRBznE0U2nsIwdh75YgFy79l91U/l
         yk+iUKX0DdXM0kaJPq4JMEqiK36tvLonqr6bJnzcGedECjAuy35joLA14GzxhjQY1FUL
         TC/GPsX0qGInyaVkCfu4LCd1/5eqePs7qGmYPrWCS1G0bdDU5xEGDkYW/EdCCY8MxC5c
         jV+CLK+DpX72iR3b6t8Pe7+3Pccl8W+ABlp7KL9Zqs8+eMUtbQTUQFsjCtR9Yrz1Qs6i
         j+TQr15V65wBcEcEZi6IRYjwnVwbxV0eUa0iNyfYsB/Pt4DhvDkireNSa5l5PreeLPUx
         epZw==
X-Gm-Message-State: APjAAAWmcJzQMMNmtqHxfY3CCpJPR6iBi4VZv6SrILgIdfhi7F6iQdnY
        O9tIH3+ys8OH/tKgh3Xe5Ewb6A==
X-Google-Smtp-Source: APXvYqy8P355fDdWZ7Bjd78TA0Rif1EjY23uAZcQptugi3FT1XaYfKGFi0ye/CSlumDYU5zIu9qqMg==
X-Received: by 2002:a65:500d:: with SMTP id f13mr17876281pgo.359.1570228028355;
        Fri, 04 Oct 2019 15:27:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] rpmsg: glink stability fixes
Date:   Fri,  4 Oct 2019 15:26:56 -0700
Message-Id: <20191004222702.8632-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes for issues found in GLINK during reboot testing of a remoteproc.

Arun Kumar Neelakantam (2):
  rpmsg: glink: Fix reuse intents memory leak issue
  rpmsg: glink: Fix use after free in open_ack TIMEOUT case

Bjorn Andersson (2):
  rpmsg: glink: Don't send pending rx_done during remove
  rpmsg: glink: Free pending deferred work on remove

Chris Lew (2):
  rpmsg: glink: Put an extra reference during cleanup
  rpmsg: glink: Fix rpmsg_register_device err handling

 drivers/rpmsg/qcom_glink_native.c | 52 +++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 10 deletions(-)

-- 
2.18.0

