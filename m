Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094A113A253
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 08:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgANH5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 02:57:52 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36489 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbgANH5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 02:57:52 -0500
Received: by mail-pg1-f196.google.com with SMTP id k3so6020033pgc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rz+1A6+K1PzsFBhkTCJB1epd9yg/lbQ9jkVOeEMF3bA=;
        b=WKA2xbKplXk9+U7EVxjiEyxOePWsDur8y5OxbhG24UzYTyjn21JVwDI7za+TbhHpCA
         9sTjB/ChIBgk58fBPHQlYPNcPR+57/DL+El+VZh7Pj9g1yfYeyOrjaSc33kprfivRP/5
         bHsILXH0OY36TRX1ksCc1uJCWmztzEcfsIReKXgXSsW416Fd8tMGT47A3lWRO3okLQCi
         32qQ5U9B65L6v5m99XvGZkayHtl1IjMWHHCCAj2TVbmY2hwDlDj4SXrO4eVDWixDYXCd
         Y5K9rtt7+4Es5tFomqL0ZOwfU8HvgvunKNKKs7z5uUrSA5XgyuCr/LdpjcQBjbDQzhZY
         3T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rz+1A6+K1PzsFBhkTCJB1epd9yg/lbQ9jkVOeEMF3bA=;
        b=l/6fjnCjbYgli9wE7Kya5GJ6VSDZPpky//jvvl7sRfdLOdsIwXuX/sq8uaG2tNxRXk
         /cVh5XoAY1hPBLnJ561kmu4wm/SBvpP3sdwGxbAkjIlafxuWvpuaIg5X7q2zZOzUjR7C
         UfriB9MDmzT93nqqov9WXGROrkLdVnWfGrWLyjDdcMiPV1vYFVnBrX5faFfVUk0qm0XZ
         sr82VrlL/GEaeV+PCQf3WYCHGAlGcWwog8Td2gXdptSChMR0VNZG7yjCO4dNaPIW2IG/
         jVAy/3PHuTI1ZI+LclckSAW4Smwy2saMRTYZfVx9WfFv+4dpoMgbBvhhKV/Npdtr/b2L
         szXw==
X-Gm-Message-State: APjAAAXCH7qhAZa6RBLJeWuRth7YjKAcL8kTrYbf6iMKkKQfeQ8gBzxX
        Vwkwd+a8wXfS3cyqnJ9AslYft0aND44=
X-Google-Smtp-Source: APXvYqz4KBxXvA7TWAR4lzvTyYHOkRgwFmEqymwdpHQNTuw/iJJ6d9qIPbQ4s+AGZcJ4Uv2xErwBaQ==
X-Received: by 2002:a62:87c5:: with SMTP id i188mr24018264pfe.52.1578988671689;
        Mon, 13 Jan 2020 23:57:51 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q63sm17349352pfb.149.2020.01.13.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 23:57:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/5] QRTR flow control improvements
Date:   Mon, 13 Jan 2020 23:56:58 -0800
Message-Id: <20200114075703.2145718-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to prevent overconsumption of resources on the remote side QRTR
implements a flow control mechanism.

Move the handling of the incoming confirm_rx to the receiving process to
ensure incoming flow is controlled. Then implement outgoing flow
control, using the recommended algorithm of counting outstanding
non-confirmed messages and blocking when hitting a limit. The last three
patches refactors the node assignment and port lookup, in order to
remove the worker in the receive path.

Bjorn Andersson (5):
  net: qrtr: Move resume-tx transmission to recvmsg
  net: qrtr: Implement outgoing flow control
  net: qrtr: Migrate node lookup tree to spinlock
  net: qrtr: Make qrtr_port_lookup() use RCU
  net: qrtr: Remove receive worker

 net/qrtr/qrtr.c | 319 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 247 insertions(+), 72 deletions(-)

-- 
2.24.0

