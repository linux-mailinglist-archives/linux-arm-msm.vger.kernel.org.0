Return-Path: <linux-arm-msm+bounces-13758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D78771D6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1941F215F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAD64436B;
	Sat,  9 Mar 2024 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzOzTxmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E644365
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996951; cv=none; b=Dl06Lej1t14G2EZFRPtxlGfJ/leJDgx4wKxkVLt6nB8Asu1+E+8YOyd8cmAGsAjCoeVdWhEgM+PKqbuT0P1qa2Yc747V1Jpz8GEu3MabysKPcaXpZm3l17D4MsmX3FFrZBNDtoZvQeXqffT29OWtvjD+OwTJKq8nO/cP6pf4nDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996951; c=relaxed/simple;
	bh=TCJyDJHulubow8UZZZPWkWBavBy/rH3xyYFqzk9GND4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y1Dh2KemU79VWxyQOdoxMkoVCR+idg6eD0rEE3tNOm5Jm7OwDz2bUp3KByT7MKXtpQ7gsnio38WQRwL+KkFEPK2oqjn4VrbX86Y/VLnpognUvyY9z/Xxlt9MEKkiHJ3HcOcDpGoppgAc67GJTUlzu4To62XWY6PohTtEpFT7uAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzOzTxmV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d40fe2181dso21083921fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996948; x=1710601748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrNsYekci5CYEjDTgEQhnAxlRrrD/1mcwKaN+sZjKnc=;
        b=kzOzTxmVDuPskgH+jASmiKUIie2FoyfLWb991GfuJm4dQT24ts2V64Qfb1tFvqGZPA
         XCguAvXFkl887mvM0JbMn3RlW9AiawKwy61vfhkKe4f/V4aMykv2jcs+p10EIoMeDsma
         bvbum1WjRR2MF9jIiGhr+aPUk+Sq2hmIbfnVoHnLX2Cyz4e2/G207T+odAV7D4p5eqn/
         fmcfXkF3IpNrAUsWC8pV6T6vv6N/afjP/SAd8/JWaCONTOlpE8/m4iJCH+9qbMsLcibh
         BAiAiGdGMJJHWbXjUQgqcBPOVwz3f6sQr2fN8ip95ZiTFCzt2jdRZNptPVeBBQ/3y+ma
         qmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996948; x=1710601748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrNsYekci5CYEjDTgEQhnAxlRrrD/1mcwKaN+sZjKnc=;
        b=xPMJ5ffZFzhZqpAmnSN/LOzKo7NnvfbAg72CGRGatOgUh533xKXyTOY18uvfbA4ono
         /I3eO1nJe0eJvchCo+nzdmR7xia6KowxEgQCcNrKlKgfxMHeQgK/CTOdMYBbvRpkTLyz
         c9uX/fnnrd0cKPKWwr2azXYvsMYJ5Y0a/kxwkDNKvZkWfh300txv+fHKI2zr2f9Gusio
         T8qOUe6tuKqw06FVfRlWeQfZB7ktOKwKT7gXWbeHgYXnukpJHg61dH9PqS628LRJNWh6
         BbVGPuj8CS97qkTXpPA2sleIiPC+qWRzM4A3WnqEacDwNXeXa2PfW5o9KPwueMHY8zle
         i/Wg==
X-Gm-Message-State: AOJu0YxO09CCF6Z0AHUAgVoEQxrZ9k6JeMqQRy9G41DAWtpa4+E5eyRS
	bSgS9ZdNz4Hsmu5CNsXAzuD10TZsw308MpSzm2Gnk27N+cOex4cD1ikVltKnAF8=
X-Google-Smtp-Source: AGHT+IHvRBgYgZ//RQt2vAgiHNTLu3ncmyojF3L+YMiUCRElmdKSMqu7wJDelxowfAyxLdtXB5EmQQ==
X-Received: by 2002:a2e:a30f:0:b0:2d4:2b0a:7ace with SMTP id l15-20020a2ea30f000000b002d42b0a7acemr892884lje.37.1709996947928;
        Sat, 09 Mar 2024 07:09:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:09:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dsi: rework drm_connector instantiation
Date: Sat, 09 Mar 2024 17:09:04 +0200
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJB77GUC/x3MPQqAMAxA4atIZgP9c9CriIM2UQNSpUERxLtbH
 L/hvQeUs7BCVz2Q+RKVPRXYuoK4jmlhFCoGZ1ww3rQ4E5IKxo3HdB44ZaGFFZ2jhqKN1gcLJT4
 yz3L/43543w8rr3teaAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TCJyDJHulubow8UZZZPWkWBavBy/rH3xyYFqzk9GND4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSyTk+2g3RwzE5e5s/iqeIFPp6kazGi0Wqn
 9fQ9vUfKbyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1eDbB/9ocFnN4oYGbkjz6af6h0Sbe7G6r0NozB6/2jNnKjmuzPwSm0uqOkGvi1+gy3QAEIHVEJN
 F3PWZ0rU3yeTaEbP7Lz5RnEuZL6tA+CvN4o3VA9dNB+sh6s7RF1H1kzy/dEMW1WzK68Me/PqjqZ
 8Lqat3hiwiPpKIz/WoCPKmm/aVQwGu13xN3OQEg7Gjz2UUSsRRgcFQmrtLR8ZbCgTVLhiOZCNBl
 +DvEXqPhjg9D0/nj8WJGm8jTKJA5p0HrLVeTZCZghy9ozd8+mAtdcCiJUdD7kE6UybWgPE0XVHh
 Ls64h7kyULsP9y0gR8A8FppTnVO+APdO+X6gJ6i/qH8Z/1kx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

- Drop attempts to call drm_bridge_attach with 0 flags, require that
  downstream bridges support DRM_BRIDGE_ATTACH_NO_CONNECTOR

- Acquire next bridge during dsi_bind, making sure that it doesn't cause
  -EPROBE_DEFER later during modeset_init.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm/dsi: remove the drm_bridge_attach fallback
      drm/msm/dsi: move next bridge acquisition to dsi_bind
      drm/msm/dsi: simplify connector creation

 drivers/gpu/drm/msm/dsi/dsi.c         | 26 ++++++++----
 drivers/gpu/drm/msm/dsi/dsi.h         |  7 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 79 ++++++++++++-----------------------
 3 files changed, 48 insertions(+), 64 deletions(-)
---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240309-fd-dsi-cleanup-bridges-22d5dc1c1341

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


