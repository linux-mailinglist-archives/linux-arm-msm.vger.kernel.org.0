Return-Path: <linux-arm-msm+bounces-97751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKZPE6BWt2lsQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:02:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF62293346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C96D300A4E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8CE227565;
	Mon, 16 Mar 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMDspcoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976421E091
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622924; cv=none; b=uQ6Ue+hWqUxpMDTujBi44QDVcpPd207irQ1MD43XKA9rlYRH6F9uPjpYP9M+0285dzFyrI9ib0o72nv5xFiwGTG5J70y5kXFIruLraqamMyMOnfffMS0bhr5d9LgDorDwSl6ty8rTFdX4/LHZurHXy3o23SbMNbBhGYUULr7koI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622924; c=relaxed/simple;
	bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnIfWQD0Wt5LxowWbiEodzZuiQN9OTG2lTNEXilh8j7m0o3J0Dbh08Q2foIOyDQYDjfDqRT/adr5wAxEjsfufrV+PMBym+2jRmxHnKkNkKWS+fiOwAfseoKOpHL1WjnuuXeMVoe7+7QV9BuPeCp18fDjwEbz4WfbpDjkSYqcTY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMDspcoJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b41b545d9so820375f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622921; x=1774227721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=kMDspcoJmTnoSXy/ekmFJb1wCA5uawOKEIDIb2j27H7XIZ/ZyxBx9Y7AJV+FHN13hg
         bH6R9YW7GQtKhS78yga0LBtbtiXZdFFpc1/04JFcM5lbP8tdnbJlwHFQeuSuHvNzhuNO
         EoFmc1i15XZ59rDMd71ayHZQG6RZMgcExQm26lGG3SXxYMnGjRr7X44ja16RLmrtHhsw
         /l4X8ar+V/q3xYkb0xOsACjGb3+WOU8eUMNi3rlUXLPb0dDNdnhCDBwRCPuPmG6hxDjA
         dOZATfap6sakpCbHmv/MMM5WEztG3znqt61qS/sl4Hu/WcmPn4EBYH4av3AH2GJ3fHLO
         cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622921; x=1774227721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=UOu+lhAVeAPUrWf5nfutlKow3G8ZFM9wr5JrfKwLgidRrg8SueXHdCMK4VXwYYOIn3
         WanHaq3a3enmKBWSL4ZGNQKe/yi1Oc8UQwDP/OX1h4bExnnKVm3HVr2lGk7px2YP+Q1y
         Bb8CPQ9dlS0FDzWvW5FwjnKRER+xw2JgTJ6Ga3ruYqsCBz5UOUPG/xELjNtoJlfgGCZb
         WqC1LAoMuDtSHHlEL974zNk8QOAG2CTKZptbvjkapy0lGJp908QuYf1/iAUjFzoSbKTU
         WMmOaXDX/5B+7lkCIjCBrfLBt7qEJ9BUcD3WdRj0Td31zejyCUEaJe9S+25remLxOEfV
         6X2w==
X-Gm-Message-State: AOJu0YxWWEdczYxpYnRq9nPrBj2jfVtJYsL/8pN5811VKMbZLkVa454Y
	2g5LGHlxak1dA+thBlqIVzsY8pGI+pzMUfxgGbBZinQkSn/Dw5zPbZKXrft4i/Qu0Eg=
X-Gm-Gg: ATEYQzzI1rmxUr7bj7xDWI3xGDOCST2r2wlcCkkLFCfXDuy7JiQqem9TLS1GNmO+z4f
	RFay1QT5eWoUdXyUQfcpHc8vOmh2RpB2aYFjMBau/JM122LjsnCiilnncGRXmnnSEvcXHpam1yc
	LrA7cvjMzHPYj7R2W1hoWR5IyokfteVDWb1wEImg9zO0ZTa8Jm6prOyL6OKFXwxrWL6vqmB9gmh
	ktRQPb6mvDcyZilTMbq6SnvL4b+ywcyWUH/YUbyKzKtmIb2xJGVCaCZdg0HGMUZd4xVexYDpc7j
	3kihEhQV4Qwt9u0/TMYj2wKsQVRLKmtfTGsUUT7jSgMaqI1h2f3o3pMIAxjmQzJbdOMAmzrguNs
	NCWpKAPQ6Y89d5GevY8pF4aFkW561aDELG0CtZ0CvlJP8tIGFp6f/RlbwuNOXz3Mv9eU2bDGIHR
	l3m+cqK8Bao77P4unxA1CK/M5C+n+zvQZndIs=
X-Received: by 2002:a05:6000:4014:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-43a04d83f48mr19743351f8f.10.1773622920856;
        Sun, 15 Mar 2026 18:02:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:01 +0000
Subject: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGm3VoyiZNseu9UYoYC6eu33PYlElYW9JtR6Z9+S+cofJeDRy
 IkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpt1aMAAoJECJxO7Ohjcg6qWsP/RgS
 BHzfWTj1wcBuU+6PV3S0jVOIvoI86H6pdK+pjyAky1grBTPY26KE3LPamd3au9EZGClSU7SCuAI
 VcSaNrxpPGBbO2vZPWUZHgAsTd/DyHvkjUAKajPx4/SBy5gtbAzOapGesptckgbfdv5hLv/nFir
 CNIQlbH3UJnxbZUjVyRC08fn1HNlL+5Aqtbh0wYJTqo+mX85OgIyZL/qSSWqYej5P1fQvMtZNIU
 BR1gycYTalGd7hZp3toIe+UEsNexPfdF5h7RfC6MthoONUIDKbribA25cJFrFsieJAmlARWfiGh
 fAqsDlvgoM7Jdrkgt30UfP244qrOvON5N9VfBMoc2xi0EGkzKlBCJzaUHAhsN7OxLyf/zjLLimy
 ukbYdDQv0TQyC32y195OjR9pO5s7oIIuw0df2vKVSkrs+zS/5AxkG74hxRAvw6X+S2boht11wbT
 YNSFibbBS0IiMS0li/8tdwN0nngNmbnODico41Ls/GN5VpsD0Ad0j3GbqXrzp7gibQsEhEJnheK
 bxkSZxEioXkdEdCrvBfaLkAun4KhEMHP47SWOFqHGy1AjB93OHhBv7dHOUaMwIWA6mcbOqJnytp
 FXQ/csnLAM7c5JamgRhkWAEvJsOQUXN7tGZXiV6PY/3dbntLJiT6NmLjzKjUUozIH3xHy83f2a+
 KjRQP
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97751-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,acb7000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFF62293346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "simple-mfd" as a second compatible string to allow child nodes
within the CAMSS block to probe as individual platform devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..b5654ef71bd89 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-camss
+    oneOf:
+      - const: qcom,x1e80100-camss
+      - items:
+          - const: qcom,x1e80100-camss
+          - const: simple-mfd
 
   reg:
     maxItems: 17
@@ -191,7 +195,7 @@ examples:
         #size-cells = <2>;
 
         camss: isp@acb7000 {
-            compatible = "qcom,x1e80100-camss";
+            compatible = "qcom,x1e80100-camss", "simple-mfd";
 
             reg = <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,

-- 
2.52.0


