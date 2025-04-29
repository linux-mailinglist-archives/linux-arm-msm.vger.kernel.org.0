Return-Path: <linux-arm-msm+bounces-56151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B4AA0F97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096AD8472BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A321ABAC;
	Tue, 29 Apr 2025 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="otZ8nR0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5E2192E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938214; cv=none; b=Br28MWR9xhusYkz+6SBFlCRAnYgeQUtBI5Ea5yyPNtGqrCVDRCSDMLa87CqeyiU/zJ6v6JVIYWYFYVJfJyTwG/y6IZl3c7FUVLQDmLhhRbmCFXvnPZZMD9IxXz7XlIyHgg3XB49ec+vQdlqrnXMDsSlEJBNNcLSD7K8pn3If/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938214; c=relaxed/simple;
	bh=mLJ4Tf1nLPctiytSz/i6Dp2hGBk3jLHIc3ugqrFs2rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnNn2ZTINq7fxU/kacFk9wr5H1MG4dV3g/bO+HnV1c1VPbUxsMTTpplfGZJ+BFjAz9iR5mlDDVwYweZWHD3P/mVSm+GoR6C7UMwWdWdTdyLimAsBSyXRhfhVMQQZ8+nYzd+oyyqilQIjMpDQLvoOzHnoWnOJadk9/9Z9HhjIkr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=otZ8nR0Y; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FBC23FB68
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938205;
	bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=otZ8nR0YElZwiMZIc6kCOEWEYUUn+idDIyXrmRU73gSXA9x0gXUHy0yac6MYiJL8N
	 D8U5j1/Zowq9J7apJtOkyb5nWx9qEsyxohOdrxOOx4QAD8woodIu5qu8blazl3LTpW
	 Sf0xYd72nF1k4692V9BWwEOE83YWgWZS+pcb8uN9qvjj+SNlW0H9CwllXm1QUjzs0l
	 WP+9Yog7r30lfa1V3pHhMnzrcetojG0MCaHbnrwPV8M8VScBX4TtU4wYWPEJJtgWPG
	 4beVAraHjaMDk+LoATNnJasQ8vkHeZWBMmMCt9/2A6w7/Xa57iBAEqo/FBLrImyRg1
	 T7rUfns477Oww==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so1629956f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938203; x=1746543003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
        b=aOoWI/iw7TkW1LdKb+vGmVGefLoGwK1eXtsMJke+CTqOqQa6/eEZLIU/eYxP8ZhNHc
         Jdi3cd900xYMxHDkkcMW9VteslwZB8RSZlfqILQf7fsC3i8h8ijzq1pmy7+pH/eYNwOF
         l/ZijsXFbxkolHaTRUXGQMy/Gy3QO2YF5CdVJ98UG09WJvNu2LmYAD+o1TYM8koekKZ3
         tkOaZuKrXa8mitBPe9MMa9k6aQgB4+xnd18vk01tMvjDOOM0cazj3AO9Kn/Y0LgFJ2t0
         w+UeOuZaSpwpyw2wVjbXx2B/kPPNjI9Ty9/vj09qnCOPada6BS1OY068Q2gEVccvAAvx
         Z4pA==
X-Forwarded-Encrypted: i=1; AJvYcCVWM4TllvhLaOmky31+DU+ouqViHdlCp9IxCC0XknzVJlt1yN1M/92mAqjhWOK8I1TA4OdI8ZSh2HTwEXFN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3jQB8Als/E/cn0ZUZ0LAWpi1mdXktOSs5JP2llKw3jSyk3jN
	O8hNuZjgEBnt/5hImZtZAjLOrmfb7spUhb7csMaOwrnezIsMmmrJlKdGJZfeQz3ADaXEDXRGKd/
	q5SXrej4JgBo/AdAZes8B9a6t80wjnA3egoOfFYdMof47ns81eixj62uy2DBTfB268IbKr3ENB9
	+YdJo=
X-Gm-Gg: ASbGncstNofku2I6xoN0W7nQzBXilgrSEiHQGkJuhMThfy/F0b94hMAFF+VQ8xJXVIU
	9JMY+0p9930v6TQxn9/rLxtiwWd4D7xHE8pf9CciNUpc8KNzuRKX+zL/u3ZfHFMNKIEqNTf4Zfv
	mKZaRh299v1p+PDMJyBIoS5jcPL7co/T0tKKFIHXDeFV4nmNp0b8GIvXQXws2JJTHgGNWxW9XSy
	1B54yEi9EWucrq8TqFtvrZm9csyYJ8E10B9O2329UXuOkfvplzh7tP1rIbKMA6mNRa0BmGsFrNc
	Yx40+AtrfMabsqB8qt7MUYuOVicRbMNbbrqeDY7Anki3RvVkjuwfihra
X-Received: by 2002:a05:6000:144b:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a0894a3d6fmr4260256f8f.56.1745938203187;
        Tue, 29 Apr 2025 07:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIgTZQXJNjcX76o91WQ3FEfXYAM88484X0I0w8saIfw95UbvI+Ec9HtfLO9iHMOealrvPvnQ==
X-Received: by 2002:a05:6000:144b:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a0894a3d6fmr4260235f8f.56.1745938202873;
        Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c7d1sm14026852f8f.83.2025.04.29.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:02 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:55 +0200
Message-ID: <20250429144957.2088284-3-juerg.haefliger@canonical.com>
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

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1..67900d455ea7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1131,6 +1131,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0


