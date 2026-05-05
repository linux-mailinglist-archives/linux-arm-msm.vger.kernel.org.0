Return-Path: <linux-arm-msm+bounces-105855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA+tFE6a+Wm2+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:20:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF74C7CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83DDD3003EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75DF2DCC1C;
	Tue,  5 May 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb8OnJI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1722083;
	Tue,  5 May 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965602; cv=none; b=JkVMtwCEN4lJECu48F5g6dJNMcsYyhh3GjZTEnBykuNo0kU/cDz++DIYBtcun68lDB4z+mA2Rs1+QhNw0S3y1i9cRAuhj5Z4DKrkS7Wmnp5r/fpKHEKWTARjpzaOilqbQSdTtN8PgA6nmPByhkUwPkBXYWcCY2+8qBSITa5MgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965602; c=relaxed/simple;
	bh=w8dvtXopBTqK//nEbSvBrY922q5pu3Ww8ExMvkFAU24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwtSQt39aK7qbDqcvnTdO0DqCShTeBUployC/J5sIJeKE1xDMfU2RxAlOxCuh15PCvo9c1q0ps/gPPrY4xij3EPLGVOgUmS2D2Q4N8pu6DsBBaM6v6XJ++Plo3YxptunanVAwqAaY8bM9RKCJHtkGrLDINMNnFa9rqUA2xe1fvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cb8OnJI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F7C2BCB4;
	Tue,  5 May 2026 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965602;
	bh=w8dvtXopBTqK//nEbSvBrY922q5pu3Ww8ExMvkFAU24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb8OnJI/mFRbK07CqO3vFV3Yuz/kbK7rMcLZRVQb926p7HdGzk5PjmknBEZb8TNRm
	 qsTFnzeAmNRYbzl5Y03WVEFH7Mb1/mZGjK57QieuseEjgjxv7l5+ileAexQdipdY6B
	 0oGR1ljQi9rbK/uOpslbFejmog2Cob0/b5QMrQfdpXy9gtTWtaB4JUnh2VeaABDH2Y
	 xhLzseLiSbu5wbxHxJuDxyq2X1GNucVJrqDaV7lUDg/tEQL0HPWt67W+k2H9gRfXOk
	 kYftkufta3fKRpNAoC3x4/cHz2vzimYZp1E+8+JdHgBQpkA6dsob+sJPGIvlMdr5Rl
	 SX2qlk+UeW4sA==
Date: Tue, 5 May 2026 09:19:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Document PDC for
 Qualcomm Nord SoC
Message-ID: <20260505-snobbish-coua-from-avalon-b9ec8e@quoll>
References: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: C8AF74C7CBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105855-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, May 04, 2026 at 04:07:03PM +0800, Shawn Guo wrote:
> Document Power Domain Controller on Qualcomm Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


