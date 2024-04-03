Return-Path: <linux-arm-msm+bounces-16180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6B8962CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09FDD1F22FED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BAB1BC59;
	Wed,  3 Apr 2024 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/GZ/pt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0F1C291
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113863; cv=none; b=noQNaiYCbJFSR6wmSB+47BXPqkNh+dViUCjr6zmu2sP1QyTqcKk3g+n2kXqlbB3LdnxTk4qmyti9JSuqWrDvCL4TNIHsgLCSCcgKrUBjVgx0FKR2Q2Ha1GvIMJ2TBj1+Q3Ou4uJ8444fRVNCTjG+BRXMXpmGGw/UxwWrKEHKoXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113863; c=relaxed/simple;
	bh=B8t4qVZmvpme0Ftl7SI7bjcKM3BJFSFh2WmwITyhtfs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=snzppOc1Qh5AqJIN3/fwsfVROr+NFI8cF9bBaFWS+W8fXuWROpBOGM7Afy2iPFaZ4lLZkNYgDJjujiNarJei8BlDD/OIYkPaEhwpVpKFJDbfYBJhjhc2A6bcPWqQCdSBLgCeCuskUhcelFF+caBoPfVcE4OiOiCAwGqux0vJhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/GZ/pt5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so5170981fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712113859; x=1712718659; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZQ1vIf0Hmf8BITET6wX6x7fIOZO66zBXcizatFcKVg=;
        b=L/GZ/pt5wzsg7475UFH6FeMYO3qS0qpF1IjiPDVwG+nyo5k86RiIaBKgv4TZnY+Eqj
         FMWkepTaypuOv2Q62NCn+TcAbgE0ldwKEpnZgZESU2wNgHxnlImjnRbT0wG6K4QF0Foi
         f18JOvRWy2jKSWMEcMrJfj2ATuSFb6UoNvwlI742eD7Z9QrGmLO6IVOvZegv3pZQ6Ayb
         9AxFZsrKOyu6wk9C/lBFUvm9utRh2QeAGwfIlAqSWhyInMZsrUBIABbtCH3bqnX64fl8
         MDp5XbxXTkqO+5dkJ0sRQvOLHlfmAgkimeqqexsfzt1V/lat9tIx9Y1Zvb7djiCuxO3e
         BBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113859; x=1712718659;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZQ1vIf0Hmf8BITET6wX6x7fIOZO66zBXcizatFcKVg=;
        b=JyZvX6r1aLJ6gALaYPnK+VeUKzVgtG30+JggX6GBaqoJlr1pIJNbLsEYNS0cwdc6du
         41XFhpXwdfP+AG+dDmXJNOaMoLN5Gg9E08cnAoIYcUNnqXm/Tjg3+CuUyuk/x2l2vnsk
         b4AdsuG9cKGMy7jaQ1YJCHMHZr+AvUA2Gk7O7Rlit9zy2o5VmtI7FNf84E4Q4cQVfRHF
         bVMTCov41EgZXHXsFYigWOOukOiVodvAkV8oEsMKIFLjkNNdKG1bNOtqTsLC6u+1rB8I
         nSxRaiP5b1QV33Pr6TWT9DF1y2OiQpHmeVbNNpwy3ZDnUis/pDKqCXzguGUMpd/H/i70
         cxtg==
X-Gm-Message-State: AOJu0Yy1iR3wH4637v5qmQWvZe3a5MQMHjtsUvZkkZrp4ivqiEU+k0s7
	ye+O+mt1a36GueC3cbCI27aSy2Qjb+Wtf0HZSZN/trffL1YBm1uzAcR9wCtzq+o=
X-Google-Smtp-Source: AGHT+IERjVGrb/UJnBYzd7Be5In1uPbGUTOm6VihsfVj0KPcZxpY6cm2TZ04RuOrCeH8c96Z1oK3Xw==
X-Received: by 2002:a2e:bba4:0:b0:2d8:2730:fc3d with SMTP id y36-20020a2ebba4000000b002d82730fc3dmr373851lje.3.1712113859301;
        Tue, 02 Apr 2024 20:10:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k11-20020a2ea26b000000b002d808b86073sm1056970ljm.78.2024.04.02.20.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:10:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] soc: qcom: pmic_glink: fix client handling
Date: Wed, 03 Apr 2024 06:10:56 +0300
Message-Id: <20240403-pmic-glink-fix-clients-v2-0-aed4e02baacc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDIDGYC/4WNSw6CMBCGr0Jm7Zi2ttq44h6GBZQBJmJLWkI0p
 He3cgGX3//cIVFkSnCvdoi0ceLgC6hTBW5q/UjIfWFQQmmhhcLlxQ7Hmf0TB36jm5n8mtD0g+j
 a7kL2JqGUl0jFPoYfTeGJ0xri5/jZ5E/9O7lJFGit0Vp0VrqrqUukjeEc4ghNzvkLZePM0r0AA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=B8t4qVZmvpme0Ftl7SI7bjcKM3BJFSFh2WmwITyhtfs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDMjCYhxs4QU9OVC2gT182IOc1+D25wh1HRuxq
 Xpkq/+ZJH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzIwgAKCRCLPIo+Aiko
 1Z0nB/47D6PmP3fS7Kc/FRpngszySAiiNz2joy4ij5nRatL5pEnCDPwKaz+V+d60V/XBvdmeWIA
 3LfMfLc5U2Z35XYwJv0hfQ0tG54hHQ6V+G4SU+kmU5ugJTLQU7mKjcGCqc6/3MaClnDVNUrkro+
 FC809blYChf5iITvi4H2SoacbGsl69wWcVRV/1IgkE8oFtM4B1fxOBdsRPzitOpeA3aak2KdCm5
 cRHEuWN6cMdCwvByG5OGV6M+Uqj8xUfc9CyhQ4hDxowYrw4qLTkAlTuM3O+ux2eY5yH2LVvRGGR
 FklhnhazMwIT06CxTWb0iqkWvil87G7spqrMCncWs4LP6Crt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix two issues with the way the pmic_glink driver handles its clients.
First issue is mostly theoretical, while the second issue can easily be
reproduced if the drivers are built as modules.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Also take a lock at pmic_glink_rpmsg_callback() (Andrew Halaney)
- Link to v1: https://lore.kernel.org/r/20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org

---
Dmitry Baryshkov (2):
      soc: qcom: pmic_glink: don't traverse clients list without a lock
      soc: qcom: pmic_glink: notify clients about the current state

 drivers/soc/qcom/pmic_glink.c | 9 +++++++++
 1 file changed, 9 insertions(+)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240402-pmic-glink-fix-clients-5df0bab3e871

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


