Return-Path: <linux-arm-msm+bounces-28397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB0950610
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DB328134A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC5719ADBE;
	Tue, 13 Aug 2024 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2lqZ3iS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878D819D075
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554610; cv=none; b=VF3StAhYsl/aYb/R5ve7lwY1DeG2ToE9XSMraVhv1eqWPO/KNgvbcYCn1ea+lbZ5vHMElcd9HHzmm1jXmYgh5l0ymwU2Ua1No2b+3SHazxZVGjQyGc/D8b6xsVaxf48s4/FVq7sxXJVVPY5qc79Qevjg7qBXYVEG+IRkOeLOsTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554610; c=relaxed/simple;
	bh=5ke0dMugQJGUNzUanoO5HspavxzPQnzSJYizcfymtG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqaPmgJEcuJg75UTZWOu6+7CJ118JCSWLXSQ5DgQ5r05bxlDcUYFUNJS5DRwTrZ9tP4hgRHj+vVK7X8HwdRWTozC+JCW9dpfS1DdAgQaDjeJyh/kHlwCpkARTPblAl+QX3cBM0SMIc+bj+OGmvCp7o67/o15G3xoSMWioqCSqic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2lqZ3iS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42816ca782dso42125225e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554607; x=1724159407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2fVMcPJnrUO0N/1FseA0j+EEzz4Wl9hBU15LCUQqrw=;
        b=U2lqZ3iSYtjgZzBFr3/gVOKD9OjXU9yg6ZITyNDD9RayRdnafgXHejP5hrOYUZE/OE
         vm0i2QDb+tnzq3ZQiKwX5EBzjNC9zD2Zdv0Vqj7gvaa+uTA1hFwjnZNkpm1DUqZjRHfR
         2c4i+wypaSgAdt6KI90DQJB4e1JAaRPwoePJixhvuUuhKJz5srcQEbWA3oJXct4efKVe
         qRQQo5QIuqi1oTIflRJPXFK3hUvHj32DR+Wv1L62OwjASks/QLXYSLn2u9PrEWiXBm/S
         49xfh9PIi23SY4qmC56Y76xdNNqw4KEhgdQx3DG3XLzwD42QMCQ9nBw79yLYCKVXs879
         9hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554607; x=1724159407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2fVMcPJnrUO0N/1FseA0j+EEzz4Wl9hBU15LCUQqrw=;
        b=tWCZsXywhS3cFkqbk9JrEPC+ip6OBoy1l5yvUX7u8fXGpGOSUivTMMLrkitkzBvDDQ
         cU1oE+cru6zdN2EUq/i9Noo2TrFyQMtjItlDyjrAPfilVpqfXVNaJ8RbVKyOEFYGC3UL
         OROQX3GmUmBYss69VxC20k9PNw6ECUWddmbiU1GaCZKnaR69JUqv4UfFM+6dqB6xSmj2
         MoTlA/nrshC2F7sVypy+hCFE1/fUPRIKOwKaLcvK5idJqV43Tk2pU/IsJ9hJOiLoOMhm
         1R5sRWp7qTHcAzln7Yk1TsLQpdINaYo437XtKIUXK3cvl1FN64wHiI1rFs2Dju697n/A
         kPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpd7BkGVUZTN5qZG34XH3rp74Ste+abZH3yqMSuuQGlqfD+v3Y1tCi4OMRaQyTXx1gQYXnRO523rj0talL0jbt2Tn33XksH8UmLlatdQ==
X-Gm-Message-State: AOJu0YwqixVvgy8Ka80aZDRsu4RMgRcbuLHGJCLbt45ds7v40OJltZc1
	6RHrnu4y3k95pt/ejZ14YmuF/HgM2tpbHGWNoYdBMA1RSiYEPos0/n+54ZEd5PU=
X-Google-Smtp-Source: AGHT+IHnqwXc38Pnpsch22i4e5wNnLg8t3Sw8H/kb30baBblrfe0Ww0kSwLWvg9YlxY932elDZZEiQ==
X-Received: by 2002:a05:600c:4e87:b0:426:5216:3247 with SMTP id 5b1f17b1804b1-429d47f43c5mr23464765e9.6.1723554606909;
        Tue, 13 Aug 2024 06:10:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:48 +0200
Subject: [PATCH 2/6] soc: qcom: aoss: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-2-cfb67323a95c@linaro.org>
References: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5ke0dMugQJGUNzUanoO5HspavxzPQnzSJYizcfymtG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sgzubjFvDtLJ+b01jNRFC9A7/wMsKAxjAK7
 lgCKP4SyxuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIAAKCRDBN2bmhouD
 196BD/9zpchJcYbVKVBPCCQYSew98k1x7YKbjCYqEkr2Rl0ry5Q0WsDrLcz+OdPNUNcukEBF57j
 CXFMVHwF/8HziV4YUQ+g/pJ9U+XQc8ZK9yVd2j0rCdKtFoGDJaH5jt1tt5u3XA4enR93eAScbBp
 z5WdEHG801tqydGLxgY06YsKKBo6TyNl6M58T8DmY9j7zNUnfPDB4tuGClf9vBycT/Jj/O/aDDn
 4QbR/52niOyRHJJKNAtssir5m7I01na6FAKy0FVCubov8ranFGxpB+/eajBWSPKCy+TJOcip70k
 hQncmCZ9UA8CWvAfa7Ge7tHs+apnqGQYhF5dIcyXOC+EXRFuxZSs2aP7RScesHW7NT8kC/d6YPn
 UWiIShbfEkndLogb4uVBxCHY+lGq1TuD99bQBA1263enla+ziujq2XHmClw9Jwh0e/ehzJx1lvz
 O7NJaGTbSgIpaaVcS772jGuCgtxdjipcFWZnGxeuLqX4cWUfLtB+kDlroZf/+gN89t/1BK9OKln
 aicspz5G8uvst1BkIlyPg6YrTCv9ays26lhb7+QPmKuiMERxXiVu+6NnCTN7Sh/xjB9Y5CZ5fig
 jo1h802DvOHu9aslkYrUjJBkngQvLMPXfU8SCQqMwdfkByy46tYvfiN0YL5C02pRc0+Ww98lSNJ
 QfesZwWWNe6o9nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index ca2f6b7629ce..60af26667bce 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -394,7 +394,7 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 
 static int qmp_cooling_devices_register(struct qmp *qmp)
 {
-	struct device_node *np, *child;
+	struct device_node *np;
 	int count = 0;
 	int ret;
 
@@ -407,15 +407,13 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 	if (!qmp->cooling_devs)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!of_property_present(child, "#cooling-cells"))
 			continue;
 		ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
 					     child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			goto unroll;
-		}
 	}
 
 	if (!count)

-- 
2.43.0


