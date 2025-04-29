Return-Path: <linux-arm-msm+bounces-56155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA95AA0FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A543BF792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD6721ABCC;
	Tue, 29 Apr 2025 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wTHvVg+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095921858D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938717; cv=none; b=XyKwthPsUCQp7bB4dzGXoUgONthrsHHvq/fiSm98b2JP+NN5MDxD7LY7Nte6yAjIPz5Jl1V1urSfEFP4tYjpRDraYOey0rfL8VRUylgDVYmxa55YoaUgKbZA5YvyyJ5h64kZaIQafilazoqsIfUEZ5psJgCVGmA104perNKxcK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938717; c=relaxed/simple;
	bh=xqNci0ATiYuFCzjmmZLIos4bZ0/Wt6xx1B04/LG3Q74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldcZ/yTCb768fDYQgWuo6330bX0VB949qoffOOsbMbPlUFviX8nVTCh1RV10SBc9NERWkBpKj7VkuTKpZ5I+vPeiQgAsfon4rtAKtThSiSD62l8rSC5oo+3hOtRn5ppKXcGqeXHY2L32ziCUE+zOwADyMzr1ufy/A7iqxYqb0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wTHvVg+3; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A79F3F86D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938204;
	bh=SJsgYFbh52ssmxEFFARHq6BN5vsciQrSfXFEEc8qgYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wTHvVg+3bhRWIgPcVGZ/lkThPAGviozY+l4kFQSYKghZIH3pQ4a/qsTyysvnFZcM1
	 4vWLUjT9up7GwVDEbzOqjmEwFOq2AeKy1tggTAUWJ0s92A2MbwR4AvH7oXmEunDWQc
	 8Jpio26GSiGRbhw5gQXKSsUTu21/e4KmuuMyayLeaJQ0odjSn80QcpA9UlOqdPBsb9
	 8tE+PtvHySbeU4p3oh7111m7u2xCtUe9a4K5yBJmTp8Mo+7e0rSDCvHuE9dROG9l4N
	 Ey3C3tFi0lTyIRFMr4+8CRNxnAXFNeP+ky59yvZvmoKj1sBREfuwfzHJmkOW8iPfEy
	 yVbXGl7p+ecsQ==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so2089206f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938202; x=1746543002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJsgYFbh52ssmxEFFARHq6BN5vsciQrSfXFEEc8qgYE=;
        b=tEHm0c2bEDPNsQLuyrh74EIcgcdMdc1q8Vq2BkMvQ+Wi5qsgoCdNI/sgTTy5zBjL1v
         7hzemJDsooIU3a/WOa1jh3iLx1K+OXLkZ0oMhnemNQDn+Z8G0EWhtJZ1phiQDh85/iMt
         ywwBsRHTKyhkpFb+Gn/Oqi68ufMVjRb6p/TpRw2EpVeN0+Gkha4uKRqz8uQh+QEqA2Vp
         ELG+Xw2FwM7t5MoGyn0NB71pMlJgq2gNUj73LVwJmCyl9g2F4tYRp83lkp8YogEU/UsN
         MMFWUrDf724m/FEvVao6q4uEAVogNDqfckMtBUHZl1HdSGC0tpfiRj2vrcWSeNGPbGOY
         uEVg==
X-Forwarded-Encrypted: i=1; AJvYcCWn1Gu0uSURwePrublTVjTDZyhyQ3NdrlExO2lQCDRrx8gZVA0ZGOPHLHk4Gr5V+RM9paKf6MFN3CBiIAw6@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfmTBGH/pdxG5QNcyQFqX9mmS/dfkVuQR9L/sO1j+7v044mWe
	nPiRnCLHVU/EnJpqtrKiVNrayFPa7ybmtQHDjqEjG1HHIM4ouLODPOWvG3YWVBDndrQBbbA+lDa
	CBusrlba+9AfC6VroHFcpDpw/JkH4qIlkDoyxUUTHP0OwpcjEmDV0d6QJTpddc2EvlULWNjt0+M
	W/fG4=
X-Gm-Gg: ASbGnctZvuAtNs+Ifww+Qc8Xgjqbl6fwh8QZzLsBD5Ctrx8H8Uk8cAWvFMgLHbkk/OA
	Dz5qPIVeMfLFUgEmVyGqIG4d1Xax7NLbyyzilaJDJJEmsKAGahzyKOhI/JsJ5uKBInY4Wr/JeAX
	a1eluUeLYwulipjfuLEuEaTRcZ+0lwSo/LvOJqejNqUu/TNWjfUX5HmjffBxD+AWcOgWa28bYmR
	dI+SDxbanglhxPC4mmDkSGtJUSw0AHPVqT9MkSR4OfnS2hOXOMqBVZr/wGQowUNSaI5SPTWMsPQ
	hrW3IZVY7B8mra/njPxnWkQQP5OXBn99r1SahCJCK06bY0Cee6pEcnUU
X-Received: by 2002:a05:6000:18a2:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3a07a9bc256mr10352688f8f.0.1745938201996;
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8bJ+W20QclbOqGXSh+aK6+noOl/oBWTrNXJb/+Wtj28GOcmxhHhpsJ6WYbQMsyfEw67MtkQ==
X-Received: by 2002:a05:6000:18a2:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3a07a9bc256mr10352669f8f.0.1745938201687;
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf04dsm14386612f8f.52.2025.04.29.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:01 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v4 1/4] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
Date: Tue, 29 Apr 2025 16:49:54 +0200
Message-ID: <20250429144957.2088284-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250429144957.2088284-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node to make it easier to override from other
nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..628e28299c3d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -174,7 +174,7 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
-- 
2.43.0


