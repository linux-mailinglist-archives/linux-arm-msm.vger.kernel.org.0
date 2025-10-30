Return-Path: <linux-arm-msm+bounces-79569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE8C1E90D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C03A4E06D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1123926B2C8;
	Thu, 30 Oct 2025 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYXNZEWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55C1C5F10
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761805914; cv=none; b=Uoj7R8LvKQSGAp5rmrpWbQ3y/alSwaXmW8ky7jCZuf4a0voUCKFnb0sbBxtqefGv/Orha064d5ytcU23O3Vy9rRAM9PpsrD6wKMTPTzIEEHnrW2IdS161d2gBVaKDS94u1eQHZUcc/cFQK54oQf/1lPlZjviTwBWFlVDN51CFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761805914; c=relaxed/simple;
	bh=EvEXTz0KOxz6r+4dee3gAhObDEZ9RzGv4u6rNYbYStE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hCHdXqoDbtFal5WX/qj+PFmwlQ1NrgvdHwJ91wPzagTnuTskYmGmnEzMwQOIJgKcTpy7d6GWErTmJ7MK8jfA7SS9WrWkMmQd0oy4qei5L0beGB1FSnfyl8ssBD38TfY12iwpk1Fs2zWH+dRRzQP+cGenyRzm1+NWWq8P4ayLKjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYXNZEWP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-79af647cef2so717458b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761805912; x=1762410712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
        b=lYXNZEWPQraeOzIeTVwCFgh6o5YTNq80RGG4/gq7uj8JddmmstXd8U+mguhWFGk8co
         rCv59mC+2iIJNI6LRsFbHVKXOZNNkFUcaKsbiipN6yaQhqquD3WVtrc4SFpW+W3ggGx9
         41lAXBRok5aK7YElkCPQSf+FKYEeCPQpDKBfG8iBtkUFdhCXMRko04k2xVrudPs8IZn5
         2OUtVGJ5Ay04EEqplI31FiJtA7J0pVp0XP2vfUr8HoKHZDQ2tfbRn9E/RgwcKUIUjvgt
         FSiREuPyfdNnDp2DPhPXF8/e0mdMSUZTPrdOiJKmauPHn4/pkq1DkKMQnEP/Thgwb7gu
         XJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761805912; x=1762410712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
        b=sGx1wagOHlORyACL3Mc2G+j1wGkT5WnxwTCdfHKv9juhGGC8DDvF5mdEZczsY6rz1X
         N62Wnmym4Maj4ZuYqIF23pb7D/66B5uyVuFTfuo8ioY4RkesGyO8PiN/kznc697PZK/G
         l7NrxTvqdylUjk+PtZP8plKJix++2WiHqV6yEYhCdIdy0UR7MXVu5qV1DCyl5unF65hg
         wU3WhiYK5QPIIO7qdBB6AGYwqDeiKuw+VQcNgUJvDNaINaRmDGABSVWifk57A6eGZOAQ
         3t4vZYA42zcw96IGTqZE4VBQvYa4hK3jgaG0WFsefmkLA7mBekTPpi/0jJiuv3m2TlIb
         YeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvjXShSBaDOBQTQmBob9rMsCxOGspyfM9X+kzI/kKyX2GNddW61rRhYhBJDflP2nqpVYSMbIVNr8MbVHLv@vger.kernel.org
X-Gm-Message-State: AOJu0YzQC78iTJozTdwVRGvO8YdpxhR0mi6Cp3o4G79ZAXZDghO7mMI8
	+mPvpmALu8DNgh05QSsqubjJF3ag8v1uT5mJUURTvDeKZl2EN2HotpvS
X-Gm-Gg: ASbGncuKmtAYUKGS3Wkry5ird8y4Mif2nFjKaNq/2z2f1I9cXyNcLVL4tmEtznt/Hqu
	inj5lu2OBj4Nv187SXPRTDI3Dx1uG8AKRYPNh0rVLVvtnD280XOzBlfoD8IuLKIELBDa+7cKZPv
	rxGuRHehHiMMmy4qeEDDjkokH5l5XdIO0PHSpmWA9rd2FdqximlMGMhD/bZ82OUZhil6qn9j/l0
	vwR7wkFX9UzdC9PXCZZv5FKXaEk2+c8H/IXnJ6xnHJiIrmUKHTxhuVwSYt2YimNXqBt1o1UxYRv
	iudEKc4tBEAxNFO5bBEdPYyDh9AqfJKA6UpaR5bOFUiyJTsGDxoq7d2buJiPzvPl1TUiF/9ZNTN
	nQr29dDfjZiUrbXD5H4fAaGipAERN1Lg+qHUUAvAReDLNZ3lcZn5xqs8q8XIfQQkVvlY4drOrpE
	6EcoBCcpdCMN+oh26NkIEe9oeJkZVC8Jv8DkmeE4DdIVhQXtBKob3Jzco=
X-Google-Smtp-Source: AGHT+IHNvKCn04TUtBKiitaic4J2q30Yzc+qOqNpAkIf4/fyYDmwz0RWuqOmy8D+jYX31HnPUWKBbQ==
X-Received: by 2002:a05:6a00:2e23:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-7a62a361761mr2569135b3a.4.1761805911695;
        Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
Received: from stravinsky.localdomain (ip72-203-100-4.oc.oc.cox.net. [72.203.100.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm17200296b3a.35.2025.10.29.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
From: Jessica Zhang <jesszhan0024@gmail.com>
Date: Wed, 29 Oct 2025 23:31:45 -0700
Subject: [PATCH] mailmap: Update Jessica Zhang's email address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFAGA2kC/x2MQQqAIBAAvyJ7TlDTkL4SHcS2WkgThQjEvycdZ
 2CmQsFMWGBmFTI+VOiOHeTAwJ8uHshp6wxKKCOFsjw4uoJLfKeXG6FH7Y22Vk7Qi5Sx6/+2rK1
 9ezZC/V0AAAA=
X-Change-ID: 20251028-mailmap-fix-50434c548816
To: neil.armstrong@linaro.org, lumag@kernel.org, 
 robin.clark@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15-dev-509f5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761805910; l=1226;
 i=jesszhan0024@gmail.com; s=20251028; h=from:subject:message-id;
 bh=EvEXTz0KOxz6r+4dee3gAhObDEZ9RzGv4u6rNYbYStE=;
 b=4AiNnU52GcTLFxFVrVFNRtBIYgDMcsTe1X5gNVFGem6rW0dpFbRAMuLF/g8ZuCZZ4pAV7ZETd
 /Cm12ZhzY7PD6ExKeMtG+CG5/e/RDBmWXFODJU9FyALDeZ1gLr62emS
X-Developer-Key: i=jesszhan0024@gmail.com; a=ed25519;
 pk=Qjsztzh+H8Xz0uqVst7N2PHX5Vnd3JXONpkaTHqk/Pk=

Update mailmap to point to my current address

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
---
 .mailmap | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..1c57bd649f04 100644
--- a/.mailmap
+++ b/.mailmap
@@ -352,7 +352,9 @@ Jesper Dangaard Brouer <hawk@kernel.org> <hawk@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <jbrouer@redhat.com>
 Jesper Dangaard Brouer <hawk@kernel.org> <jdb@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <netoptimizer@brouer.com>
-Jessica Zhang <quic_jesszhan@quicinc.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
+Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251028-mailmap-fix-50434c548816

Best regards,
--  
Jessica Zhang <jesszhan0024@gmail.com>


