Return-Path: <linux-arm-msm+bounces-99533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJRZFAEAwmk7YwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:07:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C79301852
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A09E304C95A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83F238C2A2;
	Tue, 24 Mar 2026 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mr59V1d7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781BA38BF7A;
	Tue, 24 Mar 2026 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321571; cv=none; b=Da4R1Fz8I81yUTxdnwlgUamb+Ya4K+O/6SgeANyqSVOCyK1LYT+egQKJcTZ4SCSDL3p7VysjeCDuF6PrxRntb7Lj7r+8GDmnJWvy4T2on4sQObD9gAsi9I8/m4FaR4PDIHs/F7VPmqJAVb+29p8dr9lSGDjt7t4tfumgNszCBR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321571; c=relaxed/simple;
	bh=+vWP+7o+fo7L4QQONyk0lyVTElyoyOW5p6UODAFS7FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qikRKrQfoSroAaIeRYirdyYCMR50TN+XPQfpyK2fJ8eZyUuU+a5Pu5vJAjM/Qls7WAX14XU0X4wAXMiodXyqsebD1KI+zW4et2EckWfH7vbnvn8nOqwqLpZVJunlFH8UJYhHUlzJcBjh3FCNoRcFayev6O7npV7yk3eBMXgk5rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr59V1d7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6E3C2BCB1;
	Tue, 24 Mar 2026 03:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321571;
	bh=+vWP+7o+fo7L4QQONyk0lyVTElyoyOW5p6UODAFS7FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mr59V1d7lu02t3ujIMjfH8ZAWyrWSVCgPmq7gXVxAJDv6IQSBS5WFWskvcHQC+F2u
	 swXCUxBDmtXIA81ANP+IdSNt/4ID6YMb9n4D6V8x4hhRnV9nTEHQ6ZVVwu+czRBx7s
	 aPeI/NKQJfcvkr6ci2KWpGJ3amoAUeAepG26aKzdabkbz/3keuNnTlKuXo1M6LFvuN
	 4Ukoq2FeZxeKp/Kh8ZPuZmDWJUjyxv642tNrcpsjUYMGtdMc+O+tuhoGL9C0wgErK7
	 NoUfH+n+epu3wda767qt+yWEVqheXSnNayXFe40N5oVpJWe2Iq0BGLIiqMoC+Zuhh9
	 pjCinfs8FIFqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinctrl
Date: Mon, 23 Mar 2026 22:05:54 -0500
Message-ID: <177432155623.28714.3926947200697585101.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99533-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2C79301852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 09:55:00 +0100, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinctrl
      commit: 5f80d68959dd1bff70fd0abea8a69f507f204287

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

