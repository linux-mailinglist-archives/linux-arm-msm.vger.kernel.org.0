Return-Path: <linux-arm-msm+bounces-61391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF5ADAA61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B19087A1CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F32F22F75C;
	Mon, 16 Jun 2025 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0PB7Gp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578822E3E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061585; cv=none; b=s2XwRZr668qImjiMQm6qE3JWwntcXQVATZF915tI4KGUHkPGFVgtGdkz18TsX2ZMSSjPZ2u4X64BkuH6t8b9IG54yvIKhCYFwBHnvjwt+7+O0JSAQWXoWHXluWx+ggKA2YSQqC1HldvW4L3+ZeaamsyNWKp17eo2jYA0NUFI1SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061585; c=relaxed/simple;
	bh=NTlBHep4nziOs09zu2YR+zJGqy3leeh8bhQ6aUCbSck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PamKxEBgMjTaNhd3Ti7MljAyYthRi9X+ojIt6QRBoFsb07rX8449tenDlDRILYAQB1KUfteMlMpZes2sLKTdAmAW8X0alZryuvUt6bO9IQpUGfhG1Mh8XDju7wgKLDVCFBVegziE02ywP4miPWGKYlNFsUHuK7IcM297PSBGluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0PB7Gp2; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4281939a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750061583; x=1750666383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIDFHi4f+218CotcHJ3ei2q7tooAeQV+d1LkFDlncu8=;
        b=c0PB7Gp2R/GdS/Ux6TEThQY+IIrCGa6kG4Hn9vTBikZZQqJjjRpaeByYVVjE2XErn2
         eu5gmSx4SxIz7j2eTXMvi17H4uwFv6pkVwKktUt6AB90O9QYj408RlIkb17PzKfLnVMY
         wyTQFcAGMKYHdEMLFnAI65EzdVuOsmsZy/J4iWcPk7DnHAx+J7e6pR3PzRLnJYGpV3pU
         uXawppIxl8Y48wLttJTtVEWhnpKQftCcMT14h3uuEi53R4i9IIxMv4HqoGIyymJ36UAl
         P1oQbaq/2FzyP8TcbMiGQi1Q5sGwi4HABH3Hldjz3XnC+Mv3lyJ9NOE+fa6/qQUy46om
         1x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061583; x=1750666383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIDFHi4f+218CotcHJ3ei2q7tooAeQV+d1LkFDlncu8=;
        b=YEkavm5Yam85Y38pG156U38yWASI7kj8oTBkirVcepDip0bU4DNlVWLjQeNY5fJyoU
         1Lk1QHsN/soXzTAMPhyKDd/4CtczX4oazd5nvJQ1Z69RA0lGqwQpcs03fXUKPFZq7Oeb
         iOZaINjADOMxQULp3XY1yZVeblB3xLaUtmSd463xKyTEru8D9fxHKTaSOhHcgmY9u52C
         mp3qxO6OeHM/Q1EEmTVQIMA+MEil+6lsuM5PTlibXNzn6mOh7gd5GK5B4FxtK7hLPC8G
         86VQkPMvCa90UyVviuTmpXrkXwtkQJcjQ8JPJaGXF2Blg2h14KVrwLLPLtxeU4A/25c5
         eyXQ==
X-Gm-Message-State: AOJu0Yxj6EJxXW3oBtR7O2Dp+NFzB9EAeN5mwEVvLY50ps/uWP9/Wy/C
	YYe8t9HFbfy+llnxhCCLZVkfeF5uUo4BJOCpp1ElFh2EcCHfFkfnhxWMWSZpCmfeX9w=
X-Gm-Gg: ASbGncuqh5mmr6PhCh0quT8Z9umppnWKa8evKJHjz1EY/W8pXVhqmmUcJEs03aF1Htf
	TIh+ALI/cxEMy/+kl5xL+f73gNe9M5tFrX2LlWpV95N36SyN4Q1h/T7XmC3RC0bOYOl8ZvfBf8U
	gdYj5G1gWaOR+HRRAnNyTILQjRnDTDnmY3KQXW/6cnJRAMCOeouTk/bz3YQFV1mta9un86kVCIR
	07DHQE8LSP6SFo+jxwzZ3mF7uuSwpqUADVgJuUUR02o6xqBj/axP6L9O5H3W9z71iefbJYXTMfK
	KC+pfMno3S1hTdvWQ0Hah9P05QzU9znAf/ARkdfH/cft7qMFycf2zOmwqCJiH79pReRHJvtEgGx
	W
X-Google-Smtp-Source: AGHT+IFroaEMwUsxvi4fe7/WLhbWBBDdoj8bf2Z2RpXSMjrUZMZtrxxgMNwGN+I5lfWZ3LvS3Ng/3A==
X-Received: by 2002:a05:6a21:8dcc:b0:21c:fc27:aee6 with SMTP id adf61e73a8af0-21fbd550d59mr11840340637.22.1750061582765;
        Mon, 16 Jun 2025 01:13:02 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083171sm6409864b3a.92.2025.06.16.01.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:13:02 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: document r0q board binding
Date: Mon, 16 Jun 2025 08:12:36 +0000
Message-ID: <20250616081236.26280-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), which is
based on the Snapdragon 8 Gen 1 SoC.

Changes in v3:
- Set r0q to the correct, alphabetical order

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..491409905da4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1090,6 +1090,7 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - samsung,r0q
               - sony,pdx223
               - sony,pdx224
           - const: qcom,sm8450
-- 
2.49.0


