Return-Path: <linux-arm-msm+bounces-111219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4bNBHUOSIWqbJAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 16:57:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7302D641261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 16:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=IaViTx2P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0493630AC564
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 14:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27C4480955;
	Thu,  4 Jun 2026 14:42:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88157480961
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 14:42:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584163; cv=none; b=Me6QmK0sd12d/dBkf22RqP6oeECbHThiynPApuIm+Jq9nbewKHVzSC4cRNS9JXIDgw+fmOPRhlLRiSTfl25BNJI0nJYKW2psUtFDP9ZgutI2WiTPhCtNEPwa8enOWJVAphdkN+9lQlxYsVQa5ijNd4Ld+6niT+TvzQjoX70xojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584163; c=relaxed/simple;
	bh=vhH90Bm+Y5GOubvalLv78JVsHd8rKxCyWDTSa6rsBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4jnGQ7RuTx44NijrFcBSp3JgD9FynjyXBODEN0VjTUBWa0e5QolVvOec8GlgceBHVFTeSdNqKbjque5xMukghu8BGPUWEzp7J4//hrO7BZLp7I0JB+cPAxntg3q0yqyg7Jcw0jat13RMGCGnrRLb4WHXmLTItd7IM/nVJ98abY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=IaViTx2P; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1485968a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 07:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1780584161; x=1781188961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhH90Bm+Y5GOubvalLv78JVsHd8rKxCyWDTSa6rsBA8=;
        b=IaViTx2PqjtTj51chp9MWnZ+wdIKHxJ2+KApRN9DpHrRO6TmPyna9wcaeco7aoaARa
         N7lettrEoh4c8o61E7TFxP0//sfLKj7Zpt4AON0HdrmKEUqdAYs244hoeRnzYQZpejPB
         ucdt9eSdreTci2g0GvOLS5lFv0JCYh0U377H6l2VEepjHOko2pNDePldYQl6dtTZsJRt
         tP8k2szFiO+muPRjkb5Ff0uNfWMVIbrTVnvtAhfpVEH9keDDZ+h6I463pK7DisCrrGZY
         6O0fJ7XeB4albQ95PUC2nJC9i2CfLFRCkfO6qh29wzHYqNSLmOPyO2zXqhvwIQc3FjGX
         xUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584161; x=1781188961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhH90Bm+Y5GOubvalLv78JVsHd8rKxCyWDTSa6rsBA8=;
        b=PUqENH2EzXqcJo4n+dSEuk1kE2IZrqPjQVst8XdPnwzgDP6N23WzMXOV8vV/AHi0sN
         znqfNxRSOBgd3JjeznvhItXEMVyTOE1WzAIji6Jxtoke3hp2FBRW5cVMiULoca+L+jeh
         0QRff5b1w1Yzrrbzm9aDb6AEduu5pvLEeqw6iFm5ulr3NkdZzZbiXjOR9Zb77ysHf3ex
         0v2+d72z28r1d2AhiSSKDeKsbq4ZwuoODjEnAJDOzZGc5M/WPIxtegOeqLDwmv8D/mDU
         aXEjuz3PXKsjomWyE/VdwPMDtBIZfFVifRlXsUBJItUZxumjDhl77XG5nmcnSzQrpjLw
         WHkg==
X-Gm-Message-State: AOJu0Yz6eZscjkcpb4Nuk2EPlTwBdBIDTEXdu58LpHI8zJl+fA6+SEg8
	K8KvczAsexXLfoctJLLahHtS5i7sAUVWNqFileP98GOosnrVRD62T7L/uXPhnqhIf20=
X-Gm-Gg: Acq92OG3Mp+tR8aDl0piHAeJdQwh96Ogyh94lPD7acKrI8oNBIHICXG+E7pCHDeeALP
	iOHKcU01vAbf946lJmve36VrWFGYFtA7ABgHICi9qvb2YwlCCAmWFB7cdowT0MfsvRNFDNPIgNh
	BDMUS0wHc45zlXli29wiazgtI/Iv1Fv2Q1hx1ohPBYKYZO2aPlyk2xiR/nqw9+lDvSkzXWJQUKo
	WvR248mMLaKAEycuwHQq6OTdUgYfwO6fUJh4I6zJkB4GZF5R9OgF5DojIbcMjLEt5oOWc047Vnv
	2DbVRouryXMxeh9C6gKj7l42XlbaOIDcK44+BOThJfU2kT6RBmgngqq21J8UyvjLc+IPPBfN7uJ
	9XU0EO/xaumc8NrnBxrgvTpxVWo6Y2j/cAPY2pcJWkXKrbvv25Bpd2PHcCju9QubpxtqT3m5SFi
	oNwSWKgwkYIS5D9sgFogTCIST+z9MwB0rDl2H18XQhjn8CQwovkvusjnWhJiLGEDrxlMCFwX4Za
	Dudi5ijTzs/zmOnTb12yzktZNzRPaEJ53LWXyhagLGAvCPC+uo4Ejm8m94=
X-Received: by 2002:a05:6402:4310:b0:68b:b599:870f with SMTP id 4fb4d7f45d1cf-68e7283b37bmr4564387a12.24.1780584161114;
        Thu, 04 Jun 2026 07:42:41 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm2642563a12.27.2026.06.04.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:42:40 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:42:38 +0100
From: William Bright <william.bright@imd-tec.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aiGO3rNYlJ3oE2_d@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111219-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,imd-tec.com:from_mime,imd-tec.com:dkim,will-Legion-Slim-5-16APH8:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7302D641261

Hi all,

Gentle ping on this patch.

Thanks,
Will

