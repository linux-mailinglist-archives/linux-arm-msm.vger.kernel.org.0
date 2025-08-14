Return-Path: <linux-arm-msm+bounces-69092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0EB258BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 03:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B542188A0D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B3B155757;
	Thu, 14 Aug 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7xnWi5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5AA14386D;
	Thu, 14 Aug 2025 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755133198; cv=none; b=fvr8xHHVaRCn9zVsh335RcVy7/UmQs3jmb4H8/1N8dQwKFjALvArnLFYMlVx1TIxkyQC6rLwGzUAp/COjxDiaUVH982/hz9nXaUPCX+JIPNDTkPTipookGsSTyeDfc2I4zMf7IbTrgfaAzr7h60u7nc/HwqXozk5o/eD5CEnhNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755133198; c=relaxed/simple;
	bh=UDwjKU1e4eL4bXCo46QVOIuwnhA5vxkMIdaq8TOnBxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fb/ZbSB+mKshO4YUWqjeW/cghzMnCwaKv0G509sB2KIp0lckNEJjws0gaoAZ3YbgoQ50+4tptvmmSiaRY70k0VJZDR/VQ3XtjuI8zPQGLDDHCyIWB/r8C54o2ru5W6y7iWFxoZ63bgIxh2+DBZ/IjN6cMX8aINm8Wt0eVFNy0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7xnWi5v; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2e8e2d2dso308267b3a.1;
        Wed, 13 Aug 2025 17:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755133197; x=1755737997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av1Ijp3yREaOIIrOjE6hDH01SRduzURtend/0/9r/9w=;
        b=m7xnWi5vG1gvJBRxKzh/0M8NAls0Fh67abLyghIkV5mx3yQ8rvDjQYMm1CgU97rr4G
         AtokbRq4TyMHlL5x8D4LD90Fh+et8cNMwYQa/XFumFn5nF0+aOeZTNZtozD9BPPdwyix
         8II/pZYG3gZWcPkvpuQ8a8kmNUISxERgkMYrGIdVoCZQl3TsLmSy9bxSS9P2V+kd8KXP
         xg9H7pinqKKO2lPw1CffoFOj0cVqBjbP5Qx74xE3/YiR0Nr1AuTnEKRpO8IivS8AV7jz
         sjMxWajQeE2eFxZmJXNZEUXbnzuSOODMON3D9DjOp0rosv1pG8Se/idRtxYpSlJAW6o+
         b/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755133197; x=1755737997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Av1Ijp3yREaOIIrOjE6hDH01SRduzURtend/0/9r/9w=;
        b=eQv5h8+wJWqSP4wF8XOtOGnnbwxDjEKSOKNfOswx4KRzlCa2aryMtBjZyw3Jt0zwjK
         oN9BBJS7annGu9ToNC20Rmml5+rg7/h/EuL+FaR30ZICQDUjJxQpA1rctJZV0J0FTjUm
         VgZTjW5zSgPzLqbt66bRHot183sIy5n2B9+pfhOIbYLnyS9Ap0qElDpAunepc2gN8VW/
         /AdPaetWkx58zWp/J0DLEoj5LWZVCcEEIlpoL33fDbIdviwhO8fzgjo+IW3zCw+jeVUb
         oOjttCDdNNDJnPyvJ3gAugbAOpdzon8vS49xKGZf2vQMB/WhzaSY8tyG/PGf3c1jJ+dL
         81Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUCFDP2V/TKGjXOi7VUDJZYiO88crR1CqxHNZyqFMY2fk00+5QRZjsBG+cqR6dVeSQZgY3TNxaRUUfa@vger.kernel.org, AJvYcCVQeTBGSHT5r7ZO8n+/nMocV0L6RqMdVh4xQS8QFBDGSj86yi+LT0a0NnF4v+IZMh7vTfR1FNYnwub2WQ==@vger.kernel.org, AJvYcCVoGAGwHUoZNaY6wwMR7/2ndIxfCZHiKfNFBCVgHMG1uAzeUHty0Ki5QVduBChYlRgcrvm/wY3Pj66lWU/U@vger.kernel.org, AJvYcCXVjqbzxyra/qgK0bpNdJLXcxwKwxKw6zIutfRXIOrtrvYk4Bfxxf0F8B+iODJtL8OGXPXMAGMERXCjAao5DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAwxbSa74TKigtpl+BW9Yw9+wiSz62N/ONA/FPwnYtbCoRlnk
	HZe1mKNxbmSBFADCiGTita46Nz105pv+qzwr0Ws+NFgoJdkFAkZk/y1o
X-Gm-Gg: ASbGncuEd/3Ulo2IH+oo25KOc5JB34bvjDj7t0XAZGLaVhKApURDOwF5gKjvSEF1xMV
	/aVcrIx4X8DZZ2zxVFs9tzzEfFNnBTQ/rOvwZjfQ7MluWV7vP3or7JCCEynpAGsb8Bq3bdSBa4Z
	SrGUEy1gl5E2MLiLn0pAzrSqOfxUerGQbZnaqJq5DbHsdY5H/iQImuz0xb4xQyUMX+KINpjHpIp
	ad4fGWAzw/gH3BQoyhfKNfnhQw/pbZL1A7HYlKPDDyQX2n0Dd4KcuGpzfsVCaHk9qRpTPpVLtA0
	PkDJr3waj5Yre5Syp58A2u5vF2oZbkft00e9y2NrkEmNTCCGqT6kpDxpyEHNwoLWDRIPT/5VFrQ
	0A3lkijPy3Cz44JxUKs4kJLRSobefwSrERSbfxO1+qhHslKxcbccXXlm+vZMIS2PGPkgwWB5kjf
	X73EFF9QFF5SdHDyCnVYK14A==
X-Google-Smtp-Source: AGHT+IHw822HbCZdhcd9mDtB5qCrUoxERRHmeNwKz7oQV+bksDBgEr1QZ+027JGplWiK2+Z/VMIxXQ==
X-Received: by 2002:a05:6a00:4f8d:b0:730:9946:5973 with SMTP id d2e1a72fcca58-76e2f8a26f5mr1583329b3a.5.1755133196697;
        Wed, 13 Aug 2025 17:59:56 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([101.178.35.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm28875783b3a.1.2025.08.13.17.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 17:59:56 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: marcus@nazgul.ch,
	kirill@korins.ky,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	andersson@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH 1/3] dt-bindings: describe x1e80100 ufs
Date: Thu, 14 Aug 2025 10:59:02 +1000
Message-ID: <20250814005904.39173-2-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe dt-bindings entries for x1e80100 ufs device
Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml             | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index a58370a6a5d3..a5f115655235 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -45,6 +45,7 @@ properties:
           - qcom,sm8550-qmp-ufs-phy
           - qcom,sm8650-qmp-ufs-phy
           - qcom,sm8750-qmp-ufs-phy
+          - qcom,x1e80100-qmp-ufs-phy
 
   reg:
     maxItems: 1
@@ -113,6 +114,7 @@ allOf:
               - qcom,sm8550-qmp-ufs-phy
               - qcom,sm8650-qmp-ufs-phy
               - qcom,sm8750-qmp-ufs-phy
+              - qcom,x1e80100-qmp-ufs-phy
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 6c6043d9809e..f820470d4cca 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
+          - qcom,x1e80100-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -160,6 +161,7 @@ allOf:
               - qcom,sm8550-ufshc
               - qcom,sm8650-ufshc
               - qcom,sm8750-ufshc
+              - qcom,x1e80100-ufshc
     then:
       properties:
         clocks:
-- 
2.48.1


