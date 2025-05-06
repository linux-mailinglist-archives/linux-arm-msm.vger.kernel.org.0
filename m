Return-Path: <linux-arm-msm+bounces-56967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0BAAC94A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12863A3DFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D6A283C82;
	Tue,  6 May 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R6nUB/wh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B222A4F0;
	Tue,  6 May 2025 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544869; cv=none; b=G6OtK+uqP77dlctP+lGfqP2ABvkP6NbsHAJ48j76hxaJRCHeR7C5haFCsex/XcF8kgDP/o5VJrDolsdGwzkjH61Bbl3AqzfUC/hwmpqnB1a33r719zX9nksoIInXqUI1aq4MElwlLU3Px/SoQkO1+Ljqg4dYhRcfykVW+3jnfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544869; c=relaxed/simple;
	bh=1DTz8T5UIu9EPcS8lNKV3x0KbsHKn4+cHBb0f1wyYeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfzo2OSzl0PReavJ/ICSGcXux94+CYltuxPdZhabdPsbvM/YwM63sZVLd9ogF6mlx26qM9GR5ugOvcNNn9HtljqUcWBcA2lXraWsumz/8akFeomkvbJN//jZ7NQlwSq3eXHMUeTmJMNgOw2LlZNnE1pVA6Vw7ahWjOIhV5/KoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R6nUB/wh; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZsMY54vhTz9sTc;
	Tue,  6 May 2025 17:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746544857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1DTz8T5UIu9EPcS8lNKV3x0KbsHKn4+cHBb0f1wyYeQ=;
	b=R6nUB/whNS24XZYZhcVcd8NR6lb/0tqTEri+OhHJ+mPmduMNm7svAUWzYhhTnUmSiWd8AU
	6ttnECewqjpQN/UdcWs+f3HLRuGiG0/l8ACg9nW9mqA0LGRE9OOajMAdXxpF8z3E27Tkvh
	cQJ74NywyVsM7cpWCfGlhGhGax2klGEy63k1DPLoS+DuzpcCQTYE2MB/zlqxQh81q7Npbk
	FIQrQ4S8D6wi9yeUejjGNoTBAiQrCqAcjSNYiODe17gENjji1YoBv+1SQ1tA9UvoKkCQD/
	OruhgwqSRi0bem7Y7x0BpnT6JWI/pQuuxKULMSKEuYI82KnRNB6ORxqHDMCiAg==
Date: Tue, 6 May 2025 17:20:54 +0200
From: Anthony Ruhier <aruhier@mailbox.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Message-ID: <g3qdbrmyfxixbgzgtd5rt2ivtib6l4ehll2ktl7vmt4s56ovoo@s2iluxdubpwm>
References: <20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz>
X-MBO-RS-ID: e0905d65f5713d25021
X-MBO-RS-META: qffk767huo9gerbsmawqfc1u9xbukhtj

Thanks a lot, I'm using it for a while from the full DTS on your github link. I
replaced it with this patch, it works great.

Tested-by: Anthony Ruhier <aruhier@mailbox.org>

--
Anthony Ruhier

