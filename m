Return-Path: <linux-arm-msm+bounces-82515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD3C6F3F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 718C12ED5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640F366DA3;
	Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuQl08ku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B656A364EB2;
	Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562103; cv=none; b=kXhFy20fDF2T7mRVMh42LpYhmO58I/ZjkIH7206WXPAfyzpfAMBLJxkZSL5FWL+dbEafJW8g5a2pO+zU8HIie3Hu+stLjlL8tqj/HbmCvV7D9kzx0yL2tcy9ONYLFZOWT4PnN3wj4q3DRuOxP26/mi50QPLcUigtM1XPw/WcvSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562103; c=relaxed/simple;
	bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCq84pyiYXZLLwKIS73s1cQ4A7/yC3j67fvkz5P5qotTv8lDDd/LGmvgqe5HrSiiQgWgA00u3lDMSI+hpOpPwuuUewSFEA+VLiQf9YeT3dc+4051OGYvfAn+16AwZi2Q+I8woFyV2kZv+7b66ts5deSQV0CEbXSIN/RCU4q6PWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuQl08ku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9075CC2BCF6;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562102;
	bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YuQl08kulOyYsMF3NQ6YA5F/j5dVhv859AW0GgR6we5w5T8/LENuyU+EcTVklqHrL
	 zQxHgcX69o/EC3QXH/wl9Cva9/o88FUL1KYEwixxmXNvpavu59b0Cq05pQNVUE7IVn
	 rRVN/zFsrFyvOUuJh8uJCMV79qb+9ab1lo6h/FFl3xnW6nDeezqGWWS3lheBTziEB4
	 CP86e2epTgq2smAJ5NMbEBnJYQaGMZt7puF7p3d9bNTtzoJZAmGwGoMS2rvkMT67Y7
	 moTzu/lbZSmQ8KD8UeY1xuSkukU4pXvVXBikAcPfna5mmR0hC7hXzQyW21RWTPbQeu
	 Wm+PfYxl9Oa9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C7BCF34C1;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:33 +0100
Subject: [PATCH v3 08/12] drm/panel: sofef00: Initialise at 50% brightness
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-8-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vjrHJH4EY6FJhDpprnzSkcksIGyeb+RoENa3mCki5mI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJycAIUQJO6bD234ZrR/h/NB7vOojf2vplRl
 PAgiirYhvKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cnckD/46GCXgYsqFV8C49iM5nrbVA72lwvKuHMFuWOtab2kV8MZ5DHFUybrXDC0fAy67KE2/MzI
 pK3XNS9LUEDEgj+AeI/TLPUHJVRd6PfGgch84M8laVBvt8s0/QALq42FbLors7adT4bk0QnNbPA
 /NDC8btbDp14EQmuRQQNcEf8lhdOct/1WeDIDc2YeUkROifgGeEhcJ9Tiuq7oX5sM8eQoSHPY3q
 KM2wq/y/Ar7WeLsMPktbcHbf/5tke6vjpGmXUshezjAO/Dgh17Tw8+v/ExUCG9PGn6XMaAJhjs/
 A2Nd4NPslOPcKFNlNw/vBR/OIUzfWlazu1RaOnnBjtXYdjmQ1zTQOjZSlBch5m0xZTOQF59fK+z
 XyMJ8kUsg8e8qg46FnATAinMbeDOOMz5uyrFdKWQTOGpd9FqZSezdtl5DeZ/Zeu4s7az9q89hNP
 cuW125TtHQrFjuY/aHbj/nuOLdHyg91RLD7m97PLAMFqHCZGnfgduXE6HH6rD8VWIvx+HyObhgZ
 qhnR3f/pqRodAD7kbmpyIWutCP9m9GgDrTPkEBoJPEo0oB/IftaMnf2Mn6Ct4KAKbMWdkVSsQaR
 r7q5MUb5gW7y/F1ueOSELI7TuMINOK311TI96eV9FYtVa8xeTkOjL0blraduAvzGPGyOQeuOUae
 FTcNzym0O8kMbuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Initialising at max brightness is not necessary.
Half brightness is much more comfortable.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 0d3ae0689a19b..d1e5340d7e337 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -204,7 +204,7 @@ sofef00_create_backlight(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	const struct backlight_properties props = {
 		.type = BACKLIGHT_PLATFORM,
-		.brightness = 1023,
+		.brightness = 512,
 		.max_brightness = 1023,
 	};
 

-- 
2.51.0



