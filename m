Return-Path: <linux-arm-msm+bounces-84105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B9C9C2F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 17:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F215234813E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 16:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D1D28468D;
	Tue,  2 Dec 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ9mB6uj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499D280A51
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692791; cv=none; b=NaR0qpTkM+5OOinJqWjnnV0VwADjDS8R3b0rCbo00xJdAra6U6nbWlYjW+m8B88kKeGH9qMMSlj4JjUbykQTat5wPaOId4d77lnhe9lyexWebpcfpn4ujbu/tvZkzcgd2IyPZVZuIcGXHAgX8K3hHRXal1sBQf00aWpgVRVEzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692791; c=relaxed/simple;
	bh=7TmdTTWdR2sAJDGsV/H1+Ez7fZ9qzH/Ras91GEmcQMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+w+jyXpEcbmsVcysA1RWCKI+wVkLIUy8Ic3K9xL0c2Pw2iAy244Krvo+nD788QJ2t1/oh1VbdMCfTIIZi3yzH6gb08T/eCo4X4n4yg9f2xi7I/DCa/8+wAlmmNQyNuKTo1DLfRAXheJ/Oo1fP8xs2u+Jyty0GRdv0jtcC1D+NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ9mB6uj; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45076d89e56so3108554b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692789; x=1765297589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PnAtWmdbMkCmI0bWWt89OpkxziHYbElMXbsGDyHdDw=;
        b=AZ9mB6ujh1DFUorNzwidpY0aQKW39aXPDGLf4iYrbKGRO0B9x7iOhe3LfNU9D2W922
         Lvl+lWAo1GuF3BVZcyD3cEGmDAZhfh1RYpIP6mI1DOzDqbXAiZouOtNnEjymg/uCGVDc
         7zgxuFUi70ADQ5IfNNGIszvto7HxFz29XO880tsWJ7f0sMh7i/H2vMwqRfoiFMc4QLjQ
         mQEQ+uqqcmglokMolyR25VMHYYojtUXRyDUQVEivFEudCTOw1vw6R+dKzO6gBoQKQWMe
         jkjTqPX2TgS6p0MQgalKRvabqtqE/1B+Lu9i+X0qKlc/HrprX0ojPd/hZMTiayb6GwOX
         Cgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692789; x=1765297589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PnAtWmdbMkCmI0bWWt89OpkxziHYbElMXbsGDyHdDw=;
        b=sRJpvi0ohjlgpUOR/SUOJXDtKhb7Kdxb2wX+5YyKL6UgHOfdEy9CPCWdCuBetsRmcz
         91KDATLhXvehSFMWiE+h1IYiT/ZAskjFYDGtCNe5OyvNv1lPy7v2/9fESxp4fq3ZAmQS
         UV9cxRst00yPRDkyCQqsIjYJo1XZeTSYpoeHCmz2SH6x8xlf7UFt2Jb+QOAViPuctivt
         sFmLkhVwqldgcRmiHd3ld8H/4hdzZ7JmHPCHSFmgrLdq+s/NFoUrqNHKea/TLCPMV9h8
         xZzDIhaQVjK4HX70SPooa7tYNEYkL1eIuQDrOG00B3X4tKyBc8Bo7BRXF/NI5PPpi2+x
         rpkw==
X-Forwarded-Encrypted: i=1; AJvYcCWtzSRpfsSQprZ3QkKFtlU3kA9V81R0Y30B52hNUpXfRaumzp/vCM0lg4VjwZDr4c1V8usDENYZjC7IWQnf@vger.kernel.org
X-Gm-Message-State: AOJu0YwWa0o6Q3ricpiKViJ1uLE5ndqIGQ3yfs58f+HgwIgv4lWlOhC3
	26KcGMk854Gnrkz1UvVV5tFXd3FsocuO1gZ/P1anbPmv8JZNt7S+bBrk
X-Gm-Gg: ASbGncscay2TqrgkV4AJYpd5X9ui/J04nhoI1aEqpNS+KQh2OPmfwNi7sdQ+XEeNwU1
	dAJ5p9kIh56l8p8Lll/emBf1CFD/cAKaaO3A2+ozVXDwWQpE/mF1PBjMqcRu2+rC6V9SxiSqPVE
	TMyCsoZsOrV+ge8SZ4d3FeVxdfadSJ/5P+zrQesHNfIGsGRXn1JigdV2jaD1UGJ2cZC5QlMmDts
	Kzt8Taadv4MubgMJH+qV9FsrRpC0oT232t8BwZosEpILd2gNF1MitGist+WJujmjGmZXCI/nAkH
	b6kPyiYls/ojX3iZii1x4mxMXkAfLxI5M2uPwqXauJjA8qz+vMdSBtgBQ2JwYDgTnQ+r+n8n1Dr
	KhJyedRpumzh3xWg+wTm7FYGCMk8euet0V3A+1++9tMwOacrXggUWrtA0k5GEWf/HJ01TLruKzJ
	PrFfnqff3C0ayzhntd5LxJQNh7Nkp7tSBVVl8SLOGT3XXEgqNG2fhrMkmbceShLYPkHJxT7IOiY
	YXLZ+evtGBW/PeMx0d+VpamqzmZ
X-Google-Smtp-Source: AGHT+IHnSymlG4Rcfy7ky8sdHo/8LOZg5So4LcXdseUa5CzeTuphJTK1jKlkQxS0JuGgxnJtmsOZGQ==
X-Received: by 2002:a05:6808:80c4:b0:442:cc90:1e4e with SMTP id 5614622812f47-4514e5fa7e5mr13578497b6e.14.1764692789380;
        Tue, 02 Dec 2025 08:26:29 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332e1480sm4236722eaf.7.2025.12.02.08.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:26:28 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	p.zabel@pengutronix.de,
	Govind Singh <govinds@codeaurora.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
Date: Tue,  2 Dec 2025 10:26:24 -0600
Message-ID: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
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

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
changes since v1:
 - Add "Fixes:" to commit message

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


