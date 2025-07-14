Return-Path: <linux-arm-msm+bounces-64840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA42B04360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 249BC18867C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0081A25D527;
	Mon, 14 Jul 2025 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0G2je50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D823BF9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506181; cv=none; b=lvenaDhD59eLrExNqO3+T5m6JNDLwZ0Y+o+wAmi/M2AV29suKMVa+u0GLKK5QharaRGjLbSXNKqC30+0k9IgSyOVE40rgsMVH5cU2X+jjCFi8zDAOpxsaEbPqFg67DuwvRwSBdUy+rWA121/WNE0QiYHxQDna6FSNv7Ik3MSfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506181; c=relaxed/simple;
	bh=5SEmN81j++cDBIFvkv9n2aotAYscERc+zZaDKLuEifk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBCcbrrRG6VETL8R3DWvNA6K4dTJf6SSq17mgksRkIPl3TA0e/8c1Wpz2VEb9j8/JDozXbwlXeCIliG47d9PkAtzlEXuXPv87fwsnOco1R6Qux9lVytpHrmuWkuHMzWOQcDeHlofxGPlVfSJB0QO/FzRkHpKlMzZktYKyo89XKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0G2je50; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b60565d5f4so65738f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752506178; x=1753110978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7sCtPxfaMjoFSfs4MFDmQ8NiKqG4DUPOXp+rPZHPqE=;
        b=p0G2je50+cYBQD0Pkj3Omw7zDOKtrMxY+oUSCdma8ej/fpywNMvN34RvQlbwJcRpy5
         REXJS4MM9pSRRHMKQowQcDjJexhYvMB2qq2b7U5uRZJzQXg8H7Ih02D+OEPjEYINbuD3
         gwlUKLyOEWZkl2n38RbZw7cxjs/RmY5rwys8cdMfziBI9In/kju5YFSrG0CrR4CdoWw1
         78QLLQ1fL0J4IS0GevGBxBqLxFXMC2dAwn0NDSqL6F8RXC6wOc8UlTVxX7GNPko6TJ8J
         5uK0CEP3up5CuYuXYJEmOaHwpYw73BJlT61g9/+aXpIztgeMFlk3eJ5nkp2HPKTo3GdT
         q0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506178; x=1753110978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7sCtPxfaMjoFSfs4MFDmQ8NiKqG4DUPOXp+rPZHPqE=;
        b=W60apsmOv9v/5W4QcCieB9HK4/NmQ+zFCXXd69jYr6TzZ+bhtCOmPjR/snaTk9bETK
         vtfpycr24WsPHuGA2CDYKidX7nojWT8V7NbCt6lE2GelkCDafm7KLZzCG6rqqe2srIMw
         4dqgRdTVYKo9noTjwEmrLU4OSUua3aUD0tCgUmx4Vrx2fsYeTSdaXa3TAouazBUU97L3
         VFqAmnlc1H0bwXLea75Jlotbd7ysR0oKwP6VRtDQFBzIpUfp2/BazUd3zOF8DglbZ65w
         hrqOFws9ocA228f8tTQIPSI2VVfMPqQf9v2lhPqtaxeQ4WgINo/vwZIUSkBDti3Nt0iM
         BE0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjKtW3AWjqs4zRS6GCecnWB4LvC4CPzia+VyDuj1inR2E1I3rSvPY8Kf4O/p8c6nlSxUQAug6vMYPdUVPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YypZo7BKsCy+1YtJMfI2lPssFP4vxBYs84uImWjtCyyNrjMrTd/
	QGFubBdEuVdJo+ZdOkJf3mXU+kP3Go6LCu824E8Z337PFb8ls6Dd1BTpdf9nArkPFW0=
X-Gm-Gg: ASbGncsSFvKDS5cvZTwTHgIZ5S2BuXWWEa9Js0+T7E4ksxE2rdVOMLRRZPj4P+VlCGY
	CzmcWA7bNyaMAX1yEn5r7c82Zuj5x/YRHUqBaobhzcoAwbpIosS1bz6mxUk2j8HUUg/uN9A2/MD
	OtnVOhqdlxTOFhoVG9SArnQDcP98iQ8pUgjED0GxMDKBsDgHTljPwfKMYwtWiMDIX6oTXtzXr32
	8dCeVlaMYqeptOoV5WLibfk+ICFlohGr8yLZxALHErhhkPRTAQ/4ZRyKVxVB+SRrspPf+KOOOFb
	5gqyxagJdjl8kNoj4FgoywGOTZ71Q8UCr3sSOvQlXnvYfiVhiLpcBMiYEVulp1uMn/HqxDJxkRM
	l5dCwrKx6AUdpkstP4uB4qWywNeF507Xmabk=
X-Google-Smtp-Source: AGHT+IHpL4WiPXA7lF0M3FZSr+pRwaq/mQ+o86j3tdbjJ+F9gQ68S3X3x2/bhMtUi+hXfsOAWMSEsg==
X-Received: by 2002:a05:6000:410b:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3b5f1890dc7mr3123868f8f.1.1752506177716;
        Mon, 14 Jul 2025 08:16:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm12970388f8f.38.2025.07.14.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: bryan.odonoghue@linaro.org,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: iris: MAINTAINERS: Document actual maintainership by Bryan O'Donoghue
Date: Mon, 14 Jul 2025 17:16:10 +0200
Message-ID: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5SEmN81j++cDBIFvkv9n2aotAYscERc+zZaDKLuEifk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodR85KovBs9Byw5IM3Ko1TPG7MkwoC4nasQNwZ
 S91rcu8eeGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUfOQAKCRDBN2bmhouD
 175eD/0QEl43ZipiEU/g+okr5EbElD01rJ7qQvSMis8Mzn0HeZVPm/S+WFVVLhiUE0OTyMSH1TR
 JvNkX8tLNPBQI+kuh9q5vDEEtIfhbZYF7DG7n1EWPoykST725tMcdVKdTO4ayNbGO9uD4ZOggMT
 r5567tq+S+D5it9prHYoCMVd5O7W6ScHnrpRUsUk9lEtIvdZYaG5ZOq2/iG3acmPVrifkmmeB4e
 4eMtljOXC5fFo4H6xRSGDfXvTpVpfk3gzgwoSkmvXKGaMTC82HsEYXH//6Odwhm0tnB6vRNXnZ2
 cqs3xT7bwdOPyDho38csJuTju8d8CvM7uqQoP/T8KT+KrXdyi0DFpb3/dNgBdp09HT3Pk+QHLIq
 SCtHzRejs5v2DOm6k7ZR8WjT6Cxd0B5yIQ8/zCVYKe/SyUy2h8cuY0UQKuDfpLkUmdW6fMX7dmZ
 CRyfueVtw1CkZ4aHRgpwv3OOdDE9ZsvyRz93acmJX3rQaHB6+ecPGNlLX/Zz/oi6y12aWlJsnWK
 lbhKQaOHI4gSOEsYHlUuyXVl4w4HoALVKqeQcEJcpfSH0fN2I/+eRcTbc6w6AaxjcDwHaxmo0X6
 Aij1ssTPItb/AEQ1Xr0EiYwlWanzHEsZB3Pj+q/uHqMZbP7vVUkGkbCbbkDdCy9CBDyBy2LstEG +8Ee1VYHQcguHNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Bryan O'Donoghue reviews and applies patches for both Iris and Venus
Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
in pull requests like [1]), so he is de facto the maintainer responsible
for the code.  Reflect this actual state my changing his entry from
reviewer to maintainer and moving the entry to alphabetical position by
first name.

[1] https://lore.kernel.org/linux-media/20250630121704.260831-1-bod@kernel.org/T/#u

Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40831ae42296..f56e40d9b3c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20678,10 +20678,10 @@ F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -20750,9 +20750,9 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.43.0


