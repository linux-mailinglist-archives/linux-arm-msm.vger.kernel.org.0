Return-Path: <linux-arm-msm+bounces-84583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC102CAA728
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 14:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A4FF3062BCE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31A42FCBE3;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhHA1rHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4922FC014;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028084; cv=none; b=Utsxdq7+jKGY6CFE4/3YpsegrYnS7dz0yQqnDtvL3jpXXcI+nVDW5V64YTJr617WMHqyQWTh8R82r6RqZLjt9F6Us+KU9o04ifdNRxs3Ti+bBJBokrJHW4DNp4pbWYOsE9i7ko/8/5EFRkBS0CwtyELc1JYIX4q4h4zlRjFXtmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028084; c=relaxed/simple;
	bh=KuQJjNrGdJL/Ni63TPQm2LwQNOy6M3cg97mb6xmv7yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGm6LBaS7f1I+KZ/ucSzki0iE2W7azn0jDYdIosARIEPP1TBd2heMe8uF8678+wcqaJXbrQlTKE0umWcM+gBCi3slvBrdCRvyn946waEXaYOK/TFpK4xuXFOvFFJjnlvz6sxQb6H+TMZkcLkeXjtEBoSOM9Ebw+/ymTXlXMx6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhHA1rHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39129C19425;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765028084;
	bh=KuQJjNrGdJL/Ni63TPQm2LwQNOy6M3cg97mb6xmv7yE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JhHA1rHqRk3EhIOjvcz1ohZe9sT5mihJlChHeywfSEtHccNaqY7OsL0K2cLFDgtkb
	 J7iDseTO0oFbu41It/cj+ahu4Pr5A7MggjE03/ObRptPVTp/fvegZCxaTX+43qZowS
	 /EV4oxtDffoDgWsGUpz050Z+s1hUMpSztMTeTE3/iwBBML86/tnfRQwp8iw9aJA/gM
	 VZYXBJHY+LWtJGmahTd9NYERY/RbTFvJAQBOZe0IszZXUtJNVuk/059n+NE333g/CS
	 0wSyf1vIhJUUOIG/3jsyFTJRM4mLbeiGVcPerL13O4Spc9aDzm7sVLHbvDDkKZSPNH
	 BDmF2Nu0RFrLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF36D3B7D8;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:22 +0100
Subject: [PATCH v5 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-5-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PuiywuMQuz5mfrzYWDI/bKjfM/bNSPMPp8guUiS9OJE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwY0ERXfUW3N0g+94UgwVhtHdJ8Tb8p35Em
 7P1729P9UiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 coylD/wK7IsESE8JYD63DU9hna3qtf3ILJfjOrCsRvoMGkh9B2dZiRDS+611tSJGMaw7lWKdCs6
 vGJwrMMB/EWlKH6U+RJRq4SN+UXr1SmsSa/Bi2slc9FT4fmiPTI+CrpO8dEVkPTqWL+jJ84GTXo
 p4VtTNPO+/IirdnEGh2/J6q558CwVbCc/+UkNjlG4Ucd/5pZHeKs9oGSmt5s8ZsmPfm/ncrur5c
 FNnbAXgtXlmDpnhpak8xqhW+ekRm/WHgrK0U7kGAMBhg58fMP7iMuOIz9y8PizdPs3gqkQdQOrx
 ZJ+jqEUNUv8+iDnzldO3m6E9675pFVw0Bh7vBqcxMHAWQ8mmb2az8zGCko7Msv6SgK2aR2/XYtJ
 CgKe8+uZ8FjEh+Foa2q+BH8V2o1Jm/ByQ/pQ2rnB2CKCKU36SrqyXyjvqf8qOthLlHBrfL7K2nj
 Mn9dVRIRyTiqacYi2FPSqsA3Jw/OZrZwZOK0MijnMTJ+UcOXB7ut3gZVgWJXa5N4i83Ges+PRGN
 UpAIKZ79FL4VwfxGGxVwvbdjO1RuXTKJYkgzD4wZqzlNGAAYfg2XXZ4PfMGhCM/tw0Rq7PmXVlL
 s3AoltXGw5Om5q9W5xR7GmJJXUFKTSoWW9WWZBXp+OOeFzYVoxS5slH/rWG+ZTC/645OZdBB4ZP
 3o7N9HFPy+cJgXw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The drm_panel_remove should take care of disable/unprepare. Remove the
manual call from the sw43408_remove function.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index dad6b967b92c2..06b9c5e650edf 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -318,10 +318,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
 	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sw43408_unprepare(&ctx->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);

-- 
2.51.0



