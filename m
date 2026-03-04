Return-Path: <linux-arm-msm+bounces-95454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP/BAdCTqGkLvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:19:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3220789D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE63300CE79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 20:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F2E34A78F;
	Wed,  4 Mar 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfPZFjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67833B6CC;
	Wed,  4 Mar 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655431; cv=none; b=Trnx0qtgAW9ht1i+eABzAaFT6sEiFNMbwCQsJuvlrG0+D62vMluUXYfYp9E5GZXqEohMtrbodK335vBfZJKxwLMOUTQQMgmxT6ExoH9VLZwtjIUiPXuOmw0+q6FVA/0Bmw6I5OZibkl2SELBmWQkWiDBtTFkObRa/1bUIEO59lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655431; c=relaxed/simple;
	bh=Ew0sj9abeVbOjePp7BPCZPYrqEj+18Iaxog4xwj0wc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE1taaJIKdeZbrdQK4c/ZABfuMBWJbG8myb7H58Eqhq0YJSXoURFeq1YIxsD+lcbqKBjoDHGDKMu3Guqy/mL1r+U0Ticrbq5qou4fJmtb05GsubXFb2sPkn1wCB235y24U3uAAlTAqUXg3QqB0vvXbN0nUAz7t5iJosGqJcqVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfPZFjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0A7C4CEF7;
	Wed,  4 Mar 2026 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772655431;
	bh=Ew0sj9abeVbOjePp7BPCZPYrqEj+18Iaxog4xwj0wc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrfPZFjUJnjvzd8LBJEmjWlQYtOpp+VPrx6+AagL+Ur8B3hsX6U9YqM3nk0kTaJrL
	 Rgqrri9tyhYYptmKdtbxSG3q9YocAIl60OPGzcjynzYKMy35DUXHH1v3SwvWUp47zf
	 UFtlCYKVnb96J9o8Zayo6UWfXbZST7dLj6j7Ctzz9t8lqTNjRESLlUedUmiuss5JFo
	 UeoTO8fNsEh4fJu5HDIRehsg8l72RfdnE+iKmv51rLdNR+huUC65+m76bePzlGWlkc
	 0mzG+C60FSiHkBUEmLGhbfQ0et/knnhqz69dtWIR+pb9ToAUi0reZDW0/PExLWpK4o
	 MRvc1+FYhdZcQ==
Date: Wed, 4 Mar 2026 14:16:55 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
Message-ID: <ao4jf5guszon6iuyyvzmkuaf2iaa56y3b33srx2w3whtyo2u3r@k74fxy3ktsyo>
References: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202055436.818098-1-xin.liu@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5DC3220789D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95454-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:url,qualcomm.com:email]
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 09:54:36PM -0800, Xin Liu wrote:
> All the existing variants Hamoa boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices. However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 

Lots of people are running Linux at EL2 on their Hamoa laptops, but
then there's no PAS. I presume adding iommu properties won't "hurt" in
that case, but can you confirm that with this change remoteproc is fully
working somewhere (i.e. [1] refers to a firmware for which the Glymur
PAS/PIL changes has been backported?)

Regards,
Bjorn

> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc to the EL2 device trees to generate the corresponding
> -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix the adsp iommus mask
> - Link to v1 : https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> index 175679be01eb..ee006742d6f3 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -52,6 +52,14 @@ &pcie_smmu {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1000 0x80>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x0c00 0x0>;
> +};
> +
>  /*
>   * The "SBSA watchdog" is implemented in software in Gunyah
>   * and can't be used when running in EL2.
> -- 
> 2.43.0
> 

