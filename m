Return-Path: <linux-arm-msm+bounces-51636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F6A6589A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37AD3B41DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 16:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893861F75AC;
	Mon, 17 Mar 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtjMSEnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6F1ADFE4;
	Mon, 17 Mar 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742229505; cv=none; b=tXSUlBBAbw/SBqJTfe90yKRImKEdp+s8hIenb/xSY68tLAdLY+Q0g2T92yQbODXfW7Z5V1F4E8JFkkMa9NmVTmvOT2hY5eqgTEDZ5CfXPyt2yPWYvGPkX/SMx3HY5/5w8ZOOmTxH2rv0DfjdwSBin+EEVbQFlwznD0HTCs40jyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742229505; c=relaxed/simple;
	bh=HR4snbWFFwiMo+npQvVU112otp9kuqyRniHfyZV8d3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ik5BGIYw7aDe7Np7aJ9n7tqQ+DNtJWyYVEk9SLDdpg8HlhXqQKSLymT1BqJr5E9jUvw24Eb1WZRvigKT04T8UYNINjXXiyxeH+SzxsK8UBHK/l/RIGBxoVyDHtjuR3knPdAFna544p9z7Mi7bA2JXXLmzCPZZsRvhDO8wlR5m7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtjMSEnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E01C4CEEC;
	Mon, 17 Mar 2025 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742229505;
	bh=HR4snbWFFwiMo+npQvVU112otp9kuqyRniHfyZV8d3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BtjMSEnBSFhcdV6hKhpwL6WjcRXtJ9XJoHrLfFTRviGt3hT+8BoPTq7+xSAkufcg+
	 1KN6W+QsGoGJRHNbS8QoIu9u688JdYJAfa6UKtwKDtsD1hzUm+y/Ntz/QwCT5srch+
	 Kx/wgMXeEAPM8WPIqk5B7tnGDh5HsrQ9O8aIwhh8ie8vgLfubazF1xUkSRTofa2hzQ
	 AZIgt5n/dB6mHSXWuITy2U6CT9snVSKpHx4GiZsPkyyCBBkDq6/2V+kK0vzv6Dhpmi
	 vvh+vHQ8Jqpdh33EhsH7MQFMVQfhI0jKrHFA+BPr6OBDyD5sge/xg5gKmzPwtC6oBk
	 4rgfaOLCJRAJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 02/13] ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
Date: Mon, 17 Mar 2025 12:38:07 -0400
Message-Id: <20250317163818.1893102-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317163818.1893102-1-sashal@kernel.org>
References: <20250317163818.1893102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.19
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit d776f016d24816f15033169dcd081f077b6c10f4 ]

Temperatures are reported in units of Celsius however hwmon expects
values to be in millidegree of Celsius. Userspace tools observe values
close to zero and report it as "Not available" or incorrect values like
0C or 1C. Add a simple conversion to fix that.

Before the change:

wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:         +0.0°C

Also reported as N/A before first amplifier power on.

After this change and initial wsa884x power on:

wsa884x-virtual-0
Adapter: Virtual device
temp1:        +39.0°C
--
wsa884x-virtual-0
Adapter: Virtual device
temp1:        +37.0°C

Tested on sm8550 only.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20250221044024.1207921-1-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 86df5152c547b..560a2c04b6955 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1875,7 +1875,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 		 * Reading temperature is possible only when Power Amplifier is
 		 * off. Report last cached data.
 		 */
-		*temp = wsa884x->temperature;
+		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
 
@@ -1934,7 +1934,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
 	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
 		wsa884x->temperature = val;
-		*temp = val;
+		*temp = val * 1000;
 		ret = 0;
 	} else {
 		ret = -EAGAIN;
-- 
2.39.5


