Return-Path: <linux-arm-msm+bounces-41380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492D9EC0B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E060188786E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1201C683;
	Wed, 11 Dec 2024 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFddXlxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A58489
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876872; cv=none; b=N0laBSFioOnM4SkWneJRDMGOMzkKHN+Bpot5dFWJpJYg7XLJz5TQBFsaIWmRvTA735xSXUuAF+sOGCT+DduF1nD6iaxEfsvyvt03c9eDRJJ12Ct+iQVZBA4SdPVPqmC3TGvZZ6gSTdrjJHgSUKznF0Z26IP8I9p/yFVIKhPMgz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876872; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+5Qp8fs3tzC94CG5iqbrGeMUxx1aNqDMnPrw5K1954QsKjU5UGynAIjhpMbsiOmSMMRMScG1rA+syg6W0VBxIWGw1tlIH1Iun1YxKhgNbKr/SOUfcWcroQZHOgsgaXLZFowMOJKPOnFu9fZxv04Haz+e3cMzTprI5QLQV96S7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFddXlxP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so7950905a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 16:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733876867; x=1734481667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=CFddXlxPbylfH/CgBkKc+nwCdkWLz7rk2e93AwaP/uMhCYDp2ysLfunIjKvOWLnzyr
         Mni2CPQ4RegvZvzHVx0hTBjZqwGMCaINHHKrTLYe0XRbiAq7gzgfkXKdCyT+rl4OYBQs
         7N8M8wS+y7KJHs/sTj/GUs2wMJM54WPTR4NpPnrbtKc0b8TPzV4v/WwV2gx4gE5dFOmu
         xhwYXJf8dCcLVqNJSI2Tn3rcU8IpZlk2AuQ+13V3IBct90rTw6ZZt7XY8tebeoJJbH4S
         scjtanV04qGqLv9kUOOblmc1ETANt9yqQPW1sWQ/vbOdY0AZFDRzCBdIvr01H4McrM7i
         dAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876867; x=1734481667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=W//9tEOUjO9FFx393F3H3+IYkjAsECirEtP9XXlXk0sf5SUmXZlLSiXr564DwBRUkF
         LM5DUCenjE3xa2lE4rBUxhO6PKqt2pEDX1eLJQeUgcuSbLn3DiuqRVZ4dbqrE8s/unO4
         mhuVbN8rhupqrTcJh00RuUvW3uB44zMbRz9kwkbzKXJ4u+J2OLzc4Vep54+/U54jwy3Q
         3txHzFbtIKaV0vedtD5fqY3QadskFyCS2G62lKwRviJ/yEI1pvT1pGRtgL0Ulms1WkPW
         JhS2YIE4Vbz96D0P3eEVylakhVFBsayyWfIdL2n6mCA442Wxxusob3+ZEAoYYKzXpfPx
         Y6xw==
X-Gm-Message-State: AOJu0Yz/ECne+wyMWd0RiKni8AVW7UFfeHH0Ake9jBsiBvGQBbN/cLOG
	YkokMcv+CMoaMqQ7Kr7i6DUYID1OPtB/oquSqgsJBuvaVUIyHMtt1y5Cy2c6yPI=
X-Gm-Gg: ASbGncsd3fDtSTOm45U6mdVIKg4OhHeaNGw+z5ZasYpjY/sItLlmKt+uUcbq2LQGE1x
	1f5tVJhEQqyUGy09RFcPStRSmZKH1KmJBaDIMAAQvK6GFFt3lxiTyWOaeRhsCxXG4reECgGVyE3
	H5iVUkepV0/rCKrSzC/uwyKuLo/lfo6GFW8bNWpfGC6JBmpcyA5kD+EDfEO2wus0dsM2t81iOUD
	i0RiLLUjoIyDv9Didgw+m00TiFaI67qVOfd7gQbIKD0pz0xEFY11zTgmTqNdbk=
X-Google-Smtp-Source: AGHT+IGuQRWUUAEjEqZ4dDWJ2yJP50NE8IhkqArwEivr/Mss2dg6L0s2MPZphZdFxMVQwkR7ehoZPA==
X-Received: by 2002:a05:6402:234a:b0:5d1:22d2:8965 with SMTP id 4fb4d7f45d1cf-5d433177d66mr547146a12.30.1733876867522;
        Tue, 10 Dec 2024 16:27:47 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa97asm8155530a12.73.2024.12.10.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:27:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 00:27:41 +0000
Subject: [PATCH v7 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-1-7e302fd09488@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);

-- 
2.45.2


