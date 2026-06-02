Return-Path: <linux-arm-msm+bounces-110716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p8RmDSl9HmpkjwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E18106292BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA29F3028F79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0152B3909B3;
	Tue,  2 Jun 2026 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="EDQEy4eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908662571DA;
	Tue,  2 Jun 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382979; cv=none; b=NTaxjGkc/uezDmQmt6q4+R83NVLbnm+hluROW1tpjasOypQyvUVjvyVTpuZ406JfpAe/7vyDTdT9Rg8NA3//W2jngJMV3UVs62nm2EPOhLIGdknM9rL+aczhZLCMg+B0idnVKJW0BrEvfk7ufb+4kSmH8lLI9rsH981fS7vRvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382979; c=relaxed/simple;
	bh=Pi5ioL7+QlwhK2xj+V87banDOdI/HytqblsE8PVdBww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSD0H6NTYG1IgHWE/aiYMKMqSI+9NdF0SReEmbS4A/KEuC1BuvLAubCmUwKYfJNtgd6R48hRDOMkyTJAcHkckkof0G6JIxegQSbZUfFVNa9rlTaFvJAfvy/v3frcJzg+rf27lNfIdoxunUPoja/TTcpBLg9MQ7gozrYMrx1K5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=EDQEy4eg; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gV1dy1Fl8zYdx2;
	Tue,  2 Jun 2026 08:49:26 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission6.mail.transip.nl (Postfix) with ESMTPA id 4gV1dw5XZmz3ZVDrf;
	Tue,  2 Jun 2026 08:49:24 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8660: register PLL4_VOTE for LPASS
Date: Tue,  2 Jun 2026 08:49:23 +0200
Message-ID: <20260602064923.877894-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602054643.452049-1-github.com@herrie.org>
References: <20260602054643.452049-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780382965; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=DwGPgZw0x+TRPp6LTlJJ324kksikw7sHJ9OQ2L+/eME=;
 b=EDQEy4egoOReHmEEzJZatwxtKWiaOx7OWdUUNupCG5oyOUX+m8XIW2M61M8fe/+LwHo9XL
 sZ+Pl9faQioEc8GpKUFKijOvqTn4vkIPb9YvexEwWzQxkEf7KO1QDdwECW/NpurhnBlFbY
 cCYNYa3FPy+t2wvN1Vh7vNBR2o9DouBCjpcQ7eYHBOV5L6Vm4+LOpw00vboOfxgvgwBRNq
 lsj1YVzEb1UGV/IYDPryb8S9UrZGliwm/yeQjfpcLhAplHgTZV8qp+VsZ4vODPJpIa/PoA
 fkGu6pqqASY6ISXUFNKca7gqY9q4NZyVA5KJTnznzLuLW/hdTw4pl2gAZLE5XQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110716-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.995];
	DKIM_TRACE(0.00)[herrie.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E18106292BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

The promised clk-pll.c NULL-check fix is on linux-clk now:

  https://lore.kernel.org/linux-clk/20260602062927.467249-1-github.com@herrie.org/

  [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent

Single hunk in drivers/clk/qcom/clk-pll.c::clk_pll_vote_enable():
resolve clk_hw_get_parent() first, return -ENODEV when it is NULL,
only then call wait_for_pll() with the resolved parent. Same change
benefits gcc-msm8960/apq8064/msm8660 and any future cross-controller
pll4_vote pattern.

Once that lands I will roll v2 of this gcc-msm8660 series with the
yaml maxItems=3 + pll4 clock-name addition (replied earlier in this
thread) as PATCH 1/3, the existing CE2 + PLL4_VOTE driver patches as
PATCH 2/3 and 3/3, and a cover-letter pointer to the clk-pll.c fix
as the parent-orphan precondition.

Thanks,
Herman

