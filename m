Return-Path: <linux-arm-msm+bounces-99553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDvEH6gKwmmOZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:53:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DA301DF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D618630FAFDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E423A3810;
	Tue, 24 Mar 2026 03:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLCOZh1n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C853A381C;
	Tue, 24 Mar 2026 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324246; cv=none; b=Li/+xpO6BTj2wKWGcGroYGEgV78vAnUFFi030qi/Ru/ayqEBkOnwDQrOJeI9MzKkdKQwHcLWpZ8psx6Y0k4vXwxL8E9yBgbmPMbxs1vFZSNAuDAJ0FneilcAXUTMEh2aMbYiL0+TcI5cGfz2rWGBny2wwyaoDJh0r7esPX2UoMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324246; c=relaxed/simple;
	bh=sz499/kka10JATiQkUb5scYiN+syVs8rwFujL7wGsnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvwglT0upiHK9tGedKHsLfEl/S5VwawH0mBt8Yn4SFO/h/C3+OvG0GFXhWp85B4KtAjxySpSKH2VhPiGgwnHj5yXGEOn9ZfSLPFR15RRBzwnNIqTRy2nJqC2DNxGw551zij0YqJSOqQZBmUp9y/NbhOUNSXapFHESLCx+hiKLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLCOZh1n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E0CC2BC87;
	Tue, 24 Mar 2026 03:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774324245;
	bh=sz499/kka10JATiQkUb5scYiN+syVs8rwFujL7wGsnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLCOZh1n3gpXgqL3tGnpvNpXZ32V0yiwRzRYp/UyPuAtZz6HJLYXty4hMN4axz6OI
	 zF+CI76+1KAue/s+yhME4dvHKH78E89lAQYQINUcJga22t8FL8MIIdHX0Vqe3mjzHo
	 V7Ie/oEQh5+t/v9phDvgH0nE1cgZQ1+cIOxMokG3EthHpqXlj4YgD9t0PvcC5Vp0KP
	 L1Xe546Yo3Hw2Pin7GWmucdLzqbbld3cXYAaGjC4vBP5vnRVYhbvPDCx51QG4/S98t
	 C7AkRAu+lFd5UZblM4DrMff4O/xD7fCUd/lR4OIu/8NIUKp/jH585myqlazLrJdPUJ
	 MZfhgrRLN0rfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/5] arm64: dts: qcom: Drop redundant VSYNC pin state
Date: Mon, 23 Mar 2026 22:50:37 -0500
Message-ID: <177432423481.37653.9274196873200487525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
References: <20260310-qcom-dts-redundant-pins-v1-0-98e2ef430717@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99553-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 240DA301DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 10 Mar 2026 14:03:18 +0100, Krzysztof Kozlowski wrote:
> Resending with tags.
> - Link to v1: https://patch.msgid.link/20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com
> 
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC pin state
      commit: faf1693ad7036f360f4127cf1a86cb287191f3c7
[2/5] arm64: dts: qcom: msm8998: Drop redundant VSYNC pin state
      commit: 4509f0916c609e06c223003b001daa724214cf7a
[3/5] arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC pin state
      commit: ba55bf1a9aa1ae44143b6efb4fe3e76aa185fdda
[4/5] arm64: dts: qcom: sm8550: Drop redundant VSYNC pin state
      commit: 4bf6c16c930ff0d081c6040299d1b07becf149e4
[5/5] arm64: dts: qcom: sm8650: Drop redundant VSYNC pin state
      commit: 9eaa726de3f26177786e12631a6f32db1aa1c42d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

