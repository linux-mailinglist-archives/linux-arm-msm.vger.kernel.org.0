Return-Path: <linux-arm-msm+bounces-83814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91815C935F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494083A7C65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 01:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B033D994;
	Sat, 29 Nov 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WenNRmBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35626EEBA
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379935; cv=none; b=lp0b3s4ByHz15O0NDPVvdvhHPp7PJ1Z3ELyddb743riIVyF9yeR097ap3RbllEVy5W38Doo8XnSBgxfmDLzkT8ArLKIGxxxXrlO49siyDuZXSBrk8GNKweqPSOcBEwY6n/60TJ9znccbvQzYSgYpRnGZ5rx8PkzVk/zIVpkv8O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379935; c=relaxed/simple;
	bh=vdmaUHccWmDVYP5bDCaCaO3XBcciiahtVTW92w0BONc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjX1YH+NiyXasV2svueO+4Y1K8TvK0BuYpdOTQPGskHcMbgLYzq0itvuve7iBPsZ+UFMq48UXF81LETHBRrt3Pb3XMgdNNN1BRugnww7ROY9G/m20PV2di6iu8znfn2KjniEkscqVvC4EXyGsrD64eV1tH8I1DWMvP0sI+BxPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WenNRmBT; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c6da5e3353so1489544a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764379933; x=1764984733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7E/BBPbYBPXOHpVXq81S10jr7hBzzUHbxEs5MGnVlk=;
        b=WenNRmBTYBClOPDBvdjMCVE68wRzVLylbYw2ZtKt56q9YGaeg4G8kl4/XyuItRHgSd
         oH0tKVlwjPDe7bpaDq8djmp5N7A0KuLAH3DMMDV2FaR0vcOTMOXZfe6jeFsh4LWKhfn3
         f8lT8OP2kSjbNlreIKk624myUaP1oxUEn8unnaUhyGCPxsVvEPdA7IoAFDEe55CqU9s1
         rFRHEr+qnztIejvK+ssP2GwVLAFS0xebfNM2oAXrTpFU/sXDVVV0Kj89VxcIFDAi7ETs
         /fgpkSx3V/CPvN0Dt6SPuE5H4ttNzp0rs0J4nlm+HLIa+kyuDq/B3OApt9nXa9zpjeio
         lJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379933; x=1764984733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7E/BBPbYBPXOHpVXq81S10jr7hBzzUHbxEs5MGnVlk=;
        b=aNj6ZiOjx0OGfEaRu4w9pGuAC+N2ts1gnYMcSl/aOIAyUPkJi0H5E34454EmfP+zys
         CHhXdxv7vky+g7ynerf15a+pBjour0wmKim+iLau+idc4gh67Hl5oXFZ2/JMnxa0g5PH
         jXs+HkStTRitwOlsDUFxgVbJAzcYz7nwdRvuyfDjYZIyAZlTcF0tLiJ6ab4B9Paj3yLM
         HCZRERi2eG+rgnZs25AQJjjYerQdTJcbt5YlS78+Fi4agOH5jbBCaTQiGogrYEsj6sdB
         I7Bp5pW7FA7Vuveq1Y1WHb1bN7hTElz0DgcDuQU/GA6aX86QH9lX8V6TspMiKOoa4bx5
         UziA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tCnpJwSsi/hYBq4FXMCMV7GMEr7cQ4O94zP7O0hJyy32P6ogUNEr/iO/4z12+faUS3J6dVgt+MDjU55F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10+w4Bu0XtWc9fb85wj3swq95mE5i7vnGYW29V+4WM/q0jq4H
	J+c/X3Hzao1poPwxM4yBSMk3TXcC2mL0FZt4DOVbyzcx+NWIhQsmWx25
X-Gm-Gg: ASbGncs4mbLZk+04CzB/WAbiM9eDsNYcD1mgNxlLQ6kDWKYPbEmjZwgtKkqE0WSj3Lg
	qPb9Ka7q6Icmyik49f103ZsWQ8PTHZa3gditZnJgx8pFZlhHDij5hPnsh83uZj5ezczGvoulUhb
	6jrpJs1t6CNs3MXoBN/EhH2FntxrblY1TIfPwgdApLXVxE6/2jEZf6Va/H2PVE9e1jj6HEX1B2w
	iLbxJr11KvacnrONSzXYo/EyAsPceE1PoTqvMpD61HM8zESipwWKMOG3PtGyOKTh5mKkAAGkyy3
	CnM5agPmBxDhbTeM7ENVoLom6mRBQ9Kv/1ZxVAQybmRmQ646sJziAqfUytZ+RSPCPesG5oN444I
	ei/YT1vm0iD01KB3SK0Fg+5VNb1kChHX3BkiOhGqjLW8ov9Ptj2V1Ia5+2N04eqi7mdh+/N1tvD
	tY4wQj/eTMi2e0MDnfFnpPJfGzET8RcJKGccKpJu5QkBxVJTWxTIbpwyO0NT0O8GtrqyHzlqRm1
	c3Qg933qWo5xiyAhddsPaOD+IVr
X-Google-Smtp-Source: AGHT+IGmG/wIFDhhCxEyeeVjx/pa04jiRhUZeAmYhFY0IfdPX2GFReTPcNInxsmHWH9sjQAUzkBQcg==
X-Received: by 2002:a05:6830:2690:b0:7c6:ca1f:1779 with SMTP id 46e09a7af769-7c7c4414a0fmr7001780a34.30.1764379933355;
        Fri, 28 Nov 2025 17:32:13 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fcedce6sm2188742a34.16.2025.11.28.17.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:32:11 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
Date: Fri, 28 Nov 2025 19:32:05 -0600
Message-ID: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "qcom,halt-regs" consists of a phandle reference followed by the
three offsets within syscon for halt registers. Thus, we need to
request 4 integers from of_property_read_variable_u32_array(), with
the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.

With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
-EOVERFLOW, causing .probe() to fail.

Increase MAX_HALT_REG to 4, and update the indexes accordingly.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 07c88623f5978..23ec87827d4f8 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -85,7 +85,7 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
-#define MAX_HALT_REG		3
+#define MAX_HALT_REG		4
 enum {
 	WCSS_IPQ8074,
 	WCSS_QCS404,
@@ -864,9 +864,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 		return -EINVAL;
 	}
 
-	wcss->halt_q6 = halt_reg[0];
-	wcss->halt_wcss = halt_reg[1];
-	wcss->halt_nc = halt_reg[2];
+	wcss->halt_q6 = halt_reg[1];
+	wcss->halt_wcss = halt_reg[2];
+	wcss->halt_nc = halt_reg[3];
 
 	return 0;
 }
-- 
2.45.1


