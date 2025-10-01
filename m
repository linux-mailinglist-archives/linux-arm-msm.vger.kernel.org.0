Return-Path: <linux-arm-msm+bounces-75683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B050BB09B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2134318924FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE1D303C91;
	Wed,  1 Oct 2025 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7HLYlNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57793019C7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327279; cv=none; b=Q6I1QQR7IXBfQ46ZvuA+zG0j/SqqDCHuJAqdr5n6mRzngBKvdHBaulS+DkDeRVIEtjwmPYaFQPX59MT5ekgLR8NjRdQCmcs1xBzjXmmKlHPPI0YFQE6jgYLsrKKBZEWfIHiZeppHgGdubR4s7QaPyK+TuxvKE/FVU1yQZrf7MEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327279; c=relaxed/simple;
	bh=iFoDKGEqMBtBJk9VDF0RT1YA/LVK+0RXAMU5TYBYIbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJWCDJXnRblFBGck3CrRFQHNmsXaxOR0aKWLxv4/9JIBI5hu46SNnmGwDec03eNjaQRRWN7pOSmTqN8NL0R52EgDhqNdk08jA3Ek3nrPWPELISJPf8Vd0m8if7O52gA0jDmUG0pbR5aDxCbLDx5zpIsKnFnul8u9Rtt/2K83kMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7HLYlNC; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so47076475e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759327276; x=1759932076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
        b=Q7HLYlNCyq1vStuweotD7DYBrzuSViFE67I0aEAHAAdExTPDJBUFKPtmgKVtvJOWXt
         PhEvrWU40prIcuzBScHN871J/Ufaveu4RCni/JmO94tgA5JfubJv3kNR+5oTiQupPuzN
         AJX0JGRvQqSC/zzTY2s70HgcmILYmvsecAb5Ek4TiSKPO+9QG5HWYiYxrAdaaE/W2Smh
         HUNR/UOOOB4OkDB1C8FLsDNkpasTo0U4oBCflxaD54IskTwde+jbo1D9qs/ES1JjbbFY
         zz/xbxC5/ap9iXH/sNf3lsNxKvXcFdQRt1gL28sDmOB0mYGTeMsCCX01fo4kyqlL2NG5
         StnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327276; x=1759932076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
        b=VqSx4//CcQmdQjZU5fndet4ZkFIZmw7no5LOExrAOBFYFyJ/xNEC0RLXJ7BM3fqWdI
         VxUY8VUU7hwnnQlurb94gjTa/gLY19p6iaSgamBL66aUMs4bl4luE8CeiviQywtYGtn7
         ICYALYi8QqZxe4dfy55mYT2VJWx5eT/6PGN35z9QiSvpkLkRWgGRez4vAzmpZtNboesp
         9DSd9+bGMAmbnyVzatLY/JCJ62JSNp5EthkZjMu1f17v+QK/l2fdXrmLMt2KIdRyMUKk
         3UntTxdXpjNdHl819kQas4YKEuCh7JjPhqSQNyBvdDQlTZzV4TrHu6jdqdUWlfLN4mSf
         f/8A==
X-Forwarded-Encrypted: i=1; AJvYcCXm7m+d6Itd1lT++J+C6SHi8aI7gh20r/pBBrVUdfTKluxhCa/K7reEVAn+Z/Tz4/Kgit7wGTTRpdsHtL6s@vger.kernel.org
X-Gm-Message-State: AOJu0YwdX4sJ0QqC4zXV1e93dR80lk5raoGoF/VpNRe/PqT5hez89Qdz
	5+5yWwZE+UtHp/8xfQlN5Pn2snpRd91Fe5xJb8xpgsC1J3UabOViJ6SV
X-Gm-Gg: ASbGncu9t+vtSjneQ8KM0u0Z/Rif1yYcuHYwbVVv6wvj7KTHSXZuywDT56pAWZ5dMPk
	c4xuXEuyEMX8A7eGK5u0QmcZNDcU1Rsk9bBze2pBHelYBeJmuioOrMu76Hfd0Ei6I9IIQekqiYb
	P8elfHdm0B9L/tU9fGyGIscTGoKr+1HxanuWu9AA+edsNORifE6dpdh4i417Tb0BWyfXXNoU6mR
	2lBC8+ykZYuLhfZYBj/MaT67ksJJqv9qE6kptk0mFoVGJc7iwP/IOX3yM4g+F2WK2ArA6HHJFdr
	3CIdJXlT7R6w66B0GbBut6CCRUTHaFPE/HNAutQqz6WufC2EooFzV2fLaAeC83PEyiwFrBdqHNc
	AopmjOW1+DXpUmAsXAEnPS1hwXl+YJaG28GONKSSJsavD/JSH0V6ljQTFu/P+bukeXg0ExyIiWC
	HKlzLQpUjIqvasT5cHcdhJ+Y7LPy5xzgJsrJlZUECwdPwtXx/1Sg8pFA==
X-Google-Smtp-Source: AGHT+IF6jIPdEU9MFXPhCPUkqzhyaWrP5uY2bhk5OwNgz8t2vPUiheyA7QIaNPR9raR1Aa2Qrunkyg==
X-Received: by 2002:a05:600c:4e4a:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-46e612de19dmr34857695e9.31.1759327274375;
        Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Date: Wed,  1 Oct 2025 21:59:13 +0800
Message-ID: <20251001135914.13754-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jun Nie <jun.nie@linaro.org>

Some panels support multiple slice to be sent in a single DSC packet. And
this feature is a must for specific panels, such as JDI LPM026M648C. Add a
dsc_slice_per_pkt member into struct mipi_dsi_device and support the
feature in msm mdss driver.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4077..773ce8520698 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -166,6 +166,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -910,17 +911,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = dsc->slice_count;
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1069,12 +1063,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1683,8 +1673,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc_slice_per_pkt)
+			msm_host->dsc_slice_per_pkt = 1;
+	}
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..2ddec7931bd0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -180,6 +180,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -194,6 +195,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**
-- 
2.48.1


