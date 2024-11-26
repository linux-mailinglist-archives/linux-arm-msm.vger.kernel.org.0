Return-Path: <linux-arm-msm+bounces-39229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434E9D9FC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 00:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B26282914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 23:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C16D1E008D;
	Tue, 26 Nov 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPkmxrDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C51DFE20
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664676; cv=none; b=n2UvJjD8sF1mn44ubpVIfClHSZpk7AqojgHea3QGxBr5MeZesceJxuyfVmb4tBnIF+n2q4o3kyolFIj+2s8aLQ9KfTxUJ2crLv27J7IwIB+oEJtboYvBaVHbkdKxh3at3vc2LCilpox5hDBHzn6wB6/S4RIsf+Cwou9SM53/Ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664676; c=relaxed/simple;
	bh=CdkYU+QJ7VGTHMAgD+J6/KS8Mhb64oBSKmpBnvb/LZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrWL262qb8pDKShfvhtiPvwqF6BJa2pvDFUjTgjVb0inxSqCEFN+IUrGW3hTLU1/1vfbE2SSdJyTkBWpmyKOrxu4eexsv5JF0tpC+4GnZaED7dMElY9ATBdU1y1UFeFyvAICosi/NjDI2rPDWbew/KrV2VUuXletWVd8atVeqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPkmxrDh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3823cf963f1so3914324f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664673; x=1733269473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=HPkmxrDh0+CPbjb4L7WbvT5rXL8iMM9EZfu9l9WQMey5BAkbsfWWS4urUyEphohcbE
         m3t8rYNefwbCdh/ls0U8ldwX7WLYCtHRTsPoNFYNuxQkrMoDbAfntNsKd3+P7ZuaVjD/
         HwmvEoHAZL9IoAqcZyK9eADMJIv9/O2Aw+92MYxzL8aLIS6dFarUoo+X8QtQg/NSJtZ5
         Ogkc8cnZI6UU0BXMiygTxuI4bEssry3Ihn3eii4FAg5rQrqITrbzG1hD2BhvkZ76+dQ1
         Lg7NT7cIpmaD6NT5NQr7jxN2DDHD/BS/gIp7Eur93kdU0iK3kiEDlBXT/WO2n3/948En
         xjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664673; x=1733269473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=dlf9Q8z5mkyavGXiZx4Sd9GCquK/XvNKB8wW1fyq+bQYZesbq6K4QsLqy1F3yVYfq+
         8qnnH6B9vcNmU6nwsMbOfR+swrjPGljuFPw0wYw4fJ5CRgJQ1T7OVgrG4csFFIypbqSz
         4Eda8x2vkyQb0IKwPel6RwqjhxmGxHr3T8PZ3ZH8tjJIWrT3zq5rOcVjyJ2Ehkb4aJX8
         79rTmB+e+MDN05rlt0ZyC78lvvrZDskYrQx5L0todjS972yviCV8cAjBPaKHt14L1L6t
         bnrPO3/bAFNB3UNSegfgkJENbcEQy86VGZeVdBkkLpFZ+XR5YEecTq7tP+fbFJdMRVXf
         ZVsg==
X-Gm-Message-State: AOJu0YwNAnRoGzLB2na5Ms60UX9xH/UCmm4K1zUfKXVMBFWUBHjs3tEE
	YuSWJVvwYdNXMmNgCInVtavzZNgjzXgzBMVyFuaC7qC83g7rwZ/tVcF0x6FF0fQtZ+NqqnOA2Md
	elNc=
X-Gm-Gg: ASbGnctu+2pgKP8yNMdCsFAKUGKRLuQNX7tI4/wOUYYvn2KBl6djw9cv/IF4dNv6+kp
	scs0/tqRCgeu0mnPCAlb3/8m25Su7TtTPlyXEO4+iger5j+N2gjWN6px0mVM+XtwPXsdNVBEUyR
	76s0hPhbwSQB5HxHG3Ns4wWmhrw3b7Rnp8b0RDhKUHWlJyRxv+9OBJMKputgvq2Wq6QsBeBc5eX
	CyFUWWoS/pYi0y7r5TpZVdscoveR+Ib6Gk5hGQFf7GPC9rOYztOLgQdEJI=
X-Google-Smtp-Source: AGHT+IF/jcs8cjb4B6GiHnOvpr78M0lvjd/SOOBsND3Uk6XPO25NFtr3q9aIzztmUerymlOVowuCsQ==
X-Received: by 2002:a05:6000:2a9:b0:382:5010:c8cd with SMTP id ffacd0b85a97d-385c6ed7749mr578127f8f.44.1732664672853;
        Tue, 26 Nov 2024 15:44:32 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:27 +0000
Subject: [PATCH v3 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-1-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
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

pm_genpd_add_subdomain() returns and int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
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


