Return-Path: <linux-arm-msm+bounces-81700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72280C595C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F43E3AC33C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A515835A948;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6BbOrdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93835A12D;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=CNqB0qakhfaHQimP73EX3jzMI1SE4L30dBiebJZgC/SdfSSEwptl/GKd3chYdBK7EJBUuIpEsCAmhQRMMuPGRaR0UKXwAq47eKOfIoJDHS7V3ZIS4Y39b1a10JVeEQxT/6OKT8YHHZeaEttj92O6/lYJngrmQ4vgsJhPhtT0GQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=sx3FdITHyUsho2TuXz9tyb+nFy6gs9cRfJfgUm1fuoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLs3Bm2FJsKU7kFxTIDVwul8CJ7+7IEJO1MJBOk3JfNfygGmh9sduZkZCYzT2EigOtVyS9OdEpkZOKAebtZads8zHXwGypPgpzteF0pE8/iKe7pRqkPS54Mb8PD9ZNPzwct3iOSfEd5xMsro0RWc14QkyNpI4m4jLWjp/aEJlYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6BbOrdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C65ADC2BCB4;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=sx3FdITHyUsho2TuXz9tyb+nFy6gs9cRfJfgUm1fuoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6BbOrdqfcx3UNwYBBT7zJ5VVW/geZS3gxKpVsJ4GPbamufhvf9/6hJwH+vAkDJxn
	 G0xY7whTbF4Ev9510Ujil5bjtYtpLYjHtmhEvk6f9vENNmswrKVrENYbBPhs7zoClS
	 hoCpX8gYqry+XDZcCWam5iGn4Xw4tB9r7vsoDhc4htkAC3kDTaRfHKx9RAnw8LnhEN
	 xCuHEg2fPlZUVV2yH/2wmZ2AfDUB8TJ8weStmgBsekwFpK69IjAEMy5OtLrsWt0f7z
	 fKGBi/i5mgDMoB5bGitXqFpkFmxv0qpmD6TeqbxEtJIrWvjukgqMh87dV6Yf4csgmI
	 xDFVhQ1M8G5bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF595CD98C4;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:46 +0100
Subject: [PATCH v2 12/12] drm/panel: sofef00: Non-continuous mode and video
 burst are supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-12-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=OE1UAGoiypb8yw70x3xMaGL61XZlHwmG/9vzbFRjYK8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwVlzxcTH43qFIgD1KeqqVc+hIM0YBZcnxct
 +/4Os9eYZuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFQAKCRBgAj/E00kg
 cpu6EADNb3oMH/dyM3eFqfmZwlMVEwrACCIRZysVcIzs9Exj+pK1EtPklFvQtPe51Zy8cq6+BoV
 I/VWjBWU61WgHNTRk3u+pPMnJPM1iEBs6NbhH7XiGNHR5nZqQu7HTmMDDyU7q4PoNeXz74m5MaT
 j8GF8GhLkQodcCQ3VMKSzbNMQij8xJu8ZmxOMF3J9rbN1qQjlGnioxlKS5Qi7IJnhSJFxkYFdhC
 hVbnvErRCiap/Lf+r3AQ9JujZiYRhtE78vDaRcGkwVdFMCiQ1UJfApoh9r2pZ3//E4T5H9S0Wbk
 xIDN17ni2z58jGF00iFOOetDX2BhA0/9agxUUL3Yo6hQiizXX/lujDNf0FLDLEU6FTIiFPp4JZT
 VaVeWi4nzJkEfRC9awIxeKWdFtbdO7Yl5cIfnEh1TTlZ+yI9tzHEmeDxO/2fh4TZSSkMY8Lg3TV
 BKXBal4GfW/C/oniamNbZRmLp9P0bzOOjBFGGcqrUtS7uYXNlpsQfmBlmcU/Qq76etBkhkI1kI4
 aj6SjOCd4ncoaE131T8vGCmgyKGhRbPzTT0Sh7Mj/GjrzmKjZD9ZVsdYktAQpmixQMZKDHPtyLw
 K28YEkBQaNwODnumgKKmDl9YwYD0rmvJqE/y/Gs0DtdBbLk+ffzMOsH+yhmGZ8pPqWxcTdaHVUe
 qwQUmeS+ZPhuq6w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The panel supports both modes.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 8286cad385738..b330c4a1ad19d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -236,7 +236,8 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_LPM;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
 	ctx->panel.prepare_prev_first = true;
 

-- 
2.51.0



