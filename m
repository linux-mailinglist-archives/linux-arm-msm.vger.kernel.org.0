Return-Path: <linux-arm-msm+bounces-105863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF0ZA4Sh+Wn3+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:51:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E54C845A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60CAA3093176
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4789D3ECBCD;
	Tue,  5 May 2026 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXRjZ9wK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785C3EC2F7;
	Tue,  5 May 2026 07:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967245; cv=none; b=E3f5M49zuBh6S5ZH+pEgp7gUr+IVs6hRzrVYXfHL1N4/I3n5828G/M3+1f6AlWc1T62oxrJDOM1yDBP3JRLoAadVo71f6RMY+w0JX/SlaTOxqm7PvLEYp4JzjQr3r2HlBKaRhU7LdHioK1PVTl8O4wfVP3f/lQ4JmKYeQZ48EI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967245; c=relaxed/simple;
	bh=S5DCEpQQY8jHnHa9bPETfZ4LlRSc5EYFF7zJMZdC60o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/nXq3YlPiDxOS/Qyd7kG1K9tbmsqg/uiuTzW70cimhNrvwy/TSoN8TIrvMkt9YMMTJTVcjoKImTnsGUFUQ9wrx/tkQJU4pj5wUVu1fQY24HozrkRRVeuq5uXiBs92FV2Fj/KibmzlDPoDE+FQPYSJVqIDqaCGAaqcbiZ3lWDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXRjZ9wK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071EFC2BCC7;
	Tue,  5 May 2026 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777967244;
	bh=S5DCEpQQY8jHnHa9bPETfZ4LlRSc5EYFF7zJMZdC60o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXRjZ9wKq8FW+m4saZFFHPCkzkRXD0W82R3NUAg2nXNsgi3pJ6ft7PsmGYQEY29zH
	 Uts0rRmHQGjmoz92cR+rzp/7ezfCtqk+CRn6v1//TlUokQBiDHsJWC7qsHJ4iibXI9
	 oJngVM45zMfy0jBC0i0Mea0+hD/WVrZ/p8sS9L1vBZQIjrnNOWNYOoMVkbxA0vhtaZ
	 sBEYNOlK+zC2/uZkKeLr44tbhYYktXZplafoHKLK+KYgXG4JfAzr/xsqzy9sAMPAzK
	 nbuMw4gwWn6FG6JQmlXrVa0rPHeY8peRrqrSbZIlS+gMuXTUsX6Jdo+yQB2mbtNEvk
	 2Rvp2uos91Blw==
Date: Tue, 5 May 2026 09:47:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
Message-ID: <20260505-magenta-dog-of-cleaning-640cfd@quoll>
References: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 773E54C845A
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105863-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 04:12:36PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Temperature Sensor (TSENS) on Qualcomm Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part
>  - Link to v2: https://lore.kernel.org/all/20260427012511.231475-1-shengchao.guo@oss.qualcomm.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


