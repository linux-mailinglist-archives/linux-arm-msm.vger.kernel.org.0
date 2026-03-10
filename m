Return-Path: <linux-arm-msm+bounces-96428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFpOHNdyr2lPZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB2243864
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14AB5306CEF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8723B27CCF0;
	Tue, 10 Mar 2026 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MefgSQ00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADD1FC0EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105859; cv=none; b=K34VNdUXoIHwkBUvqduUdTIDITHcg210bx0zD+KWuezA0TQOLffeFcLBfJU6YGfFKoDjUnBh/7UGpr6uQejswPeTCkU5Ih4ojPAilVQmWcFjdTwmFk2Cd+ufkPZnisVVSoQD8i190gv6n/Q2OqVl0mp6iu7uadpWNvvdpQxkVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105859; c=relaxed/simple;
	bh=4Ze0y2cjmtPpXTVBK66uy64h2g68p4mzHlFXiYEMiMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRTQp8ioM+cntZIOVe9tkZyMcYz05AoiqvTo9eLjgWEkMmWAdYphg34Rfc40cobtuKhs8p0UQV0n8fbBSCFuLrI04IaFquX92eqE8Y9XVey+A/vxDtdaAiCO8jetR686fS6mPeGmBPguViUcRiBfMMCI9yWq83D0ChEYU4wXEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MefgSQ00; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd80bea5f3so125610385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105856; x=1773710656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmMtH/8gaMTRAwfMry41Wt1YyOu+JvBNqb6FqEJnCSM=;
        b=MefgSQ003RNz68tLL7MROcNp/GhnbL0WumEuhG4iq4jLK4giCbHM7+pOlp2tWV79s6
         mEoe4REMP1aTnwptdnSjy6D2zRYbUh3rbZTt4pzRKHWAs1vy+Yrv0ave2ebZNbS4IW/F
         BwvZwoXQQA5B5g+roZlBV5K25IaRtG+Yq1akHfaRjWmdmcdPOQEs5IoiGoqBc8bxix9/
         xvS5ft9wgOTrHvVE9yA7R7MNtUaH5ktATvYzjVuk4J0in8uMOUG76Os7Nedj71aRToLr
         ndilUas3f+DC92Q7FtzffvP13L6pEABK9F5+LojRYNqlosk1bcBOm9Z3l28UUWNitQ/u
         B+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105856; x=1773710656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmMtH/8gaMTRAwfMry41Wt1YyOu+JvBNqb6FqEJnCSM=;
        b=uObVXS7onSyCe+Dnp4IRwCrHJ6UK5p6MSa3SgOfTfdKgyoUJGcryWgCmmZSB5cT+Nh
         9e7sVWJ7dmBJZCKfALFsw0BtSvOA1ZbIJLIyAmg5YGeWmJ9d9mLCpNyxifaNQBHRlqdk
         OaGXjmtSI5bVbLZoMoeocMg8eD/uV8PsXjYK34cHqxmZb4a8O+Po40wDLDfKhs6rIm5h
         UHnamYCBdr+h0+8PnPlMoe6RdzrpiQDZ+wnZ8LoO//nCvRt1yz4h7IHAG64NrBhXcuU8
         ZiOgtJrvQ3XxycGD8vZH2VwZOw0A3q8XMwmBAg1kuuufH+21Qoxg3B5nJHtTyN5zziL7
         q7FA==
X-Forwarded-Encrypted: i=1; AJvYcCUsoaO8QUzwnUGkyy/E9cC4eLH9wr4RgJ2Tde0VdYMon5a0TH22K7WUOCKnAWjLEJFugCyThBb1yQV/K3Ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZjhjgDcrT+/LV+45vWP0PBpE/71YQxH0IJCK5u+q0bFrjrV1
	dyGNds/GGcvOHD/tLo0bUAH63cNFgCUcKJYGWCzpO8vDPYHUnNj6/zio
X-Gm-Gg: ATEYQzyScd4O4hW+40eDS1R9TRlKpiRoeNGiV9ICpLcgyA0FoE3HIMy5Y7aFXM/yJTv
	q9a1aIYzp8s95UrNmlw4bd2OsaCn4KPyoTTvYNFnkWifJQu7d0i/+n4aNQOMrh0Xkx52ebYVv8T
	ytxujyn81lhJVqTTQTO0v5yMb1tIDlS616K74+3SeUOeKaaC0H5Qzo2On9DTiZTnG/qk3yLCFev
	gPEAZrSBHirewrpMNlxeWiF7024HiMCDNNlvhKh8BwczmSSSMfupSiAXoGSa48oM5oB6UuZrVmC
	W4eM2AeeN1aOdOfmLdjrPVH5JfQYfdSBBJTYwtSMVsnPtYah3P7vA+H9BkPAR8s9kCIxl1QP68q
	WWHLYybc1EgwltMPpDyy0P6gapxDF3raQs9yYNStEfT7zF5oXRgDYkbaLpzx1ohwj8XCuPWAs6H
	p9QjlZUk79N/nYTZetc9EVVoQQm233MQLVIB8G3T8/pL4+upTLMZyNUZI+WcAvST1XI1YHdkffl
	vxKOuBkdC4jvZI=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8ee3:5004 with SMTP id af79cd13be357-8cd8ee35361mr443453385a.27.1773105855850;
        Mon, 09 Mar 2026 18:24:15 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8ed57f3csm215379285a.21.2026.03.09.18.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:15 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Mon,  9 Mar 2026 21:24:46 -0400
Message-ID: <20260310012446.32226-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 17FB2243864
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96428-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 6116ca8dc426..d8e0f29b8c38 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -517,6 +517,10 @@ rmi4_f12: rmi4-f12@12 {
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


