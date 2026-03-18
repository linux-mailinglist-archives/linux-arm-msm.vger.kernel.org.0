Return-Path: <linux-arm-msm+bounces-98476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJZYC02uumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:53:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED02BC657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54DB2303841F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE913DB65D;
	Wed, 18 Mar 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nezP9TKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA983DB658;
	Wed, 18 Mar 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841846; cv=none; b=PEv7TzUtpto9m3HmJXEYV41/0JO7wiEcCFviGIX/x/JANDI97jWg29YXs4g5HoIq13HK8fKsNKlGq144cpc6M7qXtXfnFSGhORfSKns5Zg19bM78GsuATAUai446JtsP985xK1eYHOykVcR9m82LRs30M2p4zCXsXEIFY2f777s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841846; c=relaxed/simple;
	bh=CUoRRRs+BpMj3YGmNIWPJrmwByWZQYPE3E6gED2jFU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tj4iEUTMsZ/lRx6R2O5x+RSb74IuzYWO0xwjhD9N2w7UuOC3RPwkHwgIKDA2OqFg6VNj/Ml2ePDoT6HL6FdJb7OyzgrUYtw1dhrKoc+av5JRKTu1RooZQt7pD7NWOi/9xUhwZcSU5W65dGHp9r51KY3tVXQwih00eE0CgtLbvNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nezP9TKR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63A9C19421;
	Wed, 18 Mar 2026 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841845;
	bh=CUoRRRs+BpMj3YGmNIWPJrmwByWZQYPE3E6gED2jFU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nezP9TKRlnQu+GLkJdMjJQq9GMb7nGQtrKOYwMQg29Ej1tZdj7o/prwm/LzyDzLLd
	 6oEfnuxSCabFGXTpwrLYNiW+C/yP+QibZUsqbeiwe8SfSGW7LKuR5NKai+IRmTSqJN
	 SfoxEbZ3cl7Zil7eTDvqnmRtFdGi4HZyVB+ADRqKbeBtRjKeyNyVk4XkJX6xyFQ9Vn
	 gs9/5OaKGrHN/q+JxHEgoahnru09BqQDf4liqqXjGD3oiIUPUFpHVl3epBil0VEB6C
	 uKxr2BmyG8wyQFFQs/tSUhDva4UyWs5Y2L/+X7ZPs30HwoyVFJ7AOAP4kB8AaIaqUL
	 u+odQVNheY1nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riccardo Mereu <r.mereu@arduino.cc>,
	Martino Facchin <m.facchin@arduino.cc>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI / DP bridge
Date: Wed, 18 Mar 2026 08:50:07 -0500
Message-ID: <177384182907.14526.11037562437284058953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213-uno-q-anx7625-v2-1-c23359616528@oss.qualcomm.com>
References: <20260213-uno-q-anx7625-v2-1-c23359616528@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98476-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40ED02BC657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Feb 2026 19:25:25 +0200, Dmitry Baryshkov wrote:
> Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
> signals to the connected USB-C DisplayPort dongles. Decribe the chip,
> USB-C connector and routing of USB and display signals.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI / DP bridge
      commit: 38caa0aab082754191f3de3f068800cd6d185d76

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

