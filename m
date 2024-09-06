Return-Path: <linux-arm-msm+bounces-31069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89F96ED0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4231C22AE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA55156864;
	Fri,  6 Sep 2024 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ae7PY2sX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBD156677;
	Fri,  6 Sep 2024 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609713; cv=none; b=JroZ64TWefKX8mX1ld3KBd6VzkoXpiVIjjqd7yEXyR3syMi4nXMMEhpklub2gmOmRDzvwgF2nyAOtewpO1hBAlnsRMjgkFEq1kOuV1aMoVXlywVLi8um+Pxrm+U1gi8lMMP/hziFZSaVYdB0hPoorDq4Bef7DVsmA3O9EDFxiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609713; c=relaxed/simple;
	bh=A73/f2cF8wsLXqf9u1MYyL/XHsVItL+vlFVV1EmpWV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5q0+Q3eiD154BlfJJkechdpii9DJIG6ZT178nDxoo1LyAEpUM6/wbcuv/ri5qt8uhgJWLYmJGMd5SHlJaf2IifTBiMAptl1+ZpyRoDna6QQrVADkfRfeVyk7XpIuYNVwnvhHLlOLM1qWBM3QZMQ4e6VZ+1QDQFqav8BELfSpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ae7PY2sX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so17518605e9.3;
        Fri, 06 Sep 2024 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725609710; x=1726214510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkyikhZMpOT8gzw/xg+wgtlCLgPqat5O+1E0+bcDLIQ=;
        b=ae7PY2sXCaVmU3BNZrO9zOZ9/D3lDKTrnUo02pI8APKbEFgj59lccuEYsJbyKbE1GX
         A4EMt6IE+3+PeU4cK712tixlEervLx0NhgZVaQwW903YBrWqyzbgBXh/TrGwwDVtwhPc
         tUFDRcTYVTV5VhWDcOt+t3PeP8eWojC8FQirq6PYhcE+1kaTPtBzRo10jLAn5H3QcGN4
         ZZTsfdtwwEQsZkvLMEDu+3k9cUSaOZop3DedE8hypeeXte5WNN+dHL3vJFhJPn4GeO/M
         1+L+80oTkvru2YgRrKU3jJYQbSRButNep4fkHcQZuZWdH7HhK0Tv1P+LZnlBpKc0CcbG
         y1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609710; x=1726214510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkyikhZMpOT8gzw/xg+wgtlCLgPqat5O+1E0+bcDLIQ=;
        b=W/Rbl4+5c7qSBrBF4pz+BjnaP1PX+TkNv+kumsTUudo3Y3j44R2dvXaymK3EUfF0Hp
         2Qp6jU7DaeYZkoXUCnxI+Tpsy+9men9kSdeiyVKWaGnUHhgNpK6NJ9TsT9j7HsmTTHra
         w6F56sDrUnX54T25a6sJiCpDHo825K6325z363vilWjfzEZjh8sNFHOBofHkT1vUeHwI
         mYawuPWMwhUloCVfMmyow/PMsL7+Z0IvGZ0g//ZZrRrSCtndbmWuLSOEka7Ku/kJtpvF
         5XaulBtaSnFAiNPqI9k1xmTjStOcqBRfObKYZv0Cf4FiHzlpaVhLT5VtlMyzU+oMpBiv
         P9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+V2ZDJQmgynu7QLMb91dsZJOs6Q9AIgXgyNFeOkpb2xdFEZLu9KDmYK+uAzmwZJDh+XfPzXy/VE97Rjx2@vger.kernel.org, AJvYcCUQpTPjbzoJNe6of4/Ut8sKwCGF2sjkQ+8Mw7FjJy0kRAL0eHIudes24QZn+Qe1ecvGe60DPqycFzr7vEGc7So=@vger.kernel.org, AJvYcCVbSvCPkQzGqrf/AJmv5Vlpq7fkc7nh3d7LfCeNG1QwBH/sIsxYnOgOLOeF4S+8qCHbBggeotFPr1ki@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKtVeAlHc8ukZsokBRF36R6fD604bSshqtTMbbG7MRg1HTpyG
	HVptbD5iYZXpXPTZXArYLzyq7PQIbSHaXBYmI768FBdpMsilRT3A8gOsObyv
X-Google-Smtp-Source: AGHT+IE9zvSX1pGjBvhr0lwumfMe5aPctcurwZt1TsZp7JV2U5tLPlrVh/c7rhSvpwdty9ypTHJMZw==
X-Received: by 2002:a05:600c:510e:b0:426:545b:ec00 with SMTP id 5b1f17b1804b1-42c9f98b589mr14070935e9.19.1725609709052;
        Fri, 06 Sep 2024 01:01:49 -0700 (PDT)
Received: from void.void ([141.226.13.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c29bfsm11954555e9.5.2024.09.06.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:01:48 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] accel/qaic: Fix a typo
Date: Fri,  6 Sep 2024 11:00:59 +0300
Message-ID: <20240906080136.4423-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in documentation.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 Documentation/accel/qaic/qaic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..628bf2f7a416 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -93,7 +93,7 @@ commands (does not impact QAIC).
 uAPI
 ====
 
-QAIC creates an accel device per phsyical PCIe device. This accel device exists
+QAIC creates an accel device per physical PCIe device. This accel device exists
 for as long as the PCIe device is known to Linux.
 
 The PCIe device may not be in the state to accept requests from userspace at
-- 
2.46.0


