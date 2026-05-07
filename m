Return-Path: <linux-arm-msm+bounces-106516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPOeAGH5/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14524EED49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63087303C032
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947293B7B75;
	Thu,  7 May 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2yB9aVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18954372B5E;
	Thu,  7 May 2026 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186086; cv=none; b=q/OaWVvm6xiehpsY0gfevg0EzvUCfEaPdqzlUemk1wFa9zPm1y3hDKj9nI0nJ6pb3rokMn7ebUEnmshIYt+J2IJ1wTUw/f9mgRxnSWEgBiaTqXLoM1OkMblPNXlNU+xREjyVj6Oc78FhWLnhpXj1kHwE1D4P5q3pZTHgfp26UdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186086; c=relaxed/simple;
	bh=QrGCUuTGJX6Ybth/n/JzRZaS2MxFI4GNDSbgId7ULnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+fwsSiLcilJ43VBzg2q44YGA4sRtMtNRt6Nhkna4a3Iv34Fv5pFoMUXSputFrKQxiV+uob1U1Ac6p0YAj2kdlOapQsrrcyvWzAATFD+GHgIbhXSv2aCE4ZbMoIxZStJo5eDP8Iqd8bQ7bax+k/1ydgWQRAE+pvT6R+LueQave0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2yB9aVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3F6C2BCF6;
	Thu,  7 May 2026 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186085;
	bh=QrGCUuTGJX6Ybth/n/JzRZaS2MxFI4GNDSbgId7ULnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2yB9aVW5eK4SlQHjyWNAdxaH4OOCUsFBVZydof0bK8lkAUBz4F+DyFbFcipI5xBP
	 bpuWlTzngkyg0NXaIAf5adZJXNIPg3aEaszVMFLeJpMNO7QncPBS4Lpw4TBG7mce0h
	 ItQssE1tef/xlVOPr8YnqsKKoKoEMMyPAkBSpVruU3jf2dB9b3B2NRyeoDzAuHcoUp
	 ApMYDFxSSOQFT0tolSHw/t49SO3PVq8U1stwrcQkrYrvS2jrTrPI3lYM50177fOdRh
	 7yGcDlP3EossEs8tBPzBr0k9Aci2WZoEdL0A/wnYjyN5ozCGdS5Ehe92iKUFlKIA2w
	 6lwzfnZtcomIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Jens Reidel <adrian@travitia.xyz>,
	Arnaud Ferraris <aferraris@debian.org>,
	Marco Mattiolo <marco.mattiolo@hotmail.it>,
	Petr Hodina <petr.hodina@protonmail.com>,
	David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: beryllium compatible ordering and bindings update
Date: Thu,  7 May 2026 15:34:14 -0500
Message-ID: <177818606037.73000.7089369573359829394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
References: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A14524EED49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106516-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,debian.org,hotmail.it,protonmail.com,ixit.cz];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Sun, 05 Apr 2026 12:54:54 +0200, David Heidelberg wrote:
> This series aligns the Xiaomi Poco F1 (beryllium) device tree
> compatible strings with DT matching rules by ensuring proper
> fallback to the generic device compatible.
> 
> Patch 1 updates the dt-bindings documentation to describe
> the Tianma panel variant and clarify the expected compatible
> string ordering and fallback requirements, aligning the
> binding with actual DTS usage.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document Xiaomi Poco F1 Tianma variant
      commit: aa7066248f1b6b2d000d3cc2f64a3fd4930e1b44
[2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Append compatible strings
      commit: 68bfaa3fde985a227721b58b32283811d05d5c21

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

