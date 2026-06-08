Return-Path: <linux-arm-msm+bounces-111939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JrWLOyj9JmoapQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:34:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9246594A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=bJNtrGri;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83287301C6E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C2B328255;
	Mon,  8 Jun 2026 17:33:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448D531F990
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:33:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940026; cv=pass; b=nQHKsxyNzgp20F3rn5eqOZK/HIf4l6P30w3AjdxLmZT3LnrvPrZYa3oPrK7Y6QJPIHbyj+DQdg4p5577mQCwBrTReY39Tc9y9qg4Id0t/IsZQ0O8lxeHKgMl/6hZBk435tNrnql9SW/zf4i+fsMGmCQZxJas2ixccVKrqavSQj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940026; c=relaxed/simple;
	bh=FxmIEvYMFiKht1WQY00uEYuxrUvnYaCMiFzMz9XnZpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xj1wxv9LOx/sUSR5dDxn1zhY6x9jaDaHB+9R8UhNW2A8UwKc5g6sE4Ze5liX57tQP5zR5R7PW5SWzSy2HSggoxFq54krxjL5xOK31IYTgr9KP8XVhLAUwJwfsQGfHlfeuHx2FqVff8uZb7SVjgqC1fs8dBLG0AdhFFcv2qbs7bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJNtrGri; arc=pass smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4602e2a0372so3253391f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780940024; cv=none;
        d=google.com; s=arc-20240605;
        b=BRirf6Tzo5PRaK/7041hDf+lP4GUT0LliRgXSnZn03/pyRg5hyTb4KfudTjM5AngGr
         DYsg+Z5dJtIkoivYGfpWgkFjaP5q8boOP/d7x8PycOJTwxMb5Sd7DJsicjWHgFuQZ1HO
         qXOQjmj1RtSblJZ7YIIR1Ocp4F5dVrclEfdsrO/rou8QSCey7gKsMVCEo73ZMwK/S996
         ALDEEMOYhxa4O3xHXShWsaPXJ5JQMURy70pz0KeY85geCo/R7+6X6Q4Fyxc0eQWS2gf4
         R5Eye3mzzwSr+SRra6QIqikNJmY3SOCc/VsRXgaTxWM9frhktDJ2wA8cWaq0UFkQdVag
         KRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FxmIEvYMFiKht1WQY00uEYuxrUvnYaCMiFzMz9XnZpI=;
        fh=21PHACSPOjYZYjp/xKrRDv9VVQqv+Ko3k1uFwbYyOJo=;
        b=W/6Czzwl+AwAWtE85lbJ6irTd/zLyFGgWt7X30d6fIlsExYwEeePWF+eUh1rqjHc9e
         xI7x7utmcdQoGmSI0FwuTncZSXylihDTwO2riGJJWTfZQmh7Ls5EX9JnJP+TxZe8GttP
         i/7ijLLLkHa3KB1q+3tyOaiaNJXMizu3obQV45leb3Lp2YWEeGGNyq7wSANqSo3Cd1EX
         HNCffl+FAjB8m01i0I/nUD7bJVk4MG127j3aSRmwC+a2Z7GlrCPgMdo471GzGq54+WBx
         iTB20N2EDdPvXVdXNaPxYtZ3KdCGpc/HkunBD5uvRIRAj5wZX3TcIZWQSpVHjJ3W04Ox
         NZyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780940024; x=1781544824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FxmIEvYMFiKht1WQY00uEYuxrUvnYaCMiFzMz9XnZpI=;
        b=bJNtrGri4UPKGK83uJThs6H99DTEBAghTzew6/yeulD34I307+Fwg7s3rxtaQHyd/N
         ZJwOe0aAxPjLDmR5HlThvsFJ7Cew0jZzTgiDVqYo/JfbCSHE15lfzVKk8nQzhJDnzSO7
         A5hNODMaF0jlzG5NWdjcVQMiy7LYO6c49vbc3IVkGd5CW/1FXxgwpADaekjrbGn0m958
         awz3l+cGLs/FKE72R0PHmhaSY3LGAjRzysPHgHNrM8rZ/r3MKrxVSAmIAZevRcrkAxZS
         T3aaEerUycbOfBc1ApjFq2mbx4CFcKo7BBgNwDPxOHeiljySOfnpXbKemp35hY+yaFiR
         /r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780940024; x=1781544824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxmIEvYMFiKht1WQY00uEYuxrUvnYaCMiFzMz9XnZpI=;
        b=glVXYsW5MtnLJtQjpA2dzs4DRkbxfMiAI3PCo2clfH+boUJoMHvdCEigEdoAZVgGZi
         YW655q0gI0Eav8cyr/PTLwZ4QvGeSzXtruU5aHyKdTS7TPEMqjVXrrAlP7PAv2P3jmbH
         MOLuT001GRpdGWYTg71BZb4+jPHBgW6xK49wA6Sdtwc2V4xneu9t2Nn/U5g7UJMDie9E
         tG7rTmHDs959vtdiR77JgpaOtPVdwyfDpq3jv2vlXYcPV5nOfpC68Hi6+bATKxaqZhfb
         jdAymScfOqf9rLpEx40x9HymnAXt/Lc8e/iM2aiNTPkpKmkeZNpxT4wDMHiN4rTj1SPm
         XSUw==
X-Forwarded-Encrypted: i=1; AFNElJ+zW/aUyepCky/UNzC/PfuKLXQMnm8/svZxhxKQ/jRGKHlThxhIpM0U/H8Vq8xcxNoJ2vag0wXb3xQ4odtj@vger.kernel.org
X-Gm-Message-State: AOJu0YxPN/mStrM3L5CYdIOaPgLGeSA7Fv7xbfcKyrqwjkUaK8RucYO/
	cV/WLD3Oz9z5UvBfPzT++8vwlaq5nhDmrVwkdtIYpgJLEA7OipyiVcGhjXoPQABPEdPEwa7M22C
	HDHqqQm2pAvkxFddf4C9hs9YkWzpLuvPFqtC0URk+2g==
X-Gm-Gg: Acq92OHF51pTZyTbFP9AKP7Hf9YzyJdY9itrBeJUVMAnQ77S0M4C3HBxeDjIBl2r061
	fDpwHM469pVUPwN/nINA3p93PECAjVX6hw+Gmaa0TyhC6qxNtZ3onES+FgPayYwLIM78SdK3trN
	vMjlMMtKLKpo3PhBYjCgftIVPSeCWiM8O6V2gzZCC6eio1erfqqgFpGS0Z8FMYFsCUXzODwA1r2
	cpa4crHfnOvl4hPDy68y878KSwNOf2s2wPTWEi5PlkfIj0ZrCHgnBH1MPc4Nm1GJC5Nnk883Tfa
	8PbdI1f2wbzLX0cJ
X-Received: by 2002:a05:6000:46d9:b0:45e:df08:b02 with SMTP id
 ffacd0b85a97d-4603065d18dmr16264914f8f.28.1780940023601; Mon, 08 Jun 2026
 10:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
 <1e855b70-cc2e-47f8-a820-877622620016@oss.qualcomm.com>
In-Reply-To: <1e855b70-cc2e-47f8-a820-877622620016@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 8 Jun 2026 18:33:29 +0100
X-Gm-Features: AVVi8Ces1BlsHomoRYetwp-12g5BTdj-x__0BBdgHY3i0bEes8xlKKD_-3BzVCY
Message-ID: <CACr-zFDc8KCDEe1kj_iO12UDX+1QY=E--z777gjbQ8G_b6TNbA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:from_mime,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C9246594A1

Hi Bjorn,

On Fri, 8 May 2026 at 10:56, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/8/26 4:30 AM, Christopher Obbard wrote:
> > Add the blsp2_spi5 SPI controller node together with its default and sleep
> > pinctrl states.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

Gentle check on the status of this one, did it slip through the net?


Cheers!

Chris

