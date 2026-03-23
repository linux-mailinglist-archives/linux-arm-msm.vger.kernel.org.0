Return-Path: <linux-arm-msm+bounces-99254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHOTAzc6wWn2RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 960302F26F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0DE0301A7B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C091DD0D4;
	Mon, 23 Mar 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8Q66bf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46D1BD9CE;
	Mon, 23 Mar 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270992; cv=none; b=kpYvSQIjwr7VuS19T8VeYiHUwoyA+ybR3eCkuKcI/b/KU09Yixr/4C/+I8RxT1YwV9Ikteba6MwubeEz5FgXByQyqIG0ZT6EyJ3dB06gRV8X63JbW0uDT2j41YDi0yaG6uPu5mCJBFEx4CkptCI0bkjzPk8d/j9iUTUbChwiyss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270992; c=relaxed/simple;
	bh=Tk7AEuVV6ndbpjTrtP+kp0OL5C5X36tTLwvYycCGgoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6XsxMfZPLuaBSbMoL48UVD8FyFFC9IvIQHFQlm14m3ydmonThgVR/NPg2LIPKIgfTgk/wLCdJhCWzijS7fVOqggivqmrjNfGbbuQUBup9u7biRKSZmZ+vvW9A7G7WybIM9+GoQseX2mn4DTQURNAFGjzhgMmyOKeQR1ZD8Gu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8Q66bf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D14CC2BC9E;
	Mon, 23 Mar 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774270992;
	bh=Tk7AEuVV6ndbpjTrtP+kp0OL5C5X36tTLwvYycCGgoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8Q66bf06G1dsP9YjDVy45z/OBnME4cBHyHwO3Gy5BmnfNzhrN4+TIdSYomXlep5r
	 pjfJeOMArWSQRlCxJs8WIrmBu+jW2vYk/YcBbNQeWm/o0lWrAYiT+ctX7NrJvWiD6j
	 yD8xUvfKicElNppjhGXMCYG34sZqkWxEmbBOzDPQ/M/uCT4OEjixVzp1bVOivROeKv
	 HXHpMc4Nzc7A+0ua/gSllR1bLm4OV+h3c+GXz8ynm4qtW3FcG2w2Mah4ElOVNaRBpb
	 wH/YfD4G10Gk/zb6a5YqX3P9jiPUUuyOzQa7joV/4s8q5Xk7z5FNp49cH5iLOqIdFF
	 TkDcNKiCl9JSg==
Message-ID: <0b2bbf85-9534-4eee-b31b-5bc9db326b43@kernel.org>
Date: Mon, 23 Mar 2026 13:03:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <kQjTNLd-JD3vGP5gW5LKd2C5hr2k3PuPhOk6Ow6FH1zWeQmsQdPVIgl5TS5_LyL2qkcNQM87wEPGIcpeWqNhxQ==@protonmail.internalid>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99254-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,5c42400:email]
X-Rspamd-Queue-Id: 960302F26F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 12:58, Loic Poulain wrote:
> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
> QCM2290. The OPE is a memory-to-memory image processing block used in
> offline imaging pipelines.
> 
> The node includes register regions, clocks, interconnects, IOMMU
> mappings, power domains, interrupts, and an associated OPP table.
> 
> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
> clock is shared across multiple CAMSS components and there is currently
> no support for dynamically scaling it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index f9b46cf1c646..358ebfc99552 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1935,6 +1935,78 @@ port@1 {
>   			};
>   		};
> 
> +		isp_ope: isp@5c42400 {

Should be a sub-node of CAMSS.

---
bod

