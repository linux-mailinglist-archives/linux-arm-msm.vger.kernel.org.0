Return-Path: <linux-arm-msm+bounces-12483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD33B862CD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD5C283211
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D9A1B295;
	Sun, 25 Feb 2024 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEdfdOa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FFEADD
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892751; cv=none; b=g0c18875WKqLyDkF15w8fP8hT9Cx5ryC61Spm+P5Rm9I4T5bRTYAiEeCL2Z9//XgzsoNrXNKWF5+UDBvhikg00AbKrdzHkFLjwHoR6LNffqG/lz8YPfIvMlAHoER0k0gYx0Wbqjbh4dDHtXHjHaSiVS/YqI667pOWISij5nRv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892751; c=relaxed/simple;
	bh=mff2Bx4f88etHoqdVo+jEmdrbqPgNQ/kWaOd8DhYTIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qyb731c0mYRZNk7cXcP4fHlWYeZp6UrKwN3WiZgF6SmA128mrB25GcK8Q/gfCcmjKc3ltB4Ax/kel3TDmfJ3ZNA6XSQi5NANWSDrtH6eGbYSEIcHq12FBTUrs/KTAsa+nsK7QGj1MDLmYWEIAF1Bd34PlPeceB96AxcBDmWhgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEdfdOa4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5654f700705so3199288a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708892748; x=1709497548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2R/XFG9oaY6y18sf9Tff4jPtjEwP6MJBf+0W5rEV324=;
        b=FEdfdOa42388OHWHA+D8OtVM+zbelK8SXIUPZ6xTtm9gElBK/yTcyOdveLJCvI1Kiy
         NB+oJ6IGhNyPv8uVd5fuSnZI4GIapC5G93ocuVQuOzgotaK0hAPbTjPlHhEGoyIgRagL
         r1bB7UQanZ4AnBNqWy4F1fVHRR8iQEl/H1uN7m9vukRLhDYi99XWo7z3mZkzQJSvgR8g
         IVMR+nvaaMnuKdtAM2bZBjbwgn8z3/x6ZByNSdBoOgA9Q1nEIFWgGSt7K/S6h2Rf/iq0
         DJIKHiM6y5t9BCBY+BYGOzZFwhn6HmSIoJ36WULHuwpKKLmfKQ8PTioAZdPzQXVYhR3v
         /ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892748; x=1709497548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R/XFG9oaY6y18sf9Tff4jPtjEwP6MJBf+0W5rEV324=;
        b=gqPgALnuVSRmZznEiF9C0xzSQU5b+YjX1iuR0Vpc98UmU2+iPl+TMzbaBhvsaLLXa6
         7YPuR8NwqZQ468KRq/DbXnJNXHiuk92W9i6sx9ks2SBS4rvrGznAajbocQ00IYK34eYA
         FrH4bDlP0hPKjaSTYjh7UKlRTPUmIwPTEAm0jMwgE6LVc2wF62CeLzDvYUl50KSlDl0H
         9a2sbyK6ot+TmBkORi8/3X7rsizdkhRR1sIjDmKcKT+FGkOZn+lt6VsngVkYKsK9KjYY
         afbSIGH2EfbvTvUEoE89ImKTlUgNOdjrFBWrHy3f1tREcq8XrAVp1RII4SelxwfwCDGc
         0DVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrpk+D38Cz1qgKxBDogUZBBkywrw2EUPVPVJrApz07ZbFTEV8pzQw3YMYG2OiCufuROhKvzauUEFswr4SX2sIcWmt2X1doIEd73HcmVQ==
X-Gm-Message-State: AOJu0YwAAlQIKib01wPJ4zRGRaj6Bj3y4JP8B7jn+6DBumIerdTNogah
	aLSSBJg1EXkc3fUjNXYJo/r+P3eQH7dtgtvoQ5E0FfdxtCiVzPqEcKGUvA4yw2E=
X-Google-Smtp-Source: AGHT+IGJLb0LFIjQmJVb1XHJRopVy/BJfdLpJRuaWdrDVNDspvP1AdwQpIQuP1OWlnVfy6L/oZZsTQ==
X-Received: by 2002:a17:906:140c:b0:a3e:dcd2:2746 with SMTP id p12-20020a170906140c00b00a3edcd22746mr3685269ejc.3.1708892748480;
        Sun, 25 Feb 2024 12:25:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id a26-20020a170906685a00b00a3f0dbdf106sm1741491ejs.105.2024.02.25.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:25:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] soc: qcom: geni-se: drop unused kerneldoc struct geni_wrapper param
Date: Sun, 25 Feb 2024 21:25:44 +0100
Message-Id: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop description of non-existing 'struct geni_wrapper' member:

  qcom-geni-se.c:99: warning: Excess struct member 'to_core' description in 'geni_wrapper'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index bdcf44b85b2f..2e8f24d5da80 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -89,7 +89,6 @@
  * @base:		Base address of this instance of QUP wrapper core
  * @clks:		Handle to the primary & optional secondary AHB clocks
  * @num_clks:		Count of clocks
- * @to_core:		Core ICC path
  */
 struct geni_wrapper {
 	struct device *dev;
-- 
2.34.1


