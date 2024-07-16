Return-Path: <linux-arm-msm+bounces-26286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C458893226A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C19E2832A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BFD195B35;
	Tue, 16 Jul 2024 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4La0nS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F3195F17
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721120733; cv=none; b=uSQ4aPwjcVw+OHnVpXBDgOXtZAZl69YINFO+2L3KT5NxVIrR6w/qNtKnm1iSF0791U4kgUxy1u8i/FUAYp7oht+wn5AYmflxIst2g3eHWvHJ7F8kZDjVfqy4G/UNSKTGsGvOcWuE9XuKq8vZ1vOwSBrO7BY/hbLwaQxbKdAHheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721120733; c=relaxed/simple;
	bh=wnZLZc/GruCNzhFntGEwskFTqjT74yheJIgcSlXmFBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UizleWJvKh71WAVKhjYZFwESowZwlG+74sQUiEIFQyqWCr1HBQ6jiNtqs469DSh0CyaSK0TIqMLpbTbBlU9fDqd1L3LYjB8VZe8dOfs/ucoBretMnjtwwINn6GNHuQEyS+yO3r1aG8HqRcAL0Q0Wr3Yy2+KDQCcJxFmycHkQ0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4La0nS/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so33364775e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721120730; x=1721725530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7WEQ4IWufigJ+eDUg1Ui45rVWr+qV9YxcKK/eJOPrE=;
        b=P4La0nS/cxIAwcKiM9FJGGBrmmF1MwnZmpH5iz9n8KSf5MO6NIPiEGuVWXeccuSyJQ
         ZV/8HX9ND853iFXXZV8osJ0GDDPSi2/jGNpwK5JXbTupYHByW1OVYcMKZfoRZOLoylIo
         Py+wL67Lsk+z+orJVab5SBmIW+JUOEvji1o6iUE44qLYlXV0ixHykgLGN8xJK/N/Px/Y
         wZPji+qVxo+THIzi6Wdz1Ib+KkkJaIoet6d90bfWS2cvzW1s1lgGthJ8ro+/SSwyQccv
         0y3zWmjNmsVJvE+L0JFrq+A8d01Ce32M8gKDOcGyMJ5iq3Lt5Z+f5EgrSejPiyCgrmh9
         Om5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120730; x=1721725530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7WEQ4IWufigJ+eDUg1Ui45rVWr+qV9YxcKK/eJOPrE=;
        b=kcoFE8Ra/6bMt3CrbA0PAMCPPr46H9P+bG0S34KK14S7iJo/ntIS3aa6nToTkQkudB
         34/sAyEIRChtIjbeWc/QZ381xeCqzt7OoTafvSj0vDLMcicsJADH/Hm8C4uDP6AwaRdL
         KiZxPE/LrpQGjfiot/ESjkdXS9bIfJmjfaaqdtGwmaJYXcje7cfmRXjGkdn783KOXIX3
         5Qn/u9sPtqveWi8m9D4jTCdwhxScbmCptsIkIkd+sAOK+MNJxUZ3kv62TMvwp46Sm0gK
         navmYvhYGR0jjaAvY1NIdvu9+cBi1ULMe2dSlqZEwdHEnSjC2w5l0l92xPeK/+mW2ioT
         LLlQ==
X-Gm-Message-State: AOJu0YzCqjUSv+VQfU3+9Eh+kG6MwTfDlf5WddsX08dR+pfLj712EgeK
	ynj2pKNvc9cbNr5wGniAbw8xDdboMhYTrXjN6sRblseSj4lhKMJLBSa2/63818A=
X-Google-Smtp-Source: AGHT+IFjeXpjkmtgX6FEUXjWuap/YnDu0thUYlSz3pmmrD3NK6HcG2kCHxNu/8Oa88o2R8Ko68qnmA==
X-Received: by 2002:a05:600c:1f90:b0:426:61ef:ec36 with SMTP id 5b1f17b1804b1-427ba48af4emr10652635e9.0.1721120729524;
        Tue, 16 Jul 2024 02:05:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a962sm148687875e9.12.2024.07.16.02.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:05:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 16 Jul 2024 11:05:21 +0200
Subject: [PATCH v3 1/3] clk: qcom: dispcc-sm8650: Park RCG's clk source at
 XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-topic-sm8650-upstream-fix-dispcc-v3-1-5bfd56c899da@linaro.org>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
In-Reply-To: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wnZLZc/GruCNzhFntGEwskFTqjT74yheJIgcSlXmFBE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmljfWqrAb6ndyNgnKgg7ukh84Jxo7IrJkDnrqRoYR
 nN0tz22JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpY31gAKCRB33NvayMhJ0RlqD/
 92xKbJzVONgVsHBSSXO/cIBq7vc9LYqh+FAMYJ+3TSxOc2GZ7qem5x9wpiuXpf7WHcGysVjQ4gbl2e
 Jhgx4yQQAHlE1IrYUBSyxqhw/+cnoJMDeSituw7U7/NhsWY5RJfQJOk56CRdzN6jZUCG3WLXe9QhrI
 EJ9r2sQzsDP1VNlTUCODpKIYrIpvQmmW3eTfGMBRt+fqzlFiRr2ENpS4Zo/zLZuQkbMTm9CbtFPMLQ
 LHL4Wulu2xZvzKrDeFvFXBtGf2ybmj5jYDeAaGM3VJU0j15agT4+rn6SX+gfkLzr8ZXARBwehby+0K
 tzKywkfNIVostlaBB8bBn0Vn1TqZ6Qu8vJkRiAHDlExIhTnyMQiDucPKQ7lYLyBkptZd7wyr449G38
 q5pyIGscQW9Z+JewjH25K2pGQPlSb7MXLNV6gxS1jiuGGTdsHG/umYXWbx/V+ufspLHBe1mu4N5Eo6
 yPwfgY9UfB520fOLoOhJclV2Pd/CKPfHAviDdOupoeni5n3Bk+IJYOSxIK2WbXIdVhbYC+P4rZye5P
 +riXuQRptsEzuB7m89mAPeGyEKSUFR0/d4OBMzMpg7SfarG87nkB6XO04I9htuTlLHTmBHqwkgeZFI
 /TmgaB284jeCRyxwSIk3r6uRG993pJVU+r41T1j51J5AjQEv0nOCL7tdslxQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

It also changes dptx1_aux_clk_src to use the correct ops instead of
clk_dp_ops.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index c9d2751f5cb8..80fe25afccf7 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


