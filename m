Return-Path: <linux-arm-msm+bounces-80370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70456C332AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E1034E7764
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36514346A04;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgAnnyCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8730CD94;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=PcjBkSaqMqvdxCnXcPlTS/2j180urZycvUHxcTb/0SMsH3GmhO30RzyqYc2sR1bmHdmIkJ1tFJQsx7aJYoscZWSGRFjZa9M/7z4jdHPYPw06Yo/U0legCMNkdgNrcMt4ojbRJmJk/Mhba4jbs8iDbdTlMkggReUBM6BKHIbZVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=sx3FdITHyUsho2TuXz9tyb+nFy6gs9cRfJfgUm1fuoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YElEgrMfsVOXGb6AdQrn+hXqdgu9f7VtOepiKsNCQdztKOubcSQYO0f+ifat/wRoLz5ftncROh98Fk2Xx0sywdO1679+Nm0oU6teTBxa0bliE6ZNng7ya7L1vCL0vr3vbtRFu+D7mp/VOZsMq+okxx/rzI1HSByMbW2Pupjfzhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgAnnyCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44B8BC19422;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294575;
	bh=sx3FdITHyUsho2TuXz9tyb+nFy6gs9cRfJfgUm1fuoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WgAnnyCznasY3yysDSgfV8OnW+n2hqaS++bEjWzRm9c13sWp3b/KTRdXNcF3fguXb
	 sRZMwyNRoOggYDYNfsjcCxiMxZYgEkncETOFjDAACXOXEUTa17HYKdZ8EHZmHHf6b+
	 /yWdEth8y3mQHuq2rIy0N0Wd6ucBBZMRJrbkdOO2fZzeIvAansrH4Zed390m8gY9yD
	 i9GxWklJph+NU/sl9Zwzbq8LQTcac2TKGrzCA28CtDtbpCvDxbx0bHNft/RINWCpi1
	 MyQTo8NxoDwnRT+OPWTBKBvZClS+tth49WzHk0bYdOduj7MB7qtSvx1q3uDqs/MM1s
	 JUl7XUFggCKVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB8CCCFA04;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:20 +0100
Subject: [PATCH 12/12] drm/panel: sofef00: Non-continuous mode and video
 burst are supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-12-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssHwg8Lskik0Sixi0f0lMdo/NU6KJS+qhtl
 c+BcqyrhcGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 coP3EACq2H5LzaMgEuOSQdBm5V1/Z0IrgpWiiHh00ZeFLGXhSzhNbJyT4zifpu9FOMDE2JKiHwK
 e7kvGVDLhKE+e2bKTOF4xgW2gx9HoQcqHbuZyu2uuKASiT58GD50SDuWQk6hUHVB8rQRFuOrnzC
 8Y7xnppScEJhsgHbf4hM4qWwptHFsL9IJY32cusiD2Y4vqsLz4WAasilNxd1xYNUjzqq5WiHTOS
 7k6JGFPmZkPHvuFWaPN2HVIak8OxcEL21w6/lFdwRjROjDl5yDn6EwISDjmVgauAaAMXxZbg0tY
 Eza2y0tCWO3K4WLQN0kL7TWF8lcFx7PWJ7n9NtivduDJgnKUCVRQ1wMMFnO22+bIwRjElM9VSkk
 Vzmjk8nNAjXg1HKnrGKNNae6pf0H7ZSb2NGQFGqXB9fN54KEBUx9SamPh7CQaT5WGih+SVMj7SG
 0XlTY/jkpXkLmDWPIlatE+jOQxwRfwpY/m3eybnCjHYx6ONZqt82WbFrl0IdLwwyfo1yQIJh8Bt
 zn7A3VVUrnWbpvbRoxuTaFFb0j9jpsGkTkGiEDScYxR+4QSZo39WUIPkSIEtWc5jIkPYn7VhxP5
 XAsBYLWaW0bMfx+GXH4eD7TEgF4PjUdWas3prmx0BeWDzSdunxvHegoiUtrhg0DvNj5GOqmGkUq
 yb5CdZWYqCESkXw==
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



