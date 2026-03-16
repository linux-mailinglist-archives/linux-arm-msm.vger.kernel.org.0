Return-Path: <linux-arm-msm+bounces-97831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCg9BJGBt2l6RwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:05:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9829484D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5374C300C83B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665AB3368B1;
	Mon, 16 Mar 2026 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="isRfb0ZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3A3368A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773633934; cv=none; b=QiZeWIf/8vHHFKT6Mtu5p5foJlS5YXULrfZcotj0b+Xd+R7++0euspNbghHEHtZoSgcckU1HbXcHJKPwpy8SNU60PDT36MVYTkRRS3QEEMHndxWcez12DgsYdWYzJ58wGSJcoPmVExHV76ci4joKux+FeVwOJp/eru96oOJt1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773633934; c=relaxed/simple;
	bh=Y9c1a4Py20gq4TkH0TXo8JxaNKnsL0/Rmd1JsSFhCno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+eD+A10/0mjU9FHJhKmk3i9ARrmfQSYmP6elH2phEoAKFB5dtWmfnho2zVX7SHkkRThCFK0V8efSc9n8GzFEPEkJOHFQ/DwrOke7IOlV/PP8yRR7Ramsbkyb5SZgSzkNlZtszJCSP6crhUNh3tZSdnDOAbg2ALKWlS6WVXflKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=isRfb0ZK; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <356110cc-699b-4a6d-973c-403d2e29630e@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773633920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Enrnr2Za2CQYBVNVFfoijjev6ueYfAAqFeZKxAVGuyw=;
	b=isRfb0ZKlT9gMRRA46CPaDR3dkbu+xeh8WNqbXRjalXtgCkttrIdIC2OI0EQYYvLpVKBd9
	YvE6WNlTnTICyhyRwunHlK7FqVSvo9k/FQOe0NBEdOQS3nUVxkk/F+cjFeJxIu44vPeAbQ
	pEL7ECL7OMakGTI3r+2u5oLKopWDfAuXWxNKB3wnmU34PJsJ4dVFJsN9A4aaMcqtHH5d0w
	5eabg1fZKEtorlJG9zjpzFWc1Kc1g8LQosT43NaBr2f1Dy6+k8ktLLdWwHSK+bKh3cVgf/
	tbQCNY9p3ybJ3kKj5Yw7XAB2vlo35DCOb1zfVXPVZQcnuQutROMZExq2lQLEpQ==
Date: Mon, 16 Mar 2026 01:05:02 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260305093941.305122-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DA9829484D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/5/26 6:39 AM, Stanislav Zaikin wrote:

> Xiaomi 12 Lite 5G is a handset released in 2022
>
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> […]
> +		vreg_l7b_2p96: ldo7 {
> +			regulator-name = "vreg_l7b_2p96";
> +			/* Constrained for UFS VCC, at least until UFS driver scales voltage */
> +			regulator-min-microvolt = <2952000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> […]
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	/*
> +	 * Technically l9b enables an eLDO (supplied by s1b) which then powers
> +	 * VCCQ2 of the UFS.
> +	 */
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;

If this device has UFS 3.x flash, which it most likely does, the 
copy-pasted eLDO comment does not apply.. and VCC range is 2.4V-2.7V, 
2.95 is overvoltage!

If it's actually UFS 2 after all, it would be better to rename the 
property to vccq2-supply.

~val


