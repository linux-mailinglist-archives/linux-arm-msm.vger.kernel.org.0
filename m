Return-Path: <linux-arm-msm+bounces-97054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABDeIAO3sWl0EwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:40:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C6268B84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D4E130151E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C76935DA49;
	Wed, 11 Mar 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOzRELnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B6269CE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254398; cv=none; b=huAu5N8ToslDBT0K8CO8pat2nrPCoMyAmDYcxYkCQNJGOd1Vn5VyO81cxBNo+ssbn51lty/Ko1AhAcFMu/7CYbBqBJKQJpOEjVSIpKssLeYEDFkZx2Ke2IXQGpyf0wxGSfzhh4vC+u5EgTzMBl3IPLK6M61cV2IM0HT1UR/fJ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254398; c=relaxed/simple;
	bh=UpeOhvo/uk8yi+1q96JIv3h8o1rekI1cCyqbUfcNtjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH6LfhzKAQCOuOSCTSrsxOyN/6gAFDJNH4mIipj6MoJUzVQ4qfxt52CvsdgEZgUd9qz5UF0lpnfMkbEm2XZOw/X8IloUFBq40l29up4HYcp7w7zJdPcRIPjdVUz4gjLM/KuNVEKcwQfSoxvAQPHnHsfc8sZ9XHt2hpD6s/FyjEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOzRELnI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso2141595e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254393; x=1773859193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JpZnzVxjuKCYPTmp0ohRT+2k0IA1puKSWLpheS1yF0=;
        b=HOzRELnIBkPU1YZg9iBi9Pe10GzyBceNDwQb9gVBEtYiixbYSS8byHVvTEZUCLfc4l
         ZyacaF5OM9Xqz9tvsCV17mrzgE6lTnY3H4hkwx2xIJImW0oBCmtZPaVqhmLLonQq5nMl
         wUCthEZNHkV8l8kl8oraVPcQthq8IqSqirc3cAVrAIQrJpouYAs6BZ8mXo2XrsT/aSkA
         7qcxGnSx0+Yy0vIFdaK448Xc98PV28Pr3/m4VjDKPR1MRzCCjaGq4IMuZShynewWijEe
         QZi4LNi5KAjgSPXubwSfZjctWfWz2KLvBHLEEUX8Su1jOARVWm+B9kbyq+ceb7g4w9pE
         QfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254393; x=1773859193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JpZnzVxjuKCYPTmp0ohRT+2k0IA1puKSWLpheS1yF0=;
        b=pw52rK+si7AdvkNMwgRKeqkUYqjEAp0hR01XH5bEkM0wD2/Gg8PfbD8yvMGv1jXaWX
         HHlJkzRGKC4ZQT+Mmp55ytNphoTsma7nudqhT7zR6RBtLh4p1vbw8GGUbpSsL9cK5+p5
         aWBf+4zTr+s8OH1txp9z0RydiCZttR6P7Mzg36ddFvAKHFcT4KnxHLeT7tiaXT9lrHr9
         bTPhjf7rbHd/ZCrhy3HWk+Ngg1rcyLdWLCLJ1U7fKRdoZUbX02+mb6HZjfJVRQxmweAo
         KZ2eRGyKmo9oQJHZTuhhkEvMs/HA9QmKLOHVfVp5CKSwCELruPaV99G0fYwxnpCVRStc
         kghw==
X-Forwarded-Encrypted: i=1; AJvYcCVQzb0JXA6jDqT2Q9pbfkvxty7i85bzunxyOOjEppTOAGIO8UuKJGct6Zs/B7ggyZSNtkDarZql6zFSArek@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/hq3q2Vd3fRGu0+QEZVDrevgIuy88Gh23xxOwmu3AJmsxYvM
	a53TKWcG9zLmuBjOVCvCU7uZCPZRkfKbc4TyDETRwP8n7BYLO8ntAS9s
X-Gm-Gg: ATEYQzxyD33y+vyd31Dxj/ap9J+FIT8bQYqn54ojtm2JMjoSPuqF+v1wdTCKF1gX8D8
	DOvN5nCr6on9iCeX7QhOSa3mSN4A7bMQNcXvPDg79Jjx9b9cEydFDnvi52iir30BQxQzWAFocfG
	7HF5NnRooUyC4JVvqedFwFMcgMnNUTuhNGphnKRnZg2AYXFqksmXA4c2OTD6tOV2G2QUZZou30K
	dgaFSCLfw2sz0ClTtjOrKQJRUIth3a5BsuhN2oBGTIOFmNGbcp0AfKp2+Epyzt3XLkMk9LaZzKM
	u8gdJz1bkibuETe8p+TwgwEDCnSpz1Emkz//tsm+sRCX9d+4K6fDDnOVHVaySPVX+ijKXFks1hf
	NkX3taGpz6afMhzDWj234kH+e5HAgXbtpXIRIb8McbgaQrLTfRUb9/3rDpaiTNB2WurcC4j4hAz
	A4xITSLziX9czcUHCJYuCuzJ650McnFzX7BhHagMpBK3OMbpY5Pqv4TC0=
X-Received: by 2002:a05:600c:45c3:b0:485:3473:d4a1 with SMTP id 5b1f17b1804b1-4854b13e63emr63571735e9.34.1773254392844;
        Wed, 11 Mar 2026 11:39:52 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/4] clk: qcom: ipq-cmn-pll: Add IPQ6018/IPQ8074 SoC support
Date: Wed, 11 Mar 2026 19:39:37 +0100
Message-ID: <20260311183942.10134-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97054-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D97C6268B84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simple series that adds support for the common PLL for
IPQ6018/IPQ8074 SoC support.

This is an initial effort to try to support the Ethernet Switch
present on the QualcommAX platform upstream.

John Crispin (4):
  dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
  clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
  dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
  clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml     |  2 ++
 drivers/clk/qcom/ipq-cmn-pll.c                   | 16 ++++++++++++++++
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h | 15 +++++++++++++++
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h | 15 +++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h

-- 
2.53.0


