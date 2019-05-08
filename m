Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4605B170B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 08:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfEHGGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 02:06:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33655 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEHGGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 02:06:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id z28so9945412pfk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 23:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VL6JgzPEvyYwDsgy9COt0nfgYdULxflvPEbEkBc3IBs=;
        b=LXuOtmF81sUb6ZqftugF9mg8zLPkFF5Kmi26fPIhKOx4T/pWiUvQjqhK7J9QrKYjf5
         n0L3cd379N4tZNhYhLMS29uaRLnb+hPrQMXTJuXiuqJsxEl9WrJhMoQIZT2nldwlRf/u
         fvyRKP8iEMg0ZB70K0tObwNSVGEXSBZhkw41Ik3DEMREkcgqocf04AzspFl2nDWSBCjN
         /T7avC4+rkVAgpos82U/KkFG+LJmfqGrgNv4fEdjXERNzH10EUaMQpvs61HA+6KrxQtN
         hwHW81OnJWDhQiNH/oqP0tAeXTRiEISMJS18Jq0XEvWgTL0HirZFb0YSoe7TQx3TB1go
         QUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VL6JgzPEvyYwDsgy9COt0nfgYdULxflvPEbEkBc3IBs=;
        b=Cyn1qtrugIOjlSUuE4T8s2udJEGt5OulhAo3+bpdnde9Jzz1wilTCIm8Mbf9Iw5jFI
         KU2LuMy4VrUatB4QVf/8OrI88v5vualUZcXML0O+JCKPp6WD+ww2pjIuahh9UwP//cWU
         r0mKbWHfpzDCRRogL1hr7Si4cyc1OBtJhqdjQy/Ohp5TeSHrdVS5CXgdh2dWXj9ggO/S
         oR3U/VWaWF5bTs+W5wMmdAA0DObnw0ro1eQLLW94lMLJ9faaocUpJ0rKchzoILSxQBII
         tD5S9aFL7TiyVQkBfN+6PnDGDDW5J7tsm6JF5QEKGPwqZansnNkNTOy6+qBh2yugJqfv
         y5FQ==
X-Gm-Message-State: APjAAAW179S1uyF/Tl59bT4umX5Ff4nag1XcTmBl1xlGWU7MbanBgqkP
        QfErf39LaUwRBuhL7acWAy+tGmRqM+c=
X-Google-Smtp-Source: APXvYqxx2vFAgOmHdaHvQ8kGexENoX08edWIpPpZ1HgG4mkaX+MxpCauUS3la2l3ZMzylA+ka6qW/w==
X-Received: by 2002:a65:628b:: with SMTP id f11mr43010659pgv.95.1557295607391;
        Tue, 07 May 2019 23:06:47 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t5sm2756130pgn.80.2019.05.07.23.06.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 23:06:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] QRTR flow control improvements
Date:   Tue,  7 May 2019 23:06:38 -0700
Message-Id: <20190508060643.30936-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to prevent overconsumption of resources on the remote side QRTR
implements a flow control mechanism.

Move the handling of the incoming confirm_rx to the receiving process to ensure
incoming flow is controlled. Then implement outgoing flow control, using the
recommended algorithm of counting outstanding non-confirmed messages and
blocking when hitting a limit. The last three patches refactors the node
assignment and port lookup, in order to remove the worker in the receive path.

Bjorn Andersson (5):
  net: qrtr: Move resume-tx transmission to recvmsg
  net: qrtr: Implement outgoing flow control
  net: qrtr: Migrate node lookup tree to spinlock
  net: qrtr: Make qrtr_port_lookup() use RCU
  net: qrtr: Remove receive worker

 net/qrtr/qrtr.c | 265 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 196 insertions(+), 69 deletions(-)

-- 
2.18.0

