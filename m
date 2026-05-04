Return-Path: <linux-arm-msm+bounces-105717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDvcIBV++GkowAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:08:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D2F4BC2C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 842F83010EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299BA3A5E70;
	Mon,  4 May 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XS+qJ9Gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061173FCC;
	Mon,  4 May 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892878; cv=none; b=fQTRxBpTshGjQicQNWz/t6Eamm4CvOrI2btKr5QUW1cdJrCIhmWFo4TNVZtAul3eVzDKM0RWxPswQ8A5QHFG5Hl8rWuGMFOpksgQKIDhsRPq7sF9j+mZpTSHRvJLw0DjPdLF4t+nbSaTNj4VHVlKb1GIRCtUW0z68C944gYU0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892878; c=relaxed/simple;
	bh=NJBlii80Wvyq9eQxDBzJEvnqQ8O982NjKYyKfwGbn/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBYgqdUei1UlOkEnUN9Wok+zekGUoixpsd6VOGWF5njkp7EXNXF/83HWD566vgBCZTsRwmBtHiaDS4+QBIRRxOfhCz4SB3Dgm0boEWkvj45SJTLFeHeZBnQ9A5pd+uOH9lkvBn7HsATXuDp+bH4p/URHrZtQVVkGC/+ju0crigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XS+qJ9Gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F3FC2BCF5;
	Mon,  4 May 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892877;
	bh=NJBlii80Wvyq9eQxDBzJEvnqQ8O982NjKYyKfwGbn/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS+qJ9GizsMp/DAtoeKFIdoNsvUK+czkyEkf33otRFl50H8Eh3tfCQHVmQtaB7NIM
	 tUuZxCvBvX42UIHMX5izCHEj9sqy8VDV3ZSXoop25CrKKKwckWWntTxGlikQOEJNnZ
	 8drYfFPAfJeGm0q9YfjFVznz1+OvM4dcZEpKEsWpTBqceIK8SFniWBkCctduAPEYi1
	 7e3HoaNrHJJNWKdIImDnYCDMqPNA6N+D+wvPLjMY1tWEu35t6N3Vo/6oTRTDD9Tq6X
	 y1HzCAHElQljDK0U8c4D6DVT5Sk0ZXUlg16++uUsrHJpnu4CDXlOLwZuUKRwRJQuQd
	 yt7n8ATzKtevQ==
Date: Mon, 4 May 2026 13:07:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Message-ID: <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
X-Rspamd-Queue-Id: 43D2F4BC2C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105717-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
> Document the qcom,shikra-tcsr compatible.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


