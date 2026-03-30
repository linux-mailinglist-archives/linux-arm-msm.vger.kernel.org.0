Return-Path: <linux-arm-msm+bounces-100866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD1LONGpymkG/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:50:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621135F0E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3282F3068594
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAE13DB65A;
	Mon, 30 Mar 2026 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpmxGqVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173F3DB630
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889207; cv=none; b=gDhA6N0WCG0YjsX1tuhvdo6kZWKrmQg6lwe85I9w5mnjZlqXCv+Hd+amggxPIOds2IkfR6YGbXbuHPB88lstoJhfhSoGQkbDlftZ4u+7yyBVYf5MhK6+20KqMZNlWzwd3mO24B/rw7DAgvq6vQxQX2HBun+MXWi2SxnrTPsJHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889207; c=relaxed/simple;
	bh=NwyXZR7QbGUDm1mOXnBWp7u20Y6XzKuZR4MVtnLVmfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMhWXpe7WJ84HehOPDZ4lbRA0IA06uaQBPmKoBnV6DtIdX5+lbxPRNs7gsq8QehGq9tEiJ3x3QIPefB2Np4nuZXfsd5KUvA+jDhyxZM+uhU8hja/7OfxX6rgzJ5q1ALE3uF551+oOxUw86nXYPSg8PoXC5ZbZj0xTGkECRM+J6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpmxGqVB; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cfc795ca97so420375385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889205; x=1775494005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=FpmxGqVBiNIIVukMq+z0S4M2iJG76S5my68R780eE0C6R6EwiFOMurIf9J/0iqKg8U
         IfJ6qp0XzpsgBKvUyty52K5a5KQ466BeWMizLMx5YBLEvVhyH6y2r8L1FBtbaKcF2TZm
         fBNvyonAwxdaW2iMDgORhP1fSPyDjpi/trHA3B9efGCpghgsafsd6KJN+vPcG8Cdr9ka
         01qxxpYlxQGDUibTm0/81SKDAamKwjfCviztPcURDV1YuQiH5QodklcAgGyLQ9ZLK5jQ
         FfrhxFp9bK8Isa4UPcHGfKe0qj00DP9DECGrrNvEz95AZqkV6MVG1gMqZakJtrqGOuz6
         fV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889205; x=1775494005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=inH3GRu2kfZAWxas1l1G+uHax3oSac5BZpgjsmbaNv/uEgpiR3Uovtt1yWKnb+n3sy
         8n5uVaI9Nm3ZANEYeg82y45d4ohymuKyjcFQGyYyz80QAFT4RTaKXJCxAfsfPH/JtxwM
         IXEMgdWf7AQiSsV1oMqTukG/aaAERopdDelT7RJDXK5Z/6/e5DiaEIcI4v3zTYcEOOBF
         JbLbgDf30CAgLWgFkd4JWb+f1wlX6nqBNNEBgVaZbePF5OPKSGw/lnOLfk2eVwDU+kgn
         QnCI0pH/5O6l8uYLW6ECy8syViA+0n5pSeU3x7LfMZ0HcK8uNFURKTT7xqad6ze6b157
         e4lg==
X-Forwarded-Encrypted: i=1; AJvYcCURckGEhtuq362HeseZnVNG9XR0wacmOdg+kTE/R556k5H3/P1yOCsQW99SgLtfM9HgzGR3j5KzmAo5VZ77@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWNH1HwDLesS2tsx6ufoeV4S9ejnD770fMljYGCpCIy1ibx0H
	xwJxYUV8C0tfqWrDeCeZjTU9npmJ+ON7k2rFsv8Nj661nbEuRpNU/YfF
X-Gm-Gg: ATEYQzx//dIghJmnrvyPCazv/PavSz7KihqT/MUaSIDID9BzPueTTb7+249e74X/dSu
	ORK3l2XeLDTmJzIBZYPiOOeh1zDKABy4lSAXuXkCNC58szh/JnOnFWeHDKdPG8wuQIMzH1TNXc/
	8VO4UI7ACepnPItabJnJEN0FGxLLfpnQKxN73iUESxlXYs6fTD3s3X2gOWorAMTPlLCJYHrruj1
	gvJPtTerg/DK94FpZTkkDTlVA5LBrCBs+GQfnFhYLFTtoXmah25JIavOQuM09ClVhZ+sxOzwpmi
	TpEHrPpQn9sLbaVO55y6FMU2pgileFry/zFC09zX+2F8C4C9CVI3M9KUlWMwEnYTEG3NjROisKB
	nuaa8vnsxkx5PS3H+woCbJ/Pya+YbEpf6ynaVUAPqCF46Y0g8zbH4AXOb7ro7juCHbs5tU7va/I
	GLaUzWpPA3jXO+yxTpyAQ2YCk=
X-Received: by 2002:a05:620a:370e:b0:8cd:8f18:d1c4 with SMTP id af79cd13be357-8d01c8011afmr1722421585a.56.1774889204797;
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm686529985a.2.2026.03.30.09.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Mon, 30 Mar 2026 12:47:07 -0400
Message-ID: <20260330164707.87441-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5621135F0E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index cf7b130ea0c4..b0da24fd1aee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.53.0


