Return-Path: <linux-arm-msm+bounces-85775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E0CCE765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E883309E8CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4682877D4;
	Fri, 19 Dec 2025 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCOuhc5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E529E117
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118887; cv=none; b=i34299xEPr+wOi9jmS3uUMgLaKnT34wdaQfSbvBYoC+HIzOMtIo+turSgRwMDcUsqUH3ayyt4xg0Fq3TY/izOSys7SULhicuc4swENuiHEVZNkMra9FnkfRrt5FgO8JX0souI0kQc5DT+m3qR+fzW6Wr9z7bEpQ1v5xP7D8Akh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118887; c=relaxed/simple;
	bh=LH040kMlSc9Tz0ZMYO/8Rt5zp9Pc/ZcQVc5wppSmU6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sp6ciZDbZBHj1cgfOYKKI9Eme7QktYvJdZTlHaVabB/IpSWcdqd8/hKMYISnRbaZCH8Soeqz0pjnT8mM0nW8n+clkKmvpU6pm4JHcdKXhfohZZxUJkmFgZH09zjOeaxrgV0vdbxKlOIZl/+b+FeFt3ik7tZz4/jANOlPoS6AeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCOuhc5e; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64476c85854so1235767d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118885; x=1766723685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjKFV3vm3fDXJL/hQ4ZjeG7tF9g/o1uEu4D2cLe1+fk=;
        b=DCOuhc5eIWy7z+OcVTf2NcMv5JrXlU9H81vGZPk2pyLC6XX7pDz5eGjHlAv07fcF7v
         mJP08A6IdyqkbjAcROSuziRJGTMkvLEocZcUVQGbFlZdxHkTExqk3bdO9ZLe1p3l6Wbp
         PIAwVfLmJrVzftYHlA2Ylf2n1qk09AFRVtDkszC8FKszD2bwJqHd9uUnCKJRSQ7x6VhE
         mYSkpsvjVraZww+WVQnQPNvuZSGH/ggOkwxlS/kM66aaSJlRHp1uQeC+Bxz7oX1hsRSB
         9yojNP+hItt7x4y7gIPdPau9CjNF9nyrumfOClKoJkWob13Tqu0cNcQ8ehcqFd9RhhtI
         ljoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118885; x=1766723685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjKFV3vm3fDXJL/hQ4ZjeG7tF9g/o1uEu4D2cLe1+fk=;
        b=hz7NvzNlXrNHLLsmMozrfPNgWJwEiFCmDFwDLk45OwlbJ3tqJz+Xe44YpJHh56YiOt
         ocuU+GuVzh/znpw62f/CEF6rETxADVa14LU8EpQjtAev/Qd5vfPovuqllDvXa7VZ5MLs
         Ven/jNVsXtAxw/PX0iaqk/ZzyHGq6Q4BsDW79bE0GvCP3Bb5jUrL6pLlWSz80x/+Ngxx
         KK+Xw/82vLhtJSBnMZl57ge/+w3lcfc/xMjZ+6RuHyBCzhqQEcW3Swg2TaNf9jiOqAj3
         ZQACAOjCGSTmuesSz9S8U8gPc6LSZl9HiQa2RjoeYXTeCJKX8WvWcnLGxcIXgwhnjauW
         3khA==
X-Forwarded-Encrypted: i=1; AJvYcCVsOyqBI02PIkOpMfdv+M+27L6kX4RCQjkFg9dDgAt1rixiOOXWLDva8hAj1XQ1VHmwcJNRHXA8VqLlym6R@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaucTPd2COORHQwz5lP0JeTTozGsrMFARYnwz1Q6CV1DARShL
	P7ESN0ITbFxNmC9KMdeGsH7m5BQndNLX9o/CwGsaOiSAb/pnd1H+5xlMGAsrjw==
X-Gm-Gg: AY/fxX47GjPPFCZZP6u5SWNYT/tWHzSREQ2QXAaNac8WSkbUkC3C6zPXPppJ2Kl/AWb
	HNI69WAI+O6h3DsE4Fhhm0ygGXrt6XJ1OOHakKNTDejsI177qMgGLkvpaCbSSRN3iFXtCD1jaLF
	p9IbWOkvSM5vSAAE7zzCneR2uWjcpLIcRCgsNJ1Rlkq/E4Ii1BMytJIT8ZohrzX65+tnSwrvhZ+
	TMGuHBSIoKavPB55zDeIHnnnL4nQ6gCfuLHAiiQDM5AjxE2Z93R/x25YmK3ZF1DFK5Hn/Le2uTy
	nl+Iajnpg5E/EFyyBD0Aa39aUv0DZtQ/z7TUrubDe4F/b6FXH2We9lyDl8RZkwhSLqNbc6HpGhf
	ZJzOmDBfgwEAHl33kOXfDhKRI8fYftTNzIygfsHsDn1GNP6bjw+7lLYPyOrXEmOAUlqTzAx/Kgb
	XXDoxFl52Z6ZB3Zl74WcyWP9K/KgMjZHCqJY6Y/sXcP7vibBt4pYA/pSBil1jZvhfhoW22WuW7H
	JVxavSsgfSUoI2etzMQqjcicaCB
X-Google-Smtp-Source: AGHT+IHWnitQDtItHfIjJ8aEkoWNZUVggOZXYeBFC+7uSwle1Gq8Xk+mdTQzdegKqV74AkQXnbsdvQ==
X-Received: by 2002:a05:690c:7409:b0:78f:ac82:51e7 with SMTP id 00721157ae682-78fb403c2d2mr29887007b3.40.1766118884675;
        Thu, 18 Dec 2025 20:34:44 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:43 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
Date: Thu, 18 Dec 2025 22:34:16 -0600
Message-ID: <20251219043425.888585-8-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the clocks from struct q6v5_wcss are not populated, and are
not used. Remove them.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 265010c5c82cb..bcfd79b12fde9 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -133,10 +133,7 @@ struct q6v5_wcss {
 	struct clk *ahbs_cbcr;
 	struct clk *tcm_slave_cbcr;
 	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_sleep_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
-	struct clk *qdsp6ss_xo_cbcr;
-	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
 	struct clk_bulk_data *clks;
 	/* clocks that must be started before the Q6 is booted */
-- 
2.45.1


