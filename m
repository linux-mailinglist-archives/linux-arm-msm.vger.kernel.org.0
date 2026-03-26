Return-Path: <linux-arm-msm+bounces-100004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKOdCVKnxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:26:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C832EC96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95413307EBDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA16396D35;
	Thu, 26 Mar 2026 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkTN6bs6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805537996B;
	Thu, 26 Mar 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495178; cv=none; b=JRGrxjTXX8dk6syEdjPpFvCzVoBt7+6BmqqAFPQFqDNffwKyqCL3GZvhdP3Pj5OqTbDchadavsApTjTfDi/SLdZtniYqdTkm+B6PgeS6A8eMet7zHN950PCI+IdZSVIyhsvYlARHGdMu1o5pU4uV1H+dbSy1LHwx2LWQNsoixc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495178; c=relaxed/simple;
	bh=dhjNtTJIf6e4PhD0H3zBc1BzL0+xGZeFrUAUIUVhh14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1Aiko7mLJd7rnsRjoHp0GrSGccHaxnpLf3xa0QoCF/HKtrxJUYJnnlWGE+s26SmQSo7LJ4LA5Y2lRQ8sv7MBD/+FXj1YARSF0KA06a7JKwSgUkUh3hQ1TBVNftQH5x5EPVzVb5YxO2dw51E2gEFGsShwevgUSezNMWue9OMv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkTN6bs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF7CC4CEF7;
	Thu, 26 Mar 2026 03:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495178;
	bh=dhjNtTJIf6e4PhD0H3zBc1BzL0+xGZeFrUAUIUVhh14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hkTN6bs6/Ev24VCm5Cy0Kn5SQYiORjzRqeRfRCzanQMBXPInXah1cOTzNabEzThFV
	 FJe2Gs9aL/YFYBUw46nqny13J8VB2ImBGaX/2TWDJmGTDHmKg4VEz5riclomHSsv6x
	 wcxUtNJy/oX8eDwHBHh+ejXrrHAN2MLFKZJ1Usz2SqTInwweVQxEnZ9VWyRIfbOxkq
	 c478JyhNITmucpzg5iLaqhoZnTn/VGD/vJOxU2mIMO9RJFsKbEZ3oRCuChWRrsAZYr
	 T55ACgM65NiT7vpXQyZe8Jcw1foTeGlj27U0KmFv/HqWUMzlYmACtcrbPX9qPQsNXu
	 V6JHRF5P5PBtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aastha.pandey@oss.qualcomm.com,
	dipa.mantre@oss.qualcomm.com,
	Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Enable TSENS and thermal zones
Date: Wed, 25 Mar 2026 22:19:20 -0500
Message-ID: <177449516606.60308.1648100720228231313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-sm8750_tsens-v2-1-8a554e54dc1b@oss.qualcomm.com>
References: <20260325-sm8750_tsens-v2-1-8a554e54dc1b@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100004-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B08C832EC96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 16:50:00 +0530, Gaurav Kohli wrote:
> The sm8750 includes four TSENS instances, with a total of 47 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 130°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 120°C and critical trip at 125°C.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Enable TSENS and thermal zones
      commit: 0a78d270a40ecec6bae69920bb4319442b98cf24

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

