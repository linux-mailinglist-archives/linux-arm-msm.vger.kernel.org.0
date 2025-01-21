Return-Path: <linux-arm-msm+bounces-45673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD11A17BA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D84116176C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAD71BD018;
	Tue, 21 Jan 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHgEiTpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57220139B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455304; cv=none; b=luU7E17JyaMKhI6YI09vz61KOEuWgI0dFxO/9ST4MJ02zId63Q+rvCWvFvwaTbYbZLuWdx2TxYcUewxRWuCmMPOg5ul+rujdf+q9gzuRMNWe8iHFmYKPEy1YyFpVZ8kxORzI7T50XraDH6lcL0JjoPrFI+MjT5C61XvkrTzpbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455304; c=relaxed/simple;
	bh=wQrpa8GS8kWaeHHTuydinL+EYq/LIZeo7muVMGQGY58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7lWt1tSrtnGyx3oPeOMUn91bFyBUVclgT0dpGkd+LEchCuawB53UeaE+SSwhT9k0y3fBeJwfB1FDV9SiHLGnDPAxCEcMvGKpUoFARsBqBkE76INJONkESoi6kUZ8+JwD/yHRg7YTjhlOhRLwWTTQczCag9kbfBpT57lUsnBPkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHgEiTpw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436230de7a3so7881525e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 02:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737455301; x=1738060101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UwcbP5S9WykIwHHqTseJxUbQ5fCZisz/OQPi9djEpE=;
        b=YHgEiTpwWvH0iTarvzOxSb2Q4sfHJ22ktPpMnPGniNmf5RU01CMoRaefAg/peYJzoS
         CqSvZPbd8lA6kh998ZoZTeZBb1vtQQvgAigC/qDEwiVCc3DPuFaz4o6PPGpGK+GTBOzv
         89co2DPDpN43c1uBkm9lWEdutRrdgTnMA0No3b7X4RRttey6/BHvYfg92oPrLU3jEi+2
         oO7r2urp21szbC4bNI6ee7oZ1zyMV1Bfw4cIH7mq2QDdSneIoWgamxojxV/m3YbGM7d4
         1WW8FecloFy+nygC/0Xwt6INn2Tik3rkuPZrbYmde1uwzBWf+rxwyl4nBRMHAvsf+5Zv
         QSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455301; x=1738060101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UwcbP5S9WykIwHHqTseJxUbQ5fCZisz/OQPi9djEpE=;
        b=CHd+v9npMVH101feX0NSL6NCNotMxdbxcpOzfYFQiD4xMbroHNmhw9r5YamWNDb+v9
         ec2zVGrZ1Mbu7WpqN+quCKAuIPYARXNlM2tDsc0BRMfSf6/kWbP3WuixHtURhrCvZZqk
         sRumei/j3kwnAKbcwn25BUBsszrq0eWHyA55atBZpdEZ2/y9zKBjoCZNC1F902AUaCEY
         /8Je7t18zfxSftC6ybAW8iMoRQDMDE0VO4ccOfmBh/bFSE9SGS/9DS4j4ggZgqVc4qhE
         8oyfm4+C1/yW7r1Cvx+k5qyFIatAdT+ySln5AyXAOJpS6wDaWBfZxW7YI3Ow8BJMrkhI
         s8sw==
X-Forwarded-Encrypted: i=1; AJvYcCX56D/yDQZnGCcRObyLZD0lO/NC7GxRs1SxTmqPi423f5dYaF5DL/7WuZxfJjY3RDotXVUgStJ2tmX8OxBV@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJyzT3o0Cr2C8Q7I9FbVf29EBWF+GK+4dsLiL3vTsnHTbJzas
	xHk9OEwAyzb7DJ7FEzLJ8OFlTQUkDXalVGAkHnWRUIvnGIqmNy0bjfO76in5W88=
X-Gm-Gg: ASbGnctPRtw2TLthbLVzc/O8+GbbJe5UnhT7Oh8La+sPR/T36UtlEEGqGEIJxeoNXW6
	EU268ROIR+3L/cWSFEkxPoEMe25EsMDD8MYTCXBHQVfbjUXTDwsMWtTkYQcfdEYd381jYYgkodk
	005cwxncnaLRsEeiR/wkJ1RDAI1/tL15+tfJMSVUSCNulcgiwMvnITX+XEJeQW+xltbNaxCZW6C
	M9fn4TWLcHBYPnFtffID8LWqXrO0GqM+KNuT112wgEizyZZQxC+wxlFxChzCx2q5BMk1Dc/gh8S
	FKkzXY5y
X-Google-Smtp-Source: AGHT+IGL6uv0owpIehl8E5S3svyTt4yRH0CqejpKrKr4Trgu+zf/RK1Q5dsKzuwa6rhro1K+PQ7aoQ==
X-Received: by 2002:a05:600c:4fd6:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-438912d37d8mr60446625e9.0.1737455300745;
        Tue, 21 Jan 2025 02:28:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625e5sm175204685e9.32.2025.01.21.02.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:28:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: qcom: Do not expose internal servreg_location_entry_ei array
Date: Tue, 21 Jan 2025 11:28:17 +0100
Message-ID: <20250121102817.68577-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct qmi_elem_info servreg_location_entry_ei' is used only internally
in qcom_pdr_msg.c, so drop the extern declaration to make headers
smaller and code more obvious about intention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/pdr_internal.h | 1 -
 drivers/soc/qcom/qcom_pdr_msg.c | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 8d17f7fb79e7..039508c1bbf7 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -91,7 +91,6 @@ struct servreg_loc_pfr_resp {
 	struct qmi_response_type_v01 rsp;
 };
 
-extern const struct qmi_elem_info servreg_location_entry_ei[];
 extern const struct qmi_elem_info servreg_get_domain_list_req_ei[];
 extern const struct qmi_elem_info servreg_get_domain_list_resp_ei[];
 extern const struct qmi_elem_info servreg_register_listener_req_ei[];
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
index bf3e4a47165e..ca98932140d8 100644
--- a/drivers/soc/qcom/qcom_pdr_msg.c
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -8,7 +8,7 @@
 
 #include "pdr_internal.h"
 
-const struct qmi_elem_info servreg_location_entry_ei[] = {
+static const struct qmi_elem_info servreg_location_entry_ei[] = {
 	{
 		.data_type      = QMI_STRING,
 		.elem_len       = SERVREG_NAME_LENGTH + 1,
@@ -47,7 +47,6 @@ const struct qmi_elem_info servreg_location_entry_ei[] = {
 	},
 	{}
 };
-EXPORT_SYMBOL_GPL(servreg_location_entry_ei);
 
 const struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
 	{
-- 
2.43.0


