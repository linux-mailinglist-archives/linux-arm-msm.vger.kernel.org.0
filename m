Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000EA1844AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgCMKRU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:17:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgCMKRT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:17:19 -0400
Received: from localhost.localdomain (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C321320752;
        Fri, 13 Mar 2020 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584094639;
        bh=eOHdzKsuiDRxoSeOKx1T/q3qpP4W3MG5l3YkkamaGsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qsvw6gJC9EUFUTUlvPKrcV18uMpume8SkblzARhMPsFVi4/0BmnsE9jRETmSwJhFJ
         2cFAIRQ9bYNs45hs9PjemzdVn3TNbJ07pUlRBk4NI1vGX2e5Ht/bx+4Chfz6aQOscK
         ft+Hx/lwnuHdCsjvBaE22hGzTyWTKeoltGiIOPeM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 9/9] ALSA: compress: bump the version
Date:   Fri, 13 Mar 2020 15:46:27 +0530
Message-Id: <20200313101627.1561365-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313101627.1561365-1-vkoul@kernel.org>
References: <20200313101627.1561365-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have added support for bunch of new decoders and parameters for
decoders. To help users find the support bump the version up to 0,2,0.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_offload.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 56d95673ce0f..7184265c0b0d 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -31,7 +31,7 @@
 #include <sound/compress_params.h>
 
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 1, 2)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
-- 
2.24.1

