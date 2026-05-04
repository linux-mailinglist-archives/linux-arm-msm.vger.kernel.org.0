Return-Path: <linux-arm-msm+bounces-105690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CEhGoFx+GkYuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:14:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F401A4BB864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11829301A7CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5600392820;
	Mon,  4 May 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5Q4KhbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5B391E6D;
	Mon,  4 May 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889645; cv=none; b=FfZ1uSMdAYcIN+S3K8Q5n95DRJNDkJuInInPP5HFVTnZqAQMiJXXsbMIcgei1LhvbqQOuBusAGJL2dMqS+++p8jEwCufGM9QaV9dmP1WcLtlkAb8Si/V9YKwOtK3bFUXuzeTyQf78SiSWVVSgiegvkhsYHHoXZVJsYh2KfQaN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889645; c=relaxed/simple;
	bh=RG4DEVEEpMu7xdDX4buQKKb7FInJnW2Wd6L2FT+fV4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZZYMMI8q8E1Qsu7T/5TzEYmQkxgedwFpnaUEUeH53qs1NUJEmhKQch0p/4GsFTqfIFMXIvnIBK9JXNrdutKPv6kC7FyXBekqbKGiQpvhyHNZfXaSIx+C/IinMEHEb4cgw2KKvVNhVgFoq2Dg4f5hqy9eMsQljNvgIKjEZmUa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5Q4KhbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9DEC2BCB8;
	Mon,  4 May 2026 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777889645;
	bh=RG4DEVEEpMu7xdDX4buQKKb7FInJnW2Wd6L2FT+fV4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5Q4KhbSGkz8bO+AX2Ik3zGT5w6v8QFH/VmeLDBhfGlvY5DOfs57AvshEO+ADKI2s
	 EPOstacNa5uE0mXvqoI/FUkANYeolxPIGiN4WUHtsDuTYo6kvF8IcrhUqWVTiucqYR
	 VIwbeenphl1PhnEvuiuLzprwJslA69HrmPF7T5Gl+rHece+YmNKgY/WjufnrU+E64E
	 Ixa5wKuJ6RtWgQER995aCIKry4RzXqg1RNx3kSWwpBHJHaCoMTGjpoxygrESDHj8Am
	 NBxaLbEeOi2s4+bqIy8sCtkNPxryx4aKDD/T4h4j+w+Pd0THK8R7ZpX4cC+Yv02gTf
	 QipQGJDR+o8WA==
Date: Mon, 4 May 2026 12:14:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for
 Shikra
Message-ID: <20260504-manipulative-stimulating-unicorn-a1dfe0@quoll>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
 <20260430-shikra-usb-v1-2-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-shikra-usb-v1-2-c9c108536fdc@oss.qualcomm.com>
X-Rspamd-Queue-Id: F401A4BB864
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105690-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, Apr 30, 2026 at 05:20:27PM +0530, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Update dt-bindings to add Shikra to QUSB2 Phy list.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Incomplete DCO, incomplete description of hardware, mixing subsystems
without any need or explanation.

Best regards,
Krzysztof


