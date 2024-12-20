Return-Path: <linux-arm-msm+bounces-42931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB49F8D57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64A2B168781
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648F81A83E1;
	Fri, 20 Dec 2024 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BycwL1zE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEAD1A704B;
	Fri, 20 Dec 2024 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680182; cv=none; b=XWPFjaInbKw2rL4W6ACHh1pQalmU0O9Jcvv2u04AVavLDSPicAOJnWvnwKdwTUwfN8int8iS1wwmSso7MVpz1JB9qIQO7rDKhjNhwoR56dhAGjrRzw04MmaC0/Yu4+39KwRYliq798W66f2F2MTViJVYXPmLuUizKHp3OCvoMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680182; c=relaxed/simple;
	bh=K9RRQydJrqjZlGMV24FwvjEUIFLCbX0QrTNS4P9FBo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cKu/qHxOC5bmn+Ys7w2MrHCaelaaeEVrCIUsRq8oIzR1AIPHG9XNkkf9Lv2+79TJOAFYy15QPAY6JiS88zPIfhu0wd8PyOxBbryUBZpI4lC+M5LABAoET7Y3ae2cPqF5tqO7x0KVjXi02+VyZJIJ0VzRos05ju4ZBrr67PCdPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BycwL1zE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so2315913a12.1;
        Thu, 19 Dec 2024 23:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734680179; x=1735284979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmnOKXARNh/mVdEdTbXXZMVtjsBlY2Qn2Jk3T3H/f4I=;
        b=BycwL1zE891tch07sC3ZmwgCpQW8W0jTeykZwNKuSF/EgZC55+uQHkyNipRnlqiUeZ
         LnqJSyhPvmiYvSTcDH73WKK0nN01uVK89GaBuIXakm6bSJImgsTKpwVP4k/nBvTjNWvP
         PbWMhMaU6y/OH5LUfnQMUoZy76+lyEFHb8tzdPBXqoYyCENsN/9DwMWA6wn+Q6399yhU
         F4wf9ZuKwn7G39QrY0dKnchzaxktgFRGa+QkJkGCt1iCkjrTDjfJDWE55wjdQyUT5ezN
         NOiAwLVWvKihEmwpJ7Mw9Lv/wGo5a8pNmFazyjlzjX/vYrMoP4K9cmTIQpOHLWOdviT6
         y3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734680179; x=1735284979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmnOKXARNh/mVdEdTbXXZMVtjsBlY2Qn2Jk3T3H/f4I=;
        b=FhxJRlFp2te8kEzTBucdViSwjoHrc17BJT1pLjLJcypuirjcCBDiGoW2FFa5pf+wwv
         USdDdHsIlRid1DbSdNR3KWUtm9pDqGlXJ7QoDFyZMwiK168l2o34sI7TZT4SwvlBfZjW
         PHJIbYBjYTlKC0hELFGYqqDmnAQpWaoUGqIOmUvMdjQYafjQKWM1B6kAheFtndeLhNXB
         vIOMwYckqV9ObB3KLXwG+m7OmAElW0E2SZNHaFAJ7yw6NeAZibvo2ceENfZR6r2PEdjF
         i3OehY54NN4JM3I2sTvtc1WLcMpEpkP+v8cgD/xXsDfV++c6cGddhuCESlk3zjP0tQop
         2jeA==
X-Forwarded-Encrypted: i=1; AJvYcCUEjtC/YxEQVSU8ISB7LeON0C3E+XlMe64J49/VbCDgiAvPz9+eDUXvWz2S8FdQAHbX9S+41Y5FDou5/5Lp@vger.kernel.org, AJvYcCVNkB+2hFjYsmrvwha9hqXGKUl+6YmKa+ouqBUEMusxUpyxy/4yTw4OSFY/sNlbbkRO6q+yj2BC@vger.kernel.org, AJvYcCWkvPeIwzqdca5seRMHYsdmTR5nCloJDjaLsYFP/is+j4mwcN47YLmP5aCwRk+apDJye3cak0vZ+Yeh@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiUHsHbzWHGk8poNivV+2Kn8qTMv+MaB3sJWoP0U7ZYywaR5u
	OGy9qNfgvnovGn9AMGCQPec1IcR3Vjjylqbi4yi9tzTnuMUyuQd5
X-Gm-Gg: ASbGncsNEFxlsqWNAG9Bb22hlyRbAgnMN88wZtNBqNPk1E5OH42eH132dEy/lXBEiEo
	W3+DpBl6xFfU7gaJLNR9Nj6qQnNm8QmlSw6JKFp6IgzrMuOrfeuLZ2+itMQiJfHVbzoFoL541hB
	e7Tvb0btbUVbPs7JThl0d6I/QraPnHQT7Ois4jMvssuEK5jVO94oxSkxuXUb2l6MasLKofdV2QT
	MZKHIFrohvy+y28zz8emxB4lBCfvjxFHzj9dYVLEW5pVeciXp6Nn3ViDrEVFjK/7QA5XaawBdxB
	EtEIo0jXix8gwg==
X-Google-Smtp-Source: AGHT+IHjZciKiUdpTO/xWIvnoTuKFYsAoSczMvs6vwLWyP+7VtPWXYzg3tXV5vGIWEL0fHMgdbllnQ==
X-Received: by 2002:a05:6402:321a:b0:5d2:7270:6124 with SMTP id 4fb4d7f45d1cf-5d81de2311dmr1420892a12.23.1734680178729;
        Thu, 19 Dec 2024 23:36:18 -0800 (PST)
Received: from T15.. (wireless-nat-94.ip4.greenlan.pl. [185.56.211.94])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a375sm1509229a12.2.2024.12.19.23.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:36:17 -0800 (PST)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290 compatible
Date: Fri, 20 Dec 2024 08:35:39 +0100
Message-Id: <20241220073540.37631-2-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220073540.37631-1-wojciech.slenska@gmail.com>
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that ipa on qcm2290 uses version 4.2, the same
as sc7180.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 53cae71d9957..ea44d02d1e5c 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -58,6 +58,10 @@ properties:
           - enum:
               - qcom,sm8650-ipa
           - const: qcom,sm8550-ipa
+      - items:
+          - enum:
+              - qcom,qcm2290-ipa
+          - const: qcom,sc7180-ipa
 
   reg:
     items:
-- 
2.34.1


