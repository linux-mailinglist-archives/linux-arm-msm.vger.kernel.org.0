Return-Path: <linux-arm-msm+bounces-80994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03458C46558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749A21886CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5723090EA;
	Mon, 10 Nov 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="H2bctr2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0D30AAC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774906; cv=none; b=QB3fo6EimTJ3kSfh4qmlrTZCcvODO20WE+X65+ipsCAITAKmZqNcqGPyGbjfFzjdqHyQHiP7xV58AplwUzqqNJc7IR36gy/0MITwYhWj1Q0RPxf929E7nsi8Uy5mT7exD4TLiC9qENp0ygHhdEWO/rg896lleaJLcRHoXdiKt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774906; c=relaxed/simple;
	bh=4evboygHfllG7Usog2TgDkAQtAorhUspDMGXw73Mraw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=lrPTsLYkZue/cB1i0r8M6LEULiE7GdgZYxhF/nQW+YwTSrYs91ljbDZMtu0g7yZMonuQW0z0TWLBeDMDoK75gqeOLEVy0p+ZcLjS/S2ABCnliU1iubmVcU/QU9mY/WmPjk78TY7busCoipN7vSZkqDB++KtizfCzlK/sk/CnW68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=H2bctr2a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso10483685e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762774902; x=1763379702; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSv319ON8s5k79NCoOUYSS4YvjAcOb/v3+cIU8nITNc=;
        b=H2bctr2abnNApyGwXZaxpnLxO8sitS/pjkiy877h2FDVALYcZJe6VFpFT5JevQm2yh
         up7MPJB1IgL0r9938JlykAZQPx0ef4f8KRQ6tHnG+sgR46U49QE4fDZyUw56ynUS+JOn
         kyoSEpd+48UDMWJpOnSNYeTfYfAZ2umZkAREfcCo/eAqRMkhD6A6vEH4MifHgW/anaJV
         kLfrLyD+ADOe2oJy4D1WciBjfvQOgWoR7LRBICyDIMzf7kcBQiBgTXyZo70J6sB9v7gj
         jqj98/yT2ifei5AAraWLqHEBcTJpJX0PTCamRH7Gb7SMIrvlfIWcXA2Al7ZX2aGm4jYC
         WHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774902; x=1763379702;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSv319ON8s5k79NCoOUYSS4YvjAcOb/v3+cIU8nITNc=;
        b=kl4O68ZNzE5Ho5WdpyOTLwLmsv5KuSjN+zQiAiEaKtO2wu1A+vx12psADQ+Ke94wqn
         icObDJYF4UAD29nx3AVpRqSXs5DO3w7EM7c6ToGPglIFGZT2Fx0Yid8iWTE2eFvGn3tx
         iUGYMPOh48KTLSTj8U3t9m+R3b1WExCPiWY0ElQYjbPMu6kIw1woysIOoV7ym1VAFMQv
         EpvlrGgh6Ne//ljnOmJZcmhV/W4dWdHuw79Iww3waTJKpi9UU1CcrmZGChx2OIKj7Plj
         eWxdzqPACbwqz+i4prLxxIS/p0iwTzP8Hdaz1KW43YyA/+mbFsc0YH/pp0Dkjn9SCXdV
         vHxg==
X-Forwarded-Encrypted: i=1; AJvYcCXBsigbRQ8il8QgqllE34tfUfK5wY3QyDBxw8VmUExvvCS/4zWW+9Ge60uJ4uoxzd6dLyAsb6vuRbqr1eVA@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+Ztkf4k0ae06/fq7OJC70tw7rFCeZ54iV3Ms8rsCqhIGWfRu
	nfoXCohtbPbR+aR6fJ3lJqKHL2CqAZc95q2RL86BcuHOH0rzNSJhR5sueT6xr7IE05I=
X-Gm-Gg: ASbGncve49D7k2C2b3fTBKS4ORXwAFe9xxtwgL97zGCApqgVMliOZm3hoO9UolwWix3
	x0AHTMf9xGkvEwqJRlA+dtVZz3+hZNIoMMjKES69sntnpiY+sgYQrbT+5GX6lMLNTaaquNCk/l8
	xNo9zlzljZZ0xgSOnSbLZFKKWgx/pj6SQ29Qcg/akf2wqk6KXRMVDXUroIE3cu5uFO4xkSo8MjE
	Nh673i262S66sZjfq1lkghI1tf1WQYMpptfZZyeJu8cja7J7rnABBHHknzhsLV1CiPRAO3CNV7o
	2ZjzsaewZh9M7mIngK0gzh9EWC1dY8uhY/ukAewfhc2adf+I3YeJm4ZYrTR+qYagCZ+bY5snaN6
	KruvrtmD3FJJCMUAT2uk9LIv6DT5JbzL0wo2aKRW/xsCEKUyh364jB2PKzxyiujUMgyvuGSVydM
	Ub+NlNEmMI+9O4TmjWyhI5T5dxR0asFN77LxSGBtC1nQjyGZFK7dhwGtHP4Q==
X-Google-Smtp-Source: AGHT+IHgURZ+2ALbsYAeFytpaGuY3bxXAOFksVTI2Vrqto3KQB0fcrxUmYbmcgxUCetGDJMVEYFXbw==
X-Received: by 2002:a05:600c:1ca7:b0:46f:b43a:aee1 with SMTP id 5b1f17b1804b1-477732a9d90mr72371385e9.38.1762774902061;
        Mon, 10 Nov 2025 03:41:42 -0800 (PST)
Received: from localhost (84-115-213-210.cable.dynamic.surfer.at. [84.115.213.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm247107225e9.14.2025.11.10.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:41:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 12:41:39 +0100
Message-Id: <DE4ZJT518WU8.1JNHYKMU3IBAQ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <david@ixit.cz>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Petr Hodina" <phodina@protonmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: "Joel Selvaraj" <foss@joelselvaraj.com>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH RFC 6/8] media: qcom: camss: csiphy-3ph: Use sdm845
 C-PHY configuration sequence
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>

On Sun Nov 9, 2025 at 10:39 AM CET, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> Enable the 3-phase (3PH) lane configuration introduced earlier when
> C-PHY mode is requested on the SDM845 platform. This ensures the proper
> initialization sequence is used for C-PHY operation.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c2adbde6b4e0d..03f5c4676e89a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1103,8 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
> =20
>  	switch (csiphy->camss->res->version) {
>  	case CAMSS_845:
> -		regs->lane_regs =3D &lane_regs_sdm845[0];
> -		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
> +		if (c->cphy) {
> +			regs->lane_regs =3D &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else {
> +			regs->lane_regs =3D &lane_regs_sdm845[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
> +		}

Why not add this directly in the commit adding the sequence? Otherwise
the other commit adding lane_regs_sdm845_3ph will just have an unused
variable warning until this patch.

I think it's one logical change.

Regards
Luca

>  		break;
>  	case CAMSS_2290:
>  		regs->lane_regs =3D &lane_regs_qcm2290[0];


