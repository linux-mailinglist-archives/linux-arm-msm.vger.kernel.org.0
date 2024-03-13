Return-Path: <linux-arm-msm+bounces-14000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC287A79B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 13:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B44D2850F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 12:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3547D40BF5;
	Wed, 13 Mar 2024 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yKtsibkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF3B40872
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710333044; cv=none; b=s3xRA7p28VTY60/m/m7ghfD5+J14ZIBv1vvXFn4xpb7Ns5sa4QmE6MNIdvu1naEwvDlGdnRVJRcUMqV5ahEBRSwQZlqHZvrq1FyYvifDymSqwFFge4dELgFrGeRXgulBj0mwOipBNQYs5CCrE403odhtyj+YfUK8Ypn/Q5Pr6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710333044; c=relaxed/simple;
	bh=SrAioTk1aLdkCEji8jYLnfjn9WTOsV09v1sWQsQGbG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sMZcrleypRcHh0MzJGcddE88goKEIaACG3oHTqRfdWT4HRjAPTvxYQcXlEh3MIbm1HeBbgptdzUrxg3VHE0V8LMvjlSmfg63VSJxzgPCROsMqxBzOlL2BQSK8ThhMPwxS5A0INPGTYSfjx3xSDIROG2szjFziRN582LhBTJX9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yKtsibkp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b6a1b940so639912b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710333041; x=1710937841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdLSB061DdK5SIkVqCpCWsXG7iNw7MgvJnssiXq1BHI=;
        b=yKtsibkpzZCm5QSKaHyCaVKRUqHpT6iNn7SLxwUrTfZiKGgmBurFYcA6vPLaLXzBvj
         E9s+obtFjWMqmRXNpgUimjfwwlEhAPosgp0mou29kkhBOKL6+faE6OLGVbrEL4H+pVv2
         9+QIy+tWbOwrxqYqk0UkTy5smGEYkEsVXCB75+OblUNonaiwMoWXX0lEy9DjJkPkeJSw
         25ZWvM9g3BqeqovoXoquG0I7z1gvgDUG+/hOTVn61X0Qyk/PI0TbnoYRtD4jzLy71Yrv
         VgqBvFKoPyK26L92J3K+egyyLJ9UkQzqRqQQKSiUtnOm1HCVD+bVAJZzmN78Xov7yNnK
         ZneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710333041; x=1710937841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdLSB061DdK5SIkVqCpCWsXG7iNw7MgvJnssiXq1BHI=;
        b=CxsP7zzkkr7tIapQ7hElZUUsLAAKSy+6UVSvZ9i7Muh2MSExdrh6f9QOnkFD18tIQH
         61E44JRWTFOtb0dCot+PPkNWsis6u1wfonYEJmggUf+sdBn45jGJJKT7rYYnqL1EfsXv
         RHnYmYkDY+Z7r4kXTw004cRZPdsDaBJ6EKyTWyyhm52RBz3bScyCi0kWzdaDetMd5rc9
         TDMx7Y+sHvn256lLrFOBhLuReKTxNg51HAFqHZkq3GYzSJCX0DIT8r58AF2V2b9UXC1i
         JwfQzXxV9cpQn7y5Fd/ybPXmRT4YxM6SMdDor5u0yy0DgH8sXaoPvK8kTp1ItAa+bRT0
         66pA==
X-Gm-Message-State: AOJu0YzO6RG/cqO07LoK59q8kfwMSJ5Aggc80OYJCDHbZIieqWOvcbM9
	k+8fgLKzbl9sCFif2ilFrdmn+vGBlOjhQuXPaQqKYzUAmPjJyOj5s+D0LvYjwGa4rc0k5NM9K/5
	I
X-Google-Smtp-Source: AGHT+IHwdCicWXiY6iV5kAgTG75yeark6UiQTDpCEM6c6xWtzjNasB4Eyd/7dYAoqdbB0EzxqeimEA==
X-Received: by 2002:a05:6a00:10c3:b0:6e6:b129:1842 with SMTP id d3-20020a056a0010c300b006e6b1291842mr2219507pfu.28.1710333041589;
        Wed, 13 Mar 2024 05:30:41 -0700 (PDT)
Received: from sumit-X1.. ([223.178.211.36])
        by smtp.gmail.com with ESMTPSA id z17-20020aa79911000000b006e6150a5392sm7797307pff.155.2024.03.13.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 05:30:41 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
Date: Wed, 13 Mar 2024 18:00:15 +0530
Message-Id: <20240313123017.362570-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313123017.362570-1-sumit.garg@linaro.org>
References: <20240313123017.362570-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Schneider Electric (https://www.se.com/).

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db4..4ef38573e411 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1211,6 +1211,8 @@ patternProperties:
     description: Smart Battery System
   "^schindler,.*":
     description: Schindler
+  "^schneider,.*":
+    description: Schneider Electric
   "^seagate,.*":
     description: Seagate Technology PLC
   "^seeed,.*":
-- 
2.34.1


