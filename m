Return-Path: <linux-arm-msm+bounces-93799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFe3DCaynGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:01:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69F17CA63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4971F30FAF32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D489376BD1;
	Mon, 23 Feb 2026 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNbls2Yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A807376BD0;
	Mon, 23 Feb 2026 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876592; cv=none; b=VGlNQC1aojJQWlwCu/Ge5sDv0EarJ1fGxgBXadlnms0qlVSRzZ9odQRHm5674qtGbkkVcyMDawZ3pFInuHKZ5/n0u3xQlItNRZrRsYFu8ttdB3hMkmgryjZkI5y91stmuIfC5OtODJjify4+b5sF71Dp6DIqvRmT+QQ49JftcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876592; c=relaxed/simple;
	bh=YWgwGAda6/Urm2AvT0jWiiODP2nr2LIlrUivv5JHYE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPCNAnoYXxfykb0o6ljNaPk0ZpWRtLHS2IpgK0d0jmAWhyXIuSeeYMJ30doBUT5SOfHqVEntxFygod1f1EKGI2/QM41VCySYcvw4fC6F+53tywvTR7IVQmJ62iLbMacRYWTeyNeCohqArKGHBD5NPO7ujg+4iNl8QowrcLr0aUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNbls2Yq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC57C2BC9E;
	Mon, 23 Feb 2026 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876592;
	bh=YWgwGAda6/Urm2AvT0jWiiODP2nr2LIlrUivv5JHYE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNbls2YqvNMwaafkFC4OxaX1+MNh39Pjdpljk9idnj2bUPWeeYSrs+przP4xSuxhx
	 L5BEuCC2gyVeLb7mgvNeYrNT63VsspCMhUdZgYfIWLJa84YdEmfg9vTaavkhAcn8p+
	 iv5Pn1+CtIoSwHJ3KDFGtF5I7RpFBBjMoinFLzZeRCFusCF1HYO2N/Z4GNklATRrig
	 vgPYJ+Ho/8TSqkM+xfHsMLvlDClPWSSdnNS6raXA5n66XHS1ZoiTqrCh3yvA2ybbZ3
	 3mzDlnCBayqyO93X4RvRRY1u9rgN1yZFJoo23Z44N3K2DBHeyFTB04AkWHxoPTN+fP
	 e89M1i2lDkgJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v8 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and Glymur CRD dts
Date: Mon, 23 Feb 2026 13:56:11 -0600
Message-ID: <177187657314.166046.3403623757787633196.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93799-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D69F17CA63
X-Rspamd-Action: no action


On Thu, 19 Feb 2026 18:53:25 +0530, Pankaj Patil wrote:
> Introduce dt-bindings and initial device tree support for Glymur,
> Qualcomm's next-generation compute SoC and it's associated
> Compute Reference Device (CRD) platform.
> 
> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> 
> [...]

Applied, thanks!

[2/4] arm64: defconfig: Enable configs for Qualcomm Glymur SoC
      commit: 3cd82bca8448d12f6ea0ef2c9d55a80d1712385f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

