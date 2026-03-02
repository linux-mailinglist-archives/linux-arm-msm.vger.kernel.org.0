Return-Path: <linux-arm-msm+bounces-94902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJjlGBJ/pWl1CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:14:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDAF1D81D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 469BD3064DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F10F365A15;
	Mon,  2 Mar 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR8g0vgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F10D366563
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453538; cv=none; b=iUVH6fBr6qPeu64d7oY11HFNhtuOCkfKQakqSwidg2EUEVt+McNrIGzclOTY80HkL0tLKffYjVuiGHMoiwjwCBG3d8S8eXMKiZG3R/6nwkJU9IKnhPqw58s7wvVouRXlAe4s1n8Cb//s3cn1pouW3aHQiwgS6VRwDr4x3mw4SkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453538; c=relaxed/simple;
	bh=jK3O70lr/n83O0mvVAfmfEbA8NtZK95vYr73J+6aozw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BhfNrCSMZyQR/XI6yq+ZADmBnbTkAqCSZ6BHPn2iJTg63r8Gb+v/IuNzSFUuSZE09Ju0+xQ4UT68PNxsr0mHRrzyoq4OJxdu+IU71cakkKdRbNEYYcY+yp5TM+29BBzHbA84Jc2JU0tu6OkIzp/Q4DeGLfGF3CVcUY9Jhxb+nr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR8g0vgK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8273eb7798eso1860352b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772453537; x=1773058337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au36hZRoEWWWGIFgYo+iyRmNylM30RV6NbHb8EbtMNE=;
        b=cR8g0vgKs+LEeRe3w8ByoKsi5JFfrUe3zDU3aNg8Dn3ArMdqhxNl0//vS0oxGulayl
         7I+xtdMDj2whIzBembD+xoB1drs7WxegpzutjyX/wPgrfzuTACaP0gCxkr5w4C3fqQGK
         CV/sM4+YkyCLdxuBd8YiHHSYQ8RoPMuWfEvk9XQdZhR6da30oA/51dAJWXjphhhMJaCW
         PXP7DHHdLZDaoKXV/flTf2Y2u3TASp3ESO1Xtedhqnodujye65zxf1c7cNcxGUZ2Z+Gk
         5N8tAeMaXdpOmcGaJOT3gOXUYm5kF12AidvgsHo1Uz7aleiRdGBrZk1mB7UHULCs+fxQ
         ApGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772453537; x=1773058337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Au36hZRoEWWWGIFgYo+iyRmNylM30RV6NbHb8EbtMNE=;
        b=o/tTYC+Op0lMXErcJMBEb1Fol72JlozsYA7rE5r7ThKWdPjBM22Bl/mKSVJEayFBQ6
         a9s4zYTfd38OW7xAGd5CV88+lWw+UKEwB9ZhV/hg1QluRylIbr5ZVGsfN/YggTehBJpv
         LmqnTdRTErWPghUWxzVu+psGMz8m9Sh266GLCtySxj3w+ciH2VHiIpTJKYbONQN6iaGN
         t07vf0cj+6q7Kz/Dbfq4FvxCTs4njjparMcR8DdgbWYmaVl4bfErzQq0uluzF11bIACj
         MpV2HYtWsVjyFpmRcvC+iXlHrpqKKiBtpQeg5/8QRA/jyWiCpznwHEHsB0k8DxOTn6FA
         G1CA==
X-Forwarded-Encrypted: i=1; AJvYcCXSwJw+rFtWLT6NYmIWkEkNy8baOFjuj5tVe5PYrONVtakK6X5wX4Xx75KmpXmp9yrOlumoWDFt1IiJol1e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6eiopRnqXf8HgICVcx7+1fa9OEsIAFaHFyaIAFyOr3250Q8mR
	B+xXiSvWvPKs+sO9de/zUFHrrl1v3h67TFWNrEZD68+m7MGhMGWQEjxu
X-Gm-Gg: ATEYQzykGazXmixrebPzgB1weUwUhCPLDAPEObm0DtF/V1ux2Nqe+TlQKzbOxcdBvxG
	0yxfeJ3KqzBpRSc6P0ZPv2GWgz1p5P/JS3eF011RzV4JEBeUdfmh3MRLNEcn5oISWmbY/IQeQsX
	ckP/ayZ8J1Iunn/JxU3ce1ZFxL5lIfjFZTSsp8xRdKuRTKm8iGPkNg8F2BjHCqtNoOKoNtIbGKZ
	VvWqcBYJ8bXCE5ZOY8VFROCzLetGBjHWE8HDTOCpeKrQfLMIGmAE7qyVnyotqWYVhK71yIwEQGL
	LuafzubUMs9X0dX03quYnbWiLjiBvXB4hSyj31Fq+ccFqdMQ+/T1Ft2IT38w4CdVK3D7myWbxXa
	BvssyRMuYtBqJzsRpi/33HJgrted8z+uHh6JRtKU/VDrh9DNmcgCLv6QhRNDjy5s4XzTqGTTpJY
	yylPjWmpwyDW9foJ4BUVrZ/OnVknG4F2RUQiTdLw54pKGptV+/
X-Received: by 2002:a05:6a21:6e46:b0:366:14b0:4b02 with SMTP id adf61e73a8af0-395c3b0f95cmr11861553637.62.1772453536856;
        Mon, 02 Mar 2026 04:12:16 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm11454177a12.30.2026.03.02.04.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:12:15 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v15 1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Mon,  2 Mar 2026 17:41:57 +0530
Message-Id: <20260302121159.1938694-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302121159.1938694-1-tessolveupstream@gmail.com>
References: <20260302121159.1938694-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94902-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDDAF1D81D2
X-Rspamd-Action: no action

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..9732a32a5f59 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -883,6 +883,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


