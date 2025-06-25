Return-Path: <linux-arm-msm+bounces-62323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35834AE7BB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1CF73B5E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8FF291C32;
	Wed, 25 Jun 2025 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rhllXXZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D8287517
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842718; cv=none; b=UeQWAASydVuxDnJw58cOpSsitoNOlCfZYQakOMAyE47eqjbkFL5ltx6OiAGbDUrXrjS0LAWqaV7slzqr9X8laHGDLmWVclbeQ0A6u3bdkDXQlWGlEyzeRigyz4VMPNp3Clzuh7r+fDb392s2W62+//7THZtG/iVAhjcyx0+XEX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842718; c=relaxed/simple;
	bh=m2UyrRZA//lErtuNhY9zqhy2ALvM7Ol9YNkBdGKe8DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRrECZN9xqOb39yHOZq8jFRUdRrt1AvQkMg04WyLGN6KqvajrHXl2qnHG1PkR93/gElErmDqOnJcCMeaFQJJBrj4aR2wKfIdff4wt8It6n12p4Z7uNg6hqA5YTFdBajWvYIhZl9txbWIZJP6Z4tnX4TNoF5xGilkpxMnOP3UOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rhllXXZk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso9747607a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842714; x=1751447514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/R0g10W0bzPijWTWLbi3YiCCpZFKu2dS+3ioA3PvSQ=;
        b=rhllXXZk59I2oqYQID49R0Gk3aBDhVKp6BMnuGoVNlRjW63R53FH9icU/+wpwQJcJz
         V04NDwErAbG8ld/Qe3aStkpQwGqePu3BAsmGAsZ5NRuUN11ifCDLrtAmm4JDoo/02LlW
         U8la85WRdUpHXAUYz9o6D9uCw/u9QliBeFIXnib1mWh+rsazRcx3+0bZqg00dOKy7y48
         UaRW/GatOArQNe1mUX73KpchK/rgb2xpGRD7xUxzVcW0qJOzck+Uhr7ANvwDgnwioZ2A
         wM3NhK2biBRSR7I28yqdpOD9e25JYTLwFpZgD1xm3eBAd1Ox8KkdBwoJotrwSFEDulQ4
         eIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842714; x=1751447514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/R0g10W0bzPijWTWLbi3YiCCpZFKu2dS+3ioA3PvSQ=;
        b=PglVVYr2xPFWBOURqfBUpXUg7c8tan9mJVHoiZh+nUJzeDMJxtRucCuIqvhPa0CZdD
         0T12TySb+DxDfk/Aog2wvNFFyARV335tpCpXhFvBw6E4LPYPBXfqxdyrVtUwqNmNUOpH
         xJFTrs7lttXYOysenEDPMMbdM0d7XMg0RuEX5O+Hia8a+5Y67JXKJxez8AJOrZOldJzX
         PqU4vT32iIyS+vNP7hm1WbZMSMVOyuCGUrnv5sDSq1BSOaNBrtuGAUKwoR78fSb1ER9K
         flPjGVB5Lf68XQAFt+7zXlHviEvR3B0F7R71IksQisUFCekvEwjdkGlLkbaq8novBj1K
         1tfQ==
X-Gm-Message-State: AOJu0Yx+rcpG3qUfb1/sPYtS6CguP5GdSFxSkuqZpiqydhjKp/7rIRt3
	HE4LSLr3uX/MZo1k5+zWayLkQ10oUDLd/Os8wj2FdC/MwUcErKADXCFSrGHEecCWdLc=
X-Gm-Gg: ASbGnctuv1iLguV1tXRHlK4DY5rNC60PQgxev2VCGsWTEQaHhROaPWhlSdpkJAhwpGB
	gqq6YcWfpnkz8KfgJYbYq2TiVpF8gd2C/QxaZKOFVB3YxKq2S6ZehM/Zi/7nij0TwJDNYfYi7li
	pHkv48FD21I03RZ3bA4zBKfFml+5gKpOQk8EfKExOVu+DNFFxx4dAQGNs5o0fTH++1WzL3zwrxl
	fazfglb0/DalqbT71dlaCNdZgjxmp8YxuqhP74yiss0FRWGTZ900OqdyoqRV9Pkk0pqflAzPeJl
	4oyb44KVrH8vhPHo1/3gY4DqnalYnredJdzkmcioi63u2oJH/JaVN+g0Gs4RQ9F3BIdMInVNccV
	MJheVHyZ06tg6fpQWj2oWevWhWpPASdbN
X-Google-Smtp-Source: AGHT+IF+MHGPLMUYmdpflYrcuvnzlCZtbzOzqhyoMrp5eCV+KanI5y/U8MdLEnpwImyOyGRYhLRBMQ==
X-Received: by 2002:a17:907:94cc:b0:ad8:9b24:9d16 with SMTP id a640c23a62f3a-ae0bec2a914mr231166366b.6.1750842714412;
        Wed, 25 Jun 2025 02:11:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:11:44 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635
 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-socinfo-v1-1-be09d5c697b8@fairphone.com>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=957;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=m2UyrRZA//lErtuNhY9zqhy2ALvM7Ol9YNkBdGKe8DI=;
 b=Ldqqz3GZc3LGt2XHqOeX+CSUlD7vT1xgWlgvTKi4kn5n0UtIqq9qXPS4carhgbVMGRyOckImw
 b8jLOBE6d8kCXWnsd7fkYfIjzatoyA4FSFN/WkfmbnXob71W/lfXrfl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the SoC IDs of the 'volcano' family, namely SM7635, SM6650, SM6650P,
QCM6690 and QCS6690.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/arm/qcom,ids.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 897b8135dc12f56b82c6683b14e2fc135daefc20..cb8ce53146f0c05dab72f9a27c262a2f51dcd66b 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -279,8 +279,13 @@
 #define QCOM_ID_QCM8550			604
 #define QCOM_ID_SM8750			618
 #define QCOM_ID_IPQ5300			624
+#define QCOM_ID_SM7635			636
+#define QCOM_ID_SM6650			640
+#define QCOM_ID_SM6650P			641
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
+#define QCOM_ID_QCM6690			657
+#define QCOM_ID_QCS6690			658
 #define QCOM_ID_IPQ5404			671
 #define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674

-- 
2.50.0


