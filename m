Return-Path: <linux-arm-msm+bounces-83815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27924C935FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CD19348799
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 01:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A201D5147;
	Sat, 29 Nov 2025 01:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqMIbBQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617811A073F
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379937; cv=none; b=Yb7L5cPJQ4okAnCrI2Rlk8Rr7VDi3PfHHvDUIjur5KhANG/MirrWg4V2ExcyMGntsclMPIEAlCoeJVtcDaOzcsX2LcMfWSE0vxr5Tqxv9jShETp+gOunsF5jEg02NK+2ClX82uidGFywTNkHJel9lUlYN3iM7bw/dYD/IZc7oPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379937; c=relaxed/simple;
	bh=1DBjwwtxbwHCZ5ogS6Re1/jqGYTszurmDpgJz6MaIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqqYj3kGtJ2GvJSNqrCUB1/G3Yb2QAYNgSi17kdyXg4YbkOc327Z1ZXEYp/Hf023iRp4vm/QvY4EqzscWEmP/5w91gFWpgb3J/fJn0qtOZHbJTSoGg/VuYiS+0IpsJ3ACz802mfYm5GNk5rW4I1uT/N7xs5YLqePwFCk3p0b/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqMIbBQ4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c77fc7c11bso1823587a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764379935; x=1764984735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0mYQHmNWcFRHmOFCOrthzYDE4ZUrec2+cQ3emqr7fM=;
        b=SqMIbBQ4TDAYDEx0miNwJi4hkpuMWenZdxDAPwSrGK1IUmlbdtd0KBuFpzFY0dahZV
         MHVaw5tPMD28D3Qjg6DidG2LXXhvqjJXoDNOAwGCRmkBuy8eFmE1VhQpcj2UokLd4IDv
         Iw9+5xSkY61OipCtfFOqRQpzsp3y+UxP5MDUyo5TecoLERHJtLA4a5EhUWnrS62Km2Fy
         SY43v7p/YtNhltnUu0KPH32Tx0nYVnmsU7FD3cI9zrpAvTL6iZpt7ygSLpDQU3wTeu83
         n+EfNW3PCzVm7KbP0sXJmjNwzGFFKxUwRZ0RKwamC013t1tj6tB/FrQA1Cwt6LYSPvjX
         zNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379935; x=1764984735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h0mYQHmNWcFRHmOFCOrthzYDE4ZUrec2+cQ3emqr7fM=;
        b=IGc7R4FHOEzk0uzea53dyDjAdZxZLIapmIAp4DfeMMzL/Ohnn9yKBm9jHwoB4pUoN9
         4UVR4wejwlisv65Uia/0yo5RQ8c+PU4Enk/LJ6eEDvIwuC40ZiQZVxRB9lKtiZWyrcar
         g4CGLkBy1/8RgtGItJeHMy9o5xjsUXPOHCAZvgNrFNxfgHhVemqlvWQM3REFPseijjAu
         J0j1fT+bzq/3S2bkyTUqB078lbbf4TxzHDaRWF7qLTJRslRnevhKL3txSAxAgbJOyHS/
         mxcuxQ+rmYt2U96jhCGfpXAgyGW7YwOMb/SFYle+V0bksLLtUxZt/2ujyfg7i+dlyrjt
         yiiA==
X-Forwarded-Encrypted: i=1; AJvYcCUJiqtWSvOeZWe9JRK64NG/CK8FydEQbfudR+h29vL9l8eq+dqqyD1JNf7LTvPl36BXl+6H0YWooBG8A3MZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUv9wUwhbH+42fiEmjwJnEjfacFMVrTp5c+D5yYIFaN831WUx
	P1DC7ynikNkE3w51MCLEeoqZSJRFwFDQ3jq+82NJMyXL3pmPV5Rh6qIm
X-Gm-Gg: ASbGnct1O92+rBJQyRABoH/91nnU4KBbqHCOEOVnSW5HUu+6MyqeODOEozAeSZP2IKT
	P7NZovfD59qR8Z0ouyd0PcPyzmhNxb70iQDv4wEMvOigL9AfXetYq88pBqy6+F2NYfXrDfXjd3J
	DIjXSuqx65P0VZuGDXCQrJRmDlKTRkj01bJazUysKHvXVkb8VU+G/n+QlXjrQNq+nSPXy0QO5WG
	rtfQE1noYHgHy7YLa2k9ukkVqvJjnloBqB9Qa12VuNtanSzyehDBXyjXB+e97qaXxZ+oBOSmXGA
	DArwBiM2N7AyMwSKzMTm1RznDIfGGwgp1twh1UmI6myR03trTTMjcAnqNzX3d9w6MogSHE2pWBf
	5CdSn6YxngqJKkVvHLvnfkwr2zct3/BRYgZck9+d/bDe9UQ9KmxOqEdt/20fDynUkA5mdnpMeAg
	nOkiY44NgQE8icJfySC75yzR7aMRbIZRjjdLU5ctYO7qDwdbM7BH1jDFLpjjvYFF4dOGle+Og3e
	j778CwvFVjwClvICNRIwM/tt2KB
X-Google-Smtp-Source: AGHT+IFZhrwi1mgT+oIIEG1mNdR5hmsFiCRjEW+7oGAoAZo453TYTDwuHjWXPV//rP6zKJgiAHoQaw==
X-Received: by 2002:a05:6830:6e23:b0:7c7:5ef4:a52b with SMTP id 46e09a7af769-7c78eafefdamr15136420a34.9.1764379935523;
        Fri, 28 Nov 2025 17:32:15 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fcedce6sm2188742a34.16.2025.11.28.17.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:32:15 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for wcss_q6_bcr_reset
Date: Fri, 28 Nov 2025 19:32:06 -0600
Message-ID: <20251129013207.3981517-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
devm_reset_control_get_optional_exclusive() for this reset so that
probe() does not fail on platforms where it is not used.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 23ec87827d4f8..6e28744ce3f75 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -811,7 +811,8 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		}
 	}
 
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
+	wcss->wcss_q6_bcr_reset = devm_reset_control_get_optional_exclusive(dev,
+							"wcss_q6_bcr_reset");
 	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
 		return PTR_ERR(wcss->wcss_q6_bcr_reset);
-- 
2.45.1


