Return-Path: <linux-arm-msm+bounces-109437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEjYEeYOEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:20:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E28385BC879
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6968300D4E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFB4331A4B;
	Sat, 23 May 2026 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3gtJsCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD01328616;
	Sat, 23 May 2026 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502813; cv=none; b=u1lfydsTFfUyPqbF5gC/+u8TLC0ebk5rPh57QxCpNuZo6GYZdB1/BAWNFkk9lmc/LS3htpDjhVRrFuh9Zdlk09MsU+4l5q67efEGCwUalflECQzroMKZbqwkum3dujlmqS+1G+wCO8tjUbLqwjvjy/lhtoMHGfgNPwPNyfybeos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502813; c=relaxed/simple;
	bh=/UYj8DsO3Sy4cF77JAg29meiS3wpk0zyg+Gy89Cu7co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d0xTAhtuuFRx469kiqK5iSE55DaZM2DpOTMfvA/4+rc/HdQkctqxY3IX+nPXPHJcEFMlNNY4rJx/UZ3sKpL8LvGwFuy5lcOFYvfgfsKlnbS+cRrYyaWCBM0IOSYrnjKmaMNduXyc8uUOdFYfUhGRnH+u5w9q9OCepYU6qi0rAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3gtJsCP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E421F00A3C;
	Sat, 23 May 2026 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502812;
	bh=mGRAdWsJZnJ6fjH1Pt3xuGY/A3udjADEDtUnBU68LV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3gtJsCPFZOeS4biV8/ztPxuNxwaNnhgt1TPcPzasROITfT49oHfU18dVCYD1yVZx
	 rf0eKHWoDYXevl+8fGQEvFEDCgePubyYwd8lTWKev5NrXJyMwXqrX1fsRKnve6zdNV
	 xFlSvwNihhd6a4H0ey6SkjlkDwauZgc59KljgBp37wcEF+F7xZzlckZzpIh8QRo+0n
	 Y/bMWQc5sQHP/abTDTPWa65RPQs9yjyHL+o1uPAuklYmD0FZyPxhHxbPHsHo8dKDLG
	 ZduS+EX6aneRqcdX/6vpnVP5LUlV1doBnV6tQ62ILKFwyYcLL0f8oP4nS4zYtnAl0M
	 GaxgdePyIl4LA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Fri, 22 May 2026 21:19:41 -0500
Message-ID: <177950280318.1097700.17053864671819339682.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109437-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E28385BC879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 14 May 2026 16:54:12 +0300, Abel Vesa wrote:
> This series adds the ADSP and USB related description for the Qualcomm
> Eliza platform.
> 
> The SoC dtsi gains the ADSP remoteproc node and its communication
> dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
> describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
> combo PHY.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      commit: 88ddafb01ec05bb3cd1ffb51b740bfbc989ab955
[2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      commit: 59703108a0c00321f181d021cb83e0d7b610ed61
[3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
      commit: 49dab7311f57e0ba81bdcd3bcf6d763cca13532b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

