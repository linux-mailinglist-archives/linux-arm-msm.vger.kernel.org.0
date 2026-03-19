Return-Path: <linux-arm-msm+bounces-98669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFcpEdm6u2mtmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:59:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBD2C8361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 727CD31DACAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC483B27E0;
	Thu, 19 Mar 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwin/J08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BE83AE6FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910519; cv=none; b=KcShLauYKrmwJnteXky0UUjnYSloApYCEIaFRTLmSs14hO9Xkn02iSmOQ+g6Xc8KQ6ih1tURTiG0kA6m6Wbt50zUgX/VuOJUPUhKXZBmIRH5GdbMv5DlARd3tpD2gGbHq7QHatRUamQSX5MxhlIobDlExGDXlYxqW6/ZAq+KRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910519; c=relaxed/simple;
	bh=xLo4vWPighcagwQJbhc+wffzH0vVAVHPHSj+i1QzxbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9wtFAguhKfjdkYUiQJLkKLon9BTwP8JZ+YlO48ycLljAovBGc9eV8buou8VhgTsHI9zijxyqA6H1jTNNjU0A5tbx1Nxmgp3w2LCBrU8pObV1LmQrAeYAnRb24n3iWoUklDjx3m+iOtH9rEDai/1J/cnSe7vTEteLS0vkizauD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwin/J08; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so455461f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910515; x=1774515315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZscZQNsNb/rNQYB/DavkSvidSt1AJ/xdAwrA1z+if8=;
        b=iwin/J08UPxo4b6NY9Wc36hm4AUOd9g7J42WfKgQLEQk7rlU55jSk2Gz/jIlRjFuYb
         vQmV6IHAI1bGPV1fT+u9Aq1UVEfVrUattxZzi2v7PYDHKTOGh9OciPbH07brKRdYl5q9
         6qi1tjC+ltgHMBpCYTptHflxDPHCEu/YiW2owiYVzivlX1n2IdJLJ4lG1eylV3KVo66U
         ruQsFwthPI+ae8qJvKowd9gH6xY/fkU2sb31jTbfoKnSTnMwhzm9S+oasDWO3VsW5gR4
         Z9t/VpIQHRPb0UT8yBaLCz6LWd6ypBH5uzE1yvlk0Bzdsp3L8Ch2e/f0AjluawT+aJtL
         wIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910515; x=1774515315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZscZQNsNb/rNQYB/DavkSvidSt1AJ/xdAwrA1z+if8=;
        b=QZU1mx+HMe4NDq26NC9MZkuWy4uUn1UDMScHWHcK06YW8CBr/iiSNfSlzgNLoPuZI5
         COjyMTO+5HYnn6bjEuL3VILlPfD+F/kKoNKeIaGtydwdOmvUh1HyYx+s0TOZ+CJ2+IS5
         28lNiCWIbCVfh5WTQIZiH4bO3yMi2i1Sg5CYdMe3o40PnzmwC8Zbldssj96vQi2+beEN
         roeXI3IA08pDX8zb3R+u9t0AA7G0TquOpbca/i0uoDV024OinRuenhPIY8CcdARHCtNK
         zAfPG1Csu+BR6ZU18emEyX6DbiovHWOWqYeOzquNWFIcKpuMaW/mfl008224C0UAvH0I
         OqbA==
X-Forwarded-Encrypted: i=1; AJvYcCWMzSTK1L9nZhn5PRVegYHELi1rnPBLizl+qASONH25WsIbJmkrAELMtiZWSRQQhdRIAwIwYPFX97waJ0hg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQQihO5vLiAXGR0uuz9CgNmIRcNwb7prnpy6oHNlpfctUA385G
	bZ0Xdx+3+mIdMxNYn8DeN8s/IXLTQ6OZy5YGBBtEWjKTWitzcb608bkWToTHZstKpZM=
X-Gm-Gg: ATEYQzyxa8EC2DTcwjVv0GAZw9xUPy03bgq00YmGmbegAFhCFUvLWw3KfMIIBka6pfV
	q66FgOORkUxbz3nFX2Bxh5IgMdKkXUpfhGxZlf3hEmG9VqLjlN/3ORJrSs3IPlEvON49e+3j+pn
	t3em2TXMOieU/etqQFhSzvUbXNRtkiV1VWZFZJwXUEw3fpfKXlNiWisdHhGCIHblKhsM1jCwpec
	DjqWGI9FjfGSEFX9mKOYkfS4eJ9DkDnrART6HIdzDp1DDCO7J+gXgsizZNC2kwXFtjnT9Ejn689
	G9e2N6nIPk892ytOSFtwGWrUtTHJ/r8oeOwC3SDiZJ8AOWUzgb+pBcgknYI+813F7sM8JLAee+o
	uPfr2UwtqoyBeFfJfkB6J5z9LBjDWR7Hhssl9OoJQa+W8WtE+chyUw2/V5zAVr7LqZym4i1zw8L
	qIMFnwc9wS7tZL+m5h+JGKXkuASg6anFfir6Ki80UDfjkc
X-Received: by 2002:a05:6000:26cc:b0:43b:4983:5d2e with SMTP id ffacd0b85a97d-43b527ab23cmr11498955f8f.24.1773910514707;
        Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:08 +0100
Subject: [PATCH v6 2/5] dt-binding: vendor-prefixes: document the Ayaneo
 brand
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-2-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xLo4vWPighcagwQJbhc+wffzH0vVAVHPHSj+i1QzxbI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7ntGi9/cWBur3xUDlYCJtNFITBcjKIUAv0U8eVW
 maIGT9iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57QAKCRB33NvayMhJ0XLmD/
 9NK57fkOEHLdy/6RO8xQrL1VFJUgdo2XZT+e/wB26t4jftDmsskbs14wdK2QQY94/QhXzeTIHBYoRV
 6kkJTDHl71ONq+31/lEFMPzkTkVvTq8UOsCa++jDZuLe0IrNEPdYRC1YKSLr+O/b8QVdbNKEO/ntFD
 6BUgdva9BtVvJd1oeEy5IIp8Y7MdE93R3rkuFddWphLPd0B2yshKh1EeMRUqgJLX/ImWrYbWbi8cRJ
 m70hJ0LmEIW1h9XzCegKstYKQT+2c8EPURRMiiE4WPO6TwfnhwLZ0bn/CuFgnkWOOHgBwXiTKcixux
 ohXPSvXhEbrggwJIA/HEI4K5eEYwK/BFwUATsWBxhd7E92Q9kiGYJNhD4JcHfPKtag2NHxTdbh40qg
 I5imT4cfeFkQAGfwrlWewLbpdzAY31LWMMtmR6fDrKw/cU+Rt2p1cS63St1Uy5ZR5aha1nlRx09JJx
 tqU0O8HL1WX8qMsfNof88YTMubhtG23v0qeGJR5vBFOBSUzfsaBxfSuwypbRpmwjWUQo0pU06yJ26X
 KxHLzNSfpXMKpq+Hvk+zAbG2chB3LHTcB8x5sX+pJn/JuVIa2mNF6hnV42eN4Xmpj734qi/r6/MzhI
 4XfN6qHyUyDGDoy5Xo5IE0JOW40SkfaAgzPidsh/a6nVBQF22qWZRIq/K82g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98669-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ayaneo.com:url]
X-Rspamd-Queue-Id: C4CBD2C8361
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5a806faf7170..1e9338a50d8c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
+  "^ayaneo,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.34.1


