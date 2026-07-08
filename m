Return-Path: <linux-arm-msm+bounces-117699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fz2wL7drTmp/MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F2727F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LayEQvdr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84924310F573
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D0495533;
	Wed,  8 Jul 2026 14:57:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA2048BD57;
	Wed,  8 Jul 2026 14:57:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522632; cv=none; b=PGjrY2aLQ+wuxntnYxa58qGZmAeaGlrFnutfJI6b0nWA64pQMJSEdQzHqtCkQ4UMJRzRJyn85ff3rPjRZOKY6CYZs9CCszBy3wZO+M0f96S13r8IDdLtFeMHqfU4PkEKsINdl0Cv31C9dqFKMYu4yyauocPfYl4bYjHc0TWAZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522632; c=relaxed/simple;
	bh=r2QagF0T+ChvSZmrUf79ncelJ6p67Xa7fjI+df8sy0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKHMlrHtF6n+vfkc6GWGd3ukdv6hoNE5f+JBbutuzK1prvfiQbojlABMh1T6rLlX9CrDBO/6ujx6jN+gdUGikfoD3CVGdaOtxsHqBq/ncQTjT1qgQafcQYCuW0URW572BISrH5Hwj2I1xyQiD8xg7o1ABZp9jX2TDOh5A8c/kCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LayEQvdr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B82E1F00A3E;
	Wed,  8 Jul 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522630;
	bh=JhdSgaNSn9RJ9DQTj0/UWU5WgDycB0RVNn2X7T3zvfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LayEQvdrToxKOejoOMQ6Hh3EA8jRgSZezsyeyYz1BRIREu/v0YsXyPb4O2eaIcWUW
	 kdcQbJb+HxJa3W5CYihnoyUqXJYS56S8xg0feOd7cGdBUMS1TKVYR+e9U20TFuMW5i
	 rz8V8234ptMYZL3B07NnEhnO9AmNNzfYLwYmGGRf9fv6H8sPSZzBiXIJHBBu9vsxuE
	 kJb+gMEWdzy7AefCltTrUj24wKJiGfuTC3lmS0+5IUnF23uV1IkRN2Pmkwls+db8WM
	 zuJSXodjj9tlDiN61ppKICPWHsWfvmoopNQouYMeZHd0bc3JCa6GqmvyAOoiX/Yxgq
	 h9AxaDCGzHR6g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Wed,  8 Jul 2026 09:56:11 -0500
Message-ID: <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117699-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:alex.vinarskis@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B4F2727F67


On Thu, 26 Mar 2026 10:27:37 +0000, Bryan O'Donoghue wrote:
> v3:
> - Too many depends to have this merged in this cycle plus some review
>   feedback on the depends patches but, for the sake of completeness with
>   the other posted series - posting this now too.
> - GDSC dropped - Konrad
> - Clocks dropped and renamed as agreed - Konrad
> - Using mode PHY_QCOM_CSI2_MODE_DPHY
> - Changes ldo7 on Slim7x to value indicated by Alexanders
> - Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
> - Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
> - Depends-on: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
> - Link to v2: https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
        commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
[02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
        (no commit info)
[03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
        (no commit info)
[04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
        (no commit info)
[05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
        (no commit info)
[06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
        (no commit info)
[07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
        (no commit info)
[08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
        (no commit info)
[09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
        (no commit info)
[10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
        (no commit info)
[11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
        (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

