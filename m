Return-Path: <linux-arm-msm+bounces-63916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F6AFB0FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 12:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB3D1894546
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 10:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADCE296161;
	Mon,  7 Jul 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AIXjJ/YY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E0292B23
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883505; cv=none; b=CzA3UPEVwPQA5bDQLYkJUVH7quXx7c+CUtqg3FBZwLU/KK/xrrvjo6UwGZ27c4mKvbqXPt30DHBNCiHsnP6tNu4e1d02ZhtunXVy/qMdUYBgsgNHNenRK2bMjf+gpf/nzFW0I0hIkRYWa4Jz4fyq9K7CiW6Sa0t15ONqOMqF3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883505; c=relaxed/simple;
	bh=USNSTCPLUh43NQYfIkxLRz7CFdTqWhFh5EABG/L6WQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsT746T+oR8tpbCHcQ5Y1YL6EgO+B0Ae54t8FSrRanMoyfsQWJOoBdnqpxaJ/5na2Lor3ftig8SG6tCvVH7oFYGJD9v8n0wD3d1wfpsTGf8oIlzSNUJsyu6bODuggxLuhAk5QopS8qvvwWJ1YPwgrYS3eXdnae+zYlQnhW8fDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AIXjJ/YY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0d7b32322so442223166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751883502; x=1752488302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwDPYiBu47NkXEsxkYg8SaVSkTFBC8WInMrYQOtCz9o=;
        b=AIXjJ/YYkNf0vqpc+DODRUCm52MFybIEXskug5RR0d0Y1jj9JTc2TRqNiiDpRvmmV+
         oQPR/NU2SGkA319LpB94kDqHA49oRXgiq3kPU06qdUgLarSk2XXUgGNdW6w3rzXqbHbP
         hwu2Utl9181OMLIY8krLNpl8ys62/D2H/a848fbwzSAuFJZghG5Hav/eank7EooNWEQk
         Q2K2AhkTudPUg7xpsqe4MYe6fPCIb8fiFhvPb4rCiZi3YH8hkS7pgXUxZD6Od5JlNpNY
         mQez2q+jtif00Vpjr7TNA8Nwmy4ybn/DdBH4lQ2T3EeXKMxjEyfLDSR9N+W753z8dXxh
         QgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883502; x=1752488302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwDPYiBu47NkXEsxkYg8SaVSkTFBC8WInMrYQOtCz9o=;
        b=Ww7lO/1E01xbfR2Xc2IZt/UjhEtEr/TiY41nNJhOPQspowtjgksDE6jYxPKMh1XIyt
         f5rDrzouGQbST3oxMpHaBb7DbLMxA2S60QxccTzIg8nS/TBjEKqkzM4bnXizV+XY97CU
         X4zxQW6ZYIjoBlNlpvsN/CDKhwH1EaE4mSOc2Y++HjkS3UEM0seBLOSAkFXZdbwSFnJ4
         mrWS58BWIUGOdUvK54R5oItjpHZduKAA6xAs9cyx4BGzQt1H4LFDROX0QlW26nJIFUhn
         RBdFGjvDeX8NvasgXCZ/V9WerFjtfBKvKIr3PEQrpPD+PkTZHpvpbJ09tcH1qsZNogkN
         D20w==
X-Forwarded-Encrypted: i=1; AJvYcCXUfe3ytAc2JMXFBd01vEiisABi/vPa6UTp8RUvSujXFFR4ER56hUic5n48PaNCYWOUqhkxL2D490kIKFna@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4h+t4w8sZ4ngALzhEmwqK+ZiKcR9slPpObEISOcVMw6O/yqJf
	ZQmEap4uEUyNmLw5lAKEl1qIoibvafWlKnkJ9jjOsuwQHjDVYC6Adv5pxvUQGFXdwsc=
X-Gm-Gg: ASbGnctoBk79Cl/eIONaPQL/hFn+m6sRNTcfvt8kIiZyQ/ctGQrwGFoACqwpqyYXHjx
	2eUG2jkR5LeR9soSHY70pvdllIHPzjZAB4F6KrBWNPaPG0GXwGmlVAuEQ04wO+8YencTPHmD2a5
	UzY7iv53bMIe1Edh83i53Vxf92d0lxPc+xGcyZXtLl+k8TIw2yXN0z/ftW2GYeP8AyXX+py/sWs
	FgUdN9+AWGu5OqRBw0Q2yRGhZVP+JaxLm+J434nz0WMviwyPl+rWqD5u/E71xI8za6G3CAKRDYB
	iFKezu3gtyrr+16962YZjubP1oF76RzSigdNNm08lXcXbEZtiXP/DXddUXkPRR4VXtv49VcPKpk
	5oJMxz0Y4RxQLHWt3c3tZopkvijTsrtiI
X-Google-Smtp-Source: AGHT+IECdSkbHIUqu1f22D6ia6KrC1dwzv8RgmgMKoqy6VDd5PnWxJxxIPxs600Xqmqg+R6EgQGyTQ==
X-Received: by 2002:a17:907:3faa:b0:add:f0a2:d5d8 with SMTP id a640c23a62f3a-ae3fe457c81mr1062729066b.11.1751883501706;
        Mon, 07 Jul 2025 03:18:21 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm671711766b.180.2025.07.07.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:18:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 12:18:10 +0200
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmpd: document the Milos
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-rpmhpd-v2-1-b4aa37acb065@fairphone.com>
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751883500; l=820;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=USNSTCPLUh43NQYfIkxLRz7CFdTqWhFh5EABG/L6WQo=;
 b=vsTJjejP4J+3gjvbXlOXjY+EF6KQyuFHQhJ9Z0xOXy8+okpV+61RofXRDOqVEv/zX1t8RShst
 lsrQjJdAzSyCdgo5/TU31uLIKDCgMJk5hdW0VUkHaBcQzuz0EmaoABc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the RPMh Power Domains on the Milos (e.g. SM7635) Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 1bf65f2a583ab70ac313309f917aaabb75dc3f85..7d4394a3ccbc79b1ee998a29187f30d2d3c4da51 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,mdm9607-rpmpd
+          - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd
           - qcom,msm8909-rpmpd
           - qcom,msm8916-rpmpd

-- 
2.50.0


