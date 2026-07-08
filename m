Return-Path: <linux-arm-msm+bounces-117725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LpXYDQpqTmrrMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:17:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60410727DE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ORoaFd0M;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3743309F423
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D674F798D;
	Wed,  8 Jul 2026 14:57:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C74F796D;
	Wed,  8 Jul 2026 14:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522658; cv=none; b=siVN96c81hC9sux9D+0adqtlX/R6aAsmvzrPlXdzvn0u9pl0MqDxeETDyHNYv2F84FMJx4DgYGw1lsbXg5Z3HC2upgBWbzw4VFqLroOIZr2anu+d+leFC7NKCvtDJzzjIrevkIQYrgc5+7DBn5GArqWabhJvKpMOslixa6ZmYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522658; c=relaxed/simple;
	bh=uUoru8ansihQFevEzTZMpY7pORUaP+M9k6JG5ZKAWj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bge6IlAIJdbIlBhwQAs6dmqi9FP+1zefmyBMhrm5xDBZwibr66SENupjL6+St2v/2oIzf7Y80NmzSxdAKVRZQp1O0TZ1AJnQktBTa9Gr7NLUhQ/q+WO7+3FMqLEsE7AxiTWlY9ajZUSrycSCR2cgMw3/6uQcqp+Ulo9t2luen0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORoaFd0M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0731F00ACA;
	Wed,  8 Jul 2026 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522657;
	bh=9nYpSJBoA8KezwKbzSep/6DEQqiKgZeRGDTU5H0c7pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ORoaFd0MHUPUTKEXoeUUgMuHYPKa7JhRgw6h9tgv3u5sxPXXRZCaGKZaQjDRrzoKN
	 2nHDAzi+uq6U+0lOXn9X9EfpuaArHZzplGn+y2mZhy6zVn4rXUdVRBLJJBX9PZdxgu
	 cjkSb59eFNMEVKqITJ7Zd27nQy0XE/BpYFUPbgCD7YB9zo5ds4zKw4WOwkRDVNBr0/
	 YWQoRluT+pw58oJNNTxkx7okq1ew0YvJSBGPb1XEY1X5hIfiqeXzIWyEXBOqn+HRz4
	 qShnm70R7D2Dl8n2d4qdAYHXYsCIY/iHNI6hSv0qrGPmx5KyfabLSA8NG0whdEjo01
	 oWfv1lW7x/1gQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
Date: Wed,  8 Jul 2026 09:56:37 -0500
Message-ID: <178352261642.2235436.13011814603920096763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
References: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:raffaele.tranquillini@gmail.com,m:y.oudjana@protonmail.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:raffaeletranquillini@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,protonmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60410727DE5


On Thu, 25 Jun 2026 10:42:43 +0200, Konrad Dybcio wrote:
> Update the 'enable-gpio' property name to 'enable-gpios' to conform to
> the bindings for the TI DRV2604 haptics module. While at it, use the
> GPIO_ACTIVE_HIGH define instead of the raw literal.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
      commit: 5156bbcad976b95502a7fe334002a957beee55d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

