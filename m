Return-Path: <linux-arm-msm+bounces-97088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJKLAGb1sWl7HQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:06:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84726B20D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 154E43013C50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D162F39F16A;
	Wed, 11 Mar 2026 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2xCPE0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E00239EF1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270352; cv=none; b=jBXayY2egTcW8n+Mcdg1tKbDay/tlReQsgMpGjHTuYBA4Z2zj+Ttq7Q/5AK6iHIloniCzf3pA12lMhC9FFemqgldicZsBGTRQERTB18c9VbxUKLL4hH+btRSmCKQmDosexfiNu8MJyggnqFjnJ1p/IQtXRJZAWGuYSiZjQyndoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270352; c=relaxed/simple;
	bh=rfKuOzvHe5vBbX9keVb//BJgX5e9Vh2x9YeAvZCPoVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrIITfwaDnjzyhikrZXwEmGUi3o7IzUBtPHanbmmW6gA+ayZzaqUCDCha4JD5xNKORZuZgLHFAIwNCQSmHAWzxh/IQmnFUHXi4kQr09N22oqRNhi9LXxAYa61q5D0K98WwbMpyKT8/t6ITOH5zzyOQaB9tjYcFvwxUGjjjbwGa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2xCPE0s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso392266a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773270350; x=1773875150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNc95yBeQgjpi9QO4APmDLhPk0cXt4A6W6yy8C9WSLE=;
        b=D2xCPE0s5zyDyTGigNQ1MakKhNaOmsWBNhdiUDFHTgziagAYK6laDimkgs/DL5udfk
         JIiFK+Rys2O91h2E2DRflOHdsKhDT0PagNm7+it5sXbFAMxDLKLiJyY+wOZ8anieq1zg
         Nkbfzjr7qdV4/FSNKZP48EyQzxya3yroet99O3l5TVjo7ZytP1UuStM817+TU4lYJL5f
         +oD5b+K//UdKxzLpBSi3ovbE/4lIqWVrQWKooVqN913lMfQ1/UEzCUdCoifgYHdTUSHL
         dAlp3da+RKne9aN3/SrOS+7R8/rK1Ww8UrmkJmNEDstIyn4ZY03ciBeTEO58M9iq88NE
         DtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270350; x=1773875150;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNc95yBeQgjpi9QO4APmDLhPk0cXt4A6W6yy8C9WSLE=;
        b=bTYu1ju5IAOu5Agitc+zRlZq4acffQ9301XQNXVE8RglvT3iwq2lVeOv6mH6FZqUm4
         VffSpry/fuZOuZSXzE2ccLb7oBXs93Hkz0KE7HyQIotAHgxqHvDt09A8IrlPULzr2tz4
         hp3mS/BvtYOAT24eWzDbMBjoQRr08JLcMyqMCGqcTB2YHt9Oqtxqf6rKhBm8SXBSHwaA
         0cY6196CkF6d1/86/dXMGvlOVzvCNZ0Qbq3h5BOrwc1TlTndLkI2dELIZcVShMJzLHVz
         UZClPUHWIvcN5ChvfoCwq2TOtAcd/MXl1PvAcJO7RHhin7JMLLIjMIJgigVhpvyC7G5y
         Nt9g==
X-Gm-Message-State: AOJu0YwseiqF60n4WV3QvnJnzFMVCLG+4T2bT3hMKrP3PSBzIzSdhWMy
	dcbMf5V5Sa4mMVkirg31rbC8xBKXWsYmJK5J1ZPDWwDH6O7otqZR/tlLaGnxs0sS5hs=
X-Gm-Gg: ATEYQzzERMOj7N4t3Y77yIVl6Z5pfBnvpFsChXwG36mYbUpsjLXAkLBckMVt+3968Ca
	Gk80ych51XkqOfWtbx+EXrPS58TO9QZrI1rjSJw8Xgq0/Hf2CvCX5CQNciefNmOo83J+Xq+19df
	fBVP1v2r0rBgHo+gZXhp44g2sXz1gNfWOORekWI93z81a6TVywisW2cQ8XetB1hfskOl/MZ1sTj
	BkFLblD3PWiRGEgU5d69rQ46qrOQbtAzg96TZcE3yVdZRohCoiZV+WOG0ktTiQhWx8HZqNK0CLP
	F4PDA72ODGO5ZithsTVLEpPkXi0bcnULSSd3ULqWUpGH6p9lDe+8U6EUoskll06jXzA72LWJk/t
	KQWlyPheBTxwiWDDoUevU/CniHCsHP76z5S2pPcOY6N+Mo0TI5oI65eMDLdn8sk4litcsrS4H6L
	TebhcZ48Viod3xs4007G/RyROY8z1afTtkfA==
X-Received: by 2002:a05:6402:f24:b0:662:bd56:3ba3 with SMTP id 4fb4d7f45d1cf-66319ee4b53mr1755231a12.31.1773270349747;
        Wed, 11 Mar 2026 16:05:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634ead9972sm279788a12.0.2026.03.11.16.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:05:49 -0700 (PDT)
Message-ID: <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
Date: Wed, 11 Mar 2026 23:05:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN
 VBUS detection
To: Alexander Koskovich <AKoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97088-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E84726B20D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/03/2026 23:20, Alexander Koskovich wrote:
> +	if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_gpio),
> +				     "failed to get vbus-detect GPIO\n");
> +

I'd prefer if this was bracketed since it is over more than one line.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

