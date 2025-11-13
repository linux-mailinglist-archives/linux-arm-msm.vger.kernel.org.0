Return-Path: <linux-arm-msm+bounces-81693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F78C5979E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67FEB4F4885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EC035A134;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MInRELD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3446359F82;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056664; cv=none; b=hTcfm3rp+g2vlGVE6ggUVzNVqX/fR1rEZyvBOVLTa+EuEkrXL2JCS9CCL9W2Kdi/hDAzOyujf9GKYgAU96eZ6FJyHnrNuLisGtNOBEOA/cyha+OCgZhU5Ts333sHyGGRADqMnN8JPdYIJRHLK++oHRRZkuAp2zQdAOkrWSc6CCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056664; c=relaxed/simple;
	bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxDNxZ6iE/tGhO01qi102fLLaKAk+9gZiKekLLy0qZkaOKmjfXqfVERVk6EOqZP5g1sXBhqBbUV+dq7yfFQ7/0cak4SOKSaxgMEEvTtlpl1dXNP515BRc6GeNO9mx5HSqkCSnjbrl5XI0APn02nOShpi5g1u4INGs+s55oHAvQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MInRELD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AAB7C4AF14;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056663;
	bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MInRELD7LIy23rFZYlbCoTVor6zkVGh7n5+g0pOdq+VlpnXQdL+hOjsIeYpg0OaIB
	 ALd7B+W+j5QMZNAaewTqdB6aWUDekzH/TbhFQ96LhcR+BToCeTSXypgD7SgsVPHnbr
	 XieLXcA/IGEJB9JXItGfAW6R+D6MCg4MAFtwhsa7yjxhoVDd/6wTfMKLZb7mqxPVBz
	 mqTGkch1lKf215XD0IxlpSgI/Bu8H7BoBJo8ZBAMeX3MsYXixClWB5D8tmwAfykl/S
	 By4iWFPALLvvPJ+NTxc8vxrAfAmdZSr5w6eW7aBa/INInLYTrgDDst13No7uAa9L08
	 X1elJGr4n+EJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874CCCD8CBE;
	Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:42 +0100
Subject: [PATCH v2 08/12] drm/panel: sofef00: Initialise at 50% brightness
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-8-e175053061ec@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vjrHJH4EY6FJhDpprnzSkcksIGyeb+RoENa3mCki5mI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwVq+Kvp/Q4ZFwd7BdYq9nz4hZ0VZGi+hHN7
 6pvliM5AyuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFQAKCRBgAj/E00kg
 cgr+D/0TxPbmtYkFeycn3efdBGre+Z0Wbh3+TXY0BxAqq5KwwK3M1JjLIlHoi2ttO1ravPKzlbt
 y/BUiEFPIHIbZlAAkbdgVbanwRgSxaO/eLh2UmPnL/g2JRKEEUVit1IPvd6iw7NfN1w+9IuDqzc
 LD1C27DWYH9bB5bs9pKQKJWkuCOHuUXv6dZkBrL1qG76ApUxOUaveHoyvCz2jzWWAzDvLL6ejfu
 YcZWQpuHnWZP+gEge+VXy7mpdiZjKq0t7JhQwtdk6eaTJcQLfpCrL6RMdwO5tPembd6zxNwlktl
 7fpccxsE3ws6HeUw85SyDOGd9W2Mvjk3/HqRvuukFXGydsgQJApsw8dEtfvY9PZQg1r1EkmmvxT
 jHeOJ4skoweazWxvLyF4WGAjELkmcRZFLNcdT+Ra7x+NWID8rOEI+UWcJdB/wXxVMsURKQON8vf
 0vF3hVdCdYl48HYWs1G6ODFBi7DvnOAYL6L8OPqmBFfhMifff7aX95DXGtaDGvw7i8EUNpsbp8A
 CLRkmsXDaYOgrneEdEEHt9pgS/Ei8oNBbJAbfXXMuwMOjF0sVXyQsjfFVfy2zTVX/rnd52C00WG
 +CKQpWiyoqdcKX9pgh2Xxs46LMsh0+lIJqbGqC53xXXSms8NDTWyHzE2VYG20MiTsRViHzEZKR/
 pnSKjk8LQWdJWxQ==
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



