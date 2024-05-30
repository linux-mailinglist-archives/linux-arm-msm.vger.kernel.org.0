Return-Path: <linux-arm-msm+bounces-21112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681948D4D61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958801C23247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F3A17624E;
	Thu, 30 May 2024 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BbNjEs8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1D186E3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077602; cv=none; b=WAOo3bCLcJ57nq21iq0ScLxgMFxT9n1kqarurqoIRsZM2UEcrMSjuEwnX//IB/iYT/4AsFqNtih0C0gfh3WCCmRNwP0dEtYEnP2FtG6QmZJ/sYhC6gCj8cWmnAQEa+5/AmjgJqzLp4u4r2dw2kp6m/FidfEmAU3kIYNg2kITK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077602; c=relaxed/simple;
	bh=ejSWv/DV7VxeygnIV4oWMHbfw/k5TEp5V7OkPMs99F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWpUYuyJmHzQ9iLDIz8dhcbGAxz6qMSTMygcD9zGE3LIFpmBoA4gjE4s0tJV6HK76DbMCjMGOJlSRmOx8fP+SWrG8l6b+XeZWrKk2V0+eBibVUz0MLUFXsQRhbVhFsTjCsPxpZx9evceh7lZwf6Iq5h8rgA3niqLp+n+DkjrcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=BbNjEs8z; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C5B4F240107
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1717077591; bh=ejSWv/DV7VxeygnIV4oWMHbfw/k5TEp5V7OkPMs99F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=BbNjEs8z/9ssIAIhTMqmRSWEU69F0MZCi5HqvFUejFqnziY2L/ie7drrXPiRIBQ2V
	 kfUCPezBzGqnvBxJjpEvHylZ7cSF65v0Cc+MaS2Fbi8+CJwjC/jNpWxnqe20idQa3P
	 AYfv69rs30L5foboZRWH9wNm/wsZvDNfBvAzeO5tg14ItuiGWRX6ucX6xHsRXxcD+K
	 bi7i2HHZL0IkTwxlSOpK0SRJ2KHunQBF8Tydn5Iro1kpcp2Prn695Gn25BGab1t/nw
	 bXibH8EgKVzOF3BdATrXt0IK8sa7Xad2JVoK6e7YT9pZzE2Yzyc33t4bJQ5g1hIsdA
	 wMNEwUKLn6gWA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Vqntt4mMlz9rxV;
	Thu, 30 May 2024 15:59:50 +0200 (CEST)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: andersson@kernel.org,
	petr.vorel@gmail.com,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add LG G4 (h815)
Date: Thu, 30 May 2024 13:57:41 +0000
Message-ID: <20240530135922.23326-2-alexander.reimelt@posteo.de>
In-Reply-To: <20240530135922.23326-1-alexander.reimelt@posteo.de>
References: <20240403104415.30636-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-1-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=alexander.reimelt@posteo.de;
  keydata=xjMEZg0fSRYJKwYBBAHaRw8BAQdAIcaNTdj3NWDe5HQPCUs6oYyQygAJWP9LCzhr+C7RwMrNG2Fs
  ZXhhbmRlci5yZWltZWx0QHBvc3Rlby5kZcKZBBMWCgBBFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIF
  AmYNH0kCGwMFCQWjo9cFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQHqi3OKk8uRJ8ogD9
  EVg4zgfmC2SqXCgms6LETAzVX4CrAS8yMhyd7Md921cA/R8lhm9B96RYgA7MvFPFJb1T6JFY75Jg
  QLXrtIE5llwHzjgEZg0fSRIKKwYBBAGXVQEFAQEHQBGDuxZLOTvppxyM4G18fSR6xzT0xkkPOia7
  Bh6L1vAAAwEIB8J+BBgWCgAmFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIFAmYNH0kCGwwFCQWjo9cA
  CgkQHqi3OKk8uRIa1wD8CZDdCAKXstgXY96eeSSP7MecEF5TBdmWOiVgjlEIpoEA/RnGuDaj06B1
  F51wyGAjYXSmn5qFoNHu3yXyLUkFz1ME
OpenPGP: url=https://posteo.de/keys/alexander.reimelt@posteo.de.asc

International variant of the LG G4 from 2015.

Signed-off-by: Alexander Reimelt <alexander.reimelt@posteo.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 66beaac60e1d..76aefd4aac67 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -237,6 +237,7 @@ properties:
       - items:
           - enum:
               - lg,bullhead
+              - lg,h815
               - microsoft,talkman
               - xiaomi,libra
           - const: qcom,msm8992
-- 
2.45.1


