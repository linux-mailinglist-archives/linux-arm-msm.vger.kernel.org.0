Return-Path: <linux-arm-msm+bounces-90822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJQwHdDgeGkGtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:59:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E214697427
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FEC63055E6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D635E52C;
	Tue, 27 Jan 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQSmtF84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7821735DD12;
	Tue, 27 Jan 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529401; cv=none; b=YPlNRqJfYm9rr9JLBaJ2wHRh9IQGWr+ijrgVFg2Qu0N9tyhOYCJ5QdXUyhDHSrjNNxE1JDbJZJ9oWNRX/ijYXhyo5ziumcs4HUuQQNf1Pgvluzao0jf04b7lehVFaDNvYZws3rJvDwyzRDjPYD/FQ9tXeFccL0peF/JpBovBw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529401; c=relaxed/simple;
	bh=Um8m4iWZhGp11leilj6JjEd/7T00UIp9bJaFYH0cOmo=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VcWz5N4lTonAsVAapzfREZ8yxGePyAxZDlsEi8xbIKxI42vWp6rFLwmQ5i5gGYXUw9iGxGX1+Nh5CyRvYQtillakboxpcQnwIiORq2AKQtgoIhFE9rp24KuMjAQM3zzCMkD7YRuVNvKSjrjzb4/mMu2Sy+IHWlMo3AEhoQbZmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQSmtF84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12219C2BCAF;
	Tue, 27 Jan 2026 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529401;
	bh=Um8m4iWZhGp11leilj6JjEd/7T00UIp9bJaFYH0cOmo=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=MQSmtF84cboD6goWr4M8TtGV0VXUtHryB0XkUNNEjsq5d5rL5NSjsGme0v2Wt33hs
	 SqJLxbe+OuMZ1FQCzbQ3NpcKxdx+FaE20hDZKuEMvGyj8rk0pcTz2AldxvnqmC2eDb
	 R9RYlbnzoWwhKGoAflLWiUZUDK7/uNwPZlAm7kNEGxVIvyD5CFXCZrmbhT+KLgdi2L
	 O8Pp4nwAI1Ue4M/7LpxOFTyKS1Sf9VP6KaXH6Ag9Gg4KWJly2xNjd8kCmCkoSS9v8u
	 SYeagtFahiR5ckZWurL07MJHSp/yYWy0KBzL/MOsxVb+XCsHIbt3q+uMnoYw58kD8N
	 5Xs042Xlp+dDw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 09:56:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Kees Cook <kees@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Bjorn Andersson <andersson@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Biswapriyo Nath <nathbappai@gmail.com>, phone-devel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Gabriel Gonzales <semfault@disroot.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
Message-Id: <176952925907.1904494.16599323648492614244.robh@kernel.org>
Subject: Re: [PATCH v3 0/7] Initial Redmi Note 8T support and more
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,igalia.com,lists.sr.ht,mainlining.org,intel.com,gmail.com,disroot.org];
	TAGGED_FROM(0.00)[bounces-90822-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email,4cc0000:email,4ac0000:email]
X-Rspamd-Queue-Id: E214697427
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 17:34:50 +0100, Barnabás Czémán wrote:
> Redmi Note 8 and 8T are sibling devices the only difference
> is Redmi Note 8T have NFC.
> This patch series is commonizing Redmi Note 8 devicetree
> for a base for both devices.
> 
> The patch series also contains some fixes for Redmi Note 8:
> - Fix reserved memory ranges, they were wrongly defined.
> - Remove board-id, board-id is not neccessary for the bootloader.
> - Fix reserved-gpio-ranges the reserved ranges was wrongly
> defined what caused the device crash on the boot.
> - Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
> what is not supported by these devices.
> - Use memory-region property for framebuffer.
> 
> Depends on:
> [1] https://lore.kernel.org/all/20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v3:
> - Remove unit address and label from frambuffer node.
> - Link to v2: https://lore.kernel.org/r/20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org
> 
> Changes in v2:
> - Fix copyright in sm6125-xiaomi-ginkgo.dts as requested.
> - Use memory-region property for the framebuffer.
> - Add comment about the NFC.
> - Remove msm-id change in favor of [1].
> - Link to v1: https://lore.kernel.org/r/20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org
> 
> ---
> Barnabás Czémán (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
>       dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
>       arm64: dts: qcom: Add Redmi Note 8T
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 301 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 285 +------------------
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  15 +
>  5 files changed, 320 insertions(+), 285 deletions(-)
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260111-xiaomi-willow-448552f02762
> prerequisite-message-id: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
> prerequisite-patch-id: 1bc49c0e2bec1a47667df776e1ab265b0699ea35
> 
> Best regards,
> --
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Deps: looking for dependencies matching 1 patch-ids
 Deps: Applying prerequisite patch: [PATCH RFT] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
 Base: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml






