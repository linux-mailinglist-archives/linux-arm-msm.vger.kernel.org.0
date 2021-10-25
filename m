Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A434439DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 19:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbhJYR4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 13:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbhJYR4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 13:56:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F68DC061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:01 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y7so11454707pfg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NWUvgRyijjqbAVQxHy20qqHdbusKkGojAXVqW4EMoqA=;
        b=GJV40aD2l8opt769Gkc7/IyTI+ksDDGU/CdJFELrYvDy99Z0YhQAcJa+0WRXXrtmVy
         bx9TL9IYIxFt+eVxm/ueMbrLZzDLwIZt6MjgYYoj/x++TRvunG08aYFg0eWdrrJ043jU
         4weB7osEXLpdabmFGpnttmFwh6qeyr5+JQOpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NWUvgRyijjqbAVQxHy20qqHdbusKkGojAXVqW4EMoqA=;
        b=DMVYP5JkwvtbqVSY8S1iLfTsRvACEL5zfLXs1136wXN3KCuYi25G1DJzKT2ZnZ7wiR
         1qzJS/06J1LXCBQFjorHTs50RUo8h+pAO4PMhk6vdsheq/EkteVot1h9dVHJVkm1ec0p
         Ueu5Vc8uKKjh2rgoEFQTuCPhnH+K5ubT5UKU6cBSqQ2LeNeHr5+roP+4ppN0rxgh33IZ
         NCianoFJmkN6n3R0GSyWYDbKSEYGGvmgUw2ebQt5bOOyZMGWRAYLVdyZ6D++ThnknHki
         sjtPEMuSuUJrKHmllM7XHRQN3ijJfvHFZcjQbh7RdysoeBdxTtxvfM3YcA6cO3XNYNUf
         7FFA==
X-Gm-Message-State: AOAM5302UUpaZt8Q3RqTtmjE/i4ovzNVRiA/irHEz62L3FZEAs3WV871
        b3huJR8Mk95jaQGD7gfIkK1mIw==
X-Google-Smtp-Source: ABdhPJzJXP3VQ8FsZ060sIKG2pY6s7nrHg96kXMR9YaG74tNi8hW4blN0H2/fENXBXc1OexevbdoiQ==
X-Received: by 2002:a63:9318:: with SMTP id b24mr2989617pge.404.1635184441014;
        Mon, 25 Oct 2021 10:54:01 -0700 (PDT)
Received: from localhost ([2600:6c50:4d00:cd01::382])
        by smtp.gmail.com with ESMTPSA id c4sm22755029pfv.144.2021.10.25.10.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:54:00 -0700 (PDT)
From:   Benjamin Li <benl@squareup.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Benjamin Li <benl@squareup.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] wcn36xx: add missing 5GHz channels 136 and 144
Date:   Mon, 25 Oct 2021 10:53:56 -0700
Message-Id: <20211025175359.3591048-1-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2:
Rewrote commit messages to explain why the changes are necessary & provide
explanations of jargon.

Changed author of first commit to myself and removed Bryan's Signed-off-by:
due to my changes. Added Bryan's Reviewed-by: on second patch.

v1:
Think Bryan's commit was accidentally lost during upstreaming of his original
WCN3680 support patches, so I've included it here.

Omitted Fixes: tag as this was a regression from downstream prima, but not a
regression from previous versions of wcn36xx.

Benjamin Li (2):
  wcn36xx: switch on antenna diversity feature bit
  wcn36xx: add missing 5GHz channels 136 and 144

 drivers/net/wireless/ath/wcn36xx/main.c | 2 ++
 drivers/net/wireless/ath/wcn36xx/smd.c  | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1

