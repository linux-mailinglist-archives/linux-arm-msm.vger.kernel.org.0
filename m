Return-Path: <linux-arm-msm+bounces-14205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52D87C718
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 02:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C58282614
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 01:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBDF79C1;
	Fri, 15 Mar 2024 01:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnyEITeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB06FD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 01:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465765; cv=none; b=TYMq2c/4x1dtwVH+tB98aSnJ8M4lqq4XBOs59JgcHynjb+mMYQAGNgoCC7DLOOTvovZpczcZM2BDXpfkpoeVCJQyQlbseWH7ygpMc4a7JfsF6lWkRTfEL2Thm6OK+/FIF+gn/gNT57BM2wSbC4bNmQaTVrF3x0Q1qngk5/P4VxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465765; c=relaxed/simple;
	bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfxuUxxLG8Qox4NqiT4ORhtPN4JSOuAUCgSKKe6H9d0gp1cEnyGzvfHNEU5WCOD4QAqD9qDid3bSjnEUiwTvQIJg+WY9Us7uFdu1c8OWutHKAaid/YnQZPrKzVSy/ZOwgKVdwtnVh5kXNkB4gTdNGmFR02h4P31yGb/2n3YMWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnyEITeR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513d609a889so524981e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 18:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710465761; x=1711070561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=bnyEITeRrHbY2eLxvVouU6Xwj3ICvZO75rdzgGWKxKMNCiV5fumdtAlW2D4m5wa3VP
         EvFVUvhhQOEcDlGjRqpJ033Qw+fANZgfYEOCJ14Hd0cDyGE9E8bK8Ny3FTmtpiIEQai7
         KdEe1SRSLaY/ySwfsMe7VqLkZ5TTlVis/oz5Fza14RdT6RtCsH6reCkgu0K//F3WUZFv
         4ZvIYI007QYcOedn+e+LJYbGeKHpVwJWFitNi5KxR9EuGJDaQ+lMKf8tIMUnzsPbj3Ci
         lloEoCpglovsxQFtv7kN20kGR8ElUHgKt5wmFY7lz/fORqkM9GGVbTm9pl+cHzfL/1Nl
         Ke+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710465761; x=1711070561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=oS2aw74hz9BVDXdM6n7KU1TZVHGPcrMMcUYvRSJ83s9KNfQDwSHKJFchGPPLd32HYR
         LUlA3NNI0aCmuG7dquQ9Enb2WORqNIBTzoz/lAau+Sq/HIDYOPlHzXbXI01jgfETjyb/
         NyiADTsXY+PuEF3Wvm5p0pmr2Uwozb2SF+BzREX8jLd3o1xUsah/tsaLpbfIx9xG+0qo
         X6t8cZLUfEICcIIi6Km0tivYFq4W4zvtvNADKlG92UG3DfSvQgBrjZHhZp2x//ADx/Hl
         1zDwZTnQ/hNgr6vghq7VQnCEMfCKIGaIkmEuL14v3PV4IewR81Riw9gAEKO01Ce5FvmD
         A2WA==
X-Forwarded-Encrypted: i=1; AJvYcCVykWBjYDOwbB6mTV3CLcBnB9HPj8imJSJTuGDXown42eGZ2AaZthAh1qxIivCpt9kDm0J02o4PG5q+nC4K2b24z0FCUcSQhBU9+2SiXQ==
X-Gm-Message-State: AOJu0YxEpbscdk49ah6gO1KOcr2ySjemV4bdH1KEQh0zY/+R63nH9ahE
	K+KFQcbUAd64atbSU/QZokYkegrNe9tCl8Qo4Y0+3OL8h2W9KbG/hRY4vEQqvb0=
X-Google-Smtp-Source: AGHT+IFmDuKuQRGO+eWPPLFOAgOkPRqkFsCuQr6QZ8or1aUcK0sj0cyiiwONUc/yqWuGMOnPCOM2Xg==
X-Received: by 2002:a19:380d:0:b0:512:f389:d6e0 with SMTP id f13-20020a19380d000000b00512f389d6e0mr2463340lfa.4.1710465761143;
        Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 18:22:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:35 +0200
Subject: [PATCH RFC v2 2/7] drm/msm/hdmi: drop qfprom.xml.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-2-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86LbPNCJz+MUcCUP3hB9/uEMDKdbwuJ5f42Sf
 o7qNXaVm3uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1ZanCACOUpy4LhrPkz3YGxYiFWfyk0Ui9noOPTPErxPabC7v0e0w5EkSWovtwtpPFexgioP7H1G
 HjCMXQ0686+y7IBDX42V24iqiS7JZ0xnXM7QL1QeA3cwgqaBkc/XcRubPzZPwR9eO7KH0cMAlbz
 I4KNtl20P+NtN79tHxYpjKsz8d9yRnuMiG4YHdDJLiEqBgZi3/EMRAFsxP/D3G/9OsYQUD5XHP5
 5fCxfX4DYniJbN0fsJGPTc8YU8BrZ17SjMX7JJh8y+Fnj/A8jMsG+37QW3rwT3c18a/Mp5Qm55F
 6oFzMUvVQzijx1htScSVWQAZjxaI4VxS5opA0JlEyHhz26Q1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The qfprom.xml.h contains definitions for the nvmem code. They are not
used in the existing code. Also if we were to use them later, we should
have used nvmem cell API instead of using these defs. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h | 61 -----------------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h b/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
deleted file mode 100644
index 498801526695..000000000000
--- a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
+++ /dev/null
@@ -1,61 +0,0 @@
-#ifndef QFPROM_XML
-#define QFPROM_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-#define REG_QFPROM_CONFIG_ROW0_LSB				0x00000238
-#define QFPROM_CONFIG_ROW0_LSB_HDMI_DISABLE			0x00200000
-#define QFPROM_CONFIG_ROW0_LSB_HDCP_DISABLE			0x00400000
-
-
-#endif /* QFPROM_XML */

-- 
2.39.2


