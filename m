Return-Path: <linux-arm-msm+bounces-90123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKzaHNvdcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:20:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D021562F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B39E35060AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C38480DDF;
	Thu, 22 Jan 2026 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2oLUkEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9AD21CC5C;
	Thu, 22 Jan 2026 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069654; cv=none; b=EGm1VhiFyEKdIp3NEbDfP1+BnwPCBoslROqKcct2PVLIouQsIqb5HTRmoLoN3QLhIohD0lk1l1wJpYGmlQnmbGkTz9EklrY6sGE4vmP8X6+AsxgXB9mO7NJxNuMR4gQ1o772A01RWQB8eMq+g6FIHrC7+fWk1ecNy1nEDhJL7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069654; c=relaxed/simple;
	bh=WMoT0mf6Lg2CNc02jIE/68BPu0AshjGraHHEYMvCEk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jD5my9YXKoZ58g2EDb4eDDkojJyQSFaMJeYtztWXX54WzKfYA+u0XzfUvgvb2E614mU0llTkgmKZJ4JiinXJwhUJGrjTVweypq7iMhwTqecC8DQrO6QdysoMpBnvSiN2Z4tmIlQND+VuTSD3nunCGkgsY9H7KX3OztJwkRihkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2oLUkEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A24EC116C6;
	Thu, 22 Jan 2026 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769069654;
	bh=WMoT0mf6Lg2CNc02jIE/68BPu0AshjGraHHEYMvCEk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2oLUkEXULmcMCjAM7ccX3CMcow+rAdlFj99xOjyn+GYeZC3xcVmlp/8dq/cr+9P4
	 BygoREJoqiHHX3Ugv46US6OPGKMht2cbUEl4mu3QaEtB0uqvvFo13KDc00/hS5dgpY
	 uqUnkGuoa/kYzFnZJQaaYTTKslhyHC3key3MNrGV+9ig3Yqt1JsT4cU0b1R1uA5Eh4
	 p7O3PLNsE+DppfiYPwIQnN2XgF/Q2jobKsUi2Mr4nK/QdkvTtwFqtWhHoR+6vJe3XE
	 OpaMtwj5cpn3WXWI1dpv897gfDtZeQyYEjBCqfTCELXucWenXfvg9LpKvfoKhDeCa6
	 7DN4sUHFrUGaA==
Date: Thu, 22 Jan 2026 09:14:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-binding: vendor-prefixes: document the Ayeneo
 brand
Message-ID: <20260122-skinny-garnet-pigeon-0eb5cf@quoll>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-1-bb3f95f1c085@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-1-bb3f95f1c085@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90123-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,ayaneo.com:url]
X-Rspamd-Queue-Id: D021562F4C
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:40:26PM +0100, Neil Armstrong wrote:
> Document the Ayaneo from the Anyun Intelligent Technology
> (Hong Kong) Co., Ltd company.
> Website: https://www.ayaneo.com/product/ayaneobrand.html
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Subject: dt-bindings:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


