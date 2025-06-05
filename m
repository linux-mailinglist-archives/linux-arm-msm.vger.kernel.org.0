Return-Path: <linux-arm-msm+bounces-60320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A7ACF2D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C5673B1446
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5607423F27B;
	Thu,  5 Jun 2025 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOhUf1Eo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D57A21A444
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136303; cv=none; b=YkSN2UUezF/Oc9UPQUVSBnVZeMk2DaQ15dcg2OUmat9T/c76uk1JiiILJRK6jLArlKazy9V584um4nG5Z8B/IjquxZaaUYeiMwqPnQ/MwDKLhACunlLEyB3jmA0XpIkyAlJ3b3otiD+/3IgXIHrAsOvX1tQZBlk1QOzIAmjshMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136303; c=relaxed/simple;
	bh=3t5hMeP7ABBlyRxpmilprlc7d1eAM1m14oAOcrmuomg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LrJKXOoYwMDH7Omz5xCgYwKFqp6XbwsgLvJhMP4BFKi/QZGQ3M8I7U+jdAQeMHE084GVcuswKkJJTD985l0p0bHCee0pAujBUYwRGR8KDRiLisqitxfUSHFnbs0ui+HKUCmtiTqjguZpLMrzndv7KBVkIVi2hVfgsdzdzZ2YnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOhUf1Eo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so567517f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749136299; x=1749741099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bzgHxof4HGWQflHabmyRzOQmodkv7YALqL3K9iBeEo=;
        b=cOhUf1EoJ67iuqXHXVrfZ+uUM7gAQwv2unxKA9d476+7nA6BTOxhcrASHPxQ1jWzrc
         q2gIgw0nxSmnMsJP9KInpHvGM1SUQjXp3E4t0RhaeIP5uWRW3yV4wF2F6tNWIX3mdsb/
         z2RZcG386iAXysRVYgmGdZBD/JyDf7QQx4vcWnsO41/nuigNVehppxY/zFIdMMlh8t27
         wChSWfcit72C9dK7nwfrKNGU61AeGS7HcwgGqnf9IZLTaUTQcVdGU1Lb06+ecO8IPp0V
         0q6xKHQyYM3gyFrTfYTFsryS/MDAdCV221QuzEpwkJVixdo7/trxX+Vei0XtscAHqO9s
         +s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136299; x=1749741099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bzgHxof4HGWQflHabmyRzOQmodkv7YALqL3K9iBeEo=;
        b=A0EbfFrcZlW5an+S+KgAgUo+0/zfjNnL7d4kHGW2T1mIj1TJwgw8UczEwnUZHt7QJa
         chL8lsXn1OQGtpuMn9Du9ivw52kp7g1lcR+q/0jFa4XxF4PNfEOJl7Khz3ezK3x3m8u6
         nkXrsa9dqIm61JkNrXHi7ZYqb4PcWMqXRf0dTw7G7gCK+vcy129H572fV1YhSaPJoMBH
         odtJfXXsHRQAeCDa+HuGbctsFsC6rcEW+0zL+iEk1AFzbnzk6+trz3uKeoHBWA/WmX4j
         5gDJ9OfIzg9gOXnzFKmfO9LGxhEoz0TAjo8G35DKvr4Kpti7YNAFdAQdHHpuQDYvR7UB
         KX0A==
X-Forwarded-Encrypted: i=1; AJvYcCXnOvS5w9mvuRdngXI7KMsUm2uG5gqpTeGK+m2TPNe4Y/se3V8prx8OIMB6sik2/FCYNJZzZE3JYQNbqW3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ipW7LewTdqW/6ZtKtY4myKm5hVCMbL4GeUAt3oOxyoLeHLi1
	YfbctEozsSycNsWR62lcFL1xHdXXLQLIqnVv/IraSr/7EDT8kH5UEqa9eQzOq0AQ6RA=
X-Gm-Gg: ASbGncsoxIRspkq33gfAjPiSfhHvFvgM49+9k7cUgdcPz6XAPXphJeBYYlMgjPLZmfx
	0e3AYd8FEKBQdlsIEqZVGF+EBY76Ib+IHRk+5uIYuuLQHwWomA6VNZ232BoCfB6sX49azH+9nSI
	Hli3GNiJc+cL0S88uHrd3cn7juN2BSADFMZGh2yN4dHqLz81GwPAe0MJfoCHKNQ/63lps5DlWnL
	3PXgXMTGGcC6ND2l2YQZfTjim5MKdCyTDeO/pjuoOoK2cjcSWXx2EucohwwBb9xZdbSyvPC1CrY
	z+pgeTZ4ESmcHyipIQzhaTQTa52ntLa3ADc02yauJLtS8y7ASrIkDD5/XtmI
X-Google-Smtp-Source: AGHT+IHRtSTrr2O7oU4uHDUU1xf7WoHhUspxl0v+JpGHp0sOgs8hGDWDwWjJWhusRVSgq8S9nf6lzw==
X-Received: by 2002:a05:6000:40d9:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a51d97ca2fmr7046857f8f.53.1749136299417;
        Thu, 05 Jun 2025 08:11:39 -0700 (PDT)
Received: from eugen-station.. ([37.245.43.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm24923968f8f.75.2025.06.05.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:11:39 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: andersson@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8750: Trivial stray lines removal
Date: Thu,  5 Jun 2025 18:10:39 +0300
Message-ID: <20250605151040.56942-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stray lines

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 980ba1ca23c4..69cb60dfbd97 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -177,7 +177,6 @@ cluster1_c4: cpu-sleep-1 {
 				exit-latency-us = <130>;
 				min-residency-us = <686>;
 			};
-
 		};
 
 		domain-idle-states {
@@ -1986,7 +1985,6 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-
 				pinctrl-0 = <&qup_uart7_default>;
 				pinctrl-names = "default";
 
@@ -2027,7 +2025,6 @@ pcie_noc: interconnect@16c0000 {
 			#interconnect-cells = <2>;
 			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
-
 		};
 
 		aggre1_noc: interconnect@16e0000 {
@@ -2037,7 +2034,6 @@ aggre1_noc: interconnect@16e0000 {
 			#interconnect-cells = <2>;
 			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
-
 		};
 
 		aggre2_noc: interconnect@1700000 {
-- 
2.43.0


