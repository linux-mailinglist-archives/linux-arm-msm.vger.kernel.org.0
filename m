Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B588D8CEBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 10:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfHNIrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 04:47:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39943 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNIrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 04:47:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so3708673wmj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/+yqj5iDEOb/fVOsCO1ED+9HZ4hDgi6+BjHGS7ALHlI=;
        b=ftcdFcJFnojSaAVRgoj8t0YFQ6bc0oLXrca+8lALcViUCbDsN/2MYAYcbvxuXPu5S2
         p+BJAQA2e9xcNQyBqNVI7F1Dcyz8RAhsCOsHe9li2ZnvFIOuEMJbJd6vdHypimzhIVvJ
         Trsk57hS17GmTp3qGFr99J0f7eDPdT6pBHMQf0oqQbkIXqeGelhKPSKR59+VKVXME320
         JD+NHJqykfCMxhqd38zSgjdzixC9SKTObAe3RbFe1INPr+RG5zvLmiwv0QSubOLxOnLW
         7QCxg7n27BhLIVSeAxBaSMMx8/ay8AZCIIfV0DQmxR90k2c8D/hh65ULIMinG0JuHoWs
         FBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/+yqj5iDEOb/fVOsCO1ED+9HZ4hDgi6+BjHGS7ALHlI=;
        b=fbdGZSSHUI9x4jkIE3YXJQY4bn2v325n/T+tT7MO4PFuu0v6+7/mPbQD9aF/NP97d4
         gy4EoImLgC0thCw6rqZWk+naVR21kaztpkNSDkOVhGyk0IwLpD9c5U7Ppk2/r/UR2YWT
         tV2QAxZXzTWQV+yeZhE/WNzLwJlh7Q0RaoNfvI1Gr1sRIgO512qBT+Ta43QssHjBl9HW
         Lk1iZDGPW101kXk/eG0h3TgHhYorzCVYmrWBsHLOsmDE81gMPq/t8CLvYHSHK8AIJ79e
         bjSVPIpJjThag7MeKNW8043crSO0yIv3BUB2je43mAkRGjQ52HzDWZ89KyXFNZyYUF3N
         yVBA==
X-Gm-Message-State: APjAAAUWYzwg2kiMSn/GdZLxOQriWzgLEcvIhDCe52CTXNPZtUfVfTNV
        CKo1Btqb0NJvDRrpSOwvEcXdyg==
X-Google-Smtp-Source: APXvYqwy8UjmeGxcUiBkY/7MBPqm+9sdDqx0iBl9OOhWJbW+/fCY6VXHIqHD3sg2P9E9oI1FJssNAA==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr7428220wmj.165.1565772442346;
        Wed, 14 Aug 2019 01:47:22 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id u186sm7176141wmu.26.2019.08.14.01.47.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 01:47:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus interconnect support for sdm845
Date:   Wed, 14 Aug 2019 11:46:59 +0300
Message-Id: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here are two patches which adds interconnect bandwidth requests
depending on the resolution (macroblocks) in order to lower
bandwidth pressure on the interconnect and memory.

regards,
Stan

Stanimir Varbanov (2):
  venus: use on-chip interconnect API
  arm64: dts: sdm845: Add interconnect properties for Venus

 arch/arm64/boot/dts/qcom/sdm845.dtsi        |  3 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 4 files changed, 117 insertions(+), 1 deletion(-)

-- 
2.17.1

