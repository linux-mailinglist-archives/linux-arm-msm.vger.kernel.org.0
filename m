Return-Path: <linux-arm-msm+bounces-43634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E79FE67A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C803A224E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF541A9B3F;
	Mon, 30 Dec 2024 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQmLUI/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FB1A38F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565435; cv=none; b=nOAtRF0z0eHZm1WhknEqdLBAaN4CtN5cPQlsnjt3Ndf1Nx0F9dn/go9TInHXNG0UH+FXn18bMhOgU/ivU+NbNXOja6Lu86xAfHRbes1+0USnyu3hPfz5pcRQ2Ic1e6pMKzEjABulrGQPiWzRGjpRJvXn2J5SA4W8FG1VsB0bLJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565435; c=relaxed/simple;
	bh=95yOJU1VQIxVEl1re8QM5fh7nv37jOqHWqJP6VF+aZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+cDpMUCkK3DQ139woapRS1UIMtQ32zSqPFba+hhHLXL3t1gfD7Hkj5NdwUrRoEE9KxRoAD3bwau+1y17X7fXSnylEuajBhvLNIUgH9F7OElvV9D9my5xIM5YBEnBwtbVZJBluRe4xzviToYjIjOPkJ7gRKo78ojk25MoE54eIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQmLUI/h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f664af5so104149935e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565431; x=1736170231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+7xtqqtkp033OeyM7tyDLWsNcEaw2gaAkIZmZbhgBg=;
        b=RQmLUI/hv8UxLTUPl8LUTisIc0WB09ke4UtGnplYcLFXgaoM6WBnISi3iiFsD30p3J
         EaPbW2a0z4Z1D8eT9xnnE7uU2iF93+beGLsIjcRTKTSBE/gUG7Ox6woNsUDdvZcqAits
         p4jNtD472FJPjXUasjfXIiezwYaCwyPrLMl4Y2pRbIRlm11ot1gTSkn+DouM88zqdcPj
         oz+I3tysop2hBjZCIxeyaWHZi97l7Hc6IGyHFRyAjybwudQiUjq8c6AGiH90PRs86eN2
         PikHm+rPJuXCXonB3BgmpFCkzHeQOUn5sG2FmyNq4TaBT63s65H6oY2e0EP2vQLisJJv
         OEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565431; x=1736170231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+7xtqqtkp033OeyM7tyDLWsNcEaw2gaAkIZmZbhgBg=;
        b=sO4X22rIArqJXQ4lzVAQOqgoOYcxdztVUn6mxNzhe55ppe9tTNaoDzKAv1gYS1Mggj
         VVkqw2CrXn/R9yoPwhWMY28AWqCiVVj67po/MLbD5tj9zK/zCNRs9WGimtCCFHBIUPOO
         qGGzaoxLwX6O5uXo37d1XXy76NKE8ZCI7KsS6NAtxCC0k0pMjQkuOJHcRJDKepW44+mP
         qFqROvwUBy/Us5qZhEjr5q2EVLfXH+6yfi0RuCLePVshG5hORDb4v1fEQarmS7YEPz4+
         hLYTS/Z5t5qRcB7Y5Fe/HmN9PwoifOt+ZE4VktNAW7aNsY1Ft2Gp6BrSnIy0peFDbZ+c
         I5EA==
X-Gm-Message-State: AOJu0YzwU+ZVppDcvmdry1OYdbl6Yp9x5y3Q5fSXJtyusgNFrh+6OBl1
	/BuUz9mj75e5nJ5Ut+J3rM22vD4KlZ7yfL2Feak91neO6OROtFbrx0g3BHyFh14=
X-Gm-Gg: ASbGncuvRcGtkT3+QJfjQFal22arQmmYnXI79UUwIIt71sa3K22gqn4AGmaQg7KnwWO
	LqQftixRmUyJ9ahK7ssULh3ZRC/sQMlsbFSuPrblcCgaYnAXqBN1kZw245hT3BaIo8HBA1QfUEV
	haJ4hm559MGGjiXwh4i2XebxDegUKcXOweXLasyaH4WNP3Vz8nBJ43bxxXq6WtswFI+ykuOBJf3
	Vc/9/KZ/uGzwDaATiV1emB61WH5Fu4I//LRww79ybxAuW4kYs8h6YIg9+soGPAX+w==
X-Google-Smtp-Source: AGHT+IFmCgtOdjnwvghX/v1AS76frg41vQn9vshRFjLcdgo6QJdoBCPQr0LD+fyMTYsbsDCIjUPY5Q==
X-Received: by 2002:a05:6000:144b:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38a223fd302mr28676119f8f.52.1735565431271;
        Mon, 30 Dec 2024 05:30:31 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:30 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:18 +0000
Subject: [PATCH v9 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-1-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6

gdsc_unregister() should release subdomains in the reverse order to the
order in which those subdomains were added.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..bc1b1e37bf4222017c172b77603f8dedba961ed5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -571,7 +571,7 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	size_t num = desc->num;
 
 	/* Remove subdomains */
-	for (i = 0; i < num; i++) {
+	for (i = num - 1; i >= 0; i--) {
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)

-- 
2.45.2


