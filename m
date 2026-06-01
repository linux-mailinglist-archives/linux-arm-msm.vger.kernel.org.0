Return-Path: <linux-arm-msm+bounces-110681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJsHCwX8HWpSgQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 23:39:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2862596B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 23:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D2EC30247DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 21:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E02372ED6;
	Mon,  1 Jun 2026 21:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxEME5tD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709C36213D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349851; cv=none; b=uMkVPDT6oFTFd4hapTg3j4ZLaxjsTdWzS0bN2xMwwOcb71vJfQ6B0mhqwUPSYwm31JlkRqP4Wn5VbhSq6+zufwM35iNkIa4dyLhSC1QCEjXYPssH7dWB0ytNDNXjZeBD1Kq5FLBWwOUZAlRkqOU0VSO0tLwdtuAcHXr2AwKCgfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349851; c=relaxed/simple;
	bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=cQmnlCU8GUEZDBAwTyH6cMPgS1CHGAMPEAS3NWk9VAkrvXtNVaTi1x7IbJ3W5EkAaQBGuI85NhzEIj0f+m8KP+093F6WO9vEsoMUkBkdL18HVs8HqsGus9NJHnt8PxOKg42veN296rCSWX9U6H2GqrZffWVh6maKOLe4khvX8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxEME5tD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4906238c62eso85676525e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780349849; x=1780954649; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
        b=hxEME5tDeZIPzIc2ynirDiLnaKT2+Wp6oFhl5XM4FDEN5eZRIVQAl4dw5ZCv4j0+Zs
         OwrWVScIVwAJHwDttLpKUwQZ9gkcWRfFLUxfl1JgKPY7ftrS5N7G58+vTFLcGIPJz6xD
         LY5otRYIjBNLC37TtTsUwlFX+r5r2mXeMyfaALAEqCtP5swLOsbVNLf2rZO8uViqKzSp
         H1Q+8aDCtrDrd6Epn7kZDbu5+j8tRW2VVln1Qnj+re7zMoHBOx3ZRtw+Xf9AFbGUE+aX
         YT8jg+b+S9yPvBTOfcp6rys/X4kgXHpdv6YHf0wVXXqAUxmcrcxgXUTMaJ1GcHp83g+I
         4T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780349849; x=1780954649;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
        b=K64I5CQ3wFKZCAy1E7pV2gmG1QRRumnOhzrUyS7ZeFhSrjJZjR7ycRi73xehmNNQHx
         8CxeMpYiGjA/AVuEb2i4w7e4poYUKtamtjfslcvIDfxZVjU5+Wmg2vS+J81bhlcEWDEy
         2g09Sw/q75rylnLPESd/xHb3h4jP3zc83Ki3r40+KC0jcD8BhX4x/p5lCV5aZDl3TK54
         9beRgfbX2FQxT7Dn36SzuJ+gLWiV9Yjl+kaMt4kAd1DWO7tK2jxwKKY8RnuQG83VdRJx
         7DogsdTrPrt2RWJwbxE+4IIzF8qlISubbP0FAwa/eQfiuWpQCQhqJ/gPkuV1bPno1bHM
         iQvg==
X-Forwarded-Encrypted: i=1; AFNElJ+lAp1u8IxaH9aYd9uCyxWaf2WnD9z/xrX5QdJohAi92NnESnVce4KQOCxi0rHSxpvcYLQPy4GxxESjm0jZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgQTOwT9FlrUfLwdRokYxHFd0DUwIuutIqtlQd/KD1Bl1jTSm
	By9ECsaiUV+habYh1dH6L4UOcpJE2PaZZKdnV7RwD5ivmYJX8wzYTjHroBK9RxFBSA3NBLbl0X/
	7xs3meqY=
X-Gm-Gg: Acq92OHlH81q+vlig97DrehKTGXtcO89rxA4fq42r0FunAE5cyI2URr3XfArHrzFzpL
	x86kYMmk465xe45c4lqjU/oIG+KbWrrQos5lBKSkAuVBHiqeWHQpwj3O6975B8S3dHeWH0Z9DHy
	9DJl4OTVq5a91mq5oAF6kmTRe0RmDwl2qdvzGdPlrFc2vVxJmkELfGSkREzZk/QnbHfV6NnSkqw
	xwFWjsqqF46JIxWEb9+gWyu+voVKtuaqV1NdM1QksVKXaqPyxlX4gqx1H/J00b6Zd0TX90YE0A1
	XXb8XuMqU1qGW8EoOK0YBO6mBxQSIMBovEVuUjGYoB4S/IyzfME2/dl0sipZdo9rA0fj3NcqBU/
	xRcx9hx2YL51jE5CdL0LVf3g098xYdhMY0h271HWHfk9BAHGBaNwfBf2wOXcNn3vgaYKHSDOZ8p
	Y2GluvRaLaM8up5gF1X25SkiNUzyuAtsgc2iQE2rxUN0FvIdxrW48HAbwNSx5Ky4XyKyLoocBOu
	RoVgNm3+RhTuZXWfReQ03X/
X-Received: by 2002:a05:600c:a111:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490a29172bcmr173721375e9.11.1780349849034;
        Mon, 01 Jun 2026 14:37:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm118760515e9.9.2026.06.01.14.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 14:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 22:37:27 +0100
Message-Id: <DIY1CKXWI6ST.2Y3F25YGNFM1X@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
Cc: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <krzysztof.kozlowski@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ravi.hothi@oss.qualcomm.com>,
 <mathieu.poirier@linaro.org>, <andersson@kernel.org>, <kees@kernel.org>,
 <verhaegen@google.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: qcom: q6apm: return error code to
 consumers on failures
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110681-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexey.klimov@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 86E2862596B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu May 28, 2026 at 7:58 PM BST, Srinivas Kandagatla wrote:
> Return errors from audioreach_set_media_format() to ensure callers are
> notified when media format setup fails.
>
> This could hide failures while programming media format parameters for
> individual modules and allow graph setup to continue with incomplete
> configuration.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey


