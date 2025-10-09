Return-Path: <linux-arm-msm+bounces-76640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B744EBC8FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 281E84F6C37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8BB2E62B7;
	Thu,  9 Oct 2025 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1WLpsiIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2632C327C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012634; cv=none; b=jIf1Cu7QC1Razkc4jXurG9deE3lapnUz2k3N4KQdklAtwAH09eLNXrBulnybhsH7Z6kIAErvmKp8MZb0gfAV95wmAhHRxGS+6NT16FRY7fDA/lpoMwoEZskZYiSrF63LYvvWqvVfsdkkxJU09jYIwg+WZw0HIS53Nu1p4fJlUi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012634; c=relaxed/simple;
	bh=92BmjzTkktMcwmDuuR0/4Hya7qrc/cicAQZ7fp0iZ4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGOmweoaLfEG8vhSKyx8PlVexj+gyAAPB77obkhsWFf4820w2G2eerqh83v9ghf/PGHz11C7TAiMGbPbUsGOTt+4JMFp1U83uEvIVC0Nl/33hosw9kWb+1lCwAHr9a6DKrFsFKwkBRLWqsBEzykYPgxn2UuwIvoJzczehuroB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1WLpsiIi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2288183a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760012630; x=1760617430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4ESIGC5JXj+5rNkHKRGo3WIWZoFPUgTFIJuXOSXg74=;
        b=1WLpsiIiwaTkeV/x2Xvw1i/VL+SwLjoFfMYGqRGBbHmjkaPDerszS1VTgJsTNvzRIZ
         cwdJAr6WC7r2i5sJLWHBzLXlCnP8Za8qu/jX5g/xzT4NavEUqryiqorpHiOuVECcU2e2
         mLmbCE+E3YlgeKm5K97DcbnoIczFxWLBw19Y8+hrhAGfVScDuxvO0ExCNnOOPwOQ/m1L
         TKKU+2Jtv5IbKJGRMlcnGo0IJUkz+t7tfvb9HUU8nBpJPlUwmd6QkA/hU7IveoIC0bZi
         348RnUtnQZ3GnAR1cVAWBGnvmNegs11ymczUAlfqP6PqUIbkLh0CR4lCxNwTt2pX+FbP
         7bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012630; x=1760617430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4ESIGC5JXj+5rNkHKRGo3WIWZoFPUgTFIJuXOSXg74=;
        b=BTAWNu14DbebojJQewZLgCiSFRYfXKMSxXa+cJuSZew1KpIJlvRckokNNLxF4z8Q2u
         Zhc6i4qYKqR27txcnL+EB9UphvWWIFGf44C03rWCKLUr1R6TB55bRrxTUL9rSqW44B5B
         NbK5Y4bfxxJg0AgnZoTCBx5xQNdSe6mSjtFmR50U22CbvF72nssAJcQ3bQ+57pGO0WYs
         6W9Uxu2kVPUSpPQu2kWNfLVONHwj6J++zLWYQfpb1AB+Woc/GF6JupZmy+uprkgBQPu6
         8Sy0BiYCxuGRnRGZHne2URkDt/u503F1+OkZdEciuDkNUcEjeg6MbQmwaywkH2IKkYnI
         1atg==
X-Gm-Message-State: AOJu0Yxo6u/U6TtOdx3Wohp6jdlHVO8z6NcjiNXUPzM/Q4T8Yup/o4Ax
	YGIFNq8NeQrxd6Z6IQ+Kf5N4DX0TMFJZ26Q7gT5TaRgvcHJg1yqeY2iIa0noDKIbubI=
X-Gm-Gg: ASbGnctFJCWRer1kjkspcsmxfd1Tn6ni0GZjjjUviwW197SYELeYhoSe4YN8hnCslKo
	Ixb1TuX6jtYrwls0Syi41nLIvoTw/DLhfsY+R8euTioVkhWXFkawX3zuYg4P6zRWYgxyB1XB+qb
	thOoV3ILg8QVNlm87yZTuSwWUKYHIO2rIFkYbxeiSh0h1rIUJgZmTmk8YoLkXmDAmXwPLMpnlrE
	+Nls4NF5OTO74eIE8+v9Z5t+ESTt08j3zaqWKvI5094Ug+g4oEHQc2Nxl2Qx+NklgAHclt2nixL
	3/X3x16dhIpjC3+RSG2BTtR/5+l6Ao0trwcFiEVldY7/ylO52Lw3JQUgde4xp5sD6tntci4PjF2
	htsJZnVpK19iLEFPZrmzc2Hbbw/099oXpv+SlpnQndKE2N9P+/Mkb0J1XgNVP8+3t1ZSGAqNx6m
	i54XFgPluN18Zfj/eX+UOhhVaycfvs
X-Google-Smtp-Source: AGHT+IENniTshcqe3jJJStJvdAgI0KTDHDHdfB7CmkzhSPQH5g1ZIrk13h0XfNpFk5i36R7taLsTHQ==
X-Received: by 2002:a05:6402:696:b0:639:dcef:9127 with SMTP id 4fb4d7f45d1cf-639dcef91c3mr4667803a12.18.1760012629669;
        Thu, 09 Oct 2025 05:23:49 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3d09b92sm2231273a12.30.2025.10.09.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:23:49 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 14:23:38 +0200
Subject: [PATCH RFC 1/3] dt-bindings: media: i2c: ak7375: Document AK7377
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-ak7377-driver-v1-1-29e4f6e16ed3@fairphone.com>
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
In-Reply-To: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760012628; l=794;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=92BmjzTkktMcwmDuuR0/4Hya7qrc/cicAQZ7fp0iZ4g=;
 b=wiGazj0RSHWQal7YYs6Fd+dwKjXU8rDWGrrC87eLCCcRfpVpJoY6/C2rXaEGb/AUC/KB3LqlY
 zpnPZQvXJn1CqWZz3DOpW+MIToM2/MChrklbu31SHSJE7yaRxkjoBm1
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Asahi Kasei AK7377.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
index fe312cc6a87310fc77216d945e7b301dd98acc0c..c040757eb80c925d796919316c64ae31fb4df49c 100644
--- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - asahi-kasei,ak7345
       - asahi-kasei,ak7375
+      - asahi-kasei,ak7377
 
   reg:
     maxItems: 1

-- 
2.43.0


