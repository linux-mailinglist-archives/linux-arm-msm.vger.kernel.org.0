Return-Path: <linux-arm-msm+bounces-95456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNLeD3ycqGlDwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:56:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E5207BF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EEEC302D96D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 20:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A2D37F01B;
	Wed,  4 Mar 2026 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbA0MI/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C68239E6F;
	Wed,  4 Mar 2026 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657785; cv=none; b=gwTx3OcRq/l3v4yY/hSeSnNkPht5KeZ9ArCpcChFIblque3Vd5S3r07rk1GFOYiFp35ma4yNYavJ/HjSfC8XtpYhToCUUW/2IBnhgk0P0q61bE1yD3Geifk1f5ElGMHEtnViI12JIh0/gy59mJhHz/KlpkGQb4ZCehEbyc9vCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657785; c=relaxed/simple;
	bh=4miKrOyOeAlc+J2Ios2RIDFEqUBEX2FaGTCxau8xQqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmbXeQDC/7HYztdt4AM5tIq5tFq4MP0acrD8MiY6spExrataDnOvL7vjaDWDrxF+RKTt4Ju5VlymultxSpAwt6iWkTSHnZGULeH8xMQJbqSDL77EzV7MAkIX6h0agsNx+HyTn76IRQ7ouEr07JXGJFUOQWw2PWa/u0ksYqHau7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbA0MI/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03624C4CEF7;
	Wed,  4 Mar 2026 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772657785;
	bh=4miKrOyOeAlc+J2Ios2RIDFEqUBEX2FaGTCxau8xQqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbA0MI/v1+vgNHVfpePjuy4pPg/KSVSVi0kDnqABIZ1kAQrno6N8XQG+dbJ/6jqN7
	 OK5toIDSFbfTFeZJFCE7ZLRwISzkNSrmJS3RKEO/mAQC0Wb+9+uKKmH9n9iuWdbawy
	 4u+b+Ev+WnuyGx4TIgtW7qFl8PrnqXtq3WnDksc7Pi4D5mWsn0Z+cvscCAT/eRVk2X
	 aaps5DehHwoS8SL+eC4oa7KTh8piDAS17BEl3xkWK4QN9osw1/UDf366x7EDFS6VWh
	 fOE3o1dZarD4RSBx2KDlVgFDPNEpqrlHhPSAjmnCkodnC1Qx+LeIuNfCTlqxqmrHTn
	 FNd4UG8AFpYCg==
Date: Wed, 4 Mar 2026 14:56:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v3 0/2] arm64: dts: qcom: glymur: Enable SoC-wise
 display and eDP panel on CRD
Message-ID: <p6ua35deutb2cf63mdciwh46rufnoubaj2ywjeag2ypntm3zmx@fvyg4qztwr3i>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9A2E5207BF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95456-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,msgid.link:url]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:44:07PM +0200, Abel Vesa wrote:
> Start by describing the MDSS (Mobile Display SubSystem), the MDP
> (Mobile Display Processor) and the 4 DisplayPort controllers it brings,
> then describe the PHY used for eDP and tie up the PHY provided clocks
> to the Display clock controller.
> 
> Do all this in order to enable the eDP panel the CRD comes with.
> 
> Sent as an RFT since it was only boot-tested on a remote-only accessible
> device.
> 

This doesn't apply, am I doing something wrong?

> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fixed opp table according to Konrad's suggestion.
> - Added missing reg regions for all DP controllers, as Konrad suggested.
> - Fixed all sizes of the reg ranges.
> - Replaced all 0s with 0x0 in all reg ranges.
> - Added missing clock name entry reported by Dmitry. 
> - Link to v2: https://patch.msgid.link/20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com
> 
> Changes in v2:
> - Add missing PIXEL1 clock to DPs [0-2]
> - Use the same opp table for all DPs and drop the dedicated ones.
> - Drop the extra compatible from DP1.
> - Changed compatible for the panel to samsung,atna60cl08, as that is the
>   actual model.
> - Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org
> 
> ---
> Abel Vesa (2):
>       arm64: dts: qcom: glymur: Describe display related nodes
>       arm64: dts: qcom: glymur-crd: Enable eDP display support
> 
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |  71 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 471 +++++++++++++++++++++++++++++++-
>  2 files changed, 534 insertions(+), 8 deletions(-)
> ---
> base-commit: 767cea52f08277557c8ba0e37638f2e7da271677
> change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
> prerequisite-change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354:v2
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v3
> prerequisite-patch-id: 66643de4d7142692ceee6ab78d4c1fb446182123
> prerequisite-patch-id: 056da4cc346b633ccf7e12536839eeefa9469b78
> prerequisite-patch-id: 3d3c5004e30407229b8f6612ee2c56dd6171447c
> prerequisite-patch-id: a4ed5f8f3d10b47b0d1daee2e0dc44090c13c01c
> prerequisite-patch-id: 144090e55a19a1479f4b35b75f9e5b80a9b919f0
> prerequisite-patch-id: a9ccb06216435308c295e2de9adffb79060439cf
> prerequisite-patch-id: 1e8d403675640d7db68a4c0caf28d1b1be895e8a
> prerequisite-patch-id: 09bf515a2cd6bec5b21f15b18bebdb172f4b4a57
> prerequisite-patch-id: e88699eb550ada640f5f2f5e4f432d6a3ae2552f
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 460edb2664f266b4f33fb213e88316ba9402b3d5
> prerequisite-change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9:v4
> prerequisite-patch-id: 64ec868b066c682f08ff9845e4507cbf7f8f671d
> 

Do you really have all these dependencies? Do I have all these
dependencies?

Regards,
Bjorn

> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

