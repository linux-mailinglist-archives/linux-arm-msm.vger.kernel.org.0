Return-Path: <linux-arm-msm+bounces-92127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI58KttKh2mdVwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 15:23:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0D10625C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 15:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82D0F30160CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1C0285066;
	Sat,  7 Feb 2026 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tO0Piah9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388332367D1
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770474200; cv=none; b=UhfA0fJggxwXxvPuqwcbMpYgEd4I+frZRqlalGXiKFuVCVG4fF7zZUGexakK7OQS95EtB7bsCbeb4BBMRQlioetyO+FJpazVE1/R+AN/tEyseNpuEch6qPy/IbkOf35S7YdTENVSnKl7CMpW9SzV/abQs8SliJgnMVy1SV2zv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770474200; c=relaxed/simple;
	bh=+szgMuEpKZZ6DZbNPpPmpHshXK+9ny8f91/pkGyjsvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2HRfDFHoftQWrCF7YP91+3ULwWtU+f3wJ8kJYrrEx97he4KByuM85O1qfk2e3MuiyPeNtpdaWOHqQli1649lAo1NgpN6BdAaqM6NWpFBAtXhlI801iq2ixVG0JdajfVMVfll7jBypk7SoV+oGzCgZUp702n/vvbk/SNBzoUDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tO0Piah9; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a736746b-aaa6-4b55-b360-5ad737567e63@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770474198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4QE+5u7IKXQ56J+UI6fOeWNJGfn+xPZSkNKWVeSjBg=;
	b=tO0Piah9mSn6pa9D79ouTMriEFSS8fJHl8ekqOTiwIbuefn1H4fy8/Fbl1yi8GeFHvm9cc
	evZgolb42sDjr2vSXhPM0NODYG0OMujbPRlOahY1dMXRWG7S129JfTWgesg/TK4EpQy0hM
	h4cDzZPplu20gcXmQUE14JAfj8B3/Uw=
Date: Sat, 7 Feb 2026 14:23:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sneh Shah <quic_snehshah@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92127-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vadim.fedorenko@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDC0D10625C
X-Rspamd-Action: no action

On 06/02/2026 17:19, Russell King (Oracle) wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..af8204c0e188 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -659,10 +659,18 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>   		return ret;
>   
>   	ret = phy_power_on(ethqos->serdes_phy);
> -	if (ret)
> +	if (ret) {
> +		phy_exit(ethqos->serdes_phy);
>   		return ret;
> +	}
>   
> -	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	if (ret) {
> +		phy_power_off(ethqos->serdes_phy);
> +		phy_exit(ethqos->serdes_phy);
> +	}
> +
> +	return ret;
>   }
>   
>   static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

