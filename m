Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 453DFB0A53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 10:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbfILIaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 04:30:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52715 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730166AbfILIaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 04:30:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id x2so1105456wmj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cqzuGZoym9FEk7gYB3476i+uOhYWCF5S/jPvzlZG8fg=;
        b=PO1eVqH06sZ0c21pOCfkvDiG+rH4UUPr0QVMoyijSFhI1rEs+Saiik5zH6V2qzitv+
         tPYO4FPOEOgQbEP9WRebZysmk7OYoWtRCU+VEDZBWd4UHQvuMy4SKHgD/ppIV/JFhlF4
         8jfDnZkV/EG6VAtslQEP+NxPQdbZhNZFrpLvzzH2Mv71wpC6YMAgszzeFzI49F89VCwE
         6RtA5CTCyZBDL7e6qWt8MsKC+siGpXgKhNwXRqYmUtw2tL107DB0SzZZAuhmbi5aEhxA
         IRbevC4URQe6Wr9FE7JgfYrPrkdZb4zdyMuAV+MjlSHb9gD+DWAevK4TCU2shrITKDhq
         KEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cqzuGZoym9FEk7gYB3476i+uOhYWCF5S/jPvzlZG8fg=;
        b=PoYh1AlwQgZcWFe00WV2T2CVbtxznF2Xr2mdIrTpxOeZvcGKklI77sSUcNa754glqO
         QnSyovvs9CnYOHoLU7m3p5I0zD7zx3gdU5Aaaxc16TSO9bMmG09NMZgp02VLJ2PYTrVI
         YNLRTjzeFCrNDM52RHmHh9UvuSnszoZuJDHYGzmZRwUY/hGHfKrEEBuUph4teCBqR3rl
         j+u8olRgg00WzgN4fwA1aLFyuQImkV1ua95jtXztHN0SVvzA+x9Xmrm4tnQWKRuseiDr
         09azd8LcXbCtqWiPcGSZMdxfVAKc62UpH0GkBtKUSIl0eUwVNuFmz3kaAupsUINuPRBI
         3siQ==
X-Gm-Message-State: APjAAAVDXE2Bv0/G3cvAdNUGESL+4Y1v4U/CQMRAIeAZTxD+Vi234qNK
        AgygI0jRTVnZekJYFGnofBvB/UpMHg8=
X-Google-Smtp-Source: APXvYqwYiDdzKRqCJnoPo2p9S9CPrEEXB20zsEsHTgOhYMXdxJZ2Nw47zX2yALtzjs2dQc1lvu1iWw==
X-Received: by 2002:a05:600c:1106:: with SMTP id b6mr6048249wma.127.1568277006590;
        Thu, 12 Sep 2019 01:30:06 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id 189sm7100877wmz.19.2019.09.12.01.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 01:30:05 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/2] Venus interconnect support for sdm845
Date:   Thu, 12 Sep 2019 11:29:46 +0300
Message-Id: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here are two patches which adds interconnect bandwidth requests
depending on the resolution (macroblocks) in order to lower
bandwidth pressure on the interconnect and memory.

Changes since v1:
 - correct typo in the 1/2 patch description
 - add a dependency to INTERCONNECT

regards,
Stan

Stanimir Varbanov (2):
  venus: use on-chip interconnect API
  arm64: dts: sdm845: Add interconnect properties for Venus

 arch/arm64/boot/dts/qcom/sdm845.dtsi        |  3 +
 drivers/media/platform/Kconfig              |  1 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 5 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.17.1

