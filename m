Return-Path: <linux-arm-msm+bounces-105619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKW2DnK/92k9lwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:34:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B464B7881
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B560030097E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AC23A7F54;
	Sun,  3 May 2026 21:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agjZ3B+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD153A7F4A
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844078; cv=none; b=NeuCpg9+2neNeq3OxDTgst7kvbdf9puJFAAQEx6TH5MHhX34j3oLFmCvvW6PdllLZ2C0yJIWlkq3uIgANtElBSEgOyeMStRDrSI380/OQlIetW5ieFIZ2LIJ/0Dnv8SDHx4zXu5cBW4zmmMUCNya5ufOMjqdPq5FPSfH8ANt2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844078; c=relaxed/simple;
	bh=V2CKovgPBbL3YrqfdVzTYZbUk38RE704n2LsR5Qlxgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKUU1WdkV6JH7H7+OxWof/fXMTKVDDwRnQ/0bEb7zSkd0PlZUCrdeVA3pVZgCHntPi/bMRj40OJ6OsljZIimYxq/cl/jWVSdht8s7+XCdWi7XlbvUzMzVcOcRjvbVmG14ybeWg/JdN2GGPQFPDxK6MYWTBQQ6Rj5QS5CViRBUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agjZ3B+9; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d736211595so234875785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777844075; x=1778448875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=agjZ3B+98QP7bVmUJazHJsSeCx/GUFrk3oUZPsXbTiIn3sYwu+zvkgxId0VaWd2ISe
         IoDa7SN4FNLz09aZBfBdO8M/iojUjAXQAtKyGvHUjVbM3cVTaUxZKMULuJZ6j+mf2HF6
         NOaZGJNMwND6Cyz71XBJCpp7EjV6eoLm5fbf8WXAZaA9IZ0I+iVrWBrKKCE9+BGRN3yD
         jBnEl1wm6VVFxuq+Z7DBLjX8BaN+3kqhd2/8if7FuHpIEftbu00dnYpYW/caNLgNQVem
         97kpt5SkgU3KhW9Pkss58W0L0cRJshpq7sXRv7CuNE1uwYe9HGQKaxNDDfQkt3fY2lcN
         OZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777844075; x=1778448875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=RsuNP2lghI4xdHYZjq71Hccyq3Q7bCXvuNeGOMmxG8BE3Vr8ShlJCUUYXA/I5+Z/4K
         23XpS2cOPP3yPuEBDU57XfxDihbeRZKN3CHM6x92s9YW6GVE8sM0mg5lVYY9J1q+tvpU
         6OtfIj1DwHcsGEmSvTYs0uRoxn1xxVQ8X6jWyXNPu9QvQBzDq4KW9TjVcaTk88iLtmAN
         kYWrwjJdm6HC8rFYRKAa0DnEZ2nRy+LTIzRp9FRbvOnfAcZN01vytTixVlx8KfZt4Iex
         8wXTtCR4NXLT/AUWSJgdMqwwwe/UqzrLjmXtz3ofoiljkfQI5G3hKGuSV+oAInCW0PVv
         fo5g==
X-Forwarded-Encrypted: i=1; AFNElJ/i4xDen8DWhMllGF7H/Vk7fRra8nQipO3ugSmQJ6p+3JsjtAHmz5RS1FZEhsG0ufe/chnCh4V16PrZA3Qo@vger.kernel.org
X-Gm-Message-State: AOJu0YxGC9gnJzpyj0+jztwZwY++1Rf5yu5Wa+Tpljc7BCZc63D3bMPo
	E6IjRRMc5DO+88Rv0ZBqWW+HdXE5jnSMNZsxQuAV7yzs+NQ7FIjWGjLY
X-Gm-Gg: AeBDietqthbYyPttK9AIqlghai/s6MoD2k2EE6RVcrmGGPVJkVlR5IgPjmCQgCDNGag
	oUFTRAvsilSujxYvvC3GxpPwEI/tC7qu0UJXAdzizpXv51a+LW39VMU51zEteuU12Z9TYp4QKbz
	S5z934uMBrXEJ+CkFQ3iwMeou/gYYiREuOkahlxqbJJCJ9biGhOlGBu0tus20YdBtGXTXS/iid9
	uHqwnBIVa4UDPmhKb0e4miFI0If/8mLbggWLh8PGg60TORbaqNTwPe8+u5s13T02mdTuirwVGSH
	TQd/6MVQt7pcqgbQ9Z2Mt7mNLUPdBsaHx9LpI2c1X3G7riAko2+6FKuQxI/4JIX3ETP2zUSzvtm
	stZW7kYIb8E4IRgIs8qr8w37M7EfrUhp/dyaeBDRj16IsQ7j1vxNdLNcZZdswvlyrZ4n3ERKO6M
	EvkXIR9vhfjYe9ErE3lRQxRJ85FAGf5AzxDRTy
X-Received: by 2002:a05:620a:c51:b0:8ee:dc47:3b71 with SMTP id af79cd13be357-8fd18137f32mr1102849485a.31.1777844075258;
        Sun, 03 May 2026 14:34:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c2540ecsm831799685a.26.2026.05.03.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:34:33 -0700 (PDT)
Date: Sun, 3 May 2026 17:35:16 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
Message-ID: <afe_lNt_zS0j8ZYr@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-9-mailingradian@gmail.com>
 <afaItZPyanmoWraa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afaItZPyanmoWraa@sirena.co.uk>
X-Rspamd-Queue-Id: 94B464B7881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105619-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, May 03, 2026 at 08:28:53AM +0900, Mark Brown wrote:
> On Fri, May 01, 2026 at 11:31:21AM -0400, Richard Acayan wrote:
> > Add the internal MI2S ports found on the SDM660 internal sound card.
> 
> > +	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
> > +		0, SND_SOC_NOPM, 0, 0),
> 
> Why are we using the string "NULL" rather than a NULL pointer here?

The new additions will be fixed, but it originated in commit
32d2c61ba059 ("ASoC: qdsp6: q6afe-dai: add support to Display port RX
dais").

