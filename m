Return-Path: <linux-arm-msm+bounces-118566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X7WwN/+VU2oycAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 368AA744C92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=ldYDzpyB;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 338F4301DBBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DC63A9D90;
	Sun, 12 Jul 2026 13:26:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC4399D0C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:26:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862779; cv=pass; b=QLBZJSf7z7ctsYpEiZ+HOpW6C++ikvhChPax+erVqb1BMSg6K34hO0H7avAKs+Pb+us7GiUDLuTEwCsax4rVaWt8lhpSg91BcfpBLqnerXk34JWmUfBiw+nqQeKPptlKsP2hepdoVfrly8URlcEJPKpbGIPg3uPeIcvk6InKQ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862779; c=relaxed/simple;
	bh=UGBqnk9ZujtuXQRWO/BbSzUobhHpE2AFBXipHVxZCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwfVmlYQcn6DN78+gyNQsLWP9rAxLwRsho/SN745u++9QCu/HgNXW/GELF9ar0paGpVU8qfZDUM24V8yTvPatdVlUUuy9uNgTcdr7dupvFirXg3vMxqYRRaVOjiN7oFqAbbP8Q/mkiYkLha21BuDJYDoc96eI62SQDMK/4C2Llc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ldYDzpyB; arc=pass smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so19064425ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862777; cv=none;
        d=google.com; s=arc-20260327;
        b=sMFJPglVNpO5zK8PrqkmOT9fc0AafDEaAkPOBuZqJdrSFr3+gFU26BU5xxI7LD4vZU
         dnHyZsehqQ9Wan2uNiR9+8hzq3kb4pWyWM66oBd/8bIfutkX1jKymzjL1SeEjNnaRln3
         BMkjuBBukJlghrQuWHaKMSC5iThvBqAe96eff7gGRVtd4QoFVnrW3f/8r3KhzHWFjqO0
         n3m4sr3Bav/kFQDXjmJsNFjDQMxjNZTYrfu9Wmf2/M3hRS+tTfSKz4lP/FXdHYqDKhCR
         lWayQFeUDdlyOip0fAvfs8M0YHD0GR/MVIedvx4eyM1zvzifY8R9DaJSD+D/YbgxXfUk
         ElKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        fh=TJezv0abh31Ofhcsh9fqEX7gxftD5HueJywIt+AL0xk=;
        b=epAeSX8B9ZpG+cJbgdkV/caRAV/un7QjnMXdDEXpw5a+zeJSnUzAokTuCdkKRvQ+rD
         zt4NTlizt55cnKtf5M15lmbvC2V91qfpfaQOKEM17CwwzAZaUcWQRhB6FP5VR6H5s6xC
         ymxBe9RCdlHIT4rmkHv2xuWDA80YplHdrx8zfGREhPR4HM9rSEZ+2QDEkN0KSXPS7+S7
         ZQO1EW+Z4Dk/x8CNXyX4zAtIJFYhsFmXCD767EhCqxPGo+B4iQSKe5+6fM30z7m376Uu
         cdiSr0++i+VQJsi59a1m4TRmr6sFkqznE+QkcNrPmXgtOeAThC3luW16WnVuyjPIBiHJ
         eqKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783862777; x=1784467577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=ldYDzpyBagaYSrXVfDwRS9Bws7LXfvBmSf4bKdluuV+jef9fUY+VxYB/41AbqZWeCo
         N3/OO4CCrq/sTEyHeiI+nP2x19Yjat7z0kIRWNSHe350pBRpP7gdS6sXzySowM1OfzTo
         OIPTOTxV4SJ95adQnUIUZ40PT7HixJ5u2Mf/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862777; x=1784467577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=gkqgImIEY0U3j9I03o7cOkOpMXzBznKDP7JdUJBm3lpaUeWmRAwKrAClxCjnMcnbyt
         8VWacu4HZvjRhjtYJo8PVnRBJrYwk7HIqOYWpTsjK6sXu3luLDHGMRrRljn1nLgM5ijZ
         wIHeK9ShMwc+HahLNeYHAdyTfVxiVrC09gSF3GAotwVWn7vhR73e1wxh1wauin3sHure
         Gp/IsGHAQNo/9xbXBhjHDF9/eJbA7moB8qN9gLRofDSQXDyMz6wnJAbFtcZJ/pWc/xo5
         0xrsA6KyYhAaY4C+W1LgYrniuY/kg+TKOkwgAkOzD68UDsSL1qN85CGTz6DvUYh6ImA8
         cu0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqLbzUZJoxSglREUztwprY1y5mL6M6+RL3Uevcq8hAzqIek5lZSKKEHIwwk0a0PDa6nst7P6NEocsw1Oi4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxfD3BLyrUQbBmN1IHtvzE7NZgZfEulPRTz6r+hWQ1NiHdv29lq
	zryW3NaVQjpy1jRCyflehkLxTSgif2G1OaLM3yJc9g7ZqYdOxiVDrM39BH6sWe0NLPOt0aZSA2C
	HRB/RXch8yCKuLov66Yz8ugJsCTFMPkS866dIa1bplw==
X-Gm-Gg: AfdE7ckaNjCp6t4tLzvmuLtHNno7a+247+jhwjJC0mQ0rfIYxly27FRNZOgeXYjJEc2
	8zGAcvADFFei9Dv2QjMiagbVppWI0P91fppkQhJD0we/sANnbpYYmDsz8xuE19xrdKN5dMrDzpF
	bSq5j9xpyV0+jDFqwVZdcRXAZhWjlihp7Y1gIaYirp0Xv2LPxlq6PJjxZEgU+rRtxxeZ7p/IGDv
	9qdXWAMsnGook5iiVA+QyTz9bzkzGStew8p+nK7h5KZcNyWhccLW+W7cirn/S2gdvE6hUMb+UyF
	eBFRufJQ53OsfIqiymW0UVljZqio0mqwN7g2Ranf6Q1vnluLSWMunUn5dd6y3T/Ixq8ltuCIGLd
	b7DMDVIcvwFMdeqCDvrolGo4whmgINl4jttuIdqbuX1aH8VZnL2iUrTRz1z2ir3G6WKIrcqb75R
	nNg7+OlgIGgKDzPRYbrdom8V6AwAt2Lm6XzhjvvTGDqfkQLtIqOovEwQJg5G9q8T9WGmydIyE=
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2ce9ee1142emr64188895ad.29.1783862777565; Sun, 12 Jul 2026
 06:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 21:26:05 +0800
X-Gm-Features: AVVi8CcSrRWGUCKgP-qOLOT7aAQyJKXDMD-z2g8-SgHYdx-u7MOSLDSuRtVid9w
Message-ID: <CAMVG2supxy4H5L7xV52HzA6JLsAyTLa8PixmK7p9HOyZRPpyig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118566-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 368AA744C92

On Tue, 7 Jul 2026 at 17:21, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
>
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
>
> +------------------------------------------------------------------------+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
> |----------------------------------------------------------- ------------|
> | Version         |        v2.7      |       v3.0        |       v3.2    |
> |------------------------------------------------------------------------|
> | Pass through    |        Yes       |       Yes         |       Yes     |
> |------------------------------------------------------------------------|
> | Secondary       |        No        |       Yes         |       Yes     |
> +------------------------------------------------------------------------+
>
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
> inversion when needed for falling edge to rising edge or level low to level
> high, as the GIC do not support falling edge/level low interrupts.
>
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
>
> All the SoCs defaulted to pass through mode with the exception of some x1e.
>
> x1e PDC may be set to secondary controller mode for builds on CRD boards
> whereas it may be set to pass through mode for IoT-EVK boards. The mode
> configuration is done in firmware and initially shipped windows firmware
> did not have SCM interface to read or modify the PDC configuration.
> Later only write access is opened up for non secure world.
>
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
>
> As the deepest idle state as the PDC can now wake up SoC from GPIOs and
> revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
> parent for now").
>
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali. Test conducted with tlmm-test module after
> applying [3] as test module needed to be fixed first.

Great work Maulik!

This patch series has been verified on a Lenovo Slim 7x (BIOS NHCN62WW
12/02/2025) with X1E80100 successfully on 7.2-rc2.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,
  Dan
-- 
Daniel J Blueman

