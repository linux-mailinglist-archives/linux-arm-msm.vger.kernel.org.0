Return-Path: <linux-arm-msm+bounces-71589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B4DB4005A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3320545465
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C481A2FE585;
	Tue,  2 Sep 2025 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WeojKAVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A42FDC43
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815495; cv=none; b=oAcTiuGEc1Mef1+WhMQpMaPX3kwaBezoKWfD8kdDccNeJEnkWdEO/J0g4YsZNt4OLGToYeFEY4VKbh/CZuPMxwcrXIj47R/7ei7tsRAEjka9akjX+yyCxmNu/v60LPPaeNaqkXtlAcKk9pPu6/CqO6zPSe15y/ubkG5AlPHAKJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815495; c=relaxed/simple;
	bh=iV9OOBcP8NNsmpN1fZ74F397+PanErPMHV3l66Lj7mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOPiQdFdIqk6zMnGhwhupzuDeVMvs7KKELpgp2oo5G9wOYrZFzFHGmrSJVkpC3t+l7PjgMS6OFYsuKbK7acxCNgmnFiq8rA7GJM39Qt6nmT1F1fMTZ0Xs717T4C1WuuGW8NtMpoY6OpeMf1wLjOOnjeNBGaXs58ZIe2DulzCkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WeojKAVH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756815493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
	b=WeojKAVHIdm8NqwQKLrqs3jIsskkZkMiH/S67moFesmIN7aqU8m9ZyXcxbuI1KW67IJe4U
	L+yfR4NDKammGhgrUaYZTmqFi8BmQU6/7WiexzfOK/AoDzu/dcArr5XhZJXEX42EH8XGd5
	951sX5hpowPr9M1KJ4Cjw7qWU5fkljs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-xH0VcNAFOCuWLFQN2Lgnbg-1; Tue, 02 Sep 2025 08:18:09 -0400
X-MC-Unique: xH0VcNAFOCuWLFQN2Lgnbg-1
X-Mimecast-MFC-AGG-ID: xH0VcNAFOCuWLFQN2Lgnbg_1756815489
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b90b094adso9958895e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815489; x=1757420289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
        b=qt+YQtgAqCgtX37qE0Ctfp+F0HyqaFXbLh/2IA0aOx0LG6oZza14NBu9MZUAROanfy
         SBh+RYBeQJonZOBA4KzAQWgNT2jWWaqbFR/6Z/Y/jzQI51khUGI7ub5IjCCtbW4xvZoK
         9VzUw7wSJssg949FpkZqO6FBHKpsXSSxJeS93VslzaJCOGiZ9RuOr7iY+lU1ZCXVRPMk
         7xcAbtZkbu3FEpL367omQBKfgrhqyfJLodlR7VRPK/YxS6HhGj/07pu9eGWkIkzy1oyZ
         EO+YU8QNfzfvrWDs5MixujDCg+sEHdec35grZ798kj5HdDoDJvM6DoQvuXo/QsbQoT8k
         u1wA==
X-Forwarded-Encrypted: i=1; AJvYcCUzcy+vW1/rsoQnrsLD8AnAdR0bqhCkn4QAD1DYIUgDncPrIqVdCVKO2aaIFGy8/61sTx88fhkh3IgSP8PA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5O7GQ4eZ38RTtjeEV3EyytKANYzhlO5iIFAzLuNKcJVEQksB
	v44YsLnfDFt24TjRJalwTnbvWBRhnIGb3m+YskABZGGhwCm0hZJqV+1dXYP2J3vyQt3Ong66cyr
	fOdgeJmG54p/cyAsnWQdcsFB+8BsJd+b70vaXOvXB2fzM75V2oUgZiDs3cen6aS/ort8=
X-Gm-Gg: ASbGncsJ/5EUf6BRA8aXJOsHkrWvMff87EnRuuECSyCOjGc1a9jV1WWdnNsViO/EjSe
	i2kw9fGXc3fgcj57SwC7eGPetFE24qQhaf5gA6xtu1VkluABrvn5YUYU6pBRI+611r8+G/S1M4X
	pMLzAL/IuiELJNl224LSvdcI0Ht7D0JNWAeCLAIn3DVHs2rDhFzYeg6cF7PAn1Vr1tr606+HEJJ
	QmimoR+wzDsVSSCtZ0wdSsM9FBuvlGaV8d/MpjzlQR9IkGuHsnDaCI/6mpNzl0rVpwkMQjIY46q
	uciDtn9TXMSQmOgZr9Mrl3/cuRmCPtj5Rj+2Uyq2BdYn6zSpmEDQAw+ipm3FJ56IMWTsKvOQhLy
	75Taeelz8hKwi
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31212065e9.23.1756815488663;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjWniM8t87MstmOKseixN3K4oxvQKmIMmSp/10Fw9hcxqnkqnioeD1dS7AiZVevFngzZ7ccg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31211795e9.23.1756815488249;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7fec07sm191441215e9.10.2025.09.02.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:18:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Date: Tue,  2 Sep 2025 14:17:54 +0200
Message-ID: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
controller driver") adds the config QCS_DISPCC_615, which selects the
non-existing config QCM_GCC_615. Probably, this is just a three-letter
abbreviation mix-up here, though. There is a config named QCS_GCC_615,
and the related config QCS_CAMCC_615 selects that config.

Fix the typo and use the intended config name in the select command.

Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c90..823125f48346 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -504,7 +504,7 @@ config QCM_DISPCC_2290
 
 config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
-	select QCM_GCC_615
+	select QCS_GCC_615
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
-- 
2.51.0


