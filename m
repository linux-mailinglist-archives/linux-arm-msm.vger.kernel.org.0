Return-Path: <linux-arm-msm+bounces-64950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5DB0533F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5722D18828C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABDC2D12E4;
	Tue, 15 Jul 2025 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HWZeGdzj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C66275860
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564594; cv=none; b=kNzBpm657ehmVId3DpQxji3I3yw1DVUnPd7GQOpbgp4ueuE7R7OGy1rp5M+gikXDIsE/Cg7vpT5FPutjnZm9Uuqzkv5H0ZkHndGpqT+yfUs7I2eSjopDRcvogpgq6vc6D8/w7u+5wd1JJ8e6CrLDmUguICGE/U4h/BjXxKRjC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564594; c=relaxed/simple;
	bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOaBZw7RU/l+Q3pGjb34+2UVkW2QaBZO4sMYsV/xRoLqETHhpFYKlFK1zR1oXWEcYks6zSyatM+l32XmpRNKAM/pMwUQwG+ZeUaukBMaV8OQe2JMCjTC0Awd1NyaWYFQjEpN5A0efcLqi9M3BMFC4pf/E5uw4ftfOZeqUyBvFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HWZeGdzj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4561ca74829so15742305e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564591; x=1753169391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=HWZeGdzjEP6z/zZ/zZ0zN7CgG+V5fDdH4Er1xbz2at5VND1oTbX1O3xccHakadwNFI
         LuKzK9nlz+nY5rqu3VQqvLhFtXIWYL099fW/uZmqp9sPl1DvSHegGpEHWOMrW0Md5mC/
         L63Baz/ga26jIsutisM8qUEzgIWsc0kGBbylaxzd1BcHyCF7GXh9CfKkKve69paktVMg
         WtE9u9s0xSGn7OsSe77AWXnJ94Wbsw868x/fE7mlv7I1alTDw8Wv0+7tV1meXV9SiKOW
         GpSxn9AVXpqwyhmAOJAjMLxBI001AAmkkFBqqKIPPvvTvD+9zuO9RsZbajpwizYdQzFz
         IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564591; x=1753169391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=Ebzm1HOgETDcgHoOokefg5F7x5IGiA2tUzoGMkkr9uD2HMkt+ppEJMF1b9n61AqrkZ
         8aHVH8RcF9dvLNUIovsdBsLEsmnLU0ylCISGL0arXsWkvEH0Pj/3aF9V8C9cIWcABArF
         5dH0h6g2XWGfY3NbEIkNNrXnQ9eLzQfZOxgN0lcGDTq8RTId9ZrBlRfTsu9T7yOWRwMw
         l8yc03lJeHlxCbhBxvme4JIKLbf9h1YXeTSq6gdMgSYZqH4EQ03YuobtUvez6bmcdMXa
         XTUnrS1Gb0GSZUK4QKCvOGrb/hj1ZHA2832/WZ37UzjAvUwzgS59qQo6Xezq3NM5cM6Y
         LzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpAbakMWPKdo8zM76UHJjlXwH/8i+jr5jOy1N+0ZjtFdZFwxWCtzJ38Hzsw6sHk1U3d2R7+U0EAHNSEhAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02afoZ5/PY27aHSXbCb2BQ8Kbd/FBERyI2AxZ29OYzfUyIC7m
	WzuBStBUIWvy2b1zk8A0IhvVIxixls5ybSeg7dD2LlQ5bTTJq3XVjVrUk0X4wo3jIuA=
X-Gm-Gg: ASbGncvUuqECuasPJ8BU5ami36tnLLfjKQFai0z4CLLzTBxdgwiTKtaUYvohuKSIp2+
	rXPNzXVFHLNC9QC/pQk8Bv192BXOmpVZRV36d0+QbkV2lThHJnTEQnWiTifBU6EwmmEFjZjRotZ
	Byicv9URmUCS2YT7zhXtQ9o6B+NxXpLrlTUR/woAlKr4cNESkbZHkHbYzzqfFZMmCOwxutQl46w
	uSR8ZmdSTfbOGjf/qDKFuxx/A+jrzn/Uoq8f831ehCFQ62VRjnLQa/YOeFHzjdAxLX7qaXs2JGt
	HTUiUhEe7lTqIjX79YC6nyTa4ZjoLAyH3i6ocfcov2aASlkod0M9hyZhWF9cy1SlNFOQebN8Q/5
	xHi/D/1wr8n7NkprX+1qV0VBvONHkwu5TvvSnGhye6LoS3uU7WWmgRTFM
X-Google-Smtp-Source: AGHT+IFNBRgqSjk2HFJaRqvUEeFclqwrA9aBptgjfGQRiH2n8mqaepG8GqzAyox93VmumoOhYOZ6TQ==
X-Received: by 2002:a05:600c:a4c:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-454e3399cd8mr155077575e9.0.1752564590536;
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:35 +0200
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-2-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=970;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
 b=9yt+l6cGjdO9axu+nOBS510EXP8FcGFhy41mnRfZ/ANKPK8zyygFXbG0EduAhrC0C0EZZUyzl
 6ZVPM7LcNG1Csu0bgS6EDkRl0LvHYvoIMB/YI+mqmcaU8GyRyWltYmx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..854f70af0a6c1ff93615fa8dc1031b4c1ecc2e71 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy

-- 
2.50.1


