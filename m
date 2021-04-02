Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9E0352974
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbhDBKFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhDBKFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:43 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD7BC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:41 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x16so4308608wrn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aDqQvCRa3kdfOyvfWacjxvKlUGJz1tew7Y5b7q0Z5aE=;
        b=YFH9+bBCpogKNSZmqzps1VvtLkavlabqgxOt0LB78PW3SnOfwPQxTlkmmp2aR+zia5
         vtqBYDI9+9jEuKRr7XtCEdMqSaNsf288IA0jNwt+fkuE5f29qaj96Ix8v27GESHjXr0i
         adIrkXAkeCh94eqyehP1mo9GWO5GSzuNLWALCHG/VyKO1E7DXgqrYTsc3N/MvryaZUzi
         0O39INlDGMPCmZzPCqb89WpR9GGhN4TW/qcmBI0guKPT9wux7N38xMUFkzAI7Scr25xs
         1IFZr0fAdRfGwm9a+tcSKOrl4lVd9plNA53r2w0fiJaaC8x/HcGdVU7zd1cBfF2c1k0J
         URmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDqQvCRa3kdfOyvfWacjxvKlUGJz1tew7Y5b7q0Z5aE=;
        b=LW/f/L8fVhdK5QGsTd5CALTUbFESrde+O00/6QrT5WXzyirb1k0qfd8+++/9TAnOqv
         AuR0Ik5No2ngNn958v2cbCjAcuot+VGA8pjZSQ5+fxB8odpOpiaxU0Kt6ZU22Z943ZQs
         /SJhIXHoAhyN5S7flhc0ZLv+DvPhKoGlyv80WR6co8ZzNjCSLMJ1c/87WTo4MhVHF7eO
         1wcKB/c/ukqb6yyDYmfI6irKjEMo0q/Xrw9uwWIio6ITR0tqgEL9jdRB0nrYtQRIuf00
         gly2V3e1wUPcCOypyEYWFcBuD1dKbziEHceAvYiWFF8Ir6xR0rCxnahqbawsPe4oV3mC
         HTVQ==
X-Gm-Message-State: AOAM533RnZDBm7T2ebLF4mHx9oytrILOUw28tzlgJniaCBlFau7OVjrr
        s59Zjp0B248dMxYyA+qubTYv3w==
X-Google-Smtp-Source: ABdhPJzpFt0pBzp6IwLvJYQAIoehMWFOmkW0wDnyWOYgY4YlIkErixZi2x9t59RhKxeld/whrCE7tg==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr14153031wrx.208.1617357940412;
        Fri, 02 Apr 2021 03:05:40 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 23/25] media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
Date:   Fri,  2 Apr 2021 11:06:46 +0100
Message-Id: <20210402100648.1815854-24-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Presently, minimum buffer count for output buffers for h264 &
hevc codec is kept as 8 which might not be sufficient for
few use cases so increasing the value to 18.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index 776581b99cd3..4979d493f4d9 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1159,7 +1159,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
 		case V4L2_PIX_FMT_H264:
 		case V4L2_PIX_FMT_HEVC:
 		default:
-			output_min_count = 8;
+			output_min_count = 18;
 			break;
 		}
 	} else {
-- 
2.30.1

