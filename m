Return-Path: <linux-arm-msm+bounces-117723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xoc0GYVpTmrCMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:15:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EB727D80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=br8aoGyd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 675113034E08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108954EA381;
	Wed,  8 Jul 2026 14:57:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C124E3790;
	Wed,  8 Jul 2026 14:57:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522656; cv=none; b=Bf6RV5rz7fUvABUyq6de++2FkUfsGDpl2exWSCvM1N5s1SeZucFrFrqspGdlYiWbClhPbNgMYLNYL8Am715kZ7VKLYN5mhBrcwwiQsx6cbqqteUp9eJNu8FS2btJLum+AR5z6lQK81IPRMR3yr7kzWuBDrnJfYoXOomIjuYy078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522656; c=relaxed/simple;
	bh=3AEfHQm10t69uz+TZveTx4hX6HDBmN5rN3exRE02FeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=os2L4oleao3EGqjBV9+F2uvWJWkLiTnX6GTfReDKS7JflGiN4smjOhkzMVC+cj3n+UKSsnBpCBvLnMdHo5safsdTijrdIKByS+QTHCS9ZL1Q+qjJm9NBT0ZK0bnHA3KsqpZ7Y3pBLpaseqwNG/4psnDflTEZVFjWHZjL+As+zkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=br8aoGyd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D512A1F00AC4;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522655;
	bh=qoZ280uhy7JTGVkTvQaxSlDpOpz9ZrDz5L1tLvCiprI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=br8aoGydkb7csIpon1GqWw8aTALYLC9KWCh9PZD3GaKPomWHmt0jaMzgkw4cxhtN8
	 R88mV9PFowCj/H6iM0mPGnGv3qt663KJdDQb9GEf7BvXiiS+FWclL0x/NvGPz2SLKw
	 iqRWlZ/iFiOWF9e1Uk4j1fIB3aY2u9DXIhmzAxXDNW91fvhoViEbxNnqQJjFlvWn6D
	 2SKvqagaajD3dvZ2XGnkMPP1PnZNgam8Mrn0+TfR/ppBQtcJmx8VtRHg6VNeN2c9v7
	 73JpUuMR2LYJyyZaKaAxvNnNCGzuYTRIwd3SXsOQBvG1oQ0meD7ErxRW8gEWUJR1Ow
	 W7EImo64rugqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	monish.chunara@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Monish Chunara <quic_mchunara@quicinc.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/5] arm64: dts: qcom: Add initial device tree support for Shikra
Date: Wed,  8 Jul 2026 09:56:35 -0500
Message-ID: <178352261652.2235436.7454171283560267964.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:komal.bajaj@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E59EB727D80


On Fri, 12 Jun 2026 22:57:36 +0530, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC.
> Shikra ships in a SoM form factor; this series covers the CQ2390M,
> CQ2390S and IQ2390S SoM variants and their EVK boards.
> The series adds:
> - dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
> - SoC base DTSI
> - CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
> - IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
> - EVK DTS files enabling UART and eMMC on the carrier board
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Document Shikra and its EVK boards
      commit: 62eaf922d773c89153fdc6f612d4783610a4391a
[2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
      commit: 14a9b4bcc8dad3eee35faea4fde9ac31507e2ab3
[3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      commit: 28ffbb18c21e8baf9bf4440e8ef949b1b7030a4e
[4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      commit: 8dbf2a0283b1f7beb464b598cee37af69ed73640
[5/5] arm64: dts: qcom: Add Shikra EVK boards
      commit: 2ef5adff2d38698cad70cb779555c9c173f24d2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

