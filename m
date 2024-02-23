Return-Path: <linux-arm-msm+bounces-12337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415A8612F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 14:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A8F9B2247F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FCA81AC6;
	Fri, 23 Feb 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNPW6w6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B17FBBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708695581; cv=none; b=S4PvtsePj4/PLFrkHC9ciO3N+wlxL7qA8BaUOwwawWi3VImFwsomLkwj5O5IWnS+q67mqL5FiG1Y+4THKBINhCMXO1Jip6UDEOewjqwW1nkjmwMfXv6sl9zzKoj7Ot7s2pp/y7611X/8T3wKaqrWgzW53HC8pLF8H/+jjIbjObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708695581; c=relaxed/simple;
	bh=Tla2k0k531201c95gigszwFY7DvwtKH+tw/tpz1eF2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtQetKlg3DqSal/rrnhd9lHLBUDp/N1Ke24rUKoE2FNP9gd0VwzxBwvYL2cuj0vA68S0pWAPw0m+NUQ1BKfm+tPLsYmwPIYUPxpmSOZlzFDWfmV3rA17Z8QAogKVKDrA6zVsBSY+0veUJZTUZqLLZ3B+4EthLEmsA1BO+5kCzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNPW6w6c; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c78573f294so13426939f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708695579; x=1709300379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ8Qwlxhg9YFCAYjvWLb98mk2SEQ027zBe4HYyCS1FU=;
        b=dNPW6w6cwfW6W1NCZbV1yoOW5MZq0CWEdx+a10FblmVVYf9N3VhQcckk2Ui8shAHJf
         Pcuiq7HrjIMMAIfvOt27s1budo7DNcrjgZt1RMNCh8DVZD9zQXhcJnVmhxhgeYw7peN7
         BzzvC25LWnNwkqeUgAVbkYjJtWhKTHFKlRtcFL2VvSehBL8mPyG7b4WPxfoe1kV/D5WW
         UociXTpDN9MPG75uFe+iBh0QuZQTGgItMjcph73yMSs744iBKRhqGkA1FNDEk6200gKM
         iuKSbfOjg3aZW6Lzfx9Eqnz+Oz8eBZl9SNku0iX/Y729TpU7pDPBaTydjBkLikfxHMo9
         0gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708695579; x=1709300379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJ8Qwlxhg9YFCAYjvWLb98mk2SEQ027zBe4HYyCS1FU=;
        b=G0bokeUH87YYBmBOuqgWxfF3nW6Oscvca8rRPPt8aa7/nDsDh9wD5xHxVO8nAWqEU0
         hbhwPBkRoJL5SZ/sZQYtlhFwLGpOCLaQ+pTweD3vhxWpyJsr2hFq/fpWLaGK9TeoKVRS
         nhxzyNZ/u3zbkyVAmtjPlQ9uxfcFXSBsJzic0/VjNjJFjr7PDYhNY9v0optHGK1aViZx
         AJ6isxXtBf4TXX2vBtYP9BNVHAezXzR0Qe06wh6D5+QoukuKo7lMryUGWkVbTdpA1SDK
         ZNZeW+cVE8o4CLRQs20FC1IdoFM91JTiivHF6Jvg8KZPTyE8XZDpOeHJv3QYrBytbVFY
         QDhw==
X-Forwarded-Encrypted: i=1; AJvYcCU0MgmPxZHlz+0qDZDhQKMeG79IsGjDy3tXCpukm3UGjEimd5beaPE5tmjer97mz0RtuQMpd0iPBY5cEq+GjEVKK3gPCR+RaNt3ivZznQ==
X-Gm-Message-State: AOJu0Ywktkxpb6wHagTkYLan9ABKQagQpTyR1azloSEuNVXddZGkLizd
	y49xIyOB2xmWGsVD4osUML6MAcRKNltCgKwoYl1AFcyOnoX/+51/60saHw3/0tw=
X-Google-Smtp-Source: AGHT+IGzhlXaZOiypkRbVk7gUr6RKQAReuLqhx5KSarwn6NGhZ5p1GRHlOhgnXN/RAp+SGlI5U6Cyw==
X-Received: by 2002:a05:6602:1308:b0:7c7:8f23:7d21 with SMTP id h8-20020a056602130800b007c78f237d21mr1983533iov.18.1708695578400;
        Fri, 23 Feb 2024 05:39:38 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id p11-20020a6b630b000000b007c76a2d6a98sm1836838iog.53.2024.02.23.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:39:38 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/6] net: ipa: kill the IPA_POWER_FLAG_RESUMED flag
Date: Fri, 23 Feb 2024 07:39:27 -0600
Message-Id: <20240223133930.582041-4-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240223133930.582041-1-elder@linaro.org>
References: <20240223133930.582041-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPA_POWER_FLAG_RESUMED was originally used to avoid calling
pm_wakeup_dev_event() more than once when handling a SUSPEND
interrupt.  This call is no longer made, so there' no need for the
flag, so get rid of it.

That leaves no more IPA power flags usefully defined, so just get
rid of the bitmap in the IPA power structure and the definition of
the ipa_power_flag enumerated type.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index be9e859e853fb..eee251d67f81a 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -34,22 +34,11 @@
 
 #define IPA_AUTOSUSPEND_DELAY	500	/* milliseconds */
 
-/**
- * enum ipa_power_flag - IPA power flags
- * @IPA_POWER_FLAG_RESUMED:	Whether resume from suspend has been signaled
- * @IPA_POWER_FLAG_COUNT:	Number of defined power flags
- */
-enum ipa_power_flag {
-	IPA_POWER_FLAG_RESUMED,
-	IPA_POWER_FLAG_COUNT,		/* Last; not a flag */
-};
-
 /**
  * struct ipa_power - IPA power management information
  * @dev:		IPA device pointer
  * @core:		IPA core clock
  * @qmp:		QMP handle for AOSS communication
- * @flags:		Boolean state flags
  * @interconnect_count:	Number of elements in interconnect[]
  * @interconnect:	Interconnect array
  */
@@ -57,7 +46,6 @@ struct ipa_power {
 	struct device *dev;
 	struct clk *core;
 	struct qmp *qmp;
-	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
 	u32 interconnect_count;
 	struct icc_bulk_data interconnect[] __counted_by(interconnect_count);
 };
@@ -139,7 +127,6 @@ static int ipa_runtime_suspend(struct device *dev)
 
 	/* Endpoints aren't usable until setup is complete */
 	if (ipa->setup_complete) {
-		__clear_bit(IPA_POWER_FLAG_RESUMED, ipa->power->flags);
 		ipa_endpoint_suspend(ipa);
 		gsi_suspend(&ipa->gsi);
 	}
@@ -209,14 +196,6 @@ u32 ipa_core_clock_rate(struct ipa *ipa)
 
 void ipa_power_suspend_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
 {
-	/* To handle an IPA interrupt we will have resumed the hardware
-	 * just to handle the interrupt, so we're done.  If we are in a
-	 * system suspend, trigger a system resume.
-	 */
-	if (!__test_and_set_bit(IPA_POWER_FLAG_RESUMED, ipa->power->flags)) {
-		;
-	}
-
 	/* Acknowledge/clear the suspend interrupt on all endpoints */
 	ipa_interrupt_suspend_clear_all(ipa->interrupt);
 }
-- 
2.40.1


