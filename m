Return-Path: <linux-arm-msm+bounces-117029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 67OUCkkYTGoxgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090771597B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:04:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EMkc2D08;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF7133002A33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 20:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F055D414A15;
	Mon,  6 Jul 2026 20:57:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C41401A18;
	Mon,  6 Jul 2026 20:57:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371469; cv=none; b=tPZljAXtQsyLo84joRAFW3GWz4d9C/H6W8TUIuWfAWwPCqQQEv5pdSEh9dnJO5JMV0GJyBCm5AoPxZnk6M33zDhmsch+eh7qlx0Kz4lhCZ1Xde5iz/rb66mDv92xSSjIRBLKO1aogrBIONJv3zHY4ME/0X7P13cpWuMLldBdf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371469; c=relaxed/simple;
	bh=1i9wRAcN+eaW5XM6qUJ52T7cS+iuX8AWhGR5Y144jqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1wbN/r2Lx2Prsee7sd4YX9rCHV3/3HFKJEzP33CaTFtWR1KRNs8n+mIK5w4bkpNIeGUr8nFlpYjGeW3xwyq6Zh7JwrDgxxqYFjfha59R1HfkO8GS23Dg7ofUxWk94zYARlhbwwQz9p3iTUUK4EWgUs0l9H+3lnDVASa44gHAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMkc2D08; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852A61F000E9;
	Mon,  6 Jul 2026 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783371466;
	bh=nOu51CftDKT/8lEhIUJEKEyqb/J+pvspo3kM/wMdm9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EMkc2D085Nzt4v0Z9InTvf30p7moPohv5Zm5sFvEiYX0MD0JBi3Qd+adYnvCLea1G
	 cFCY3ZLloc22aUN9QyiStCuvizsQ0BH35UyhGVdp+2CdDs/2urc1YmJRt9k3WaSwiJ
	 sMSp85EwtbCRnSONIVTNRj688BHmpJvSU3yLmojcgvCIHCzfCYvM1U2RZp/h400UfY
	 Vt5XCBPf56PoFXh1AfNriOz4TZiK6WTzOL13ZC2prITQz0BgBH1ZOq89CzljdTzAsP
	 6Thy4AZhaFtGYi3IY4xTeDDxJv6KJIeCYT6pasV8+iavCwpHn5C4z78N0eDKI+dkDZ
	 fWy7jZrNdyyjg==
Message-ID: <6b081039-595b-4e3e-bf4c-bf5f689c80a7@kernel.org>
Date: Mon, 6 Jul 2026 21:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: add SCP address paging support
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117029-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:srini@kernel.org,m:pierre-louis.bossart@linux.dev,m:luca.weiss@fairphone.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5090771597B



On 7/6/26 8:21 PM, Jorijn van der Graaf wrote:
> The Qualcomm controller driver ignores the paging fields of struct
> sdw_msg. For a paged access (register address >= 0x8000 on a
> paging-capable peripheral, e.g. the SDCA control space at
> 0x40000000+) the core sets BIT(15) in the wire address and splits the
> upper bits into addr_page1/addr_page2, but since the controller never
> programmed the SCP_AddrPage registers the peripheral resolved every
> such command against their reset value: reads and writes were
> silently redirected to addr[14:0] in page 0.
> 
> Write the two SCP_AddrPage registers through the command FIFO before
> the transfer, as cadence_master.c (cdns_program_scp_addr) and
> amd_manager.c (amd_program_scp_addr) do. Like those controllers the
> pages are programmed on every paged message rather than cached per
> device; a cache can be a follow-up if the two extra FIFO commands
> ever matter.
> 
> No peripheral on a Qualcomm bus sets prop.paging_support in mainline
> today; the first user is the WCD9378 codec, whose driver is being
> upstreamed separately - its entire register map, the
> wcd937x-compatible analog core included, lives in the SDCA address
> space.
> 
> Verified on the Fairphone 6 (SM7635): WCD9378 SDCA registers read
> back their documented reset defaults and audio capture through the
> codec works end-to-end; without this change every paged access landed
> in page 0.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
Thanks Jorjin for the patch, I have pretty much identical patch that I
was about to send.

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  drivers/soundwire/qcom.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 603f228f46b5..3562802f4204 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -975,6 +975,20 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>  	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>  	int ret, i, len;
>  
> +	if (msg->page) {
> +		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
> +						msg->dev_num,
> +						SDW_SCP_ADDRPAGE1);
> +		if (ret)
> +			return ret;
> +
> +		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page2,
> +						msg->dev_num,
> +						SDW_SCP_ADDRPAGE2);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (msg->flags == SDW_MSG_FLAG_READ) {
>  		for (i = 0; i < msg->len;) {
>  			len = min(msg->len - i, QCOM_SWRM_MAX_RD_LEN);


