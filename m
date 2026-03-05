Return-Path: <linux-arm-msm+bounces-95584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEWPLL5WqWkh5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:11:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310420F761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09EBB3019BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F4237C921;
	Thu,  5 Mar 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgXgDFd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA8366075
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705272; cv=none; b=FQeyCfeSAJDE7UWuPHGMMz65+qIZXTRg5Apkq3nWcKU76JQLz7Yfwu0/2y7nd3FXsO2m/8NIwXIFi8RtdwJgIXlFPCnmdORTPTxGFoGz0a0nbCBHZXE/yjknhia0dzo8H45uY6QG1u/cTjh6fzQkocBloqIGIwcLvQhgTMAGPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705272; c=relaxed/simple;
	bh=5E/DrpkixQ4gF4PhrEHz6o0m1Ts94BJPHeqX66PrFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDML1uNYHxDbNg17GBoPQlcg6dBaBuz/7cth38mKlrD5rOlHk/aDLh1dI1EweccUprJhzaMMvKnlq8c7oOTtU2CW6eGjv7vU08kJnPWSWUkEN7biMzceVx3j2T+kGYwUiAHpdTSaiIhrscLdI88wbwdwsyxqA969X8pXDIHgISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgXgDFd4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so4711343f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772705269; x=1773310069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvdX/eNl5nD2MErDTD0kyGmc9AWzS3XjIck/Jl/7K2M=;
        b=VgXgDFd48UrHM9XgormHHx5ryrK90oORBXumwnkqsXbDVJDsPt8lepzXm/Fz5jexn7
         8ICvTZn5NGWn9KmAJtWb4FqAw1lLHl/OENOPEXmjfGRAUi7UOghs8uB7iBuC6iLOKofC
         1/8IvJ4f4wKBai4xvRQUxQX8ytuDKMybanhVHzZAp6M0nN07rj1Zr1TQWMXkIIIaGC+j
         tV9pi9DAlC5Gq/CK/0V2xcAgbOquNgrvY0CXqcIfq7XQveZ6CrPgjR4IWwHlh8a1uvsV
         VALnPJ9hDSNpkItymQbZMDSSHwp/GnGIx32i7ehYM8SkfGI4XY7jGI8WiZyzC+l0pByM
         eBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705269; x=1773310069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvdX/eNl5nD2MErDTD0kyGmc9AWzS3XjIck/Jl/7K2M=;
        b=G3OImk6PGYT6S7vNHy4/8NFHXpbQ8XlOAGV2zMM5GRpRuGO/TJqI5WrR9PYec/GPug
         ROT8E+r6ITdtUhCayYReDCwYMiJTqgFh/6CRji/Wy5kQEyi9+ZLOlVnxFKetq1oY+ve2
         JemBazcnCw8CUCG8HQYGajBUhJEB3sSNgb0AsVCIcgqye/q+c7LkehgQsCaamTRQuvSz
         T18LK8/mJxCSuIjA2dy3ubMe9HxzPtDJjPNuit7g+fC8HXfgH83exAdKOpiCTl6s3Rbj
         DUMLsq/tP+JZ7Sf21t3BeqyeZvyuwx95VzwEYsv/8I+q5UtW5gKDcp2s2nlVjAjBWWVI
         GAqA==
X-Forwarded-Encrypted: i=1; AJvYcCXIhiWPy4CFgsqQf+C/FWNHr3M30iu9KYXm4XHJfH4qi46dxuL5G1x5TESEywh/Y1p8b6xLD1YYMjYB1ZpV@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQhbDdRX6Vb0jF/tb+9VA8POv6F0o/ECYoqHjQqGRshfRlRDy
	lzT2D1epZqbchSP9ni8yc/ITxLiQSxnKUD9kAk8Gx/u8C3r2FR73GT0J1Bcw0Qa2HvE=
X-Gm-Gg: ATEYQzzolM/TjNOoUCuVgW6lJVnJxDw08wy8SsKg/Ys9Zg60h9Yc0HMz5MDjxZm5msq
	lWfMZxhB4gQvPW5nLCGzgGUMaV4Jykab9dxUASKCIHoixVJm7ZZfoNWGLfvhsvqyE5djPQK/4fv
	P8dbCyj1PTfFS1t2KNVR2AejmgNEhC2FEQ1JFt2pGM6om+bEsAo2X8BERpUlLsqnmeqfFoHYo2S
	X5FSNXp0P1QVurpNe56tUvfIHL428Op2Eky4dXJlizROmIhvebU+HqbqjW/5SGInlKGVyKFllTv
	KzmtG97aANU0zL9AcJ3REuEMbe6rXLf096nT8N3BJKe9vjQ+5ndcFhhnBoSjbDK9AgtwYwTNR0b
	4boGUgMhR/ktXXJvqaYh+SKvWGJW47gVedJqqRSwQMiRUYtB9ZA3V3KpWWsnNYd+IvYVW5o0TSL
	XepCTn2Dw36r9yVk698Bh09mcmGdl0VAgmbj6CyCQ=
X-Received: by 2002:a5d:64c8:0:b0:439:bdd7:425f with SMTP id ffacd0b85a97d-439c80088f0mr9728183f8f.35.1772705269355;
        Thu, 05 Mar 2026 02:07:49 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm38580943f8f.5.2026.03.05.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:07:48 -0800 (PST)
Date: Thu, 5 Mar 2026 11:07:33 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <aalV5dBloD1BmwzZ@linaro.org>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-12-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 1310420F761
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-95584-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:58:15PM -0500, Richard Acayan wrote:
> The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
> HPH test registers. Add the quirk so this driver can also support
> SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 

I think you need some more changes in this driver to support CAJON_2_0
properly. Specifically, the initial register settings are different from
what is currently in the driver (wcd_reg_defaults_2_0). There was a
patch for this [1] (later [2]), but it doesn't look like it was
merged/finished up.

[1]: https://lore.kernel.org/linux-arm-msm/20240727182031.35069-3-a39.skl@gmail.com/
[2]: https://lore.kernel.org/linux-arm-msm/20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com/

Thanks,
Stephan

