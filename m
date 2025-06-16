Return-Path: <linux-arm-msm+bounces-61403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9FADAB61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2E618836D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4151A19AD5C;
	Mon, 16 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxGOJjSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05E1DF982
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064580; cv=none; b=nhjIvw1QEGdetyoffE5fo9NfLN6G1GyK2ZzCBqRzYHYgqSYSZIr1JkNcneP1O4KtWOfemHyDD3XD8hs36goBtucb3Qpo/EyJlSQE4phB2jIMT1EmSx6xZkmDGpodWMxK5sE49vZQ4urO4hCiVax9naU9HdgaFNMkI/Yk/5Ecnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064580; c=relaxed/simple;
	bh=YpQUAJfBHgcW6qx2+w7RfDe5r0TFs3DIlKvmmYJA//0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfAFIvXJBK83DVsvocbz7UgiwniQ4JB/v52hLbgOY/sSr4Rn4Q8SEOGKW5cg7wDTNYxaIHl5ZWEvMv4xslIvRZ7FSgzd68UVt0O0jK+RgV4B7KidFqDXLGZCZ5IU2RnnpNnqpXmUe8eC9uiyEY1xyNG2LWqHevLtGF2BxkCj4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxGOJjSR; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-235e1d4cba0so36421805ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750064578; x=1750669378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9x/ZfoRrg2fYU3yDXLmSkfalYSRqOjrfYotmadlQhYs=;
        b=UxGOJjSRgBzO3c3pJkuH++uuUV6DxdfWk9N9/5TcE3owUI2DsqxVezDMyeDIqPX0LK
         xYdM4Qt8U2SiO6qSyC89dVu5EehPUDf5HbdgOdIYR3IhiY6WdrffE6YVtQHOHS4Tm0PC
         ZktVy1Yhr4frC+NTXooxyldg77W6ZOqUBKLkwBBarHGptau2Mw6zqjryS/P2bvWm37hW
         N19cpkr67D084/tRMRF0Ir38RwFX4YcRmmFke4pZNK328+qUi/Nad2IMhirPFodeAOOw
         NfNXQyyZtoPU8CNX4yY1mB1g9u+LohS6DA7/Pprke1Zcqjkvrx0n0mVZEnLfPYK5JzDQ
         w9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064578; x=1750669378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x/ZfoRrg2fYU3yDXLmSkfalYSRqOjrfYotmadlQhYs=;
        b=F6V2Le082HjiAjsDO39aS1wxYlGpdkfFGGMk2cO+54bg00n/6VA6gMOUJaGgEzCFBn
         oMzyjV7+hLiALCo8emD26JLVbdUI2lClXpGvALVRtlt/mQFcPJcjqpy40ctTWDnc941U
         lwbzF7dcOaF9CCdRYGkXYnspz3FbtB1ir5uL8J05bn1qbZLfroi0xg2XpvSexcUddgcy
         7jHjpIEs/eo6srgvBDwYqFoK7kjDwik4UsZRulcdJJPUDHPxOHUoC52QbRNQlqT5GDyC
         ToaGAu456mUuprRq1lKrRIrppKwkep+6PpwsvYEoqmBFS2H2IGzrgRP39VqYGxxeHZF+
         a1fA==
X-Gm-Message-State: AOJu0YyF+NybBR5Hq3lHL7W4inkE2uUHBNDR8/PFqRjZlTCoYJb0W1uh
	6b+EmBBiZqwUrZA3ZOmUxPkfGLJYo9diZKNrJRdOWx5SGPrZy0EfCR1Q/7/qg9Z+fPE=
X-Gm-Gg: ASbGnct7JByTt32KB4evu0rnhPYuHw2eWHhEAWy5B6pU31UVyd430savFxe6jrKA8DZ
	znuZeXi1ztTrI37KDGc0S65454bj61q7YCvDu3W8EgMTC4XcrD0hoCfPs3xZMQrNpIMrJyzUJ1S
	iJgKs872cgI6+KxRIvtifhwVT6Nuxefj4DWYccksIkuvIPqWLrvpY1k+CMZIFk2GFg6Ppag1AYm
	rkhGXvsHFgf1Dp72rv3NbngQXrammvz7PUj4LHN74paoPne7v9hOtAXFaeAC+vTXlAQKFAdSufa
	FRpdBytefapTiMWWPwv9VKeb+aQxGRqMTUBjZy/yI53NcwKp9/S9Dmhz8Y+o9KAtJdeAVwSbYKj
	C+0Id94WYz+o=
X-Google-Smtp-Source: AGHT+IHDF42pjib4htT4guBtrZKvC8+uWEbjDBAlxOFYpc9qOB1jGtRDWUUHZG0Fkiw48U/5zFi25Q==
X-Received: by 2002:a17:903:1b6f:b0:235:ef87:bd50 with SMTP id d9443c01a7336-2366b151fbcmr123228165ad.45.1750064577930;
        Mon, 16 Jun 2025 02:02:57 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e4cbsm8032258a91.27.2025.06.16.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:02:57 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: document r0q board binding
Date: Mon, 16 Jun 2025 09:02:49 +0000
Message-ID: <20250616090250.36605-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616090250.36605-1-ghatto404@gmail.com>
References: <20250616090250.36605-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on the Snapdragon 8 Gen 1 SoC.

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


