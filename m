Return-Path: <linux-arm-msm+bounces-101158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC7FGgUqzGkmQgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:09:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52A371029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC163026A8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6969E3CCA1C;
	Tue, 31 Mar 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKuG/IaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A213CCA1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987579; cv=none; b=iiY7u1PiTg8PIMUiyFdrCmeLpBZfM7Bsl0p4VlQglFgnuwzbMqCUKVWMLQ4c84/35qcgfH97eOJ8RbTg3DhfKL66tHmU0uUq3n96lcYeJEGi4DsqPzIrJCdWVMrMbs9X5ZvaIxGuhfLYmz8Gbg8IJC2Gma5ZKPNrJb3+/qbNcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987579; c=relaxed/simple;
	bh=+jfuPOfrvlJyorqipEtBDPEwBEOBADumN3Z9GVWqrm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lI2rQTyv3ioDimz4yRSRU2YHzSDYViC+7ugMCx98X7NHwgW5GzsjSRsekSQI1+QYgysrVsI+R2p4qfNfm5ncHnaqQ8vV47spUwpxS+XSNUbmaxmF0mBwc6jaCfGfdahyNaP9gDm8MUBlDTilDZi2aIVYVr/J7OdJpDdrk3rZHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKuG/IaR; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c6f21c2d81so562440185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987575; x=1775592375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2SuGEcofMViAjcduIJKVxzZDL5jSsKT9V5K04cwa+Y=;
        b=kKuG/IaRBma49+MjTcXk9IOK+chvpyiQifYx4idlqsHmSyEKVcR/kz6KaplklqrIXE
         Z3cExyZnm/xBApdxmo1Zaqgcv8j3XP2b1C1q/o+Fkb/6dsw+thjsNlAR9wNfNZcN1Tw9
         7DGde3MH2XR0pCvX7a+QEt7uj6GgN2MCVntCzFZRDlDchS4tvqFtU4kF+ALU6I30Lc9z
         XPgDCze2IYxQttjJj4u3CMt3FbJ+CEydxJcpw1xQDtTwiW9+kACw5OPCi2DoQSCl/Wwo
         J502nRgmX1rx6N+qQD97hPfbaO6u2IZmC3XEZ8ifEiHaVXqiorEBXRjrhcVBqnLx4co8
         IaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987575; x=1775592375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2SuGEcofMViAjcduIJKVxzZDL5jSsKT9V5K04cwa+Y=;
        b=apJCyHtHOhUFdnt2cU5CbImC+a/XXGngH30GsiCcU6pvKwNkFIaxpM0ZGjx/EGbdwm
         bd3xQPAcYRYG4S56Yaro5q+co9saLfjGCiN2vAskAILmBqmI+4X8Zt+wApHaaL+gwAAv
         4uUftSQMryYmA6oPvrMKnYAs/dkEiDvkxsCTiUNsGgXP+u5HE5E220cpE6V0mhlmuyDn
         28KwbKn0lMicOoTLRtDvKG1V/mk3CMS/txo8tMMaI3dU8qb7og7WSziO3qAKjnlWaexA
         qFAkphdglyYcYTYgs0ce2v/XFuAAytpcU6HaaOikLB6mzhaHgKCFZVjYoojFMiBGk9dV
         EvCg==
X-Forwarded-Encrypted: i=1; AJvYcCU5OBvioGp25e3+KREys2XE2m6XBZDGypZNA7X0G97+BJgSwlROyQPXIOz5Mjmt31J5633N+fUoDiu54Oyn@vger.kernel.org
X-Gm-Message-State: AOJu0YyskJfDL+BGK8l+d59Dpb8exapN16mcZ+icHMSVhj6k02Ks7WIM
	x7svhCCWpDCbLD18vd4WJW0/vNs8dZgXb5ygIMnS+VA8OxmWYBOFSHgw
X-Gm-Gg: ATEYQzwoKGrshlLRtg0v7iKBLHGfTzH9Ee+scWcPVmAENKkfg7wdXz+blC6nAsf9Cll
	h3zlFNDBoXx0TVOpQAlT9f0MCyoEBQEStqO+Rq1SVOybA8tMeJWWL1HVuTJPqLvOlh8rgXtGXTC
	d+3lL8YixVSJaxYiJCb5v8NmrABb6qmhDLZenbblPNTuhJxrErgWmRQ7ZJDO1t75/IpEHtfNMLF
	nZoPGqTGRZwEzn1jATMaeB0vZ1n6vJB5EP1xtdvRFAWzXNwqEXfZi5p+f0fECpDxSuxlqaS52gq
	8ACnGvqj7opsEGm4ml7T8Z/9l6kwOCclx1kU8c3jGFVvipnxiBzuZDT7Nd9crDnT9OUrHBSBSe+
	h8LyMVa9bjy71GdpVZWY9Wk8BHj2TjDexbOuA3LKBcFApues7Y03JjN4B4OSWdRnmH6k2AWY7q2
	06Hq0g2MfpbXGAN3BcR3gfOOa3
X-Received: by 2002:a05:620a:444e:b0:8cf:cf45:140d with SMTP id af79cd13be357-8d1b5b25471mr159346085a.29.1774987575026;
        Tue, 31 Mar 2026 13:06:15 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edc650sm913382585a.6.2026.03.31.13.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:14 -0700 (PDT)
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
Subject: [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
Date: Tue, 31 Mar 2026 16:06:54 -0400
Message-ID: <20260331200658.1306-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101158-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D52A371029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

Dependencies:
- SDM670 Basic SoC thermal zones (devicetree nodes are touching)
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

Changes since v4 (https://lore.kernel.org/r/20260330164707.87441-1-mailingradian@gmail.com):
- squash reserved gpios patch (Dmitry's review tag dropped) (4/4, previously 5/5)
- add review tags (3/4, 4/4)
- correct changelog (0/4)

Changes since v3 (https://lore.kernel.org/r/20260328021036.85945-1-mailingradian@gmail.com):
- restore review tags (2-5/5)
- add review tags (1/5)

Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
- add minItems and maxItems (1/5)
- add review tags (2-5/5)

Changes since v1 (https://lore.kernel.org/r/20260210021109.11906-1-mailingradian@gmail.com):
- add LPASS in dt-bindings patch subject (2/5)
- change pin names (2/5, 3/5, 4/5)
- add reviewed-by from Krzysztof (2/5)
- specify gpio-reserved-ranges (1/5, 5/5)

Richard Acayan (4):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   8 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   5 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0


