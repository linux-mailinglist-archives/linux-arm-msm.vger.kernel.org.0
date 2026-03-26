Return-Path: <linux-arm-msm+bounces-99999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHP0Me+mxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:24:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CE32EC32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AF34303C408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6799322A00;
	Thu, 26 Mar 2026 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyyyMpdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36441A9FB7;
	Thu, 26 Mar 2026 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495173; cv=none; b=D5mfxXfBBjopptPKIPuoaiD86B0gpazdP3xP5ybxq1pRFKWDKHhEY+TPUKQqVoZRkIBX/4GM6Q9G9L33Uemoi+ltaCP6irKVFvm72/3QkOxM6x0lSeYwLM/XH4jy5dyOvumoyckTV6zWNHx8PoOUk/fionxYeKhsCB6tPyb5EIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495173; c=relaxed/simple;
	bh=/xbkMyMOdkvjQXLLyPB13yBFWsTwquN0QU1mp2b0Wp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbuaNDusV8tdmtHjg01IBzIFSWJB49QZLbeZWLH8e183b0sio/fUFiR3MZfK2jgAV/dT/00u0RHW/lre7f57UIiAV9TOI6zw3yGYhBA7e1Tvk+iTyI6Hff98ZFvfmqRd6YdByP3RTRFQ7SuIYW51g3OTseuEcrunCv6MqVlXJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyyyMpdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0346C4CEF7;
	Thu, 26 Mar 2026 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495173;
	bh=/xbkMyMOdkvjQXLLyPB13yBFWsTwquN0QU1mp2b0Wp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CyyyMpdngltrYwiwtZHk+I/Z05gHCaDbvRa5UMW5nO56IZWdKaUjN1bmub6xXUsGk
	 WAcaEP2n+AxXpYhpdpLn1vRjLs4f15Kgde/MQEe4Y/f82QxlD2c57knk9OMMBGzZrF
	 UnntZ+n6hOXMcJ1x9QEmHhrkVLEejpBXsEtJOqK16+i7Eti1iKLB68rncZd/1PRttD
	 r5E0n41U0AGzPqN/wZP28tK88MfIH2roGYEcqRVksj0kJbF4WrEI3pev8524Nunoie
	 HhCCFGcmOsj/SqKMAKXbZ8C+00dQI8kkG0+47bYuxAGWbwI4U3rXaCSkmiDN/x4nIC
	 adhFsuZNUIvyA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
Date: Wed, 25 Mar 2026 22:19:15 -0500
Message-ID: <177449516613.60308.3771342049381576392.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99999-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D8CE32EC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 17:12:19 +0200, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
      commit: 151206a1c2db874d39ddca60901a77204dddf065

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

