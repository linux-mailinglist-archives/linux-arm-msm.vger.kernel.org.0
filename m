Return-Path: <linux-arm-msm+bounces-52910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5CA772DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 04:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 834397A22B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 02:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C1D1552FA;
	Tue,  1 Apr 2025 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpWpoBBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928135966;
	Tue,  1 Apr 2025 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743476270; cv=none; b=dn8uc7hBwCEjbiM3P+Qc1IxRWxARHo8dGQn1p1OVMY0vw+T0SPBVAkYHTRqIMpik3lUg0hbeitkey40ewCEGrGukNWXYqfi8Uk5HTeccxPOCaNOLENKw4lLn7ZvxpkiQAMpt2AzlZxGTUjSU/kcFKXGDo6WTly9MtXiEV6T0/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743476270; c=relaxed/simple;
	bh=CHUCvgrP+9ogl9HURA2isHsZTeEqq4WiC8nrNZ8lhVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Is5jRk70101QtJjJO6wHkPPMYBewhhEHX0XtpbyTnZks9WPJ6QE2LZAV+0a/TpkOZn5hwn7jSHx5HGI020rP488Tm4vFdb8pgHhAsU7NUdYfCwgHcP2SZdvbhCRhZr4mgKxhJ2G6CMrdJrDxu/p8aedQSfJZ0/wXF1UHXauZyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpWpoBBk; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2254e0b4b79so130699095ad.2;
        Mon, 31 Mar 2025 19:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743476268; x=1744081068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7K/MRcRKPLOmFhBSAVzlJRL1mdc1WpbjpwfueJr4+Qk=;
        b=IpWpoBBkj3gJLuxAsJs2RxZ7cFDb1vD/viCVtbtdCgjy5xDD30RasR1l4NGIXk3sbA
         1DeOP987EaijpncXkbox4O3LibVODK0knMBtrOQcNkwY17W7UIL3FQ0kKioI+AhrAhFV
         SDxJaE1cMMhUurHnN4dLd2ERAfr+ODgnbA90objxeaxi4JlS8GZ2lba8I2DUCp58BAmd
         A5bzy2sRj0p6E10R03PYeXcjfsoRb1Dnoc99XJ8b6tJRaZle7fZpyRcsYB9PbuhzZWuz
         aEg3qJxXQQMeEhukb6Cc2Sn6kh32hcXdir4Og4SZZOUhGEz4zif4IGyf5BgBrn61qmls
         +Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743476268; x=1744081068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K/MRcRKPLOmFhBSAVzlJRL1mdc1WpbjpwfueJr4+Qk=;
        b=LlrHLEXFS/h+x5vU5AyQQDwNQnu6bz8+e/jzCDQxqtZVZe/maLmKdhwydGO+gnQvQ1
         0Cw54OwQUVON0H/MMEFAv15IcrdFwpds8ZWcueKXkAEdRYzZ/6av2yknIAEfV96lmeAr
         Dkq3+WOCesTTSKW7wE/ORLmdNEGd0NQDz5FqKmd3aIRksNZDMHTjaAZ7Xdgq+KcA+gro
         6y2H/Gnwil2LTr+l+j5j84Ob+NJ3A1dOp75CWmWepNejqAx7TOXwDNCACRpc3BsVPfRW
         xz7/y+cdzD2Rp5f+3GN5vVoY5FR0wWUgeELcSBz4kytyToZcKfmDl/HtQpxe+qW+lIu1
         tO5g==
X-Forwarded-Encrypted: i=1; AJvYcCUih0oSGAtQpSTvtnTIn7yflHjWqZ2cuAy932fUycdiV8svaJQ/JUZqEUVgW9clWVvh72oHkE3rV1PYhw==@vger.kernel.org, AJvYcCWTeoNSSv/FCHsKoenSFs+tAXzRWBwyoFKT1BAa0T1iXoeGTUpFc4FUfG64NoATH0Vzcm5GxjKByDDMd42m@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh0UCRrjYzdhMnLGFy7r0GJWgqbVxJ87TRG9JswDxsqy5P8SR
	1bLeZNUV3z6bEbBhJoDK93CL7YSSJEmwuvdBLp1WNcq8nJCudrFY
X-Gm-Gg: ASbGnctIG8WJp2TTNpiwGRMF3pTd0XefNacA6I+cP+ul1TW7Bnk9EEzJ0wVpYjKNw9D
	OJ1AhirugFKqPLRg8DEXWOTQJxUrSr956AmWg+lhrpaTs2vb5qn9R8/Zv0HdUCe75YllltL/AgV
	DZxH7Xyy5YMVQRs3u4/8rjuM9NRedgDvHLfWeAPKdIHNtORol6KN39QZtrTjqv2ENjNtQqm4jol
	XnW6lSwVTqeCR4mUlD6QaGTdBbXc0XmohxAALXNzlmNURI3Uw1Buq5BHby/AFMj/W5ofms1UG1a
	puuhqEqa4KYhfovTjxHxO1vhNPh4vYzjERDXkKk9VFcGcs5g6uTlYopqtn85blWPqRBeSkk=
X-Google-Smtp-Source: AGHT+IEjjmQRwbIrRjd0tFrbPz03cyNs3GgrsNuPX67Kbs2Wc+zU6hosOUnYOnmchj6ngZc6iNNlCw==
X-Received: by 2002:a05:6a21:920d:b0:1f5:84c8:5d03 with SMTP id adf61e73a8af0-2009f5ba5c5mr20479746637.3.1743476268430;
        Mon, 31 Mar 2025 19:57:48 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deefa8sm7804425b3a.31.2025.03.31.19.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 19:57:47 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 10:57:37 +0800
Message-Id: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
wled_configure() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Correct commit meessage and confirm this patch has considered
resource cleanup to avoid any subsequent issues, ensuring that errors
are handled properly and no resources are left in an inconsistent
state.
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1


