Return-Path: <linux-arm-msm+bounces-105300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLxIJlwN82nDwwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7F49F08C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 334063004DC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B9A391851;
	Thu, 30 Apr 2026 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6TMjtlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54627389101;
	Thu, 30 Apr 2026 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536344; cv=none; b=MvJoZlzEO/6bNiOg8/BLcg8FDrGLM7tOkLi4emna1qRnX/Jus0soPMnscHb1MRq03BRm3aQEegbG6pSReN4vpC19h6WwErQpgL9NSfDWZBMNcKtRvz1OplOLWi86NCLNSJMQEdRsu6IlZd+4R0HdhpeP/e0eYH6E/9PcubY4iCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536344; c=relaxed/simple;
	bh=VJuSx4esE8gknIpPkOQ7X3JRobSVRzlNLjJJ7aoxY2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIL5vijUrA5SkTAmuCtBcJ5XNWQYrwWnLy2F2xx8dkAI09peP4YbF6enc5xCQqFf95rxAYkno1TMMTwZAjqF+MqPmqy6xNGKdzP8cpRcDwrEfOHhV4peC++3cuPZEFGYobbo6h0X40fvtUe1E2xp6CiFmlh6fZMqy6Kf4kfeaGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6TMjtlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56018C2BCB4;
	Thu, 30 Apr 2026 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536343;
	bh=VJuSx4esE8gknIpPkOQ7X3JRobSVRzlNLjJJ7aoxY2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6TMjtlTHpRqFGiZjPV7Q9RO/G7WZo0jL89VS+NW/CcuzOo7OJipv249/C3bO0MhE
	 FhJaFdCGXTERMy5CcFcu2jD7gmKO60PmEmHTfjqfEYatCSKLgvUuIE3A5JxxkEdepV
	 HtA1Op7pqwI8Jv3ik6zve4a7OruWFzS9Ili3fgv/DiQXPZB1pFhkY8yP/SmgZKoKik
	 HzMEekvfYnBp4NNVK2MaA2tgHWTlSzX3ldlwpScBaFVg7rf5I5TehJZaG2VqTpkoJY
	 kmc5OZvYI9LdRuULS8RAnC5/nb5+mMqVP/2CusXkRkHvXu1MLBKLgH1Z6T13CgCKw4
	 FnxaD37YOPcwg==
Date: Thu, 30 Apr 2026 10:05:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveen Talari <quic_ptalari@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: qcom: geni-se-qup: Add compatible for
 SA8797P SoC
Message-ID: <20260430-manipulative-meerkat-of-unity-3e9f1e@quoll>
References: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 35D7F49F08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105300-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 08:59:01AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document GENI Serial Engine QUP Wrapper Controller on Nord SA8797P SoC
> which is compatible with SA8255P one.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


