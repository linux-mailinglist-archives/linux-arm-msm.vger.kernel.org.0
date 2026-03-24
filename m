Return-Path: <linux-arm-msm+bounces-99534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMNaDW8AwmkjYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:09:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6793018C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C15B31082C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D1938C40E;
	Tue, 24 Mar 2026 03:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm7FQslR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E19838B128;
	Tue, 24 Mar 2026 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321573; cv=none; b=EWR5mGkiRsPCnjFuc4fzSNQ2mTUyXYoASbuSEVTjaK199hG1yQx9g8By+ydCg932/LTJOsW2eWM0zHUF5jwciePDG+aDzCjaWPYoU0acDYZrNDTqThFuDX3GqkFEEZyzFIXwiwXe/GOZMm5HF3RJv3xZIuTeTjzErCCeT5/EkaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321573; c=relaxed/simple;
	bh=NGnTzMjN/dqkSDLJgCByshs6Dx+jkVyhRZMYumkhleQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdbVxbKa2y1keWEqENZEqj8stKg+u2i0q1QL1JNyAn8TF5oYO/F0g4HKvONDhE85F8xBI05oS+mNvB/k77lF+y8DXK4X5eL010Hq9H1gJg6KseiaB31xysER7OZSpWYqNk9RROj3vyCayb0VA5+OelUOjBVwS3Ngrhu/OtSygac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm7FQslR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A85C2BCB3;
	Tue, 24 Mar 2026 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321572;
	bh=NGnTzMjN/dqkSDLJgCByshs6Dx+jkVyhRZMYumkhleQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cm7FQslRHj+v2PwL8kl1Ky3oRFEvF2AgC0xNmQ2hUPneVFtjs+YRjipiBhWAdJCC+
	 s2fVmRsBYwEmxGHQ/whe9+YEbBvCjvxZPpQNV6LkrQKyhJA/LUyQ3D37zSffJEyirH
	 wcqoFbk0BGCQKqnzLUQSa6xNG4m5lAO6R1E8Xs2eD/5XFdVy1Yt+cuiaQrQh8QiQaE
	 kuzTpGqn1PrAWFRtQrIGaygCMaJSmdMx4SitRrky8jfMUDSKCSr4HLsW7Ib50S5ru7
	 vxP0TCQHDv2oZACLvLyf2SzIs34fuwLWZ3ZukJpO6R19bzXSqUPOL5ASgJaWTwNODJ
	 JBAPV0VA1NCAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Enable UFS support on Milos
Date: Mon, 23 Mar 2026 22:05:55 -0500
Message-ID: <177432155637.28714.2511351512032518031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
References: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99534-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C6793018C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 09:23:17 +0100, Luca Weiss wrote:
> Add inline-crypto-engine and UFS bindings & driver parts, then add them
> to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: milos: Add UFS nodes
      commit: 0b0d0b56308e51c6edc515bb39b383c769dacc04
[2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
      commit: 93bb565b58bf4ef094eebf64cfdd240d4bad3bd1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

