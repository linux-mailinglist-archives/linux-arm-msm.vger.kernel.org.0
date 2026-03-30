Return-Path: <linux-arm-msm+bounces-100843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIh/OGGiymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:18:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E678535EA00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E01F300C359
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2638E5E6;
	Mon, 30 Mar 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPDfuni4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BFF38E5C8;
	Mon, 30 Mar 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886525; cv=none; b=etCVyQrZlgo8QLZvpS9v+CBaYUiNr2MscDMax9TX8WzDt01aN7EiCdrWGqeQZVLKbCM+zp8espQk3toQlFv7waYyznoBaaVls75tpombXo9jgo6bfyc4jqbVBDvlx8lCdhKZh57yMRQjZC8mz4XmBulrE8fpN4Jpl/OPd/WgQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886525; c=relaxed/simple;
	bh=92qAfw8U2FiSqrexzRwZBh0VWakwoPy46JfMNYgBTWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1B7XY3Auc9M9fe79s+NpFS9LOMAeCezLbrn3Pb2xDLspsxOZdHAijvogwzz0zBhKilWaRK9gRQj1SsCJqEpurOhaVsaRYdg5wzWba2nNpbXE/IUxJHXBKQTDYSP9kwgrKeecZtQwSScZrdr/X0cHjkQ+1wFPDClOhy5IeDAd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPDfuni4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A38C2BCB2;
	Mon, 30 Mar 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886525;
	bh=92qAfw8U2FiSqrexzRwZBh0VWakwoPy46JfMNYgBTWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qPDfuni4fhJt9kHgbhb1Q2l/f2udS413ZMI1LHM9c3zEbsD1/RqKCkzEuyXfbqytM
	 hR9sP1j3kwbaZI00QMu1jRWoJFkfsn94aD0kEYc/nYBx/KHCCYcyyIkBLuIVZfrqDt
	 CeKiBSAUQdWPBDUF5biiHccs6RXWZ6Iak8HvpBW2KJWjEgwkGNBPBpy548Wg0g94Nc
	 rpbrXHl59y7bKK2Dr7+FIEVTmyI5FU1yf8dGfdU4ezeJXthLnlPxJMiFhEZnsUELSK
	 U7ssR7oEy349cZnCaTJAHb2PuQS9rVb9R25jp18yyEUbqByAEVo2UCN4PJyUxUaZqp
	 JAoQjlWYoRRtw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Front camera enablement on Fairphone 5
Date: Mon, 30 Mar 2026 11:01:24 -0500
Message-ID: <177488647775.633011.11463914873995583752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100843-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E678535EA00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 16:36:27 +0100, Luca Weiss wrote:
> Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
> the camera upstream by adding a few bits to dts.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      commit: e7fc3c46dc09c1c5f901f1a627d9bffc6321081c
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support
      commit: 1d44de258d34f33aadda67d69dae5a8427b9d2c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

