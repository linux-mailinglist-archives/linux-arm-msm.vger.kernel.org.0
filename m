Return-Path: <linux-arm-msm+bounces-57563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76468AB2C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99383A7964
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F75226461D;
	Sun, 11 May 2025 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVP3oA6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8F1EA90;
	Sun, 11 May 2025 23:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006882; cv=none; b=BJb8pVcPERCBvkMwT/QrreVFLDeTCKDeX1PWEB4DCrTWGsTKYBSUxoxAd/to8gyzlw1lCKrXunuHdjqQZjdSPLN1pCcluO5+1tWnhgCqdnhtMgEv7xjTf6TvixksqlF+l+wf1KvEF3j+lK3rln2jZfyyfqiiEFOgjqYUJHbe7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006882; c=relaxed/simple;
	bh=0R0M+myRXeKGjxYxVnKG4ZZnr/07Vyid04ibtBzNR9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Avzvu8yZ+bf3+plVub7AjWxuP/cq1EVRlO3dE7/apb9u1Sea5LGoShMLKWzyD0yTPGIqaKHVNWdvwKSJ3kVHYOPep7qqn19Vfo1pfr5puzwxCT+Evgrd6f88E8M2ryGymkuRzOH/MApc1GoTN0t0fjIYk9QJmji6gGBDtYFD0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVP3oA6O; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54fc36323c5so3409873e87.0;
        Sun, 11 May 2025 16:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006878; x=1747611678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPWRfhQwF7Zu8+M/PG63eaG39ARSOy+14QLGOkMXq70=;
        b=aVP3oA6OrdfdgcfVR2BqwH60JZcdpBH2C0g6vXeDzuFYVgcVPGA5qCnbUsNtlkUbif
         henOPMUeY45qmjSlis9iATKigXdN3dffOY7eFlpBT9cqa2jcd1P2+yxGFxPrRzuhGaGV
         xNsbTj3nrJU1D0O2uiepiiDCwlCPvSPsnl33PwUWdIpEhOLImt2u7QssZzkAkf0Lemkk
         sEtfBhRFA8uilwJN6IlbDsAIcOZmmG0bXD5CfmXbLQcURekukOpAA/UKUQX/rB6h4GTJ
         OcFGP2he7KuSPmndHOE96PMb3v6DyuIA8AUktVqz/FuwrSGUKO0w15R+8tkQB6cjjOYd
         Kq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006878; x=1747611678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPWRfhQwF7Zu8+M/PG63eaG39ARSOy+14QLGOkMXq70=;
        b=w6ld7TzLnbDWa+PK80j2v1e5+aeywS3/V1IDpxgoM4gB57zL9Z/klKOZxoS2/xECGC
         jQQgCbkrj6gxE92xwONw7IyZ1udgRJH3DHUnGebsKzg+hJ1GvfsdDvJtxfGfCokP2OS+
         LrFur9u9CdKrouKohyOl/wrLGfban5dke/1+plAMfnRNlIYhodAodIfZhvzI1Dyxv6Gr
         /fWE4sIof2JswTNkp4biFU31S0Qytn1mI+h+QGa5Lyz/nf0eHoGyaIftwyjcCpkERzSy
         klwEPYWrL+e9pbPx8eeXp2C7Negf9fmK3+h2e+fjhapikZm19DOsTq1hdlYvdkzht/RL
         Mr+A==
X-Forwarded-Encrypted: i=1; AJvYcCVaHDvFG+CQfkrbRjeu0ZsSUhrSOKLUkqJPP5tG0lEfEmzXyb5oS1by86aTubK7DGZZOeuafdhlbUblbTA=@vger.kernel.org, AJvYcCWjcmceSrk5pAzDsS7VgzRlFYR5iK2pVdMtjmw3z8+5+p+w8Vz62C+hjs3ecac3s+atPduyJLR6b4eIYA8=@vger.kernel.org, AJvYcCWprDYd7NuFbfQNAGhbrSRAvCYvVNk7DR03WK1w7C3pFz8OiKAyCDZbR+FZFJda1Huq8WcnukjeCKx77Xu0VULwQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNvpqDJMJhjVum6dz6DzzL9Cs31xXzln7n+DcR+RERm7zzydw
	PdIcpGrRXS3xNkAp4dmRRby+5w+blCpzkVsBPcHcZF7TqxouFsjDZh9bvg==
X-Gm-Gg: ASbGncsxpJnnNvBTSefRwsoeDo6rPCTa4KfvdBAdI+rQPY41w0wIK4tuzLM9svtPR5Z
	MBW6wFZGzIL4olOwye7s+i7gObqHFq2WNyQcYzdtwJJrTBFqCFkkZTYgo4pM+89/DzorpdhS3u+
	/kFXL+AnIYrMRTgmlm0ns6wLpuVqv6FJ8UTij3meMR6y0HGS0qOv7puh/84gOArlomD8TZU66HF
	7qD7fKaLQdE/GCDtWviO1YDcC0RoKF76t+JXJHFRohuigVUxadBuaNhdFTN6e/Ladz1b2F5QgUu
	xpz3Wefvef6bIq2MSBRnNsM4Po8h2yxGp8gfIE9HAzZpgzC12yhntKKwW6bb6oEi05rtv12UDaH
	UkcMH4hHU2vYvVDyCRM3oVJfQPq629lFY
X-Google-Smtp-Source: AGHT+IFlCwg+gnvFBun6b+eU0+J5Y+9FqyOBU2eBSiYY8olg/D31X7Bmj9O64BqihX8M4yDiuQbOUg==
X-Received: by 2002:a2e:a103:0:b0:30b:fc16:d482 with SMTP id 38308e7fff4ca-326b75709d7mr59190011fa.3.1747006878052;
        Sun, 11 May 2025 16:41:18 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-56733b-36.dhcp.inet.fi. [86.115.59.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b80b6sm11159451fa.37.2025.05.11.16.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 16:41:16 -0700 (PDT)
From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
Date: Mon, 12 May 2025 02:40:15 +0300
Message-ID: <20250511234026.94735-1-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent change to handle platforms with only single power domain broke
pronto-v3 which requires power domains and doesn't have fallback voltage
regulators in case power domains are missing. Add a check to verify
the number of fallback voltage regulators before using the code which
handles single power domain situation.

Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 775b056d795a..2c7e519a2254 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -456,7 +456,8 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
 	if (wcnss->num_pds) {
 		info += wcnss->num_pds;
 		/* Handle single power domain case */
-		num_vregs += num_pd_vregs - wcnss->num_pds;
+		if (wcnss->num_pds < num_pd_vregs)
+			num_vregs += num_pd_vregs - wcnss->num_pds;
 	} else {
 		num_vregs += num_pd_vregs;
 	}
-- 
2.43.0


