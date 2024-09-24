Return-Path: <linux-arm-msm+bounces-32254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878A98431A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CD20B29872
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E691741E8;
	Tue, 24 Sep 2024 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7wkpAFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983F1714B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172381; cv=none; b=gc+CR4RLAVSAC0qU0OXxmXYRAvbdPI9ZBVUERAplmDeN9rSL4WMWMTj2+bNJU5hSOi+Ksaaq92fdxaVbdIxLecsq38iLx8GoZWmCW1+dJX+r2HQ0lYEcr8ULdoAW8ZhFq5uf7McsZvb54Qbw8RcqAMPsbli/TrsNUM3zQbCQ/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172381; c=relaxed/simple;
	bh=gdDJXDF3RX4663bTC6CNrk1RyCKo+jHfmt2PnrqCc1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7eCYYgBnfo12kaf6DBPS0DHyWTs5qo7Kjcoyc/hpmsEB5gtbT2lZzaS8GV80yEhdS4Wvq3MgSIQaWyfsLR5ZEYoJHcyppNh/OUul13jVqVk9kv5nsSDqhMcKFqEIUBW6ep+qHMbSgvVpi13ByQRqfC9WgP9ceEMteWoW9aWu1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7wkpAFp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53652c3bffdso778024e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172378; x=1727777178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwBZ18FUpMWvyAsP5C34z5YvZRY6xHPoR1g/OtqlmO4=;
        b=O7wkpAFpB0Qu8jSe0U/tO7w7foUBGYP0RPmXl+X5ukEi1KtawLZx5T8gkqV/gxw7+y
         eldl4aIACtOOSL+/bCMZ7irdjrJcKxo9e/ydqPRgq/TTe5pU5hO/2y6PJFhXxY8Yfp2A
         8NlWCVbxVm6juT6JbjqdA//JIfF7HMYljySUfQ1tXu+bcc6/zhBQCM+I3Yy0IxtZdaSx
         dfJs3OWWuaYBj+Lh8l0WXcWY8TBu1I62EmvuLjPdeyEI+AmesVxqDGiXWpuT0x5f43MS
         bQ6WZb1Peo8typBXUrAnnmrTcRcQV1WChMjVbpsLhCXNHoKIBqMg+8JHnFa454Iq0e+q
         GhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172378; x=1727777178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwBZ18FUpMWvyAsP5C34z5YvZRY6xHPoR1g/OtqlmO4=;
        b=KqBN9cj7WyH6KRVSPmQUUlDnkIaYurr9V0GkVE87J4R8uR7g6xwC9Jml6Z9UVLU+5F
         wjD0als0BIY2JkZCdEohTkJZfKRMj1pBAf/BwLIPKQmJDP3zIEWLLu3Qd+tHjdCJ+NJZ
         tkRaDNbLyvvLu/unqjcmHRPux16rMY87eYIQUJRynspIrnT+KIINe9YbXXbTC393opsk
         jP0OXK7euSG8oV7yVdQrxD483xQwTjkBLk0tyceqP2OLNjBCPLXXmHyJz9z7urk3aQM6
         9YU5sF1ZFD/j12ey6XXIWsuInrGT2l+jjXEbID2upR7PA1ZLZfFvxIvH4X3bzjCt5JAW
         jgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzPq+I+F1vNs0QcdGj8O/ayFhf93ErQi1ekntNUXjDnhctFe1RScPWX26f/UrPs44paiTK6kChSNYb9mAW@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLeVMEgX3DGRMUSM+gcgS+PuRgD/lh1U9r82f2LDVK1Eg/JDF
	83I7zdKA4PNFdCFCLLVjs86BFZ63FdGhqqluH7c5MsrIv0pCJTU62xnworkfjsqswFKSwPSg6BX
	Alps=
X-Google-Smtp-Source: AGHT+IHmA2EQHjJSVUUo9U/qnPHOzb87oEZd01RizQ77NB4AiVV1GM+ipefqXb35iCBO+Y6CbiSGWw==
X-Received: by 2002:a05:6512:131d:b0:52f:cfba:403c with SMTP id 2adb3069b0e04-537a77d5240mr348919e87.3.1727172377806;
        Tue, 24 Sep 2024 03:06:17 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: qcom: sm8450-sony-xperia-nagara: disable dispcc on derived boards
Date: Tue, 24 Sep 2024 13:05:56 +0300
Message-ID: <20240924100602.3813725-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A platform display clock controller is expected to be enabled by default
for all boards, however in particular cases preset display clock setting
is expected. To avoid any probable regression before enabling display
clock controller for all SM8450 platforms disable it for SM8450 powered
Sony Xperia phones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 17dbb67868ae..cc1335a07a35 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -468,6 +468,10 @@ pmr735a_l7: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "disabled";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
-- 
2.45.2


