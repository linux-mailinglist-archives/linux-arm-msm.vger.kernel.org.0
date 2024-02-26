Return-Path: <linux-arm-msm+bounces-12500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6478667DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 03:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5CA1C20E2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A352EAC2;
	Mon, 26 Feb 2024 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvX+VAXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E1EEDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913513; cv=none; b=Zf56i5EFZUhMvmy2nBH42t2OgAsSEG+iHjS2h1XYWxh/tsmZ4WzP0FYIYk7q3pMImrLqecG280QOd27HnW7vMb9iaEJ7Cu9SAii1iE6GrHi+qC+Om66FfBNJCErMFhkQMpsFPg64T+CyMKsL+O8sPn6RVu2V9qDngObpXmYckHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913513; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMV8U33oWbPxioVGU396+z+2w9i3HFRfB0OLFXD/Xf4hXg56WURkE7Fno2eO8J3NBD7I0OBayz+1sNzRq6jlDRTwPHJXrBi9CjZyX4jD9cN+RZq+ecOGjFT+q2J/VzJP/tTSEyxUuxFiMZmrilikMbhpzWslr/m5CLO+iY2WsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvX+VAXw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512e568607aso2277477e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913509; x=1709518309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=AvX+VAXwD9urSpx62htNyLPpR71sZNzFRIqk/vS72cGHNvendjf1GPzFmIMIWiI0Z8
         hHuTGMmPy2aLiu52o68iGIxkPpIlnCUq0vA8IroyKd/gsh78qQhPfeHg2bhXN4Gdw1bc
         IdIkNBgv57B73gEPl54qNu7Cy6Bq4TfuKzg4y/phGHJ7r/sxGs2XuZeV4a5yt8SsUu7F
         fnFQ7TvIOW+YhWOSevZpHsU7mqdm8h8T8t3V8vWb7KGm1bwYMku+HuoAAMvT70SiAobr
         IJ7Qx8KisH6lBzaeQi9qdpXk+HpISSNFbALdUwCa+tGUrQtjV84GrIJmQasoLM7z1UMf
         WL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913509; x=1709518309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=mbF+onc+t7Kd8BEYKeWKTgEQXbLzEDFAelZX3ZMK6XLEGWYF3LIdq8x0tA/D66dbbN
         aLul7oJwKENS3OvyWSiXs8HTY9uC1dlbInegwj6IwoELNY+4Fsp0hiXVfrhPefmYGEJY
         U2PRQZJKymwpX193VIQ8lruA+ZNKf4JMCD8XWmtVCwGm/ogBre6gs77O8lZoturVV6vF
         GVYuLgJzgslmlHAWGSSqxH7897VTkqNPfW/AqraCSdOaaIwVgpTZyJsD2Zkr2snu/hXK
         MaF9SjX5piwJ0iGHPL7kYLZ6B02s82vFwi8EiKooacbbY2+XfgweIf7kePdXuXEbehgr
         6Cow==
X-Forwarded-Encrypted: i=1; AJvYcCVaOmypYKfRbmTP7hGA6pNmF5I2wtOsSI8SeH8P09jjoX0Sj/DB9kglL+OozIwVxE3rxZvuGCXvrkHP7hS8aF0RHKxXBus9fG8YJ8mysw==
X-Gm-Message-State: AOJu0YzK2YduwLil1nVCRtNCr06zfQF2kQJBhcQGsymTPI0+QFWsl+P9
	lbCD5FU0d57GPD6Tjimi1wlJAU2/9Ux0z4umHMKuUMGZdjQBj8BAL2pLSEdO2Bg=
X-Google-Smtp-Source: AGHT+IHb04FdywAXBPTnIb8Y9ZBSIaj2Xcs5bB/kHt775lPS5Abcp+5HI/DcawcCN0Nsd2vj0epcfA==
X-Received: by 2002:a05:6512:40b:b0:512:e053:7c17 with SMTP id u11-20020a056512040b00b00512e0537c17mr2963203lfk.64.1708913509263;
        Sun, 25 Feb 2024 18:11:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:38 +0200
Subject: [PATCH RFC 02/12] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-2-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgcMl8CxHPlugzZLhY4c+N8V9o8zlsAgOmc
 VKqUnSBl/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1cDuB/9aUxWVKUUBHVj2GdlUKQaGdLNPnjiYligKy7dj/FB2rJBpux6Dd+P4Ev4m7ajIracQwM9
 8vC9uc1jF0aT+EhgNVmMbq6dedCaEbPhJq6Ecv2YK+2qBbzZyOd3D9FtZfrIsq5KItL4WAyAT4F
 AoxeMZ0gaMUVVPHH2hNModk3t/9dTI5bvJ4L7q9Ar3p3E608qjcEzEQMC14Mw4fPdkBANDObU/m
 srOHFbZjcMyZeRQUV6vdK4baiSPt95tGeW0Vl1zuRXdDe7IRwYF7NdmiOBnA4JgWNgkfu7wP99k
 624m1ZpfxueGOTEcdq7vnJ17IZrc+1R3MMiUEeV2GzMN/+4f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2


