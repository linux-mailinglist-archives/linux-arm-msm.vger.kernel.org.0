Return-Path: <linux-arm-msm+bounces-2718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1AB7FF120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C994BB20D34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE0487A0;
	Thu, 30 Nov 2023 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k67bzIRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2523F1A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:04:50 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so1003941a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 06:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701353088; x=1701957888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGKbsrS8HFlOmn4rDPKznNWz+NWrUs797K33kLKZj4I=;
        b=k67bzIRAKeF4Q1Xc0xXT5FUCD2g8OHQtUR4k6qN9sixZdoBKa5/7GsHUw1D26H1ZKy
         Z2aF8LcyGuk6GJYBA2ZX/zoBvg5LPelKSMiznzfc0srPzJowpNT6F59bPQGTy/JHSxER
         3JGUaogz2OjJY6jxYUvbjaHS28l0NpPVR5/CTFcj8s6M1jYmO+IQe4DnEz2RFI3BUHTD
         zUuBcriCwwCbwqE0yDhoJo9u5kYxpA4xykbBUHFfkqEUuJHuSw6+nynw5/+yEd0u4Z+j
         5OEV1ajr4xaf+WK7LT0g2Z1i3t1N1+0rEbi7Dx405RJAb2ghvhKtCeFBpHA/tGqRMdSw
         QaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701353088; x=1701957888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGKbsrS8HFlOmn4rDPKznNWz+NWrUs797K33kLKZj4I=;
        b=Vw3+3hkPKDk0wbPC4w/hl0XwuCSuwaEecSrMwZp7dIPlKl5m36XKkOJJrbZs0ZpzsP
         X4JtymMY0lKSAiyfXTuELrvvyWCy3RyGJTKl5Qik8i5UI2IqjAardDJaC0Btnsfj/IkV
         wytBhbxGcVzcP7BGSmmmEEmChyhMMz7wqvrFq5dBkGItRyxq2/Hh+rfHIPy7jqpjqlW8
         gkCCs2Sb4+2FrJ8qyAiozTN38Pq68NjeJs0tODBSR7O/EMmU9j6xl2kLR6GFawSuId8V
         fDvPn6EFkjmLLnCt7VxdzJeLu8u8SKwHyPI11BK5bHxmhu2zNseoJR/0pI0ECyxcGYM2
         CwbA==
X-Gm-Message-State: AOJu0Yz09/WgfVnvZag1W1s3u1VpjE7iU0/g7SsFl1ZY6F9qjUzGCBHo
	2mCpa+HqPLW1WyxqnfcNvNQZMA==
X-Google-Smtp-Source: AGHT+IGngvHRwAbsjuw12JjGFczh5cjo82vLwrx0SzdSAuri3G83AegT+iTn/fzD3P1bdPfCNyaktA==
X-Received: by 2002:a05:6402:2047:b0:54a:f3df:5814 with SMTP id bc7-20020a056402204700b0054af3df5814mr14049790edb.25.1701353088536;
        Thu, 30 Nov 2023 06:04:48 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id bo19-20020a0564020b3300b00548a0e8c316sm571184edb.20.2023.11.30.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 06:04:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 30 Nov 2023 15:04:45 +0100
Subject: [PATCH] interconnect: qcom: sm8250: Enable sync_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-topic-8250icc_syncstate-v1-1-7ce78ba6e04c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHyWaGUC/x2N0QqDMAwAf0XyvEBbJ7r9yhCpMZsBqdJ0wyH++
 8Ie7+C4A5SzsMK9OiDzR1TWZOAvFdAc04tRJmMILtTe1w7LuglhFxonRIN+E2mJhbEN3Li2i9O
 VbmD1GJVxzDHRbH16L4vJLfNT9v/u0Z/nD5NLJFp+AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701353086; l=1003;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VOLasUkRPJfMaQ++a/e0LfA4FM1YxoUkJbWWFQdBDJ0=;
 b=MYnLohakk1PKPabBjSwyIgFqoYS/wngoxLn9E8TuXTfUjRYj3C20OJDj7bPu94HMlr9bdD4BR
 BfSViwtJvJNCtl0C5C9GXo6vH8hmH34C2gYZ2rTV4lFhU2nDL5mk/8A
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the generic icc sync_state callback to ensure interconnect votes
are taken into account, instead of being pegged at maximum values.

Fixes: b95b668eaaa2 ("interconnect: qcom: icc-rpmh: Add BCMs to commit list in pre_aggregate")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm8250.c b/drivers/interconnect/qcom/sm8250.c
index 83aeb3eedc19..02d40eea0d69 100644
--- a/drivers/interconnect/qcom/sm8250.c
+++ b/drivers/interconnect/qcom/sm8250.c
@@ -1995,6 +1995,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8250",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);

---
base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
change-id: 20231130-topic-8250icc_syncstate-72e5078ad4c9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


