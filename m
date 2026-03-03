Return-Path: <linux-arm-msm+bounces-95045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMm3BiBkpmnxPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 05:31:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 231291E8DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 05:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCDDC3017A99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 04:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ED237DEAB;
	Tue,  3 Mar 2026 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfnTcdVP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30A25DB1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772512275; cv=none; b=TqKMOYu1xW2uk935lwIoG5ZF+6meq2lHPJ33FyFX5xHtHbndoM6y8GD9ESz9nWniTylo3mZNKBldPlQ+y7i3B3hYfP21J9DpF6NWh1l5KfS2DjD5Ua95R23w1YXu72w4JaZR9JhHIiV8fZwmv7ixrGrQvuxa6eKIIQfQ2hmjpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772512275; c=relaxed/simple;
	bh=2Kf3LOTcLq111+z10oLFqpqx9K7MD+UA54ioA3mImpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVEITCGWRF9phBA1JdhmVlQxHhEDbOa2kASbsHJoHO4am9uYOibnI0NNBqroAQSVsqcHthV7UO+5Y+DiWPwvzZLNlbjrIKg02aAgQrh5sL0mSpZY+aXvZ5oeDN166CC/TWF/eG6AyHfUv0IcFI9oFqzFtFnErOB5vgbi6FYEPIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfnTcdVP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8272a56b91cso4464289b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 20:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772512272; x=1773117072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMHu6Y2gYxnqJzkOf4K6uEsNEzJ+7bA4f+5IkVS+SZ0=;
        b=HfnTcdVPPpVe76IRMJWMMRXzZwHTEXJmJ6Wj61JEn4J7C6FOlOf7MkCzIXHnACsAiT
         kZ8gX1yZOpmcwFCo9nGmINf7vZ1w3cOP0+Dr8jBtRzXW90eojTMuebkPC6eQ0fEkY1Zb
         +fnsjXuRe30T8C6s4ZDFPCzifTFPlwNUxyrMqqECDf+u6bW8T2DHpwhdk/3CU7RqIN04
         vb+0zwIgvDkeDU2O6N6Nmbx1pGB933ENyanuKZrdHqel9rTMU4NZtl+4Hbj6zMRUem01
         lLX1q5j3MYI6B2r3QKo3WaRsP7Ji4V4dal4d8caXuS+8XCfjOt4YgSNrGwWbBDctILRE
         kVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772512272; x=1773117072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMHu6Y2gYxnqJzkOf4K6uEsNEzJ+7bA4f+5IkVS+SZ0=;
        b=vD5EraZuH0f/DN/zVLhqMYgNORb6/0q6dMdXDCFtyz/ZbV45FrqHJ9nFi0V3OHdJJk
         aySkN53MeHe7Y54YXcmr3T/4OfOmy3pXU/qAuQ4bbhwcC0MrDCx0mXFw7UeMq49Do6Vc
         fn82WHxIioSz6XrfjMRfOKJKGyawMMXTgZ6zdEIQx137QmOPenh7qJ5C57nsnScSBg2C
         4zHHzST3WqC9wFmrwHEWJZvtqEQQaIVtrzIAZ0siVeiQe42PE27QrGRqR+79rfrfwFYE
         dHvfX8zXFHqKhbLOMS1XB8GoRjdPHl9UF7AMleJX0oceinV98qMsR0Hm5lx29nyQ8YsA
         r7IA==
X-Forwarded-Encrypted: i=1; AJvYcCWyW32rhBfHKKaUvy521Ub76RQ+QtvHRVc4kzubDk+HD4AbClvk5kiKYjvB+EUJwfUlo2o6GFKvhZizTEim@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyHunxjjlrbR0vHBozqpDddBw7uwx+NkQQncYKTYvXINYwqwZ
	st/uYpWFuChRgwagMvL6V158seTSfNuXnW0nHJwGkcFIR9/xXtG0bbrYf/9b2g8uH6UmHXip4wj
	9i5yz
X-Gm-Gg: ATEYQzz7xpt7Ol1GFD/v8uN7Yr1CwBUO2xt3kMjP+hrAJ4S0X7YgWQKSPM44MO+GnXJ
	deOJP/5Lx0a6P2pdzEMP1g2PSBOD9ZBPP0xZfWyBPNZAtiNvU7k+oiq75KeZK1VEZsTLMZrqjtb
	kgGxNG8azt+KYcoamCaKZ+oLGcYIjdh/u6s7xVmS1Mu/ynTOeZ05SmqYKw59cTWWON+rZYXLMdi
	sy39XjrBDnrGd+2uxPRz0M3/X0GFzH4OJ/OW9mNT3GQ/YADppQWmeaAmCMeNQp1NCUtskk5mV8Q
	gNwCYlAS/GDJgLUhlHtm2Jq/wTeTQT6RBqZS0xCmvDxxdK8J8/GndbtV3fNdccWfC4YfEtVsIxM
	B8F1u7xkSF3Q0jbGVbo9t5qWNoNBRFkNJLQeYt/VxDumaK73D8X7Ppl9o4xUykiWufqDBHu2RBa
	DSQyXF90FpVCl4yOByvC0d1Kn9
X-Received: by 2002:a05:6a00:9086:b0:81e:a228:f0cb with SMTP id d2e1a72fcca58-8274d9d9b38mr16557258b3a.36.1772512272261;
        Mon, 02 Mar 2026 20:31:12 -0800 (PST)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d5689csm18593111b3a.13.2026.03.02.20.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:31:11 -0800 (PST)
Date: Tue, 3 Mar 2026 10:01:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] of: Add and use of_machine_get_match() helper
Message-ID: <bmwutmbouey22o4zj2a4zdgahuzwdwwwnd3hagbe7ql2zcjckb@d7ytvwbpimsd>
References: <cover.1772468323.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772468323.git.geert+renesas@glider.be>
X-Rspamd-Queue-Id: 231291E8DB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95045-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 02-03-26, 17:29, Geert Uytterhoeven wrote:
> Geert Uytterhoeven (7):
>   cpufreq: airoha: Convert to of_machine_get_match()
>   cpufreq: qcom-nvmem: Convert to of_machine_get_match()
>   cpufreq: ti-cpufreq: Convert to of_machine_get_match()

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

