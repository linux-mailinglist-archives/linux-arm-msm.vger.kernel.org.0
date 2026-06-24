Return-Path: <linux-arm-msm+bounces-114352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HQWXGPncO2pyeQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 184AB6BEA62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:34:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=N3+JC6UX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114352-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114352-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1AC43020642
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6563B7759;
	Wed, 24 Jun 2026 13:34:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85C3B840E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:34:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308085; cv=none; b=Al6XNOxGAL9dbVPFjE9nk5gP1sQIMM5Ti9VwI5X+qG8CGxciJmiHXsCL28ajNK/9t+pa9TNtKypnmlobJw1gdShMkmD5rweOw8W3cwxnzzWg3VzcxgUGwmgpticFA917xF8jyxN0OO8Eb1OSx9G1+l/SWFo3Id1eWbN/gndMcaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308085; c=relaxed/simple;
	bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qntafeM/k0hJZUIncQeGSCbEpCdCdcYvhYN2H0m4mr84bf7s2fTrFQgQFfVjXppxOSDUJhSdRCf+MfpgU5Jwt6J4+4GyYZ/Tm+l4PZAF/9Rq2hoqQWmZZFbyyCuP3VTDzQ7bX7HFQIXtbUfv6P165hotePHhznPG0AL+jSnT2IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=N3+JC6UX; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46caaa805b2so335713f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782308083; x=1782912883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
        b=N3+JC6UX1Spx1NQPlIDV8EA4OMQ04tZYqyq+0+PAoMY7abg08703O1H7mTSQMG+mrQ
         LOGPCGKztysVErW6+EJWxmpVCCkLbCtdGSStQDMf/38eBRecjcLFfbysExv3flQeb5lI
         0ApKSR8RuoeTVczJENQIWoS5zXaBlpSJSCHrwLPJip+uiy/jmATipBovKsQgPxDFwKgs
         2T1ebIQx8wzwiHpV3I1Qv1laNkKQRI0gXPmkJgVZhuuVFtfZgbmc+gXXm3kGWN6EF62K
         dWMVP85vAC+YWm+I63h7wsLImJUKxXfbJbINeikitRaNWloppo/XSMYkfxNwM+/uZeQQ
         OFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308083; x=1782912883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
        b=bBHWFhvNzqRG6duu1QdCMfZxh9BcAr9SdsWxJA17NzzQ9JYKysjjSwZs/j9/b5WymF
         OKxU8EZu9yFu1m6fqxPYsvEJZZ9b/m/emf/ySOLCEX8i0PPCCA0aVvJPRYJc4MTN6l50
         K2sXP/iWdv1MnidOs4cOMOtLsRKsTyMNACZhCAOBnsGk8GxJf9mPdO29aNOm7SjeQKG0
         vcEzi+KcFvbXrrgUcW1RJSgUzxi//N5/AiO+Vk39//G0pgNvD5R91CDOcfbBl/YYZqRy
         DbNLNAt1vOhs9FwNGvvp30ATVAOcn9UAEYrg+lc5fUnuZGBqNG0ezoGkFPoqGH9qT2zM
         FAGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDu7MnLSW801FWLAmsVtO3l3VXsOE1ZePepADfeIxV5lohdNUQQ7lCBnE5W3J0qVXXhQ+FjgtyZFrv401D@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWrZ/ZL5hsxdc6YI2nANr6FykK2CuqCuHERAY7yuF6e/1MtGz
	YdHPkwaDt8RtPYARb6K2IWlZ1F2Kd02tK0HfirptDSTUl26u/KXrTtcNDFajf67gGOY=
X-Gm-Gg: AfdE7cnTjOQi8FeBsnq12+myeb+2pBfOKphnpYMHvQeM0hSeyhx4QcV6eikDLmIH052
	a6QFxvBfwEZ75nNATLxsbxcPkQoX5HV8HwWvbJEWCD/kpbg9nzPp2XfEXY0jC3luxPTJQmEn6j1
	rk6CRTHqWGoonquUIGIM2+kC69MuhYOHIlqchEzSi7STzglvS/vxddVMuqZEoxrMGSxWnSjfW0v
	EEeW6KVSHRJaH+EB1+fAotAzUjbXz968KxYYHHxzeLxQh8F1ZsqA40iyXxJ1u1KRyAqfUsgAUn2
	gCKSL3t5I/GUkqxNngA+WNtPBbwBPHC38BYnk5Iqe/UP0ewnYAztr/Y5RbD3+SjBqBbxUO00eET
	kWOXuLUmvVU3Z6ZIkelGg+RUUelqSujn9pT5z2o5MU2ejhcPnY5kcxi+ozrFryzaQrfyN+hqkdG
	3eRSxCOIAOpwx4UhnzbLJhlCpQ752I3n6OnvLVgnidwiYodJnT+9pNVizg5tPcVHUtoLFnljZ93
	sz50PWL7kTUt/Wb0Og/yZmK65LvPWN9
X-Received: by 2002:a05:6000:2501:b0:460:67b0:7544 with SMTP id ffacd0b85a97d-46c09ec6eeemr5604498f8f.7.1782308082698;
        Wed, 24 Jun 2026 06:34:42 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:272d:c801:11d6:c1dc:e7ba:7e85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c225b2988sm6548339f8f.25.2026.06.24.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:34:42 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:34:40 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <ajvc8CTYAZe3T29Q@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114352-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 184AB6BEA62

Hi all,

Another gentle ping on this patch series.

Many thanks,
Will

