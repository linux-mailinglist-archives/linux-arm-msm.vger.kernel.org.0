Return-Path: <linux-arm-msm+bounces-46683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25DA2506A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 23:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07CCB1885134
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 22:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04159214812;
	Sun,  2 Feb 2025 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="b7cID80U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2B214805
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536374; cv=none; b=ffoswVMtMLnnrE3jZqqX1+6S4TpK08zMBr/a/9BIZDecV5Iw7pFV3GyJKyshKImKa7mY3MgyeCqkBPxZWxnH6D7+SaD1qaPLuwC91SBbmUjkQLeb9DoeXlAFVFn8lY3XgzdnWefEtcxEYCFh4mR77p6P/sh0jE7MrhAvZD/w7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536374; c=relaxed/simple;
	bh=YnNSE/LPAfAe/u2HSLYj+o9uJBnXbnpQ9KgSWsMPZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPrN50hvNCnAeTzfGykn2HGm2kGR9ncQlOjXy10yDiQWpDRVsFtVU4LeedKnFJO6H9MUByokJmC46SxI4nOT+LgWXu0+GpgWsODsON58RDTbbAcAx65pKkzXbaPp8T0GWmC2lIOH5CFAzVu0WkSIxsDPz1ItyikGWW3kKLWIHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=b7cID80U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a39e659cso25604995e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536371; x=1739141171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=b7cID80UgQ+VIi32X4t5rICT6N4nRqY8owH39oNJKBX4CxW2CFyHStwaj66+T50RtE
         SCIBxAeefY9TLfR8i1rX1SV1b0ru9Tfw9luX5japSKJwMZx1JwmLTmCc7piSrpIVElS/
         +yW1nzLQN+uCDBg1qaqdrcnV9zl5ABc+YmcaeWEUdOGvGvYfoT/Yd5+TwDhHTY8EtT9Y
         oDRqntj+UQiEKpLrxTPl8fYy6L9MMAg/GJs4DjRwkLyoraOfWw102Zj7bdrbZdVdmqn7
         i7GywM7CVBUcsEJpflubFQ+nLPkbIlpCIcnjl4pkmrTZgCjcLaX4qViOFwPMKxGdBzcr
         c+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536371; x=1739141171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=i7+nMVZdioeF3px0yLgebCjsfRLWmxdiQiMJOW6MMnIu9uVZr9sXb9YA3lTeIwfXpW
         ZkeATLG1hfEM6itAGlqLiSsgjJyZ7D+vrxqHyxLROL9UVW+1JRytpFBU3bLGXG5UJPTc
         dO0MCKbxkDEYaZxcy8FYrM7YRcHTC2Couh8yIWDlkpUvA65Mo2G28Q4jxQ8IUKTdCvH8
         4+J6ZiGa6rJf//BbufE74Al9UaEQwnBCVgJCtC9BfoqzO04d6XqBfElA4pnHJBRiUXop
         8CR1a3jLy02bxcIY1sbECcB55Wcof7bts1pWjQjMd+yCJcmTrs2yWJFyd2i5B4GcP/s4
         Ssmw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cMBAKWgJagzebWSlLEV/cWt52fRczd02mxix0zlB4GlNO4CYHgdSgc3W3xYtrUAEOyS3lJsZ5rhRiJ1M@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNm9GNG4giHDI4cih9At3ShcOUbe/kh0x5z8IpO3SthmBkF7Q
	ZzL7VvRdbdGs81Y9HGaZOtqAww07sdoa4iUR5mPhLuV5GYKuBkrBjFbT5R+IQMo=
X-Gm-Gg: ASbGncvznbPyogtlIlf1ozVMQxT+mv7FB9WmJSeDDVAzI+4NhX5getKfSmTtLXRFeDG
	jUIl+GmgY0jDavLyatPg0hzgifLPXuyvYQnDqi8VSfMZR9AtzY3xauTEiIaERZc+efBLvehubCV
	RFJtSiA0BtXWP05kTjXbon9RMzWbqzaxpvHFcgScptw0KHIGn9csgCTq4XYlLSJ89ZE7BLB593F
	uh3hcNqR/oSlaOwsg1eoYbEcTcI5lhqsliDcLfHs8dAfVSKh9z1GNcj+r4GOB8BfRcTcCK00eUb
	/aHHekruUG7iGTpYKwJKlcx0Tbs=
X-Google-Smtp-Source: AGHT+IGBX6lu1OSNvz8aeULWff/wDITldKG3wzn8oH2zHYByjYJKUn9rdrJm/tqoC8tJVosKX2xovA==
X-Received: by 2002:a05:600c:1d26:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-438dc3cb5b9mr167114485e9.15.1738536371121;
        Sun, 02 Feb 2025 14:46:11 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 02 Feb 2025 23:45:52 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-fp5-display-v1-2-f52bf546e38f@fairphone.com>
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
In-Reply-To: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Enable the Adreno GPU and point to the correct ZAP fw path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 965e32473a58ae4748e4cb748980fad1d2b06ab6..582b19277de414fa9cbb8f9929c6eebd697e8033 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -651,6 +651,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcm6490/fairphone5/a660_zap.mbn";
+};
+
 &i2c1 {
 	status = "okay";
 

-- 
2.48.1


