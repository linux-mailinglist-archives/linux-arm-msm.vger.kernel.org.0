Return-Path: <linux-arm-msm+bounces-19753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5AB8C347C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96AB1F215DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6B11862F;
	Sat, 11 May 2024 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5l1mY+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8FDDD9
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715466770; cv=none; b=Yxml4UP1j6ZKM0TDsbjGXW0iIUVINpLzdTtsXTKZ2q1cJk25N7pn9u54OtIotDOyMvX9vChWLM6NzS36fC3zRgNsGJ9HPkQBwgvTxSyw/4NBKTvNGmco5Dh0JBrp7iikjqjtOhjdxXuuuTDnzU9cEmCJzKZs/I3ufEt7n4RyNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715466770; c=relaxed/simple;
	bh=9+jNicSIoeudc+F3EPpKSthDjra2W3jAMeqKdhOWTK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LdvaLnKmhwQL/rqq0InlypiKSwHDjjawIpi4hzImSEsPtM+l5HUdXA3UE50Q02WYZC5MnS+FbCJVBNnOs9R8VfzYzAyj+V9sMG16cWQzhrbY4qUfEnL9JCvQ5+Yq7rSX5OPaMyfmCj0TxFG3Qngo6d9Yucnk3dnbjk8z0OIPUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5l1mY+B; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e576057c06so7287091fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715466767; x=1716071567; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayQkPZ/+Ja6xRaXyLxW87mdfZ/SJLfKA5C9uQsxLStw=;
        b=L5l1mY+BI+Zk0KHL782h7eHBQnL8sPUQkdEdnDBTg5DqnHPBGzHaTWsmtY6/inYV+o
         t82nKKBGcpabosBtvAjAzx6cC17o3DBIHuCeV4YNdNx2fnqz5m79amzD8KWZOVhSJpaL
         BHl/7Z0bbvZ77GXEcz/MICgHKerz41cpDf8wyNzzBOiNJHIyOqLN2Zz/NLcoQflkPBRR
         8hWYHJlWmFpmNcbhwazBAu0pvfseoUHQtUonZdpXPMMRFVuu7JNHbyN0EGgpiSX15MWp
         Vtwq5hpZX8PocaQJQV+/VCPSAgokavx8pGc/AuMPV2XmZ5PX0tdI1KnymuZOuHjMpt3V
         HpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715466767; x=1716071567;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayQkPZ/+Ja6xRaXyLxW87mdfZ/SJLfKA5C9uQsxLStw=;
        b=UB1UJn7qI3a0QGkjAq6Aj9ANmsjsKKJNpcQ/uprUPEPvlOQtms8jaWIDjsaan3efXR
         RJVljeN+PUcuTGJzcH3MqAzu3Ny8xFF+sYgqF0nNxir1KfPZUaoMIzRERvIU2W+Q3Ibh
         xnXG9uvN7J7OAlkE+6Vkxw/jOE9BJ0cuVsVDlMC22rUzAlctdtwBs4qnd2t9K2eperSl
         JreTYaPcpw+3p1x5iRDhOLlBr7mE+TM5U+xXkIZJcKhs7KbxMZejSnHDGZkUhx05monV
         NYuup7iG6LNYhQlubTYe3cyidugTaTxu+UhqA/dR8LJBFjdDgqAzD4kj12S2Qvpj1U4H
         fzgw==
X-Forwarded-Encrypted: i=1; AJvYcCUOeBF3dhh5Fn2BPM2cjT7wvzhqrnqUV8jJGh3FTXkRubzq70MYcqoftrtrCmfONpqLGfmkh6HmCU2fGq90xiFgsmqUayrsHkxAQvF+2g==
X-Gm-Message-State: AOJu0Yy4e33l37mp5Lv0BouwHDEpaz3pLFhrbA+1pu3KePYj5yoMDgiv
	W12CrUJg8lLIQZ50IYXLyI8T1Vmj7iKVJPFH0jU28LBL8qjxFjx78xdQUfHRpCg=
X-Google-Smtp-Source: AGHT+IHIZPF1F7rpdmiB8zVjvs9j63L4ySis6WkHrE1pCnC9pnyXQKMMTw9kUd9VUQgA/K9/tkLJUQ==
X-Received: by 2002:a05:6512:785:b0:51e:11d5:bca3 with SMTP id 2adb3069b0e04-5221006e61amr3469492e87.18.1715466766866;
        Sat, 11 May 2024 15:32:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba81fsm1127956e87.100.2024.05.11.15.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:32:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:32:45 +0300
Subject: [PATCH v2] docs: document python version used for compilation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAzyP2YC/3WMQQ7CIBBFr9LMWgygqHXlPUwX0wLtJAaaoSE2D
 XeXdu/y/fz3NkiOySV4Nhuwy5Qohgr61MAwYRidIFsZtNRXaWQr5nWZYhDZ8X4V+OhvA2qljfd
 QpZmdp+8RfHeVJ0pL5PXoZ7Wvf1NZCSXwbi1esDW98a8PBeR4jjxCV0r5AfO3uyWtAAAA
To: Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9+jNicSIoeudc+F3EPpKSthDjra2W3jAMeqKdhOWTK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/IN6moNPSkS5RdVGvLI1pvK47IdjjvwevOEi
 H2N8KH5JNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/yDQAKCRCLPIo+Aiko
 1b7/B/90NPkOoZ8qSWRYxnXABQCgT9LTVkXhfbbO7/Pc+dOo3/3TONJGInxKeUn490eaRHwHeuz
 9vE/piFYctiN3nBqMCPgU1wdwSXkpXG7aO9uzxVYZFda4T5iH2sg9LNMPG9vd66Y4MPRE5UShNJ
 jIpW2um9X15VUVS0GLR7oExe3jVHOeBe/vsDVyejvXnNd3Y5oHdKUkjX9DqJzfDulLMqZU1Lm5A
 Kf5du4NmIlp3XZvESVP9Xu0jkrLiVubjYMnd1ZmlmcuriIwkRqRtGpkSMcvPn/76OfkfYf6gqV1
 cCpzDfuZXB8BAxj27gFWTe6ZxmgVGDu7p0QYa2hoioSCMCOB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The drm/msm driver had adopted using Python3 script to generate register
header files instead of shipping pre-generated header files. Document
the minimal Python version supported by the script. Per request by Jon
Hunter, the script is required to be compatible with Python 3.5.

Python is documented as an optional dependency, as it is required only
in a limited set of kernel configurations (following the example of
other optional dependencies).

Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Depends: https://lore.kernel.org/dri-devel/20240507230440.3384949-1-quic_abhinavk@quicinc.com/
---
Changes in v2:
- Expanded documentation for the Python usage.
- Link to v1: https://lore.kernel.org/r/20240509-python-version-v1-1-a7dda3a95b5f@linaro.org
---
 Documentation/process/changes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..30f17e3f954f 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+Python (optional)      3.5.x            python3 --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -198,6 +199,13 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+Python
+------
+
+Python is required to generate register headers for the drm/msm driver or to
+build the linker script if the kernel is built using Clang compiler if LTO
+(Link Time Optimisation) is enabled.
+
 System utilities
 ****************
 

---
base-commit: e8bd80985f8ed4c04e36209228163fcf06496763
change-id: 20240509-python-version-a8b6ca2125ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


