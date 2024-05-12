Return-Path: <linux-arm-msm+bounces-19755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2B8C3526
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 07:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472DD1F214D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 05:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47A2DDC0;
	Sun, 12 May 2024 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb5JcA0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36331848A;
	Sun, 12 May 2024 05:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715493035; cv=none; b=BA+HeWUytolf9pNXDe00Q2QVslNaQltCNku7emYj+3pSPpxwbbqeeX5RaGYROkMFMot91V9+UqxeILx4eLnVPUyHQ00QXyrs0BBFAAAyh6CwiIr+TdcY+JUH772rlrii3FnigVAMKafoMqT63zuNQ9H5ibkaxph85kBdHrB3Vb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715493035; c=relaxed/simple;
	bh=czuivthniXq3sVg2Xn9Ls6Qs0i3TnTjaQST9KemSo2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e6TKKUUuxwoIAC3sC5djjpIG1e6D9WCq83Ab8o94J7UpwesNJwt+xe2iNmy5IUEtRVvk39JK36cahE+JzVNun/0brBKZadcvtMIqUUqEOP75WNN0XTnk2uQopXVF1JTGFeyECD6Q4WmM0w+M/jjZZuNTaSM3tpw98bVveScdpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb5JcA0r; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34d99ec52e1so2631142f8f.3;
        Sat, 11 May 2024 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715493032; x=1716097832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gohhoHpvy9QQHX1FItVd+i6i5nE/fS3cmezBpj5puFQ=;
        b=Qb5JcA0rGTb6IqBsoE5usG0dleElTXSgMbF5oJXIl5Evp2X1iztBp01bfEOkiihdm3
         OJR9lWVNw4llcZN8BZ9jU1+WSiFQSfCqJ25NUUTs+1wgO6kNk3596OZ9cT/I7kPTQN+3
         CP6CKZzx0hmZVZTycBh7ai9iEz1dax6FaSn3vkH/NmwGpOd0zr2di7nWDKl8MOzV7M0w
         xmTxNdXcH37h2xiBGvXEkizlIahfXiRljSH2xJLDFwXYiGb8bG0tlrm3JQXBC/tLYtK5
         C6Un57e4iTF8FQHs0Mot78FcsY2W3e5msLYUhXOYGfDi8PWsdOOLPjMz+ADijvUPtxlw
         IC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715493032; x=1716097832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gohhoHpvy9QQHX1FItVd+i6i5nE/fS3cmezBpj5puFQ=;
        b=SSsRM3q2gSfel7ezbuYwVf+jqxeFUuH3Ud6CrDfRcslu+xyr8OZzp+6HVWeIMgkHdH
         68IUMR860vGX97i2lW+W/M7M2xgRPfpJeEaI2MIuknRENnp3JRsoQkXH5qUOlTFJ/qVB
         NUrcdE6r0Kl7OBsNBZW/NHOYGRJiytMVcJA5Cu+o73ui7CGa7Y7ASDn0hKKQQFBMSwSK
         q9atjhi/br2QNWiQwTidMHcQkuCVglOTZ+09msg7iDMThJAFtj/19l/NpPSSOqm70F5k
         TYHKtTeW8hFPdHtU9THVySbGISMZ+wdfWIGNluW548PDqjef23pnr57cZrKtr/ehUFr/
         Ud4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaBpha3Ae0fZ+NKfgDRMYdMzY6450SsawU/XFlwwzFuwUxDNxPZGkZFyRbZOyzCthOLHSa1dITbNp4pvXAI3dJjTienpwzGvFdE7IM
X-Gm-Message-State: AOJu0YzyZ4k+npbK83cAihLGW7dfBbzLJCQhdm97oceI26YQthhPswNn
	P+TpM5EQhNqJAwfWLt0UabphBZ40LBfsGuXNsnEorH2MFttZ/Nca
X-Google-Smtp-Source: AGHT+IGS7lY3xkP1YgSRUKU3N4sAoFEL/X/Mdy0wQoiOJGzB0jybLGnY/4sYF/u9S4jmIeU0CWvUrw==
X-Received: by 2002:a5d:6209:0:b0:34d:b75c:c7ec with SMTP id ffacd0b85a97d-3504a62ff0cmr4368127f8f.8.1715493032262;
        Sat, 11 May 2024 22:50:32 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 22:50:31 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH v3 0/2] drm/msm/a6xx: request memory region
Date: Sun, 12 May 2024 01:49:37 -0400
Message-Id: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFYQGYC/43NQQ6CMBAF0KuYrh3DTMFaV97DuIB2gCaWmtY0G
 sLdLaxcsvw/89/MInF0nMT1MIvI2SUXphLk8SDM2E4Dg7MlC6qorhpE8MlDayNPATz7EL8QeSg
 joM50aHRzOROKMn9F7t1no++PkkeX3uV8+5RxbXegGQHBKqlVpVDZmm6Db93zZIIXK5ppL0QF0
 r2UfU2sOq3/oWVZfiPwC18JAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=711;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=czuivthniXq3sVg2Xn9Ls6Qs0i3TnTjaQST9KemSo2w=;
 b=aaNsjtDTHT8Nd63JP7lgZQyW4HKsHKWJlmg6rj1ZQDn9uFrhxilviioxVtT0GWdqaC/76L+dG
 CRBhah5VAGFD0cMkeAZ4IEyeDGAqAaBoUdDYO+O2ZiuKe0Na+70CmW+
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v3:
- Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.

Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.

---
Kiarash Hajian (2):
      drm/msm/a6xx: request memory region
      drm/msm/a6xx: request memory region

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)
---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


