Return-Path: <linux-arm-msm+bounces-93506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGMFLndqmGn4IAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:06:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B8168269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67D2D302418B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E355434B697;
	Fri, 20 Feb 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fE7sq6+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714D34B437
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596386; cv=pass; b=BBigHm1Z6vcJSJ/ESO+GLimWt7ITOpR4yn6z1TSqZtVa6JNdQuBJeMIl7ImmitHjixHpPEnVvbDQ7PTSanK+9IFRFCxd9FiR2LOJ/zZj83zPgbsZaA8h/eYmAfUk0Aacjx/KL1CiE120K6YtUJ8mlUW1gQudN73baGgHT5Z2jFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596386; c=relaxed/simple;
	bh=QRaCONRc5hdaV5yD6G1ws4j28HOx/kIzkIfaOLPIQzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqgvDH0nJmBITn85ElDfUjx1nKwk6LyjSxc9UKP/zJm1VMV++HlvadD7Icruea5SasANy0cLYCw7X99I+P6j145F1nntL8If0QZpxMoapOeHdF5gaXtF46xx8TNlFxkBmPLLxgksX8yOk0D50Y+5/cSSBdTWIVhMhoPnzLbv2ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fE7sq6+7; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64937edbc9eso2021610d50.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771596384; cv=none;
        d=google.com; s=arc-20240605;
        b=M0chubRie+bKT5TeHtd+YEdtZ4Zpbd+lqUeUjvHYgH+8ZuCOp9joAWy3itXJwKQkjk
         He8145oCJkK/ENrJ6N67WtOhPtTA602mnEx0Dm6vgJ80fjqery0VoCV/UZyj18fD92IG
         ZDhJ6o4XapqLucMsI8CpgqRZrtlIGOrv0mPfj49+cg2r1SESB431ctL0rsYWHLrGkrEH
         yNVvlKJUZ1CUDp3Ehm7z+KK226rsSsHWmPwyMdOT3kcpe75xRFFIGMgQ3N2dF2+NNqia
         zWLUjyq14eDbFjHravgQTprmHgLkMTfqjziMzwJ6MuDZTpMSewkEj3WiR97Ttt2Cj3k9
         MZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        fh=zO2X01fCHNQs7pDbdaiFn4gRsHgWqPJIZ4iLeovt72k=;
        b=igozl2/3ccBkZl6faJmAIyzm995huwHYFWAXKu0uEP8KQYrnevnyipqNctUFFDToPc
         9zYFdtgq/0jV+Tl8IRl0MNIkM1XfdfrImIjreeNb9OEdvCYNoI5OL4XVB9ifdiioYOIJ
         d3mKJCUt2vgIBuCCl+iUaVaMnF4v8/2o1diCqBJlEXn6NZNnVynE7Rs3tzt1GBRfHrQl
         P4hNusZ+objAyuyYahivsUwyvJWlM9hvNdE2izf7qKCQqFhfxG9t2A2nXMdixUwrXByv
         gXEz0OWjVlP1qdETOtf05UlDwvzTFv8z9vhghD6zYgQi/bOwzeA0+bQn/9E+BW6l2WMR
         w5hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771596384; x=1772201184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        b=fE7sq6+7n/vZGu23M9dvburjHPuonzu6oq1/iW+uZ3eDSvK/5bS9+lV8UDBE3t9va9
         NzKaOgX3sTXlBjenjkQ953ToHpwfpFYa8ARUfHp2YLe4YaufPmKCI23brCOU01Guj1lR
         Y6qOzfBxQmdktAbHYpJ8KajakAJULEpihNELlmIfyuKdEuwlHVpojYTAI8c1ex2uG6DJ
         03SUwfdL+nu88eH/GrLhFnuFlPJwaLgZkwzYSPJUC2r08Lo5KbtLLPFjXDefKYCJcoJi
         /rql8tObUltBabzCb+d3/kiUoHf4eoqWQbk7zhhMX2otvKZ3VZ5xDoH7SXmZQKKnj2rR
         AvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596384; x=1772201184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOgAazGljr+ot4x0/70qWQLnH5bbSRlyxZpCa4QF8mA=;
        b=JWa1I8FCZGCgmH29aUDFl/tuVtxFUlHdVe6XxVSMJr+uit1PXRdXQ+Ip1v7+S5yAiO
         +XE8weFLuhh1kkCpqsy5Jk7MbBp80cRtksAyi1Lexf7kkRN5fh0JYGuC2S7vjT2F0jY4
         xY+/aOwdVfMemIKnFPBp1Ea1sm9XXaDDHjI4WWKRca/i2zIb1NtQgRnJWr33jrSYmThD
         IADMc4u02jeZuipSqUyHOdThxMdkdy+lcFRI7GST2ISWJBbQO0zHvI3pYpJpivJP36Y1
         XEa0PfSFxhLw4YU05urTlsyD7mUcSEotJTPm1Ksa58czdF+EGZH28PcGu9g7nxemodIp
         Wj5A==
X-Forwarded-Encrypted: i=1; AJvYcCWyFNtH67yG0ewUTHaDKJMM5sp4IDPWDYZ4h/BWBTFUR8HxzgcSRzks4YBqG6+492UM5ALkPice1XXt0F5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk3KfNHJaTPs8mVJPtb1uyWCpPr9fohdNo26QALcy+0qtw6WlY
	TpYJxQRRV1X+VAyOmpvPl5u2MjDlV88vCmQZe0D5BTekwwKXjK4xn6I2iX00AFNRKUmfqbbZWz6
	FzFIJgCewYxo4zfj4VtWbtd4ezPdb7A82Xu45W02fzg==
X-Gm-Gg: AZuq6aK3OiJSxH0BzkQxIK54qsv4ZQsGy4q9Jh9QtxfRpNc/2Gb5IYyM56Se3FV2+F/
	bAGFH0MKUbAf29m6iA7apRTIbGuHt4xFs2tIzGRlHaV7tjGoMG4NCWWm82gNfAgVQCOMy8+m6W1
	IvQQEPqfrfvi1wNBJJa/wObpxK7PqK2DmPNzoED3Nea+j+VCGAxFHv6JCh8pgHO1lOROU75G1gu
	c69f1frrbfx1CBEJg9jHRhSaQBnevOGho7JOnRkrYYLGSJ/Hnd/kw030QSNsEILj8CGvmS8fMyF
	HUYSEaXi0R6eZzzw5KrGK+8n09EgqbYqKcXDqepYlrZMUci1+TzGwf5gLvCaRVb5p2l7phJMjxo
	BqGg+/hZuTALmSHJ2Nx3rd9WoHaVmG1isrkJo
X-Received: by 2002:a05:690e:dc6:b0:64a:ea66:bb2a with SMTP id
 956f58d0204a3-64c21a68e0bmr17293799d50.21.1771596384461; Fri, 20 Feb 2026
 06:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com> <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
In-Reply-To: <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Feb 2026 14:06:25 +0000
X-Gm-Features: AZwV_Qgk2erDViJ_8BJxfIIzRd6Ulo2V3D2EYpqI2bpv3wyflTdm2QSyvgXPDbQ
Message-ID: <CANgGJDri==VUhMKhEeDYs5tmkcGcOBHbzMT3U314bxK79z4mTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Luca Weiss <luca.weiss@fairphone.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93506-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexey.klimov@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2E8B8168269
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 at 13:34, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Srinivas,
>
> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
> > Number of input and output ports can be dynamically read from the
> > controller registers, getting this value from Device Tree is redundant
> > and potentially lead to bugs.
> >
> > Remove the code parsing this property along with marking this as
> > deprecated in device tree bindings.
>
> Could you help suggest how to correct kodiak.dtsi?
>
> I'm seeing these warnings on QCM6490:
>
> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch with controller (1)
> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch with controller (6)
> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch with controller (4)

Such messages were present on other platforms too, this is not only
Kodiak. IIRC on sm8550 and maybe on other little SoCs like on qrb2210.
It would be good to have something that will work for all platforms.

Best regards,
Alexey

