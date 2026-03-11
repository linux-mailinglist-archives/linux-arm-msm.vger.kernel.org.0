Return-Path: <linux-arm-msm+bounces-96961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLjAEihXsWmGtwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:51:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B97702631C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC5CF3011C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75883DDDC2;
	Wed, 11 Mar 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xytk/hOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF33DD526
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229861; cv=none; b=ujy/CNM/nXRxpg8m5iJdl+zFMv/w5xmSqG2oY4XYt8RFrp2srqssk41qFGDLZc8VMaWAvs40dfKSM4CjAyRwgD1RbVlmeQhT6VDlRfDVJ2d/PTjGMqECPihAzcylsPzAc2Qdmvpt10EkdIYAb5yK3ZZ9WocfQ5ggavdGepAxWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229861; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S28wA98c8sFazZFV5966HrC4vrl7MZ+joCOz1k2USt0z0iwzNoQOwZaH8GrPJisrJ4HWe7FZoUEEXaJe5QuZvDacqy7/jGXZ4OS+JDc5oxuWQ/5psBZxPLA3WQMWrvuBOcuvPs7XrK6k7YApyJR2lU/qko3y9t5dzp5NXdmpFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xytk/hOv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b9b1900bso7585221f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Xytk/hOvDF00hrRb0Yq/EusNd26162BrDBGz2sWnSbsSk/+p5rD5lLSiv2b7PY5urb
         OPxEL64A57Qp3tqmHx6KHpff3lWanqPqOt6l6tPBkP5HHBIgcF2r5XtAqpBxUd/dzQ9s
         j8O0AxVKizDNhSup3trigc0CmMRyu6gMGCNJG485cvPol3UbXCAo0qF7FNjwdwlXG9Jd
         FOJ0RNuKWnPNUOKDCH/SjsV9ui4Ashli+wXyhZGNS13kvud1uCiF6oc+va0QIjDnBv80
         2ufQgvlo4GMbOcKvzWmgaoot/MIUuD4DKlHSPgK0nLM5dT0nAerncHzQYGITENEwUbqH
         /CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=GgANwWEQv872Zl3tqssodaG7K0bz79fAJ/wYHi5MuWrXS3rJB7ic0zuDnWGzUa1vqT
         Hqdt0sOaC652PpJOd1YspqAeW9LX55TT1DCXl4KnitLRU9ENzVwKF17y7vGLH7Os6YuN
         hPo2FNe5vAaawGx/pb04IG1KA1gkT7ywfh5zm5TbuN3pO2U4UO6UlZJ/ip6+bi9SePl8
         D9bSgtDtXpw3J2pKSWQbFnDID8TaGULODbvv4eevyqZxqEPPaKOZJ38c+ratzVcp3eay
         jFbcGayR5CENT0GHyDDuxvA4FggjfUP4Vnrn9je62k61nw2lGnDQWD4ddyct5BJamsqc
         B/cw==
X-Forwarded-Encrypted: i=1; AJvYcCUChjqAEFJTQAU7fTauPYkqJulzt7qzYGskIyRpbCwQDDNyhDv31pKd1bOGGJLbowAtgflvI+D2MSRy+skF@vger.kernel.org
X-Gm-Message-State: AOJu0YyTsod9EBKabksun8nNKjFe19Uj8HhFjpfQgJ1d3DsX66qwhhNj
	l6j1/pBC/zc9KS8eZr0s5b6wRT5LD2u/KivUD4wh14OITSFiUwV58aWgTXk8lm63b4U=
X-Gm-Gg: ATEYQzzRNEWQwbxFLYTb6o17LF+fCnRFHfGfxp2h2pxUWqVf7JJeUhvooGIv5eBi2+C
	CmpCKwzZuUx1a9jX+mAKdaOQ+RWB+lcb9pk2u3OEtUMBAV44T9l8mHjm+izgLbaS9mP55wU1eZz
	vAi+2S9OiIDqyaJ/nxBNNSy/ExPE+G/jOL4Z0yDzstNZ+5Nv29YF0hWsQ9zj89R1IYVswpj7DU9
	7fJbegiUpBljGq4MuTOKravL7JxpXqpgmlulhaOKtGWgeOyVqMjp3tM+hBtfJd+mjeaFlTC/VtL
	39XXMEegwh2/7LIhEGqGZApP68lhPXcj6oNvbwd1IrknxhbChA6M1JGNLwAS2xMLxun6N5bsF2d
	5g1tqdQfKEgbH8bnh+6RYAP7WM1uGvIPjFHXvptEcfr5YRwfoKmjOKR3IIkx4IL9Hu/D6U15/+J
	OfgkHhLKpjsTWA9XVynHwnoWcoPP/z7O4=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B97702631C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-96961-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tudor.ambarus@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta

