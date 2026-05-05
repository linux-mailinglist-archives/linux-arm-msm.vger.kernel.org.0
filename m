Return-Path: <linux-arm-msm+bounces-105857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIakKBGf+WmQ+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 202724C8212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 493A73038D08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528B73E0225;
	Tue,  5 May 2026 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIKKnBWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D29B3DE432;
	Tue,  5 May 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966361; cv=none; b=gTju2qo/wECgLl4QqUQvXBe8iYe9axu3T1zRZZkUo2Jk8pP0MwmTkPwFR8OU1CTHvWnkGy7OFJ6yNoCqNbPC0ulh1g6ib16H4xj6Ekp46QV33TNNXY5qd9/8v+j21trnwxQ6hY69g55dgSE5L2uVHnwZ53pvfI+7m5FnByR6LBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966361; c=relaxed/simple;
	bh=BUa0EpqYWBifW3t7SsncrNUQFMrXEStr8ypDg3PMXHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvdsULuSqjiYaypQp/3aOW3uNaxwhKF9AcZX8ZPNuoZPq7F3cFiA60iis1VVdHTK1nIKr/sLaCnD93psyQMO9MfFMVFO0I+GXiOXY8kIU/cI31UZNg3Xn3z9Wvk3DnTqk1aX++AZcI/NH979ItdU92WqolMb4Ty9ZSOJ54HrsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIKKnBWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36381C2BCB4;
	Tue,  5 May 2026 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777966360;
	bh=BUa0EpqYWBifW3t7SsncrNUQFMrXEStr8ypDg3PMXHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIKKnBWGIatfh/ALKMPXv+/v5yS85mj7waSX58+382HHpDasGAwea3cjNU6EHLS6j
	 YEapEUYpPNJ+gcRmi9UrFGPz1P7vXnL20S9/RpQ/n0Oh7p4UEzMFUzncANE1qvTb5g
	 WK8/2X0rfzZW40JRQpqf8US1gQdhoyt0/xYwLf+Zg/mYqVof3R8m4bmkBdIBiwZahx
	 XBFsdQcN+mCT2FkOO303m/KZ/z0swN5E2YbF7LQTOLbVOyCdExtpZuYT0Ct3fldWSX
	 /karTvLbbioR3p5TUNLUkACxwQ4rPKloOhs0e+hMy8nRKe31NwuRHRPuu7xeWoiqlp
	 OionQAcmupPGQ==
Date: Tue, 5 May 2026 09:32:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: qcom-wdt: Add compatible for
 Nord watchdog
Message-ID: <20260505-rebel-honeybee-of-karma-06e43e@quoll>
References: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 202724C8212
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
	TAGGED_FROM(0.00)[bounces-105857-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]

On Mon, May 04, 2026 at 04:16:43PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


