Return-Path: <linux-arm-msm+bounces-93526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGLCMpV8mGkdJQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:24:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7CD168D65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B968A3034672
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86822C158A;
	Fri, 20 Feb 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnqN5DP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D225B31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601041; cv=none; b=RIbuuj96azWa9o7v5CTid4A5MCQmgop/2wysv/y+LBYuK2MeiU5QF6EZ6B+7+tPvidbTOfxpBHRjUtmZ9mPSVGCOP8Q/DiozKI5g5ajJvDxJUpbN5mRmP8Ps2UKFgL1XJZPJNwyiVZHGeon9aLT5iXXCKVnSrNH1FMk1RRCjiM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601041; c=relaxed/simple;
	bh=7YOwhDlW9EkRwdiqBCLZ0ak2iNyvJHCfQOsIZkQfVH8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5aEYccIzXo9KGiCBJjDN1KwjSL9H2d6aeEsHx5BSfHHMoxgxHLiPX3xBBfOHYhsrLk3YMYJGmJ/WHCV61G6gRjxyrmVUWNmdPn/lDjginSQvYOKAtiGbSU2QlSaw98LXaf4Uw+ZRXpBM8T4hUNSo8I1FcM6pb8JJt8DT+mm9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnqN5DP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D22C116D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771601041;
	bh=7YOwhDlW9EkRwdiqBCLZ0ak2iNyvJHCfQOsIZkQfVH8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TnqN5DP9UcSBHkQ6nVer+Bsa9P+smNWHH90HOhcFGqNOhxGxAjiixdh5A6rRq0Vwi
	 i7Rksp2vyOxXi9D+ipPqjoiW3K9fK+FiNWdqqPKR4xjZNhKFz0Wksu5iNgwKeD9Dho
	 Auc8REw6S7c4ERzBjR7GIxS0/s+K/qnt4SIcKK/wj1qlZ8pwq4DxRhQ9u7z4Fa6bj6
	 SCItL+A2HJuvK9ufOxcOeCFb0L7Bb6Z21y7XyT9s0M4Py70l1Txlc4Lw8oVHMxQJP7
	 npgQhXN6bWPugRVKa6jms01gFM1hT81CaIV7B+B+BopbRVbyEV03014dapwqOe2VsW
	 XRov04Fn2+dtg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so29575231fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:24:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrvv2GH+5ebzZV3nCPTTM06qofZKg9ryuYt13KdNRyRGDe4E46T96wsJTabDAHVcdC2uNqpkDBPYLCXNQn@vger.kernel.org
X-Gm-Message-State: AOJu0YwYqTBti+34cino+G7xTWGoOhaqDlwV7kqs+s2vdfucSG827der
	GSn1Fhw92fdI799q0oDFSzOzkQNo96EwMDIJt3EqGLXvp5jWR4gAz0MmIZ37ZniCvXQtf1k6/nV
	TXvOEBCmYeuRNR4Xw1iN1/K+yygXaehvR9REEUY9ywA==
X-Received: by 2002:a05:651c:1545:b0:382:6067:a239 with SMTP id
 38308e7fff4ca-389a5dd9ac3mr290021fa.30.1771601039935; Fri, 20 Feb 2026
 07:23:59 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:23:58 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Feb 2026 07:23:58 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-3-1ad79caa1efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
 <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-3-1ad79caa1efa@linaro.org>
Date: Fri, 20 Feb 2026 07:23:58 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeQ86z0CM93DcZe-28gGRDaKV60rYDt5=xOXRW7EHnM=w@mail.gmail.com>
X-Gm-Features: AaiRm51CvXlxpvRQ8u6gG-xE4xcTEnmGYEsTGXJEfvQXF8ACXrJQJ5VFzMxdldw
Message-ID: <CAMRc=MeQ86z0CM93DcZe-28gGRDaKV60rYDt5=xOXRW7EHnM=w@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93526-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F7CD168D65
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 16:04:42 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> The driver is pretty generic and would fit for either
> PCI Slots or endpoints connected to PCI ports, so rename
> the driver and module as pci-pwrctrl-generic.
>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

