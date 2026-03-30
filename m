Return-Path: <linux-arm-msm+bounces-100897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAfwLCTVymk1AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:55:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50215360AA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B915301AD37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4456D39DBDF;
	Mon, 30 Mar 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQXF94Vb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE93876B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900036; cv=none; b=sy2TEDDY50b9Z/lbG+BfPMrFbymRrO5mTlJPXrMVcgDSpDpHv6ExZN2M5f9sHpuCn3JuvEJtvIB23pQJ/XckxaqJNVf72vL5bbLsq2iM4tzQGrWSPJCiI26ArmMaTMMMWtaziSC+EDUAGVa2OExkhkLU/71M/dSDRSy1rbp28NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900036; c=relaxed/simple;
	bh=b4dfFFhVxCppetsQCIQi6F2IzJkz0MkcswpGkyB4KGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRzLg1Bi/ymVvY1fzhwAnJnLNj8PGWgj6ATqvulx00dyZTyenR/DSlx9XTLQ4cMnlgInIR3/Uo7c9AgEXSgofBplC3MigQ5Gd9rBITTKoN3Bc9VDRhMdhMfqedy/mwwag6rHsFqUijZBbigvZkVBUTSWqI1kGs6joNRb3pgMT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQXF94Vb; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899a5db525cso40433196d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900034; x=1775504834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=FQXF94VbsNoDPkqgVGjKra3yATMHt9c95gNuCvzl0tdzGSclmUpUvyKjlp+1LimHyw
         ANqeu9lBUBZCHE4B/M9NbV0gH7nqLwmQi/YYU4wcaQ5Qtq0rtUPg/+8/h2sLv4wLLEBm
         iID/KO+C/TO4ux0dIuhn2kcCRN0F0iVorqYN0FXIA2jiUeLq+bzIrNke04jeVWNX08G6
         Z3a2pJPc9Gz81lJLMGD2WhTKbfcwmcqcf1orRBE4tvU3oAwo27I8F78yhB9hbmhEsUvV
         KCaf4zaELl71yjFgA3N2SyJ8WfCl1kdYZmvgAV+MPnEnNyYfwkh9gH9oVRP+r1QRdP/H
         37gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900034; x=1775504834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=DBovTo3zxvRYGDxDjLLE78cYOjAamc5bxa55MorjywXmfCfR+XMWirazwhtSlLv+ek
         6cnKhk3NK7BrWX+6332XT4cA7xO3E45c2yTndwtZjjDYMdydARbiCpup6jKQjnvS7O/Q
         Q5Sg4txk7hC/cGSG2wTnZLUUL7Pizn8rbE9xzK9Qk9INw7x0baAVkOkXIwV0DDlVZmiR
         HzOwJZO4nzROI0+JqzT5g793zy2K7U0OgqdlWcp0x0KfNOQVLLxuaM1SYG1q3hl+7T0j
         VdeCJQkANcAbilweVUst24PKDuluoTRA+hq5Q4xycyU1YlWKW0Rd8rFivEn3hVS5qgee
         fG1A==
X-Forwarded-Encrypted: i=1; AJvYcCXjcD+jPuRA8YDLFhr/4WeFGXw4j+TiwGRfur3XWrS1C6XSnV2UpUabDoULjddbRrhmjQENIGtfQJFU5AEp@vger.kernel.org
X-Gm-Message-State: AOJu0YyepLOrZPeIlRr5f58jK+BXKUBDP27OsVjHjqzZnY9wPhjzJEs+
	d5KbR+q81sqqZwV9Xpn9TJoSmNSXH6iUiIt62KsAiSmNf/XbhdxWNlil
X-Gm-Gg: ATEYQzxTcYZNk6TOsk8gAF1dIpbVvwO+Vcbhmr8WYdsjzTbhNoUtJrjVp4grkpq/z6P
	4N6H/0zoTnA/WsA9ll08bktm/pxkS1L3qNx+YC6Ek1PbZwsEtC9f/J4WAWva/uKvXf7RGLm6+7a
	4La1O2xjSpLG2e7TLr7j1FIqlaY8QBI7Qmd/Ogz+Smvc8zIYSTcop1R3tUffeDx+faCNdJQt+fT
	hiVDlZFw6lYZpK/FxnYd3xBbqRYDn7ywO2BiGn0WKuXpd8yto4cCIlWCOAZRV1acbhi76RFNr10
	6xhvBw4GetQynjM4ndGzYN2sKtkMU96IN6yR4mAB91ZT+DeD6Jgy1Sq6k81wDZlstBPzz0QcET3
	vzkQpEnH8X4i4b/hBc2y8kGhzaZYazcErd50qXqGkirCYwdDMYIguF7ucNBf/7jQZGJoCU8jkl+
	oPvOKZXQMjTlQ9dAQATQ4lUgE=
X-Received: by 2002:a05:6214:478a:b0:89c:4b50:510f with SMTP id 6a1803df08f44-89ce8d421a4mr192997706d6.8.1774900033776;
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364e2sm72112396d6.45.2026.03.30.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:47:57 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <acrTbcihqVJlNR5-@rdacayan>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
 <acqvm25ap4LTSB8j@rdacayan>
 <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100897-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.964];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 50215360AA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 06:22:50PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 01:15:07PM -0400, Richard Acayan wrote:
> 
> > It looks like the codec part is mostly complete except for some trivial
> 
> There were missing signoffs so I'd be surprised if anyone had reviewed
> this, I certainly didn't.  Looking at the thread I for this version
> there's a bunch of high level negative review comments that you have so
> far as I can tell ignored.

Sorry if I wasn't clear. The codec patches in Adam's MSM8953 series
(linked in the message replied to, not my own series) seem in a late
review stage and I can take those other patches into this series.

> > changes (empty line after compatibles in dt-bindings, constant to use
> > BIT(n) macro). I can take the codec patches if it's okay with the other
> > submitters:
> 
> Given that it looks like the series consists entirely of ASoC changes
> I'd be *really* surprised to see it going via another tree.

This is not at all what I am suggesting. I want to add patches from
Adam's series to this series if he and the other author are okay with
it.

