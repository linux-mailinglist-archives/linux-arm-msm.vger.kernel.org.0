Return-Path: <linux-arm-msm+bounces-6521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B599825625
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 15:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10B341C23002
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 14:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B78B2D78C;
	Fri,  5 Jan 2024 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lald7/Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234F2E629
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-555f95cc2e4so2023950a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704466480; x=1705071280; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAo+/5UMblvp2yGXfA0v9Z3b5D8zBuz/YoaB+OeYIrE=;
        b=lald7/GaAyTUCwVUEZ6z7eP92qUZpWqcnu5KxcLCAgE2j8yjdFgC2fHq1yGVmbRaXY
         89/slULpx1vhC4bu4pPJPW7IlfOFSQ7mWsICxLiuvky6hWGvhDJeLjgLJM077nRd91kS
         +L1rvhaaAOCridAotqXSlt/gHs0VAofWjTfiWD8/oLCJTU2/n9ugYJ7a1zrf4/xP1B2V
         6zt0ynwHYV+CFljq0ItChIgZLnYeQncihCeDe/ENZpvuaqxFwJgadyLieEu3/Z0gpf+a
         Z7XnwUCmkW6wT4wKC4fseluMyIktJCOSfbGQjff81w0nPXoD1Ou/PmiKSHlprKVHXXKF
         WE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704466480; x=1705071280;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAo+/5UMblvp2yGXfA0v9Z3b5D8zBuz/YoaB+OeYIrE=;
        b=E3bpJmSfCYTQvviqcERmBPyjClsTsh+AaUhyJTpYyDUGCMM7uuH3/5U2G1Y69oCnjr
         F+P6u9RgVZddHuxShB9yOJ7TNfHPc4SwZlzDy3XTEi60nFsLc8ALTMP36ptYslVLktP0
         87B4zLKPrBRC3fbfBH/0H2BoCsI8BVuL7R8Ninx5ezUBexCZRdKHUsRDc0VCyWsKlzmL
         yHt2pUawrnjlzoZJR3e5hG4KToRoj2yTk3ScmCiEKPEkn6rBponuSfxdwU5PcK5N9WHg
         JhCALhNk9Aih+VUYWovH+nsgotZZEUvkdvICYC/lRaSXuM62drwjEHQrp3Vee7ZVJMQp
         kUNA==
X-Gm-Message-State: AOJu0YxEeE8QtEQUgxd5V2VWt6US1FqFvYqeteykh4eSTI4yC4N3eA3Q
	g8N7RXPCWhQL6c8zXrGiF0itoM1S/x3LOw==
X-Google-Smtp-Source: AGHT+IGn+Y4YT3T2PJ4K147KHuH6YnDPE1udmtzVWQPQsBZaJbBPCebO8Q7GFNHFzPX14gOS0yomTg==
X-Received: by 2002:a17:906:6d3:b0:a28:5597:6253 with SMTP id v19-20020a17090606d300b00a2855976253mr1171606ejb.21.1704466479847;
        Fri, 05 Jan 2024 06:54:39 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a17-20020a1709065f9100b00a2471bb0d11sm963140eju.31.2024.01.05.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:54:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] More thermal configuration for Fairphone 4
Date: Fri, 05 Jan 2024 15:54:26 +0100
Message-Id: <20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIYmGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwNT3bQCE92SjNSi3MScYt0042SLVAMTQ/MkcwMloJaCotS0zAqwcdG
 xtbUAFbh4wV4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the thermal configuration for the thermistors connected to PMK8003
and PM6150L. With that all the external thermistors on the phone should
be present in the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003 thermals
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals

 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 216 ++++++++++++++++++++++
 1 file changed, 216 insertions(+)
---
base-commit: 50c107ee601a3d57e4fb13a9ecd9cf6c8df187f2
change-id: 20240105-fp4-thermals-f3c8e0417b70

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


