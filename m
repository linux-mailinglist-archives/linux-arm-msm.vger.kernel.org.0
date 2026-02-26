Return-Path: <linux-arm-msm+bounces-94307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAEoGEhaoGlPigQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:35:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F16241A7A97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26111312B96B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0213D7D77;
	Thu, 26 Feb 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtEhktnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CEF3D413F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116134; cv=none; b=Pih+O2xxKKLBALrvnzeFDGYyLa+N98MWSY4gsjr69FM9Dez4/1Tz2REULnWt5UICmRpYUjZZRWjxRLYXQncbj+qxWXKBxz9aI443rs2SRD9r7c49kYrLq1DcvXJwxdMb3d5UTY2gKav/XAVOt5Qdy1NcdQuIXTWMp5XGuPCHI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116134; c=relaxed/simple;
	bh=Yg+9K+uVNQCpVtms8a3DDntKPMJx4dik8Qk+0Gh1t2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uC+0+NSi/fLLSyKPDjoue5vv8sSVUcNKVIRc3GOdfHfwFpjotfcq6sJZvl1WJN3Pipe5b9hgw+urAxEuugLS5c+9uxE0sSySVqJVBmt2VZZwRjaKivwlOienyEDXZTEgG2W6TuGSbIjahJ3tdKncYA1sCZd86AjonioIp0/+wAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtEhktnl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43987b97701so634618f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116129; x=1772720929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT5yqG8vXBWHfXrGzM4Tk0LOrnIaCETkWh1v4QtireA=;
        b=KtEhktnlxy2gnLDeqk1Zag5nR4HWWhSDoJ2gsAIhtgpsJoHfXQZWwqnkWZOiqwWwMD
         wda1dK7GaTA3zvk+gS6DGlpPqduXG4QZGJARioarJzus7DRB/xSDOtagqWr1tjvaLvrg
         5AwfqrD8ArQy9X/D1CdBA3HPTsobDDP0hXB7F5sTYWNNhcJWqUXEWqnNLyEo6jmBUy9G
         yXxGFZN0kZoDQ9dpk/uKm9sIc2w2gtspWx4rw4uo84Umel1ScnTPffpUc8EzaWLeIJzW
         Nb8AsCVf+SxQ+/25/NuTaw8x2bVXchRnFITdgyqBkRj+0jA9+TJLvAEYDtZYhgUK4jcG
         xqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116129; x=1772720929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT5yqG8vXBWHfXrGzM4Tk0LOrnIaCETkWh1v4QtireA=;
        b=u0d4KCHMsDZ/MlaTtXx0lQ7aiQyBUs/c8C0KMqD76xKWh8L1zgpM4Ep12cgWfYkjRp
         MA0wY+Wb6cKZiBWICHVzoOddpbNE8U5RHGlD7VnSfMCT5e1rZaU1JpaV5RAqpp6TcQpw
         olge85PknZlfYUoupnbnxdc+VVleVMAJAJbGGquRHGkQUJ3J7ln0cDFRp6nk2AAu8BoI
         JJ2C1MTpCM4ZSeKSPZpZrabVZT6+smeBju/0VZ9hH37DCtbNae9PKfu2V/+ewWjOKx+J
         XK3FHCwSWLUPai/RhgarbmPqSlzwZ6W//wW5EaTondv3kubBvW8bBdlkg3b+bLgYbigJ
         nRIg==
X-Gm-Message-State: AOJu0YzqWat+yjrimRmUJfESbI3/6fZpZyIie5ibnk5QFa2+AEUNUdlI
	VGd/JFul6C2pW0m0St3HZ4PRi3bkX9WFCSGAeY+fWk5x+owNSKXJQ61YnsLLrCijiqc=
X-Gm-Gg: ATEYQzxFtpJbGHlMf1eWNMLxVqaCOauK6J9OQ8WfBH8/fKUPegWAQ/W3qj/qXMoa9zW
	bD5DBjw1hhoDsbPxBsQP0FlXec4Kmt375TAL4NW+Ag8Y47KlAnUKVz7byiKOlj2/B+q/01XFmIQ
	ks+q5VIpbQPzc7TZfdk7tFYIzJSms/D293+TQNfMsgizE+3ZoxAIQE05I6JwA9rdKI0TyzVb29T
	eZyeoZAmjfi1jYh6aqgUC+xCaluJBV2FA3x6yVA8qzRrWSDSwUAaa+n367JEAIcPNmjPyrTZcGY
	ozu8lF1a6lHRLhBuc3L4oXExJzM/TkTGTi8QwVDMtPcG++fPTCp8uuxEKPU7M99n03ByRrTeD6n
	3lJI73lcMqNY9ZpPVCeTTEe/LCNdNMBZ/+emunAGJXUQnHojxgf97Vq2N+z1qpjrW81jf8N2pPl
	sdHtiswhDmeRqLQgxWwzFF7jx5HJ0Uz1rzDedfkuKNkMicNPbindvMRVYuywZfghHX
X-Received: by 2002:a5d:64e5:0:b0:439:8bb9:dad4 with SMTP id ffacd0b85a97d-439942109cfmr7687747f8f.0.1772116128933;
        Thu, 26 Feb 2026 06:28:48 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:48 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:45 +0000
Subject: [PATCH v9 4/7] dt-bindings: media: qcom,x1e80100-camss: Allow
 CSIPHY supplies to be optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-4-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Yg+9K+uVNQCpVtms8a3DDntKPMJx4dik8Qk+0Gh1t2k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicaaNl6Y9jq8MrqGgi2he0VK9T64CSNGLhf
 cbmHvGG24uJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 Oj0RD/46klVUKSPMzgVpgsIKjnYbgrlgJ1CEBkKktdHeKVVEjmrG7PJtL2wJ29FdUEMOyMsCqmr
 ulv1I2zPQr0C7jWtmvGOCLoKAy/dcdp+cvMZ6X1GzUrXUaPbglgYK7OfOndk++htn+qP2HfZeGY
 JpFjfKAwiWA7k7uaIWGId7A7/dZYvEpCrhNpQVuSqve7cikf3Fc7B/EiRVQ/uWuo4pBuXtRzRSD
 ivFpQlt6HDa00UBMfLsvfMw78NXwc/sHXxdaYXBHUlUNOsLDVDa2kqhHmyGtevDhJAQvniIcx4c
 5ZIp6pvBdV6qMczcDE3ag3mQN87FYNzVOkMHw8rav4E3zeb0v80e1rqAIBn3JLJmoRaIeMXSJeh
 h86MZ5F6gkN8nvqYPiBuh8VZlhvTeme1iWZXQ46DOSuLn/eakaQQq1/RFVfZhToMAliANStfURg
 QorED1hdJZDjbOhi2MoJp3PMXKwH3HA1fOp46T2135kc1lXfsZaOTddS1OZ9bbSRRbXW+KVnSXv
 +7ioCPviSzs5qNnCoFoJmtrwUp+vsws59FKvgp5NccbgErVaaWDzIp3RsaTZarGDg00MsvSTLco
 QIpk7ljNISsy33jJ2gdHd7lFKsaXsF1jmxgq+WRuny0wXhO9DE6jFecM/Z4vEQhk8RNrzMPz8fd
 VfDuWUvLNdk7Vpg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: F16241A7A97
X-Rspamd-Action: no action

When CSIPHY devices are modelled as standalone PHY nodes the voltage
rails are defined per-PHY. Allow the CAMSS-level supply properties
to be omitted in this case.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index f406cf6f8f9c1..3a5f179c15910 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -243,8 +243,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.52.0


