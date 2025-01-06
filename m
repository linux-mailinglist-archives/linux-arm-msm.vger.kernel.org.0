Return-Path: <linux-arm-msm+bounces-43973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44BA02110
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2901F163739
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53390150994;
	Mon,  6 Jan 2025 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRnhl2IM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7979CD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153357; cv=none; b=PgzUIFi3XYtzx9AyIMjCh2xunh/Yj0I7OwwqJzp1Sn/+LbGMqiwlukEhaUkLsVGNSwEUMAqPPo1LP0VHpCJCeQJm7PCH/9pHxjr5U6kd81btnT6E6uiZn/dpMkUQOuo5BXMGJIvmmlcqnlqUBQjFhQV3Trj2PY/dbhDGf8BEANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153357; c=relaxed/simple;
	bh=jJ0wJpIPs8hLuHKhmqokUten+IFN/Sb20GIBd4RQIqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPT8bmTgUB802t6UwceepX3qA6m5HqHnrUfmjp50ZdFdVmA2Y+x8r/oYa/6Rk91cnxGYgDTenx6LsJNum+MRou82eiRDlVuSWstYmssQYVGn6wmJJdQJi2wl+jHJ2yioDjiB4DJlEd5FhCwOXtRw0PmLXDrFjE45805XK2u1Ch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WRnhl2IM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa659775dd5so179249266b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736153354; x=1736758154; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPpDYH069+mLjs5dlTYIpCA8LfABO5kO0Ny/8N1lhyI=;
        b=WRnhl2IMNjks7KICaWU3JpaS+QwU24hT5tm7RaUH+oq38TeAkWSB9i3r7pT6m16YMm
         iAcS2lLSS+8eiZvKqTqzfzGLfdSwIINJ81fKShSTx7U2L+qRI+/3Tn9su+tBQn9ahXzw
         vfk3w688VpgsjgKF/4yvYdyx5H8qlCG0rOPGqYZC4rTTIAfnX5sGPGi7BrnPUWiVDqCf
         Eb5ESRBWHhW+fYZIWJ86N1YvnLaFyJ7A9Ee97XJqZeNsDX6PhiepGG33Cs8CAlp61x7C
         x2A/Dl+ORK4a8hDenSSq0lKxplaU6tNVl0g1Va1VsgCAfagDl74xhB9BxwIWL6eiyVnO
         JEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153354; x=1736758154;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPpDYH069+mLjs5dlTYIpCA8LfABO5kO0Ny/8N1lhyI=;
        b=L01cB2Wp9/N5ITLzD6wpEbmAes1vsY1Hxz1HHzjCQWKtmXaVIRKAhWwKTnJ2FXy/Rb
         6kMfYoov3QxmtqY2DTQkLIMd2TnUNKqSXTqhGT8O/RI/JauKixmHOJ1Su28dnl0LDj1o
         1GPT27EucuMuq0TsqxGmxhTYc2knNh+Am0jPDDtZiCc8vhKXPjCLcUVidfbyy4aH+LRs
         tbrPeOreg/ROTxgP3iI7Nrp6R/6gxcGQ9r2qpSsNljQKd4oD3lNMD0t3GePW9eiuI/Q0
         a+7Id25foZlxoHbhWes9Tclv4/9bOiLhcEkyBM71DxZj3+vjsykK9VL7GUh2a5tSvkKb
         f4Hg==
X-Gm-Message-State: AOJu0YxStzghb1lx9hORmK3t+NXuuN7jA09GaOXbQut4IsaG3kdBdIyd
	NUrEk+tJHKVfSZcfSXZMOr5bkAWBt4+Dex3WK4/NApXK2Le1n7OraRZQYwd5wfX5aJPc893Cu4H
	L
X-Gm-Gg: ASbGncv5sf9xUm8VLltX2X2Krv2qWsVMcXNvicKjpGVqet5BIZe415kAXnfQbdY/2tQ
	pVkpK+x2NhlamrS44jVKHTvTrZ7ZtKdBssC267sHdqK/53n5EBI/S46KAxhEtele2QYj++9NEQG
	nO29cmnTFIKmQelgYazPIPlk7EhSiA0tqsiy1iQrUmfAXbQ4aakuE7PMMPA75Rvn8wjmJPkLLH5
	xqE+uGDmmiweYR5A5F5c9NvhWffU8yFUakCsL560wVzWj1o05OYgvglvEAL18y4hGtp6bXn
X-Google-Smtp-Source: AGHT+IFjMVJDC2pUOc/2UmfzGQilpfciPMIJtnCCIHibu6sgvl6484mJOSWCipkTs5ubhvfGq4Pvcw==
X-Received: by 2002:a17:906:f5aa:b0:aa6:6792:8bce with SMTP id a640c23a62f3a-aac27430f12mr1975175966b.3.1736153353609;
        Mon, 06 Jan 2025 00:49:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:49:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Date: Mon, 06 Jan 2025 09:49:03 +0100
Message-Id: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+Ye2cC/x3MQQqAIBBA0avErBvQohZdJVqYjjWQJg5FIN09a
 fkW/xcQykwCU1Mg083CZ6zQbQN2N3EjZFcNneoGpdWILgcMEtAeZOKVBJ0z1mtv+9UMULOUyfP
 zL+flfT+zZw1pYgAAAA==
X-Change-ID: 20250106-drm-msm-cleanups-ddacf1fc3ba5
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jJ0wJpIPs8hLuHKhmqokUten+IFN/Sb20GIBd4RQIqo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kBW0Mgbz44xhCZqTLkM3ZzGvvWdyDivUDtT
 DyxwFWSdjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZAQAKCRDBN2bmhouD
 14HHD/9SIqdiE2MxGLRuE4kcCfJEtxho69Z44obXWV+ZOsfkBPNIzPLD3jrsh6GSCu9xIwtgiKm
 XplBofIsm4/I84hhQXLCsJgWFVtAzLwk73azOEvdVBiM1DVKXXFfwBnLlPVU+vdnnUGlbaxlQXP
 yCT/DsSRd+v7gZcNyK4Pdv9abQhnhY3vSmwD50oKYsH2DlED/vBdtM8Dt8yG0gS+pCm2/CyCbjY
 jvHwun1yUSr7Pzha7k9sgz29lP9dqH/3AlbJiJTlRLVwnVCm7dfnBKAKHaqHC5vgIcAPN9D7wjN
 qr0pzAg5c1YOZk7A782ewZklGIYewiIkzQvuA5E5dKibI3ZQaafx08/ucCqxhEHMc4x9WKVrzqU
 6TM+r7SW8g21ydp+ZZam2/dT+AsqPtWU4i+7MYIZOa21FKxG0UiUBICbadEoDPNbtFuKlzqTKWK
 abDn3p5gtrfQ+IHXRdRbX+qVCNItURI+hJxKRoBTjOtwuLEN5tQi+ZQf12FEuYSUxbwHjitabeB
 MSneU/pUNjrw04rlwF9tlxl1Mjdjj+5JQTugBd3iVdzEZ85TO+eFnJ1LnFnEe6mOe6tyeUA5NtJ
 jVqip4WCFThrpuO2DwSO0GdsVl9LJdrc7lAQ4CDD7uY8IMW3Cmx7v/qs+cz0lz+eRKVCW1WHRxF
 wNqEa376oYlK6vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few minor improvements/cleanups why browsing the code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message

 drivers/gpu/drm/msm/dsi/dsi_host.c | 158 ++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 90 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250106-drm-msm-cleanups-ddacf1fc3ba5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


