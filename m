Return-Path: <linux-arm-msm+bounces-49442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B172A457DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D34D188DB6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B0D238157;
	Wed, 26 Feb 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sukt2lmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B822423C;
	Wed, 26 Feb 2025 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557531; cv=none; b=fqUEgj2v36xapwDoRRBNfApWFRIUAo6K8vqFv2Wlmnq6GDFwNGJVL5cU0ZMW5aotMvyS3q0YpOjpjnbcwRZxvFLWpGhs7OyGWVd5Apnp/0VmHqIXwvAwqc68Lr67EvwDItWhj1qOOd9pTRejSTreaEvl4Qyy0xe/0mNNwsNe1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557531; c=relaxed/simple;
	bh=X+ENWuPD+JB6t0c8PzzFNjzL6/ESOQRKHl4B55Rn1SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIIKwAqC77lGOHxLN1bIQ1TaoQl0WY7rpcSJzHn6oGBp4As7eVPwkvRHBrdsSBQTZObaRkDQbi6hQNzJluPYeWkvpAx61BxZWGXpyE1ECG/PZct2g0hxv7II9H36MpmFz3mkFRQy5d/lpnDWRDNXa6cp9IyEKhbvpMIvUs8HdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sukt2lmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42A2C4CED6;
	Wed, 26 Feb 2025 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740557530;
	bh=X+ENWuPD+JB6t0c8PzzFNjzL6/ESOQRKHl4B55Rn1SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sukt2lmfbb1YRaIhEuoOIVPmO5LxtzAr4sDu54lYTLt2kmTm+sEi58qQIj8XKdAkV
	 iFR7LZ6gSQXV0vWF4imJIX2947HOfrYc2h3w5/vCT4UGaH8yOr1cWkHGF94rYMKdyd
	 TUBCWS0EHb1ZmqEuWhN4kdh/v3+uCl0xENlExZu9G+O1Kq74Po9fol0lJUe6p5vA6b
	 8Qw6OzKFqqE+KfHdD4aVxeysGbjkzGGwwF0ihGHWERizdlLwDwCo9ge77SxBzDdxoO
	 KwwC5oFTfHPd4M6AWGEpmymbUANHtgj2tT2Z7v/eH9s5iPZMZ0s2eVg0V2FhWf6uyP
	 6BoklGoCFLePQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnCWk-000000004oQ-3B4H;
	Wed, 26 Feb 2025 09:12:23 +0100
Date: Wed, 26 Feb 2025 09:12:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77M5iXHQsdMptWm@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024338.3994701-3-quic_sibis@quicinc.com>

On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> The addition of per message-id fastchannel support check exposed
> a SCP firmware bug which leads to a device crash on X1E platforms.
> The X1E firmware supports fastchannel on LEVEL_GET but fails to
> have this set in the protocol message attributes and the fallback
> to regular messaging leads to a device crash since that implementation
> has a bug for all the X1E devices in the wild. Fix this by introducing
> a quirk that selectively skips the per message-id fastchannel check only
> for the LEVEL_GET message on X1E platforms.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    |  5 +++--
>  drivers/firmware/arm_scmi/perf.c      | 30 +++++++++++++++++++++------
>  drivers/firmware/arm_scmi/powercap.c  |  8 +++----
>  drivers/firmware/arm_scmi/protocols.h |  2 +-
>  4 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9313b9020fc1..b182fa8e8ccb 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1903,7 +1903,8 @@ static void
>  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  			     u8 describe_id, u32 message_id, u32 valid_size,
>  			     u32 domain, void __iomem **p_addr,
> -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> +			     bool skip_check)

This does not look like it will scale.

>  {
>  	int ret;
>  	u32 flags;
> @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
>  
>  	/* Check if the MSG_ID supports fastchannel */
>  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)

Why can't you just make sure that the bit is set in attributes as I
suggested? That seems like it should allow for a minimal implementation
of this.

>  		return;
>  
>  	if (!p_addr) {

> @@ -1282,6 +1288,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
>  {
>  	int domain, ret;
>  	u32 version;
> +	struct device_node *np;
>  	struct scmi_perf_info *pinfo;
>  
>  	ret = ph->xops->version_get(ph, &version);
> @@ -1297,6 +1304,17 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
>  
>  	pinfo->version = version;
>  
> +	/*
> +	 * Some X1E devices support fastchannel for LEVEL_GET but erroneously
> +	 * says otherwise in the protocol message attributes. Add a quirk to
> +	 * force fastchannel on LEVEL_GET to prevent crashes on such devices.
> +	 */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,x1e80100");

Here you should use of_machine_is_compatible().

> +	if (np) {
> +		pinfo->quirks = BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET);
> +		of_node_put(np);
> +	}
> +
>  	ret = scmi_perf_attributes_get(ph, pinfo);
>  	if (ret)
>  		return ret;

Johan

