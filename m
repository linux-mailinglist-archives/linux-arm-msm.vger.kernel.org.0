Return-Path: <linux-arm-msm+bounces-17530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D738A60E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4824D1F21DC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FF7111A1;
	Tue, 16 Apr 2024 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPGJg1RK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1684F9F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234057; cv=none; b=e274hoFYe3zpaQ9Mo8ccnFUxiKOhxfJJxoHOPbpXPd3cRAtPtqny+KOMw+q+ulmZbXWckOR1MLwCEClkr0ytcF092iNbGdACJPB87Fg9bU0S054zsap2zUClTAcMSXwsos+KemjVWZV4hvegHRB1ymI4ewd3JGHHnz1H03MD1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234057; c=relaxed/simple;
	bh=fLBUVhm80MEGUyFw88Q2hANny5fpYGerXuNj+lhzOWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQSh4HpFWwyH38y9yJy0rwl+6RwwHHVZ25TGalSXzEwSpcOZ72UNvL15EVAoSHnOceQ+sLwWQ5kZo+fwkMVQPedW3q7jHFQGepjcgQqqSrTNP9Nn4GKQau8djIR3H/E9jaVOTz1soWmh3MBmexGUTCrLcQd3TGL2WQQgQl7VsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPGJg1RK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516cdb21b34so4961052e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234054; x=1713838854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHxwhq0zl9ZRtzSFcxK+ZjtubWs3/u3trHybLaY8YvM=;
        b=TPGJg1RKXZF7oa9xmVKBYOLVaKLIQPW4TNTBa+UNl2UMBLMNDCgzbOkAXGWQtAPWtV
         EuzmQwsm1wC5AbpJoYCsRUzhnt2pwfqUu2pz81OT7RUTQ98N5Vh3bCng3MeziddTzc6c
         KfCYJGROmzxfFi5TMQJ+avjgvZdokVd6qw5PbmPvVtW/dAGAAqWhj3cJlllLGE6XLIGQ
         NN3TtG1v3LdhE4EdX2YLrEnZ4gSdph2QlTsbdOi5OdS4rp/6Dvr5u/pR7Ca8jQuQ0uNa
         1SZ6zAItNBx96OAYV3IBy5HwrzzGx7HaLTDnTDrcNrspJnOw6pjFohu0EQhZX3Q4vHHG
         WAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234054; x=1713838854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHxwhq0zl9ZRtzSFcxK+ZjtubWs3/u3trHybLaY8YvM=;
        b=QFl7cXFJuIA5D91Um/BooqlP8p4gZSi+hHaiIiLrDvigy8Z1xcSpHIvoNi+p7VN7+o
         QTY+KGS5iBb4Nwy0M+M8N620UGspUPvztMY6adUXwQ7fQLEwBWMwFpZ3o9xTGGUQ/qkk
         IGts/1ARvBY761dlvgpnr7gzfqFYnC5ElwXprtr5UyOBPZSrv40ao1S/4ViWApUbR549
         aju75RGTCAyCZPidNIUmJuA0iMWdCd65kd84OyiiNHNGc6KpDne8i7rhXuDdVDea6Gep
         Qyl0ej0i7rnaD1dPuJdMjiWi3YOphDf+o+wq3DK4QjIgz26weU6qmGzhKsWkOEp15xrf
         PHWA==
X-Forwarded-Encrypted: i=1; AJvYcCWt0PCSVjBhnz7D5K89R2PpcIO+IX8fX4tV7dliAUI26L7cSY13ilrAtVtUyA0ynMaZOsLdDN7UeRhxxlx2ktsEkocDdBaMdMlRtnBIkw==
X-Gm-Message-State: AOJu0YwU7ibA7PSq4lMubVil//u33/JNYxrrWcaPPLadwhTiS6w/O/JC
	GFEfyaM9nCaruHbV5Ygd8zkQrKAjN2QgwGP/dtgKZt2gtySV16yoJGizkNUWsY8=
X-Google-Smtp-Source: AGHT+IGG4hXOX34p828f1O1xK0updfSHeJQbc+0PI5iSsHLMgw8QSRFIMuIs6pTngVJAVwIZ+cRalQ==
X-Received: by 2002:ac2:46fa:0:b0:518:8e3c:4647 with SMTP id q26-20020ac246fa000000b005188e3c4647mr5740261lfo.7.1713234054193;
        Mon, 15 Apr 2024 19:20:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:20:50 +0300
Subject: [PATCH 1/8] usb: typec: Handle retimers in typec_set_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-ucsi-glink-altmode-v1-1-890db00877ac@linaro.org>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fLBUVhm80MEGUyFw88Q2hANny5fpYGerXuNj+lhzOWM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCDjO3+iiAr+znU3epIlNCN3C2vuWpR0rTAS
 NG800Yd3CmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ggwAKCRCLPIo+Aiko
 1Vw3CACoBvzYX9t0RGJID09qro+2JYo3fSR3M8Usw3pC0QWxVLaSQ1K0HshicE0Ptcr77WSmuoQ
 GZY54XPXGOGm+LPEhBy3cKLKjF62pU0iyyrWVSFH4592ZZLuyTIGdpSouyL3tLCeafIgG6SVOKb
 PvAlTRsw7wVLrO6dpUoariMMSw/8urRY4qerXZaWOsLDlGYar89lttSaLDzPfJC/iJOx61ZxMZ+
 kdQ0SfDuwAavRyTql7ndvfYaz/m7PSSgEOmsSGP0g0HZ2/xfIYOB7Xl/nm/89LbMRAPidQM2Tfj
 l9PPs6HJOcReXTZv4TXirUEyyUWcTlCk+4rJy/trJ42f0+hR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make typec_set_mode() also handle retimers in addition to muxes. Setting
the USB mode requires retimers to be configured in addition to just
switching the mux configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/class.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9610e647a8d4..28d395535bd1 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2095,14 +2095,21 @@ EXPORT_SYMBOL_GPL(typec_get_orientation);
  * @mode: Accessory Mode, USB Operation or Safe State
  *
  * Configure @port for Accessory Mode @mode. This function will configure the
- * muxes needed for @mode.
+ * muxes and retimeres needed for @mode.
  */
 int typec_set_mode(struct typec_port *port, int mode)
 {
+	struct typec_retimer_state retimer_state = { };
 	struct typec_mux_state state = { };
+	int ret;
 
+	retimer_state.mode = mode;
 	state.mode = mode;
 
+	ret = typec_retimer_set(port->retimer, &retimer_state);
+	if (ret)
+		return ret;
+
 	return typec_mux_set(port->mux, &state);
 }
 EXPORT_SYMBOL_GPL(typec_set_mode);

-- 
2.39.2


