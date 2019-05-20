Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 324A2238EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 15:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732363AbfETNyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 09:54:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41570 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732334AbfETNyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 09:54:02 -0400
Received: by mail-io1-f66.google.com with SMTP id a17so11064123iot.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qLnbwDX9nYp0llQixdztrdIhtIxceeBj4sRkANMpAsM=;
        b=GjImSPDJy8ShaSr+Kmu8fSik802cD/opDqpkNym+Rodro2w5D8/smsz5ZmejQAI+3y
         rsMqynEsw+xD73XJE5d+sP0np/oEVRcnrXkMM30Bicl9+VFtXV9SuzefGaTp0w4dWx2d
         gi5l9+EIC4mBj33w5DZLCU64lejWFarf0dO7qDS6jpd6go9WsencnubQbU03VtsuVQGB
         Wi/mc7Rfz9MNa5VQGnlpXL+mSKXz08kZGb2y304tqMZ88wLNA/kRxIWRufMs4aVFw1eg
         THnozwMZuhU1xKj5vFnIDhkCPEcKJuuwv5I1KzcdIDa2FRbX69m2+OO9aXrAu/pemwyP
         obCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLnbwDX9nYp0llQixdztrdIhtIxceeBj4sRkANMpAsM=;
        b=gDH/alfJWmJHMxay37uJ0hU4Y8OD7KspE6fK/ORkfaLXLcDtUgEBdYPI/lqFsN5Fs1
         78nVouAHZtWs1D15UuHu0cY0HGnw4wH4afxYQZ5Syn+X2T42K4Xw4GNX09Ag8pYBr+Bb
         NcihusYMHNp9ertJYwAPjNpF3n0/PXI/7HGDMOgzR9TUuDKco4Nl+HgtVdUSXONVab7v
         kxdGR00VtgHn98tLnDSGjraxAoikKKutfW+UkFOmeJS6+uMkCwjHzn6jtQ8hAdLMA3KU
         Te47VVn5Awds2qsgVKPuWmIGS3HFPz8CuSSREh5Gan9v1Zx6xFjaCz8ZMFT8WdGxhgI7
         fMHQ==
X-Gm-Message-State: APjAAAW+/GUmZxUMdXvJvf1IIMLs7EcwsPnOAydkX70gxBIqjd1mhDZT
        0Uy5OASQcS6Gkwslyvr44fhYnR9PCeI=
X-Google-Smtp-Source: APXvYqzqoaiVRHeh1u5raWwifMwfTaaj0AJU7hX2u6GIaGAJpAwDTwJ/wtrswXd4pH9nAZw7EOEz5A==
X-Received: by 2002:a6b:f305:: with SMTP id m5mr40986039ioh.271.1558360441814;
        Mon, 20 May 2019 06:54:01 -0700 (PDT)
Received: from localhost.localdomain (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.gmail.com with ESMTPSA id n17sm6581185ioa.0.2019.05.20.06.54.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 06:54:01 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net
Cc:     bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] net: qualcomm: rmnet: fix struct rmnet_map_header
Date:   Mon, 20 May 2019 08:53:47 -0500
Message-Id: <20190520135354.18628-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520135354.18628-1-elder@linaro.org>
References: <20190520135354.18628-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The C bit-fields in the first byte of the rmnet_map_header structure
are defined in the wrong order.  The first byte should be formatted
this way:
                 +------- reserved_bit
                 | +----- cd_bit
                 | |
                 v v
    +-----------+-+-+
    |  pad_len  |R|C|
    +-----------+-+-+
     7 6 5 4 3 2 1 0  <-- bit position

But the C bit-fields that define the first byte are defined this way:
    u8 pad_len:6;
    u8 reserved_bit:1;
    u8 cd_bit:1;

And although this isn't portable, I can state that when I build it
the result puts the bit-fields in the wrong location (e.g., the
cd_bit is in bit position 7, when it should be position 0).

Fix this by reordering the definitions of these struct members.
Upcoming patches will reimplement these definitions portably.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
index 884f1f52dcc2..b1ae9499c0b2 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
@@ -40,9 +40,9 @@ enum rmnet_map_commands {
 };
 
 struct rmnet_map_header {
-	u8  pad_len:6;
-	u8  reserved_bit:1;
 	u8  cd_bit:1;
+	u8  reserved_bit:1;
+	u8  pad_len:6;
 	u8  mux_id;
 	__be16 pkt_len;
 }  __aligned(1);
-- 
2.20.1

