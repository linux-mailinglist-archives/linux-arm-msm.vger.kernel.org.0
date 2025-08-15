Return-Path: <linux-arm-msm+bounces-69386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDFB282C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 17:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 252C3601FAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED0C290BC8;
	Fri, 15 Aug 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPfNNcbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528728FAB3;
	Fri, 15 Aug 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270911; cv=none; b=RJrqgFndJroypkVAfZUmW/1iOmG/X5APfq/g4LilAPWMNhgf438UqSCLdNF/Ai/0wuUT2gJ7pJfcqURuFMiqSz2KViSAa/bA/c8ROIIrwPlcSyKJmIAjdFlwLN3eEgUQZTaEZXIn7fRWsnfQrY+8Y4gT4SEppZY9AoLLQRaJbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270911; c=relaxed/simple;
	bh=1NSGEkTa4ZLXIlRtVVrKcpFeioVx67fBsi/F5YZF/zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLwefGS8ubT5IpbAxUCKpLc13w3tiNiB8SOOA2wV+7wYcdPbUhhAY23ueaoip2WAjQSeKUcmA2W4MUAj9F5g92NrY4BNjjriZ+AuHnVHfR3OLIdf1L0IHkrF5FFA7tadMdzEtnEOFN97TDUW6BWqoPJg4gTUj8v/hdZ1lt1Sy0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPfNNcbk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445811e19dso17310925ad.1;
        Fri, 15 Aug 2025 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755270909; x=1755875709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMPr0fQ2oUsbvAlMfmb/eN6g0+XbLPbvPhEsPx4O4KE=;
        b=JPfNNcbkMphzTXRajkouNFUsc/Y7hsS54JDm6vAvJ1c6OK5SAzTVvyYEmPTcGHFKFv
         yLPG8u44uFRclCnwYRPlbdKtYs6eIcFfVn3F2F6BBakn5q2lDZQ9fv7pNTxZH0hcM/rc
         Cf7S4jywgEWTL40RJ/TKFjXp46mjWy5FErIq8fzeFzS4LTYTpvQXsng44z1CeQVOBrw8
         ucxrAlHpxLdXROxGka37WHGM9R5QESuI3+ppBNVNtipkyxdgPPsR6wy6tPRHVPzFGZFE
         GBkKxeL+n1FksLbZ2YJYI7wbfwQ4CDXRpzcBfQjDRUOMWqYL5ztZm5r1jlGRzo3GLnIU
         6pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270909; x=1755875709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMPr0fQ2oUsbvAlMfmb/eN6g0+XbLPbvPhEsPx4O4KE=;
        b=dX+QF23wg4Xb2XMcCT/8LS5qSUm39lJYo7fVdxHNp0iGHK5oYR4GitwlMepkndftN+
         9bTotSk2i4Vp2CdWDXpd1I5h9aCY9HiNrIz9L0KwvZm2mBR+74/9/B3dgcFh5C0+xkmt
         F9vrui7pqHuxoTgSCyYsfOoRrbpRWn3pz/dDOxPI77B1leAv/8NVpfND4x7d1OoaXYd/
         PMawx+4cU3FFH/sdMxpRVj/Qg+WsvJ6XRXmRVehIlwMuMOnKiVwV4f3mddvYEe0hfaND
         XLmcI7hT7ql3Qiu4VQ1smx++jn6fLD8UED2jwCqAc79X0bp95xNMfqjEBaODiR0aEGe8
         YIBg==
X-Forwarded-Encrypted: i=1; AJvYcCVqziv7g1wIEE9s/n/ZJmx0gZ34B/9GasJV+s7SAGAX+RH/fVHT6ge1woq6HWO5uVrg2WM0adu1Gc0j@vger.kernel.org, AJvYcCVxqiyugBEZDDjNruRJwRDXx5gz7HpB6FziO7aWhZQTKh/KxLSg4yL0arqL4Kk9MeXyzzMomDp19kEQloJ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sN3T2OtdajNRddp61O8mNHQjLQe+unxoCfAQlg2oGi4d1Qjl
	3CCv5FocxTB2yWrcKIVasVyc6SB+DLpK/Mlsl4RCPFpjz1UxFX/FVMLi
X-Gm-Gg: ASbGncskGd908itZEhX/fD1MFI34RPr5eVDH7TOO1dTRh3U3gfZ9+FiVrca+zZ1+4qm
	V2k5D0ywWX/gAnZ+fy8FW3hQfUpakocNZIvVo+nErtq/y/g8kxHsbJAoTvg8Bt20pIL3m4A5c/h
	cTiF3sk1vt3IF5mRclcEG6kBcXDM0ejwu9QMYWmlXm7AWXYF7y+h0JSa2d24R4BLM5du7RJ2HB9
	wCfeb+uXPlAywC4MFRbQPDH0Fc3HfnG+QIPQUzB1/Nf3O6I+/DSeIPifWX94+WO+tq/kSaTSnCT
	b8MPzQTI6R/BybFBA1SM9fKaxnjN/lVyMPRqzMEbg9vi0pJQGxnULQUC/uOHQNMbROr1XIbOQL4
	s5VXTlk8kWOqDp2WHRoZpITFiPsteGniC2WepGv5dqXwbrBFcrrgrsg==
X-Google-Smtp-Source: AGHT+IG/pmXOQgai2bUfXtOYEkMGqS3PhRttXYvIvTk7VkvTGMsKU7N6wAvwuzFkRWgYjTxuwoL3Qw==
X-Received: by 2002:a17:903:2385:b0:235:e942:cb9e with SMTP id d9443c01a7336-2446d5af490mr32009005ad.9.1755270909024;
        Fri, 15 Aug 2025 08:15:09 -0700 (PDT)
Received: from archlinux (201-0-28-218.dsl.telesp.net.br. [201.0.28.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53db44sm16224635ad.117.2025.08.15.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:15:08 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: document r8q board binding
Date: Fri, 15 Aug 2025 15:14:25 +0000
Message-ID: <20250815151426.32023-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815151426.32023-1-ghatto404@gmail.com>
References: <20250815151426.32023-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S20 FE 4G/5G (SM-G980/SM-G981B) board,
 codenamed R8Q,
which is based on the Qualcomm Snapdragon 865 SoC.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b3556580..607eee7a1794 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1076,6 +1076,7 @@ properties:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - samsung,r8q
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
-- 
2.50.1


