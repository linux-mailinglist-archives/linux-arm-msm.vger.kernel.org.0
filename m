Return-Path: <linux-arm-msm+bounces-63610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7FAF88F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D8C64A1856
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD5E27A460;
	Fri,  4 Jul 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WEiXB9bX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3E279798
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613438; cv=none; b=YxYgxa7RnIzG5ruQS+akMTo5vrx1SBURpqIYsO6SgpkWJXMTtyidrlpPTWx4oJxONiLFCwTu4EJj8srtFzXHz+oCePNnhTF+X1nPz9AR7p8KK86+kSj4z4llXzqCirnG9GDwKV6NEgqtxIvAdIyfwoY6JWhvZ3ErOLqdV/l8z9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613438; c=relaxed/simple;
	bh=WEDOiEFaIuCIuMx9QpwHtbudKxci3T1kQojeog8ab1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGeDSlrBDAOB96+YmsymkAyFIisufok9DsXCEe+Srnuqh/xpxBMMBmVSeZt1k4iWiP1C1V6daexjBqdpEZU/GLzyPLMTxsrtnobrn50vAj9o3032R1ThUJbYAuO8U31rpnasclxxc1qDNhzKlyKBPFkPHPBiQKwVOiffzBAb4H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WEiXB9bX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so822244a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613433; x=1752218233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObV9aMDnHMMEJ0mO0zQzyaaA+ak9cS5sIBz04rXlZDY=;
        b=WEiXB9bXfteLCo3nESaJaC+B6EiFb1UtxEXGA7DC9Bmlf9Z93Yixd5EoG6nttQ5XgK
         J1bBeUN+mJVdwzpcel5TDvu327wBd9K+GOlznOPFkrc9PXPWB74hmIuHaazNtUSolmPu
         PdhErDQooyy/EjVACcocZiz1hbWhA72nZ3RXCeftf60uWC0B8KQ2if9WoHN8+S9T2XIG
         eRbtHbaF3lFAsQKgcD8qMhlmW1onwM9+6net19Pw0rS+/VIgH7wiEtQV9AfnP7cZBUjH
         1F5SOHJiWtwbL/1wHRSFAR8QhVTs8K4XtaGCUOkN1s7Aj7vit/7yIMav/iygvwuwPB6L
         dsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613433; x=1752218233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObV9aMDnHMMEJ0mO0zQzyaaA+ak9cS5sIBz04rXlZDY=;
        b=RCbCFm4HdAPT5BXLW4S4ImOJC8ZK01Z76pGgyWkpKrDVC8+v3LwlEF7VBjKagC0x5F
         4Fa2WV62nXXVuZR7ejq7ACILJKZK5Mno/8CCnxzyujyJDAbHIW/HBWM5dUYIIfvJPuJ2
         LTZPOYHXz4xQFrAikdd4Bm8TGMVhotnWAmMn5CV+Tmm7TsaN6O3tqQszh09Fvp9qQU0c
         8pghoPgw0nDXsCQqWJ6ifsIwZ7PAVH7BdrD6LYUq7xPfEAbL49o/qH0FKG7hAoy0Ct3c
         H+FkDI33XBImuQzW6GvroXDGSQ3wU2+t1038AnXpMMkFq9L//fdlB7JPKMSfWrz+ydOO
         8Rhg==
X-Forwarded-Encrypted: i=1; AJvYcCV+EIdstKp6JQ4cihTA7NfCsR+bi1SMWlhTxvZVjOxDpot63+VSrkAHO38Ma4zm1N7nF7L8wrdQnyohXuEV@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFUkIT+KyWR6VeXHFV6VnzWxvOuFhlSoglSWNoD+5qZgNIAZA
	0WFAqWTRfDcik6tBGepRi8Dle7CbGyJD7CXGDnhOhHxSdDt+Ea/FBcyaCE0PdJUghB0=
X-Gm-Gg: ASbGncuRjEFIInxt0/Hsayi9K90IOpTBwDnmvbhwl3PlE3W/1IcmQv4KnmDR6529i/+
	q2WUoPx/1Y9wT32PX0k4fneeP9rkYmYIclbYHDSqfvqlLvLT1oaUyWOke/s8vPkJLkYRV0cyi1H
	iMwICAE7yJbjzqLtHzU3UzGPzn6m5YlksmcErjZiiKkDsEVE7Wpemn1CdNwnRKVosK1cUcOAt7Q
	7rUVcmxLlK05Bchm/cOs8m4dgfT1Gw20uV13SDK2pn7Ydq8R/4ywduG4JdUapPF2gmwLlSfzoTN
	rzmPweu6N6rYoLIeGxfnQqSkU42R7At+YQXN2n7TlWBd3FSp1k7+MWKReU1kC0oDHO1VYJPTaht
	/uLqf72SDANkRRvT2xOpWSZthx6xgwyjBe1myYQDKtgU=
X-Google-Smtp-Source: AGHT+IEeV3Kn0cO3kR2tRlEoBkxBkhC7lFjM9MhwWz48Em0WJ4DrWIyGYbBz0+fejRI4ZiAN8fozmg==
X-Received: by 2002:a17:906:6a28:b0:ae0:7db8:4189 with SMTP id a640c23a62f3a-ae3fbc56e59mr134073166b.18.1751613433448;
        Fri, 04 Jul 2025 00:17:13 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:16:53 +0200
Subject: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=1425;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WEDOiEFaIuCIuMx9QpwHtbudKxci3T1kQojeog8ab1o=;
 b=8lgV4fcoO76mnpDOKf3MXb6JTVVbunfJKkGXJqbGA1kJqSDvkrKaCvRKkzUbioxE+iz/7wRo8
 jjECGd4oVdHDozI0ZZsy9hvNox95UzV/nqjk+mRsclTKifsh4TN2ckr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support to register the rcg dfs in qcom_cc_really_probe(). This
allows users to move the call from the probe function to static
properties.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/common.c | 8 ++++++++
 drivers/clk/qcom/common.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f72603b694966e216 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
 			goto put_rpm;
 	}
 
+	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
+		ret = qcom_cc_register_rcg_dfs(regmap,
+					       desc->dfs_rcgs,
+					       desc->num_dfs_rcgs);
+		if (ret)
+			goto put_rpm;
+	}
+
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -43,6 +43,8 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	const struct clk_rcg_dfs_data *dfs_rcgs;
+	size_t num_dfs_rcgs;
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;

-- 
2.50.0


