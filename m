Return-Path: <linux-arm-msm+bounces-104702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKZ1CN9H72n+/gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF619471AAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EF94300646A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222E83B6362;
	Mon, 27 Apr 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yHhasqvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED65A282F18;
	Mon, 27 Apr 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289181; cv=none; b=Q4WUeWz9eE8UbfG+7Ww4pigbzNHXB/QSXey4b5s3loRYc3Uiy1+kYbORnyjoQSgaDtCw85YnOBWHl8IGscNcyFUB6g+JVVwgdwW4MnKKtT+NOLB0Ts7PJQ6119wRKjx/f3dDnK6SKXFVjDXQ8HHX0+RwI/YKxHiYpj+9Elhjzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289181; c=relaxed/simple;
	bh=bynSCOF9fsKtICt6R11L2231yszicJ7C9pX9S86/5jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK1Q3656PCKfJVxHwJ6myAuTid6tob8eoBBw2gr/hqRE0iCF71sQbKpHrbp2c7xEoMPA6iwkMkLFE1wwS72HRCtDwfM8kBD0i5cnNdi07hy38x4flIToJELgfObd5M5/2t8dI3ta4jtFjLmZbBz5lKzB/M7eKY44+cTtoWVZtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yHhasqvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C64FC19425;
	Mon, 27 Apr 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777289180;
	bh=bynSCOF9fsKtICt6R11L2231yszicJ7C9pX9S86/5jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yHhasqvUuNWHnDbYMQW+tUfmFYkWZxAkz2K4nR+I0RwLFX1RPULBzKjhztg29MPjo
	 A3bvNH2EPwsjdLTnjirVg6SwLh2CkMgVE5QCJzKMW1xeUvsen65dchK6cAjTJqX8S+
	 3kztDEajcF29T2xaMl9HcouzGvdMoxoRnPiKHC/I=
Date: Mon, 27 Apr 2026 05:25:45 -0600
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] USB: qcom: Unify user-visible "Qualcomm" name
Message-ID: <2026042711-populate-manifesto-e206@gregkh>
References: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: AF619471AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104702-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:dkim]

On Mon, Apr 27, 2026 at 09:00:45AM +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
> 
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm

Does that mean you want to take this through your tree, or you are ok
with this going through the subsystem-specific tree (i.e. USB for this
one.)

Either is fine with me, whatever is easiest for you.

thanks,
greg k-h

