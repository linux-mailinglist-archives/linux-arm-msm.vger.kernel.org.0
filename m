Return-Path: <linux-arm-msm+bounces-101033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJsmILKmy2nJJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:49:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FC3684FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32A5B3049268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758452F39CE;
	Tue, 31 Mar 2026 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yu7gkyni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC763A7840
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953836; cv=none; b=fUnZjTqdueoXle8liLplib98vXMhqAjh4TqBib5AZghpD9bHHU1y/u5VVJodZqDi1ND1IcpiaxjArNSotEe3jD10hDJmH1IbhXFPxjn2V/Q6rhDVC9SU8AEiwq94/doT2oM8oIzRYAnb3BypHd/k9/OYMdg4VnHnBAAo+mYsaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953836; c=relaxed/simple;
	bh=JBv2meAaeKW1RSExJUkHk3aR1uS/gG/5/TNgpdUFCVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D6SOoNTfzkzFSu9qJLZ4gz9/8IHl1zsZ685TB+RCwVp5M56LPdvb5n8QkafIoeq7Z8j3hDiY8ZIQJHLRQ5bYaWvft1IKncL2D+55455LTSwJ0evTZytx143kF9v0O2rhF1vpWWOe2Ss+Wmm1nqhLiqh5Hy5b0lDxKf0D8P0U0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yu7gkyni; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so831703e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953833; x=1775558633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=Yu7gkynitjxFtcaLcpUh9dJq3Z2M8i0u8TW1Ckc8PJMKXFWpckT3vDtF3jdEqljARq
         PBKJh7vGRdl7HUqD36HCeYps+sLykOB0mM9aJ7QcPHtnxHhXp1Pry633YuWmAMFDcv3+
         WFFvBRvYmP5YnVESreTWExOAlBtGkk9QRQ2nZoD4EZJdnO0tjSffIk9C+nm+0CyieEpp
         Iai9TP09AUBib5dNKRkrIkdIMdkRaTs5IvK9XM171Zm3jEvak4YAQ4qYjKcXtGXEkckj
         hcT1qKDzuQHRoKbv8jUrG8/SGGjTwhvqLV7EQxG6SxnA3MKevavMTlyE4qbv/GgrGPBp
         5o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953833; x=1775558633;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=n4uUN1vFcYm2hmElREcXHWwOZdjXCFOA2iV18NXu2BDuhzDPl+bZwt0dXoPFmpcSxZ
         6GXgRAqtHaL74dWNvhKHTS30zRwSuXQp4t69O8P/JQDEjVN4A3FvIKRoiUF+eN+9ODye
         ZSgefOOgqaKrmMvtvhnjholYXE2N4nkHxNookDLluS0r1YvT6ISuanYz+YccYMdb66IO
         GKPiFYKfclfWi9Zdi2dpdMfSM/nAbDsgm2tIFxpocMG4GJVk67d0v7HbkQ0jCmQTWBY0
         lNckxijyavgHKfV/AgFTCaoTbjmHVp0NLfW/yrOIxwDqQATTo0JLlQ7OsMgRkP8uzuLV
         paKg==
X-Forwarded-Encrypted: i=1; AJvYcCXuBIiQDaWeWFpkc0W+dA7FSRG1Qng7sCUPTLVn4fH4+bdsT5ePpGAL61HPk6pw81GpyVldOS/ZEk/cv46J@vger.kernel.org
X-Gm-Message-State: AOJu0YyuuNsQlAWCy/x2dh4KtwivgWm750W5Ps9vrvTikN9ma1gwHy+2
	FyEFXO916f4MbV5G2rgyIEeHxkj7bVZ3WeX5snFDQ0sQQRzZX/19Paznej6+2gbYTRwt8rbbdGJ
	9d6Dh
X-Gm-Gg: ATEYQzwRcbqhKSsZe2d8KCdjl1u31zwcvePeGvjFLyXsaMiVFI5c/tB0piemYg/52Vn
	889ICgr3XUQhcAe7WytetTSSeLd3F2fYj3/luoZcUZkV5+mjshORsbK70R1zGJRYIf9K+cU8c06
	elQ+LWWuflVWqO71rgzWn6qQfvmsMMw7IL7jBiXGXJbQTIAx+zZMlJ6+JO2mH52zHxtppc3fC/V
	YgEtSNkbs3GC5aLooJzrDDQ83Y+LcNXCoU3aASKTjFe3LpAL9D0cEo3KbPslefXeCG3CBmHLB8z
	dWdwxymh4IVs7md8MV2T4aPf5xpbMHmjfy84wDxijJwXwIvY/t/j9OIoLcvymKmzfk02jEqbyjR
	BAxLz1G0HWq+COVj8HpUOEsEJb7drOG6FaYtk8rUkEjTcHhiL+/z51WhRtlajXRs2FtOHyV1zXY
	HZq8T3VLPSK2nHnGvFAn9pGQIqKZzsXwfuzvIKRgQZc70WyXpDCfPI3LvM+BfJZHQTizXDMHMnZ
	Z8hGw==
X-Received: by 2002:a05:6512:4022:b0:5a2:82b9:afb7 with SMTP id 2adb3069b0e04-5a2ab5fa11fmr2488669e87.2.1774953833180;
        Tue, 31 Mar 2026 03:43:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2350070e87.19.2026.03.31.03.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:43:52 -0700 (PDT)
Message-ID: <040edb24-3689-404e-b16b-c3ead54aba19@linaro.org>
Date: Tue, 31 Mar 2026 13:43:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101033-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A97FC3684FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

