Return-Path: <linux-arm-msm+bounces-107553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBTYILmbBWrAYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24808540049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B240300B9F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C77A3A8757;
	Thu, 14 May 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LypZscHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5653A6EEB;
	Thu, 14 May 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778752355; cv=none; b=UcZ3kkswZ2c2hjfEZTJxi2cUyqU2B9CmoLu8NSfkMBZjPGnT9A2Yo14V8pzT8LHjNdU7lmIEg/5Sy3p1uL+zwjc/yvl7XrNAcypUqMTvnReOqzn8sww768cw4gz9/xBIYT3uYtbqNmaep7w5TjGbosWwIqk1igDwRpkwWxDILBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778752355; c=relaxed/simple;
	bh=RgThfRfi90t4CYlBZ1BwD8ONPCbUAT3OicJlijcFJak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkXYlZ3yZRBLZv3zdosLGucjtyJ+a/m4AaXYmSTAk5DDon/rr7tLHTrz+B5AiuzLmeTp1o+iZdV9KkCXT6aFY+ZFLChQU81XCJwXvH6IPPM2xGORhuK01Y+MGLcPqcQ1sFKdgzsWwtRookhVIvTKHcee/4vxi4GHNeVCW5ETSZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LypZscHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04706C2BCB3;
	Thu, 14 May 2026 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778752355;
	bh=RgThfRfi90t4CYlBZ1BwD8ONPCbUAT3OicJlijcFJak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LypZscHLziQriDtJv/Glk0fiYd5ADPqALEthu1bCkqdc4MnG4oVVyxOis86AtViaP
	 HJD6bHU+bjrtX+CyKDWSk2LriIER/oiLrGH6jHsqUDfWpI6dhA3mTVXeXotEFWg0Np
	 EsJ7piaDsoBPtgqe9Qv4fm4nvCGhehZ0V3c/dAt3m+MkpNnmWZxO+NywEMo6tLyQ90
	 X3zCqWcxrxGI4V5AjxtGfC9wNV000nI3m0Eirx2hvDGE5+sA7nysidgyLon2+d067+
	 1gFd9M5offUDtEGf+WFzHhW5jom+c1CcVM5pF0Ab9C2eVmJzauOG+1TkhipaoQkMio
	 ajdZoCwhLjjGQ==
Message-ID: <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
Date: Thu, 14 May 2026 12:52:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 24808540049
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
	TAGGED_FROM(0.00)[bounces-107553-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djakov@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/12/26 3:18 PM, Abel Vesa wrote:
> The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> SDCC1 interconnect paths can resolve to a provider node.
> 
> Bump the qsm_cfg link count to match the new entry.
> 
> Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> index a4f7903f0524..6d12a1c3c034 100644
> --- a/drivers/interconnect/qcom/eliza.c
> +++ b/drivers/interconnect/qcom/eliza.c
> @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
>   	.buswidth = 4,
>   };
>   
> +static struct qcom_icc_node qhs_sdc1 = {
> +	.name = "qhs_sdc1",
> +	.channels = 1,
> +	.buswidth = 4,
> +};
> +
>   static struct qcom_icc_node qhs_sdc2 = {
>   	.name = "qhs_sdc2",
>   	.channels = 1,
> @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
>   	.name = "qsm_cfg",
>   	.channels = 1,
>   	.buswidth = 4,
> -	.num_links = 29,
> +	.num_links = 30,
>   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
>   			&qhs_camera_cfg, &qhs_clk_ctl,
>   			&qhs_crypto0_cfg, &qhs_display_cfg,
> @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
>   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
>   			&qhs_prng, &qhs_qdss_cfg,
>   			&qhs_qspi, &qhs_qup1,
> -			&qhs_qup2, &qhs_sdc2,
> +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
>   			&qhs_tcsr, &qhs_tlmm,
>   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
>   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,

Should we also add the sdc1 to some BCM?

Thanks,
Georgi

