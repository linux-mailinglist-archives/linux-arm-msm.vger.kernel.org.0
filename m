Return-Path: <linux-arm-msm+bounces-19589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60D8C1063
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 15:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0BD11F244CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7062615279B;
	Thu,  9 May 2024 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyuA16OA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93FD14A62A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261471; cv=none; b=mwLXHOvbmeRS822ialvkQhPizIGT4wDxV9FGrw7FO/4V7SQ/MXqqoy+meLI3sGsPvxxnPDU97SzlZjV9roFZ9ZH6zuSfXaTiN0/KUXMeiLhWrrbhut5lXGCHvhkee24VojEX6v2/QAdpq0P3JWys8oHtZEzPVvvJ0ctqbjV3A94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261471; c=relaxed/simple;
	bh=m2zEtruGkvxujMPhBXY7kQd55f5ocV/KfUBbo1KLpSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VErwSqKISlMk+x1YbhWlcJaeLiJeoCfYEw48fdHM8dU3t/NjWYQ2f8uvXS10rDKHctp5XelZ3305+LpkBnLKZ7W/RetT1Rh8bEK8h3Kth0bz8zSm0t73nS1bG5nuOyOd0INn2GuFv+rFBVjKzg0Aw1oFDJkMmBQ/p9q4m0sSXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyuA16OA; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so10368991fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715261468; x=1715866268; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
        b=wyuA16OA9c4xcLj4ac+mA4NrgzqlNMOp5rg3RcOaGKIt4PleViZOPZhJ5WxD7wf9+U
         PIM+GMjQFO4J1e6eBysEDnZNOhTtCVTrZ3u/DLun0KpF0IlRyml9hy1B1OzqjGt2K+yJ
         ZkUvCRNU8lzzhIgfxPcRyTsaIbtY3IojAUM2TOT8RNu6bXdENU8XCusWewPF/ALOR7ku
         9BKeYq0/kfTxH0ehZL+bpYmO5dmWWvXaOmmW4wFqn4TVuUZQQo2Sio7ZQ6dxkceyk9xB
         wDWUhqKZ2igA1PdfUFlkpw47jCO84RIw6T6jbeIL77yoZ4DO34Wj6nJIUH5Vft6iBdM7
         x9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715261468; x=1715866268;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
        b=LPsElSlZJ/WOczrDUIneaeAGQ1N98YBKfuzZS0J4+ni7YqC5zMZ/xPQ95B+Vx1y9mF
         lFCm2TpTa+r0QtHPONb3xEybTsHXV543din3xMeL9FvGu42AXV11Znq2N8/TOsnYpaFj
         DQQSGygmqkkRXKv3kYXyW1OUhZCaxHz6/X85N4KcOWuK792kfwjS6S6gxZYMC4LbT22I
         vy7dJA7gmo9IiktBVm4/NPOO7OhroaC2dZx4ZTIkJaMMJhmvnQKIyiJsXlvnF5iVEFVE
         hVURG0SBG0B73DTzh8OfWtV8aNVjckBtEKXpDKpsdW9s56l3MkjwRyM+rF8GNWTEWIBH
         XJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXpvv2T+Lp9wRFnH54thRtHTwhtG06I3KitwZkHZdf2Bu3E7c2ScZWaKbRWimTGIEGPy41lsboqRJhfau50byR4QVq0gcr4gLoewkfiQw==
X-Gm-Message-State: AOJu0YxFLKsFhjtYZHZQBU8uwaIYNINu6WphOJN3FTcksYsxl6FHhdca
	+shn1Sx0j4OZ0yLjqheoiEQxlYF5SmLG/+pWPAfgrem7aDdCCEQ6ksDypp7v5B3EOwVItTnuLTp
	G
X-Google-Smtp-Source: AGHT+IGIi4Tl8j+UerHfiw+tKEBIcpBqxthj+u4dQ+d8NON2NF/1TsiNDVaH03l0MKLov5/iuRPKUw==
X-Received: by 2002:a05:6512:b23:b0:51c:f21c:518f with SMTP id 2adb3069b0e04-5217c27c36dmr4667766e87.12.1715261467693;
        Thu, 09 May 2024 06:31:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d367fsm294566e87.297.2024.05.09.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 06:31:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 May 2024 16:31:05 +0300
Subject: [PATCH] docs: document python version used for compilation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIABjQPGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3YLKkoz8PN2y1CKQUt1EiySz5EQjQyPTtDQloKaCotS0zAqwgdG
 xtbUAHGnRaWAAAAA=
To: Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m2zEtruGkvxujMPhBXY7kQd55f5ocV/KfUBbo1KLpSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPNAa5VIUfz7hTsz50vCSYcPRyiOjpAP0rwDte
 rlsD/kOqriJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjzQGgAKCRCLPIo+Aiko
 1SxAB/oC205Rgfupf6dxpqFBFVJhaoZiJlIjwQWT+zfYMi92ykQccxZj7Qy3bVawLRrUo23vC8Q
 BLhTPBNplGA9OkEp/5goS084ThepWCY6xdBBLSha6PEEPPTtIQi5Q5jC6Tb+KMQ7TduZbwmH8nq
 ogkKYKqzSDEADEybi/tJc+/6gP7vuI97Mv+OyXK0gNThg9AJcnW5K1aZ/v1u1qNWIVw8hyEStpd
 g/10UDekOGJQsO6vpyIcptXKcopqIaxCPqgo20WeD1RbFo9RwVKQGwWzC0nAVhobYfOBCDeTT3X
 kN8f9G9VEohrzHtr+a0GvxzZlSMBOFbMhZTEhxOP8H2Z+bug
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The drm/msm driver had adopted using Python3 script to generate register
header files instead of shipping pre-generated header files. Document
the minimal Python version supported by the script.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/process/changes.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..8d225a9f65a2 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+Python (optional)      3.5.x            python3 --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-python-version-a8b6ca2125ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


