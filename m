Return-Path: <linux-arm-msm+bounces-96439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFAhKBmGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:46:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D5244599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C0873029775
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16FF38BF91;
	Tue, 10 Mar 2026 02:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh2dxXgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC01A9F96;
	Tue, 10 Mar 2026 02:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110806; cv=none; b=kGShkGaVP8R5HFNFhnlgzB0dN5C3pd/ZMips5ULHzUjUEtf+SGP+69NbuSioIjV9jaA1EVH4vYHa4BbTN6/anM9H0DxQY6TaRvVG3+cZ8qcXTktupxDf5lzAaHDX2F3JmB7EA+/t7CglDJct0NLWsi7fteAfnhvmHUUnrkF9bNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110806; c=relaxed/simple;
	bh=+W5sfGa6lfqdwtL3c4m+eHsPYnftWE/feIA3VOlIDvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/WKmuOH8S2wzn4i91bAXz4ANaMlAXSGa++MD6hMkJrtFmIbwjTHpfqYpr8rv6xQHA05fedaRz4u/VTaooC0qowQSE9VXaYQGYztoU8TukzEJCfJ4arY65bLb5Vegqdo+qKGgqLsYEEJx2b6YUdoKp0kRXTZrNmc+BmCBzIq3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh2dxXgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17BBC2BCAF;
	Tue, 10 Mar 2026 02:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110806;
	bh=+W5sfGa6lfqdwtL3c4m+eHsPYnftWE/feIA3VOlIDvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uh2dxXgtsV1G4el7pbpnQ2BPis1Ob5Y5LzhqYqf464HRD4qWL06nRRp2cwXmd99Gk
	 sgjbf7t4ve21ZSwUCsS38DYmblkAgfEPp5lePkqHeTKfrGAwiXN2kwlnmvxhYFejlo
	 S6ddUp5Qn3aYwYUbCr7AwC+B76m0rBQV1ECRf85tPpElw8c+V60u3XNxI5RaS8mH37
	 4TpqKiEisAgJmxQXw/JzHdTVGe1JdEjXMu2Vo1Kw4nCv9ZliXbWpFq6FKBGJGKspxr
	 jG29DUcUD37LM8KVQSDUNx38fOGbC5NsdyhXIH06TcHT2iS5Vr6vjTjwL/ytvh6pU6
	 PwU9O/WBSFx/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: remove MP5496 regulator references from SoC dtsi
Date: Mon,  9 Mar 2026 21:45:28 -0500
Message-ID: <177311073311.23763.15713492677876934704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123-ipq9574-mp5496-cleanup-v1-1-9fa86f72b873@gmail.com>
References: <20260123-ipq9574-mp5496-cleanup-v1-1-9fa86f72b873@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D4D5244599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96439-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 19:16:05 +0100, Gabor Juhos wrote:
> The 'cpu-supply' properties in the IPQ9574 SoC dtsi are referencing to
> a regulator provided by an MP5496 PMIC via the RPM firmware which's node
> is defined  externally in the common RDP dtsi file.
> 
> Since the PMIC is not part of the SoC it should not be referenced from
> the SoC specific dtsi, so remove the properties from there and define
> those in the common RDP dtsi instead.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: remove MP5496 regulator references from SoC dtsi
      commit: 65991dedc8c10d634df7ea697f9b424b263e7d72

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

