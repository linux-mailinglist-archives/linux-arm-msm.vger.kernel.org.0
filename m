Return-Path: <linux-arm-msm+bounces-114741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QiraM+eGQGoxgAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5A6D2F6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:28:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bmY4VOlm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D4F3013D74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 02:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA7C230BE9;
	Sun, 28 Jun 2026 02:28:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452CE42AA9;
	Sun, 28 Jun 2026 02:28:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782613732; cv=none; b=LQj4QdkfXFFgbp/yB3kuQaDjRn23biy3y8jLt0+O3c6vMB9pTpKZST5i32FFOorhmSSf55sS8Map+I/+uGYaCm/0Am2lnWlQwjv8O8og+i7/x0Ov41s2d39kVXxvdFNLTF9TIiL5pugrYc4UX91qXKbRHMnqrI4oSplGfv+KjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782613732; c=relaxed/simple;
	bh=Rb5P6FLLBKeU+l2eWT+4RQbNQqPtPqKFt+iwGEG6oq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLbZ7JtQCPg/tY3vAkflPQQCDxszps38BOiwHgvUtAwbMYzGG6Lui1u17yd4hNK9oKg7kfrsTSf4pKQHjJBAo/XmJjMCSRVkWmJ0mv0ib0qfTepsRqJpSJKkN+1EmUVNDrdb3xTOEaF20hl1IrQNfAi3f+7BlhL4mMwoNXzsSS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmY4VOlm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E901F000E9;
	Sun, 28 Jun 2026 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782613730;
	bh=1gE5MXzxTClZfJ9zDwzoAEPoflVvwE9JcK26E48UXok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmY4VOlm/qrDTHBXWuwR9vkcAZoDKcH80vBn1+LRYzCCRv5CjArxuYI3gNXixw/wJ
	 dYUq88rp5TyqIFle1tEmKqy6MJFIvoYG8Zxw6Rr5YpNyi49ryNUnRv3AsTd/hyBlNH
	 nRo5qE1TTEZtZpXjGN2nLSSnH7bqUlvJhvxDHnyHlVwMMsHrHHPozkXSeBPlJ2/tVc
	 VdU9aErnvH0deAeNMamJms5voSE6xGvSm7Dp7xjVJSjoUqJT7EcCKy/DqLi0HnDF4s
	 3uBUCoWeIj6jb7JFONso6Ga8aiZUrKXftNEF0UNC9IdoDtF0joX55B+E0PitrVLN+H
	 rW31A4tGr7gsw==
Date: Sat, 27 Jun 2026 21:28:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <akCGiJU2pIlLEi-D@baldur>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114741-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,baldur:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24B5A6D2F6B

On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHY to the

It's hard to follow your thought process here, as you didn't document
why this change should be made. Start your commit message by describing
the problem that your change is solving.

> controller now the mode-switch events can reach the QMP Combo PHY.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 0acc6917d7aa..204513a6bd89 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> -							data-lanes = <0 1>;
> +							data-lanes = <0 1 2 3>;

And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
wired up.

Regards,
Bjorn

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};
> 
> -- 
> 2.34.1
> 

