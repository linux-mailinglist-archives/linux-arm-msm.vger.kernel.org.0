Return-Path: <linux-arm-msm+bounces-79207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B24CC15792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5CAC1B263EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B541340A47;
	Tue, 28 Oct 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcmPIK+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582EF340A79
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665539; cv=none; b=LxnGdjam5VqXbaTyQcjJbH+obewCpDOtrfwSevqd+99ntvJoEhJKX7f5ch1UZyVSuDwSmff2HvGGqiKNi+InzJepUJptCuiqPZe1TVkf2xH43BveROO0H05aPvt5kxL89vX5nuTTLuZyO+LbZElFAxMDm6/YF6LUlz8B5unv6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665539; c=relaxed/simple;
	bh=jHlDAgCUcYD63kwaEY1pmO3dD2BE5jK1MCET6sAnOU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYUhJcNsmJSiaORmZTQD36EBciQ+z4Ymh9kZspSWA/pBsOFH2GBL4sti9oK0wEBdHahQ+o0EetaX5DkeqUcxYX7uAzBQ+ggwPcY3dAG7806mU5AJy1foF8y5GHmpuSxOfTOZFkaFzp0DIr+M+DFsNEIC+o9yk/Z93ukit8Anua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcmPIK+C; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-427087ee59cso777785f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665535; x=1762270335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aC2/7bpg8G2o5qe60+KYExE03W06UZRjcwgPkNC6rgg=;
        b=hcmPIK+CHg1SVjS25NnCfk5kFzJXAHavZaS4gbbIr+W8NTlkUr1CUYSZLhp1nnFMVC
         PNuR7QRolNgmsqm+OUBEM+OSe0AAhYCm3abo2viilkE/1VwO/eHS25Nw+Z07QAK7Y+76
         hcoSpjfTVB7KslLwV4Q+JO3HVw0h1IaF0+Kc7tNWU4v3v/BPsAKR0H4vtF0nfCxQxeU3
         NUwrIeFdjZ8Sp7ED6NErN0nsBJzbC8waafacY72K1Pz4PAfjKE59C+dcxb6vNlprhgbA
         lffmvCwXyRpFcBs2MoAkaOBgtOlqAp3316xa/3St/PgflyVVSYgwfMEC/KwY8PojqktT
         UFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665535; x=1762270335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC2/7bpg8G2o5qe60+KYExE03W06UZRjcwgPkNC6rgg=;
        b=EIcyvkfdVBp+xNM8QHGD2vk9aO4ak/b+ITTNOGXP61iJGKPC2KnQlLyQZ8gywYe1N7
         6G7YKO6UsxCB+F6+U+yOlLDL90KrHxb82jY4tMYa8jPlRU/0LBUJoARmTbMUUwpdBjYn
         xE277Dp8B/8TZcKYvnAis9d9vqfFDl7lQshDpTP/VlqrZsaKxBmldJLlR0tqYsDzc+E6
         fDTXtrGzPKy0+05xo7XSJbOuciQQNCsEy0egeKihY6Wagot2syJ6Aq6/5fZ5wLPBHelA
         pdBlDHPXzEg8InuPbAC1gxihLhqZ0PLKg+H95S0rPHEt1rn/Jcu7pVqVg89J52CeuwSH
         Ncvw==
X-Forwarded-Encrypted: i=1; AJvYcCWAOpCLwfaaPyi75TKklfK1+BgNjqSRxXPmttktLEyf8e4BaT28QCXzmRm9NiXL6sRH7xjFTaZjs2mapDjk@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxXEPenlFmJIs0sEhtf2MMWZTdzMrP5Aggj4REfkyidaPn3lH
	Iy1DOjurTh/wlXHbrGn0S25np52iLz1OgtSkQn1/eb/1ACKfZA/qb6wXX0WPAWxaiMs=
X-Gm-Gg: ASbGnctD33xmM67QPfnHJuG8Wr63zxeM+YnxknTDhvxtjojWSRGFPANAsjz8A1eSPc6
	v01nV6SyzppfU81359EzWGLUPi9BEl+6AxqkMTUdXQXkDoRyx8obLJf40x0oq0MH1Nb5io4WFh2
	jTbtb5I4LL3j8o5N/o0W8qW+Jzs0b5HWFen1rf+IapjtrjqywQW1gor4ufR6+sAM2nFvcvMMD+j
	DJffjPRpayYFzP0k/HhB7gf098b3rOGa/woE0cnE4DX2C4cmAkl2s3kAUweZjG8R/CsqftTqo1+
	0pny19xu8+9lgauMb92zDh3zgc0vxcfLftHj33Hxsw4uCu3+jzCCs1C3DJLzga5EB1zfdNn/AmD
	4/VRC4fbGPK2UzyWTBzpF0jNRZrOdoURhtlBrvHi//JktwXczQKnZyf3J1/H/T+N/zrvRlpMIxM
	vzRFcUerYgmnmJdkRG
X-Google-Smtp-Source: AGHT+IF2dWta0afPVUf/CFnCKQd1Gr3gEa/5lr0iHnTH3wK4xPGlWaHUfGIaemzNI8UFlSZ2p9yQLw==
X-Received: by 2002:a05:6000:2892:b0:427:401:1986 with SMTP id ffacd0b85a97d-429a7e8683dmr1919010f8f.9.1761665535518;
        Tue, 28 Oct 2025 08:32:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm20844417f8f.28.2025.10.28.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:32:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 28 Oct 2025 16:31:50 +0100
Subject: [PATCH 01/12] Bluetooth: MAINTAINERS: Orphan Qualcomm hci_qca
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-bindings-qcom-bluetooth-v1-1-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jHlDAgCUcYD63kwaEY1pmO3dD2BE5jK1MCET6sAnOU0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAOHx+nX5MgClyEZDdSfP7lbNIR0KKnA4BSVjN
 GDxO//+3lyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQDh8QAKCRDBN2bmhouD
 13LiD/9lBNMsnzHPq8ELAUm/rVGE9l3aQa2Hib0XDc/h2AohzaFbQKB0Ruw+JHSqpN6algBAEKY
 44U2H2pxrVat4KKFKis4hdXel0S2GAC+JCpkdEqEKa/27J1kMT+ujP4I1EcTLYjSjxjOTVAbaot
 5NbqnD44twb/Gb6YZtIXTYjFxPw6MWX85dNQh6qDH47B1PQparFHNpaobrRHnge/G4tXqBjSB57
 kuskq/DhAGeSjV7I60WdvNPhICxq+HVdwVgGAy2Xwsb6DGEoNAgQHN1vjEcgXzY8NVrEzy3OJN8
 JK3u9NE5oG2u28RdF3ZqPn3bVafh2IqtpNNaxbGnoH0SCjbQr5qk41m+oRNEjC3RcaNgfu0e0LI
 VCTkpfbK4j0BllE0MXJGB7+rr0MsI6yOM+xWPwHVfObwBX4oY+xD49rG5vZ0ZTr7Yfy0JBvcI5i
 rL+l6ctLioLoCjreVXfGmK4HkZBHpQ1G4swg9XQVr3ElZpXH5dUOI6z4U5OTE+r70YNI/eBQ3F7
 N5Oxdah3E6TLLccUPsmASIka4Ax3z3NCkkz7niVJU+j6n7ZZW5msdXaFxK2A6H3MEf6KmcXzk5F
 INxN8b/aSoQVHk1Q3XP31Z+Yp2JQNaOmPgfaWj0gIh66E1QktIcZFhyEoROriImK7PlE18yH0Gf
 RGsE62a/gVQ6zOQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There are no maintainers of Qualcomm hci_qca Bluetooth driver, so make
it explicit that driver was orphaned and no one cares to keep it
maintained.  That's also indication for future removal from the Linux
kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8abdc0e50699..be637b9dc7c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21146,7 +21146,7 @@ F:	drivers/net/wwan/qcom_bam_dmux.c
 
 QUALCOMM BLUETOOTH DRIVER
 L:	linux-arm-msm@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/bluetooth/btqca.[ch]
 F:	drivers/bluetooth/btqcomsmd.c
 F:	drivers/bluetooth/hci_qca.c

-- 
2.48.1


