Return-Path: <linux-arm-msm+bounces-101159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEinLkEpzGkmQgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6C370FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 238D5301DEE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6C63CD8AB;
	Tue, 31 Mar 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjk/78Ru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8883CE499
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987583; cv=none; b=RdUGzD3Fn0GTPuRfOm/w78fdtV8ljZzyj8jFu3ylo486yynt7XcrO2F37/1IYIxZvBRqp71VwULY5viUCSsreq7PHCnFlnyfJKloTMNvLNkeLBU1DCEfl/J0+Q/LzEq7NpCR8ppUVKZQMZo9i4Pnj/lJnJGKdKKkU14hML8ydqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987583; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVoqDqPvKGmJ9ooqG1rByjEPkY4WbpjOUcaAAR+Z9Rp8PWyg5twT2hhEGz8UQz0sSv5CcY/DUhCBYTS5cA9jhjdWzup7UBSWCcMElzdYoQcypu2a4rhy3IQsQxTyUH7PIUtYkMfhK+gLOc3szDY4ob9L+eBAy/oN7yn01fecFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjk/78Ru; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a3342d301aso13374836d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987579; x=1775592379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Pjk/78Ru/5PeRhGeiZ8TQKT3NzKBydjqXqjigkqcm/rC/MnLG0kuLbrIz1/vSfveYi
         4/4f855idwUVJstWczdLVOdNlCcwi8m3LTG+oQpnSaSC4IViXBmtClUGbwxl1IkOj4x+
         YbdUH1vr0dBvVaGIiTLH0/AJzcBc/BdgjXkkKiDA96nGrp+n5pCtXOtuWy0qLk4Sz+t5
         y77DrlXhbekguX+UtfTFJbs9uLI/zPTKaUrBNCFZAbcwEpi/4DoqTDfDEhPOF71BGOPs
         FlZa4oCMv+1cpP4XCqdWBoOulddZbcpaV8jfGRqhYVd+nyojr9oAjTb1O5Z934q5lJm0
         +YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987579; x=1775592379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=rAlORATDAj9o/JXq+WLDiYwoE1L3aFVCSpPzpaVGqn4SObjlxp4gJz/BN4H1nmvEqU
         aC3CfJYS369qIhb4LRUJ5t25zUy3Q2ndWEgjgf2yHqUYWRneC36E52zVLqwzLuO8pzjX
         mTzDvxVPe4yVegBzmQcg4sl6aTiiC6hbc58gIrH8yMDHsetEJpR61zkQ+ZzfTkcSLVug
         EUZOEgexLhv7UFASlhqQ1A6/0HEAqMbytHPm8JHwoXn4uNcLB/xgqCTY7w3O5ZkF37XH
         04y9mdQcpAHYCKYI8WUWec7udjs9GwAzVMNtFyE1p/780f4UJHeBDeugKyKLIVvM3EZo
         90Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEFUzgnG4NqpflTfLV9plZ889zrZKMXNDEx7KueBlX5xxRc4qFnuRFM4lVWSQSFg3JP0XubuhOoyZuLjw@vger.kernel.org
X-Gm-Message-State: AOJu0YysqaOztAC9QuJyLFOffwWp4lTCeWY1XRm9XiefG+YEwKx+8Bio
	wJ8NBmdDjTRznmzY8LkYICUgHhYlfrbD/nQ3zPdDKfUY1cHSsi5RFToG
X-Gm-Gg: ATEYQzyg8VJkzS3IOwkVyJssO7MuIaT+Ktr3t9ynH6zOP5GV6LZIsZxG08FDXyOMUFW
	tmUP/2E53FXb64cWJQvGBjJV6Al3PUyl6wqBZzaslF9ko1Qs4mZEsm65br9rObY5LwlBPJ69tv5
	uAQdrta8uZnX0R5B+rbCn1//pGlybr9Jnp3bA4dL8bDBAIiS7Oyg+9JdyroYYbNRv4+wvl4WDMl
	8ixkw0lgrNlMIBbALn0bWvl89Qr9HfW5uE0/drheUavp0n0cj+dhBgEZXapqZzCSNym/QugiVdg
	vuZiQOYJjh2NjjlceUdnYFcdMQaDi8p2KYOtjk+bQyQmHmGfP/opBezcoONafuc2nMmZw5rSrX6
	Y4Xmtc5b05JPqFsn9GF2NhevS1yn4onXcV6YSrIXU/L2odmX6qf37uBHp/2e1mP2XSHmZetMd8X
	xFcE4Tv1wTCz9Gzq0+AlA9QCB5
X-Received: by 2002:ad4:4ee9:0:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-8a433d4fb96mr17415776d6.0.1774987579053;
        Tue, 31 Mar 2026 13:06:19 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm100400496d6.12.2026.03.31.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Tue, 31 Mar 2026 16:06:55 -0400
Message-ID: <20260331200658.1306-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101159-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38D6C370FAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


