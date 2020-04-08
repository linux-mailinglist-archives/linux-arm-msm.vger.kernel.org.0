Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09D61A2B45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 23:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbgDHVeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 17:34:17 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36814 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730783AbgDHVeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 17:34:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id w145so6327635lff.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i8clFFvhHtURStOSkT8VPHksSoNdpLFd6h/Iv5cyGI4=;
        b=LnInvZrdIwupNbyGWWNiLyou/EL25bZac5eBr3jTVOIfPEW+fE4DypVYwGBMQR/ohi
         fz3GmUoCkoIQWq86bcc0NR4/uLND/ulWi1n90PaOt1C4xNZ0rydmjkToAOnIl6dyh2Qz
         ORP6KVN7HP9MipYbv15xeQf0Khg3Ts99bfLeksOG7tT4GRHGSgpVVlgZnS0zq68BPcJF
         8GECRu1EQDr7ptBiqZBFqJ0J1LgAyLNLoUaiKTExZB6I4iaOzUQCHMKtWKntxWKWxEdn
         ga0+B9sf+h5bikFzqacmy/T/YhwbvTU7Z1FEup/UHx2sqyVAAR1NnkFA7lliMFZ8GnPf
         bp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i8clFFvhHtURStOSkT8VPHksSoNdpLFd6h/Iv5cyGI4=;
        b=ArdvU2Cn2/QXlCYJIsxpXZMd7nc2on1LsyeeSfusXaQhJVLluyMVf/wcIewopFohUo
         QkiD8CgT9yUg3GL3gOW5gaaE/vvNBSPolEbgwpVC94E628gwfyf1uTxvev9oEIsq9IZG
         SP8ZPQLwKIQELrd2ND8zTmhebJ9RcFNxloPU4B/2yLvKpZgZqp678bPe0rGn+iN6UqFf
         NsD+l/pKNnhPMxG2srby9i+L7h9w/OI+g4zNADEgHyADSCd3F0Gyy3ygs9Sw8zGtMyJ0
         S64onUnAyJtvZ6ctkIwejue+E3zmXO1alQZ9D21pC5k4CS3oq7qGwqthSz5+Ak69bX01
         kBuA==
X-Gm-Message-State: AGi0Puatu4wJHRlXzLYROLsx9f3ITWP/R9jDJkHNUnreswYVNAHwW59Z
        Fs9SBBCNzm5Tkm3FbNawpXARJQ==
X-Google-Smtp-Source: APiQypIafYSBQ7sBXl2z33XJ4IVDpuvO6hb/lUDU0fCXq73HvkPJCCXY3/XQQspt3/SUnsH3GZurEQ==
X-Received: by 2002:ac2:4da7:: with SMTP id h7mr5216375lfe.95.1586381651346;
        Wed, 08 Apr 2020 14:34:11 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:10 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 6/7] venus: vdec: Init registered list unconditionally
Date:   Thu,  9 Apr 2020 00:33:29 +0300
Message-Id: <20200408213330.27665-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Presently the list initialization is done only in
dynamic-resolution-change state, which leads to list corruptions
and use-after-free. Init list_head unconditionally in
vdec_stop_capture called by vb2 stop_streaming without takeing
into account current codec state.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 5823537b3131..f23cbd812ef4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1072,13 +1072,14 @@ static int vdec_stop_capture(struct venus_inst *inst)
 	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
-		INIT_LIST_HEAD(&inst->registeredbufs);
 		venus_helper_free_dpb_bufs(inst);
 		break;
 	default:
-		return 0;
+		break;
 	}
 
+	INIT_LIST_HEAD(&inst->registeredbufs);
+
 	return ret;
 }
 
-- 
2.17.1

