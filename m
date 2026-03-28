Return-Path: <linux-arm-msm+bounces-100526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGtZO6M5x2n/UQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:14:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2E34D096
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD5DD303FDD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779F356A3C;
	Sat, 28 Mar 2026 02:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHUJAxHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D991A683C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664019; cv=none; b=oRw34iNMkEsdW9eLtUmLITZVsZ/9McD2spPzzl5iIELElpEHg8a/IiXqZMIDsm77YsPJB7WoJfRHbfvE6OBAhkrUaWwTbFTW3V4XTP40htdiTMbArzNTNr7IfTNto9NaxFChLZLsCd5cIeNuYRKCriPEMUD4EV86PzNHVbCbQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664019; c=relaxed/simple;
	bh=ATKWFQRUP23topNj63SfFnspXkMmp8YWIXAjBnFqKNM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QENyC0Wb1HtVXg373/Ccrg0XenEWUgq8mi/ADg1fyHA1j1RExIBEnQFr85LYBdkiqWi4uWgpS2PDHNevugE8HqeEc8uqsJX2UZrZKz4sMjIfNggeNA59MnfoQkvrDxVZDKAE6fkU3l/9MtXvn8OWKeSrmo+wDeL7oK0jHs8vxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHUJAxHL; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfc085395fso292222785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774664017; x=1775268817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SqqMgKQDeGv0TpX+c488DpvFeTC5TGIxUu1Utv0hBs=;
        b=jHUJAxHL6/w0zxS/i0sdTZ30Dxt3FV03CH8/TmZlNa2SB5UNZ+N19Py5j2O/3wRwqw
         +EuEfU7LB0FsdFf9CA4S4rrhAKtcrYFtp8EYdztw5kN+avsNBLKn2VOn61U9pjp82ZaV
         GGmjwAa1PUNqi7/tQmzsDMDFDOSoQppneGZ1AQEcoArDg4JM+mzvut/ZAVv2pt87sVkq
         K7WAqSE/BReGP5MooJxBwJW/KiRdQti7GiEb+/AwJNWs24do0kDIdIwIM5VIyAlusvEh
         NUq/t0bCVg7QNXExxxRH0qm09OdznNM24kp9Ry/jKhVK2inwximQ+ozjWV7o352Ih7F9
         Shmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774664017; x=1775268817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0SqqMgKQDeGv0TpX+c488DpvFeTC5TGIxUu1Utv0hBs=;
        b=nnvzkYTVtPLf3MeO50tCiq97eoRDI2Q6FHgx/Tvxxbmbw2NriaHVrNxRLv5ySycGU4
         rcL/hPpW4JgBx943LuOzYrkSTuiCLI9A1HD8+tIegGUBDlWzYccMec4AmUFHsO537+8Q
         PiG/vFF+S0ljDu3+FZlqskN9/3gY3rp/yjHTxK/zB2idYNWIS/KbdoZUZ88jY9goCXJp
         HMNcaQV5iKQuuYup9u+6cp0vLhVuT4PX07e3SYjrxQFVppZcTeLmhkrOAc6oe0q8lCxj
         o8ptc29wwI68irTHXGk28erhxbvwrTwHzzBd/ReSS7raKPzqMJtcNvJE+5PdBEtkyN6M
         gfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUnmqtFl114NPgxwAzLfiXmkH02/H3QMT4kxwgZu4MhYfJn4t3KaJz9Ef5PaB11m2ZwY5lEr0Xjh6VbzyKn@vger.kernel.org
X-Gm-Message-State: AOJu0YzjGeC14spa9/x1wwZPCdm7V/my6aykjIpJvvY/NRpbxI+wlF7H
	Oahh5wxylfYXOtIJTPVeknCcAc5qszvQSiMTmnOYnUYh8B4W1ZWNQL9Z
X-Gm-Gg: ATEYQzxkSVMC/jDxDdHaIfEGYFAMfpKZ8ftiYEDAIJ0ma/+azezwM2vJ9LnWIttnbFy
	ZrZ/zThLUN1T1SRa/mDVReInrjtkS144wdUHc11rg3XcJqlQfHf2cZwEkp1rRL10EP/kjVTuN79
	XwWoatl7WtBp347V42Z9fBCnOvCCPyQBB3O0AeU8IraoCLidEzUFzZWUxq9OEAqjgJAwHo8ZqJb
	fRK7a8uo024MEmnPDqcFwE+nzN2O4T1mYM0sewUkr/wrJjyyYL2mEDPdMEKhj/vcjusIWBQnU0A
	OJZtk1/WemyuOeHX/xDu84EIIsKHS9Jux7X5/luQK4HSwpUFmb722zlzXfkMJl0vQ3cTJX++PSL
	F2F8dPWqzrCKf0dl7CwD31C0rfxSavOiLTHwzFCIv+EAztXOencHOfZwTcBT6KI8hmT7EWtPr7v
	4oVgsnzg8G0GsNk0MNyNp2K+VaIw==
X-Received: by 2002:a05:620a:199f:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8d01c7fbc7emr603637585a.36.1774664016838;
        Fri, 27 Mar 2026 19:13:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f2fc0dsm66130585a.21.2026.03.27.19.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:13:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:14:12 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
Message-ID: <acc5dKPef3v4cvbC@rdacayan>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100526-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54C2E34D096
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:10:31PM -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> Dependencies:
> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
> - add minItems and maxItems (1/5)
> - add review tags (2-5/5)

Uh, it seems I dropped them (pun intended).

