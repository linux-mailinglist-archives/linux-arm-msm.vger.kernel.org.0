Return-Path: <linux-arm-msm+bounces-50450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C28A5449E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41E7E164AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382BE1A2C3A;
	Thu,  6 Mar 2025 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFpunNOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104002E3386;
	Thu,  6 Mar 2025 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249356; cv=none; b=VMOTEFjyZu0Lz6K/mDsRJYc6ZLCna9EgEl4b3bL27hvU95KaOiEmV43V4b7hFrPRVkk+dry8L2Q4dnz8wReJ9bUrKKq7Cf64DIGlnNsenThllzty9VjbccvKDAlPE5o/orCNUpbwlozOZrqGKz4u5SRw0Djk/Ux7IsTysTUYX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249356; c=relaxed/simple;
	bh=lqfVSt1q8Nv4x662WSVSo/wapty2VM77sNt4P9YbEes=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l4q3raKvAZafdQ+mz6Iuy2OZ8u3fdHOY0w42I4I23LoV+XivcYEk3nr43mAekejNIypw2egmZ7Lj6FmqK2z691CYysbKbDbOELwO1Lb2k5YE7pEeSsdQDyckVkcMkIWwgRxArHP3bUOTG6j3+G6GfKCfReJJsxKM7pciLcYW9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFpunNOu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A5BC4CEE0;
	Thu,  6 Mar 2025 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741249355;
	bh=lqfVSt1q8Nv4x662WSVSo/wapty2VM77sNt4P9YbEes=;
	h=From:Subject:Date:To:Cc:From;
	b=NFpunNOu4mBT/7vt+D+E4gjgFVBNtbWNON0S1bfNI1eYlv+bkm4mLs/niYN7p4KKf
	 8Bu9FkYYE9HUwxH6UAt0IIpztAfMDWIDEB7n832uEwsIFs3Se3uJ2woQy6sjXquF1L
	 3v1AZGNhdrRrxcFHkJAh52STHIv1N1QpBrAfLS+hVCi6FC6I0sKLchrYDjL3V3G2fi
	 k2lKutRKD5vwEJXWnUPyua5j7ITXYHKtBYMav8d/BvPB4S/bgzo4hKzq//6oDzR1NY
	 XSpNGKeaC8Q6XwpTprimzduXaWLEbyJrYhR1p0dcGpyg0rxwBe4iWLi/iUiMhsR90V
	 60NFrVCXfrZHg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/2] drm/msm/dpu: two fixes for kerneldocs
Date: Thu, 06 Mar 2025 10:22:28 +0200
Message-Id: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERbyWcC/x2MQQqAMAzAviI9W6ibTvAr4mFuVXtR2VCE4d8tH
 kNICmROwhmGqkDiW7Icu0JTVxA2v6+MEpXBkOnIksN4XrjIg/EIGW1P5FozW8seNDkTq/t34/S
 +Hwy3iDteAAAA
X-Change-ID: 20250306-dpu-fix-docs-3700642b33ea
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=lumag@kernel.org;
 h=from:subject:message-id; bh=lqfVSt1q8Nv4x662WSVSo/wapty2VM77sNt4P9YbEes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyVtHx812qfFzzxfAi5u9cmy/26pr4haA7+zFG
 yGbuTwDqVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8lbRwAKCRCLPIo+Aiko
 1cBQCACJHtvEqKcWqxwsJtEvCMDDIVKtK6UH56HMXMtNDT2eosYBRosXkr2UmngSyu/xUF46zur
 9gQ3R4vvKJOQuEPi2qvA6BaFkf9kIHs8dZks5LCdMnA75yGdRGDk5XDea+/44IYqiAuy1Ud/rTS
 KXWog5nBigD7bUJd/nbi8cAaQfurTcQ2JDyRryhhPN0OfSOehz/43zWLxpZB1SKks6hwXje4/c0
 twdfgY/pL0GPxyqsBRYBorTV3EsXMf+Tmzyzbi2QbAX3GeaT/xKCbga7EeUdflwJ25C2gx91Cnx
 ekExEDPsA8+cmij5opfvM8fmpuxyi2dhvpVNNa5zImpfFJJu
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      drm/msm/dpu: correct struct dpu_encoder_virt docs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
change-id: 20250306-dpu-fix-docs-3700642b33ea

Best regards,
-- 
Dmitry Baryshkov <lumag@kernel.org>


