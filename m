Return-Path: <linux-arm-msm+bounces-109802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG/bAFSLFWrUWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:00:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C85D53EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ECA730060B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEAA3F6C28;
	Tue, 26 May 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHwwspWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E963D88EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796812; cv=none; b=EGfuDSQGuGERIceUHysnymb5Irzjr24QOQ6bJhAgc//n7M5DlumUXmZCACOZEp+jspXOZZbubKATczfmQq0rhu+2IaV7CXv3vYX09WS0WRIYF84f1GExSI+nPKD9LM9cyHJjFo3w8uUIsw6WZQJiUPVvVgpzhwyH+v256V2hNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796812; c=relaxed/simple;
	bh=hTZYyqvqtGqppwXg4HP3xZpz+TZopttkYVxm+x/q8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7Vj3tufJ9/Bq9NVE90s0O095PuHnk26gs9KwG54NyjYTuqXawYboUIFJa0AJKTfn83/aJ0WyFkSvo7n4b2ykfO1cUyE+uc3pYNgqIbCuMwH2RdPdtSIniKVycbWYHguB6NYaAzVG2KjV3PtqJcFd6jxU9bN/0xicWDVcw6rDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHwwspWc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd6460b0d11so1841324366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779796805; x=1780401605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=pHwwspWcu5HViVH9PrTg3VZGKAXTnNGteSs54531z1yqAvoQ9iBT7CEw4t9D0baKUH
         byMt2zeqQnIntjhhwu20JIzFZbDq9LEAweNjSM/QJ+ooJMiyVZM+4a1VFYcCW3lUrfkm
         e+pPq1JQ46/j0lw0YAKPCxdvoLZFK2ixC8DBCGhSSXq5YXwYfElqzUSc/uNEZQpzVYeQ
         wpTxmiHgcLyVfyrHBh4ID7utw8G10oFWuFzl3TYMXdPnb8nSgtmebQ+/E1R9DXQ+hpO8
         JiaYJ2R/MmMxrJlu5caCZgP1L7gh2ei9wZmnkuPZZMArcD2gYwFM+3qbAj6//UKppe7/
         Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796805; x=1780401605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoKLuje7HUGv4pGCvIBQiUOeF+gz3p4jM4FxO+bIdX0=;
        b=eO5nL9kCtaCNB8g6xN28fdRN2mGYssBpG5L/wmvBqoIo/G78mGJZaewbHCeiyBoNLv
         uRHBxbEVxdJMpSFl1cYLJmr7lAaoTlEo+g2yh8OSKdF2ixUggzDSqxAe3eiVxrBRoV06
         zEOaGGa9YLeaG0aiip8nGiwpz1LoCqbe4tfIWyPI2F0xInM32kxLm9wzTDAQ8Ge/5c39
         GVBCNywS3yOk8y8jxN9o4DvNUTCWh/abfg9KN4eYI16imRfJ9XVYevzfhIERQO0biz3o
         yQfWrfjIdIwB0+yxN13y8ZftQ7qTaCJBfSj4cKRDsfrV0TGpgZUPSpVDzfy6zo9EXqi1
         35WA==
X-Forwarded-Encrypted: i=1; AFNElJ8ljeqidaZvEticgjiVhncstu4IDk0YaOCnTm+iR/kEizspEDN3Rm8P8VCLUMqVVCOTPOoKpQ7EEILRpxxd@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdXiYMeokYyC1/EAcaF06niwI1N8J2CTK31+Vc1xzpJzIBsY5
	veEw1oXW2Dr+bsg/d3egmlzv+Y3whKBTwDP8jhuOj1+SO7mp8JWlEBXvCbn4WlrkiIA=
X-Gm-Gg: Acq92OFistNn+6HaPOWRwlZNZ9MJusj92xv+3qT6n8uRAxG+ahupsb529mK0Aqd7uOZ
	itlsw91nxXCYJAG//lTnRNdt2zPwStnNIhMLgFgMit4slljrP6PCcIBW0PjtiQBlzjZTe2UUpc/
	W7u7Gg3bjPftzJqM9u55fU5ZvC8yOVBJs/swvGv7LN4vyi5I7huX58tYJhyvEGemZtHvmCFwGxy
	0HMedd0OiK+B+WuUnDCd0vh4ReY9wDT4N4KbHhXLJDUx6g6ruaQzXq+ZlvJX8ZiJNVL3cY3pea6
	jLgF9x7zjfuCg9PTdgB/I+Jo9k0sY67Bu2xKTea6u6A3DflEfqfqVb5PQ4/1A2rZRkb/WBcIWgS
	9lP6w52BdAe5iD93aznHfzYHRLcLyws18pZjE85dmBeoHJIF1fRg56/Ark53cMxlzBGLqRkZv8M
	edz/U+euibBuTm38lyOj26lto0FFED
X-Received: by 2002:a17:907:a80c:b0:bd5:ec9:e063 with SMTP id a640c23a62f3a-bdd267cae6cmr1071905766b.49.1779796804514;
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc61de4c4sm497740166b.42.2026.05.26.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:00:04 -0700 (PDT)
Date: Tue, 26 May 2026 13:59:59 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
Message-ID: <ahWLPy8vg_neYgrX@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 096C85D53EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:
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
> and also on kaanapali.
> 

Tested how?

I recommend testing with the tlmm-test module Bjorn added, in all
supported configurations, to make sure you don't introduce regressions
for one of them. It would be also good to provide the test results here
in the cover letter.

Thanks,
Stephan

